autowatch = 1;

var FORCELOAD = false;
var DEBUG = 0;
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
var looper_id = 0;
var looper_number = -1;
var registered = 0;

var in_loop = 0;
var	go_to_overdub = 0;
var go_to_mute = 0;
var clock_start = 0;			//used for resync;  logs the Live time that the loop was started
var loop_start = 0;
var loop_end = 0;
var buffer_size = max_time;
var offset = 240;
var out_offset = 200;
var fadetime = 100;
var speed = 1.;
var inertia = 1000;
var phase = 0;
var overdub_status = 0;
var state = 'empty';
var mute_status = 0;
var fb_lvl = 1.0;
var in_lvl = 1.0;
var this_feedback = 100;
var quantize_record = {enabled:1, ticks:1920, ms:2142.857178, samples:94500, menu:0, relative:1};
var position = {ms:0, phase:0, report:0, relative:0};
var undo_data = {can:false, loop_size: 0, clock_start: 0}
var samps_per_ms = quantize_record.samples/quantize_record.ms;
var looper = {};
var POBJ = ['buffetloop', 'buffetundo', 'bufferloop', 'bufferundo', 'pokeloop', 'looper',
				'groovespeed', 'grooveend', 'quantization', 'recphase',
				'offsetui', 'tapeinertia', 'volout', 'feedbackui', 'inputui', 'inloopui', 
				'overdubui', 'reverseui', 'undoui', 'clearui', 'speedui', 'inertiaui', 'muteui',
				'quantizerecordui', 'loopui', 'quantizemenuui', 'frommaster', 'fadein', 'fadetime', 
				'copybuffer', 'relativerecordui', 'calc_record', 'drivesource'];  // 'record', 'buffetin', 'bufferin', 'groovelength', 'latency'
var TOBJ = ['relativetimer',  'metro'];
var TRIGGER = ['inlet', 'quantize', 'relative', 'quantization', 'buffer_size'];
var LENGTHS = [1, 2, 4, 8, 16, 32, 64];

//var del_chan = new Task(change_poke_channel, this);

function callback(){}

function anything(){}

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
	looper.quantizemenuui.message('int', looper.quantizemenuui.getvalueof());
	looper.quantizerecordui.message('int', looper.quantizerecordui.getvalueof());
	looper.offsetui.message('int', looper.offsetui.getvalueof());
	looper.feedbackui.message('float', looper.feedbackui.getvalueof());
	looper.inputui.message('float', looper.inputui.getvalueof());
	looper.speedui.message('float', looper.speedui.getvalueof());
	looper.inertiaui.message('int', looper.inertiaui.getvalueof());
	looper.fadetime.message('int', looper.fadetime.getvalueof());
	looper.relativerecordui.message('int', looper.relativerecordui.getvalueof());
	looper.overdubui.message('set', 0);
	looper.quantizemenuui.message('bang');
	looper.metro.message('bang');
	looper.trigger.buffer_size.message(max_time);
	looper.looper.message('play', 0);
	looper.bufferloop.message('clear');
	register();
}

function current_state(val)
{
	if(DEBUG){post('current state:', val, '\n');}
	looper.trigger.state = val;
	in_loop = val == 'play' ? 0 : 1;
	change_state(val == 'rec' ? 'recording' : val == 'wait_in' ? 'awaiting_record' : val == 'wait_out' ? 'awaiting_record' : mute_status ? 'muted' : overdub_status ? 'overdubbing' : val == 'play' ? 'playing' : 'empty');
}

function trigger_end(val)
{
	loop_end = val;
}

//register with LoopMaster
function register()
{
	finder = new LiveAPI(callback, 'live_set', 'this_device');
	looper_id = finder.id;
	//looper.frommaster.message('set', 'maxlooper');
	var path = finder.path.slice(0, -1).split(' ').slice(-4, -2)
	if(DEBUG){post('request to register', looper_id, finder.path, 'check: ', path, '\n');}
	//if(finder.path.split(' ')[5] == 'chains')
	if(path[0] == 'chains')
	{
		looper.frommaster.message('set', 'maxlooper_' + looper_id);
		//looper_number = finder.path.split(' ')[6];
		looper_number = path[1];
		messnamed('looper_master', 'register', looper_number, looper_id, buffer_loop);
		if(DEBUG){post('sending registration', looper_number, looper_id, '\n');}
		finder.goto('canonical_parent', 'canonical_parent', 'canonical_parent', 'view');
	}
	//post('finder path', finder.path, '\n');
}	

//called by LoopMaster when instance is detected
function handshake(args)
{
	post('registered:', args, '\n');
	registered = 1;
	send_current_settings();
}

//begin or end loop recording, depending on current state
function _loop()
{	
	if(DEBUG){post('loop\n');}
	switch(looper.trigger.state)
	{
		case 'empty':
		case 'play':
			begin_loop();
			break;
		case 'rec':
			end_loop();
			break;
	}
			
}

//this is called from LoopMaster?
///this is seriously problematic.....we need to stop the current loop process, not just fool it into thinking that we have
function _set_loop(state) 
{
	switch(state)
	{
		case 0:
			if(in_loop>0)
			{
				looper.loopui.message('bang');
			}
			break;
		case 1:
			if(in_loop>0)
			{
				position.report = 0;
			}
			in_loop = 0;
			looper.loopui.message('bang');
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
	change_speed(1., 1);												//turn speed to <forward 1.0
	make_undo_step();													//copy the current loop into the record buffer and store its relevant attributes
	looper.overdubui.message('set', 0);									//turn off overdubbing ui
	looper.looper.message('overdub', 0);
	looper.trigger.inlet.message('start');
	looper.inputui.message('float', 1);									//turn the input all the way up

}

//copy the current loop into the record buffer and store its relevant attributes
function make_undo_step()
{
	undo_data.can = true;
	undo_data.loop_size = loop_end;
	undo_data.clock_start = clock_start;
	looper.bufferundo.message('duplicate', buffer_loop);
}

//move the undo buffer's contents to the loop buffer and restore it's settings
function undo()
{
	if(undo_data.can == true)
	{
		looper.overdubui.message('set', 0);
		looper.looper.message('play', 0);
		loop_end = undo_data.loop_size;
		looper.bufferloop.message('duplicate', buffer_undo);
		looper.looper.message('end', undo_data.loop_size);
		looper.looper.message('restart', 1);
		looper.looper.message('play', 1);
		undo_data.can = false;
	}
}

//this is only called from the loop() func, and only when a loop is already recording
function end_loop(rec_phase)
{
	if(DEBUG){post('loop_end', loop_end, '\n');}
	in_loop = 0;
	looper.trigger.inlet.message('end');
	afterbirth();
}

function make_dummy_loop(len)
{
	if(!in_loop)
	{
		make_undo_step();
		loop_end = LENGTHS[len]*quantize_record.samples;
		if(DEBUG){post('make_dummy_loop', len, loop_end, '\n');}
		looper.speedui.message('float', 1);
		looper.feedbackui.message('float', 1);
		looper.inputui.message('float', 1);
		set_mute(0);
		looper.looper.message('start', 0);
		looper.looper.message('end', loop_end);
		looper.looper.message('restart', 1);
		clear();
		looper.looper.message('play', 1);
		looper.looper.message('overdub', 1);
		looper.overdub_status = 1;
		wating_for_overdub = 0;
		looper.trigger.state = 'play';
		looper.overdubui.message('int', 1);
		change_state('overdubbing');
	}
	//overdub(1);
}

//this is called after make_loop() to carry out functions initiated by the method used to end the loop
function afterbirth()
{
	if(go_to_overdub > 0)											//if overdub was pressed to end the recording>
	{
		go_to_overdub = 0;											//turn off the flag 
		overdub(1);												//turn on overdub internally
	}
	else if(go_to_mute > 0)											//if mute was pressed to end the recording
	{
		go_to_mute = 0;												//turn off the flag
		change_mute(1);												//mute the patch
		change_state('muted');										//update the HUD
	}
	else
	{
		change_mute(0);		//this was uncommented in time();
		looper.fadein.message('int', 0.);
		looper.fadein.message('list', 1., fadetime);
		change_state('playing');									//otherwise, update the HUD that we are now playing
	}
}

//this is called every 100ms to update the GUI and HUD
function _loop_phase(val)
{
	phase = val;
	report('phase', [looper_number, phase]);
}

//change overdubbing state
function _overdub(status)
{
	if(go_to_overdub)
	{
		go_to_overdub = 0;
	}
	else if((looper.trigger.state == 'rec')||(looper.trigger.state == 'wait_in'))
	{
		go_to_overdub = 1;
		looper.loopui.message('bang');
	}
	else
	{
		overdub_status = status;
		looper.trigger.state = status ? 'odub' : 'play';
		looper.looper.message('feedback', status ? fb_lvl : 1);
		looper.looper.message('overdub', status);
		looper.overdubui.message('set', status);
		if(mute_status<1){change_state(status ? 'overdubbing' : 'playing');} 
	}
}

//store an undo step and clear the buffer
function _clear()
{
	looper.looper.message('play', 0);
	make_undo_step();
	looper.bufferloop.message('clear');
	looper.looper.message('play', 1);
	if(overdub_status < 1)
	{
		change_state('empty');
	}
}	

//reverse the tape transport; force ignores inertia;  sets internal attribute and forwards to change_speed()
function _reverse(force)
{
	change_speed(speed * -1, force);
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
	looper.speedui.message('set', speed);
	report('looper_speed', [looper_id, looper_number, speed]);
}

//change the transport inertia attribute 
function _change_inertia(new_inertia)
{
	inertia = new_inertia;
	report('looper_inertia', [looper_id, looper_number, inertia]);
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
	report('looper_quantize_menu',  [looper_id, looper_number, menu]);
}

//turn on/off quantization
function _set_quantize_record(val)
{
	if(DEBUG){post('quantize_amount', val, '\n')};
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.enabled = val;
		looper.trigger.quantize.message('int', val+1);
		messnamed('looper_quantize_status', [looper_id, looper_number, val]);
	}
	else
	{
		looper.quantizerecordui.message('set', 0);
	}
}

//turn on/off relative quantization	
function _set_relative_record(val)
{
	if(DEBUG){post('relative', val, '\n');}
	if((looper.trigger.state=='play')||(looper.trigger.state=='empty'))
	{
		quantize_record.relative = val;
		looper.trigger.relative.message('int', val+1);
		report('looper_relative_status', [looper_id, looper_number, val]);
	}
	else
	{
		looper.relativerecordui.message('set', 0);
	}
}

//set the predefined loop creation size
function set_dummy_size(size)
{
	dummy_size = size;
	report('looper_dummy_size', [looper_id, looper_number, dummy_size]);
}

//set the latency offset
function _set_offset(new_offset)
{
	if(DEBUG){post('offset', new_offset, '\n')};
	offset = new_offset;
	//looper.trigger.offset.message(new_offset);
	looper.looper.message('offset', new_offset);
	messnamed('looper_offset', [looper_id, looper_number, offset]);
}

function _set_fade_time(new_fade_time)
{
	fadetime = new_fade_time;
}

function _input_level(level)
{
	in_lvl = level;
	report('looper_input', [looper_id, looper_number, in_lvl]);
	messnamed(prefix+'input', in_lvl);
}

function _feedback_level(level)
{
	fb_lvl = level;
	if(overdub_status)
	{
		looper.looper.message('feedback', fb_lvl);
	}
	report('looper_feedback', [looper_id, looper_number, fb_lvl]);
}

function _mute()
{
	//looper.muteui.message('set', 0);
	set_mute(Math.abs(mute_status-1));
}

function _change_mute(val)
{
	if(DEBUG){post('change_mute', val, '\n');}
	mute_status = val;
	looper.volout.message('float', Math.abs(val-1));
	change_state(looper.trigger.state == 'play' ? val ? 'muted' : overdub_status ? 'overdubbing' : 'playing' : state);
}

function _set_mute(status)
{
	if(DEBUG){post('set_mute', status, '\n');}
	switch(looper.trigger.state)
	{
		case 'play':
			change_mute(status);
			break;
		case 'wait_in':
			//cancel?
			break;
		default:
			go_to_mute = 1;
			looper.loopui.message('bang');
			break;
	}
}

//update the loopers internal state and forward to loopmaster
function change_state(val)
{
	state = val;
	if(DEBUG){post('state', state, '\n');}
	report('looper_state', [looper_id, looper_number, state, loop_end]);
}

//forward the current loopers settings to loopmaster
function send_current_settings()
{
	messnamed('looper_master', 'current_settings', looper_id, looper_number, phase, state, speed, overdub_status, parseInt(quantize_record.enabled), parseInt(quantize_record.menu), offset, mute_status, fb_lvl, in_lvl, inertia, loop_end, parseInt(quantize_record.relative));
}

function report(name, vals)
{
	if(DEBUGX){post('report', name, vals, '\n');}
	if(registered)
	{
		messnamed('looper_master', name, vals);
	}
}

function distribute(func, val) 
{
	if(DEBUG){post('func',func, 'val', val, '\n');}
	switch(func)
	{
		case 'feedback':
			looper.feedbackui.message('float', val);
			break;
		case 'input':
			looper.inputui.message('float', val);
			break;	
		case 'loop':
			looper.loopui.message('bang');
			break;	
		case 'set_loop':
			set_loop(val);
			break;
		case 'undo':
			looper.undoui.message('bang');
			break;		
		case 'mute':
			mute();
			break;
		case 'set_mute':
			set_mute(val);
			break;
		case 'clear':
			looper.clearui.message('bang');
			break;	
		case 'set_overdub':
			//post('distribute set_overdub\n');
			looper.overdubui.message('int', val);
			break;
		case 'offset':
			looper.offsetui.message('int', val);
			break;
		case 'reverse':
			looper.reverseui.message('bang');
			break;
		case 'speed':
			looper.speedui.message('float', val);
			break;
		case 'inertia':
			looper.inertiaui.message('int', val);
			break;
		case 'quantize':
			looper.quantizerecordui.message('int', val);
			break;
		case 'hit_quantize':
			looper.quantizerecordui.message('bang');
			break;
		case 'quantize_amount':
			looper.quantizemenuui.message('int', val);
			break;
		case 'relative':
			looper.relativerecordui.message('int', val);
			break;
		case 'hit_overdub':
			//looper.overdubui.message('int', Math.abs(overdub -1));
			//post('distribute hit_overdub\n');
			looper.overdubui.message('bang');
			break;
		case 'trigger_position':
			if((in_loop==0)&&(overdub_status==0))
			{
				//post('groove.message int', Math.floor(val*(loop_size/16)), '\n');
				looper.looper.message('pos', val/16);
				looper.looper.message('restart', 1);
			}
			break;
		case 'overdub':
			//post('distribute overdub\n');
			looper.overdubui.message('bang');
			break;
		case 'view_looper':
			finder.call('select_instrument');
			break;
		case 'copy_buffer':
			//post('max_looper copy_buffer', val);
			copy_buffer_to_destination(val);
			break;
		case 'make_dummy_loop':
			make_dummy_loop(val);
			break;
		default:
			post('not recognized', func, val, '\n');
			break;
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

//called from LoopMaster....what does this do?  Is this for automation?
//no dumbass, it does the same thing that you just coded make_dummy_loop() to do ;)
function gen_loop(len)
{
	make_undo_step();
	//bufferloop.message('size', len*quantize_record.ms);
	looper.looper.message('end', len*quantize_record.ms);
	overdub(1);
	//overdub(1);
}

//function multiply()
//{
//	looper.buffetloop.message('maxswap', loop_size*2);
//	looper.bufferundo.message('size', loop_size);
//	looper.buffetloop.message('copy_to_buffer', buffer_undo, 0, loop_size-1)
//	looper.bufferloop.message('size', 0, loop_size*2);
//	looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
//	looper.buffetloop.message('rotatetozero', loop_size);
	//looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size-1);
//	looper.grooveend.message(loop_size*2);
//	looper.groovelength.message(loop_size*2);
//}
	
//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing

function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();
