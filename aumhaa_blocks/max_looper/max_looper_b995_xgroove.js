autowatch = 1;

var NEW_FORWARD = true;
var DEBUG = 0;
var DEBUGX = 0;


var prefix = jsarguments[1];
var max_time = jsarguments[2];
var buffer_loop = prefix+'loop';
var buffer_undo = prefix+'undo';
var ipoke_channel = prefix+'poke_chan';
var dummy = prefix+'dummy';
var resync = prefix+'resync';
var max_time = jsarguments[2];
var looper = [];
var finder;
var looper_id = 0;
var looper_number = -1;
var registered = 0;

var alive = 0;
var in_loop = 0;
var	go_to_overdub = 0;
var go_to_mute = 0;
var clock_start = 0;			//used for resync;  logs the Live time that the loop was started
var loop_start = 0;
var loop_end = 0;
//var loop_size = 0;
var buffer_size = max_time;
var offset = 240;
var out_offset = 200;
var fadetime = 100;
var speed = 1.;
var inertia = 1000;
var phase = 0;
var overdub = 0;
var state = 'empty';
var mute_status = 0;
var fb_lvl = 1.0;
var in_lvl = 1.0;
var this_feedback = 100;
var quantize_record = {enabled:1, ticks:1920, ms:2142.857178, samples:94500, menu:0, relative:1};
var position = {ms:0, phase:0, report:0, relative:0};
var undo_data = {can:false, loop_size: 0, clock_start: 0}
var track_data;
var samps_per_ms = quantize_record.samples/quantize_record.ms;

var looper = [];
var POBJ = ['buffetloop', 'buffetundo', 'bufferloop', 'bufferundo', 'pokeloop', 'groove', 
				'groovespeed', 'grooveend', 'quantization', 'recphase',
				'offsetui', 'tapeinertia', 'volout', 'feedbackui', 'inputui', 'inloopui', 
				'overdubui', 'reverseui', 'undoui', 'clearui', 'overdubui', 'speedui', 'inertiaui', 'muteui',
				'quantizerecordui', 'loopui', 'quantizemenuui', 'frommaster', 'fadein', 'fadetime', 
				'copybuffer', 'relativerecordui', 'calc_record', 'drivesource'];  // 'record', 'buffetin', 'bufferin', 'groovelength', 'latency'
var TOBJ = ['relativetimer',  'metro'];
var LENGTHS = [1, 2, 4, 8, 16, 32, 64];

//var del_chan = new Task(change_poke_channel, this);

function callback(){}

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
	looper.bufferloop.message('size', max_time);
	looper.pokeloop.message('interp', 1);		///testing - needs to be changed back to '1'
	looper.groove.message('loop', 1);
	looper.groove.message('interp', 2);
	looper.groove.message('units', 0);
	looper.groove.message('stop');
	looper.groove.message('getmax');
	messnamed(ipoke_channel, 1);
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
	looper.quantizemenuui.message('bang');	//get internal quantize values, since they are fired by the patcher before the js inits
	//looper.calc_record.message('len', max_time);
	//looper.calc_record.message('offset', offset);
	//looper.calc_record.message('offset', -1000+offset);
	//tape_mode(0);
	looper.metro.message('bang');
	register();
	alive = 1;
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
		//post('sending registration', looper_number, looper_id, '\n');
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
function loop(ms, rec_phase)
{	
	if(DEBUG){post('loop', ms, rec_phase, '\n');}
	//looper.loopui.message('set', 0);
	in_loop = Math.abs(in_loop - 1);
	switch(in_loop)
	{
		case 1:
			begin_loop(rec_phase, ms);
			break;
		case 0:
			end_loop(rec_phase);
			break;
	}
	
}

//this is called from LoopMaster?
///this is seriously problematic.....we need to stop the current loop process, not just fool it into thinking that we have
function set_loop(state) 
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

function begin_loop(rec_phase, ms)
{
	if(DEBUG){post('begin_loop', rec_phase, ms, '\n');}
	make_undo_step();													//copy the current loop into the record buffer and store its relevant attributes
	looper.bufferloop.message('clear');									//clear the current channel
	//clear();
	//looper.groove.message('setloop', 0, max_time);					//set the loop min/max time to the entire buffer
	looper.groove.message('stop');
	looper.groove.message('all');										//does the same thing as above
	looper.grooveend.message(max_time);									//
	//looper.calc_record.message('len', max_time);						//set the translation for the loopend, so it is updated if the tempo changes
	messnamed(ipoke_channel, 1);										//switch to channel 1 of the buffer
	change_speed(1., 1);												//turn speed to <forward 1.0>
	looper.groove.message('pos', 0);											//start groove so we can position from it
	looper.groove.message('start');
	looper.pokeloop.message('begin', 0);
	looper.pokeloop.message('end', max_time);
	looper.pokeloop.message('overdub', 1.);
	loop_start = 0;//rec_phase * max_time;//ms, new						//set the internal value of loop_start to 0, the beginning of the buffer
	if(quantize_record.enabled>0)										//if QAUNTIZE is ON, do some stuff:
	{
		if(quantize_record.relative > 0)								//if RELATIVE is ON>
		{
			//looper.line.message(0);
			//looper.line.message(1, 120000, 'ms');
			//looper.drivesource.message('int', 2);
			clock_start = ms;											//clock_start = the time that "loop" was pressed
			change_state('recording');									//update the state of the HUD via the LoopMaster
			looper.relativetimer.message('int', 1);		
		}
		else															//if relative is off> if the current time is on the downswing of the quantized beat:
		{
			position.report = 1;										//set report flag to 1, so that the on the next trigger of time(), the necessary <start> data will be stored
			change_state('awaiting_record');							//update GUI via LoopMaster
		}
	}
	else																//if QUANTIZE is OFF>
	{
		//looper.line.message(0);
		//looper.line.message(1, 120000, 'ms');
		//looper.drivesource.message('int', 2);
		clock_start = ms;												//clock_start = NOW
		change_state('recording');										//update GUI via LoopMaster
	}
	looper.inputui.message('float', 1);									//turn the input all the way up
	//looper.groove.message('stop');										//stop groove playback
	change_mute(0);														//mute the output of the patch
	looper.overdubui.message('set', 0);									//turn off overdubbing ui
}

//copy the current loop into the record buffer and store its relevant attributes
function make_undo_step()
{
	undo_data.can = true;
	undo_data.loop_size = loop_end;
	undo_data.clock_start = clock_start;
	looper.bufferundo.message('size', max_time/samps_per_ms);
	looper.buffetloop.message('copy_to_buffer', buffer_undo, 0, (max_time/samps_per_ms) - 1);
}

//move the undo buffer's contents to the loop buffer and restore it's settings
function undo()
{
	if(undo_data.can == true)
	{
		looper.overdubui.message('set', 0);
		looper.pokeloop.message('overdub', 0);
		messnamed(ipoke_channel, 2);
		//looper.groove.message('stop');
		loop_end = undo_data.loop_size;
		looper.bufferloop.message('size', max_time/samps_per_ms);
		looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, (loop_end/samps_per_ms) -1);
		looper.grooveend.message('float', loop_end);
		//looper.calc_record.message('len', loop_end);
		//looper.groove.message('startloop');
		undo_data.can = false;
	}
}

//this is only called from the loop() func, and only when a loop is already recording
function end_loop(rec_phase)
{
	if(quantize_record.enabled>0)										//if QUANTIZE is ON>
	{
		if(state!=('awaiting_record'))
		{
			change_state('awaiting_record');								//update the HUD via LoopMaster
			position.report = 1;											//set report flag so that time records the loop_end data when it's next triggered
		}
		else
		{
			change_state('playing');										//if loop is hit again before recording has started
			position.report = 0;											//cancel the recording
		}
	}
	else																//if QUANTIZE is OFF>
	{
		loop_end = parseInt(rec_phase * max_time);							//set the loop_end time to groove's position when loop() was called to end the recording
		if(DEBUG){post('loop_end', loop_end, '\n');}
		make_loop();													//make the loop and start playing it with the current stored times
		afterbirth();
	}
}

//this is called on every beat of quantization in sync with Live
function time(samples, rec_phase)
{
	if(DEBUGX){post('time', samples, rec_phase, '\n');}
	position.samples = samples;//ms
	position.phase = rec_phase;
	if((position.report == 1)&&(quantize_record.relative<1))
	{
		if(in_loop == 1)
		{
			clock_start = position.samples;
			looper.bufferloop.message('clear');
			looper.groove.message('pos', 0);
			//looper.line.message(0);
			//looper.line.message(1, 120000, 'ms');
			//looper.drivesource.message('int', 2);
			change_state('recording');
			if(DEBUGX){post('in_loop == 1, clock_start', clock_start, 'loop_start', loop_start, '\n');}
		}
		else
		{
			loop_end = Math.round(parseInt(position.phase * max_time)/quantize_record.samples)*quantize_record.samples;
			if(DEBUGX){post('time:loop_end', loop_end, '\n');}
			//make_loop(loop_start);
			make_loop();
			afterbirth();
		}
		position.report = 0;
	}
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_beat', looper_id, looper_number);
	}
}

//this is called on every beat of quantization, but is started by a relative loop press
function rel_time(rec_phase)
{
	if(DEBUG){post('rel_time', rec_phase, '\n');}
	if((quantize_record.relative>0)&&(position.report>0))
	{
		position.phase = rec_phase;
		loop_end = Math.round(parseInt(position.phase * max_time)/quantize_record.samples)*quantize_record.samples;
		if(DEBUG){post('loop_end', loop_end, '\n');}
		make_loop();
		afterbirth();
		looper.relativetimer.message('int', 0);
		position.report = 0;
	}
}

//this is called by 
function make_loop(rotate)
{
	if(DEBUG){post('make_loop', rotate, '\n');}
	//if(offset)
	//{
	//	looper.buffetloop.message('rotatetozero', offset);
	//}
	looper.grooveend.message('float', loop_end);//ms
	//looper.groove.message('pos', offset * samps_per_ms);
	//looper.pokeloop.message('end', loop_end);
	//looper.calc_record.message('len', loop_end);//ms
	//looper.groove.message(offset);//samples, pretty sure
	//looper.groove.message(offset+loop_start);
	//looper.drivesource.message(1);
	//looper.groove.message('startloop');
	messnamed(ipoke_channel, 2);
	//if(quantize_record.enabled>0)
	//{
	//	messnamed(resync, clock_start,  loop_end);
	//}
}

function make_dummy_loop(len)
{
	clear();
	loop_end = LENGTHS[len]*quantize_record.samples;
	if(DEBUG){post('make_dummy_loop', len, loop_end, '\n');}
	looper.speedui.message('float', 1);
	looper.feedbackui.message('float', 1);
	looper.inputui.message('float', 1);
	set_mute(0);
	looper.bufferloop.message('size', loop_end);
	looper.grooveend.message('float', loop_end);
	looper.groove.message('start');
	looper.overdubui.message('int', 1);
}

//this is called after make_loop() to carry out functions initiated by the method used to end the loop
function afterbirth()
{
	if(go_to_overdub > 0)											//if overdub was pressed to end the recording>
	{
		go_to_overdub = 0;											//turn off the flag 
		looper.overdubui.message('int', 1);							//turn on overdub via the gui
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
function loop_phase(val)
{
	phase = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'phase', looper_number, phase);
	}
}

//change overdubbing state
function tape_mode(status)
{
	if(alive>0)
	{
		if(in_loop>0)
		{
			go_to_overdub = 1;
			looper.loopui.message('bang');
		}
		else if(in_loop<1)
		{
			overdub = status;
			if(status>0)
			{
				make_undo_step();
				if(mute_status==0)
				{
					change_state('overdubbing');
				}
				messnamed(ipoke_channel, 1);
				looper.pokeloop.message('overdub', fb_lvl);
			}
			else
			{
				if(mute_status==0)
				{
					change_state('playing');
				}
				messnamed(ipoke_channel, 2);
				looper.pokeloop.message('overdub', 0);
			}
		}	
	}
}

//store an undo step and clear the buffer
function clear()
{
	make_undo_step();
	looper.bufferloop.message('clear');
	if(overdub < 1)
	{
		change_state('empty');
	}
}	

//reverse the tape transport; force ignores inertia;  sets internal attribute and forwards to change_speed()
function reverse(force)
{
	change_speed(speed * -1, force);
}

//change the transport speed;  force ignores inertia
function change_speed(new_speed, force)
{
	if(alive>0)
	{
		if(force>0)
		{
			looper.groovespeed.message('float', new_speed);
			speed = new_speed;
		}
		else
		{
			switch(inertia)
			{
				case 0:
					looper.groovespeed.message('float', new_speed);
					break;
				default:
					looper.tapeinertia.message('list', new_speed, inertia* Math.abs(speed - new_speed));
					break;
			}
			speed = new_speed;
		}
		if(registered > 0)
		{
			messnamed('looper_master', 'looper_speed', looper_id, looper_number, speed);
		}
	}
}

//change the transport inertia attribute 
function change_inertia(new_inertia)
{
	inertia = new_inertia;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_inertia', looper_id, looper_number, inertia);
	}
}

//change the record quantize amount
function set_quantize_amount(menu, ticks, ms, samples)
{
	if(DEBUG){post('quantize_amount', menu, ticks, ms, samples, '\n')};
	quantize_record.samples = samples;
	quantize_record.ticks = ticks;
	quantize_record.menu = menu;
	quantize_record.ms = ms;
	samps_per_ms = samples/ms;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_quantize_menu',  looper_id, looper_number, menu);
	}
}

//turn on/off quantization
function set_quantize_record(val)
{
	if(DEBUG){post('quantize_amount', val, '\n')};
	quantize_record.enabled = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_quantize_status', looper_id, looper_number, val);
	}
}

//set the predefined loop creation size
function set_dummy_size(size)
{
	dummy_size = size;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_dummy_size', looper_id, looper_number, dummy_size);
	}
}

//set the latency offset
function set_offset(new_offset)
{
	if(DEBUG){post('offset', new_offset, '\n')};
	offset = new_offset;
	if(alive>0)
	{
		//looper.calc_record.message('offset', new_offset-1000);
	}
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_offset', looper_id, looper_number, offset);
	}
}

function set_fade_time(new_fade_time)
{
	fadetime = new_fade_time;
}

//turn on/off relative quantization	
function set_relative_record(val)
{
	if(DEBUG){post('relative', val, '\n');}
	quantize_record.relative = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_relative_status', looper_id, looper_number, val);
	}
}

function input_level(level)
{
	in_lvl = level;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_input', looper_id, looper_number, in_lvl);
	}
	messnamed(prefix+'input', in_lvl);
}

function feedback_level(level)
{
	fb_lvl = level;
	if(overdub)
	{
		looper.pokeloop.message('overdub', fb_lvl * .99);
	}
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_feedback', looper_id, looper_number, fb_lvl);
	}
}

function mute()
{
	//looper.muteui.message('set', 0);
	set_mute(Math.abs(mute_status-1));
}

function change_mute(val)
{
	if(DEBUG){post('change_mute', val, '\n');}
	mute_status = val;
	looper.volout.message('float', Math.abs(val-1));
}

function set_mute(status)
{
	if(DEBUG){post('set_mute', status, '\n');}
	switch(status)
	{
		case 0:
			if(overdub > 0)
			{
				change_state('overdubbing');
			}
			else
			{
				change_state('playing');
			}
			break;
		case 1:
			if(state=='recording')
			{
				go_to_mute = 1;
				set_loop(0);
			}
			else if(state=='awaiting_record')
			{
				//position.report = 0;
				//change_state('muted');
				go_to_mute = 1;
				set_loop(0);
			}
			else
			{
				change_state('muted');
			}
			break;
	}
	change_mute(status);
}

//update the loopers internal state and forward to loopmaster
function change_state(val)
{
	state = val;
	if(DEBUG){post('state', state, '\n');}
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_state', looper_id, looper_number, state, loop_end);
	}
}

//forward the current loopers settings to loopmaster
function send_current_settings()
{
	messnamed('looper_master', 'current_settings', looper_id, looper_number, phase, state, speed, overdub, parseInt(quantize_record.enabled), parseInt(quantize_record.menu), offset, mute_status, fb_lvl, in_lvl, inertia, loop_end, parseInt(quantize_record.relative));
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
			if((in_loop==0)&&(overdub==0))
			{
				//post('groove.message int', Math.floor(val*(loop_size/16)), '\n');
				//looper.groove.message('stop');
				looper.groove.message('pos', val*(loop_end/16));
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
	looper.copybuffer.message('set', dest);
	looper.copybuffer.message('size', loop_end, 2);
	looper.buffetloop.message('copy_to_buffer', dest, 0, loop_end-1);
	//looper.copybuffer.message('set', dummy);
}

//called from LoopMaster....what does this do?  Is this for automation?
//no dumbass, it does the same thing that you just coded make_dummy_loop() to do ;)
function gen_loop(len)
{
	make_undo_step();
	bufferloop.message('size', len*quantize_record.ms);
	tape_mode(1);
}
	
function groove_attributes()
{
	var args = arrayfromargs(arguments);
	if(DEBUG){post('groove_attributes', args, '\n');}
	switch(args[0])
	{
		case 'max':
			max_time = args[1];
			if(DEBUG){post('loop max is', max_time);}
			break;
	}
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
	
