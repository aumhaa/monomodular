autowatch = 1;

var FORCELOAD = false;
var DEBUG = 1;
var DEBUGX = 0;

var script = this;
var prefix = jsarguments[1];
var max_time = jsarguments[2];
var buffer_loop = prefix+'loop';
var buffer_undo = prefix+'undo';
var dummy = prefix+'dummy';
var resync = prefix+'resync';
var looper = [];
var finder;
var this_instance_number = -1;

var INSTANCE = [[6, 6], [7, 6], [6, 7], [7, 7]];
var grid_position = 0;
var speed_values = [2, 1, 0, -1, -2];
var inertia_values = [0, 50, 90, 300, 600];
var circle = [[[0, 0], [1, 0], [2, 0], [3, 0], [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [3, 4], [2, 4], [1, 4], [0, 4], [0, 3], [0, 2], [0, 1]],
				[[8, 0], [9, 0], [10, 0], [11, 0], [12, 0], [12, 1], [12, 2], [12, 3], [12, 4], [11, 4], [10, 4], [9, 4], [8, 4], [8, 3], [8, 2], [8, 1]],
				[[0, 8], [1, 8], [2, 8], [3, 8], [4, 8], [4, 9], [4, 10], [4, 11], [4, 12], [3, 12], [2, 12], [1, 12], [0, 12], [0, 11], [0, 10], [0, 9]],
				[[8, 8], [9, 8], [10, 8], [11, 8], [12, 8], [12, 9], [12, 10], [12, 11], [12, 12], [11, 12], [10, 12], [9, 12], [8, 12], [8, 11], [8, 10], [8, 9]]];
var cell_fire = [];
for(var i=0;i<16;i++)
{
	cell_fire[i] = [];
	for(var j=0;j<16;j++)
	{
		cell_fire[i][j] = [-1, (((i>7)+0)+(((j>7)+0)*2))];
		for(var l=0;l<4;l++)
		{
			for(var p=0;p<16;p++)
			{
				if((circle[l][p][0] == i)&&(circle[l][p][1] == j))
				{
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


var in_loop = 0;
var	go_to_overdub = 0;
var go_to_mute = 0;
var clock_start = 0;			//used for resync;  logs the Live time that the loop was started
var loop_start = 0;
var loop_end = 0;
var buffer_size = max_time;
var offset = 240;

var fadetime = 100;
var speed = 1.;
var inertia = 1000;
var phase = 0;
var overdub_status = 0;
var state = 'empty';
var mute_status = 0;
var fb_lvl = 1.0;
var in_lvl = 1.0;

var quantize_record = {enabled:1, ticks:1920, ms:2142.857178, samples:94500, menu:0, relative:1};
var position = {ms:0, phase:0, report:0, relative:0};
var undo_data = {can:false, loop_size: 0, clock_start: 0}
var samps_per_ms = quantize_record.samples/quantize_record.ms;
var looper = {};
var POBJ = ['bufferloop', 'bufferundo', 'pokeloop', 'looper',
			'groovespeed', 'grooveend', 'quantization', 'recphase',
			'offset', 'tapeinertia', 'volout', 'feedback', 'input',
			'overdub', 'reverse', 'undo', 'clear', 'speed', 'inertia', 'mute',
			'quantizerecord', 'loop', 'quantizemenu', 'fadein', 'fadetime', 
			'relativerecord', 'state', 'position', 'position_remote', 'state_remote']; 
			// 'record', 'buffetin', 'bufferin', 'groovelength', 'latency', 'inloop', 'frommaster',
			//'copybuffer', 'calc_record', 'drivesource', 'buffetloop', 'buffetundo', 
var TOBJ = ['relativetimer',  'metro'];
var TRIGGER = ['inlet', 'quantize', 'relative', 'quantization', 'buffer_size'];
var LENGTHS = [1, 2, 4, 8, 16, 32, 64];
var stored_messages = [];

//var del_chan = new Task(change_poke_channel, this);

function callback(){}

function _anything()
{
	var args = arrayfromargs(messagename, arguments);
	if(DEBUG){post('anything:', args, '\n');}
}

function anything()
{
	var args = arrayfromargs(arguments);
	//if(DEBUG){post('anything', messagename, args, '\n');}
	if(finder == null)
	{
		//if(DEBUG){post('adding to stack:', messagename, args, '\n');}
		if(stored_messages.length>500)
		{
			stored_messages.shift();
		}
		stored_messages.push([messagename, args]);
		//if(DEBUG){post('added:', stored_messages[0], '\n');}
	}
}
	
//called when live.this_device bangs
function init()
{
	if(DEBUG){post('init\n');}
	for(var obj in POBJ)
	{
		looper[POBJ[obj]] = this.patcher.getnamed(POBJ[obj]);
	}
	for(var obj in TOBJ)
	{
		looper[TOBJ[obj]] = this.patcher.getnamed('timers').subpatcher().getnamed(TOBJ[obj]);
	}
	looper.trigger = {state : 'empty', patcher : this.patcher.getnamed('trigger').subpatcher()};
	for(var obj in TRIGGER)
	{
		looper.trigger[TRIGGER[obj]] = looper.trigger.patcher.getnamed(TRIGGER[obj]);
	}
	for(var i in script)
	{
		if((/^_/).test(i))
		{
			script[i.replace('_', "")] = script[i];
		}
	}
	looper.looper.message('Loop', buffer_loop);
	//looper.bufferloop.message('size', max_time);
	looper.groovespeed.message('float', 1.0);
	looper.quantizemenu.message('int', looper.quantizemenu.getvalueof());
	looper.quantizerecord.message('int', looper.quantizerecord.getvalueof());
	looper.offset.message('int', looper.offset.getvalueof());
	looper.feedback.message('float', looper.feedback.getvalueof());
	looper.input.message('float', looper.input.getvalueof());
	looper.speed.message('float', looper.speed.getvalueof());
	looper.inertia.message('int', looper.inertia.getvalueof());
	looper.fadetime.message('int', looper.fadetime.getvalueof());
	looper.relativerecord.message('int', looper.relativerecord.getvalueof());
	looper.overdub.message('set', 0);
	looper.quantizemenu.message('bang');
	looper.metro.message('bang');
	looper.trigger.buffer_size.message(max_time);
	looper.looper.message('play', 0);
	looper.bufferloop.message('clear');
	var dev = new LiveAPI('live_set', 'this_device');
	detect_instance(dev);
	dev.goto('parameters', 19);
	looper.position_remote.message('id', dev.id);
	dev.goto('live_set', 'this_device');
	dev.goto('parameters', 20);
	looper.state_remote.message('id', dev.id);
	display_position();
	for(var i=0;i<5;i++)
	{
		outlet(0, 'push_grid', 'value', i, 7, 4);
	}
	outlet(0, 'push_grid', 'value', 0, 6, (undo_data.can*7)+1);
	outlet(0, 'push_grid', 'value', 1, 6, (overdub_status*7)+3);	
	outlet(0, 'push_grid', 'value', 2, 6, (in_loop*7)+5);
	outlet(0, 'push_grid', 'value', 3, 6, (mute_status*7)+7);
	outlet(0, 'push_grid', 'value', 4, 6, 2);
}

function detect_instance(this_device)
{
	var name = this_device.get('name');
	var KEYS = [new RegExp(/(@loop1)/), new RegExp(/(@loop2)/), new RegExp(/(@loop3)/), new RegExp(/(@loop4)/)];
	for(var i=0;i<4;i++)
	{
		if(KEYS[i].test(name))
		{
			this_instance_number = i;
			outlet(0, 'push_grid', 'value', INSTANCE[i][0], INSTANCE[i][1], 1);
			if(DEBUG){post('found instance number:', i, '\n');}
			break;
		}
	}
}
	
function current_state(val)
{
	if(DEBUG){post('current state:', val, '\n');}
	if((val=='play')&&(overdub_status)){val = 'odub';}
	looper.trigger.state = val;
	in_loop = val == 'play' ? 0 : 1;
	update_state();
}

function update_state()
{
	var new_state = {'rec':0, 'empty':1, 'play':2, 'odub':3, 'wait_in':4, 'wait_out':4}[looper.trigger.state];
	if(mute_status){new_state = 5;}
	looper.state.message('int', new_state);
	if(DEBUG){post('update state:', new_state, '\n');}
}

function trigger_end(val)
{
	loop_end = val;
}

//begin or end loop recording, depending on current state
function _loop(val)
{	
	if(DEBUG){post('loop\n');}
	switch(looper.trigger.state)
	{
		case 'empty':
		case 'odub':
		case 'play':
			begin_loop();
			break;
		case 'rec':
			end_loop();
			break;
	}
}

function begin_loop()
{
	if(DEBUG){post('begin_loop', '\n');}
	looper.looper.message('play', 0);
	in_loop = 1;
	loop_start = 0;//rec_phase * max_time;//ms, new						//set the internal value of loop_start to 0, the beginning of the buffer
	change_mute(0);														//mute the output of the patch
	change_overdub(0);
	change_speed(1., 1);												//turn speed to <forward 1.0
	make_undo_step();													//copy the current loop into the record buffer and store its relevant attributes
	looper.looper.message('overdub', 0);
	looper.trigger.inlet.message('start');
	looper.input.message('float', 1);									//turn the input all the way up
	outlet(0, 'push_grid', 'value', 2, 6, 12);
}

//this is only called from the loop() func, and only when a loop is already recording
function end_loop()
{
	if(DEBUG){post('loop_end', loop_end, '\n');}
	in_loop = 0;
	looper.trigger.inlet.message('end');
	if(go_to_overdub)
	{
		change_overdub(1);
	}
	else if(go_to_mute)
	{
		change_mute(1);
	}
	else
	{
		change_mute(0);
		looper.fadein.message('int', 0.);
		looper.fadein.message('list', 1., fadetime);
	}
	update_state();
	outlet(0, 'push_grid', 'value', 2, 6, 5);
	outlet(0, 'push_grid', 'value', 4, 6, 2);
}

//change overdubbing state
function _overdub()
{
	switch(looper.trigger.state)
	{
		case 'rec':
		case 'wait_in':
			if(!go_to_overdub)
			{
				go_to_overdub = 1;
				_loop();
			}
			break;
		default:
			if(mute_status){change_mute(0);}
			_change_overdub(Math.abs(overdub_status - 1));
			break;
	}
	update_state();
}

function _change_overdub(val)
{
	if(DEBUG){post('change_overdub', val, '\n');}
	overdub_status = val;
	go_to_overdub = 0;
	looper.trigger.state = overdub_status ? 'odub' : 'play';
	looper.looper.message('feedback', overdub_status ? fb_lvl : 1);
	looper.looper.message('overdub', overdub_status);
	outlet(0, 'push_grid', 'value', 1, 6, (overdub_status*7)+3);
	outlet(0, 'push_grid', 'value', 4, 6, 9);
}

function _mute()
{
	if(DEBUG){post('_mute\n');}
	var status = mute_status;
	switch(looper.trigger.state)
	{
		case 'play':
			status = Math.abs(mute_status-1);
			_change_mute(status);
			break;
		case 'wait_in':
			go_to_mute = 1;
			_loop();
			break;
		case 'odub':
			_change_overdub(0);
			_change_mute(1);
			break;
		case 'wait_out':
			go_to_mute = 1;
			break;
		default:
			go_to_mute = 1;
			_loop();
			break;
	}
	update_state();
}

function _change_mute(val)
{
	if(DEBUG){post('change_mute', val, '\n');}
	mute_status = val;
	go_to_mute = 0;
	looper.volout.message('float', Math.abs(val-1));
	outlet(0, 'push_grid', 'value', 3, 6, (mute_status*7)+7);
}

//copy the current loop into the record buffer and store its relevant attributes
function make_undo_step()
{
	undo_data.can = true;
	undo_data.loop_size = loop_end;
	undo_data.clock_start = clock_start;
	looper.bufferundo.message('duplicate', buffer_loop);
	outlet(0, 'push_grid', 'value', 0, 6, (undo_data.can*7)+1);	
}

//move the undo buffer's contents to the loop buffer and restore it's settings
function undo()
{
	if(undo_data.can == true)
	{
		//looper.overdub.message('set', 0);
		looper.looper.message('play', 0);
		loop_end = undo_data.loop_size;
		looper.bufferloop.message('duplicate', buffer_undo);
		looper.looper.message('end', undo_data.loop_size);
		looper.looper.message('restart', 1);
		looper.looper.message('play', 1);
		undo_data.can = false;
	}
	outlet(0, 'push_grid', 'value', 0, 6, (undo_data.can*7)+1);	
}

//store an undo step and clear the buffer
function _clear()
{
	looper.looper.message('play', 0);
	make_undo_step();
	looper.bufferloop.message('clear');
	looper.looper.message('play', 1);
	update_state();
	outlet(0, 'push_grid', 'value', 4, 6, 2);	
}	

//reverse the tape transport; force ignores inertia;  sets internal attribute and forwards to change_speed()
function _reverse(force)
{
	change_speed(speed * -1, force);
}

function make_dummy_loop(len)
{
	if(!in_loop)
	{
		make_undo_step();
		loop_end = LENGTHS[len]*quantize_record.samples;
		if(DEBUG){post('make_dummy_loop', len, loop_end, '\n');}
		looper.speed.message('float', 1);
		looper.feedback.message('float', 1);
		looper.input.message('float', 1);
		change_mute(0);
		looper.looper.message('start', 0);
		looper.looper.message('end', loop_end);
		looper.looper.message('restart', 1);
		clear();
		looper.looper.message('play', 1);
		looper.looper.message('overdub', 1);
		looper.overdub_status = 1;
		wating_for_overdub = 0;
		looper.trigger.state = 'odub';
	}
}

//change the transport speed;  force ignores inertia
function _change_speed(new_speed, force)
{
	if(force||!inertia)
	{
		looper.groovespeed.message('float', new_speed);
	}
	else
	{
		looper.tapeinertia.message('list', new_speed, inertia* Math.abs(speed - new_speed));
	}
	speed = new_speed;
	looper.speed.message('set', speed);
	for(var i=0;i<5;i++)
	{
		outlet(0, 'push_grid', 'value', 7, i, ((speed==speed_values[i])*1)+2);
	}
}

//change the transport inertia attribute 
function _change_inertia(new_inertia)
{
	inertia = new_inertia;
	for(var i=0;i<5;i++)
	{
		outlet(0, 'push_grid', 'value', 6, i, ((inertia>=inertia_values[i])*2)+3);
	}
}

//change the record quantize amount
function _set_quantize_amount(menu, ticks, ms, samples)
{
	if(DEBUG){post('quantize_amount', menu, ticks, ms, samples, '\n')};
	quantize_record.samples = samples;
	quantize_record.ticks = ticks;
	quantize_record.menu = menu;
	quantize_record.ms = ms;
	samps_per_ms = samples/ms;
	looper.trigger.quantization.message('int', menu);
}

//turn on/off quantization
function _set_quantize_record(val)
{
	if(DEBUG){post('quantize_amount', val, '\n')};
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.enabled = val;
		looper.trigger.quantize.message('int', val+1);
	}
	else
	{
		looper.quantizerecord.message('set', 0);
	}
	outlet(0, 'push_grid', 'value', 5, 7, (quantize_record.enabled*6)+2);
}

//turn on/off relative quantization	
function _set_relative_record(val)
{
	if(DEBUG){post('relative', val, '\n');}
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.relative = val;
		looper.trigger.relative.message('int', val+1);
	}
	else
	{
		looper.relativerecord.message('set', 0);
	}
}

//set the predefined loop creation size
function _set_dummy_size(size)
{
	dummy_size = size;
}

//set the latency offset
function _set_offset(new_offset)
{
	if(DEBUG){post('offset', new_offset, '\n')};
	offset = new_offset;
	//looper.trigger.offset.message(new_offset);
	looper.looper.message('offset', new_offset);
}

function _set_fade_time(new_fade_time)
{
	fadetime = new_fade_time;
}

function _input_level(level)
{
	in_lvl = level;
	messnamed(prefix+'input', in_lvl);
}

function _feedback_level(level)
{
	fb_lvl = level;
	if(overdub_status)
	{
		looper.looper.message('feedback', fb_lvl);
	}
}

function _display_position()
{
	grid_position = parseInt(phase*16);	
	if(speed > 0)
	{
		for(var i=0;i<16;i++)
		{
			var light =((i<=grid_position)&&(i>(grid_position-4))) + (i==grid_position);
			outlet(0, 'push_grid', 'value', circle[0][i][0], circle[0][i][1], (light*2)+1);
		}
	}
	else
	{
		for(var i=0;i<16;i++)
		{
			var light =((i>=grid_position)&&(i<(grid_position+4))) + (i==grid_position);
			outlet(0, 'push_grid', 'value', circle[0][i][0], circle[0][i][1], (light*2)+1);
		}
	}
}

//this is called every 100ms to update the GUI and HUD
function _loop_phase(val)
{
	phase = val;
	looper.position.message('float', val);
	display_position();
}

//update the loopers internal state and forward to loopmaster
function change_state(val)
{
	state = val;
	looper.state.message('int', ['recording', 'empty', 'playing', 'overdubbing', 'awaiting_record', 'muted'].indexOf(val));
	if(DEBUG){post('state', state, '\n');}
}

function push_grid(x, y, z)
{
	grid(x, y, z);
}

function grid(x, y, z)
{
	if((x<8)&&(y<8))
	{
		var pos = parseInt(cell_fire[x][y][0]);
		//post(x, y, z, pos, number, '\n');
		if((pos > -1)&&(pos <16)&&(z>0))		//the first 16 positions are the main circle
		{
			//looper[number].trigger_position(pos);
			looper.looper.message('pos', pos/16);
			looper.looper.message('restart', 1);
		}
		else if((pos == 17)&&(z>0))
		{
			_reverse();
		}
		else if((pos == 18)&&(z>0))
		{
			_change_inertia(inertia_values[(y%8)]);
		}
		else if((pos == 19)&&(z>0))
		{
			_change_speed(speed_values[(y%8)]);
		}
		else if((pos ==20)&&(z>0))
		{
			switch(x%8)
			{
				case 0:
					undo();
					break;
				case 1:
					_overdub();
					break;
				case 2:
					_loop();
					break;
				case 3:
					_mute();
					break;
				case 4:
					_clear();
					break;
				case 5:
					break;
				case 6:
					//master.selectedui.message('int', 1);
					if(DEBUG){post('select_device_from_key @loop1\n');}
					outlet(0, 'select_device_from_key', '@loop1');
					break;
				case 7:
					//master.selectedui.message('int', 2);
					if(DEBUG){post('select_device_from_key @loop2\n');}
					outlet(0, 'select_device_from_key', '@loop2');
					break;
			}
		}
		else if((pos ==21)&&(z>0))
		{
			if((x%8)<5)
			{
				make_dummy_loop(x%8);
			}
			else
			{
				switch(x%8)
				{
					case 5:
						set_quantize_record(Math.abs(quantize_record.enabled-1));
						break;
					case 6:
						//master.selectedui.message('int', 3);
						if(DEBUG){post('select_device_from_key @loop3\n');}
						outlet(0, 'select_device_from_key', '@loop3');
						break;
					case 7:
						//master.selectedui.message('int', 4);
						if(DEBUG){post('select_device_from_key @loop4\n');}
						outlet(0, 'select_device_from_key', '@loop4');
						break;
				}
			}			
		}
	}
}





//called from other patches, e.g. GrainStorm mod, to transfer the loopers buffer contents to their own buffers
//this will be broken in b995 until I make some adjustments
function copy_buffer_to_destination(dest)
{
	//post('copy buffer', dest, '\n');
	//looper.copybuffer.message('set', dest);
	//looper.copybuffer.message('size', loop_end, 2);
	//looper.buffetloop.message('copy_to_buffer', dest, 0, loop_end-1);
	//looper.copybuffer.message('set', dummy);
}

/*function multiply()
{
	looper.buffetloop.message('maxswap', loop_size*2);
	looper.bufferundo.message('size', loop_size);
	looper.buffetloop.message('copy_to_buffer', buffer_undo, 0, loop_size-1)
	looper.bufferloop.message('size', 0, loop_size*2);
	looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
	looper.buffetloop.message('rotatetozero', loop_size);
	looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
	looper.grooveend.message(loop_size*2);
	looper.groovelength.message(loop_size*2);
}*/


//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing
function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();
