autowatch = 1;

outlets = 1;
inlets = 1;

var script = this;


var DEBUG = true;
var SHOW_STORAGE = false;
var FORCELOAD = false;

function NodeComponent(name, num, poly)
{
	var self = this;
	this._name = name;
	this._number = num;
	this._poly = poly;
	this._x = num%16;
	this._y = Math.floor(num/16);
	this._edit_plane = 7;
	this._edit_range = [7, 7];
	this._has_particle = 0;
	this.obj = {};
	for(var item in Objs)
	{
		if(Objs[item].Type === 'list')
		{
			this[item] = [0, 0, 0, 0, 0, 0, 0, 0];
			this.obj[item] = poly.getnamed(item);
		}
		else if(Objs[item].Type === 'int')
		{
			this[item] = 0;
			this.obj[item] = poly.getnamed(item);
		}
	}
	this.trigger = function(){patcher.getnamed('poly').message('target', num+1);patcher.getnamed('poly').message(7);}
	this.get = function(parameter)
	{
		if(parameter in self.obj)
		{
			//self[parameter] = self.obj[parameter].getvalueof();
			return self[parameter];
		}
	}
	this.set = function(parameter, val)
	{
		if(parameter in self.obj)
		{
			self[parameter] = val;
			self.obj[parameter].setvalueof(self[parameter]);
		}
	}
	this.get_single = function(parameter, num)
	{
		if(parameter in self.obj)
		{
			num = num||self._edit_plane;
			return self[parameter][num];
		}
	}
	this.set_single = function(parameter, val, num)
	{
		if(parameter in self.obj)
		{
			num = num||self._edit_plane;
			self[parameter][i] = val;
			self.obj[parameter].setvalueof(self[parameter]);
		}
	}
	this.set_single_replace = function(parameter, val, num)
	{
		debug('replace', parameter, num, val);
		if(parameter in self.obj)
		{
			num = num||self._edit_plane;
			var last = self[parameter][num];
			var i=num;do{
				if(self[parameter][i]==last){self[parameter][i] = val;}
				else{i=0;}
			}while(i--);
			self.obj[parameter].setvalueof(self[parameter]);
		}
	}
	this.set_single_fill = function(parameter, val, num)
	{
		if(parameter in self.obj)
		{
			num = num||self._edit_plane;
			var i=num;do{
				self[parameter][i] = val;
			}while(i--);
			self.obj[parameter].setvalueof(self[parameter]);
		}
	}
	this.toggle_direction_single = function(dir, num)
	{
		num = num||self._edit_plane;
		self.direction[num] = self.direction[num] ^= (1 << dir);
		self.obj.direction.setvalueof(self.direction);
	}
	this.toggle_direction_replace = function(dir, num)
	{
		num = num||self._edit_plane;
		var last_bit = self.direction[num]&(1<<dir);
		var i=num;do{
			if(last_bit==(self.direction[i]&(1<<dir))){self.direction[i] ^= 1 << dir;}
			else{i=0;}
		}while(i--);
		self.obj.direction.setvalueof(self.direction);
	}
	this.toggle_direction_fill = function(dir, num)
	{
		num = num||self._edit_plane;
		var bit = self.direction[num]&(1<<dir);
		var i=num;do{
			self.direction[i] |= 1 << dir;
		}while(i--);
		self.obj.direction.setvalueof(self.direction);
	}
	this.set_particle = function(val)
	{
		self._has_particle = val;
	}
	this.toggle_start = function()
	{
		debug('name', self._name, 'start:', self.start);
		self.start = Math.abs(self.start-1);
		debug('and start:', self.start);
		self.obj.start.setvalueof(self.start);
		debug('finally:', self.obj.start.getvalueof());
	}
}

NodeComponent.prototype.change_plane = function(plane)
{
	this._edit_plane = Math.max(Math.min(8, plane), 0);
}

var unique = jsarguments[1];
var Alive=0;
var node = [];
var pressed = -1;
var colors = {NODE_SELECTED:1, NODE_START: 16, NODE_ON_WH: 2, NODE_ON: 6, NODE_ON_WH: 5, DIRECTION_OFF:3, DIRECTION_ON:7, PARTICLE_OFF:5,
				VOICE_FADER:1, NOTE_FADER:2, PLANE_FADER:3};
var coordMath = [-17, -16, -15, -1, 1, 15, 16, 17];
var activeNodes = [];
var activeParticles = [];
var displayedParticles = [];
var shifted = false;
var alted = false;
var speed = [0, 0, 0, 0];

//this array contains the scripting names of objects in the top level patcher.	To include an new object to be addressed 
//in this script, it's only necessary to add its name to this array.  It can then be addressed as a direct variable
var Vars = ['plinko2', 'storage_defer', 'timingmultiplier', 'program_window', 'restart', 'length', 'midi'];

//this array contains the scripting names of pattr-linked objects in each of the polys.	To include an new object to be addressed 
//in the poly, it's only necessary to add its name to this array.  It can then be addressed as part[poly number].obj[its scripting name]
var Objs = {'voice':{'Name':'voice', 'Type':'list', 'pattr':'voice'}, 
			'note':{'Name':'note', 'Type':'list', 'pattr':'note'},
			'velocity':{'Name':'velocity', 'Type':'list', 'pattr':'velocity'},
			'duration':{'Name':'duration', 'Type':'list', 'pattr':'duration'},
			'wormhole':{'Name':'wormhole', 'Type':'list', 'pattr':'wormhole'},
			'direction':{'Name':'direction', 'Type':'list', 'pattr':'direction'},
			'start':{'Name':'start', 'Type':'int', 'pattr':'start'},
			};

function debug()
{
	if(DEBUG)
	{
		var args = arrayfromargs(arguments);
		for(var i in args)
		{
			if(args[i] instanceof Array)
			{
				args[i] = args[i].join(' ');
			}
		}
		post('debug->', args, '\n');
	}
}

function anything()
{
	var args = arrayfromargs(messagename, arguments);
	debug('anything:', args);
}

function setup_translations()
{
	/*Here we set up some translation assignments and send them to the Python ModClient.
	Each translation add_translation assignment has a name, a target, a group, and possibly some arguments.
	Translations can be enabled individually using their name/target combinations, or an entire group can be enabled en masse.
	There are not currently provisions to dynamically change translations or group assignments once they are made.*/

	//Base stuff:
	for(var i = 0;i < 16;i++)
	{
		outlet(0, 'add_translation', 'pads_'+i, 'base_grid', 'base_pads', i%8, Math.floor(i/8));
		outlet(0, 'add_translation', 'keys_'+i, 'base_grid', 'base_keys', i%8, Math.floor(i/8));
		outlet(0, 'add_translation', 'keys2_'+i, 'base_grid', 'base_keys2', i%8, Math.floor(i/8)+2);
	}
	outlet(0, 'add_translation', 'pads_batch', 'base_grid', 'base_pads', 0);
	outlet(0, 'add_translation', 'keys_batch', 'base_grid', 'base_keys', 0);
	outlet(0, 'add_translation', 'keys2_batch', 'base_grid', 'base_keys2', 2); 
	outlet(0, 'enable_translation_group', 'base_keys', 0);

	for(var i=0;i<8;i++)
	{
		outlet(0, 'add_translation', 'buttons_'+i, 'base_grid', 'base_buttons', i, 2);
		outlet(0, 'add_translation', 'extras_'+i, 'base_grid', 'base_extras', i, 3);
	}
	outlet(0, 'add_translation', 'buttons_batch', 'base_grid', 'base_buttons', 2);
	outlet(0, 'add_translation', 'extras_batch', 'base_grid', 'base_extras', 3);
	outlet(0, 'enable_translation_group', 'base_buttons', 0);
	outlet(0, 'enable_translation_group', 'base_extras',  0);

	//Push stuff:
	for(var i = 0;i < 16;i++)
	{
		outlet(0, 'add_translation', 'pads_'+i, 'push_grid', 'push_pads', i%8, Math.floor(i/8));
		outlet(0, 'add_translation', 'keys_'+i, 'push_grid', 'push_keys', i%8, Math.floor(i/8)+2);
		outlet(0, 'add_translation', 'keys2_'+i, 'push_grid', 'push_keys2', i%8, Math.floor(i/8)+4);
	}
	for(var i=0;i<8;i++)
	{
		outlet(0, 'add_translation', 'buttons_'+i, 'push_grid', 'push_buttons', i, 6);
		outlet(0, 'add_translation', 'extras_'+i, 'push_grid', 'push_extras', i, 7);
	}
}

function alive(val)
{
	initialize(val);
}

function init(val)
{
	initialize(1);
}

//called when mod.js is finished loading for the first time
function initialize(val)
{
	if(val>0)
	{
		debug('plinko2 init');
		//setup_translations();
		for(var i in Vars)
		{
			script[Vars[i]] = this.patcher.getnamed(Vars[i]);
		}
		node = [];
		for(var i = 0; i < 256; i++)
		{
			var polynum = i;
			node[i] = new NodeComponent('Node_'+i, i, this.patcher.getnamed('poly').subpatcher(polynum));
			for(var obj in Objs)
			{
				if(Objs[obj].Type==='list')
				{
					node[i].set(obj, [0, 0, 0, 0, 0, 0, 0, 0]);
				}
			}
		}
		keys = [];
		for(var i = 0; i < 8; i++)
		{
			keys[i] = {'pressed':false};
		}
		for(var i in script)
		{
			if((/^_/).test(i))
			{
				script[i.replace('_', "")] = script[i];
			}
		}
		Alive = 1;
		clear_surface();
		//storage.message('recall', 1);
		//outlet(0, 'set_mod_color', modColor);
		//outlet(0, 'set_color_map', 'Monochrome', 127, 127, 127, 15, 22, 29, 36, 43);
		outlet(0, 'set_report_offset', 1);
		if(SHOW_STORAGE)
		{
			this.patcher.getnamed('plinko2').message('clientwindow');
			this.patcher.getnamed('plinko2').message('storagewindow');
		}
		post("plinko2 initialized.\n");
	}
	else
	{
		_dissolve();
	}
}

//dummy callback to compensate for api bug in Max6
function callback()
{
	if(DEBUG){post('callback', arguments, '\n');}
}

//called by init to initialize state of gui objects
function _clear_surface()
{
	outlet(0, 'push_grid', 'all', 0);
}

//should be called on freebang, currently not implemented
function _dissolve()
{
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			script[i.replace('_', "")] = script['anyting'];
		}
	}
	Alive=0;
	post('Hex dissolved.\n');	   
}

function _push_grid(x, y, val)
{
	//var args = arrayfromargs(arguments);
	debug('push_grid', x, y, val);
	if((pressed<0)&&(val))
	{
		if(keys[0].pressed)
		{
			node[x+(y*16)].trigger();
		}
		else if(keys[3].pressed)
		{
			patcher.getnamed('poly').message('open', x+(y*16)+1);
		}
		else
		{
			pressed = x+(y*16);
			_display_node(pressed);
		}
	}
	else if((pressed>-1)&&(val))
	{
		//debug('num', ((x + (y*16)) - pressed));
		var num = (x + (y*16));
		var dir = coordMath.indexOf(num - pressed);
		var x_offset = (x<4)*4;
		if(dir > -1)
		{
			if(alted){node[pressed].toggle_direction_fill(dir);}
			else if(shifted){node[pressed].toggle_direction_single(dir);}
			else{node[pressed].toggle_direction_replace(dir);}
			display_node(pressed);
		}
		else if(((!x_offset)&&(x>4))||((x_offset)&&(x<3)))
		{
			var x = x%5;
			switch(x)
			{
				case 0:
					if(alted){node[pressed].set_single_fill('voice', Math.abs(y-7));}
					else if(shifted){node[pressed].set_single('voice', Math.abs(y-7));}
					else{node[pressed].set_single_fill('voice', Math.abs(y-7));}
					break;
				case 1:
					if(alted){node[pressed].set_single_fill('note', Math.abs(y-7));}
					else if(shifted){node[pressed].set_single('note', Math.abs(y-7));}
					else{node[pressed].set_single_replace('note', Math.abs(y-7));}
					break;
				case 2:
					node[pressed].change_plane(Math.abs(y-7));
					break;
			}
			display_node(pressed);
		}
	}
	else if((pressed==(x+(y*16)))&&(!val))
	{
		pressed = -1;
		display_gameboard();
	}
	else
	{
	}
}

function _shift(val)
{
	shifted = (val>0);
}

function _alt(val)
{
	alted = (val>0);
}

function _key(num, val)
{
	debug('key', num, val);
	keys[num].pressed = val>0;
	
	if(val)
	{
		if((shifted)&&(num>3))
		{
			messnamed(unique+'key', num, val);	
		}
		else
		{
			switch(num)
			{
				case 0:
					if((pressed>-1)&&(val))
					{
						node[pressed].toggle_start();
						display_node(pressed);
					}
					break;
			}
		}
	}
}

function _display_node(num)
{
	debug('display_node', num);
	var x = node[num]._x;
	var y = node[num]._y;
	var dirs = dectobin(node[num].get_single('direction'));
	var voice = packDial(node[num].get_single('voice'), colors.VOICE_FADER);
	var note = packDial(node[num].get_single('note'), colors.NOTE_FADER);
	var plane = packFader(node[num]._edit_plane, colors.PLANE_FADER);
	var x_offset = (x<4)*5;
	clear_surface();
	outlet(0, 'push_grid', 'value', x, y, node[num].start > 0 ? colors.NODE_START : colors.NODE_SELECTED);
	var i=7;do{
		var adj = num+coordMath[i];
		if(inRange(adj, 0, 256))
		{
			//debug('dirs:', dirs);
			outlet(0, 'push_grid', 'value', adj%16, Math.floor(adj/16), (dirs[i] ? colors.DIRECTION_ON : colors.DIRECTION_OFF));
		}
		outlet(0, 'push_grid', 'mask', x_offset, i, voice[i]);
		outlet(0, 'push_grid', 'mask', x_offset+1, i, note[i]);
		outlet(0, 'push_grid', 'mask', x_offset+2, i, plane[i]);
		
	}while(i--);
	/*outlet(0, 'push_grid', 'mask_batch_column', x_offset, packFader(node[num].get_single('voice'), colors.VOICE_FADER));
	debug(0, 'push_grid', 'mask_batch_column', x_offset, packFader(node[num].get_single('voice'), colors.VOICE_FADER))
	outlet(0, 'push_grid', 'mask_batch_column', x_offset+1, packFader(node[num].get_single('note'), colors.NOTE_FADER));
	outlet(0, 'push_grid', 'mask_batch_column', x_offset+2, packFader(node[num]._edit_plane, colors.PLANE_FADER));
	*/
}

function _display_gameboard()
{
	debug('display_gameboard\n');
	clear_surface();
	for(var i in node)
	{
		var dir = Math.floor(node[i].direction.join('')>0);
		var wh = Math.floor(node[i].wormhole.join('')>0);
		if(dir||wh)
		{
			outlet(0, 'push_grid', 'value', node[i]._x, node[i]._y, (dir&&wh ? colors.NODE_ON_WH : dir ? colors.NODE_ON : colors.NODE_WH));
		}
	}
	for(var i in displayedParticles)
	{
		var num = displayedParticles[i]-1;
		outlet(0, 'push_grid', 'mask', node[num]._x, node[num]._y, colors.PARTICLE_OFF);
	}
}

function _display_speed()
{
}

function _speed(key, num, val)
{
	debug('speed', num, val);
	speed[num] = val;
	if(shifted)
	{
		outlet(0, 'key', 'value', num, val);
	}
}

function _pulse()
{
	displayedParticles = [];
	if(pressed<0)
	{
		//if(activeParticles.length>0){debug('pulse', activeParticles);}
		outlet(0, 'push_grid', 'mask_all', -1);
		for(var i in activeParticles)
		{
			var num = activeParticles[i]-1;
			displayedParticles.unshift(num);
			outlet(0, 'push_grid', 'mask', node[num]._x, node[num]._y, colors.PARTICLE_OFF);
		}
	}
	activeParticles = [];
}

function _particle(num, voice, note, velocity, duration)
{
	//debug('display particle:', num, voice, note, velocity, duration);
	activeParticles.unshift(num);
}

function _part_off(num)
{
	debug('particle off:', num);
	if(pressed<0)
	{
		outlet(0, 'push_grid', 'value', (num%16)-1, Math.floor(num/16), 0);
	}
}

function dectobin(arg)
{
	var dec = [];
	for(var i=0;i<8;i++)
	{
		dec.push(arg&1);
		arg = arg>>>1;
	}
	return dec;
}

function inRange(val, low, high)
{
	return ((val>=low)&&(val<high));
}

function packFader(val, color)
{
	var ret = [];
	var i=7;do{
		ret[Math.abs(i-7)]=(i<=val)*color;
	}while(i--);
	return ret;
}

function packDial(val, color)
{
	var ret = [];
	var i=7;do{
		ret[Math.abs(i-7)]=(i==val)*color;
	}while(i--);
	return ret;
}


//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing
function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();