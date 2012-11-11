//binary_steppr, aka Hexadecimal
//by amounra
//aumhaa@gmail.com --- http://www.aumhaa.com


/*This script is the result of collaboration with Peter Nyboer @ Livid Instruments and 
represents a great deal of effort to gain some speed and stability from the original Steppr
without sacrificing too much readability.  The majority of the functionality for the entire patch 
can be modified in this js or the accompanying poly~ object, "steppr_wheel", without ever opening 
the actual containing patch in the m4l editor (this is crucial for speeding up the development process).  
Because of this, the functionality of the patch can be radically altered merely by modifying the 
poly~ or adding some lines of code in to this js.  As an example, the poly~ used as the base for 
this patch is only a slightly modified version of the "binary" mod (from Monomodular), and the 
majority of processes in this script are maintained between both versions.*/

/*It should be noted that many of the processes used in "binary" are still available and unused 
in this script, offering some excellent prospects for future development of this mod.*/

autowatch = 1;

DEBUG = 0;
DEBUG_LCD = 0;
DEBUG_PTR = 0;
DEBUG_STEP = 0;
DEBUG_BLINK = 0;
DEBUG_REC = 0;
DEBUG_LOCK = 0;
FORCELOAD = 0;

outlets = 4;
inlets = 5;

var unique = jsarguments[1];

//this array contains the scripting names of objects in the top level patcher.	To include an new object to be addressed 
//in this script, it's only necessary to add its name to this array.  It can then be addressed as a direct variable
const Vars = ['poly', 'pipe', 'selected_filter', 'step', 'storepattr', 'storage', 'preset_selector', 'padgui', 'padmodegui', 'keygui', 'keymodegui', 'repeatgui', 
			'rotleftgui', 'rotrightgui', 'notevaluesgui', 'notetypegui', 'stepmodegui', 'keymodeadv', 'Groove', 'Random', 'Channel', 'Mode', 'PolyOffset', 
			'timeupgui', 'timedngui', 'pitchupgui', 'pitchdngui', 'transposegui', 'playgui', 'recgui', 'directiongui', 'lockgui','lockgui',
			'Speed1', 'Speed2', 'Speed3', 'Speed4', 'Speed5', 'Speed6', 'Speed7', 'Speed8', 'Speed9', 'Speed10', 'Speed11', 'Speed12', 'Speed13', 'Speed14', 'Speed15', 'Speed16',
			'rotgate'];

//this array contains the scripting names of objects in each of the polys.	To include an new object to be addressed 
//in the poly, it's only necessary to add its name to this array.  It can then be addressed as part[poly number].obj[its scripting name]
const Objs = ['pattern', 'duration', 'velocity', 'quantize', 'swing', 'phasor', 'steps', 'channel', 'active', 'direction', 'clutch', 'offset', 'ticks',
				'notevalues', 'notetype', 'nudge', 'noteoffset', 'repeat', 'repeatenable', 'note', 'channelpattr', 
				'random', 'behavior', 'restart', 'swingpattr', 'addnote', 'patterncoll', 'rulebends', 'mode', 'polyenable', 'polyplay', 'polyoffset'];  //reinstate when poly is done	//'note', 'notes'
const Modes=[4, 2, 3, 5, 1];
const RemotePModes=[0, 1, 4];
const Funcs = ['stepNote', 'stepVel', 'stepDur', 'stepExtra1', 'stepExtra2'];
const default_pattern = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
const default_step_pattern = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
const default_duration = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
const default_note = [[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]];
const default_velocity = [100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100];
const empty = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
const modes = [[0, 2, 4, 5, 7, 9, 11, 12], [0, 2, 3, 5, 7, 9, 10, 12], [0, 1, 3, 5, 7, 8, 10, 12], [0, 2, 4, 6, 7, 9, 11, 12], [0, 2, 4, 5, 7, 9, 10, 12], [0, 2, 3, 5, 7, 8, 10, 12], [0, 1, 3, 5, 6, 8, 10, 12]];
const Colors = [0, 1, 2, 3, 4, 5, 6, 127];
const StepColors = [127, 3, 3, 3, 127, 3, 3, 3, 127, 3, 3, 3, 127, 3, 3, 3 ];
const SelectColors = [1, 5, 4, 6];
const AddColors = [6, 1];
const Blinks=[-1, 2];
const TRANSLATE = [{'note':'128n', 'ticks':15, 'speed':1, 'notevalue': 0, 'notetype': 0},
			 {'note':'64n','ticks':30, 'speed':2, 'notevalue':1, 'notetype':0}, 
			{'note':'32nt','ticks':40, 'speed':3, 'notevalue':2, 'notetype':2}, 
			{'note':'64nd','ticks':45, 'speed':4, 'notevalue':1, 'notetype':1}, 
			{'note':'32n','ticks':60, 'speed':5, 'notevalue':2, 'notetype':0},
			{'note':'16nt','ticks':80, 'speed':6, 'notevalue':3, 'notetype':2}, 
			{'note':'32nd','ticks':90, 'speed':7, 'notevalue':2, 'notetype':1},
			{'note':'16n', 'ticks':120, 'speed':8, 'notevalue':3, 'notetype':0},
			{'note':'8nt', 'ticks':160, 'speed':9, 'notevalue':4, 'notetype':2},
			{'note':'16nd', 'ticks':180, 'speed':10, 'notevalue':3, 'notetype':1}, 
			{'note':'8n', 'ticks':240, 'speed':11, 'notevalue':4, 'notetype':0},
			{'note':'4nt', 'ticks':320, 'speed':12, 'notevalue':5, 'notetype':2},
			{'note':'8nd', 'ticks':360, 'speed':13, 'notevalue':4, 'notetype':1}, 
			{'note':'4n', 'ticks':480, 'speed':14, 'notevalue':5, 'notetype':0},
			{'note':'2nt', 'ticks':640, 'speed':15, 'notevalue':6, 'notetype':2},
			{'note':'4nd', 'ticks':720, 'speed':16, 'notevalue':5, 'notetype':1}, 
			{'note':'2n', 'ticks':960, 'speed':17, 'notevalue':6, 'notetype':0},
			{'note':'1nt', 'ticks':1280, 'speed':18, 'notevalue':7, 'notetype':2},
			{'note':'2nd', 'ticks':1440, 'speed':19, 'notevalue':6, 'notetype':1},
			{'note':'1n', 'ticks':1920, 'speed':20, 'notevalue':7, 'notetype':0}, 
			{'note':'1nd', 'ticks':2880, 'speed':21, 'notevalue':7, 'notetype':1}];

const TRANS = [[15, 15, 15], [30, 30, 30], [60, 45, 80], [120, 180, 80], [240, 360, 160], [480, 720, 320], [960, 1440, 640], [1920, 2880, 1280]];

/*Naming the js instance as script allows us to create scoped variables 
(properties of js.this) without specifically declaring them with var
during the course of the session. This allows dynamic creation of 
objects without worrying about declaring them beforehand as globals
presumably gc() should be able to do its job when the patch closes, or 
if the variables are redclared.	 I'd love to know if this works the 
way I think it does.*/
var script = this;
var autoclip;

var part =[];

//var live_set;
//var song_tempo = 120;

var alive=0;
var step_mode = 0;
var pad_mode = 0;
var key_mode = 0;
var solo_mode = 0;
var last_mode = 1;
var last_key_mode = 0;
var last_pad_mode = 0;
var locked = 0;
//var play_mode = 0;

var selected;
var presets = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var devices = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var preset = 0;
var last_mask = 0;
var global_offset = 0;
var global_chain_offset = 0;
var pad_invoked_key_mode = 3;
var timing_immediate = 0;
var transpose_steps = 1;
var record_enabled = 0;
var play_enabled = 0;
var randomize_global = 0;
var last_blink = 0;
var rot_length = 4;
var step_value = [];
var key_pressed = -1;
var pad_pressed = -1;
var current_step = 0;
var autoclip;


/*/////////////////////////////////////////
///// script initialization routines //////
/////////////////////////////////////////*/


/*	VERY IMPORTANT!! : This code utilizes a naming convention for private functions:  any function 
preceeded by an underscore is considered private, but will have a public property reference	 
assigned to it AFTER the script has received an initiallization call from mod.js.  That means that any 
function that shouldn't be accessed before initialization can be created as a private function without 
the need to use an internal test to find out whether the script has init()ed.  

Example:

If we create _private_function(), and before init a call from max comes in to private_function(), that call 
will be funneled to anything().	 After init(), however, all calls to private_function() will be forwarded to 
_private_function().

Note:  It is best to only address these private functions by their actual names in the script, since calling aliased 
names will not be routed to anything()*/

//called when mod.js is finished loading for the first time
function init(val)
{
	if(val>0)
	{
		//live_set = new LiveAPI(this.patcher, cb_tempo, 'live_set');
		//live_set.property = 'tempo';
		if(DEBUG){post('hex init\n');}
		for(var i in Vars)
		{
			script[Vars[i]] = this.patcher.getnamed(Vars[i]);
		}
		for(var i = 0; i < 16; i++)
		{
			var poly_num = i;
			//storage.message('priorty', 'poly.'+(poly_num+1), 'tickspattr', 10);
			storage.message('priorty', 'poly.'+(poly_num+1),  'notetypepattr', 11);
			storage.message('priorty', 'poly.'+(poly_num+1),  'notevaluepattr', 12);
			part[i] = {'n': 'part', 'num':i, 'nudge':0, 'offset':0, 'channel':0, 'len':16, 'start':0, 
						'jitter':0, 'active':1, 'swing':.5, 'lock':1, 'ticks':480, 'notevalues':5, 'notetype':0, 
						'pushed':0, 'direction':0, 'root':i, 'octave':0, 'add':0, 'quantize':1, 'repeat':6, 
						'random':0, 'note':i, 'steps':15, 'mode':0, 'polyenable':0, 'polyoffset':0, 'mode':0};//'speed':480,'notevalue':'4n'
			part[i].num = parseInt(i);
			part[i].pattern = default_pattern.slice();
			part[i].step_pattern = default_step_pattern.slice();
			part[i].duration = default_duration.slice();
			part[i].velocity = default_velocity.slice();
			part[i].behavior = default_pattern.slice();
			part[i].rulebends = default_pattern.slice();
			part[i].note = default_pattern.slice();
			part[i].obj = [];
			part[i].triggered = [];
			part[i].held = [];
			part[i].hold = 0;
			for(var j in Objs)
			{
				part[i].obj[Objs[j]] = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed(Objs[j]);
			}
			part[i].funcs = make_funcs(part[i]);
			//part[i].notes_assignment = part[i].obj.notes.getvalueof();
			//part[i].note = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			//part[i].note = default_note.slice();
			//part[i].note = i;
		}
		script.rulemap = this.patcher.getnamed('settings').subpatcher().getnamed('rulemap');
		this.patcher.getnamed('poly').message('target', 0);
		selected_filter.message('offset', 1);
		autoclip = new LiveAPI(callback, 'live_set');
		//step_value = step.getvalueof();
		//step.message('target_seq', 1);
		//step.message('active', 1);
		step.message('int', 1);
		messnamed(unique+'restart', 1);
		selected = part[0];
		for(var i in script)
		{
			if((/^_/).test(i))
			{
				script[i.replace('_', "")] = script[i];
			}
		}
		//messnamed(unique+'restart', 0);
		alive = 1;
		clear_surface();
		//init_poly();
		//update_gui();
		storage.message('recall', 1);
		//change_key_mode(0);
		//change_pad_mode(0);
		init_device();
		select_pattern(0);
		var i=3;do{
			outlet(0, 'to_wheel', i, 2, 'mode', 0);
		}while(i--);
		post("Hex initialized.\n");
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

//called by init to initialize state of polys
function init_poly()
{	 
	//poly.message('target', 0);
	outlet(0, 'batch', 'grid', 0);
	for(var i=0;i<16;i++)
	{
		part[i].obj.quantize.message('int', part[i].quantize);
		part[i].obj.active.message('int', part[i].active);
		part[i].obj.swing.message('float', part[i].swing);
		part[i].obj.ticks.message(part[i].ticks);
		part[i].obj.phasor.lock = 1;
		part[i].obj.polyenable.message('int', part[i].polyenable);
		part[i].obj.phasor.message('float', 0);
		part[i].obj.noteoffset.message('int', (part[i].octave *12) + part[i].root);
		part[i].obj.pattern.message('list', part[i].pattern);
		part[i].obj.note.message('list', part[i].note);
		part[i].obj.velocity.message('list', part[i].velocity);
		part[i].obj.duration.message('list', part[i].duration);
		part[i].obj.notetype.message('int', part[i].notetype);
		part[i].obj.notevalues.message('int', part[i].notevalues);
		part[i].obj.channel.message('int', part[i].channel);
		//update_note_pattr(part[i]);
		
	}
}

//called by init to initialize state of gui objects
function _clear_surface()
{
	if(DEBUG){post('clear_surface\n');}
	stepmodegui.message('int', 0);
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
	alive=0;
	post('Hex dissolved.\n');	   
}


/*/////////////////////////////////
///// api callbacks and input /////
/////////////////////////////////*/


//main input sorter
function anything()
{
	var args = arrayfromargs(arguments);
	//post('anything', messagename, arguments, '\n');
	switch(messagename)
	{
		case 'settingsgui':
			switch(args[0])
			{
				case 0:
					pad_invoked_key_mode = args[1];
					break;
				case 1:
					timing_immediate = args[1];
					break;
				case 2:
					global_chain_offset = args[1];
					break;
				case 4:
					transpose_steps = args[1];
					break;
			}
			break;
		case 'guibuttons':
			switch(args[0])
			{
				case 10:
					pad_mode = args[1];
					break;
				case 11:
					key_mode = args[1];
					break;
				case 12:
					global_offset = (Math.max(Math.min(args[1], 96), 0));
					break;
				case 14:
					locked = args[1];
					break;
			}
			break;			
		default:
			if(DEBUG){post('anything', args, '\n');}
			break;
	}
}

//distribute presses received from mod.js
function button_in(x, y, val)
{
	if(DEBUG){post('button_in', x, y, val, '\n');}
	switch(y)
	{
		case 0:
			switch(x)
			{
				case 0:
					if(pad_pressed<0){
						if(selected.lock==0){
							change_lock_status(selected, 0);
						}
						else{
							timedngui.message('int', val);
						}
					}
					else if(val>0){
						notetypegui.message('int', Math.max(0, Math.min(selected.notetype+1, 3)));
					}
					break;
				case 1:
					if(pad_pressed<0){
						if(selected.lock==0){
							change_lock_status(selected, 1);
						}
						else{
							timeupgui.message('int', val);
						}
					}
					else if(val>0){
						notetypegui.message('int', Math.max(0, Math.min(selected.notetype-1, 3)));
					}
					break;
				case 2:
					if(pad_pressed<0){
						pitchdngui.message('int', val);
					}
					else if(val>0){
						recgui.message('bang');
					}
					break;
				case 3:
					if(pad_pressed<0){
					pitchupgui.message('int', val);
					}
					else if(val>0){
						playgui.message('bang');	
					}
					break;
			}
			break;
		case 1:
			switch(x)
			{
				case 0:
					/*if((pad_mode!=6)&&(key_mode!=6))
					{
						if(pad_pressed<0){
							repeatgui.message('int', val);
						}
						else if(val>0){
							directiongui.message('int', (selected.direction+1)%3);
						}
					}
					else
					{
						//post('pad mode is 6\n');
						if(val>0)
						{
							selected.hold = Math.abs(selected.hold-1);
							//post('val is > 0, selected.hold ==', selected.hold, '\n');
							outlet(0, 'button', 0, 2, selected.hold);
							if(selected.hold<1)
							{
								release_held_sequences(selected);
							}
						}
						if(pad_mode == 6)
						{
							refresh_grid();
						}
						if(key_mode == 6)
						{
							refresh_keys();
						}
					}*/
					repeatgui.message('int', val);
					break;
				case 1:
					keymodeadv.message('int', val);
					break;
				case 2:
					if(pad_pressed<0){
						rotleftgui.message('int', val);
					}
					else if(val>0){
						stepmodegui.message('int', Math.max(0, Math.min(3, step_mode-1)));
					}
					break;
				case 3:
					if((pad_mode!=6)&&(key_mode!=6))
					{
						if(pad_pressed<0){
							rotrightgui.message('int', val);
						}
						else if(val>0){
							stepmodegui.message('int', Math.max(0, Math.min(3, step_mode+1)));
						}
					}
					else
					{
						//post('pad mode is 6\n');
						if(val>0)
						{
							selected.hold = Math.abs(selected.hold-1);
							//post('val is > 0, selected.hold ==', selected.hold, '\n');
							outlet(0, 'button', 3, 2, selected.hold);
							if(selected.hold<1)
							{
								release_held_sequences(selected);
							}
						}
						if(pad_mode == 6)
						{
							refresh_grid();
						}
						if(key_mode == 6)
						{
							refresh_keys();
						}
					}
					break;
			}
			break;
	}	 
}

//distribute presses received from mod.js
function grid_in(x, y, val)
{
	switch(pad_mode)
	{
		default:
			if((val>0)&&(pad_pressed<0))
			{
				pad_pressed = x + (y*4);
				select_pattern(pad_pressed);
				last_key_mode = key_mode;
				pipe.message('int', pad_pressed);
			}
			else if((x + (y*4) == pad_pressed)&&(val<1))
			{
				pad_pressed = -1;
				change_key_mode(last_key_mode);
			}
			else
			{
				var slave = part[x + (y*4)];
				sync_wheels(selected, slave);
				/*slave.notetype = selected.notetype;
				slave.notevalues = selected.notevalues;
				slave.obj.notetype.message('int', slave.notetype);
				slave.obj.notevalues.message('set', slave.notevalues);
				slave.obj.restart.message('bang');*/
			}
			break;
		case 1:
			if(val>0)
			{
				var p = x+(y*4);
				add_note(part[p]);
				if(p != selected.num)
				{
					select_pattern(p);
				}
			}
			else if((x + (y*4) == pad_pressed)&&(val<1))
			{
				pad_pressed = -1;
				change_key_mode(last_key_mode);
			}
			break;
		case 2:
			var num = x + (y*4);
			if(val>0)
			{
				part[num].active = Math.abs(part[num].active-1);
				part[num].obj.active.message('int', part[num].active);
				refresh_grid();
				if(key_mode==0){refresh_keys();}
				add_automation(part[num], 'mute', part[num].active);
			}
			break;
		case 3:
			var num = x + (y*4);
			if(val>0)
			{
				if(!locked)
				{
					storage.message('store', 'poly.'+(selected.num+1), presets[selected.num]);
				}
				presets[selected.num] = num+1;
				storage.message('recall', 'poly.'+(selected.num+1), presets[selected.num]);
				add_automation(selected, 'preset', presets[selected.num]);
			}
			break;
		case 4:
			var num = x + (y*4);
			if(val>0)
			{
				if(!locked)
				{
					storage.message('store', 'poly.'+(selected.num+1), presets[selected.num]);
				}
				for(var i=0;i<16;i++)
				{
					presets[i] = num+1;
				}
				storage.message(presets[selected.num]);
			}
			break;
		case 6:
			//post('pad_play', x, y, val);
			var num = x + (y*4);
			if(val>0)
			{
				var trig = selected.triggered.indexOf(num);
				if(trig == -1)
				{
					selected.triggered.push(num);
					selected.obj.polyplay.message('midinote', num, val);
				}
				else
				{
					var held = selected.held.indexOf(num);
					if(held > -1)
					{
						//remove from the held array since a new sequence has been triggered
						selected.held.splice(held, 1);
					}
				}
			}
			else
			{
				if(selected.hold == 0)
				{
					var trig = selected.triggered.indexOf(num);
					if(trig > -1)
					{
						selected.triggered.splice(trig, 1);
					}
					selected.obj.polyplay.message('midinote', num, val);
				}
				else
				{
					//add to the held array, so that when hold for part is turned off the note can be flushed
					selected.held.push(num);
				}
			}
			//part[num].obj.polyenable.message('int', part[num].polyenable);
			refresh_grid();
			break;
	}
}

//from mod.js
function key_in(num, val)
{
	if(DEBUG){post('key in', num, val, '\n');}
	if((num>15)&&(val>0))
	{
		num -= 16;
		selected.pattern[num] = Math.abs(selected.pattern[num]-1);
		selected.obj.pattern.message('list', selected.pattern);
		step.message('extra1', 1, selected.pattern);
		step.message('zoom', 1, 1);
		refresh_keys();
		outlet(0, 'to_wheel', selected.num%4, Math.floor(selected.num/4)%2, 'custom', 'x'+(selected.pattern.join('')));
	}	 
	else
	{
		switch(key_mode)
		{
			default:
				if(val>0)
				{
					part[num].active = Math.abs(part[num].active-1);
					part[num].obj.active.message('int', part[num].active);
					refresh_keys();
					if(pad_mode==2){refresh_grid();}
					add_automation(part[num], 'mute', part[num].active);
				}
				break;
			case 1:
				if((key_pressed == num)&&(val==0))
				{
					key_pressed = -1;
				}
				if((key_pressed < 0)&&(val>0)&&(num>=selected.nudge))
				{
					key_pressed = num;
					change_Out(num);
					//step.message('loop', parseInt(selected.nudge+1), parseInt(key_pressed+1));
				}
				else if((key_pressed > -1)&&(val>0)&&(num<=key_pressed))
				{
					change_In(num);
					//step.message('loop', num, parseInt(key_pressed+1))
				}
				update_step();
				refresh_keys();
				break;
			case 2:
				if(val>0)
				{
					selected.behavior[num] = (selected.behavior[num]+1)%8;
					part[selected.num].obj.behavior.message('list', selected.behavior);
					update_step();
					refresh_keys();
					break;
				}
			case 3:
				if(val>0)
				{
					if(!locked)
					{
						storage.message('store', 'poly.'+(selected.num+1), presets[selected.num]);
					}
					presets[selected.num] = num+1;
					storage.message('recall', 'poly.'+(selected.num+1), presets[selected.num]);
					add_automation(selected, 'preset', presets[selected.num]);
				}
				break;
			case 4:
				if(val>0)
				{
					if(!locked)
					{
						storage.message('store', 'poly.'+(selected.num+1), presets[selected.num]);
					}
					for(var i=0;i<16;i++)
					{
						presets[i] = num+1;
					}
					storage.message(presets[selected.num]);
				}
				break;
			case 5:
				if(val>0)
				{
					//post('new note', current_step, num, '\n');
					selected.note[current_step] = num;
					selected.obj.note.message('list', selected.note);
					//post('new notes:', selected.obj.note.getvalueof());
					step.message('pitch', 1, selected.note);
					selected.pattern[current_step] = 1;
					selected.obj.pattern.message('list', selected.pattern);
					step.message('extra1', 1, selected.pattern);
					step.message('zoom', 0, 16);
					refresh_keys();
				}
				break;	
			case 6:
				//post('pad_play', x, y, val);
				if(val>0)
				{
					var trig = selected.triggered.indexOf(num);
					//if the num wasn't already being held
					if(trig == -1)
					{
						selected.triggered.push(num);
						selected.obj.polyplay.message('midinote', num, 1);
					}
					else
					{
						//find out if num has already been played
						var held = selected.held.indexOf(num);
						if(held > -1)
						{
							//remove from the held array since a new sequence has been triggered
							selected.held.splice(held, 1);
							selected.obj.polyplay.message('midinote', num, 0);
							var trig = selected.triggered.indexOf(num);
							if(trig > -1)
							{
								selected.triggered.splice(trig, 1);
							}
						}
					}
				}
				else
				{
					if(selected.hold == 0)
					{
						var trig = selected.triggered.indexOf(num);
						if(trig > -1)
						{
							selected.triggered.splice(trig, 1);
						}
						selected.obj.polyplay.message('midinote', num, 0);
					}
					else
					{
						//add to the held array, so that when hold for part is turned off the note can be flushed
						selected.held.push(num);
					}
				}
				//part[num].obj.polyenable.message('int', part[num].polyenable);
				refresh_keys();
		}
	}
}

//this is mainly for the select-hold
function _msg_int(val)
{
	if(DEBUG){post('msg_int', args, '\n');}
	if((inlet==2)&&(pad_pressed==val))
	{
		change_key_mode(pad_invoked_key_mode);
	}
}

//this sorts key and grid input
function _list()
{
	var args=arrayfromargs(arguments);
	switch(inlet)
	{
		case 0:
			grid_in(args[0], args[1], args[2]);
			break;
		case 1:
			key_in(args[0], args[1]);
			break;
	}
}

//this sorts encoderbutton presses
function _button(x, y, val)
{
	var args = arrayfromargs(arguments);
	button_in(x, y, val);
}

//called by gui object, sets visible portion of live.step
function _mode(val)
{
	step_mode = val;
	step.message('mode', Modes[step_mode]);
}

//from live.step	
function _step_in()
{
	var args = arrayfromargs(arguments);
	if(DEBUG_STEP){post('step_in', args, '\n');}
	switch(args[0])
	{
		case 0:
			break;
		case 1:
			break;
		case 2:
			switch(args[1])
			{
				case 'changed':
					var new_value = step.getvalueof();
					outlet(3, step_value);
					if(DEBUG_STEP){post('old', step_value);} 
					outlet(2, new_value);
					break;
			}
		case 3:
			break;
	}
}

//distributes input from gui button and menu elements
function _guibuttons(num, val)
{
	if(DEBUG){post('gui_buttons', num, val, '\n');}
	switch(num)
	{
		case 0:
			//selected.obj.repeatenable.message('int', parseInt(val));
			//padmodegui.message('int', (pad_mode+1)%7);
			padmodegui.message('int', RemotePModes[Math.max((RemotePModes.indexOf(pad_mode)+1)%3, 0)]);
			break;
		case 1:
			/*if((pad_mode!=0)&&(pad_pressed<0))
			{
				padmodegui.message('int', 0);
				pad_pressed = -1;
			}
			else if(pad_pressed>-1)
			{
				padmodegui.message('int', RemotePModes[Math.max((RemotePModes.indexOf(pad_mode)+1)%4, 0)]);
			}
			else
			{
				keymodegui.message('int', (key_mode+1)%7);
			}*/
			keymodegui.message('int', (key_mode+1)%7);
			break;
		case 2:
			rotate_pattern(selected, rot_length, -1);
			break;
		case 3:
			rotate_pattern(selected, rot_length, 1);
			break;
		case 4:
			if(selected.lock==0)
			{
				//change_lock_status(selected, 0);
				selected.lock = 1;
				selected.obj.quantize.message('int', 1);
				outlet(0, 'to_wheel', num%4, Math.floor(num/4)%2, 'green', 1);
			}
			selected.notevalues = val;
			if(timing_immediate)
			{
				selected.obj.notevalues.message('int', val);
			}
			else
			{
				selected.obj.notevalues.message('set', val);
				selected.obj.restart.message('bang');
			}
			script['Speed'+(selected.num+1)].message('set', TRANS[selected.notevalues][selected.notetype]);
			break;
		case 5:
			if(selected.lock==0)
			{
				//change_lock_status(selected, 1);
				selected.lock = 1;
				selected.obj.quantize.message('int', 1);
				outlet(0, 'to_wheel', num%4, Math.floor(num/4)%2, 'green', 1);
			}
			selected.notetype = val;
			if(timing_immediate)
			{
				selected.obj.notetype.message('int', val);
				selected.obj.notevalues.message('int', selected.notevalues);
			}
			else
			{
				selected.obj.notetype.message('int', val);
				selected.obj.restart.message('bang');
			}
			script['Speed'+(selected.num+1)].message('set', TRANS[selected.notevalues][selected.notetype]);
			break;
		case 6:
			notevaluesgui.message('int', Math.max(Math.min(8, selected.notevalues+1), 0));
			break;
		case 7:
			notevaluesgui.message('int', Math.max(Math.min(8, selected.notevalues-1), 0));
			break;
		case 8:
			change_transpose(Math.max(Math.min(global_offset - transpose_steps, 96), 0));
			break;
		case 9:
			change_transpose(Math.max(Math.min(global_offset + transpose_steps, 96), 0));
			break;
		case 10:
			change_pad_mode(val);
			break;
		case 11:
			change_key_mode(val);
			break;
		case 12:
			change_transpose(val);
			break;
		case 13:
			selected.direction = val;
			selected.obj.direction.message('int', val);
			break;
		case 14:
			if(DEBUG){post('lock', val, '\n');}
			locked = val;
			break;
		case 15:
			detect_devices();
			break;
		case 16:
			record(val);
			break;
		case 17:
			play_enabled = val;
			locked = 1;
			break;
	}
}

//distributes input from gui grid element
function _padgui_in(val)
{
	if(DEBUG){post('padguiin', val, '\n');}
	grid_in(val%4, Math.floor(val/4), 1);
	grid_in(val%4, Math.floor(val/4), 0);
}

//distributes input from gui key element
function _keygui_in(val)
{
	if(DEBUG){post('keyguiin', val, '\n');}
	key_in(val, 1);
	key_in(val, 0);
	
}

//displays played notes on grid
function _blink(val)
{
	if(DEBUG_BLINK){post('blink', val, '\n');}
	outlet(0, 'mask', 'key', last_mask + 16, -1);
	outlet(0, 'mask', 'key', val + 16, 5); 
	last_mask = val;
}

//displays played notes on keys
function _vblink(num, val)
{
	if(DEBUG_BLINK){post('vblink', val, '\n');}
	if(key_mode==0)
	{
		outlet(0, 'mask', 'key', num, val);
	}
	outlet(0, 'mask', 'grid', num%4, Math.floor(num/4), Blinks[Math.floor(val>0)]);
}

//evaluate and distribute data recieved from the settings menu
function _settingsgui(num, val)
{
	switch(num)
	{
		case 0:
			pad_invoked_key_mode = val;
			break;
		case 1:
			timing_immediate = val;
			break;
		case 2:
			global_chain_offset = val;
			_select_chain(selected.num);
			break;
		case 3:
			break;
		case 4:
			transpose_steps = val;
			break;
		case 5:
			randomize_pattern(randomize_global);
			break;
		case 6:
			randomize_velocity(randomize_global);
			break;
		case 7:
			randomize_duration(randomize_global);
			break;
		case 8:
			randomize_behavior(randomize_global);
			break;
		case 9:
			randomize_rulebends(randomize_global);
			break;
		case 10:
			reset_data(randomize_global);
			break;
		case 12:
			randomize_global = val;
			break;
		case 11:
			randomize_pattern(randomize_global);
			randomize_velocity(randomize_global);
			randomize_duration(randomize_global);
			randomize_behavior(randomize_global);
			randomize_rulebends(randomize_global);
			break;
		case 13:
			randomize_rules();
			break;
	}
}

//distribute MIDI remote control assignments to their destination
function _remote(num, val)
{
	switch(num<16)
	{
		case 0:
			grid_in(num%4, Math.floor(num/4), 1);
			break;
		case 1:
			key_in(num-16, val);
			break;
	}
}

//distribute 
function _receive_automation(num, val)
{
	if((play_enabled>0)&&(num>110)&&(val!==0))
	{
		num-=111;
		if(DEBUG_REC){post('receive auto:', num, val, '\n');}
		if(val>9)
		{
			presets[part[num].num] = val-10;
			if(DEBUG_REC){post('preset change:', part[num].num+1, presets[part[num].num], '\n');}
			storage.message('recall', 'poly.'+(part[num].num+1), presets[part[num].num]);
		}
		else if(val>0)
		{
			part[num].active = val-1;
			part[num].obj.active.message('int', part[num].active);
			if(pad_mode==2)
			{
				refresh_grid();
			}
			if(key_mode==0)
			{
				refresh_keys();
			}
		}
	}
}


/*/////////////////////////////
///// data syncronization /////
/////////////////////////////*/


//called by pattr when it recalls a preset
function _recall()
{	 
	if(DEBUG_PTR){post('recall\n');}
	for(var item in Objs)
	{
		selected[Objs[item]]=selected.obj[Objs[item]].getvalueof();
		//post(Objs[item], typeof(selected[Objs[item]]), 'retrieving...\n');
	}
	selected.nudge = Math.floor(selected.obj.nudge.getvalueof());
	selected.steps = Math.floor(selected.obj.steps.getvalueof());
	selected.root = Math.floor(selected.obj.noteoffset.getvalueof()%12);
	selected.octave = Math.floor(selected.obj.noteoffset.getvalueof()/12);
	var i=15;do{
		part[i].active = part[i].obj.active.getvalueof();
		part[i].quantize = part[i].obj.active.getvalueof();
		//script['Speed'+(i+1)].message('set', part[i].ticks);
		update_speed(part[i]);
	}while(i--);
	update_step();
	refresh_keys();
	refresh_grid();
	update_gui();
	if(key_mode>4)
	{
		var i=7;do{
			outlet(0, 'to_wheel', i%4, Math.floor(i/4), 'custom', 'x'+(part[i+(8*(selected.num>7))].pattern.join('')));
		}while(i--);
	}
	//select_pattern(selected.num);
	//refresh_edit_view();
	//refresh_dials();
	//refresh_lcd();
}

//
///this is how we inject the data to the poly~ objects:
function make_funcs(part)
{
	new_part = [];
	new_part.stepLoop = function(In, Out)
	{
		if(DEBUG_STEP){post('step Loop', In, Out, '\n');}
		selected.nudge = In;
		selected.obj.nudge.message('set', selected.nudge);
		selected.steps = Out - In;
		selected.obj.steps.message('int', selected.steps);
		selected.obj.restart.message('bang');
		refresh_keys();
	}
	new_part.stepDir = function(step, val)
	{
		if(DEBUG_STEP){post('step Dir', step, val, '\n');}
		part.direction = val;
		part.obj.direction.message('int', val);
	}
	new_part.stepNote = function(step, val)
	{
		if(DEBUG_STEP){post('step note', step, val, '\n');}
		part.note[step] = val;
		part.obj.note.message('list', part.note);
	}
	new_part.stepVel = function(step, val)
	{
		if(DEBUG_STEP){post('step vel', step, val, '\n');}
		part.velocity[step] = val;
		part.obj.velocity.message('list', part.velocity);
	}
	new_part.stepDur = function(step, val)
	{
		if(DEBUG_STEP){post('step dur', step, val, '\n');}
		part.duration[step] = val;
		part.obj.duration.message('list', part.duration);
	}
	new_part.stepExtra1 = function(step, val)
	{
		if(DEBUG_STEP){post('step extra1', step, val, '\n');}
		part.pattern[step] = val;
		part.obj.pattern.message('list', part.pattern);
		refresh_keys();
	}
	new_part.stepExtra2 = function(step, val)
	{
		if(DEBUG_STEP){post('step extra2', step, val, '\n');}
		part.rulebends[step] = val;
		part.obj.rulebends.message('list', part.rulebends);
	}		 
	return new_part
}

//called to update data in live.step when changes are made to poly
function update_step()
{
	step_value = step.getvalueof();
	if(DEBUG_STEP){post('update step: step_value', step_value.length, '\n', step_value, '\n');}
	selected.nudge = parseInt(selected.obj.nudge.getvalueof());
	selected.steps = parseInt(selected.obj.steps.getvalueof());
	step_value[5] = Math.floor(selected.nudge);
	step_value[6] = Math.floor(selected.nudge) + Math.floor(selected.steps) + 1;
	selected.pattern = selected.obj.pattern.getvalueof();
	selected.velocity = selected.obj.velocity.getvalueof();
	selected.duration = selected.obj.duration.getvalueof();
	selected.behavior = selected.obj.behavior.getvalueof();
	selected.rulebends = selected.obj.rulebends.getvalueof();
	selected.note = selected.obj.note.getvalueof();
	var i=15;do{
		var s = 11 + (i*5);
		step_value[s] = selected.note[i];
		step_value[s + 1] = selected.velocity[i];
		step_value[s + 2] = selected.duration[i];
		step_value[s + 3] = selected.pattern[i];
		step_value[s + 4] = selected.rulebends[i];
	}while(i--);
	if(DEBUG_STEP){post('to step', step_value.length, '\n', step_value, '\n');}
	step.setvalueof(step_value);
}

//called to update data in poly when changes are made in livestep
function update_poly()
{
	var args = arrayfromargs(arguments);
	step_value = step.getvalueof();
	if(DEBUG_STEP){post('update_poly\n unmatching args', args, '\n');}
	//for(var i in args)
	var i = args.length;do{
		if(args[i]>10)
		{
			var index = args[i]-11;
			if(DEBUG_STEP){post(args[i], '\n');}
			selected.funcs[Funcs[index%5]](Math.floor(index/5), step_value[index+11]);
		}
		else
		{
			switch(args[i])
			{
				case 5:
					selected.funcs.stepLoop(step_value[args[i]], step_value[args[i]+1]-1);
					break;
				case 6:
					selected.funcs.stepLoop(step_value[args[i]-1], step_value[args[i]]-1);
					break;
			}
		}		 
	}while(i--);
}


/*///////////////////////
// internal processes  //
///////////////////////*/


//select the current pattern and load its data to CNTRLR/live.step/gui
function select_pattern(num)
{
	if(!locked)
	{
		storage.message('store', 'poly.'+(selected.num+1), presets[selected.num]);
	}
	var range = num>7;
	if(Math.floor(selected.num/8)!=Math.floor(num/8))
	{
		var i=7;do{
			outlet(0, 'to_wheel', i%4, Math.floor(i/4), 'custom', 'x'+(part[i+(8*(range))].pattern.join('')));
			outlet(0, 'to_wheel', i%4, Math.floor(i/4), 'green', part[i+(8*(range))].lock);
		}while(i--);
	}
	selected = part[num];
	_select_chain(num);
	update_step();
	selected_filter.message('offset', num + 1);
	refresh_grid();
	refresh_keys();
	update_gui();
	if(pad_mode == 5)
	{
		update_bank();
	}
	//if(solo_mode > 0)
	//{
	//	  for(var i=0;i<16;i++)
	//	  {
	//		  if(part[i].active!=(part[i]==selected))
	//		  {
	//			  change_play_status(part[i]);
	//		  }
	//	  }
	//}
}	 

//update the current global transposition to all polys
function change_transpose(val)
{
	if(selected.channel==0)
	{
		if(DEBUG){post('global_offset', val, '\n');}
		global_offset = (Math.max(Math.min(val, 96), 0));
		transposegui.message('set', global_offset);
		for(var i = 0;i< 16;i++)
		{
			part[i].obj.noteoffset.message('int', global_offset + i);
		}
		_select_chain(selected.num);
	}	
}

//change the function of the keys
function change_key_mode(val)
{
	if(DEBUG){post('key_mode', val, '\n');}
	key_pressed = -1;
	key_mode = val;
	switch(key_mode)
	{
		default:
			break;
		case 5:
			stepmodegui.message('int', 5);
			break;
	}
	keymodegui.message('set', key_mode);
	refresh_keys();
	update_bank();
}

//change the function of the pad
function change_pad_mode(val)
{
	pad_mode = val;
	switch(pad_mode)
	{
		default:
			break;
	}
	//pad_pressed = -1;
	//change_key_mode(last_key_mode);
	padmodegui.message('set', pad_mode);
	refresh_grid();
	update_bank();
}
	
//called from key_in, change the loopOut point and update it to live.step and poly
function change_Out(val)
{
	if(DEBUG){post('change Out', val, '\n');}
	selected.steps = val-parseInt(selected.nudge);
	selected.obj.steps.message('int', selected.steps);
	update_step();
	refresh_keys();
}

//called from key_in, change the loopIn point and update it to the live.step and poly
function change_In(val)
{
	if(DEBUG){post('change In', val, '\n');}
	var change = parseInt(selected.nudge) - val;
	selected.nudge = val;
	if(timing_immediate)
	{
		selected.obj.nudge.message('int', selected.nudge);
		selected.obj.nudge.message('set', selected.nudge);
		selected.steps += change;
		selected.obj.steps.message('int', selected.steps);
	}
	else
	{
		selected.obj.nudge.message('set', selected.nudge);
		selected.steps += change;
		selected.obj.steps.message('int', selected.steps);
		selected.obj.restart.message('bang');
	}
	update_step();
	refresh_keys();
}

//add a note from the pads to the appropriate poly, and trigger a message back from it
function add_note(part)
{
	if(DEBUG){post('add_note', part.num, '\n');}
	part.obj.addnote.message('bang');
}

//add new notes received from poly to the appropriate place and update display
function _addnote(num, val)
{
	num += -1;
	val += -1;
	if(DEBUG){post('addnote', num, val, '\n');}
	part[num].pattern[val] = 1;
	part[num].obj.pattern.message('list', part[num].pattern);
	refresh_keys();
	update_step();
}

//rotate the pattern based on the blocksize defined in the main patch
function rotate_pattern(part, len, dir)
{
	//post('rotate_pattern', len, dir, '\n');
	var bits = Math.ceil(16/len);
	var Out;
	var In;
	if(dir < 0)
	{
		for(var i=0;i<bits;i++)
		{
			Out = Math.min(parseInt((len*(i+1))-1), 15);
			In = len*i;
			part.pattern.splice(Out, 0, parseInt(part.pattern.splice(In, 1)));
			part.velocity.splice(Out, 0, parseInt(part.velocity.splice(In, 1)));
			part.duration.splice(Out, 0, parseInt(part.duration.splice(In, 1)));
			part.note.splice(Out, 0, parseInt(part.note.splice(In, 1)));
		}
	}
	else
	{
		for(var i=0;i<bits;i++)
		{
			Out = len*i;
			In = Math.min(parseInt((len*(i+1))-1), 15);
			part.pattern.splice(Out, 0, parseInt(part.pattern.splice(In, 1)));
			part.velocity.splice(Out, 0, parseInt(part.velocity.splice(In, 1)));
			part.duration.splice(Out, 0, parseInt(part.duration.splice(In, 1)));
			part.note.splice(Out, 0, parseInt(part.note.splice(In, 1)));
		}
	}
	part.obj.pattern.message('list', part.pattern);
	part.obj.velocity.message('list', part.velocity);
	part.obj.duration.message('list', part.duration);
	part.obj.note.message('list', part.note);
	update_step();
	refresh_keys();
}

//change the display on the CNTRLR encoder rings to reflect the current play position when in freewheel mode
function rotate_wheel(num, pos)
{
	//if(DEBUG){post('rotate_wheel', num, pos, '\n');}
	if((key_mode==5)&&(num==selected.num+1))
	{
		//post('current_step', num, pos, '\n');
		outlet(0, 'mask', 'key', selected.note[current_step], -1);
		current_step = pos;
		outlet(0, 'mask', 'key', selected.note[current_step], 5);
	}
	if(pad_mode==5)
	{
		if((selected.num<8)&&(num<9))
		{
			num-=1;
			outlet(0, 'to_wheel', num%4, Math.floor(num/4), 'value', pos);
		}
		else if((selected.num>7)&&(num>8))
		{
			num-=9;
			outlet(0, 'to_wheel', num%4, Math.floor(num/4), 'value', pos);
		}
	}
}

//synchronize two parts when holding down select while selecting another part
function sync_wheels(master, slave)
{
	if(DEBUG){post('sync_wheels', master.num, slave.num, '\n');}
	if(slave.lock != master.lock)
	{
		//change_lock_status(slave);
		slave.lock = master.lock;
		slave.obj.quantize.message('int', slave.lock);
		outlet(0, 'to_wheel', slave.num%4, Math.floor(slave.num/4)%2, 'green', slave.lock);
	}
	switch(master.lock)
	{
		case 0:
			slave.ticks = master.ticks;
			slave.obj.ticks.message('int', master.obj.ticks.getvalueof());
			break;
		case 1:
			slave.notevalues = master.notevalues;
			slave.notetype = master.notetype;
			slave.obj.notevalues.message('int', master.obj.notevalues.getvalueof());
			slave.obj.notetype.message('int', master.obj.notetype.getvalueof());
			break;
	}
	update_speed(slave);
}

//change the variables necessary to change the quantization status of a part
function change_lock_status(part, dir)
{
	if(DEBUG_LOCK){post('change_lock_status', part.num, '\n');}
	part.lock = Math.abs(part.lock - 1);
	if(dir==undefined){dir = 0;}
	if(DEBUG_LOCK){post('direction of change', dir, '\n');}
	var new_speed = TRANS[0];
	part.notevalues = part.obj.notevalues.getvalueof();
	part.notetype = part.obj.notetype.getvalueof();
	part.ticks = part.obj.ticks.getvalueof();
	if(DEBUG_LOCK){post('got old values:', part.notevalues, part.notetype, part.ticks, '\n');}
	switch(part.lock)
	{
		case 0:
			if(DEBUG_LOCK){post('was quantized\n');}
			new_speed = TRANS[part.notevalues];
			break;
		case 1:
			switch(dir)
			{
				case 0:
					for(var i=0;i<TRANS.length;i++)
					{
						if(TRANS[i][part.notetype]>=part.ticks)
						{
							new_speed = TRANS[i];
							break;
						}
					}
					break;
				case 1:
					var i=TRANS.length-1;do{
						if(TRANS[i][part.notetype]<=part.ticks)
						{
							new_speed = TRANS[i];
							break;
						}
					}while(i--);
					break;
			}			
			break;
	}
	if(DEBUG_LOCK){post('new_speed', new_speed, '\n');}
	part.obj.quantize.message('int', part.lock);
	part.ticks = new_speed[part.notetype];
	part.notevalues = TRANS.indexOf(new_speed);
	part.obj.ticks.message('int', part.ticks);
	part.obj.notevalues.message('int', part.notevalues);
	if(part==selected)
	{
		update_gui();
	}
	outlet(0, 'to_wheel', part.num%4, Math.floor(part.num/4)%2, 'green', part.lock);
	update_speed(part);
}

//update the current value reflected on the invisible ui speed controls
function update_speed(part)
{
	if(!part.lock)
	{
		part.ticks = part.obj.ticks.getvalueof();
		script['Speed'+(part.num+1)].message('set', part.ticks);
	}
	else
	{
		part.notevalues = part.obj.notevalues.getvalueof();
		part.notetype = part.obj.notetype.getvalueof();
		script['Speed'+(part.num+1)].message('set', TRANS[part.notevalues][part.notetype]);
	}
}

//release any polyplay sequences from being held when the hold key is turned off
function release_held_sequences(part)
{
	//post('release held seqs', part.held, '\n');
	for(var i in part.held)
	{
		part.obj.polyplay.message('midinote', part.held[i], 0);
		var trig = part.triggered.indexOf(part.held[i]);
		if(trig > -1)
		{
			part.triggered.splice(trig, 1);
		}
	}
	part.held = [];
}


/*	  automation	 */

//enable recording of preset changes and mutes to a live.clip
function record(val)
{
	if(val > 0)
	{
		record_enabled = begin_record();
	}
	else
	{
		record_enabled = 0;
	}	 
	if(DEBUG_REC){post('record_enabled', record_enabled, '\n');}
}

//check api for current clip and return confirmation of recording
function begin_record()
{
	finder.goto('this_device');
	finder.goto('canonical_parent');
	var playing_slot_index = parseInt(finder.get('playing_slot_index'));
	if(DEBUG_REC){post('playing_slot_index:', playing_slot_index, '\n');}
	if(playing_slot_index>=0)
	{
		finder.goto('clip_slots', playing_slot_index, 'clip');
		autoclip.id = parseInt(finder.id);
	}
	return (parseInt(autoclip.id)>0);
}

//add automation steps directly to the attached Live clip
function add_automation(part, type, val)
{
	if(record_enabled)
	{
		autoclip.call('select_all_notes');
		var notes = autoclip.call('get_selected_notes');
		var num = parseInt(notes[1]);
		switch(type)
		{
			case 'mute':
				new_notes = notes.slice(2, -1).concat(['note', part.num+111, Math.round(autoclip.get('playing_position')*100)/100, .2, val+1, 0]);
				break;
			case 'preset':
				new_notes = notes.slice(2, -1).concat(['note', part.num+111, Math.round(autoclip.get('playing_position')*100)/100, .2, val+10, 0]);
				break;
		}				 
		if(DEBUG_REC){post('notes:', new_notes, '\n');}
		finder.call('replace_selected_notes'); 
		finder.call('notes', num+1);
		for(var i = 0;i<new_notes.length;i+=6)
		{
			finder.call('note', new_notes[i+1], new_notes[i+2]+.001, new_notes[i+3]+.001, new_notes[i+4], new_notes[i+5]);
		} 
		finder.call('done');
		//if(DEBUG_REC){post('new_notes:', finder.call('get_selected_notes'), '\n');}
	}
}


/*	 settings		*/

//all of these do , pretty much what they say
function randomize_pattern(global)
{
	if(global>0)
	{
		if(DEBUG){post('global pattern random');}
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random());
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::pattern', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].pattern[j]=Math.round(Math.random());
		}while(j--);
		part[i].obj.pattern.message('list', part[i].pattern);
	}while(i--);
	update_step();
	refresh_keys();
	storage.message('storeagain');
}

function randomize_notes(global)
{
	if(global>0)
	{
		if(DEBUG){post('global pattern random');}
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random()*16);
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::note', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].note[j]=Math.round(Math.random()*16);
		}while(j--);
		part[i].obj.pattern.message('list', part[i].note);
	}while(i--);
	update_step();
	refresh_keys();
	storage.message('storeagain');
}

function randomize_velocity(global)
{
	if(global)
	{
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random()*127);
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'velocity', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].velocity[j]=Math.floor(Math.random()*127);
		}while(j--);
		part[i].obj.velocity.message('list', part[i].velocity);
	}while(i--);
	update_step();
	storage.message('storeagain');
}

function randomize_duration(global)
{
	if(global)
	{
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random()*7);
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::duration', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].duration[j]=Math.floor(Math.random()*7);
		}while(j--);
		part[i].obj.duration.message('list', part[i].duration);
	}while(i--);
	update_step();
	storage.message('storeagain');
}

function randomize_rulebends(global)
{
	if(global)
	{
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random()*15);
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::rulebends', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].rulebends[j]=Math.floor(Math.random()*15);
		}while(j--);
		part[i].obj.rulebends.message('list', part[i].rulebends);
	}while(i--);
	update_step();
	if(key_mode == 2)
	{
		refresh_keys();
	}
	storage.message('storeagain');
}

function randomize_behavior(global)
{
	if(global)
	{
		var h=15;do{
			var i=15;do{
				var seq = [];
				var j=15;do{
					seq[j]=Math.round(Math.random()*7);
				}while(j--);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::behavior', h+1, seq);
			}while(i--);
		}while(h--);
	}
	var i=15;do{
		var j=15;do{
			part[i].behavior[j]=Math.round(Math.random()*7);
		}while(j--);
		part[i].obj.behavior.message('list', part[i].behavior);
	}while(i--);
	update_step();
	if(key_mode == 2)
	{
		refresh_keys();
	}
	storage.message('storeagain');
}

function randomize_rules()
{
	var i=6;do{
		var j=7;do{
			rulemap.message(i, j, Math.round(Math.random()*7));
		}while(j--);
	}while(i--);
}

function reset_data(global)
{
	if(global)
	/*{
		var h=15;do{
			var i=15;do{
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::pattern', h+1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::rulebends', h+1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::velocity', h+1, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::duration', h+1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::behavior', h+1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
				storage.message('setstoredvalue', 'poly.'+(i+1)+'::note', h+1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			}while(i--);
		}while(h--);
	}*/
	var i=15;do{
		part[i].rulebends=default_pattern.slice();
		part[i].pattern=default_pattern.slice();
		part[i].behavior=default_pattern.slice();
		part[i].velocity=default_velocity.slice();
		part[i].duration=default_duration.slice();
		part[i].note=default_pattern.slice();
		part[i].obj.rulebends.message('list', part[i].rulebends);
		part[i].obj.pattern.message('list', part[i].pattern);
		part[i].obj.behavior.message('list', part[i].behavior);
		part[i].obj.velocity.message('list', part[i].velocity);
		part[i].obj.duration.message('list', part[i].duration);
		part[i].obj.note.message('list', part[i].note);
	}while(i--);
	storage.message('storeagain');
	if(global)
	{
		var h=15;do{
			storage.message('store', h);
		}while(h--);
	}
	update_step();
	refresh_keys();
}


/*	 display routines	 */

//update the display on the CNTLRL/padgui to reflect current data
function refresh_grid()
{
	if(DEBUG){post('refresh_grid\n');}
	switch(pad_mode)
	{
		case 0:
			var i=3;do{
				var j=3;do{
					var v = SelectColors[Math.floor(i+(j*4) == selected.num)];
					outlet(0, 'grid', i, j, v);
					padgui.message(i, j, v);
				}while(j--);
			}while(i--);
			break;
		case 1:
			var i=3;do{
				var j=3;do{
					var v = AddColors[Math.floor(i+(j*4) == selected.num)];
					outlet(0, 'grid', i, j, v);
					padgui.message(i, j, v);
				}while(j--);
			}while(i--);
			break;
		case 2:
			var i=15;do{
				var x = i%4;
				var y = Math.floor(i/4);
				var v = part[i].active*2;
				outlet(0, 'grid', x, y, v);
				padgui.message(x, y, v);
			}while(i--);
			break;
		case 3:
			var p = presets[selected.num]-1;
			var i=15;do{
				var x = i%4;
				var y = Math.floor(i/4);
				var v = (i==p)+3;
				outlet(0, 'mask', 'grid', x, y, -1);
				outlet(0, 'grid', x, y, v);
				padgui.message(x, y, v);
			}while(i--);
			break;
		case 4:
			var p = presets[selected.num]-1;
			var i=15;do{
				var x = i%4;
				var y = Math.floor(i/4);
				var v = (i==p)+6;
				outlet(0, 'mask', 'grid', x, y, -1);
				outlet(0, 'grid', x, y, v);
				padgui.message(x, y, v);
			}while(i--);
			break;
		case 6:
			var i=15;do{
				var x=i%4;
				var y=Math.floor(i/4);
				var v=(selected.triggered.indexOf(i)>-1) + 7;
				outlet(0, 'grid', x, y, v);
				padgui.message(x, y, v);
			}while(i--);
			break;
		default:
			if(selected.num<8)
			{
				var i=3;do{
					var j=3;do{
						var v = SelectColors[Math.floor(i+(j*4) == selected.num)+((j<2)*2)];
						outlet(0, 'grid', i, j, v);
						padgui.message(i, j, v);
					}while(j--);
				}while(i--);
			}
			else
			{
				var i=3;do{
					var j=3;do{
						var v = SelectColors[Math.floor(i+(j*4) == selected.num)+((j>1)*2)];
						outlet(0, 'grid', i, j, v);
						padgui.message(i, j, v);
					}while(j--);
				}while(i--);
			}
			break;	  
	}
}

//update the display on the CNTRLR/keygui to reflect current data
function refresh_keys()
{ 
	switch(key_mode)
	{
		/*case 0:
			var i=15;do{
				var v = part[i].active*2
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;*/
		case 1:
			var i=15;do{
				outlet(0, 'mask', 'key', i, -1);
				var v = (i>=part[selected.num].nudge&&i<=(part[selected.num].nudge+part[selected.num].steps))*5;
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
		case 2:
			var i=15;do{
				outlet(0, 'mask', 'key', i, -1);
				outlet(0, 'key', i, Colors[part[selected.num].behavior[i]]);
				keygui.message(i, 0, selected.behavior[i]+8);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
		case 3:
			var p = presets[selected.num]-1;
			var i=15;do{
				outlet(0, 'mask', 'key', i, -1);
				var v = (i==p)+3;
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
		case 4:
			var p = presets[selected.num]-1;
			var i=15;do{
				outlet(0, 'mask', 'key', i, -1);
				var v = (i==p)+6;
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
		case 5:
			var i=15;do{
				outlet(0, 'mask', 'key', i, -1);
				outlet(0, 'key', i, 4);
				keygui.message(i, 0, 4);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			outlet(0, 'mask', 'key', selected.note[current_step], 5);
			break;
		case 6:
			var i=15;do{
				var v=(selected.triggered.indexOf(i)>-1) + 7;
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
		default:
			var i=15;do{
				var v = part[i].active*2
				outlet(0, 'key', i, v);
				keygui.message(i, 0, v);
				outlet(0, 'key', i+16, selected.pattern[i] * StepColors[i]);
			}while(i--);
			break;
	}		 
}

//remove any masked elements on the CNTRLR
function demask()
{
	post('demask\n');
}

//update gui elements to reflect current data
function update_gui()
{
	notevaluesgui.message('set', selected.obj.notevalues.getvalueof());
	notetypegui.message('set', selected.obj.notetype.getvalueof());
	Random.message('set', selected.obj.random.getvalueof());
	Groove.message('set', (selected.obj.swing.getvalueof()*100)-50);
	Channel.message('set', selected.obj.channel.getvalueof());
	Mode.message('set', selected.obj.mode.getvalueof());
	PolyOffset.message('set', selected.obj.polyoffset.getvalueof());
	if((pad_mode == 6)||(key_mode == 6))
	{
		outlet(0, 'button', 3, 2, selected.hold);
	}
}

//update the current bank assignment in Python
function update_bank()
{
	switch(pad_mode)
	{
		default:
			outlet(0, 'set_device_bank', selected.channel>0);
			outlet(0, 'set_local_ring_control', 1);
			var i=7;do{
				params[Encoders[i]].hidden = 0;
				params[Speeds[i]].hidden = 1;
				params[Speeds[i+8]].hidden = 1;
			}while(i--);
			break;
		case 5:
			outlet(0, 'set_device_bank', 2+(selected.num>7));
			outlet(0, 'set_local_ring_control', 0);
			var r = (selected.num>7)*8;
			var i=7;do{
				params[Encoders[i]].hidden = 1;
				params[Speeds[i]].hidden = selected.num>7;
				params[Speeds[i+8]].hidden = selected.num<8;
				var x = i%4;
				var y = Math.floor(i/4);
				outlet(0, 'to_wheel', x, y, 'mode', 4);
				outlet(0, 'to_wheel', x, y, 'custom', 'x'+(part[i+r].pattern.join('')));
				outlet(0, 'to_wheel', x, y, 'green', part[i+r].lock);
			}while(i--);
			var i=3;do{
				outlet(0, 'to_wheel', i, 2, 'mode', 1);
				outlet(0, 'to_wheel', i, 2, 'green', 0);
			}while(i--);
			break;
	}
	rotgate.message('int', ((pad_mode==5)||(key_mode==5)));	
}


/*///////////////////////////
//	   Device Component	   //
//		  and LCD		   //
///////////////////////////*/


var pns=[];
var mps=[];
var found_device = 0;
var params = [];
var dials = [];

const Encoders = ['Encoder_0', 'Encoder_1', 'Encoder_2', 'Encoder_3', 'Encoder_4', 'Encoder_5', 'Encoder_6', 'Encoder_7', 'Encoder_8', 'Encoder_9', 'Encoder_10', 'Encoder_11'];
const Speeds = ['Speed1', 'Speed2', 'Speed3', 'Speed4', 'Speed5', 'Speed6', 'Speed7', 'Speed8', 'Speed9', 'Speed10', 'Speed11', 'Speed12', 'Speed13', 'Speed14', 'Speed15', 'Speed16'];
const Dials =  ['Channel', 'Groove', 'Random', 'RotSize', 'Repeat', 'GlobSpeed', 'PolyOffset', 'Mode'];
Warning = ['missing', 'device', 'assignment', 'for', 'the', 'currently', 'selected', 'channel', ' ', ' ', ' ', ' '];

//const Warning = ['No device', 'was found.', 'Place a', 'DrumRack', 'next to', 'this mod', 'and press', '\"Detect',	'DrumRack\"', 'get', 'started.', ' '];
//const PolyWarning = ['No device', 'is stored', 'for this', 'PolySeq.', 'Use the', 'selector', 'button in', 'the settings', 'menu to', 'select the', 'target', 'instrument.'];
// called from init
function init_device()
{
	finder = new LiveAPI(callback, 'this_device');
	pns['device_name']=this.patcher.getnamed('device_name');
	for(var i=0;i<8;i++)
	{
		pns[Encoders[i]]=this.patcher.getnamed('pn'+(i+1));
		pns[Encoders[i]].message('text', ' ');
		mps[Encoders[i]]=this.patcher.getnamed('mp'+(i+1));
		mps[Encoders[i]].message('text', ' ');
		params[Speeds[i]] = this.patcher.getnamed(Speeds[i]);
		params[Speeds[i+8]] = this.patcher.getnamed(Speeds[i+8]);
		params[Encoders[i]]=this.patcher.getnamed(Encoders[i]);
		params[Encoders[i]].message('set', 0);
	}
	for(var i=0;i<4;i++)
	{
		pns[Encoders[i+8]]=this.patcher.getnamed('pn'+(i+9));
		pns[Encoders[i+8]].message('text', ' ');
		mps[Encoders[i+8]]=this.patcher.getnamed('mp'+(i+9));
		mps[Encoders[i+8]].message('text', ' ');
	}
	for(var i=0;i<8;i++)
	{
		dials[Encoders[i+8]]=this.patcher.getnamed(Dials[i]);
		dials[Encoders[i+8]].message('set', 0);
	}
	detect_drumrack();
}

function detect_devices()
{
	this.patcher.getnamed('devices').front();
}

function detect_drumrack()
{
	//setup the initial API path:
	if(devices[0] > 0)
	{
		devices[0] = check_device_id(devices[0]);
	}
	if(devices[0] == 0)
	{
		finder.goto('this_device');
		var this_id = parseInt(finder.id);
		finder.goto('canonical_parent');
		var track_id = parseInt(finder.id);
		var found_devices = finder.getcount('devices');
		for (var i=0;i<found_devices;i++)
		{
			finder.id = track_id;
			finder.goto('devices', i);
			if(finder.get('class_name')=='DrumGroupDevice')
			{
				if(DEBUG){post("\nDrumRack found");}
				devices[0] = parseInt(finder.id);
				post('DrumRack found', devices[0], '\n');
			}
		}
	}
	if(devices[0] == 0)
	{
		showerror();
	}
	else
	{
		hideerror();
		_select_chain(selected.num)
		//report_drumrack_id();
	}
}

//called fram pattr that stores any device id that was selected by the user last session
function set_devices()
{
	var ids = arrayfromargs(arguments);
	if(DEBUG){post('set_devices', ids, '\n');}
	devices = ids;
}

//find the appointed_device
function detect_device()
{
	if(DEBUG){post('select_device \n');}
	finder.goto('live_set', 'appointed_device');
	if(DEBUG){post('device id ==', finder.id, '\n');}
	if(check_device_id(parseInt(finder.id))>0)
	{
		_select_chain(selected.num);
	}
	//this.patcher.getnamed('devices').wclose();
}

//check to make sure previous found_device is valid
function check_device_id(id)
{
	var found = 0;
	if(DEBUG){post('device_id', id, '\n')};
	if(id>0)
	{
		if(selected.channel == 0)
		{
			finder.id = id;
			if(finder.get('class_name')=='DrumGroupDevice')
			{
				found = parseInt(finder.id);
			}
		}
		else
		{	
			finder.goto('this_device');
			if (parseInt(finder.id) != id)
			{
				found = id;
			}
		}
	}
	devices[selected.channel] = found;
	this.patcher.getnamed('devices').subpatcher().getnamed('devices').message('list', devices);
	return found;
}

//send the current chain assignment to mod.js
function _select_chain(chain_num)
{
	if(DEBUG){post('select_chain', chain_num, selected.channel, devices[selected.channel], '\n');}
	if(selected.channel==0)
	{
		outlet(0, 'set_device_parent', devices[selected.channel]);
		outlet(0, 'set_device_chain', Math.max(0, Math.min(chain_num + global_offset - global_chain_offset, 112)));
	}
	else
	{
		outlet(0, 'set_device_single', devices[selected.channel]);
	}
	if(devices[selected.channel]==0)
	{
		showerror();
	}
	update_bank();
}

//sort calls to the internal LCD
function _lcd(obj, type, val)
{
	//post('new_lcd', obj, type, val, '\n');
	if(DEBUG_LCD){post('lcd', obj, type, val, '\n');}
	if((type=='lcd_name')&&(val!=undefined))
	{
		pns[obj].message('text', val.replace(/_/g, ' '));
	}
	else if((type == 'lcd_value')&&(val!=undefined))
	{
		mps[obj].message('text', val.replace(/_/g, ' '));
	}
	else if(type == 'encoder_value')
	{
		if(params[obj]!=undefined)
		{
			params[obj].message('set', val);
		}
	}
}

//distribute gui knobs to their destinations
function _encoder(num, val)
{
	if(DEBUG){post('encoder in', num, val, '\n');}
	if(num<8)
	{				
		if(pad_mode!=5)
		{
			outlet(0, 'set_parameter_value', num, val);
		}
		else
		{
			set_speed(num, val);
		}
	}
	else
	{
		switch(num)
		{
			case 8:
				selected.channel = val;
				selected.polyenable = selected.channel > 0;
				selected.obj.polyenable.message('int', selected.polyenable);
				selected.obj.channel.message('int', selected.channel);
				_select_chain(selected.num);
				break;
			case 9:
				selected.swing = (val+50)/100;
				selected.obj.swing.message('float', selected.swing);
				break;
			case 10:
				selected.random = val;
				selected.obj.random.message('float', selected.random);
				break;
			case 11:
				rot_length = val;
				break;
			case 12:
				selected.repeat = val;
				selected.obj.repeat.message('int', selected.repeat);
				break;
			case 13:
				//global speed
				break;
			case 14:
				selected.polyoffset = val;
				selected.obj.polyoffset.message('int', selected.polyoffset);
				break;
			case 15:
				selected.mode = val;
				selected.obj.mode.message('int', selected.mode);
				break;
		}
	}	 
}

//called from invisible ui controls that the MonoDeviceComponent latches to in 2nd/3rd bank indexes
function _speed(num, val)
{
	if(DEBUG){post('speed', num, val, '\n');}
	if(part[num].lock > 0)
	{
		part[num].lock = Math.abs(0);
		part[num].obj.quantize.message('int', 0);
		outlet(0, 'to_wheel', num%4, Math.floor(num/4)%2, 'green', 0);
	}
	part[num].ticks = val;
	part[num].obj.ticks.message('float', val);
}

//called from visible ui elements and distributed to MonoDeviceComponent in 2nd/3rd bank indexes
function set_speed(num, val)
{
	if(DEBUG){post('set_speed', num, val, '\n');}
	script['Speed'+(num+1)].message('set', ((val/127)*10005)-5);
	_speed(num, val);
}

//Used for UI warning. Uses the lcd objects to display an error message.
function showerror()
{
	pns.device_name.message('text', 'Detect Instrument');
	for(var i=0;i<8;i++)
	{
		pns[Encoders[i]].message('text', Warning[i]);
		mps[Encoders[i]].message('text', ' ');
	}
}

//Used for UI warning.  Uses the lcd objects to display an error message.
function hideerror()
{
	pns.device_name.message('text', 'Drumrack Found');
	for(var i=0;i<12;i++)
	{
		pns[Encoders[i]].message('text', ' ');
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



/*////////////////////////////////////////////////////////
//	Legacy Functionality from "binary" mod version for	//
//		 MonOhm, BlockMod, and Codec (Monomodular)		//
////////////////////////////////////////////////////////*/

/*These functions are provided for reference only....there are several control and display structures
available that are currently not being used, but remain fairly intact for future expansion of this 
script without a great deal of difficulty.*/

//colors:	   main step selector = 1;
//			  length chooser = 2;
//			  position mask = 3;
//			  selected = 4;
//			  selected & locked = 5;
//			  active = 6;
//			  note = 7
//			  velocity = 8;
//			  locked = 9;
//			  position mask alt = 10;
//			  play_mode status = 11;
//			  Monochrome = 0 1 1 0 1 8 16 1 1 1 8
//			  Aumpad = 0 5 4 1 3 10 5 3 2 4 1 10
//			  OhmRGB = 
//			  Launchpad = 

//const dir_menu = ['up', 'down', 'updown'];
//const names = [['nudge', 'swing', 'root', 'octave', 'notetype', 'channel', 'direction', 'length', 'interval', ' ', ' ', ' ']]; 
//const notevaluemenu = ['128n', '64n', '32n', '16n', '8n', '4n', '2n', '1n'];
//const notetypemenu = ['plain', 'dot', 'trip'];
//const notenames = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
//const dial_modes = [2, 0, 0, 0, 0, 0, 1, 0];
//const SCALE = {0: 0, 1: 2, 2:4, 3:5, 4:7, 5:9, 6:11, 7:12};
//const V = {0: 0, 1:127, 2:3, 3: 6}; 
//const OBJECT = ['speed', 'swing', 'phasor', 'steps', 'channel', 'active', 'direction', 'clutch', 'offset', 'ticks', 'notevalues', 'nudge', 'noteoffset'];

//var tasks=[];
//var last_grid_mode = 0;
//var last_hilite = 0;
//var last_hilite_mod = 0;
//var dial_mode = 0;
//var dial_speed = 0;
//var edit_offset = 0;
//var alt_val = 0;
//var shift = 0;
//var alt = 0;
//var grid_mode = 0;
//var s_offset = [0, 0];

///Functions from Code Version
/*

function calc_step(num)
{
	return ((num + edit_offset) % selected.pattern.length);	   
}

function sync_wheels(master, slave)
{
	if(slave.lock != master.lock)
	{
		change_lock_status(slave);
	}
	switch(master.lock)
	{
		case 0:
			slave.obj.ticks.message('int', master.obj.ticks.getvalueof());
			break;
		case 1:
			slave.obj.notevalues.message('int', master.obj.notevalues.getvalueof());
			slave.obj.notetype.message('int', master.obj.notetype.getvalueof());
			break;
	}
}

function rotate(num, val)
{
	if((key_pressed == 0)&&(alive > 0))
	{
		part[num].offset = dial[num].offset + val;
		//if(dial[num].n == 'wheel')
		//{
		//	  outlet(2, 'wheel', column, row, 'value', dial[row][column].offset);
		//}
		if(part[num] == selected)
		{
			refresh_edit_view();
			//if((Math.floor(selected.offset/8) != last_hilite_mod)&&(grid_mode>1))
			//{
			//	  refresh_grid();
			//}
			//if(grid_mode<4)
			//{
			//	  hilite_grid();
			//}
		}
	}
}

function rotate_to(number, offset)
{
	//post('rotate_to', number, offset, '\n');
	if((key_pressed == 0)&&(alive > 0))
	{
		//if(part[number].n == 'wheel')
		//{
		//	  outlet(2, 'wheel', column, row, 'value', offset);
		//}
		if((part[number] == selected)&&(shift==0))//&&(selected.pushed == 0))  ////watch out for this one!!!!
		{
			part[number].offset = offset;
			refresh_edit_view();
			//if((Math.floor(selected.offset/8) != last_hilite_mod)&&(grid_mode>1))
			//{
			//	  refresh_grid();
			//}
			//if(grid_mode<4)
			//{
			//	  hilite_grid();
			//}
			//if(dial_mode!='edit')
			//{
			//	  //refresh_dials();
			//}
		}
		else if(part[number]!=selected)
		{
			part[number].offset = offset;
		}
	}
}

function change_direction(part)
{
	if(part.speed<0)
	{
		part.direction = 'dec';
	}
	else
	{
		part.direction = 'inc';
	}
	part.obj.direction.message('set', part.direction);
}

function reset_rotation(number)
{
	part[number].offset = 0;
	part[number].obj.offset.message('int', 0);
	//outlet(2, 'wheel', column, row, 'value', 0);
}

function resync(number)
{
	post('insert resync here ;)\n');
}

function set_play_status(part, val)
{
	part.active = val;
	part.obj.active.message('int', part.active);
}

function change_play_mode()
{
	play_mode = Math.abs(play_mode - 1);
	//outlet(1, 'key', 5, play_mode * 11);
}

function change_length(new_length)
{
	selected.len = Math.max(new_length, 1);
	var difference = selected.pattern.length - selected.len;
	if(difference < 0)
	{
		var new_pattern = [];
		var new_note = [];
		var new_velocity = [];
		for(var i = 0; i < Math.abs(difference); i ++)
		{
			new_pattern.push(0);
			new_note.push([1, 0, 0, 0, 0, 0, 0, 0]);
			new_velocity.push(5);
		}
		selected.pattern = selected.pattern.concat(new_pattern);
		selected.note = selected.note.concat(new_note);
		selected.velocity = selected.velocity.concat(new_velocity);
	}
	else
	{
		selected.pattern.length = selected.len;
		selected.note.length = selected.len;
		selected.velocity.length = selected.len;
	}
	selected.obj.velocity.message('list', selected.velocity);
	//selected.obj.note.message('list', selected.note);
	//update_note_pattr(selected);
	selected.obj.pattern.message('list', selected.pattern);
	//outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern.join(''));
	selected.obj.steps.message('int', selected.len - 1);
	//p_value[7].message('text', selected.len);
	//outlet(3, 'lcd', 6, selected.len);
	//dial[6][4].val = selected.len%10;
	//dial[6][4].pattr_val = selected.len;
	//refresh_grid();
}

// storage routines

function update_note_pattr(dial)
{
	post('update_note_pattr');
	//post('note to pattr', note, '\n');
	//var out = [];
	//for(var i=0;i< dial.note.length;i++)
	//{
	//	  var step_out = '1' + dial.note[i].join('');
	//	  out[i] = step_out;
	//}
	//post('out', out, '\n');
	//dial.obj.note.message('list', out);
}

function note_mode(num, val)
{
	//post('note_mode', num, val, '\n');
	if(alive > 0)
	{
		for(var i=0;i<7;i++)
		{
			pattr_obj.notes[i].message('int', modes[num][i]);
		}
	}
}


//alt button preset management

function surface_offset(x, y)
{
	//post('surface offset', x, y, '\n');
	s_offset = [x, y];
}

function slotlist()
{
	args = arrayfromargs(arguments);
	post('slotlist', args, '\n');
	var loaded = empty.slice();
	if(alt>0)
	{
		for(var i=0;i<args.length;i++)
		{
			//outlet(0, 'grid', (args[i]-1)%8 + s_offset[0], Math.floor((args[i]-1)/8) + s_offset[1], (1 + (args[i]==preset)));
			//post(0, (args[i]-1)%7 + s_offset[0], Math.floor((args[i]-1)/7) + s_offset[1], 1, '\n');
			loaded[args[i]-1] = 0;
		}
		for(var j=0;j<4;j++)
		{
			for(var k=0;k<8;k++)
			{
				outlet(0, 'grid', k + s_offset[0], j+4+ s_offset[1], loaded[((j*8)+k)]);
			}
		}
	}
} 

function alt_in(key)
{
	if(alive > 0)
	{
		alt=key;
		if(key<1)
		{
			outlet(0, 'batch', 'grid', 0);
			refresh_grid();
		}
		else
		{
			outlet(0, 'batch', 'grid', 0);
			storage.message('getslotlist');
		}
	}
}

function slot(val)
{
	preset = val;
}

function set_dial_mode()
{
	dial_mode = 1;
	refresh_dials();
	//outlet(2, 'row', 3, V[dial_mode]);
}

function refresh()
{
	for(var i = 0; i< 8; i++)
	{
		for(var j = 0; j< 3; j++)
		{
			outlet(2, 'wheel', i, j, 'custom', part[i].pattern.join('')); 
			outlet(2, 'wheel', i, j, 'value', part[i].offset);
			outlet(2, 'wheel', i, j, 'white', Math.floor(part[i] == selected));
			outlet(2, 'wheel', i, j, 'green', part[i].active);
			if(part[i]==selected)
			{
				outlet(2, 'wheel', i, j, 'white', V[part[i].lock + 1]);
			}
			else
			{
				outlet(2, 'wheel', i, j, 'white', 0);
			}
		}
	}
	//refresh_edit_view();
}


function hilite_grid()
{
	post('hilite_grid', '\n');
	switch(grid_mode)
	{
		case 0:
			var off_x = last_hilite%8;
			var off_y = Math.floor(last_hilite/8);
			outlet(0, 'mask', 'grid', off_x, off_y, -1);
			last_hilite = selected.offset;
			last_hilite_mod = off_y;
			var off_x = last_hilite%8;
			var off_y = Math.floor(last_hilite/8);
			outlet(0, 'mask', 'grid', off_x, off_y, 10);
			last_mask = ['grid', off_x, off_y, -1];
			break;
		case 1:
			var off_x = last_hilite%8;
			var off_y = Math.floor(last_hilite/8);
			outlet(0, 'mask', 'grid', off_x, off_y, -1);
			last_hilite = selected.offset;
			last_hilite_mod = off_y;
			var off_x = last_hilite%8;
			var off_y = Math.floor(last_hilite/8);
			outlet(0, 'mask', 'grid', off_x, off_y, 3);
			last_mask = ['grid', off_x, off_y, -1];
			break;
		case 2:
			var off_y = last_hilite%8;
			outlet(0, 'mask', 'row', off_y, -1);
			last_hilite = selected.offset;
			last_hilite_mod = Math.floor(selected.offset/8);
			var off_y = last_hilite%8;
			outlet(0, 'mask', 'row', off_y, 10);
			last_mask = ['row', off_y, -1];
			break;
		case 3:
			var off_y = last_hilite%8;
			outlet(0, 'mask', 'row', off_y, -1);
			last_hilite = selected.offset;
			last_hilite_mod = Math.floor(selected.offset/8);
			var off_y = last_hilite%8;
			outlet(0, 'mask', 'row', off_y, 3);
			last_mask = ['row', off_y, -1];
			break; 
		default:
			break;
	}
}

function display_speed()
{
	if(selected.lock > 0)
	{
		p_name[8].message('text', 'quantized');
		outlet(3, 'lcd', 8, 'quantized');
		p_value[8].message('text', (notevaluemenu[selected.obj.notevalues.getvalueof()] + ' ' + notetypemenu[selected.obj.notetype.getvalueof()]));
		outlet(3, 'lcd', 7, (notevaluemenu[selected.obj.notevalues.getvalueof()] + ' ' + notetypemenu[selected.obj.notetype.getvalueof()]));
		pattr_obj.speed.message('set', Math.min(selected.notevalues*12, 127));
	}
	else
	{
		p_name[8].message('text', 'unquantized');
		outlet(3, 'lcd', 8, 'unquantized');
		p_value[8].message('text', selected.obj.ticks.getvalueof() + ' ticks');
		outlet(3, 'lcd', 7, selected.obj.ticks.getvalueof() + ' ticks');
		pattr_obj.speed.message('set', Math.min(parseInt(selected.ticks/10), 127));
	}
}

function dial_in(column, row, val)
{
	if(DEBUG){post('dial_in', column, row, val);}
}

function row_in(num, val)
{
	if(DEBUG){post('row_in', num, val, '\n');}
}

function column_in(num, val)
{
	if(DEBUG){post('column_in', num, val);}
}

// gui invoked processes

function pattr()
{
	if(alive > 0)
	{
		args = arrayfromargs(arguments);
		switch(args[0])
		{
			case 0:
				selected.swing = (args[1] + 100)/200;
				selected.obj.swing.message('float', selected.swing);
				//p_value[1].message('text', parseInt((selected.swing * 200) - 100) + ' %');
				//dial[0][4].val = Math.min((selected.swing * 12), 11);
				//dial[0][4].pattr_val = args[1];
				//outlet(3, 'lcd', 0, parseInt((selected.swing * 200) - 100) + ' %');
				break;
			case 1:
				selected.root = args[1];
				selected.obj.noteoffset.message('int', (selected.octave*12) + selected.root);
				//p_value[2].message('text', notenames[selected.root]);
				//dial[1][4].val = selected.root + 1;
				//dial[1][4].pattr_val = args[1];
				//outlet(3, 'lcd', 1, notenames[selected.root]);
				break;
			case 2:
				selected.octave = args[1];
				selected.obj.noteoffset.message('int', (selected.octave*12) + selected.root);
				//p_value[3].message('text', parseInt(selected.octave));
				//dial[2][4].val = selected.octave + 1;
				//dial[2][4].pattr_val = args[1];
				//outlet(3, 'lcd', 2, parseInt(selected.octave));
				break;
			case 3:
				selected.add = args[1];
				selected.obj.notetype.message('int', args[1]);
				selected.obj.notevalues.message('int', selected.notevalues);
				//p_value[4].message('text', notetypemenu[selected.add]);
				//dial[3][4].val = selected.add + 1;
				//dial[3][4].pattr_val = args[1];
				//outlet(3, 'lcd', 3, notetypemenu[selected.add]);
				//display_speed();
				break;
			case 4:
				selected.channel = args[1];
				selected.obj.channel.message('int', selected.channel);
				//p_value[5].message('text', parseInt(selected.channel));
				//dial[4][4].val = (selected.channel % 10) + 1;
				//dial[4][4].pattr_val = args[1];
				//outlet(3, 'lcd', 4, parseInt(selected.channel));
				break;
			case 5:
				selected.direction = args[1];
				selected.obj.direction.message('int', selected.direction);
				//p_value[6].message('text', dir_menu[selected.direction]);
				//dial[5][4].val = selected.direction + 1;
				//dial[5][4].pattr_val = args[1];
				//outlet(3, 'lcd', 5, dir_menu[selected.direction]);
				break;
			case 6:
				change_length(parseInt(args[1]));
				break;	  
			case 7:
				//post('change_speed', args[1], '\n');
				switch(selected.lock)
				{
					case 0:
						selected.ticks = Math.max(args[1]*10, 10);
						selected.obj.ticks.message('int', selected.ticks);
						break;
					case 1:
						selected.notevalues = Math.max(Math.min(Math.floor(args[1]/12), 7), 0);
						selected.obj.notevalues.message('int', selected.notevalues);
						break;
				}
				display_speed();
				break;
			default:
				break;
		}
		if(dial_mode > 0)
		{
			outlet(2, 'wheel', args[0], 3, 'value', dial[args[0]][4].val);
		}
	}		 
}

function notes(num, val)
{
	if(alive > 0)
	{
		selected.notes_assignment[num] = val;
		selected.obj.notes.message('list', selected.notes_assignment);
	}
}

function solo(val)
{
	solo_mode = val;
	if(alive > 0)
	{
		select_pattern(selected.x_c, selected.y_c);
		//on_solo_mode_changed();
	}
}

function lock(val)
{
	if(alive > 0)
	{
		selected.lock = Math.abs(val-1);
		change_lock_status(selected);
	}
}

function gui_select(num)
{
	if(alive > 0)
	{
		//post('select_pattern', num, '\n');
		select_pattern(num%8, Math.floor(num/8));
	}
}

function refresh_edit_view()
{
	post('refresh_edit_view\m');
	if(shift == 0)
	{
		if(play_mode==0)
		{
			outlet(2, 'row', 0, V[selected.active]);
			outlet(2, 'row', 1, V[selected.lock]);
			edit_offset = selected.offset;				  /////must fix!!!!!!!!!!!!!!!!
			for(var i = 0; i < 8; i++)
			{
				if(i < selected.pattern.length)
				{
					var step = calc_step(i);
					//outlet(2, 'column', i, V[selected.pattern[step]]);
				}
				else
				{
					//outlet(2, 'column', i, 0);
				}
			}
		}
		else if(play_mode==1)
		{
			for(var i=0; i<8; i++)
			{
				//outlet(2, 'column', i, 0);
			}
		}
	}
	else
	{
		if(play_mode==0)
		{
			outlet(2, 'row', 0, V[selected.active]);
			outlet(2, 'row', 1, V[selected.lock]);
			edit_offset = selected.offset;				  /////must fix!!!!!!!!!!!!!!!!
			for(var i = 0; i < 8; i++)
			{
				if(i < selected.pattern.length)
				{
					var step = calc_step(i);
					outlet(2, 'column', i, V[selected.pattern[step]]);
				}
				else
				{
					outlet(2, 'column', i, 0);
				}
			}
		}
		else if(play_mode==1)
		{
			for(var i=0; i<8; i++)
			{
				outlet(2, 'column', i, 0);
			}
		}
	}
}

function refresh_lcd()
{
	post('refresh_lcd\n');
	gui_selected.message('set', selected.num);
	dial[0][4].val = Math.min((selected.swing*12), 11);
	pattr_obj.swing.message('set', parseInt((selected.swing * 200) - 100));
	dial[0][4].pattr_val = parseInt((selected.swing * 200) - 100);
	p_value[1].message('text', parseInt((selected.swing * 200) - 100) + ' %');
	outlet(3, 'lcd', 0, parseInt((selected.swing * 200) - 100) + ' %');

	dial[1][4].val = selected.root + 1;
	pattr_obj.root.message('set', parseInt(selected.root));
	dial[1][4].pattr_val = parseInt(selected.root);
	p_value[2].message('text', notenames[selected.root]);
	outlet(3, 'lcd', 1, notenames[selected.root]);

	dial[2][4].val = selected.octave + 1;
	pattr_obj.octave.message('set', parseInt(selected.octave));
	dial[2][4].pattr_val = parseInt(selected.octave);
	p_value[3].message('text', parseInt(selected.octave));
	outlet(3, 'lcd', 2, parseInt(selected.octave));

	dial[3][4].val = selected.add + 1;
	pattr_obj.add.message('set', selected.add);
	dial[3][4].pattr_val = selected.add;
	p_value[4].message('text', notetypemenu[selected.add]);
	outlet(3, 'lcd', 3, notetypemenu[selected.add]);

	dial[4][4].val = (selected.channel % 10) + 1;
	pattr_obj.channel.message('set', parseInt(selected.channel));
	dial[4][4].pattr_val = parseInt(selected.channel);
	p_value[5].message('text', parseInt(selected.channel));
	outlet(3, 'lcd', 4, parseInt(selected.channel));

	dial[5][4].val = selected.direction + 1;
	pattr_obj.direction.message('set', parseInt(selected.direction));
	dial[5][4].pattr_val = parseInt(selected.direction);
	p_value[6].message('text', dir_menu[selected.direction]);
	outlet(3, 'lcd', 5, dir_menu[selected.direction]);

	dial[6][4].val = (selected.direction % 10);
	pattr_obj.len.message('set', parseInt(selected.len));
	dial[6][4].pattr_val = parseInt(selected.len);
	p_value[7].message('text', selected.len);
	outlet(3, 'lcd', 6, selected.len);
	dial[7][4].val = 0;
	pattr_obj.lock.message('set', parseInt(selected.lock));
	display_speed();
	for(var i=0;i<8;i++)
	{
		pattr_obj.notes[i].message('set', selected.notes_assignment[i]);
	}
	if(dial_mode>0)
	{
		for(var i=0;i<8;i++)
		{
			outlet(2, 'wheel', i, 3, 'value', dial[i][4].val);
		}
	}
}		 

function refresh_dials()
{
	post('refresh_dials\n');
	switch(dial_mode)
	{
		case 0:
			for(var i = 0; i< 8; i++)
			{
				dial[i][3].n = 'wheel';
				outlet(2, 'wheel', i, 3, 'mode', 4);
				outlet(2, 'wheel', i, 3, 'value', dial[i][3].offset);
			}
			break;
		case 1:
			for(var i = 0; i< 8; i++)
			{
				dial[i][3].n = 'dial';
				outlet(2, 'wheel', i, 3, 'mode', dial_modes[i]);
				outlet(2, 'wheel', i, 3, 'value', dial[i][4].val);
			}
			break;
	}
}

//api callback; used for translating lock/unlock timing states
function cb_tempo(args)
{
	if(args[0] == 'tempo')
	{
		song_tempo = args[1];
	}
}


*/