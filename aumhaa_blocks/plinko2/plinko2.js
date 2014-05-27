autowatch = 1;

outlets = 1;
inlets = 1;

var script = this;


var DEBUG = false;
var SHOW_STORAGE = false;
var FORCELOAD = false;

var bgcolors = {'OFF': [0, 0, 0, 1], 'WHITE':[1, 1, 1, 1], 'YELLOW':[1, 1, 0, 1], 'CYAN':[0, 1, 1, 1], 
				'MAGENTA':[1, 0, 1, 1], 'RED':[1, 0, 0, 1], 'GREEN':[0, 1, 0, 1], 'BLUE':[0, 0, 1, 1],
				'INVISIBLE':[1, 1, 1, 0]};


function NodeComponent(name, num, poly)
{
	var self = this;
	this._name = name;
	this._num = num+1;
	this._poly = poly;
	this._x = num%16;
	this._y = Math.floor(num/16);
	this._edit_plane = 7;
	this._edit_range = [7, 7];
	this._status;
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
			plinko2.setstoredvalue('poly.'+(self._num)+'::'+parameter, preset, self[parameter]);
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
			plinko2.setstoredvalue('poly.'+(self._num)+'::'+parameter, preset, self[parameter]);
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
			plinko2.setstoredvalue('poly.'+(self._num)+'::'+parameter, preset, self[parameter]);
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
			plinko2.setstoredvalue('poly.'+(num)+'::'+parameter, preset, self[parameter]);
		}
	}
	this.toggle_direction_single = function(dir, num)
	{
		num = num||self._edit_plane;
		self.direction[num] = self.direction[num] ^= (1 << dir);
		self.obj.direction.setvalueof(self.direction);
		plinko2.setstoredvalue('poly.'+(self._num)+'::direction', preset, self.direction);
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
		plinko2.setstoredvalue('poly.'+(self._num)+'::direction', preset, self.direction);
	}
	this.toggle_direction_fill = function(dir, num)
	{
		num = num||self._edit_plane;
		var bit = self.direction[num]&(1<<dir);
		var i=num;do{
			self.direction[i] |= 1 << dir;
		}while(i--);
		self.obj.direction.setvalueof(self.direction);
		plinko2.setstoredvalue('poly.'+(self._num)+'::direction', preset, self.direction);
	}
	this.toggle_start = function()
	{
		debug('name', self._name, 'start:', self.start);
		self.start = Math.abs(self.start-1);
		debug('and start:', self.start);
		self.obj.start.setvalueof(self.start);
		plinko2.setstoredvalue('poly.'+(self._num)+'::start', preset, self.start);
	}
	this.change_plane = function(plane)
	{
		self._edit_plane = Math.max(Math.min(8, plane), 0);
	}
	this.update = function()
	{
		for(var item in Objs)
		{
			//debug('update:', self._name, item);
			self[item] = self.obj[item].getvalueof();
		}
	}
}

function Grid(name, call, width, height)
{
	var self = this;
	this._name = name;
	this.width = function(){return width;}
	this.height = function(){return height;}
	this.button = [];
	this.controls = [];
	for(var x=0;x<width;x++)
	{
		this.button[x] = [];
		for(var y=0;y<height;y++)
		{
			this.button[x][y] = new Button(name + '_Cell_'+x+'_'+y, call, x, y, this);
			this.controls.unshift(this.button[x][y]);
		}
	}
	this.send = function(val)
	{
		outlet(0, call, 'all', val);
		viewer_matrix.message('clear');
		for(var i in self.controls)
		{
			self.controls[i]._value = val;
			self.controls[i]._mask = val;
		}
		
	}
	this.mask = function(val)
	{
		outlet(0, call, 'mask', 'all', val);
		viewer_matrix.message('clear');
		for(var i in self.button)
		{
			self.button[i]._mask = val;
		}
	}

}

function Button(name, call, x, y, parent)
{
	var self = this;
	this._name = name;
	this._parent = parent;
	this._value = 0;
	this._mask = 0;
	this._x = x;
	this._y = y;
	this._num = x + (y*16) + 1;
	this.pressed = false;
	this.send = function(val, force)
	{
		if(force||(val!=self._val)||(val!=self._mask))
		{
			outlet(0, call, 'value', self._x, self._y, val);
			viewer_matrix.message(self._x, self._y, val);
			self._mask = val;
			self._value = val;
		}
	}
	this.mask = function(val, force)
	{
		if(force||(val != self._mask))
		{
			outlet(0, call, 'mask', self._x, self._y, val);
			var v = val==-1 ? self._value : val;
			viewer_matrix.message(self._x, self._y, v);
			self._mask = val;
		}
	}	

}

function Keys(name, call, width)
{
	var self = this;
	this._name = name;
	this.width = function(){return width;}
	this.button = [];
	for(var x=0;x<width;x++)
	{
		this.button[x] = new Key(name + '_Cell_'+x, call,  x, this);
	}
	this.send = function(val)
	{
		outlet(0, call, 'all', val);
		for(var i in self.button)
		{
			self.button[i]._value = val;
			self.button[i]._mask = val;
		}
	}
	this.mask = function(val)
	{
		outlet(0, call, 'mask', 'all', val);
		for(var i in self.button)
		{
			self.button[i]._mask = val;
		}
	}

}

function Key(name, call, x, parent)
{
	var self = this;
	this._name = name;
	this._parent = parent;
	this._value = 0;
	this._mask = 0;
	this._x = x;
	this._num = x;
	this.pressed = false;
	this.send = function(val, force)
	{
		if(force||(val!=self._val)||(val!=self._mask))
		{
			outlet(0, call, 'value', self._x, val);
			self._mask = val;
			self._value = val;
		}
	}
	this.mask = function(val)
	{
		if(force||(val != self._mask))
		{
			outlet(0, 'key', 'mask', self._x, val);
			self._mask = val;
		}
	}	

}

function Display()
{
	var self = this;
	this.panel = [];
	this.dial = [];
	this.button = [];
	this._name = [];
	this._value = [];
	this.layer = 'Main';

	this.layers={	'Main':     {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[6, 6, 6, 6, 6, 6, 6, 6, 30]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'panel': 	{'bgcolor':[bgcolors.YELLOW, bgcolors.OFF, bgcolors.BLUE, bgcolors.OFF, bgcolors.RED, bgcolors.OFF, bgcolors.GREEN, bgcolors.OFF, bgcolors.WHITE],
												'bordercolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE, bgcolors.INIVISIBLE],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Voices':   {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'panel': 	{'bgcolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bordercolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[0, 0, 0, 0, 0, 0, 0, 0, 0],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Storage':  {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'panel': 	{'bgcolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bordercolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[0, 0, 0, 0, 0, 0, 0, 0, 0],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								},
					'Routing':  {	'_name': 	{'set': ['Mute', '', 'Voices', '', 'Storage', '', 'Routing', '', '?'],
												'fontsize':[9, 9, 9, 9, 9, 9, 9, 9, 40]
												},
									'_value': 	{'set': ['', '', '', '', '', '', '', '']
												},
									'panel': 	{'bgcolor':[bgcolors.WHITE, bgcolors.YELLOW, bgcolors.CYAN, bgcolors.MAGENTA, bgcolors.RED, bgcolors.GREEN, bgcolors.BLUE, bgcolors.OFF, bgcolors.WHITE],
												'bordercolor':[bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF, bgcolors.OFF]
												},
									'dial':     {'needlecolor':[0, 0, 0, 0, 0, 0, 0, 0, 0],
												'int':[0, 0, 0, 0, 0, 0, 0, 0, 0]
												}
								}
					};

	for(var i=0;i<9;i++)
	{
		this.panel[i] = patcher.getnamed('panel['+i+']');
		this.dial[i] = patcher.getnamed('dial['+i+']');
		this.button[i] = patcher.getnamed('button['+i+']');
		this._name[i] = patcher.getnamed('name['+i+']');
		this._value[i] = patcher.getnamed('value['+i+']');
	}
	this._update = function()
	{
		for(var i=0;i<9;i++)
		{
			for(var obj in this.layers[this.layer])
			{
				//post('obj', obj, '\n');
				var object = this.layers[this.layer][obj];
				for(var prop in object)
				{
					this[obj][i].message(prop, object[prop][i]);
				}
			}
		}	
	}
	this._update();
}

var unique = jsarguments[1];
var Alive=0;
var node = [];
var pressed = -1;
var colors = {NODE_SELECTED:1, NODE_START: 16, NODE_ON_WH: 3, NODE_ON: 6, NODE_WH: 7, NODE_NOTE: 2, 
				DIRECTION_OFF:3, DIRECTION_ON:7, WORMHOLE_START:1, WORMHOLE_END:7,
	 			PARTICLE_OFF:1, PARTICLE_ON:5, VOICE_FADER:1, NOTE_FADER:2, PLANE_FADER:3
				};
var coordMath = [-17, -16, -15, -1, 1, 15, 16, 17];
var activeNodes = [];
var activeParticles = [];
var displayedParticles = [];
var shifted = false;
var alted = false;
var trigger_mode = false;
var preset = 1;
var slotlist = [];
var channel = 0;

var speed = [0, 0, 0, 0];
var matrix = new Grid('Grid', 'grid', 16, 16);
var keys = new Keys('Keys', 'key', 8);
var display;
var node;

//this array contains the scripting names of objects in the top level patcher.	To include an new object to be addressed 
//in this script, it's only necessary to add its name to this array.  It can then be addressed as a direct variable
var Vars = ['plinko2', 'storage_defer', 'timingmultiplier', 'program_window', 'restart', 'length', 'midi', 'viewer'];
var viewer_matrix;

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
	switch(inlet)
	{
		case 0:
			var args = arrayfromargs(messagename, arguments);
			debug('anything:', args);
			break;
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
		viewer_matrix = viewer.subpatcher().getnamed('matrix');
		node = [];
		for(var i = 0; i < 256; i++)
		{
			var polynum = i;
			node[i] = new NodeComponent('Node_'+i, i, this.patcher.getnamed('poly').subpatcher(polynum));
		}
		for(var i in script)
		{
			if((/^_/).test(i))
			{
				script[i.replace('_', "")] = script[i];
			}
		}
		display = new Display();
		Alive = 1;
		clear_surface();
		plinko2.message('recall', 1);
		plinko2.message('getslotlist');
		//outlet(0, 'set_mod_color', modColor);
		//outlet(0, 'set_color_map', 'Monochrome', 127, 127, 127, 15, 22, 29, 36, 43);
		outlet(0, 'set_report_offset', 1);
		if(SHOW_STORAGE)
		{
			this.patcher.getnamed('plinko2').message('clientwindow');
			this.patcher.getnamed('plinko2').message('storagewindow');
		}
		post("plinko2 initialized.\n");
		lock();
		shift(0);
		alt(0);
		outlet(0, 'set_legacy', 1);
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
	//outlet(0, 'push_grid', 'all', 0);
	matrix.send(0);
}

//should be called on freebang, currently not implemented
function _dissolve()
{
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			script[i.replace('_', "")] = script['anything'];
		}
	}
	Alive=0;
	post('Plinko dissolved.\n');	   
}

function _push_grid(x, y, val)
{
	_grid(x, y, val);
}

function _grid(x, y, val)
{
	//var args = arrayfromargs(arguments);
	matrix.button[x][y].pressed = val>0;
	debug('push_grid', x, y, val);
	if((pressed<0)&&(val))								//new press, nothing held
	{
		if(trigger_mode)								//fire a particle
		{
			node[x+(y*16)].trigger();
		}
		else if(keys.button[6].pressed)  				//open the corresponding poly
		{
			patcher.getnamed('poly').message('open', x+(y*16)+1);
		}
		else if(keys.button[5].pressed)
		{
			debug('recalling', x+(y*16)+1);
			if(slotlist.indexOf(x+(y*16)+1)==-1)
			{
				debug('copying:', preset, x+(y*16)+1);
				plinko2.message('copy', preset, x+(y*16)+1);
			}
			plinko2.message('getslotlist');
			plinko2.message('recall', x+(y*16)+1);
			display_presets();
		}
		else											//display node
		{
			pressed = x+(y*16);
			display_node(pressed);
		}
	}
	else if((pressed>-1)&&(val))						//new press, something held
	{
		if(keys.button[1].pressed)						//create wormhole
		{
			var func = alted ? 'set_single_fill' : shifted ? 'set_single' : 'set_single_replace';
			var wh = node[pressed].get_single('wormhole')===(x+(y*16)+1) ? 0 : (x+(y*16)+1);
			node[pressed][func]('wormhole', wh);
			display_wormhole();
		}
		else
		{
			var num = (x + (y*16));
			var dir = coordMath.indexOf(num - pressed);
			var x_offset = (x<4)*4;
			if(dir > -1)									//press is surrounding node
			{
				var func = alted ? 'toggle_direction_fill' : shifted ? 'toggle_direction_single' : 'toggle_direction_replace';
				node[pressed][func](dir);
				display_node(pressed);
			}
			else if(((!x_offset)&&(x>4))||((x_offset)&&(x<3)))	//press is in fader strip
			{
				var x = x%5;
				var func = alted ? 'set_single_fill' : shifted ? 'set_single' : 'set_single_replace';
				switch(x)
				{
					case 0:
						node[pressed][func]('voice', Math.abs(y-7));
						break;
					case 1:
						node[pressed][func]('note', Math.abs(y-7));
						break;
					case 2:
						node[pressed].change_plane(Math.abs(y-7));
						break;
				}
				display_node(pressed);
			}
		}
	}
	else if((pressed==(x+(y*16)))&&(!val))				//held is released
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
	display_keys();
}

function _alt(val)
{
	alted = (val>0);
}

function _key(num, val)
{
	debug('key', num, val);
	keys.button[num].pressed = val>0;
	if((val)&&(shifted)&&(num>3))
	{
		messnamed(unique+'key', num, val);	
	}
	else
	{
		switch(num)
		{
			case 0:
				if(val)
				{
					if(pressed>-1)
					{
						node[pressed].toggle_start();
						display_node(pressed);
					}					
					else
					{
						display_gameboard();
					}
				}
				break;
			case 1:
				if((val)&&(pressed>-1)){display_wormhole();}
				break;
			case 2:
				if(pressed<0){display_gameboard();}
				break;
			case 4:
				if(val){toggle_viewer();}
				break;
			case 5:
				if(val){plinko2.message('getslotlist');}
				break;
			case 7:
				if(val){toggle_trigger_mode();}
				break;
		}
	}
	if(!val)
	{
		if(pressed>-1)
		{
			display_node(pressed);
		}
		else
		{
			display_gameboard();
		}
	}
}

function _channel(num)
{
	debug('channel', num);
	outlet(0, 'channel', 'value', num);
}

function display_node(num)
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
	matrix.button[x][y].send(node[num].start > 0 ? colors.NODE_START : colors.NODE_SELECTED, true);

	var i=7;do{
		var adj = num+coordMath[i];
		if(inRange(adj, 0, 256))
		{
			//debug('dirs:', dirs);
			matrix.button[adj%16][Math.floor(adj/16)].send(dirs[i] ? colors.DIRECTION_ON : colors.DIRECTION_OFF, true);
		}
		matrix.button[x_offset][i].mask(voice[i], true);
		matrix.button[x_offset+1][i].mask(note[i], true);		
		matrix.button[x_offset+2][i].mask(plane[i], true);
		
	}while(i--);
	/*outlet(0, 'push_grid', 'mask_batch_column', x_offset, packFader(node[num].get_single('voice'), colors.VOICE_FADER));
	debug(0, 'push_grid', 'mask_batch_column', x_offset, packFader(node[num].get_single('voice'), colors.VOICE_FADER))
	outlet(0, 'push_grid', 'mask_batch_column', x_offset+1, packFader(node[num].get_single('note'), colors.NOTE_FADER));
	outlet(0, 'push_grid', 'mask_batch_column', x_offset+2, packFader(node[num]._edit_plane, colors.PLANE_FADER));
	*/
}

function display_gameboard()
{
	debug('display_gameboard\n');
	clear_surface();
	for(var i in node)
	{
		var dir = Math.floor(node[i].direction.join('')>0);
		var wh = Math.floor(node[i].wormhole.join('')>0);
		if(dir||wh)
		{
			matrix.button[node[i]._x][node[i]._y].send(dir&&wh ? colors.NODE_ON_WH : dir ? colors.NODE_ON : colors.NODE_WH, true);
		}
		if(keys.button[0].pressed)
		{
			if (node[i].start>0)
			{
				matrix.button[node[i]._x][node[i]._y].send(colors.NODE_START, true);
			}
		}
		if(keys.button[2].pressed)
		{
			if (Math.floor(node[i].voice.join('')>0))
			{
				matrix.button[node[i]._x][node[i]._y].send(colors.NODE_NOTE, true);
			}
		}
	}
	for(var i in displayedParticles)
	{
		var this_node = displayedParticles[i];
		matrix.button[this_node._x][this_node._y].mask(this_node._status ? colors.PARTICLE_ON : colors.PARTICLE_OFF);
	}
	pressed = -1;
}

function display_keys()
{
	keys.button[0].send(6);
	keys.button[1].send(7);	
	keys.button[2].send(2);
	keys.button[3].send(5);

	if(shifted)
	{
		var i=3;do{
			keys.button[i+4].send(speed[i]);
		}while(i--);	
	}
	else
	{
		keys.button[4].send(1);
		keys.button[5].send(0);
		keys.button[6].send(3);
		keys.button[7].send(trigger_mode ? 5 : 4);
	}
}

function display_wormhole()
{
	if(pressed>-1)
	{
		clear_surface();
		var x = node[pressed]._x;
		var y = node[pressed]._y;
		var current = node[pressed].get_single('wormhole');
		matrix.button[x][y].send(colors.WORMHOLE_START);
		if(current>0)
		{
			matrix.button[(current-1)%16][Math.floor((current-1)/16)].send(colors.WORMHOLE_END);
		}
	}	
}

function display_presets()
{
	debug('display_presets');
	clear_surface();
	for(var i in matrix.controls)
	{
		var button = matrix.controls[i];
		//debug('button:', button._num, button._name, slotlist.indexOf(button._num)==-1, button._num == preset);
		button.send(slotlist.indexOf(button._num)==-1 ? 0 : button._num == preset ? 6 : 4, true);
	}
}

function _speed(key, num, val)
{
	debug('speed', num, val);
	speed[num-4] = val;
	display_keys();
}

function _pulse()
{
	if(pressed<0)
	{
		for(var i in displayedParticles)	
		{	
			var this_node = displayedParticles[i];
			matrix.button[this_node._x][this_node._y].mask(-1);
		}
		displayedParticles = [];
		for(var i in activeParticles)
		{
			var this_node = activeParticles[i];
			displayedParticles.unshift(this_node);
			matrix.button[this_node._x][this_node._y].mask(this_node._status ? colors.PARTICLE_ON : colors.PARTICLE_OFF);
		}
	}
	activeParticles = [];
}

function _particle(num, voice, note, velocity, duration)
{
	//debug('display particle:', num, voice, note, velocity, duration);
	var this_node = node[num-1];
	this_node._status = voice>0;
	activeParticles.unshift(this_node);
}

function toggle_viewer()
{
	if(alted)
	{
		unlock();
	}
	else
	{
		if(viewer.subpatcher().wind.visible)
		{
			viewer.wclose();
		}
		else
		{
			viewer.front();
		}
	}
}

function toggle_trigger_mode()
{
	trigger_mode = !trigger_mode;
	display_keys();
}

function _storage()
{
	var args = arrayfromargs(arguments);
	debug('recall in:', args);
	switch(args[0])
	{
		case 'recall':
			preset = args[1];
			for(var i in node)
			{
				node[i].update();
			}
			break;
		case 'slotlist':
			slotlist = args.slice();
			if(slotlist.length==1)
			{
				plinko2.message('store', 1);
			}
			if(keys.button[5].pressed){display_presets();}
			break;
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

function unlock()
{
	viewer.window('size', 100, 100, 520, 520);
	viewer.window('flags', 'minimize');
	viewer.window('flags', 'zoom');
	viewer.window('flags', 'close');
	viewer.window('flags', 'grow');
	viewer.window('flags', 'title');
	viewer.window('flags', 'nofloat');
	viewer.window('exec');
}

function lock()
{
	viewer.window('size', 100, 100, 520, 520);
	viewer.window('flags', 'nominimize');
	viewer.window('flags', 'nozoom');
	viewer.window('flags', 'noclose');
	viewer.window('flags', 'nogrow');
	viewer.window('flags', 'notitle');
	viewer.window('flags', 'float');
	viewer.window('exec');
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

//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing

function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();



	