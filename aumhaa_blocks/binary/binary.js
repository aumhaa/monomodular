autowatch = 1;

outlets = 4;
inlets = 5;

//colors:  	main step selector = 1;
//			lenghth chooser = 2;
//			position mask = 3;
//			selected = 4;
//			selected & locked = 5;
//			active = 6;
//			note = 7
//			velocity = 8;
//			locked = 9;
//			position mask alt = 10;
//			play_mode status = 11;
//			Monochrome = 0 1 1 0 1 8 16 1 1 1 8
//			Aumpad = 0 5 4 1 3 10 5 3 2 4 1 10
//			OhmRGB = 
//			Launchpad = 

var cs = 0;
var script = this;
var alive=0;
var tasks=[];
var livid;
var wheel = [];
var dial = [];
var button = [];
var row = [];
var column = [];
var selected;
var edit_offset = 0;
const default_pattern = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
const default_note = [[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]];
const default_velocity = [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5];
var play_mode = 0;
var shift = 0;
var dial_mode = 0;
var dial_speed = 0;
var live_set;
var song_tempo = 120;
var pattrstorage;
var key_pressed = 0;
var grid_mode = 0;
var last_grid_mode = 0;
var last_hilite = 0;
var last_hilite_mod = 0;
var p_name;
var p_value;
var pattr_obj;
var gui_selected;
var alt_val = 0;
var solo_mode = 0;
var last_mask = 0;

var storage;
var preset_selector;
var s_offset = [0, 0];
var preset = 0;
var alt = 0;
const empty = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];


const modes = [[0, 2, 4, 5, 7, 9, 11, 12], [0, 2, 3, 5, 7, 9, 10, 12], [0, 1, 3, 5, 7, 8, 10, 12], [0, 2, 4, 6, 7, 9, 11, 12], [0, 2, 4, 5, 7, 9, 10, 12], [0, 2, 3, 5, 7, 8, 10, 12], [0, 1, 3, 5, 6, 8, 10, 12]];
const dir_menu = ['up', 'down', 'updown'];
const names = [['nudge', 'swing', 'root', 'octave', 'notetype', 'channel', 'direction', 'length', 'interval', ' ', ' ', ' ']]; 
const notevaluemenu = ['128n', '64n', '32n', '16n', '8n', '4n', '2n', '1n'];
const notetypemenu = ['plain', 'dot', 'trip'];
const notenames = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'];
const dial_modes = [2, 0, 0, 0, 0, 0, 1, 0];
const SCALE = {0: 0, 1: 2, 2:4, 3:5, 4:7, 5:9, 6:11, 7:12};
//const V = {0: 0, 1: 127, 2: 1, 3: 32}; 
const V = {0: 0, 1:127, 2:3, 3: 6}; 
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
const OBJECT = ['speed', 'swing', 'phasor', 'steps', 'channel', 'active', 'direction', 'clutch', 'offset', 'ticks', 'notevalues', 'nudge', 'noteoffset'];

// script

function init()
{
	//post('binary b994\n');
	live_set = new LiveAPI(this.patcher, cb_tempo, 'live_set');
	live_set.property = 'tempo';
	pattrstorage = this.patcher.getnamed('binary');
	storage = this.patcher.getnamed('binary');
	preset_selector = this.patcher.getnamed('preset_selector');
	solo_gui = this.patcher.getnamed('solo');
	solo_mode = solo_gui.getvalueof();
	for(var i = 0; i < 8; i++)
	{
		wheel[i] = [];
		dial[i] = [];
		for(var j = 0; j < 5; j++)
		{
			if(j< 4)
			{
				var poly_num = (i + (j*8));
				pattrstorage.message('priorty', 'poly.'+(poly_num+1), 'tickspattr', 10);
				pattrstorage.message('priorty', 'poly.'+(poly_num+1),  'notetypepattr', 11);
				pattrstorage.message('priorty', 'poly.'+(poly_num+1),  'notevaluepattr', 12);
				dial[i][j] = {'n': 'wheel', 'x_c':i, 'y_c':j, 'nudge':0, 'offset':0, 'channel':j, 'len':16, 'start':0, 
							'jitter':0, 'active':0, 'swing':.5, 'lock':0, 'ticks':480, 'notevalues':5, 'notetype':0, 
							'pushed':0, 'direction':0, 'root':SCALE[i], 'octave':5, 'add':0, 'quantize':0};//'speed':480,'notevalue':'4n'
				dial[i][j].num = parseInt(i + (j*8));
				dial[i][j].pattern = default_pattern.slice();
				dial[i][j].note = [[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0],[1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0]];
				//dial[i][j].note = default_note.slice();
				dial[i][j].velocity = default_velocity.slice();
				dial[i][j].obj = [];
				dial[i][j].obj.swing = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('swing');
				dial[i][j].obj.phasor = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('phasor');
				dial[i][j].obj.steps = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('steps');
				dial[i][j].obj.channel = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('channel');
				dial[i][j].obj.active = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('active');
				dial[i][j].obj.direction = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('direction');
				dial[i][j].obj.clutch = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('clutch');
				dial[i][j].obj.offset = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('offset');
				dial[i][j].obj.ticks = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('ticks');
				dial[i][j].obj.notevalues = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('notevalues');
				dial[i][j].obj.notetype = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('notetype');
				dial[i][j].obj.nudge = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('nudge');
			    dial[i][j].obj.noteoffset = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('noteoffset');
				dial[i][j].obj.pattern = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('pattern');
				dial[i][j].obj.note = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('note');
				dial[i][j].obj.notes = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('notes');
				dial[i][j].obj.velocity = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('velocity');
				dial[i][j].obj.quantize = this.patcher.getnamed('poly').subpatcher(poly_num).getnamed('quantize');
				dial[i][j].notes_assignment = dial[i][j].obj.notes.getvalueof();
				outlet(2, 'wheel', i, j, 'mode', 4);
			}
			else
			{
				dial[i][j] = {'n': 'dial', 'x_c': i, 'y_c': j, 'val': 0, 'pushed': 0, 'pattr_val': 0};
				//outlet(2, 'wheel', i, j, 'mode', 1);
			}
		}
	}
	p_name = [];
	p_value = [];
	for(var i = 0; i < 12; i++)
	{		
		p_name[i] = this.patcher.getnamed('name['+(i+1)+']');
		p_value[i] = this.patcher.getnamed('parameter['+(i+1)+']');
	}
	gui_selected = this.patcher.getnamed('selected');
	pattr_obj = [];
	pattr_obj.swing = this.patcher.getnamed('swing');
	pattr_obj.root = this.patcher.getnamed('root');
	pattr_obj.octave = this.patcher.getnamed('octave');
	pattr_obj.add = this.patcher.getnamed('add');
	pattr_obj.channel = this.patcher.getnamed('channel');
	pattr_obj.direction = this.patcher.getnamed('direction');
	pattr_obj.len = this.patcher.getnamed('length');
	pattr_obj.speed = this.patcher.getnamed('speed');
	pattr_obj.notes = [];
	pattr_obj.notes[0] = this.patcher.getnamed('note1');
	pattr_obj.notes[1] = this.patcher.getnamed('note2');
	pattr_obj.notes[2] = this.patcher.getnamed('note3');
	pattr_obj.notes[3] = this.patcher.getnamed('note4');
	pattr_obj.notes[4] = this.patcher.getnamed('note5');
	pattr_obj.notes[5] = this.patcher.getnamed('note6');
	pattr_obj.notes[6] = this.patcher.getnamed('note7');
	pattr_obj.notes[7] = this.patcher.getnamed('note8');
	pattr_obj.lock = this.patcher.getnamed('lock');
	pattr_obj.gate = this.patcher.getnamed('pattrgate');
	for(var i = 0; i < 8; i++)
	{		
		button[i] = [];
		for(var j = 0; j < 4; j++)
		{	
			if(j<4)
			{
				button[i][j] = {'n': 'button', 'x_c': i, 'y_c': j, 'pushed': 0};
				button[i][j].dial = dial[i][j];
			}
			//else
			//{
			//	button[i][j] = {'n': 'alt', 'x_c': i, 'y_c': j, 'pushed': 0};
			//	button[i][j].dial = dial[i][j];
			//}
		}
	}
	for(var k = 0; k < 8; k++)
	{
		column[k] = {'n':'column', 'num':k, 'pushed':0};
	}
	for(var l = 0; l < 4; l++)
	{
		row[l] = {'n': 'row', 'num':l, 'pushed':0};
	}
	//selected = dial[0][0];
	post("Done building Codec API Objects.\n");
	clear_surface();
	outlet(1, 'key', 0, 1);
	selected = dial[0][0];
	select_pattern(0, 0);
	//refresh_edit_view();
	alive = 1;
}

function clear_surface()
{
	outlet(0, 'batch', 'grid', 0);
	for(var i = 0; i < 12; i ++)
	{
		p_name[i].message('text', names[0][i]);
		p_value[i].message('text', ' ');
		outlet(3, 'lcd', i, ' ');
	}
	for(var i = 0; i < 8; i ++)
	{
		outlet(2, 'column', i, V[0]);
		outlet(1, 'key', i, 0);
		for(var j = 0; j < 4; j ++)
		{
			outlet(2, 'wheel', i, j, 'green', 0);
			outlet(2, 'wheel', i, j, 'white', 0);
			dial[i][j].obj.quantize.message('int', dial[i][j].quantize);
			dial[i][j].obj.active.message('int', dial[i][j].active);
			dial[i][j].obj.swing.message('float', dial[i][j].swing);
			dial[i][j].obj.ticks.message(dial[i][j].ticks);
			dial[i][j].obj.phasor.lock = 0;
			dial[i][j].obj.phasor.message('float', 0);
			dial[i][j].obj.noteoffset.message('int', (dial[i][j].octave *12) + dial[i][j].root);
			dial[i][j].obj.pattern.message('list', dial[i][j].pattern);
			dial[i][j].obj.velocity.message('list', dial[i][j].velocity);
			//dial[i][j].obj.note.message('list', dial[i][j].note);
			update_note_pattr(dial[i][j]);
			//outlet(2, 'wheel', i, j, 'custom', dial[i][j].pattern.join('')); 
			outlet(2, 'wheel', i, j, 'custom', dial[i][j].pattern); 		
			outlet(2, 'wheel', i, j, 'value', 0);
		}
	}
	for(var k=0;k<4;k++)
	{
		outlet(2, 'row', k, V[0]);
	}
}

function dissolve()
{
	if(alive>0)
	{
		alive=0;
		post('Ohm64 Monomod script dissolved\n');	 
	}
}

// pattr invoked

function recall()
{
	for(var i = 0; i < 8; i++)
	{
		for(var j = 0; j < 4; j++)
		{
			dial[i][j].pattern = dial[i][j].obj.pattern.getvalueof();
			var note = dial[i][j].obj.note.getvalueof();
			dial[i][j].note = [];
			dial[i][j].notes_assignment = dial[i][j].obj.notes.getvalueof();  //[];
			for(var k=0;k<note.length;k++)
			{
				var new_note = (note[k] + '').split('');
				new_note.shift();
				dial[i][j].note[k] = new_note;
			}
			dial[i][j].velocity = dial[i][j].obj.velocity.getvalueof();
			//outlet(2, 'wheel', dial[i][j].x_c, dial[i][j].y_c, 'custom', dial[i][j].pattern.join(''));
			outlet(2, 'wheel', dial[i][j].x_c, dial[i][j].y_c, 'custom', dial[i][j].pattern);
			dial[i][j].swing = dial[i][j].obj.swing.getvalueof();
			dial[i][j].root = Math.floor(dial[i][j].obj.noteoffset.getvalueof()%12)
			dial[i][j].octave = Math.floor(dial[i][j].obj.noteoffset.getvalueof()/12)
			dial[i][j].add = dial[i][j].obj.notetype.getvalueof();
			dial[i][j].channel = dial[i][j].obj.channel.getvalueof();
			dial[i][j].direction = dial[i][j].obj.direction.getvalueof();
			dial[i][j].len = dial[i][j].obj.steps.getvalueof();
		}
		
	}
	refresh_edit_view();
	//refresh_dials();
	refresh_lcd();
	refresh_grid();
}

// api callbacks and input


function anything()
{
	args = arrayfromargs(arguments);
	if(inlet==1)
	{
		//post('anything ', inlet, messagename, args, '\n');
		switch (messagename)
		{
			case 'row':
				row_in(args[0], args[1]);
				break;
			case 'button':
				button_in(args[0], args[1], args[2]);
				break;
			case 'dial':
				dial_in(args[0], args[1], args[2]);
				break;
			case 'column':
				column_in(args[0], args[1]);
				break;
			default:
				post('unrecognized', args, '\n');
				break;
		}
	}
	else if(inlet==2)
	{
		//post('inlet 2, ', args, '\n');
		grid_in(args[0], args[1], args[2]);
	}
	else if(inlet==3)
	{
		key_in(args[0], args[1]);
	}
	else if(inlet==4)
	{
		post('inlet 4, ', args, '\n');
		alt_in(args[0]);
	}
}

function cb_tempo(args)
{
	if(args[0] == 'tempo')
	{
		song_tempo = args[1];
	}
}

function dial_in(column, row, val)
{
	var this_wheel = dial[column][row];
	if(play_mode == 0)
	{
		if(this_wheel.n == 'wheel')
		{
			if((this_wheel == selected)&&(this_wheel.pushed > 0))
			{
				this_wheel.offset = (this_wheel.offset + val + this_wheel.pattern.length) % this_wheel.pattern.length;
				this_wheel.obj.offset.message('int', this_wheel.offset);
				outlet(2, 'wheel', this_wheel.x_c, this_wheel.y_c, 'value', this_wheel.offset);
				refresh_edit_view();
			}
			else if((this_wheel == selected)&&(shift == 1))
			{
				this_wheel.offset = (this_wheel.offset + val + this_wheel.pattern.length) % this_wheel.pattern.length;
				refresh_edit_view();
				if(dial_mode!='edit')
				{
					//refresh_dials();
				}
			}
			else if(selected.pushed != 1)
			{
				switch(this_wheel.lock)
				{
					case 0:
						this_wheel.ticks = Math.max(this_wheel.ticks + val*(5 + (dial_speed * 45)), 5);
						this_wheel.obj.ticks.message('int', this_wheel.ticks);
						break;
					case 1:
						this_wheel.notevalues = Math.max(Math.min(this_wheel.notevalues + val, 7), 0);
						this_wheel.obj.notevalues.message('int', this_wheel.notevalues);
						break;
				}
				if(this_wheel == selected)
				{
					display_speed();
				}
			}
		}
		else if(this_wheel.n == 'dial')
		{
			switch(this_wheel.x_c)
			{
				case 0:
					dial[0][4].pattr_val = Math.min(Math.max(-100, (dial[0][4].pattr_val + (val * 5))), 100);
					pattr_obj.swing.message('int', dial[0][4].pattr_val);
					break;
				case 1:
					dial[1][4].pattr_val = Math.min(Math.max(0, (dial[1][4].pattr_val + val)), 12);
					pattr_obj.root.message('int', dial[1][4].pattr_val);
					break;
				case 2:
					dial[2][4].pattr_val = Math.min(Math.max(0, (dial[2][4].pattr_val + val)), 12);
					pattr_obj.octave.message('int', dial[2][4].pattr_val);
					break;
				case 3:
					dial[3][4].pattr_val = Math.min(Math.max(0, (dial[3][4].pattr_val + val)), 2);
					pattr_obj.add.message('int', dial[3][4].pattr_val);
					break;
				case 4:
					dial[4][4].pattr_val = Math.min(Math.max(0, (dial[4][4].pattr_val + val)), 16);
					pattr_obj.channel.message('int', dial[4][4].pattr_val);
					break;
				case 5:
					dial[5][4].pattr_val = Math.min(Math.max(0, (dial[5][4].pattr_val + val)), 2);
					pattr_obj.direction.message('int', dial[5][4].pattr_val);
					break;
				case 6:
					dial[6][4].pattr_val = Math.min(Math.max(1, (dial[6][4].pattr_val + val)), 64);
					pattr_obj.len.message('int', dial[6][4].pattr_val);
					break;		
				default:
					//this_wheel.val = 0;
					break;
				//case 0:
				//	selected.nudge = Math.abs((selected.nudge + val + selected.pattern.length) % selected.pattern.length);
				//	selected.obj.nudge.message('int', selected.nudge);
				//	p_value[0].message('text', selected.nudge % selected.len);
				//	this_wheel.val = Math.round((selected.nudge / selected.pattern.length) * 13);
				//	refresh_edit_view();
				//	break;
			}
		}
	}
}

function row_in(num, val)
{
	this_row = row[num];
	this_row.pushed = val;
	if(val>0)
	{
		if(shift==0)
		{
			switch(num)
			{
				case 0:
					change_play_status(selected);
					outlet(2, 'row', num, V[selected.active]);
					break;
				case 1:
					change_lock_status(selected);
					outlet(2, 'row', num, V[selected.lock]);
					break;
				case 3:
					//shift = Math.abs(shift-1);  ///next 3 untested...where the hell is shift??!!
					//outlet(2, 'row', num, V[shift]);
					dial_mode = Math.abs(dial_mode-1);
					outlet(2, 'row', num, V[dial_mode]);
					refresh_dials();
					//refresh_lcd();
					break;
				case 2:
					dial_speed = Math.abs(dial_speed-1);
					outlet(2, 'row', num, dial_speed);
					break;
			}
		}
	}
}

function column_in(num, val)
{
	//post('column_in', num, val);
	if((val>0)&&(num<8))
	{
		var step = calc_step(num);
		selected.pattern[step]=Math.abs(selected.pattern[step]-1);
		selected.obj.pattern.message('list', selected.pattern);
		//outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern.join('')); 
		outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern); 
		outlet(2, 'column', num, V[selected.pattern[step]]);
		refresh_grid();
	}
}

function button_in(x, y, val)
{
	var this_button = button[x][y];
	this_button.dial.pushed = val;
	if(this_button.n == 'button')
	{
		if(play_mode == 1)
		{
			if(shift == 1)
			{
				if(val > 0)
				{
					change_play_status(this_button.dial);
				}
			}
			else if(shift == 0)
			{
				set_play_status(this_button.dial);
			}
		}
		else if(play_mode < 1)
		{
			if(shift==1)
			{
				if((val > 0)&&(this_button.dial==selected))
				{
					change_lock_status(this_button.dial);
				}
			}
			else if(shift<1)
			{
				if((this_button.dial!=selected)&&(selected.pushed==0))
				{
					select_pattern(this_button.x_c, this_button.y_c);
				}
				else if((this_button.dial==selected)&&(this_button.dial.pushed==1))
				{
					this_button.dial.obj.clutch.message('int', 0);
				}
				else if((this_button.dial == selected)&&(this_button.dial.pushed == 0))
				{
					this_button.dial.obj.clutch.message('int', 1);
				}
				else if(selected.pushed == 1)
				{
					sync_wheels(this_button.dial, selected);
				}
			}
		}	
	}
}

function grid_in(x, y, val)
{
	//post('x', x, 'y', y, 'val', val, '\n');
	if(alt > 0)
	{
		if(val>0)
		{
			//post('alt press', x, y, s_offset[0], s_offset[1], '\n');
			if(y < (4 + s_offset[1]))
			{	
				//post((x-s_offset[0]) + (y-(s_offset[1]*8)), 'recall', '\n');
				preset_selector.message((x-s_offset[0]) + ((y-s_offset[1])*8) +1);
			}
			else
			{
				//post('store', (x-s_offset[0]) + ((y-(s_offset[1])-4)*8) +1);
				preset_selector.message('store', (x-s_offset[0]) + (((y-s_offset[1])-4)*8) +1);
			}
			storage.message('getslotlist');
		}
	}
	else
	{
		switch(grid_mode)
		{
			case 0:
				if(val>0)
				{
					var step_num = x + (y*8);
					if(step_num < selected.pattern.length)
					{
						selected.pattern[step_num] = Math.abs(selected.pattern[step_num]-1);
						selected.obj.pattern.message('list', selected.pattern);
						//outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern.join(''));
						outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern);
						//outlet(2, 'column', num, V[selected.pattern[step_num]]);  //this needs to be conditioned to whether or not the step is currently in view
						refresh_grid();
					}
				}
				break;
			case 1:
				if(val>0)
				{
					var step_num = x + (y*8);
					change_length(step_num + 1);
				}
				break;
			case 2:
				if(val>0)
				{
					var step_num = y + (last_hilite_mod*8);
					if(x < selected.note[step_num].length)
					{
						selected.note[step_num][x] = Math.abs(selected.note[step_num][x]-(x+1));
						//outlet(0, 'batch', 'column', x, 0);
						outlet(0, 'grid', x, y, (selected.note[step_num][x]!=0)*7);
						update_note_pattr(selected);
					}
					//selected.obj.note.message('list', selected.note);
				}
				break;
			case 3:
				if(val>0)
				{
					var step_num = y + (last_hilite_mod*8);
					selected.velocity[step_num] = x;
					for(var i=0;i<8;i++)
					{
						outlet(0, 'grid', i, y, (i<=x)*8);
					}
					selected.obj.velocity.message('list', selected.velocity);
				}
				break;
			case 4:
				//dial[x][y].active = Math.abs(dial[x][y].active - 1);
				if(play_mode == 0)
				{
					if((y<4)&&(val>0))
					{	
						change_play_status(dial[x][y]);
					}
				}
				else
				{
					if(y<4)
					{
						dial[x][y].pushed = val;
						set_play_status(dial[x][y]);
					}
				}
				break;
			//case 5:
			//	if(y<4)
			//	{
			//		dial[x][y].pushed = val;
			//		set_play_status(dial[x][y]);
			//	}
			//	break;
			case 6:
				if((y<4)&&(val>0))
				{
					select_pattern(x, y);
				}
				break;
			default:
				break;
		}
	}
}

function key_in(num, val)
{
	//post('key in', num, val, '\n');
	if(num < 4)
	{
		key_pressed = val;
	}
	if(val > 0)
	{
		switch(num)
		{
			case 5:
				change_play_mode();
				break;
			case 6:
				grid_mode = num;
				outlet(1, 'key', num, 1);
				break;
			case 7:
				change_lock_status(selected);
				break;
			default:
				grid_mode = num;
				break;
		}
		for(var i=0;i<5;i++)
		{
			outlet(1, 'key', i, i==grid_mode);
		}
		if(num < 5)
		{
			last_grid_mode = grid_mode;
		}
		refresh_grid();
	}
	else
	{
		if(num==6)
		{
			outlet(1, 'key', num, 0);
			grid_mode = last_grid_mode;
			refresh_grid();
		}
	}
}

// internal processes

function select_pattern(x_c, y_c)
{
	demask();
	outlet(2, 'wheel', selected.x_c, selected.y_c, 'white', 0);
	selected = dial[x_c][y_c];
	outlet(2, 'wheel', x_c, y_c, 'white', V[selected.lock + 1]);
	refresh_dials();
	refresh_edit_view();
	refresh_lcd();
	refresh_grid();
	if(solo_mode > 0)
	{
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<4;j++)
			{
				if(dial[i][j].active!=(dial[i][j]==selected))
				{
					change_play_status(dial[i][j]);
				}
			}
		}
	}
}	

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

function rotate(row, column, val)
{
	if((key_pressed == 0)&&(alive > 0))
	{
		dial[column][row].offset = dial[column][row].offset + val;
		if(dial[column][row].n == 'wheel')
		{
			outlet(2, 'wheel', column, row, 'value', dial[row][column].offset);
		}
		if(dial[column][row] == selected)
		{
			refresh_edit_view();
			if((Math.floor(selected.offset/8) != last_hilite_mod)&&(grid_mode>1))
			{
				refresh_grid();
			}
			if(grid_mode<4)
			{
				hilite_grid();
			}
		}
	}
}

function rotate_to(number, offset)
{
	//post('rotate_to', number, offset, '\n');
	if((key_pressed == 0)&&(alive > 0))
	{
		var column = (number-1) % 8;
		var row = Math.floor((number-1) / 8);
		if(dial[column][row].n == 'wheel')
		{
			outlet(2, 'wheel', column, row, 'value', offset);
		}
		if((dial[column][row] == selected)&&(shift==0))//&&(selected.pushed == 0))  ////watch out for this one!!!!
		{
			dial[column][row].offset = offset;
			refresh_edit_view();
			if((Math.floor(selected.offset/8) != last_hilite_mod)&&(grid_mode>1))
			{
				refresh_grid();
			}
			if(grid_mode<4)
			{
				hilite_grid();
			}
			if(dial_mode!='edit')
			{
				//refresh_dials();
			}
		}
		else if(dial[column][row]!=selected)
		{
			dial[column][row].offset = offset;
		}
	}
}

function change_direction(wheel)
{
	if(wheel.speed<0)
	{
		wheel.direction = 'dec';
	}
	else
	{
		wheel.direction = 'inc';
	}
	wheel.obj.direction.message('set', wheel.direction);
}

function reset_rotation(row, column)
{
	dial[row][column].offset = 0;
	dial[row][column].obj.offset.message('int', 0);
	outlet(2, 'wheel', column, row, 'value', 0);
}

function resync(wheel)
{
	post('insert resync here ;)\n');
}

function change_play_status(wheel)
{
	wheel.active = Math.abs(wheel.active - 1);
	wheel.obj.active.message('int', wheel.active);
	outlet(2, 'wheel', wheel.x_c, wheel.y_c, 'green', wheel.active);
	if((grid_mode>3)&&(grid_mode<6))
	{
		outlet(0, 'grid', wheel.x_c, wheel.y_c, (wheel.active)*6);
	}
}

function set_play_status(wheel)
{
	wheel.active = wheel.pushed;
	wheel.obj.active.message('int', wheel.active);
	outlet(2, 'wheel', wheel.x_c, wheel.y_c, 'green', wheel.active);
	if((grid_mode>3)&&(grid_mode<6))
	{
		outlet(0, 'grid', wheel.x_c, wheel.y_c, (wheel.active)*6);
	}
}

function change_play_mode()
{
	play_mode = Math.abs(play_mode - 1);
	outlet(1, 'key', 5, play_mode * 11);
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
	update_note_pattr(selected);
	selected.obj.pattern.message('list', selected.pattern);
	//outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern.join(''));
	selected.obj.steps.message('int', selected.len - 1);
	p_value[7].message('text', selected.len);
	dial[6][4].val = selected.len%10;
	dial[6][4].pattr_val = selected.len;
	refresh_grid();
}

function change_lock_status(wheel)
{
	wheel.lock = Math.abs(wheel.lock - 1);
	wheel.obj.phasor.lock = 0;
	switch(wheel.lock)
	{
		case 0:
			wheel.obj.quantize.message('int', 0);
			var current_notevalue = wheel.obj.notevalues.getvalueof();
			var current_notetype = wheel.obj.notetype.getvalueof();
			var new_speed = 20;
			for(var i = 0; i < TRANSLATE.length; i++)
			{
				if ((TRANSLATE[i]['notevalue'] == current_notevalue) && (TRANSLATE[i]['notetype'] == current_notetype))
				{
					new_speed = TRANSLATE[i];
					break;
				}
			}
			break;
		case 1:
			wheel.obj.quantize.message('int', 1);
			var current_ticks = wheel.obj.ticks.getvalueof();
			var new_speed = 20;
			for(var i = 0; i < TRANSLATE.length; i++)
			{
				if (current_ticks >= TRANSLATE[i]['ticks'])
				{
					new_speed = TRANSLATE[i];
				}
			}
			break;
	}
	wheel.ticks = new_speed['ticks'];
	wheel.notevalues = new_speed['notevalue'];
	wheel.notetype = new_speed['notetype'];
	wheel.obj.ticks.message('int', new_speed.ticks);
	wheel.obj.notetype.message('int', new_speed.notetype);
	wheel.obj.notevalues.message('int', new_speed.notevalue);
	//select_pattern(selected.x_c, selected.y_c);
	outlet(2, 'wheel', selected.x_c, selected.y_c, 'white', V[wheel.lock + 1]);
	if(wheel == selected)
	{
		outlet(1, 'key', 7, selected.lock * 9);
		outlet(2, 'row', 1, V[wheel.lock]);
	}
	refresh_lcd();
}

// display routines

function refresh_edit_view()
{
	if(shift == 0)
	{
		if(play_mode==0)
		{
			outlet(2, 'row', 0, V[selected.active]);
			outlet(2, 'row', 1, V[selected.lock]);
			edit_offset = selected.offset;				/////must fix!!!!!!!!!!!!!!!!
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
	else
	{
		if(play_mode==0)
		{
			outlet(2, 'row', 0, V[selected.active]);
			outlet(2, 'row', 1, V[selected.lock]);
			edit_offset = selected.offset;				/////must fix!!!!!!!!!!!!!!!!
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

function refresh_grid()
{
	demask();
	switch (grid_mode)
	{
		case 0:
			for(var i=0;i<8;i++)
			{
				for(var j=0;j<8;j++)
				{
					if(i+(j*8)<selected.pattern.length)
					{
						var step = selected.pattern[(i + (j*8))];
						outlet(0, 'grid', i, j, step);
					}
					else
					{
						outlet(0, 'grid', i, j, 0);
					}
				}
			}
			break;
		case 1:
			for(var i=0;i<8;i++)
			{
				for(var j=0;j<8;j++)
				{
					if(i+(j*8)<selected.pattern.length)
					{
						outlet(0, 'grid', i, j, 2);
					}
					else
					{
						outlet(0, 'grid', i, j, 0);
					}
				}
			}
			break;
		case 2:
			//post('update note\n');
			for(var i=0;i<8;i++)
			{
				var step = (Math.floor(selected.offset/8) *8) + i;
				//outlet(0, 'batch', 'grid', 0);
				//post('selected', selected.note[i], selected.x_c, selected.y_c, '\n');
				for(var j=0;j<8;j++)
				{
					if(step < selected.pattern.length)
					{
						outlet(0, 'grid', j, i, (selected.note[step][j]!=0) * 7);
					}
				}
			}
			break;
		case 3:
			for(var i=0;i<8;i++)
			{
				var step = (Math.floor(selected.offset/8) *8) + i;
				for (var j=0;j<8;j++)
				{
					if(step < selected.pattern.length)
					{
						outlet(0, 'grid', j, i, (j<=selected.velocity[step]) * 8);
					}
				}	
			}
			break;
		case 4:
			//outlet(0, 'batch', 'grid', 0);
			for(var i=0;i<8;i++)
			{
				for(var j=0;j<8;j++)
				{
					if(j<4)
					{
						outlet(0, 'grid', i, j, (dial[i][j].active)*6);
					}
					else
					{
						outlet(0, 'grid', i, j, 0);
					}
				}
			}
			break;
		case 6:
			outlet(0, 'batch', 'grid', 0);
			outlet(0, 'grid', selected.x_c, selected.y_c, (selected.lock)+4);
			break;
	}
}

function hilite_grid()
{
	//post(grid_mode, '\n');
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

function demask()
{
	if(last_mask.length == 3)
	{
		outlet(0, 'batch', last_mask[0], last_mask[1], last_mask[2]);
	}
	else if(last_mask.length == 2)
	{
		outlet(0, 'batch', last_mask[0], last_mask[1]);
	}
}

function display_speed()
{
	if(selected.lock > 0)
	{
		p_name[8].message('text', 'quantized');
		p_value[8].message('text', (notevaluemenu[selected.obj.notevalues.getvalueof()] + ' ' + notetypemenu[selected.obj.notetype.getvalueof()]));
		pattr_obj.speed.message('set', Math.min(selected.notevalues*12, 127));
	}
	else
	{
		p_name[8].message('text', 'unquantized');
		p_value[8].message('text', selected.obj.ticks.getvalueof() + ' ticks');
		pattr_obj.speed.message('set', Math.min(parseInt(selected.ticks/10), 127));
	}
}

// gui invoked processes

function pattr()
{
	if(alive > 0)
	{
		args = arrayfromargs(arguments);
		if(args[0]!='wheel')
		{
			//post('pattr', args, '\n');
			switch(args[0])
			{
				case 0:
					selected.swing = (args[1] + 100)/200;
					selected.obj.swing.message('float', selected.swing);
					p_value[1].message('text', parseInt((selected.swing * 200) - 100) + ' %');
					dial[0][4].val = Math.min((selected.swing * 12), 11);
					dial[0][4].pattr_val = args[1];
					break;
				case 1:
					selected.root = args[1];
					selected.obj.noteoffset.message('int', (selected.octave*12) + selected.root);
					p_value[2].message('text', notenames[selected.root]);
					dial[1][4].val = selected.root + 1;
					dial[1][4].pattr_val = args[1];
					break;
				case 2:
					selected.octave = args[1];
					selected.obj.noteoffset.message('int', (selected.octave*12) + selected.root);
					p_value[3].message('text', parseInt(selected.octave));
					dial[2][4].val = selected.octave + 1;
					dial[2][4].pattr_val = args[1];
					break;
				case 3:
					selected.add = args[1];
					selected.obj.notetype.message('int', args[1]);
					selected.obj.notevalues.message('int', selected.notevalues);
					p_value[4].message('text', notetypemenu[selected.add]);
					dial[3][4].val = selected.add + 1;
					dial[3][4].pattr_val = args[1];
					display_speed();
					break;
				case 4:
					selected.channel = args[1];
					selected.obj.channel.message('int', selected.channel);
					p_value[5].message('text', parseInt(selected.channel));
					dial[4][4].val = (selected.channel % 10) + 1;
					dial[4][4].pattr_val = args[1];
					break;
				case 5:
					selected.direction = args[1];
					selected.obj.direction.message('int', selected.direction);
					p_value[6].message('text', dir_menu[selected.direction]);
					dial[5][4].val = selected.direction + 1;
					dial[5][4].pattr_val = args[1];
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
				//post('typeof', typeof(args[0]), args[0], args, '\n');
				outlet(2, 'wheel', args[0], 3, 'value', dial[parseInt(args[0])][4].val);
			}
			switch(args[0])
			{
				case 0:
					outlet(3, 'lcd', 0, parseInt((selected.swing * 200) - 100) + ' %');
					break;
				case 1:
					outlet(3, 'lcd', 1, notenames[selected.root]);
					break;
				case 2:
					outlet(3, 'lcd', 2, parseInt(selected.octave));					
					break;
				case 3:
					outlet(3, 'lcd', 3, notetypemenu[selected.add]);				
					break;
				case 4:
					outlet(3, 'lcd', 4, parseInt(selected.channel));				
					break;
				case 5:
					outlet(3, 'lcd', 5, dir_menu[selected.direction]);					
					break;
				case 6:
					outlet(3, 'lcd', 6, selected.len);
					outlet(2, 'wheel', selected.x_c, selected.y_c, 'custom', selected.pattern);					
					break;
				case 7:
					if(selected.lock > 0)
					{	
						outlet(3, 'lcd', 8, 'quantized');
						outlet(3, 'lcd', 7, (notevaluemenu[selected.obj.notevalues.getvalueof()] + ' ' + notetypemenu[selected.obj.notetype.getvalueof()]));
					}
					else
					{
						outlet(3, 'lcd', 8, 'unquantized');
						outlet(3, 'lcd', 7, selected.obj.ticks.getvalueof() + ' ticks');
					}
			}
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

// storage routines

function update_note_pattr(dial)
{
	//post('note to pattr', note, '\n');
	var out = [];
	for(var i=0;i< dial.note.length;i++)
	{
		var step_out = '1' + dial.note[i].join('');
		out[i] = step_out;
	}
	//post('out', out, '\n');
	dial.obj.note.message('list', out);
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
			outlet(0, 'grid', (args[i]-1)%8 + s_offset[0], Math.floor((args[i]-1)/8) + s_offset[1], (1 + (args[i]==preset)));
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
	outlet(2, 'row', 3, V[dial_mode]);
}

function refresh()
{
	for(var i = 0; i< 8; i++)
	{
		for(var j = 0; j< 3; j++)
		{
			//outlet(2, 'wheel', i, j, 'custom', dial[i][j].pattern.join('')); 
			outlet(2, 'wheel', i, j, 'custom', dial[i][j].pattern); 
			outlet(2, 'wheel', i, j, 'value', dial[i][j].offset);
			outlet(2, 'wheel', i, j, 'white', Math.floor(dial[i][j] == selected));
			outlet(2, 'wheel', i, j, 'green', dial[i][j].active);
			if(dial[i][j]==selected)
			{
				outlet(2, 'wheel', i, j, 'white', V[dial[i][j].lock + 1]);
			}
			else
			{
				outlet(2, 'wheel', i, j, 'white', 0);
			}
		}
	}
	//refresh_edit_view();
}








