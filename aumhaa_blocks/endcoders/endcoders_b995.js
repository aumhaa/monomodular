autowatch = 1;

inlets = 2;
outlets = 2;

var DEBUG = 0;
var DEBUGLCD = 0;
var FORCELOAD = 0;
var SHOW_STORAGE = 0;

var modColor=6;

var FUNCTION_COLORS = [3, 6, 5, 0];
var ACCEL_FACTORS = [.15, .05];
var knob_ids=[];
var knob=[];
var finder=[];
var parameters=[];
var rows=[];
var columns=[];
var c_rows=[];
var c_keys=[];
var grid_rows=[];
var keys=[];
var accel = .1;
var	Alive = 0;
var assignments;
var id_numbers;
var active_preset = 0;
var script = this;

var encs = [];
for(var i=0;i<32;i++)
{
	encs['Encoder_'+i]=[];
	encs['Encoder_'+i].val = 0;
	encs['Encoder_'+i].x_c = i%8;
	encs['Encoder_'+i].y_c = Math.floor(i/8);
}

function alive(val)
{
	if(val)
	{
		init();
	}
	else
	{
		dissolve();
	}
}

function init()
{
	if(DEBUG){post('new...')};
	outlet(0, 'set_local_ring_control', 0);
	for(var k=0;k<4;k++)
	{
		for(var l=0;l<8;l++)
		{
			outlet(0, 'to_wheel', l, k, 'mode', 5);
			outlet(0, 'to_wheel', l, k, 'white', 0);
			outlet(0, 'to_wheel', l, k, 'green', 0);
			outlet(0, 'to_wheel', l, k, 'value', 0);
		}
	}
	outlet(0, 'set_c_local_ring_control', 0);
	var l=3;do{
		var k=2;do{
			outlet(0, 'to_c_wheel', l, k, 'mode', 5);
			outlet(0, 'to_c_wheel', l, k, 'white', 0);
			outlet(0, 'to_c_wheel', l, k, 'green', 0);
			outlet(0, 'to_c_wheel', l, k, 'value', 0);
		}while(k--);
	}while(l--);
	outlet(0, 'set_mod_color', modColor);
	outlet(0, 'set_number_custom', 192);
	outlet(0, 'set_number_params', 32);
	finder = new LiveAPI(finder_cb, 'this_device');
	var this_device_id = finder.id;
	for(var b=0;b<8;b++)
	{
		finder.goto('live_set', 'this_device', 'parameters', b + 1);
		knob_ids.push(finder.id);
	}
	finder.goto('live_set', 'view', 'selected_parameter');
	preset = this.patcher.getnamed('preset');
	storage = this.patcher.getnamed('storage');
	if(SHOW_STORAGE){storage.message('storagelist');}
	if(SHOW_STORAGE){storage.message('clientlist');}
	gui_edit = this.patcher.getnamed('edit');
	gui_selected = this.patcher.getnamed('selected');
	//post('1');
	for(var h=0;h<4;h++)
	{
		rows[h]=[];
		rows[h].pressed = false;
		c_rows[h]=[];
		c_rows.pressed = false;
	}
	for(var i=0;i<32;i++)
	{
		c_keys[i]=[];
		c_keys[i].pressed = false;
	}
	for(var i=0;i<4;i++)
	{
		grid_rows[i]=[];
		grid_rows[i].pressed = false;
	}
	for(var i=0;i<8;i++)
	{
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nominimize');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nozoom');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'nogrow');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('flags', 'float');
		this.patcher.getnamed('breakpoints').subpatcher(i).window('exec');
		keys[i]=[];
		keys[i].pressed = 0;
		columns[i]=[];
		columns[i].pressed = false;
		knob[i]=[];
		knob[i].num = i;
		knob[i].val = 0.0;
		knob[i].knob = this.patcher.getnamed('knob'+i);
		knob[i].knob.message('set', knob[i].val * 127);
		knob[i].assignment = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('assignments');
		knob[i].id_numbers = knob[i].assignment.getvalueof();
		if(DEBUG){post('assignments', i, knob[i].id_numbers, '\n');}
		if(knob[i].id_numbers.length < 24)
		{
			knob[i].id_numbers = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			knob[i].assignment.setvalueof(knob[i].id_numbers);
		}
		knob[i].active = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('active');
		knob[i].active_states = knob[i].active.getvalueof();
		for(var j=0;j<24;j++)
		{
			knob[i][j] = [];
			knob[i][j].bank = i;
			knob[i][j].num = j;
			knob[i][j].x_c = (j%8);
			knob[i][j].y_c = Math.floor(j/8) + 1;
			if(j<8){
				knob[i][j].cntrlr = 1;
				knob[i][j].c_x_c = j%4;
				knob[i][j].c_y_c = Math.floor(j/4)+1;
			}
			else{
				knob[i][j].cntrlr = 0;
				knob[i][j].c_x_c = 0;
				knob[i][j].c_y_c = 0;
			}
			knob[i][j].active = parseInt(knob[i].active_states[j]);
			knob[i][j].gui_active = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('active['+j+']');
			knob[i][j].gui_select = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('select['+j+']');
			knob[i][j]._title = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('title'+j);
			knob[i][j].parameter = [];
			knob[i][j].parameter.id = parseInt(knob[i].id_numbers[j]);
			knob[i][j].parameter.obj = knob[i][j];
			if(knob[i][j].parameter.id != 0)
			{
				var new_parameter_id = parseInt(knob[i][j].parameter.id);
				var new_name = [];
				finder.id = new_parameter_id;
				new_name.unshift(finder.get('name'));
				finder.goto('canonical_parent');
				finder.goto('canonical_parent');
				new_name.unshift(' || ');
				new_name.unshift(finder.get('name'));
				new_name = new_name.join('');
				new_name = new_name.slice(0, 25);
				knob[i][j]._title.message('set', new_name);
				outlet(0, 'set_custom_parameter', j+(i*24), new_parameter_id);
			}
			knob[i][j].breakpoint = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('breakpoint'+j);
			knob[i][j].breakpoint.message('setdomain', 100.);
		}
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
	selected = knob[0];
	load_preset();
	storage.message('getslotlist');
	if(DEBUG){post('init\n');}
}

function slotlist()
{
	args = arrayfromargs(arguments);
	//post('slotlist', args, '\n');
	for(var i=0;i<16;i++)
	{
		var found = 0;
		for(var j in args)
		{
			if(args[j]==(i+1))
			{
				found = 1;
			}
		}
		outlet(0, 'c_key', i, found*127);
		if(i<8)
		{
			outlet(0, 'key', i, found);
		}
	}
	if(active_preset > 0)
	{
		outlet(0, 'c_key', active_preset-1, 5);
		if(active_preset<8)
		{
			outlet(0, 'key', active_preset-1, 8);
		}
	}
	//else if(args.length > 0)
	//{
	//	preset.message(args[0]);
	//}
}

function load_preset()
{
	for(var i=0;i<8;i++)
	{
		knob[i].active_states = knob[i].active.getvalueof();
		for(var j=0;j<24;j++)
		{
			if(knob[i][j].parameter.id != 0)
			{
				//knob[i][j]._title.message('set', knob[i][j].parameter.get('name'));
				knob[i][j].active = knob[i].active_states[j];
				if(knob[i][j].active == 0)
				{
					knob[i][j].gui_active.message('fgcolor', .35, .35, .35, 1.);
				}
				else
				{
					knob[i][j].gui_active.message('fgcolor', .15, .45, .15, 1.);
				}
			}
		}
	}
	select_knob(selected.num);
}

function finder_cb(args)
{
	//var args = arrayfromargs(messagename, arguments);
	//post('finder', args, '\n');
}

/*function parameter_cb(args)
{
	//var args = arrayfromargs(messagename, arguments);
	//post('parameter_callback', args[0], ', ', args[1], '\n');
	if((this.id != 0)&&(args[0]=='value')&&(args[1]!='bang')&&(Alive>0))
	{
		var new_val = parseFloat(scale(args[1], parseFloat(this.obj.min), parseFloat(this.obj.max), 0, 1));
		this.obj.val = new_val;
		if(this.obj.bank == selected.num)
		{
			outlet(0, 'wheel', this.obj.x_c, this.obj.y_c, 'value', Math.floor(new_val * 11) + 1);
		}
	}
}*/

function anything()
{
	var args = arrayfromargs(arguments);
	switch(messagename)
	{			
		default:
			if(DEBUG){post('anything', messagename, args, '\n');}
			break;
	}
}

//this sorts key and grid input
function _list()
{
	var args=arrayfromargs(arguments);
	switch(inlet)
	{
		case 0:
			_grid(args[0], args[1], args[2]);
			break;
		case 1:
			_key(args[0], args[1]);
			break;
	}
}

function _recall(num)
{
	active_preset = num;
	//for(var i=0;i<8;i++)
	//{
	//	outlet(0, 'key', i, 7 * ((i + 1)==num));
	//}
	load_preset();
}	

/*function _knob_in(num, val)
{
	knob[num].val = val/100;
	//outlet(0, 'wheel', num, 0, 'value', Math.round(knob[num].val * 11) + 1);
	for(var i=0;i<24;i++)
	{
		if((knob[num][i].parameter.id != 0)&&(knob[num][i].active>0))
		{
			knob[num][i].breakpoint.message(knob[num].val);
		}
	}
}*/

function _button(x, y, val)
{
	if(DEBUG){post('button', x, y, val, '\n');}
	if(val>0)
	{
		if(y==0)
		{
			if(rows[0].pressed>0)
			{
				select_knob(x);
				this.patcher.getnamed('breakpoints').message('wclose');
				this.patcher.getnamed('breakpoints').message('open', x+1);
			}
			else if(rows[1].pressed>0)
			{
				for(var i=0;i<24;i++)
				{
					set_breakpoint(i);
				}
			}
			else if(rows[2].pressed>0)
			{
				for(var i=0;i<24;i++)
				{
					clear_breakpoint(i);
				}
			}
			else
			{
				select_knob(x);
			}
		}
		else
		{
			if(rows[0].pressed>0)
			{
				select_parameter(((y-1)*8)+x);
			}
			if(rows[1].pressed>0)
			{
				set_breakpoint(((y-1)*8)+x);
			}
			else if(rows[2].pressed>0)
			{
				clear_breakpoint(((y-1)*8)+x);
			}
			else
			{
				toggle_active(selected[((y-1)*8)+x]);
			}
		}
	}
}

function _column(num, val)
{
	if(DEBUG){post('column', num, val, '\n');}
	if((num < 8)&&(val>0))
	{
		selected.knob.message('int', Math.round((num/7)*100));
	}
}

function _row(num, val)
{
	if(DEBUG){post('row', num, val, rows[num].pressed, '\n');}
	if(num < 3)
	{
		rows[num].pressed = (val!=0);
		outlet(0, 'row', num, (val>0) * 127);
	}
	else if((num ==3)&&(val>0))
	{
		rows[3].pressed = Math.abs(rows[3].pressed - 1);
		outlet(0, 'row', 3, rows[3].pressed * 127);
		if(rows[3].pressed > 0)
		{
			accel = ACCEL_FACTORS[0];
		}
		else
		{
			accel = ACCEL_FACTORS[1];
		}
	}
}

function _keyin(num, val)
{
	if(num<8)
	{
		if(DEBUG){post('key', num, val);}
		keys[num].pressed = (val!=0);
		if(val > 0)
		{
			storage.message('store', active_preset);
			active_preset = num+1;
			preset.message('int', num + 1);
			storage.message('getslotlist');
		}
	}
}

function _c_key(num, val)
{
	if(DEBUG){post('c_key', num, val, '\n');}
	c_keys[num].pressed = (val!=0);
	if(val > 0)
	{
		if(num<16)
		{
			storage.message('store', active_preset);
			active_preset = num + 1;
			preset.message('int', num + 1);
			storage.message('getslotlist');		
		}
		else
		{
			selected.knob.message('int', Math.floor(((num-16)/15)*100));
		}

	}
}

function _c_grid(x, y, val)
{
	var num = x+(y*4);
	if(DEBUG){post('c_grid', x, y, val, '\n');}
	if(num<4)
	{
		c_rows[num].pressed=val;
		outlet(0, 'c_grid', num, 0, FUNCTION_COLORS[x] + ((val>0)*7));
	}
	else if((num>7)&&(val>0))
	{
		if(c_rows[0].pressed>0)
		{
			select_knob(num-8);
			this.patcher.getnamed('breakpoints').message('wclose');
			this.patcher.getnamed('breakpoints').message('open', num-7);
		}
		else if(c_rows[1].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				if(selected.id_numbers[i]>0)
				{
					set_breakpoint(i);
				}
			}
		}
		else if(c_rows[2].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				clear_breakpoint(i);
			}
		}
		else
		{
			select_knob(num-8);
		}
	}
}

function _c_button(x, y, val)
{
	if(DEBUG){post('c_button', x, y, val, '\n');}
	if(val>0)
	{
		if(c_rows[0].pressed>0)
		{
			select_parameter(((y)*4)+x);
		}
		if(c_rows[1].pressed>0)
		{
			set_breakpoint(((y)*4)+x);
		}
		else if(c_rows[2].pressed>0)
		{
			clear_breakpoint(((y)*4)+x);
		}
		else
		{
			toggle_active(selected[((y)*4)+x]);
		}
	}
}

function _grid(x, y, val)
{
	var num = x+(y*8);
	if(DEBUG){post('grid', x, y, val, '\n');}
	if((num>7)&&(num<11))
	{
		grid_rows[num-8].pressed = val>0;
		outlet(0, 'grid', x, y, FUNCTION_COLORS[x]+((val>0)*7));
	}
	else if((num>15)&&(num<40))
	{
		if(val>0)
		{
			if(grid_rows[0].pressed>0)
			{
				select_parameter(((y-2)*8)+x);
			}
			if(grid_rows[1].pressed>0)
			{
				set_breakpoint(((y-2)*8)+x);
			}
			else if(grid_rows[2].pressed>0)
			{
				clear_breakpoint(((y-2)*8)+x);
			}
			else
			{
				toggle_active(selected[((y-2)*8)+x]);
			}
		}
	}
	else if((num>=56)&&(num<64))
	{
		_column(x, val);
	}
	else if((num<8)&&(val>0))
	{
		if(grid_rows[0].pressed>0)
		{
			select_knob(num);
			this.patcher.getnamed('breakpoints').message('wclose');
			this.patcher.getnamed('breakpoints').message('open', num+1);
		}
		else if(grid_rows[1].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				if(selected.id_numbers[i]>0)
				{
					set_breakpoint(i);
				}
			}
		}
		else if(grid_rows[2].pressed>0)
		{
			for(var i=0;i<24;i++)
			{
				clear_breakpoint(i);
			}
		}
		else
		{
			select_knob(num);
		}
	}
}

/*function _dial(x, y, val)
{
	//post('dial', x, y, val, '\n');
	if(y==0)
	{
		knob[x].val = Math.max(Math.min((knob[x].val + (val * (accel*.1))), 1.0), 0.0);
		outlet(0, 'wheel', x, y, 'value', Math.floor(knob[x].val * 11) + 1);
		knob[x].knob.message('set', knob[x].val * 100);
		for(var i=0;i<24;i++)
		{
			if((knob[x][i].parameter.id != 0)&&(knob[x][i].active == true))
			{
				knob[x][i].breakpoint.message(knob[x].val);
			}
		}
	}
	else
	{
		var dial_num = x + ((y - 1)*8);
		if(selected[dial_num].parameter.id != 0)
		{
			var send_value = Math.max(Math.min( (selected[dial_num].val + (val * accel)), 1.0), 0.0); 
			//post('last', selected[dial_num].last_sent, selected[dial_num].val, send_value, '\n');
			if(selected[dial_num].last_sent != send_value)
			{
				selected[dial_num].last_sent = send_value;
				dial_return(parseInt(selected.num) + 1, dial_num, parseFloat(send_value));
			}
		}
	}
}*/

function _dial_return(bank, number, value)
{
	if(DEBUG){post('dial_return', bank, number, value, '\n');}
	if(knob[bank-1].active_states[number])
	{
		outlet(0, 'set_custom_parameter_value', number+((bank-1)*24), value);
	}
}

function set_breakpoint(num)
{
	selected[num].breakpoint.message('list', encs['Encoder_'+selected.num].val, encs['Encoder_'+(selected[num].num+8)].val);
}

function clear_breakpoint(num)
{
	selected[num].breakpoint.message('clear');
}

function select_knob(num)
{
	if(DEBUG){post('select knob', num, '\n');}
	selected = knob[num];
	outlet(0, 'set_device_bank', num);
	gui_selected.message('set', num);
	var i=7;do{
		outlet(0, 'wheel', i, 0, 'white', (num == i)*127);
		outlet(0, 'grid', i, 0, (num == i)*127);
	}while(i--);
	var i=3;do{
		var j=1;do{
			outlet(0, 'c_grid', i, j+2, (num == (i+(j*4)))*127);
		}while(j--);
	}while(i--);
	for(var i=0;i<3;i++)
	{
		for(var j=0;j<8;j++)
		{
			var cur_param = selected[(i*8)+j], assigned = (cur_param.parameter.id != 0);
			outlet(0, 'wheel', j, i+1, 'white', 127 * assigned);
			outlet(0, 'wheel', j, i+1, 'value', Math.floor(encs['Encoder_'+cur_param.num].val/10)*assigned);
			outlet(0, 'wheel', j, i+1, 'green', cur_param.active);
			if(cur_param.cntrlr)
			{
				outlet(0, 'to_c_wheel', cur_param.c_x_c, cur_param.c_y_c,  'value', Math.floor(encs['Encoder_'+cur_param.num].val/10)*assigned);
				outlet(0, 'to_c_wheel', cur_param.c_x_c, cur_param.c_y_c, 'white', (cur_param.parameter.id>0)*((cur_param.active*5)+1));
			}
			outlet(0, 'grid', j, i+2, assigned*((cur_param.active*5)+1));
		}
	}	
}

function select_parameter(num)
{
	var to_active = (selected[num].parameter.id == 0);
	finder.goto('live_set', 'view', 'selected_parameter');
	var new_parameter_id = parseInt(finder.id);
	outlet(0, 'set_custom_parameter', num+(selected.num*24), new_parameter_id);
	if(DEBUG){post('set_custom_parameter', num+(selected.num*24), new_parameter_id, '\n');}
	var in_this = 0;
	for(var i in knob_ids)
	{
		if(knob_ids[i] == new_parameter_id)
		{
			in_this = 1;
		}
	}
	if((new_parameter_id > 0)&&(in_this == 0))
	{
		selected[num].parameter.id = new_parameter_id;
		selected.id_numbers[num] = new_parameter_id;
		selected.assignment.message('list', selected.id_numbers);
		var new_name = [];
		new_name.unshift(finder.get('name'));
		finder.goto('canonical_parent');
		finder.goto('canonical_parent');
		new_name.unshift(' || ');
		new_name.unshift(finder.get('name'));
		new_name = new_name.join('');
		new_name = new_name.slice(0, 25);
		selected[num]._title.message('set', new_name);
		if(selected[num].parameter.id == 0)
		{
			selected[num].gui_select.message('fgcolor', .35, .35, .35, 1.);
		}
		else
		{
			selected[num].gui_select.message('fgcolor', 1., 1., 1., 1.);
		}
		outlet(0, 'wheel', selected[num].x_c, selected[num].y_c, 'white', 127 * (selected[num].parameter.id != 0));
		//post('sel cntrlr', selected[num].cntrlr, '\n');
		if(selected[num].cntrlr)
		{
			outlet(0, 'to_c_wheel', selected[num].c_x_c, selected[num].c_y_c, 'white',  (selected[num].parameter.id>0)*((selected[num].active*5)+1));
		}
		outlet(0, 'grid', selected[num].x_c, selected[num].y_c + 1, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
		if(to_active>0)
		{
			set_active(num, 1);
		}
	}
}

function set_active(num, state)
{
	//post('set active', num, state, '\n');
	for(var i = 0;i<8;i++)
	{
		for(var j=0;j<24;j++)
		{
			var Knob = knob[i][j];
			if((Knob.parameter.id == selected[num].parameter.id)&&(Knob.active > 0))
			{
				
				Knob.active = 0;
				knob[i].active_states[j] = 0;
				Knob.gui_active.message('fgcolor', .35, .35, .35, 1.);
				if(i == selected.num)
				{
					outlet(0, 'wheel', Knob.x_c, Knob.y_c, 'green', 0);
					outlet(0, 'grid', Knob.x_c, Knob.y_c + 2, 0);
					if(Knob.cntrlr)
					{
						outlet(0, 'to_c_wheel', Knob.c_x_c, Knob.c_y_c, 'white', (Knob.parameter.id>0)*((Knob.active*5)+1));
					}
				}
			}
		}
		knob[i].active.setvalueof(knob[i].active_states);
	}		
	selected[num].active = state;
	selected.active_states[num] = state;
	selected.active.setvalueof(selected.active_states);
	//selected[num].gui_active.setvalueof(selected[num].active);
	if(selected[num].active == 0)
	{
		selected[num].gui_active.message('fgcolor', .35, .35, .35, 1.);
	}
	else
	{
		selected[num].gui_active.message('fgcolor', .15, .45, .15, 1.);
	}
	outlet(0, 'wheel', selected[num].x_c, selected[num].y_c, 'green', selected[num].active);
	outlet(0, 'grid', selected[num].x_c, selected[num].y_c+1, (selected[num].parameter.id>0)*((selected[num].active*5)+1));
	if(selected[num].cntrlr)
	{
		if(DEBUG){post('sending white', selected[num].c_x_c, selected[num].c_y_c, selected[num].active, '\n');}
		outlet(0, 'to_c_wheel', selected[num].c_x_c, selected[num].c_y_c, 'white', (selected[num].parameter.id>0)*((selected[num].active*5)+1));
	}
}

function toggle_active(dial)
{
	set_active(dial.num, Math.abs(dial.active - 1));
}

function scale(x,a,b,c,d)
{
	var in_dif=((Math.max((a+1000000.),(b+1000000.)))-(Math.min((a+1000000.),(b+1000000.))));
	var in_val=((Math.max((a+1000000.),(x+1000000.)))-(Math.min((a+1000000.),(x+1000000.))));
	var out_dif=((Math.max((c+1000000.),(d+1000000.)))-(Math.min((c+1000000.),(d+1000000.))));
	var out_min=(c+1000000.);
	return( ( (out_min+ ( (in_val) / (in_dif) * (out_dif) -1000000.) ) ) ).toFixed(2);
}

function dissolve()
{
	Alive = 0;
}

function _Edit()
{
	this.patcher.getnamed('breakpoints').message('open', selected.num+1);
}

function _select(num)
{
	this.patcher.getnamed('breakpoints').message('wclose');
	select_knob(num);
}

function _select_button(sel, num)
{
	select_parameter(num);
}

function _active_button(sel, num)
{
	toggle_active(selected[num]);
}

function clear_surface()
{
	for(var i = 0; i < 8; i ++)
	{
		outlet(0, 'column', i, 0);
		for(var j = 0; j < 4; j ++)
		{
			outlet(0, 'wheel', i, j, 'mode', 5);
			outlet(0, 'wheel', i, j, 'white', 0);
			outlet(0, 'wheel', i, j, 'green', 0);
			outlet(0, 'wheel', i, j, 'value', 0);
		}
	}
	for(var j = 0; j < 4; j ++)
	{
		outlet(0, 'row', j, 0);
	}
	var i=3;do{
		var j=2;do{
			outlet(0, 'to_wheel', i, j, 'mode', 5);
			outlet(0, 'to_wheel', i, j, 'white', 0);
			outlet(0, 'to_c_wheel', i, j, 'value', 0);
		}while(j--);
	}while(i--);
	outlet(0, 'batch', 'grid', 0);
	for(var i=0;i<4;i++)
	{
		outlet(0, 'c_grid', i, 0, FUNCTION_COLORS[i]);
		outlet(0, 'grid', i, 1, FUNCTION_COLORS[i]);
	}
}

function _lcd()
{
	var args = arrayfromargs(arguments);
	if(DEBUGLCD){post('lcd:', args, '\n');}
	if(args[1]=='encoder_value')
	{
		var enc = encs[args[0]];
		//var wheel = encs[args[0]];
		enc.val = (args[2]/127)*100;
		if((enc.y_c<1)&&(selected.num==enc.x_c))
		{
			var new_val = Math.round(args[2]/8.46666);
			var i=15;do{
				outlet(0, 'c_key', i+16, new_val>=i);
			}while(i--);
			var new_val = Math.round(args[2]/18.14);
			var i=7;do{
				outlet(0, 'column', i, (new_val>=i)*127);
				outlet(0, 'grid', i, 7, (new_val>=i)*6);
			}while(i--);
		}	
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
