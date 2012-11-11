autowatch = 1;

const NEW_FORWARD = true;

var prefix = jsarguments[1];
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
var clock_start = 0;
var loop_start = 0;
var loop_end = 0;
var loop_size = 0;
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
var quantize_record = {enabled:0, ticks:1920, ms:2142.857178, samples:94500, menu:0, relative:1};
var position = {ms:0, phase:0, report:0, relative:0};
var undo_data = {can:false, loop_size: 0, clock_start: 0}
var track_data;

var looper = [];
const POBJ = ['buffetin', 'buffetloop', 'buffetundo', 'bufferin', 'bufferloop', 'bufferundo', 'pokeloop', 'record', 'groove', 
				'groovespeed', 'grooveend', 'groovelength', 'quantization', 'recphase', 'offsetui', 'tapeinertia', 'volout', 'feedbackui', 
				'inputui', 'inloopui', 'overdubui', 'reverseui', 'undoui', 'clearui', 'overdubui', 'speedui', 'inertiaui', 'muteui',
				'quantizerecordui', 'loopui', 'quantizemenuui', 'frommaster', 'metro', 'fadein', 'fadetime', 'relativerecordui', 'relativetimer', 'copybuffer'];

function callback(){}

function init()
{
	for(var obj in POBJ)
	{
		looper[POBJ[obj]] = this.patcher.getnamed(POBJ[obj]);
	}
	looper.bufferin.message('size', max_time);
	looper.pokeloop.message('interp', 0);		///testing - needs to be changed back to '1'
	looper.groove.message('loop', 1);
	looper.groove.message('loopinterp', 0);
	looper.groovespeed.message('float', 1.0);
	looper.record.message('loop', 1);
	looper.record.message('int', 1);
	looper.quantizemenuui.message('int', looper.quantizemenuui.getvalueof());
	looper.quantizerecordui.message('int', looper.quantizerecordui.getvalueof());
	looper.offsetui.message('int', looper.offsetui.getvalueof());
	looper.feedbackui.message('float', looper.feedbackui.getvalueof());
	looper.inputui.message('float', looper.inputui.getvalueof());
	looper.speedui.message('float', looper.speedui.getvalueof());
	looper.inertiaui.message('int', looper.inertiaui.getvalueof());
	looper.fadetime.message('int', looper.fadetime.getvalueof());
	looper.relativerecordui.message('int', looper.relativerecordui.getvalueof());
	tape_mode(0);
	looper.metro.message('bang');
	register();
	alive = 1;
}

function register()
{
	finder = new LiveAPI(callback, 'live_set', 'this_device');
	looper_id = finder.id;
	//looper.frommaster.message('set', 'maxlooper');
	var path = finder.path.slice(0, -1).split(' ').slice(-4, -2)
	//post('request to register', looper_id, finder.path, 'check: ', path, '\n');
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

function handshake(args)
{
	post('registered:', args, '\n');
	registered = 1;
	send_current_settings();
}

function loop(ms, rec_phase)
{	
	//looper.loopui.message('set', 0);
	in_loop = Math.abs(in_loop - 1);
	switch(in_loop)
	{
		case 1:
			if(quantize_record.relative>0)
			{
				looper.relativetimer.message('int', 1);
			}
			begin_loop(rec_phase, ms);
			break;
		case 0:
			end_loop(rec_phase);
			break;
	}
	
}

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
	looper.pokeloop.message('set', dummy);
	looper.groove.message('stop');
	looper.overdubui.message('set', 0);
	make_undo_step();
	loop_start = parseInt(rec_phase * max_time);//ms
	looper.inputui.message('float', 1);
	if(quantize_record.enabled>0)
	{
		if(quantize_record.relative > 0)
		{
			clock_start = ms;
			change_state('recording');
		}
		else if(ms < (position.ms + (quantize_record.ms/2)))//ms
		{
			clock_start = position.ms;
			loop_start = parseInt(position.phase * max_time);  //ms
			change_state('recording');
		}
		else
		{
			position.report = 1;
			change_state('awaiting_record');
		}
	}
	else
	{
		clock_start = ms;
		change_state('recording');
	}
	change_mute(0);
}

function make_undo_step()
{
	undo_data.can = true;
	undo_data.loop_size = loop_size;
	undo_data.clock_start = clock_start;
	looper.bufferundo.message('size', loop_size);
	looper.buffetloop.message('copy_to_buffer', buffer_undo, 0, loop_size - 1);
}

function end_loop(rec_phase)
{
	if(NEW_FORWARD)
	{
		speed = 1;
		looper.groovespeed.message('float', speed);
		looper.speedui.setvalueof(speed);
		if(registered > 0)
		{
			messnamed('looper_master', 'looper_speed', looper_id, looper_number, speed);
		}
	}
	loop_end = parseInt(rec_phase * max_time);
	if(quantize_record.enabled>0)
	{
		change_state('awaiting_record');
		position.report = 1;
	}
	else
	{
		make_loop();
		if(go_to_overdub > 0)
		{
			go_to_overdub = 0;
			looper.overdubui.message('int', 1);
		}
		else if(go_to_mute > 0)
		{
			go_to_mute = 0;
			change_mute(1);
			change_state('muted');
		}
		else
		{
			//change_mute(0);
			change_state('playing');
		}
	}
}
	
function make_loop()
{
	position.report = 0;
	if(loop_end > loop_start)
	{
		loop_size = loop_end - loop_start;//ms
	}
	else
	{
		loop_size = (max_time - loop_start) + loop_end;//ms
	}
	if(quantize_record.enabled>0)
	{
		loop_size = Math.round(loop_size/quantize_record.ms) * quantize_record.ms;//ms
	}
	looper.bufferloop.message('clear');
	looper.bufferloop.message('size', max_time);//ms
	looper.buffetin.message('copy_to_buffer', buffer_loop, 0, max_time - 1);//ms?
	looper.buffetloop.message('rotatetozero', (loop_start));//ms?
	looper.bufferloop.message('crop', 0, loop_size);
	looper.buffetloop.message('rotatetozero', (offset % max_time));
	looper.grooveend.message('float', loop_size);//ms
	looper.groovelength.message('float', loop_size);//ms
	looper.groove.message('startloop');
	//looper.groove.message(offset);//samples, pretty sure
	if(quantize_record.enabled>0)
	{
		messnamed(resync, clock_start,  loop_size);
	}
	if(go_to_mute==0)
	{
		looper.fadein.message('int', 0.);
		looper.fadein.message('list', 1., fadetime);
	}
	looper.pokeloop.message('set', buffer_loop);
	messnamed(ipoke_channel, 2);
}

function loop_phase(val)
{
	phase = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'phase', looper_number, phase);
	}
}

function time(ms, rec_phase)
{
	position.ms = ms;//ms
	position.phase = rec_phase;
	if((position.report == 1)&&(quantize_record.relative<1))
	{
		if(in_loop == 1)
		{
			clock_start = position.ms;
			loop_start = parseInt(position.phase * max_time);
			change_state('recording');
		}
		else
		{
			loop_end = parseInt(position.phase * max_time);
			make_loop();
			if(go_to_overdub > 0)
			{
				looper.overdubui.message('int', 1);
				go_to_overdub = 0;
			}
			else if(go_to_mute > 0)
			{
				go_to_mute = 0;
				change_mute(1);
				change_state('muted');
			}
			else
			{
				change_mute(0);
				change_state('playing');
			}
		}
		position.report = 0;
	}
}

function rel_time(rec_phase)
{
	if((quantize_record.relative>0)&&(position.report>0))
	{
		position.phase = rec_phase;
		loop_end = parseInt(position.phase * max_time);
		make_loop();
		if(go_to_overdub > 0)
		{
			looper.overdubui.message('int', 1);
			go_to_overdub = 0;
		}
		else if(go_to_mute > 0)
		{
			go_to_mute = 0;
			change_mute(1);
			change_state('muted');
		}
		else
		{
			change_mute(0);
			change_state('playing');
		}
		looper.relativetimer.message('int', 0);
		position.report = 0;
	}
}

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
				looper.pokeloop.message('set', buffer_loop);
				messnamed(ipoke_channel, 0);
			}
			else
			{
				if(mute_status==0)
				{
					change_state('playing');
				}
				messnamed(ipoke_channel, 2);
				looper.pokeloop.message('set', dummy);
			}
		}	
	}
}

function clear()
{
	make_undo_step();
	looper.bufferloop.message('clear');
	if(overdub < 1)
	{
		change_state('empty');
	}
}	

function undo()
{
	if(undo_data.can == true)
	{
		messnamed(ipoke_channel, 2);
		looper.pokeloop.message('set', dummy);
		looper.groove.message('stop');
		looper.overdubui.message('set', 0);
		loop_size = undo_data.loop_size;
		looper.bufferloop.message('size', loop_size);
		looper.buffetundo.message('copy_to_buffer', buffer_loop, 0, loop_size -1);
		looper.grooveend.message('float', loop_size);
		looper.groovelength.message('float', loop_size);
		looper.pokeloop.message('set', buffer_loop);
		looper.groove.message('startloop');
		messnamed(resync, undo_data.clock_start,  undo_data.loop_size);
		undo_data.can = false;
	}
}

function reverse(force)
{
	//looper.reverseui.message('set', 0);
	if(force == 0)
	{
		looper.groovespeed.message('float', speed * -1);
		speed = speed * -1;
	}
	else
	{
		change_speed(speed * -1);
	}
}

function change_speed(new_speed)
{
	if(alive>0)
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
		if(registered > 0)
		{
			messnamed('looper_master', 'looper_speed', looper_id, looper_number, speed);
		}
	}
}

function change_inertia(new_inertia)
{
	inertia = new_inertia;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_inertia', looper_id, looper_number, inertia);
	}
}

function set_quantize_amount(menu, ticks, ms, samples)
{
	quantize_record.samples = samples;
	quantize_record.ticks = ticks;
	quantize_record.menu = menu;
	quantize_record.ms = ms;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_quantize_menu',  looper_id, looper_number, menu);
	}
}

function set_quantize_record(val)
{
	quantize_record.enabled = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_quantize_status', looper_id, looper_number, val);
	}
}

function set_offset(new_offset)
{
	if(loop_size>0)
	{
		var rotate = ((new_offset - offset) + loop_size) % loop_size;
		looper.buffetloop.message('rotatetozero', rotate);
	}
	offset = new_offset;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_offset', looper_id, looper_number, offset);
	}
}

function set_fade_time(new_fade_time)
{
	fadetime = new_fade_time;
}
	
function set_relative_record(val)
{
	//post('relative', val, '\n');
	quantize_record.relative = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_relative_status', looper_id, looper_number, val);
	}
}
			
function send_current_settings()
{
	messnamed('looper_master', 'current_settings', looper_id, looper_number, phase, state, speed, overdub, parseInt(quantize_record.enabled), parseInt(quantize_record.menu), offset, mute_status, fb_lvl, in_lvl, inertia);
}

function input_level(level)
{
	in_lvl = level;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_input', looper_id, looper_number, in_lvl);
	}
}

function feedback_level(level)
{
	fb_lvl = level;
	//looper.pokeloop.message('overdub', fb_lvl * .99);
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
	//post('change_mute', val, '\n');
	mute_status = val;
	looper.volout.message('float', Math.abs(val-1));
}

function set_mute(status)
{
	//post('set_mute', status, '\n');
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

function change_state(val)
{
	state = val;
	if(registered > 0)
	{
		messnamed('looper_master', 'looper_state', looper_id, looper_number, state);
	}
}
	
function distribute(func, val) 
{
	//post('func',func, 'val', val, '\n');
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
		case 'undo':
			//looper.undoui.message('bang');
			break;		
		case 'mute':
			mute();
			break;
		case 'set_mute':
			change_mute(val);
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
				looper.groove.message('stop');
				looper.groove.message('float', Math.min(val*(loop_size/16), loop_size-1));
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
		default:
			post('not recognized', func, val, '\n');
	}
}

function copy_buffer_to_destination(dest)
{
	looper.copybuffer.message('set', dest);
	looper.copybuffer.message('size', loop_size, 2);
	looper.buffetloop.message('copy_to_buffer', dest, 0, loop_size-1);
	looper.copybuffer.message('set', dummy);
}

function gen_loop(len)
{
	make_undo_step();
	bufferloop.message('size', len*quantize_record.ms);
	tape_mode(1);
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
	
