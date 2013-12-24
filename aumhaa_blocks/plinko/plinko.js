autowatch=1

inlets=4
outlets=3

setinletassist(0,"pulse input");
setinletassist(1,"grid input");
setinletassist(2,"key input");
setinletassist(3,"program input");
setoutletassist(0,"diplay output");
setoutletassist(1,"note out");
setoutletassist(2,"to preset");

var script = this;

var DEBUG = false;

var alt = 0;
var loop=1;
var part_limit=8;
var args=[];
var dump=[];
var p=[];
var bnd_cell=[];
var linked=0;
var mode=0;
var active=-1;	  //changed from 0 to -1 to get first button in
var dirbin=[];
var pressed=-1;	  //changed from 0 to -1 to get first button in
var offset=(mode*6);
var s_offset = [0, 0];
var x_display_offset=0;
var y_display_offset=0;
var waiting_for_wormhole=0;
var note=0;
var wormhole=0;
var probability=0;
var plane=9;
var pot_array=[];
var pot_array_temp=[]; 
x_adj=[1, 0, -1, 1, -1, 1, 0, -1, 0];
y_adj=[1, 1, 1, 0, 0, -1, -1, -1, 0];
var cleared_program=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var preset_program=[0,0,1,0,4,4,0,0,3,0,4,4,0,0,5,0,4,4,0,0,7,0,4,4,0];
var empty = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2];
var display=[];
var prog=[];
var cell=[];


var pot_insert_coll=[];
var monomap = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var timer = 0;
var alive = false;
var last = 0;
var from_pattr = 'none';
var offset = [0, 0];

var pattrs;
var storage;
var preset_selector;
var preset = 0;

function make_cell_function(cell)
{
	var cell_function = function()
	{
		args = arrayfromargs(arguments);
		if(alive > 0)
		{
			prog[cell._x][cell._y]=args.slice();
			for(var p=0;p<25;p++)
			{
				outlet(2, "set", cell._x, cell._y, p, args[p]);
			}
		}
		//post('testing', cell._name, cell._prog, '\n');
	}
	return cell_function;
}

function update_storage(cell, prog)
{
	storage.message('pattrs::'+cell._name, prog); //prog[0], prog[1], prog[2], prog[3], prog[4], prog[5], prog[6], prog[7], prog[8], prog[9],prog[10], prog[11], prog[12], prog[13], prog[14], prog[15], prog[16],prog[17], prog[18], prog[19], prog[20], prog[21], prog[22], prog[23], prog[24]);
	storage.setstoredvalue('pattrs::'+cell._name, preset, prog);
}

function recall(val)
{
	preset = val;
	this.patcher.getnamed('storage_preset').set(parseInt(preset));
	if(DEBUG){post('new preset# is:', val, '\n');}
	if(alive > 0)
	{
		update_bound_view();
	}
}

function last_preset(val)
{
	preset = val;
}

//////////////////////////////////////////////////////////////////////
//////////////	   This is the Engine Itself	  ////////////////////
//////////////////////////////////////////////////////////////////////

function init_plinko() 
{

	storage = this.patcher.getnamed('plinko_preset');
	preset_selector = this.patcher.getnamed('preset_selector');
	pattrs = this.patcher.getnamed('pattrs').subpatcher();
	for(var d=0;d<16;d++)
	{
		display[d]=[]; 
		prog[d]=[];	
		cell[d]=[];	   
		for(var dd=0;dd<16;dd++)
		{
			display[d][dd]=[0,0,0];		 ///create the display arrays:16x16x3, one for each cell:edit, program, node
			prog[d][dd]=[];
			cell[d][dd]=[];
			cell[d][dd]._x = d;
			cell[d][dd]._y = dd;
			cell[d][dd]._name = 'cell['+(d+1)+']['+(dd+1)+']';
			cell[d][dd]._pattr = pattrs.getnamed(cell[d][dd]._name);
			cell[d][dd]._prog=prog[d][dd];
			if(cell[d][dd]._pattr.getvalueof()>0)
			{
				prog[d][dd]=cell[d][dd]._pattr.getvalueof().slice();   ///cells are : (direction, wormhole, probability, note)
			}
			else
			{
				prog[d][dd]=preset_program.slice();
			}
			prog[d][dd]._cell = cell[d][dd];
			script['pattrs::'+cell[d][dd]._name] = make_cell_function(cell[d][dd]);
		}																	   ///			   [velocity, duration aren't implemented] 
	}
	//if(from_pattr!='none')
	//{
	//	post('assigning from pattr\n');
	//	for(var x=0;x<16;x++)
	//	{
	//		for(var y=0;y<16;y++)
	//		{
	//			for(var p=0;p<25;p++)
	//			{
	//				data = from_pattr[((x+(y*16))*25 + p)];
	//				prog[x][y][p] = data;
	//				outlet(2, 'set', x, y, p, data);
	//			}
	//		}
	//	}
	//}	
	//else
	//{											 
	//	for(var d=0;d<16;d++)																	  
	//	{
			//display[d]=[]; 
			//prog[d]=[];		   
	//		for(var dd=0;dd<16;dd++)
	//		{
	//			display[d][dd]=[0,0,0];		 ///create the display arrays:16x16x3, one for each cell:edit, program, node
	//			prog[d][dd]=preset_program.slice();   ///cells are : (direction, wormhole, probability, note)
	//			for(var p = 0;p<25;p++)
	//			{
	//				outlet(2, 'set', d, dd, p, prog[d][dd][p]);
	//			}
	//		}																	   ///			   [velocity, duration aren't implemented] 
	//	}
	//}														  ///matrix containing all program data: 6 cells per plane, 25 is start
	//post("matrices instantiated:)\n"); 
	alive = true;
	//this.patcher.getnamed('timer').message('bang');
	///update_bound_view();
	/*if(DEBUG){
		for(var i in prog)
		{
			post('prog:', prog, '\n');
		}
	}*/
	preset_selector.message('int', preset);
	//outlet(1, 'offset', 1);
}

///function init_plinko(){}

function fire_node()
{	///place potential in a cell for inclusion on next turn:  this is where we play plinko in realtime
	set_potential(Math.floor(active%16), Math.floor(active/16), 4);
}

function bang()
{
	if(inlet==3)			
	{
		clock();
	}
}

function clear_edit()
{///clear the edit plane of the display array
	for(var d=0;d<16;d++)
	{
		for(var dd=0;dd<16;dd++)
		{
			display[d][dd][0]=0;
		}
	}
}

function clock()
{
	timer++;
}

function anything()
{
	//post(arrayfromargs(messagename, arguments), '\n');
	return;
}

//////////////////////////////////////////////////////////////////////
//////////////	   This is the Editor for Launchpad		//////////////
//////////////////////////////////////////////////////////////////////

function surface_offset(x, y)
{
	//post('plinko offset', x, y, '\n');
	s_offset = [x, y];
}

function list(x,y,z)
{
	//post('list', x, y, z, '\n');
	if(inlet==1)							//main input from launchpad grid
	{  
		if(alt != 1)
		{
			pressed=(x+(y*16));					//translate to single int
			if(z==0)							//if any button is released
			{  
				if(linked==1)					//was button linked?
				{
					if(pressed!=active)			//is button released NOT the one that was linked?
					{
						return;
					}
					else if(pressed==active)	//unlink, update display
					{	
						linked=0;				//notify key is lifted 
						active=-1;				//notify remove "which key" //changed from 0 to -1 to get first button in
						display[x][y][0]=0;		//update key on edit screen
						for(var n=0;n<8;n++)
						{
							adj_bndx=(bndx-(x_adj[n]));
							adj_bndy=(bndy-(y_adj[n]));
							if((adj_bndx>=0)&&(adj_bndx<=15)&&(adj_bndy>=0)&&(adj_bndy<=15))
							{
								display[adj_bndx][adj_bndy][1]=0;
							}
						} 
						pressed=-1;				//changed from 0 to -1 to get first button in
						clear_program();		//program clear
						update_bound_view();
						display_edit();
						//outlet(0, "edit_gate", 2);
						return;
					}
				}
				else if(linked==0)			 //button besides linked is released
				{
					return;
				}
			}
			else if(z==1)					//if button is pressed
			{
				if(linked==0)				//there was no link
				{
					linked=1;				//notify key held
					active=pressed;			//notify which key
					display[x][y][1]=19;	//update key on edit screen
					call_bound_node();
					return;
				}
				else if(linked==1)			//update direction
				{
					if(waiting_for_wormhole==1)		//if the script is waiting for a wormhole assignment for this node
					{
						waiting_for_wormhole=0;		//it's not anymore...
						assign_wormhole(pressed);	//because it just assigned a wormhole
						display_properties();		//refresh properties display (necessary?)
						return;
					}
					else
					{
						pressed_x=Math.floor(active%16);	//change raw to x
						pressed_y=Math.floor(active/16);	//change raw to y
						if((Math.abs(x-pressed_x)<=1)&&(Math.abs(y-pressed_y)<=1))	//if pressed key is neighboring active node
						{
							switch(active-((y*16)+x))		//calculate difference between node and pressed key
							{
								case 17:
									dir_assign=0;			//determine direction and break
									break;
								case 16:
									dir_assign=1;
									break;
								case 15:
									dir_assign=2;
									break;
								case 1:
									dir_assign=3;
									break;
								case -1:
									dir_assign=4;
									break;
								case -15:
									dir_assign=5;
									break;
								case -16:
									dir_assign=6;
									break;
								case -17:
									dir_assign=7;
									break;
							}
							assign_direction(dir_assign);	//assign direction to program matrix
							return;
						}
						else								//if pressed key is outside of neighboring cells assign new property
						{
							if((y>=y_display_offset)&&(y<=(y_display_offset+7))&&(x>=x_display_offset)&&(x<=(x_display_offset+2)))
							{								
								var xx=(x-x_display_offset);
								var yy=(y-y_display_offset);
								switch(xx)
								{
									case 0:
										assign_note(displayed_note+(Math.abs(yy-7)*8));
										break;
									case 1:
										assign_note((displayed_octave*8)+Math.abs(yy-7));
										break;
									case 2:
										assign_probability(Math.abs(yy-7));
										break;
								}
								call_bound_node();
							}
							else
							{  
								return;
							}
						}
					}
				}
			}
		}
		else
		{
			if(z>0)
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
	}
	else //return from (query to pattr)
	{
		//post("list in inlet other than 1st, shouldn't happen\n");
		return;
	}
}

function slot(val)
{
	if(DEBUG){post('new slot# is:', val, '\n');}
}

function slotlist()
{
	args = arrayfromargs(arguments);
	//post('slotlist', args, '\n');
	var loaded = empty.slice();
	if(alt>0)
	{
		outlet(0, 'clear');
		for(var i=0;i<args.length;i++)
		{
			outlet(0, (args[i]-1)%8 + s_offset[0], Math.floor((args[i]-1)/8) + s_offset[1], 1 + (args[i]==preset));
			//post(0, (args[i]-1)%7 + s_offset[0], Math.floor((args[i]-1)/7) + s_offset[1], 1, '\n');
			loaded[args[i]-1] = 0;
		}
		for(var j=0;j<4;j++)
		{
			for(var k=0;k<8;k++)
			{
				outlet(0, k + s_offset[0], j+4 + s_offset[1], loaded[((j*8)+k)]);
			}
		}
	}
} 
	
function call_bound_node()
{
	if(pressed>=0)
	{
		linked=1;									//notify key held
		offset=(mode*6);							//pointer in program for plane reference
		bndx=(Math.floor(active%16));				//raw program (0-256) to x
		bndy=(Math.floor(active/16));				//raw program (0-256) to y
		bind(prog[bndx][bndy]);			  //bind the editor to the cell being pressed
		display_program();							//output the program layer of the display to the control surface
		display_editor();
	}
}

function bind(args)
{///this is called when a cell is bound to a key
	var bin = parseInt(args[offset]).toString(2);	///calculate a (local) binary number from the raw direction attribute for the plane (00000000-11111111)
	dir_raw=parseInt(args[offset]);					///register the (global) raw direction for the plane (0-256)
	dirbin= bin.split("").reverse();				///cast the dump value to a (global) binary string, split to array, and reverse
	for(var b=0;b<8;b++)								///fill in zeros for empty direction registers
	{
		if(!dirbin[b])
		{
			dirbin[b]=0;
		}
	}
	start_cell=(args[24]);							///find out if the cell contains a loopstart node
	display[bndx][bndy][1]=(start_cell*19)-1;		///place the loopstart status in the display array
	wormhole=(args[offset+1]);						///find out if the plane has a wormhole assigned
	probability=(args[offset+2]);					///find out the probability of the plane
	note=(args[offset+3]);							///find out the note assigned to the plane
	velocity=(args[offset+4]);						///find out the velocity of the note assigned (not implemented in editor)
	duration=(args[offset+5]);						///find out the duration of the note assigned (not implemented in editor)
	display_directions();							///display the assigned directions for the plane of the node
	display_properties();							///display the properties for the plane of the node
	display_editor();
}

function display_editor()
{
	return;
	//outlet(0, "editor", prog[bndx][bndy]);					  ///output the program data to be displayed in the plugin's editor window
}

function clear_program()
{///clear the program layer of the diplay array
	for(var d=0;d<16;d++)
	{
		for(var dd=0;dd<16;dd++)
		{
			display[d][dd][1]=0;
		}
	}
}

function assign_wormhole(wormhole_in)
{	///assign a wormhole to the program matrix and display it
	wormhole=wormhole_in;
	prog[bndx][bndy][(offset)+1]=wormhole;
	outlet(2, "set", bndx, bndy, offset + 1, wormhole);		///send the value to the matrixctrl for pattr purposes
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_probability(probability_in)
{	///assign a probability to the program matrix and display it
	probability=probability_in;
	prog[bndx][bndy][(offset)+2]=probability;
	outlet(2, "set", bndx, bndy, offset + 2, probability);	///send the value to the matrixctrl for pattr purposes
	call_bound_node;
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_note(note_in)
{	
	note=note_in;
	prog[bndx][bndy][(offset)+3]=note;
	outlet(2, "set", bndx, bndy, offset + 3, note);			///send the value to the matrixctrl for pattr purposes
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_velocity(velocity_in)
{	
	velocity=velocity_in;
	prog[bndx][bndy][(offset)+4]=velocity;
	outlet(2, "set", bndx, bndy, offset + 4, velocity);
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_duration(duration_in)
{	
	duration=duration_in;
	prog[bndx][bndy][(offset)+5]=duration;
	outlet(2, "set", bndx, bndy, offset + 5, duration);
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_direction(dir_assign)
{
	var dir_byte=(Math.pow(2,dir_assign))
	if(dirbin[dir_assign]==1)				///toggle direction off
	{
		prog[bndx][bndy][offset]=(dir_raw-dir_byte);
		outlet(2, "set", bndx, bndy, offset, (dir_raw-dir_byte));
		dir_raw=(dir_raw-dir_byte);
		dirbin[dir_assign]=0;
		display_directions();
		display_program();
	}
	else									///toggle direction on
	{
		prog[bndx][bndy][offset]=(dir_raw+(Math.pow(2,dir_assign)));
		outlet(2, "set", bndx, bndy, offset, (dir_raw+(Math.pow(2,dir_assign))));
		dir_raw=(dir_raw+dir_byte);
		dirbin[dir_assign]=1;
		display_directions();
		display_program();	
	}
	display_editor();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function assign_start_cell()
{
	prog[bndx][bndy][24]=parseInt(Math.abs(start_cell-1));
	outlet(2, "set", bndx, bndy, 24, prog[bndx][bndy][24]);
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function display_properties()
{ ///display the planes properties for the bound node (and output)
	y_display_offset=s_offset[1];
	if(bndx<s_offset[0] + 4)
	{	
		x_display_offset=s_offset[0] + 5;
	}
	else
	{
		x_display_offset=s_offset[0];
	}
	displayed_note=(Math.floor(note%8));
	displayed_octave=(Math.floor(note/8));
	for(var dsy=0;dsy<8;dsy++)					//clear old parameter values
	{
		display[x_display_offset+2][dsy+y_display_offset][1]=0;
		display[x_display_offset+1][dsy+y_display_offset][1]=0;
		display[x_display_offset][dsy+y_display_offset][1]=0;
	}
	display[x_display_offset+2][Math.abs(probability-7)+(y_display_offset)][1]=3;
	display[x_display_offset+1][Math.abs(displayed_note-7)+(y_display_offset)][1]=4;
	display[x_display_offset][Math.abs(displayed_octave-7)+(y_display_offset)][1]=6;
	display_program();
}

function display_directions()
{	///display the directions for the bound node (no output)
	for(var n=0;n<8;n++)
	{
		adj_bndx=(bndx-(x_adj[n]));
		adj_bndy=(bndy-(y_adj[n]));
		if((adj_bndx>=0)&&(adj_bndx<=15)&&(adj_bndy>=0)&&(adj_bndy<=15))
		{
			display[adj_bndx][adj_bndy][1]=(parseInt(dirbin[n])*2)+1;
		}
	}			 
}

function display_edit()
{	//display the edit portion of the display_array, both active nodes and particles
	for(var dex=0;dex<16;dex++)
	{
		for(var dey=0;dey<16;dey++)
		{
			if(display[dex][dey][0]>0)					//if there is potential in the cell
			{
				outlet(0, dex, dey, display[dex][dey][0]);		//display it (potent, firing)
			}
			else										//if not
			{
				outlet(0, dex, dey, display[dex][dey][2]);		//display the node status (active, wormhole, both, passive)
			}
		}
	}
}

function display_program()
{
	for(var dpx=0;dpx<16;dpx++)
	{
		for(var dpy=0;dpy<16;dpy++)
		{
			outlet(0, dpx, dpy, display[dpx][dpy][1]);
		}
	}
}

function display_node()
{
	for(var dnx=0;dnx<16;dnx++)
	{
		for(var dny=0;dny<16;dny++)
		{
			outlet(0, dnx, dny, display[dnx][dny][2]);
		}
	}
}

function msg_int(key)
{
	if(inlet==2)  //keyin received
	{
		if(linked==0)  //if no key is held (change mode)
		{
			mode=key-1;
			offset=(mode*6);
			call_bound_node();
		}
		else if(linked==1)	 //if key is held (secondary function)
		{	
			switch(key)
			{
				case 1:
					if(loop==0)
					{
						fire_node();
					}
					else
					{
						assign_start_cell();
					}
					break;
				case 2:
					if(waiting_for_wormhole==0)
					{
						waiting_for_wormhole=1;
					}
					else
					{
						assign_wormhole(0);
						waiting_for_wormhole=0;
					}
					break;
				case 3:
					apply_prop_to_all_prob();
					break;
				case 4:
					clear_node_layer();
					break;
			}
		}
	}
	else if(inlet ==3)
	{
		alt=key;
		if(key<1)
		{
			update_bound_view();
		}
		else
		{
			storage.message('getslotlist');
		}
	}
}

function display_presets()
{
	//post('display presets\n');
	return;
}

function clear_node_layer()
{
	for(var n=0;n<6;n++)
	{
		prog[bndx][bndy][(offset)+n]=0;
		outlet(2, 'set', bndx, bndy, offset + n, 0);
	}
	call_bound_node();
	//notifyclients();
	update_storage(cell[bndx][bndy], prog[bndx][bndy]);
}

function apply_prop_to_all_prob()
{
	for(var all=0;all<4;all++)
	{
		prog[bndx][bndy][(all*6)]=dir_raw;
		prog[bndx][bndy][(all*6)+1]=wormhole;
		prog[bndx][bndy][(all*6)+3]=note;
		prog[bndx][bndy][(all*6)+4]=velocity;
		prog[bndx][bndy][(all*6)+5]=duration;
		outlet(2, 'set', bndx, bndy, (all*6), dir_raw);
		outlet(2, 'set', bndx, bndy, (all*6)+1, wormhole);
		outlet(2, 'set', bndx, bndy, (all*6)+3, note);
		outlet(2, 'set', bndx, bndy, (all*6)+4, velocity);
		outlet(2, 'set', bndx, bndy, (all*6)+5, duration);
		update_storage(cell[bndx][bndy], prog[bndx][bndy]);
	}
	//notifyclients();
}

function update_bound_view()
{	//update the node display with all active nodes
	for(var xx=0;xx<16;xx++)
	{
		for(var yy=0;yy<16;yy++)
		{
			var display_val=0;
			var bnd_cell_dir=0;
			var bnd_cell_wmhl=0;
			var bnd_cell=prog[xx][yy];
			for(var n=0;n<4;n++)
			{
				bnd_cell_dir=(bnd_cell_dir+bnd_cell[n*6]);
				bnd_cell_wmhl=(bnd_cell_wmhl+bnd_cell[(n*6)+1]);
			}
			if(bnd_cell_dir>0)
			{
				display_val+=6;
			}
			if(bnd_cell_wmhl>0)
			{
				display_val+=3;
			}
			display[xx][yy][2]=display_val;
		}
	}
	display_edit();
}

function loop_switch(loop_gate)
{
	loop=loop_gate;
}

function loopstart()
{
	for(var xx=0;xx<16;xx++)		/// parse program cells to see if there are possible start positions
	{
		for(var yy=0;yy<16;yy++)
		{
			start=[]			
			start=prog[xx][yy];
			if(start[24]>0)
			{
				add_potential(xx, yy, 4);
			}
		}
	}
}

function starter()
{
	for(xx=0;xx<16;xx++)		/// parse program cells to see if there are possible start positions
	{
		for(yy=0;yy<16;yy++)
		{
			start=[]			
			start=prog[xx][yy];
			if(start[24]>0)
			{
				add_potential(xx, yy, 4);
			}
		}
	}
	bang();
}

function limit(num)
{//define a limit to the maximum number of potential particles
	num=part_limit;
}

function init()
{
	for(var xx=0;xx<16;xx++)
	{
	   for(var yy=0;yy<16;yy++)
		{
			prog[xx][yy]=preset_program.slice();
			for(var p=0;p<25;p++)
			{
				outlet(2, "set", xx, yy, p, preset_program[p]);
			}
			update_storage(cell[xx][yy], prog[xx][yy]);
		}
	}
	//notifyclients();
	update_bound_view();
}

function clear()
{
	for(var xx=0;xx<16;xx++)
	{
		for(var yy=0;yy<16;yy++)
		{
			prog[xx][yy]=cleared_program.slice();
			for(var p=0;p<25;p++)
			{
				outlet(2, "set", xx, yy, p, preset_program[p]);
			}
			update_storage(cell[xx][yy], prog[xx][yy]);
		}
	}
	//notifyclients();
	update_bound_view();
}

function init_display()
{
	display_program();
}

function to_display(x, y, val)
{
	if(alt < 1)
	{
		display[x][y][0] = val;
		if(linked==0)
		{
			if(display[x][y][0]>0)					//if there is potential in the cell
			{
				outlet(0, x, y, display[x][y][0]);		//display it (potent, firing)
			}
			else										//if not
			{
				outlet(0, x, y, display[x][y][2]);		//display the node status (active, wormhole, both, passive)
			}  
		}	
	}   
}

