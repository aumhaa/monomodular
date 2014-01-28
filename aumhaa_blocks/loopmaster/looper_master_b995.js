autowatch = 1;

inlets = 2;
outlets = 2;

var DEBUG = 0;
var FORCELOAD = false;

//var MONOPEDAL=new RegExp(/(MonOhm)/);
var AUMTROLL = new RegExp(/(AumTroll)/);
var MONOHM = new RegExp(/(MonOhm)/);
var MONOPEDAL = new RegExp(/(MonoPedal)/);
var wiki_page_addy = 'http://www.aumhaa.com/wiki/index.php?title=LoopMaster';
////this section is necessary for basic operations
undefined = (function(){var u; return u;})();	 ///required to return an actual 'undefined', in case its variable name gets reassigned
var elements=[];	///array that holds all elements(MAX API Objects) in the script
var surface;		   ///finder for the control_surface; represents the specific control_surface script
var conrols=[];		   ///an array to hold all of the controls in the script
var components=[];	  ///an array to hold all of the components in the script
var alive = 0;

var unique=jsarguments[1];

var remote_val = 0;
var invert_pedal = false;
var view;
var this_device;
var script = this;
var tasks = [];
var timer = 0;
var last = 0;
var looper = [];
var all_loops = new_all_loops();
var master = [];
var dial = [];
var displays;
var feedback = [];
var fb_sample = [0, 0, 0];
var fb_last = -1;
var POBJ = ['waveform', 'muteui', 'speedui', 'quantizemenuui', 'offsetui', 'autohideui', 'lcdui', 'remoteui',
				'muteui', 'feedbackui', 'inputui', 'inloopui', 'inertiaui', 'autoselectui', 'selectedui', 'relativeui',
				'loopui', 'clearui', 'reverseui', 'undoui', 'overdubui', 'quantizerecordui', 'beatui', 'timer'];
var state_color={'mute':[1, 1, 1], 'recording':[1, 0, 0], 'empty':[.45, .45, .45], 'playing':[0, 1, 0], 'overdubbing':[0, 0, 1], 'awaiting_record':[.5, .0, .3], 'muted':[0, 0, 0]};
var Colors={'mute':1, 'recording':5, 'empty':2, 'playing':6, 'overdubbing':3, 'awaiting_record':4, 'muted':1};
var sync_color=[[0, 0, 0], [.3, .3, .3], [.6, .6, .6], [1, 1, 1]];
var front=0;
var auto=1;
var auto_delay=5;
var x_start=0;
var y_start=0;
var x_end=0;
var y_end=0;
var lcd_view=1;
var zoomfactor=1.;
var screen_position=.05;
var num_loops = 4;
var sel_loop_number = 0;

var sender;

var pedal = [];
var leds = [];
var expression;
var hold = 0;
var connected = false;

var speed_values = [2, 1, 0, -1, -2];
var inertia_values = [0, 50, 90, 300, 600];
var circle = [[[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [3, 4], [2, 4], [1, 4], [0, 4], [0, 3], [0, 2], [0, 1]],
				[[8, 0], [9, 0], [10, 0], [11, 0], [12, 0], [12, 1], [12, 2], [12, 3], [12, 4], [11, 4], [10, 4], [9, 4], [8, 4], [8, 3], [8, 2], [8, 1]],
				[[0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [4, 9], [4, 10], [4, 11], [4, 12], [3, 12], [2, 12], [1, 12], [0, 12], [0, 11], [0, 10], [0, 9]],
				[[8, 8], [9, 8], [10, 8], [11, 8], [12, 8], [12, 9], [12, 10], [12, 11], [12, 12], [11, 12], [10, 12], [9, 12], [8, 12], [8, 11], [8, 10], [8, 9]]];
var offsets = [[0, 0], [8, 0], [0, 8], [8, 8]];
var cell_fire = [];
for(var i=0;i<16;i++)
{
	cell_fire[i] = [];
	for(var j=0;j<16;j++)
	{
		//var number = (((i>7)+0)+(((j>7)+0)*2));
		cell_fire[i][j] = [-1, (((i>7)+0)+(((j>7)+0)*2))];
		for(var l=0;l<4;l++)
		{
			for(var p=0;p<16;p++)
			{
				if((circle[l][p][0] == i)&&(circle[l][p][1] == j))
				{
					//post('match', i, j, p, l, '\n');
					cell_fire[i][j][0] = p;
				}
			}
		}
		if(((i%8)>0)&&((i%8)<4)&&((j%8)>0)&&((j%8)<4))
		{
			cell_fire[i][j][0] = 17;
		}
		else if (((i%8)>5)&&((j%8)<6))
		{
			cell_fire[i][j][0] = 18 + (i%2);
			cell_fire[i][j][2] = j;
		}
		else if ((j%8)>5)
		{
			cell_fire[i][j][0] = 20 + (j%2);
			cell_fire[i][j][2] = i;
		}
	}
}
	
function send_led(){}

function _send_led(num, val)
{
	if((typeof(val) == 'number')&&(leds[num]))
	{
		leds[num].call('send_value', val);
	}
	else if(DEBUG)
	{
		post('led exception:', val, typeof(val));
	}
}

function current_settings(looper_id, looper_number, phase, state, speed, overdub, quantize_record_enabled, quantize_record_menu, offset, mute, feedback, input, inertia, loop_end, quantize_record_relative)
{
	//post(looper_id, looper_number, phase, state, speed, overdub, quantize_record_enabled, quantize_record_menu, offset, mute, feedback, input, inertia, '\n');
	if(alive>0)
	{
		if(looper_id == master.sel_loop.uid)
		{
			master.speedui.message('set', speed);
			master.overdubui.message('set', overdub);
			master.quantizerecordui.message('set', quantize_record_enabled);
			master.quantizemenuui.message('set', quantize_record_menu);
			master.offsetui.message('set', offset);
			master.inputui.message('set', input);
			master.inertiaui.message('set', inertia);
		}
		looper_feedback(looper_id, looper_number, feedback);
		looper_state(looper_id, looper_number, state, loop_end);
		looper_speed(looper_id, looper_number, speed);
		looper_inertia(looper_id, looper_number, inertia);
		looper_quantize_menu(looper_id, looper_number, quantize_record_menu);
		looper_quantize_status(looper_id, looper_number, quantize_record_enabled);
		looper_mute(looper_id, looper_number, mute);
		looper_relative_status(looper_id, looper_number, quantize_record_relative);
	}
}

function callback(){}
	
function init()
{
	//sender = this.patcher.newdefault(0, 0, 'udpsend', 'slate.local', 8000);
	sender = this.patcher.getnamed('sender');
	clear_lcd();
	view = new LiveAPI(callback, 'live_set', 'view');
	this_device = new LiveAPI(callback, 'this_device');
	this_device.goto('canonical_parent');
	if(this_device.type=='Track')
	{
		//post('this_device = ', this_device.get('name'), '\n');
	}
	else
	{
		this_device.goto('canonical_parent');
		//post(this_device.type);
		this_device.goto('canonical_parent');
		//post(this_device.type);
		if(this_device.type=='Track')
		{
			//post('this_device = ', this_device.get('name'), '\n');
		}
	}
	surface = new LiveAPI(callback, 'control_surfaces');
	var i = this.patcher.getnamed('viewer');
	viewer = i.subpatcher();
	displays = this.patcher.getnamed('displays');	
	for(var obj in POBJ)
	{
		master[POBJ[obj]] = this.patcher.getnamed(POBJ[obj]);
	}
	master.waveform=[];
	for(var j=0;j<4;j++)
	{
		master.waveform[j] = this.patcher.getnamed('waveform'+j);
	}
	master.sel_loop = all_loops;
	create_loops();
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			script[i.replace('_', "")] = script[i];
		}
	}
	alive = 1;
	messnamed('maxlooper', 'register');
	master.timer.message('bang');
	connect();
	show_lcd();
	add_task('init_display');
}

function connect()
{
	if((connected==false)&&((timer%500) < 100))
	{
		for(var i= 0;i<6;i++)
		{
			surface.goto('control_surfaces', i);
			//post('type:', surface.type);
			if(MONOPEDAL.test(surface.type))
			{
				connected = true;
				assign_monopedal_api(i);
				break;
			}
		}
		for(var i= 0;i<6;i++)
		{
			if((MONOHM.test(surface.type))||(AUMTROLL.test(surface.type)))
			{
				connected = true;
				assign_api(i);
				break;
			}
		}
	}
}

function assign_monopedal_api(cs)
{
	///these three are necessary for the rest of functionality to work, don't change them
	//surface=new LiveAPI(this.patcher, 'control_surfaces', cs);
	post('assigning monobutton api elements....');
	surface.num=cs;
	get_instance_names();
	var hold = [0, 0, 0, 8, 4, 2, 1];
	for (var i=0;i<7;i++)
	{
		pedal[i]=element('Pedal_'+i, 'pedal', cb_new_pedals, 'controls', 'value', [['num', i], ['last', 0], ['hold', hold[i]]]);
	}
	expression=element('Pedal_7', 'expression', cb_new_expression, 'controls', 'value', [['num', 0]]);
	//pedal[10]=element('Scene_Pedal_4', 'pedal', cb_reset, 'controls', 'value', [['num', 10]]);
	script.send_led = script._send_led;
	for (var i=0;i<4;i++)
	{
		leds[i]=element('LED_'+i, 'led', dummy_callback, 'controls', 'value', [['num', i]]);
		//leds[i].call('send_value', 3);
		send_led(i, 1);
	}
	post("Done building MonoPedal API Objects.\n");
}

function assign_api(cs)
{
	///these three are necessary for the rest of functionality to work, don't change them
	//surface=new LiveAPI(this.patcher, 'control_surfaces', cs);
	surface.num=cs;
	get_instance_names();
	var hold = [0, 0, 0, 8, 4, 2, 1];
	for (var i=0;i<7;i++)
	{
		pedal[i]=element('Pedal_'+i, 'pedal', cb_new_pedals, 'controls', 'value', [['num', i], ['last', 0], ['hold', hold[i]]]);
	}
	expression=element('Pedal_7', 'expression', cb_new_expression, 'controls', 'value', [['num', 0]]);
	//pedal[10]=element('Scene_Pedal_4', 'pedal', cb_reset, 'controls', 'value', [['num', 10]]);
	post("Done building MonoPedal API Objects.\n");
}

function cb_pedals(args)
{
	//post('cb_controls', args, '\n');
	if((args[0]=='value')&&(args[1]>0))
	{
		switch(this.num)
		{
			case 0:
				//undo();
				master.undoui.message('bang');
				break;
			case 1:
				//overdub();
				master.overdubui.message('bang');
				break;
			case 2:
				//loop();
				master.loopui.message('bang');
				break;
			case 3:
				master.muteui.message('bang');
				//mute();
				break;
			case 4:
				reverse();
				break;
			case 5:
				set_loop_number(1);
				break;
			case 6:
				set_loop_number(2);
				break;
			case 7:
				set_loop_number(3);
				break;
			case 8:
				set_loop_number(4);
				break;
			case 9:
				set_loop_number(0);
				break;
		}	
		//show_lcd();
	}	
}

function cb_new_pedals(args)
{
	if(DEBUG){post('pedal', args, '\n');}
	if((args[0]=='value')&&(args[1]==127)&&(this.last<127))
	{
		this.last = 127;
		hold += this.hold;
		//post('pedal', this.num, this.last, 'hold', hold, '\n');
		if(this.num<3)
		{
			switch(hold)
			{
				case 0:
					switch(this.num)
					{
						case 0:
							master.muteui.message('bang');	
							break;
						case 1:
							master.loopui.message('bang');
							break;
						case 2:
							overdub();
							break;
					}
					break;
				case 1:
					switch(this.num)
					{
						case 2:
							master.clearui.message('bang');
							break;
					}
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					break;
				case 6:
					switch(this.num)
					{
						case 1:
							master.undoui.message('bang');
							break;
					}
					break;
				case 8:
					switch(this.num)
					{
						case 0:
							master.reverseui.message('bang');
							break;
					}
					break;
				case 12:
					break;
			}
			hold = 0;
			show_lcd();
		}
	}
	else if((args[0]=='value')&&(this.last==127))
	{
		if(this.num > 2)
		{
			switch(hold)
			{
				case 1:
					switch(this.num)
					{
						case 6:
							set_loop_number(1);
							break;
					}
					break;
				case 2:
					switch(this.num)
					{
						case 5:
							set_loop_number(2);
							break;
					}
					break;
				case 3:
					var new_loop = Math.max(Math.min(4, sel_loop_number - 1), 1);
					set_loop_number(new_loop);
					//post('set_loop_number', new_loop, '\n');
					break;
				case 4:
					switch(this.num)
					{
						case 4:
							set_loop_number(3);
							break;
					}
					break;
				case 6:
					set_loop_number(0);
					break;
				case 8:
					switch(this.num)
					{
						case 3:
							set_loop_number(4);
							break;
					}
					break;	
				case 12:
					var new_loop = Math.max(Math.min(4, sel_loop_number + 1), 1);
					set_loop_number(new_loop);
					//post('set_loop_number', new_loop, '\n');
					break;
				case 15:
					//set_loop_number(0);
					break;
			}
		}
		//post('pedals', this.num, 0, '\n');
		hold = 0
		this.last = args[1];
		show_lcd();
	}
}

function cb_new_expression(args)
{
	//if(DEBUG){post('expression', args, '\n');}
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		//fb_sample.pop();
		//fb_sample.unshift(args[1]);
		//var nval = 0;
		//var i=3;do{
		//	nval += fb_sample[i];
		//}while(i--);
		//nval = Math.round(nval/100)*10;
		//if(fb_sample[0]*3 == fb_sample[0] + fb_sample[1] + fb_sample[2])
		//{
			nval = args[1];
			if(invert_pedal==true)
			{
				nval=Math.abs(nval-127);
				//post('invert_value', args[1], '\n');
			}
			set_feedback(nval/127);
	//	}
	}
}

function cb_reset(args)
{
	//post('cb_reset', args, this.get('name'), '\n');
	if((args[0]=='value')&&(args[1]>0))
	{
		this_device.call('stop_all_clips');
		all_loops.set_mute(1);
		all_loops.set_speed(1.0);
	}
}
		
function cb_expression(args)
{
	//post('cb_expressions', args, this.num, '\n');
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		switch(this.num)
		{
			case 0:
				set_input(args[1]/127);
				break;
			case 1:
				//post('set feedback ', args[1]/127, '\n');
				set_feedback(args[1]/127);
				break;
		}
	}
}

function dummy_callback(){}

function get_instance_names()
{
	components=[];
	controls=[];
	var cont_count=surface.getcount('controls');
	var comp_count=surface.getcount('components');
	for(var i=0;i<comp_count;i++)
	{
		surface.goto('components', i);
		components[surface.get('name')]=i;
		surface.goto('control_surfaces', surface.num);
	}
	for(var j=0;j<cont_count;j++)
	{
		surface.goto('controls', j);
		controls[surface.get('name')]=j;
		surface.goto('control_surfaces', surface.num);
	}
}
	
///for godsake, don't fuck with this!!!!
function element(api_name, name, callback, type, property, extras)
{
	var new_element=new LiveAPI(callback, 'control_surfaces', surface.num, type, find_by_api_name(api_name, type));
	new_element.n=name;
	if(extras)
	{
		for(var e=0;e<extras.length;e++)
		{
			eval('new_element.'+extras[e][0]+'='+extras[e][1]+';');
		}
	}
	if(property != undefined)
	{
		new_element.property=property;
	}
	new_element.array_index = function()
	{
		for(index in elements)
		{
			if(elements[index]==this)
			{
				return index;
			}
		}
	}
	new_element.destroy = function()
	{
		for(index in elements)
		{
			if(elements[index]==this)
			{
				if(this.property)
				{
					this.property=0;
				}
				this.id=0;
				for(var prop in this)
				{
					delete this[prop];
				}
				delete elements[index];
				//clear_value(this);
				//gc(this);
			}
		}
	}
	elements.push(new_element);
	return new_element;
}

function make_prop(args)
{
	var new_array=new Array()
	for(var i = 0;i<args.length;i+2);
	{
		var next_array=new Array(args[i], args[i+1]);
		new_array.push(next_array);
		delete next_array;
	}
	//for(array in new_array)
	//{
	//	  post(array[0], array[1])
	//}
	return(new_array);
	delete new_array;
}
	
function clear_value(object)
{
	object=undefined;
}

///or this!
function find_by_api_name(name, type)
{
	var new_object_number=0;
	if(type=='controls')
	{
		if(controls[name])
		{
			new_object_number=controls[name];
		}
	}
	if(type=='components')
	{
		if(components[name])
		{
			new_object_number=components[name];
		}
	}
	return new_object_number;
}

function dissolve()
{
	if(connected==true)
	{
		/*for(var index in elements)
		{
			elements[index].destroy();
		}
		connected=false;*/
		post('LoopMaster script dissolved\n');	  
	}
	//outlet(3, "dissolve");
}
////block ends here

function register(number, id, waveform)
{
	if(alive>0)
	{
		post('create_looper', number);
		looper[number]=new_looper(number, id, waveform);
		looper[number].handshake();
		master.waveform[number].message('set', looper[number].waveform);  ///is this the culprit??
		master.waveform[number].message('line', 'ms');
		//outlet(0, 'send_hotline', 'all', 'waveform', waveform);
		//looper[number].request_current_settings();
		//post('create_looper', looper[number].uid);
		//if(looper[number].n == sel_loop.n)
		//{
		//	looper[number].request_current_settings();
		//}
		var num = -1;
		for(var i=0;i<4;i++)
		{
			if(looper[i]!=undefined)
			{
				num = i;
				break;
			}
		}
		//post('selecting:', num+1, '\n');
		master.selectedui.message('int', parseInt(num+1));
	}
}

function new_looper(number, id, waveform)
{
	var new_looper=[];
	new_looper.n = number;
	new_looper.uid = id;
	new_looper.address = 'maxlooper_'+id;
	new_looper.position = 0;
	new_looper.direction = 1;
	new_looper.last_phase = 0;
	new_looper.grid_position = 0;
	new_looper.grid_position_light = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	new_looper.state = 'empty';
	new_looper.waveform = waveform;
	new_looper.view_looper = function()
	{
		messnamed(new_looper.address, 'distribute', 'view_looper');
	}
	new_looper.phase = function(phase)
	{
		new_looper.position = phase;
	}
	new_looper.feedback_val = function(fb)
	{
		messnamed(new_looper.address, 'distribute', 'feedback', fb);
	}
	new_looper.input_val = function(input)
	{
		messnamed(new_looper.address, 'distribute', 'input', input);
	}
	new_looper.hit_overdub = function()
	{
		messnamed(new_looper.address, 'distribute', 'overdub');
	}
	new_looper.hit_loop = function()
	{
		messnamed(new_looper.address, 'distribute', 'loop');
	}
	new_looper.set_loop = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'set_loop', val);
	}	
	new_looper.trigger_position = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'trigger_position', val);
	}
	new_looper.hit_undo = function()
	{
		messnamed(new_looper.address, 'distribute', 'undo');
	}
	new_looper.hit_mute = function()
	{
		messnamed(new_looper.address, 'distribute', 'mute');
	}
	new_looper.set_mute = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'set_mute', val);
	}	
	new_looper.hit_clear = function()
	{
		messnamed(new_looper.address, 'distribute', 'clear');
	}
	new_looper.set_overdub = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'set_overdub', val);
	}
	new_looper.set_offset = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'offset', val);
	}
	new_looper.hit_reverse = function()
	{
		messnamed(new_looper.address, 'distribute', 'reverse');
	}
	new_looper.set_speed = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'speed', val);
	}
	new_looper.set_inertia = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'inertia', val);
	}
	new_looper.set_quantize = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'quantize', val);
	}
	new_looper.hit_quantize = function()
	{
		messnamed(new_looper.address, 'distribute', 'hit_quantize');
	}
	new_looper.set_quantize_amount = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'quantize_amount', val);
	}
	new_looper.set_relative = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'relative', val);
	}
	new_looper.make_dummy_loop = function(val)
	{
		messnamed(new_looper.address, 'distribute', 'make_dummy_loop', val);
	}
	new_looper.request_current_settings = function()
	{
		messnamed(new_looper.address, 'send_current_settings');
	}
	new_looper.handshake = function()
	{
		messnamed(new_looper.address, 'handshake', 'Looper '+new_looper.n, 'id', new_looper.uid);
	}
	new_looper.copy_buffer = function(dest)
	{
		messnamed(new_looper.address, 'distribute', 'copy_buffer', dest);
	}
	return new_looper;
}

function new_all_loops()
{
	var new_all_loops=[];
	new_all_loops.n = '-1';
	new_all_loops.uid = 0;
	new_all_loops.send_function = function(message)
	{
		for(var index in looper)
		{
			if(looper[index]!=undefined)
			{
				looper[index][message]();
			}
		}
	}
	new_all_loops.send_value = function(message, value)
	{
		for(var index in looper)
		{
			if(looper[index]!=undefined)
			{
				looper[index][message](value);
			}
		}
	}
	new_all_loops.input_val = function(val)
	{
		new_all_loops.send_value('input_val', val);
	}
	new_all_loops.feedback_val = function(val)
	{
		new_all_loops.send_value('feedback_val', val);
	}
	new_all_loops.hit_overdub = function()
	{	
		new_all_loops.send_function('hit_overdub');
	}
	new_all_loops.hit_loop = function()
	{	
		new_all_loops.send_value('set_loop', 0);
	}
	new_all_loops.set_loop = function(val)
	{
		new_all_loops.send_value('set_loop', val);
	}
	new_all_loops.hit_undo = function()
	{
		new_all_loops.send_function('hit_undo');
	}
	new_all_loops.hit_mute = function()
	{
		new_all_loops.send_value('set_mute', 1);
	}
	new_all_loops.set_mute = function(val)
	{
		new_all_loops.send_value('set_mute', val);
	}
	new_all_loops.hit_clear = function()
	{
		new_all_loops.send_function('hit_clear');
	}
	new_all_loops.set_overdub = function(val)
	{
		new_all_loops.send_value('set_overdub', val);
	}
	new_all_loops.set_offset = function(val)
	{
		new_all_loops.send_value('set_offset', val);
	}
	new_all_loops.hit_reverse = function()
	{
		new_all_loops.send_function('hit_reverse');
	}
	new_all_loops.set_speed = function(val)
	{
		new_all_loops.send_value('set_speed', val);
	}
	new_all_loops.set_inertia = function(val)
	{
		new_all_loops.send_value('set_inertia', val);
	}	
	new_all_loops.set_quantize = function(val)
	{
		new_all_loops.send_value('set_quantize', val);
	}	
	new_all_loops.set_quantize_amount = function(val)
	{
		new_all_loops.send_value('set_quantize_amount', val);
	}	
	new_all_loops.set_relative = function(val)
	{
		new_all_loops.send_value('set_relative', val);
	}	
	new_all_loops.request_current_settings = function()
	{
		new_all_loops.send_function('request_current_settings');
	}
	return new_all_loops;
}

function phase(number, phase)
{
	if(alive>0)
	{
		if(looper[number])
		{
			looper[number].phase(phase);
			master.waveform[number].message('line', phase*looper[number].loop_end);
		}
		if(dial[number]!=undefined)
		{
			//var dir = Math.abs((phase - looper[number].last_phase)>0)
			var dir = looper[number] ? looper[number].direction : 1;
			//post('phase', phase, '\n');
			dial[number].state.message("set", parseInt(phase*360));
			dial[number].state_main.message("set", parseInt(phase*360));
			if(number==sel_loop_number-1)
			{
				var grid_position = parseInt(phase*16);
				looper[number].grid_position = grid_position;	
				if(dir > 0)
				{
					for(var i=0;i<16;i++)
					{
						var light =((i<=grid_position)&&(i>(grid_position-4))) + (i==grid_position);
						outlet(0, circle[0][i][0], circle[0][i][1], (light*2)+1);
					}
				}
				else
				{
					for(var i=0;i<16;i++)
					{
						var light =((i>=grid_position)&&(i<(grid_position+4))) + (i==grid_position);
						outlet(0, circle[0][i][0], circle[0][i][1], (light*2)+1);
					}
				}
			}
			looper[number].last_phase = phase;
		}
		if(remote)
		{
			sender.message('/loop_lcd/pos'+number+'/x', phase);
		}
		//post('/loop_lcd/pos'+number+'/x', phase, '\n');
		//post('position', looper[number].position);
	}
}

function set_loop_number(number)
{
	if(alive>0)
	{
		sel_loop_number = parseInt(number);
		number = number - 1;
		if(number > -1)
		{
			if(looper[number] != undefined)
			{
				master.sel_loop = looper[number];
				master.sel_loop.request_current_settings();
				//master.waveform.message('set', looper[number].waveform, 1);
			}
		}
		else
		{
			master.sel_loop = all_loops;
			//post(master.sel_loop.uid, ' is id\n');
			//master.waveform.message('set', 'none');
		}
		master.selectedui.message('set', number + 1);
		if(number > -1)
		{
			for(var i=0;i<num_loops;i++)
			{
				if(i==number)
				{
					dial[i].state.bgcolor(1,1,1,.4);
					dial[i].state_main.bgcolor(1,1,1,.4);
					if(remote)
					{
						sender.message('/loop_lcd/pos'+i+'/set_bg', 1, 1, 1);
					}
					send_led(i, Colors[looper[i] ? looper[i].state : 1] + 21);
				}
				else
				{
					dial[i].state.bgcolor(1,1,1,0);
					dial[i].state_main.bgcolor(1,1,1,0);
					if(remote)
					{
						sender.message('/loop_lcd/pos'+i+'/set_bg', .4, .4, .4);
					}
					send_led(i, Colors[looper[i] ? looper[i].state : 'empty']);
				}
			}
			//for(var j=0;j<4;j++)
			//{
			//outlet(0, 7+offsets[j][0], 7+offsets[j][1], (j==number)*4);
			//}
			display_selected(number);
		}
		else
		{
			for(var i=0;i<num_loops;i++)
			{
				if(remote)
				{
					sender.message('/loop_lcd/pos'+i+'/set_bg', 1, 1, 1);
				}
				dial[i].state.bgcolor(1,1,1,.5);
				dial[i].state_main.bgcolor(1,1,1,.5);
				send_led(i, looper[i] ? Colors[looper[i].state] + 21 : 21);
			}
		}
		if(lcd_view>0)
		{
			show_lcd();
		}
	}
}

function display_selected(number)
{
	outlet(0, 6, 6, ((0==number)*5)+1);
	outlet(0, 6, 7, ((2==number)*5)+1);
	outlet(0, 7, 6, ((1==number)*5)+1);
	outlet(0, 7, 7, ((3==number)*5)+1); 
}

function looper_quantize_menu(looper_id, looper_number, item)
{
	//post('quantize', item, '\n');
	if(looper_id == master.sel_loop.uid)
	{
		master.quantizemenuui.message('set', item);
		for(var i=0;i<5;i++)
		{
			outlet(0, i+offsets[0][0], 7+offsets[0][1], (item==i)+3);
		}
	}
}

function looper_quantize_status(looper_id, looper_number, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.quantizerecordui.message('set', val);
		outlet(0, offsets[0][0]+5, 7+offsets[0][1], (val*6)+2);
	}
}	

function looper_loop(looper_id, looper_number, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.inloopui.message('set', val);
		outlet(0, 2+offsets[0][0], 6+offsets[0][1], (val*6)+5);
	}
}	

function looper_input(looper_id, looper_num, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.inputui.message('set', val);
	}
}	
	
function looper_feedback(looper_id, looper_num, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.feedbackui.message('set', val);
	}
	if(dial[looper_num]!=undefined)
	{
		//post('feedback to lcd', parseInt(val*100), '\n');
		feedback[looper_num].fb.message('set', 1, parseInt(val*100));
		feedback[looper_num].fb_main.message('set', 1, parseInt(val*100));
		if(remote)
		{
			sender.message('/loop_lcd/fb'+looper_num+'/x', val);
		}
	}
}	

function looper_state(looper_id, looper_num, val, loop_end)
{
	//post('looper state', looper_id, looper_num, val, state_color[val], loop_end, '\n');
	if(looper_id == master.sel_loop.uid)
	{
		//post('looper_id==master.sel_loop.uid\n');
		if(val=='recording')
		{
			master.inloopui.message('set', 1);
		}
		else
		{
			master.inloopui.message('set', 0);
		}
		if(val=='overdubbing')
		{
			master.overdubui.message('set', 1);
			//post('master.overdubui.message(set, 1)\n');
		}
		else
		{
			master.overdubui.message('set', 0);
		}
		outlet(0, 1+offsets[0][0], 6+offsets[0][1], ((val=='overdubbing')*6)+3);
		outlet(0, 2+offsets[0][0], 6+offsets[0][1], ((val=='recording')*6)+5);
	}
	if(dial[looper_num]!=undefined)
	{
		//post('dial is recognized', looper_id, looper_num, val, state_color[val], '\n');
		dial[looper_num].state.fgcolor(state_color[val], 1);
		dial[looper_num].state_main.fgcolor(state_color[val], 1);
		if(remote)
		{
			sender.message('/loop_lcd/st'+looper_num+'/set_color', state_color[val][0], state_color[val][1], state_color[val][2]);
		}
		looper[looper_num].state = val;
		if(DEBUG){post('changing buttons state:', val, '\n');}
		send_led(looper_num, Colors[val] + (21*(looper_num == (sel_loop_number-1))));
		//post('master waveform', loop_end, '\n');
		if(loop_end!=undefined)
		{
			dial[looper_num].loop_end = loop_end;
			messnamed(unique+'lengths', parseInt(looper_num), loop_end);
		}
	}	
}
	
function looper_mute(looper_id, looper_number, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.muteui.message('set', val);
		outlet(0, 3+offsets[0][0], 6+offsets[0][1], (val*7)+1);
	}	
}	
	
function looper_speed(looper_id, looper_number, val)
{
	looper[looper_number].direction = (val>=0);
	if(looper_id == master.sel_loop.uid)
	{
		master.speedui.message('set', val);
		for(var i=0;i<5;i++)
		{
			outlet(0, 7+offsets[0][0], i+offsets[0][1], ((val==speed_values[i])*1)+2);
		}
	}
	//if(dir != looper[looper_number].direction)
	//{
	//	for(var i=0;i<16;i++)
	//	{
	//		var light = Math.abs(looper[number].grid_position_light[i]-1)
	//		looper[number].grid_position_light[i] = light;
	//		outlet(0, circle[number][i][0], circle[number][i][1], light);
	//	}
	//}
}

function looper_inertia(looper_id, looper_number, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.inertiaui.message('set', val);
		for(var i=0;i<5;i++)
		{
			outlet(0, 6+offsets[0][0], i+offsets[0][1], ((val>=inertia_values[i])*2)+3);
		}
	}
}

function looper_offset(looper_id, looper_num, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.offsetui.message('set', val);
	}
}

function looper_relative_status(looper_id, looper_num, val)
{
	if(looper_id == master.sel_loop.uid)
	{
		master.relativeui.message('set', val);
		//master.offsetui.message('set', val);
	}
}

function looper_beat(looper_id, looper_num)
{
	if(alive>0)
	{
		if(looper_id == master.sel_loop.uid)
		{
			master.beatui.message('bang');
		}
	}
}

function set_input(val)
{
	if(alive>0)
	{
		master.sel_loop.input_val(val);
	}
}

function set_feedback(val)
{
	if(alive>0)
	{
		master.sel_loop.feedback_val(val);
	}
}

function set_quantize_amount(val)
{
	if(alive>0)
	{
		master.sel_loop.set_quantize_amount(val);
	}
}

function set_overdub(val)
{
	if(alive>0)
	{
		master.sel_loop.set_overdub(val);
	}
}

function overdub()
{
	master.sel_loop.hit_overdub();
}

function set_speed(val)
{
	if(alive>0)
	{
		master.sel_loop.set_speed(val);
	}
}

function set_inertia(val)
{
	if(alive>0)
	{
		master.sel_loop.set_inertia(val);
	}
}

function set_quantize_record(val)
{
	if(alive>0)
	{
		master.sel_loop.set_quantize(val);
	}
}

function set_offset(val)
{
	if(alive>0)
	{
		master.sel_loop.set_offset(val);
	}
}

function mute()
{
	if(alive>0)
	{
		master.sel_loop.hit_mute();
	}
}

function reverse()
{
	if(alive>0)
	{
		master.sel_loop.hit_reverse();
	}
}

function undo()
{
	if(alive>0)
	{
		master.sel_loop.hit_undo();
	}
}

function clear()
{
	if(alive>0)
	{
		master.sel_loop.hit_clear();
	}
}

function loop()
{	
	if(alive>0)
	{
		master.sel_loop.hit_loop();
	}
}

function create_loops()
{
	for(var i=0;i<num_loops;i++)
	{
		//post("creating_loop", i, "\n");
		//dial[i] = viewer.newdefault(i*60, 0, 'dial', '@patching_rect', i*60, 0, 55, 55, '@bgcolor', .4, .4, .4, 0, '@fgcolor', 1, 1, 1, 1, '@needlecolor', 0, 0, 0, 1, '@outlinecolor', 0, 0, 0, 1, '@min', 0, '@degrees', 360, '@size', 360, '@clip', 0);
		//dial[i].presentation(1);
		dial[i] = [];
		dial[i].state = viewer.getnamed('state['+i+']');
		dial[i].state_main = this.patcher.getnamed('state['+i+']');
		dial[i].loop_len=0;
		dial[i].loop_pos=0;
		dial[i].loop_end=0;
		dial[i].sync=0;
		dial[i].feedback=0;
		//feedback[i] = viewer.newdefault((i*60)+27, 0, 'multislider', '@patching_rect', (i*60)+26, 0, 30, 55, '@ghostbar', 100, '@background', 1, '@setminmax', 0, 100);
		feedback[i] = [];
		feedback[i].fb = viewer.getnamed('fb['+i+']');
		feedback[i].fb_main = this.patcher.getnamed('fb['+i+']');
		//feedback[i].presentation(1);
	}
}

function clear_loops()
{
	for(var i=0;i<num_loops;i++)
	{
		//viewer.remove(dial[i]);
		//viewer.remove(feedback[i]);
	}
}

function invert(args)
{
	set_invert_pedal(args);
}

///Patcher LCD////
				
function set_screen_position(flo)
{
	screen_position = flo;
	init_display(); 
}

function currentstate(a, b, c, d, e)
{
	zoomfactor=Math.min(5.3,(1280/(60*num_loops)));
	y_start = (c * screen_position);
	x_end = b;
	y_end = (c * (.03+screen_position))*zoomfactor;///Math.min((c * (.1 + screen_position) * zoomfactor), c);
	lock();
	viewer.zoomfactor((b/1280)*zoomfactor);	 //I think this is a problem :|
	viewer.wind.scrollto(0, 0);
}

function init_display()
{
	if(timer > 5)
	{
		displays.message('currentstate', 0);
		remove_task('init_display');
		hide_lcd();
	}
}

function clear_lcd()
{	
	if(remote)
	{
		for(var i=0;i<4;i++)
		{
			sender.message('/loop_lcd/pos'+i+'/set_bg', 0, 0, 0);
			sender.message('/loop_lcd/st'+i+'/set_color', 0, 0, 0);
			sender.message('/loop_lcd/fb'+i+'/x', 0);
			send_led(i, 0);
		}
	}
}

function lcd(args)
{
	//post('lcd', args, '\n');
	if(alive > 0)
	{
		lcd_view=args;
		switch(args)
		{
			case 0:
				hide_lcd();
				break;
			case 1:
				show_lcd();
				last = timer;
				break;
		}
	}
}

function autohide(args)
{
	auto=args;
	//post('autohide', args, '\n');
	if(alive)
	{
		switch(args)
		{
			case 1:
				master.lcdui.message('int', 1);
				//if((alive > 0)&&(front==0))
				//{
				//	front=1;
				//	viewer.front();
				//}
				break;
		}
	}
}

function show_lcd()
{
	if((alive > 0)&&(lcd_view>0)&&(front==0))
	{
		front=1;
		viewer.front();
		last = timer;
	}
}

function hide_lcd()
{
	front=0;
	viewer.wclose();
	//this.patcher.front();
}

function unlock()
{
	viewer.window('size', 0, 0, 400, 200);
	viewer.window('flags', 'minimize');
	viewer.window('flags', 'zoom');
	viewer.window('flags', 'close');
	viewer.window('flags', 'grow');
	viewer.window('flags', 'title');
	viewer.window('flags', 'nofloat');
	viewer.window('exec');
	viewer.zoomfactor(1);
}

function lock()
{
	//post('size', 0, y_start, x_end, y_end);
	viewer.window('size', 0, y_start, x_end, y_end);
	viewer.window('exec');
	viewer.window('flags', 'nominimize');
	viewer.window('flags', 'nozoom');
	viewer.window('flags', 'noclose');
	viewer.window('flags', 'nogrow');
	viewer.window('flags', 'notitle');
	viewer.window('flags', 'float');
	viewer.window('exec');
	viewer.window('offset', 0, 0);
}

function scale(x,a,b,c,d)
{
	var in_dif=((Math.max((a+1000000),(b+1000000)))-(Math.min((a+1000000),(b+1000000))));
	var in_val=((Math.max((a+1000000),(x+1000000)))-(Math.min((a+1000000),(x+1000000))));
	var out_dif=((Math.max((c+1000000),(d+1000000)))-(Math.min((c+1000000),(d+1000000))));
	var out_min=(c+1000000);
	return(((out_min+(((in_val)/(in_dif))*(out_dif)-1000000)).toFixed(3)));
}

////Patcher Timing////

function increment_timer()
{
	timer++;
}

function remove_task(task)
{
	for(var a in tasks)
	{
		if(tasks[a]==task)
		{
			tasks.splice(a,1);
		}
	}
}

function add_task(task)
{
	tasks.push(task);
}

function clock()
{
	increment_timer();
	//post('clock', timer, front>0, last, auto_delay, timer>(last+auto_delay), auto>0, '\n');
	if((front>0)&&(timer>(last+auto_delay))&&(auto>0))
	{
		hide_lcd();
	}
	for(var a in tasks)
	{
		if (script[tasks[a]] instanceof Function)
		{
			script[tasks[a]].apply(tasks[a],[]);
		}
	}
}

function bang()
{
	switch (inlet)
	{
		case 0:
			//dissolve();
			break;
		case 1:
			clock();
			break;
	}
}

function note_in(note_number, note_val)
{
	//post('note in', note_number, note_val, '\n');
	if(note_number<4)
	{	
		looper[note_number].set_loop(note_val>0);
	}
	else if((note_number>3)&&(note_number<8))
	{	
		looper[note_number-4].set_overdub(note_val>0);
	}
	else if((note_number>7)&&(note_number<12)&&(note_val>0))
	{	
		looper[note_number-8].hit_reverse();
	}
	else if((note_number>11)&&(note_number<16)&&(note_val>0))
	{	
		looper[note_number-12].hit_mute();
	}
	else if((note_number>15)&&(note_number<20)&&(note_val>0))
	{	
		looper[note_number-16].hit_mute();
	}
	//else if((note_number>7)&&(note_number<12)&&(note_val>0))
	else if(note_number>119)
	{
		messnamed('gate.'+(note_number-120), (note_val<1));
	}
}

function ctl_in(ctl_number, ctl_value)
{
	//if(ctl_number<4)
	//{
	//	looper[ctl_number].set_speed(((ctl_value/127)*1200)-600)
	//}
	//else if(ctl_number<8)
	//{
	//	looper[ctl_number].set_inertia((ctl_value/127)*1200)
	//}
	if(ctl_number<4)
	{
		looper[ctl_number].feedback_val(ctl_value/127)
	}
	else if(ctl_number<8)
	{
		looper[ctl_number-4].trigger_position(ctl_value/127)
	}
}

function grid(x, y, z)
{
	if((x<8)&&(y<8))
	{
		//var number = (parseInt(x>7)*1) + (parseInt(y>7)*2);
		var pos = parseInt(cell_fire[x][y][0]);
		//var number = parseInt(cell_fire[x][y][1]);
		var number = sel_loop_number-1;
		//post(x, y, z, pos, number, '\n');
		if((pos > -1)&&(pos <16)&&(z>0))		//the first 16 positions are the main circle
		{
			looper[number].trigger_position(pos);
		}
		else if((pos == 17)&&(z>0))
		{
			looper[number].hit_reverse();
		}
		else if((pos == 18)&&(z>0))
		{
			looper[number].set_inertia(inertia_values[(y%8)]);
		}
		else if((pos == 19)&&(z>0))
		{
			looper[number].set_speed(speed_values[(y%8)]);
		}
		else if((pos ==20)&&(z>0))
		{
			switch(x%8)
			{
				case 0:
					looper[number].hit_undo();
					break;
				case 1:
					looper[number].hit_overdub();
					break;
				case 2:
					looper[number].hit_loop();
					break;
				case 3:
					looper[number].hit_mute();
					break;
				case 4:
					looper[number].hit_clear();
					break;
				case 5:
					break;
				case 6:
					master.selectedui.message('int', 1);
					break;
				case 7:
					master.selectedui.message('int', 2);
					break;
			}
		}
		else if((pos ==21)&&(z>0))
		{
			if((x%8)<5)
			{
				//looper[number].set_quantize_amount(x%8);
				looper[number].make_dummy_loop(x%8);
			}
			else
			{
				switch(x%8)
				{
					case 5:
						looper[number].hit_quantize();
						break;
					case 6:
						master.selectedui.message('int', 3);
						break;
					case 7:
						master.selectedui.message('int', 4);
						break;
				}
			}			
		}
	}
}

function dials(number, value)
{
	if(alive > 0)
	{
		args = arrayfromargs(messagename, arguments);
		//post(args, '\n');
		if(number <4)
		{
			looper[number].set_speed(value/100);
		}
		else
		{
			looper[number-4].set_inertia(value);
		}
	}
}

function autoselect(val)
{
	if(alive>0)
	{
		//post('autoselect\n');
		master.sel_loop.set_relative(val);
	}
}

function wiki(val)
{
	if(val=='bang')
	{
		//post('wiki', val, '\n');
		this.max.launchbrowser(wiki_page_addy);
	}
}

function set_invert_pedal(val)
{
	invert_pedal=val>0;
	//post(invert_pedal, 'pedal\n');
}

function hotline()
{
	var args = arrayfromargs(arguments);
	//post('looper_master hotline', args, '\n');
	//post('-'+args[0]);
	if(args[0]=='copy_buffer')
	{
		//post('copy_buffer\n');
		if(looper[args[1]])
		{
			//post('looper', args[1], 'exists\n');
			looper[args[1]].copy_buffer(args[2]);
		}
	}
}

function remote(val)
{
	remote_val = val;
	//post('remote', remote_val, '\n');
}

//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing

function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();
