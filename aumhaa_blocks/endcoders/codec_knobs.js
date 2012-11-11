autowatch = 1;

inlets = 2;
outlets = 2;

const ACCEL_FACTORS = [.15, .05];
var knob_ids=[];
var knob=[];
var finder=[];
var parameters=[];
var rows=[];
var columns=[];
var keys=[];
var accel = .1;
var alive = 0;
var assignments;
var id_numbers;
var active_preset = -1;

function init()
{
	finder = new LiveAPI(finder_cb, 'live_set');
	for(var b=0;b<8;b++)
	{
		finder.goto('live_set', 'this_device', 'parameters', b + 1);
		knob_ids.push(finder.id);
	}
	finder.goto('live_set', 'view', 'selected_parameter');
	preset = this.patcher.getnamed('preset');
	storage = this.patcher.getnamed('knobs');
	gui_edit = this.patcher.getnamed('edit');
	gui_selected = this.patcher.getnamed('selected');
	for(var h=0;h<4;h++)
	{
		rows[h]=[];
		rows[h].pressed = false;
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
			knob[i][j].active = parseInt(knob[i].active_states[j]);
			knob[i][j].last_sent = 0.0;
			knob[i][j].val = 0.0;
			knob[i][j].max = 1.0;
			knob[i][j].min = 0.0;
			knob[i][j].gui_active = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('active['+j+']');
			knob[i][j].gui_select = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('select['+j+']');
			knob[i][j]._title = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('title'+j);
			knob[i][j].parameter = new LiveAPI(parameter_cb, 'live_set');
			knob[i][j].parameter.id = parseInt(knob[i].id_numbers[j]);
			knob[i][j].parameter.obj = knob[i][j];
			if(knob[i][j].parameter.id != 0)
			{
				knob[i][j].parameter.property = 'value';
				knob[i][j].max = knob[i][j].parameter.get('max');
				knob[i][j].min = knob[i][j].parameter.get('min');
				var new_parameter_id = parseInt(knob[i][j].parameter.id);
				var new_name = [];
				finder.id = new_parameter_id;
				finder.goto('canonical_parent');
				finder.goto('canonical_parent');
				new_name.unshift(knob[i][j].parameter.get('name'));
				new_name.unshift(' || ');
				new_name.unshift(finder.get('name'));
				new_name = new_name.join('');
				new_name = new_name.slice(0, 25);
				knob[i][j]._title.message('set', new_name);
			}
			knob[i][j].breakpoint = this.patcher.getnamed('breakpoints').subpatcher(i).getnamed('breakpoint'+j);
			knob[i][j].breakpoint.message('setdomain', 1.);
		}
	}
	for(var k=0;k<4;k++)
	{
		for(var l=0;l<8;l++)
		{
			outlet(0, 'wheel', l, k, 'mode', 0);
			outlet(0, 'wheel', l, k, 'white', 0);
			outlet(0, 'wheel', l, k, 'green', 0);
			outlet(0, 'wheel', l, k, 'value', 0);
		}
	}
	clear_surface();
	selected = knob[0];
	load_preset();
	storage.message('getslotlist');
	alive = 1;
}

function slotlist()
{
	args = arrayfromargs(arguments);
	//post('slotlist', args, '\n');
	for(var i=0;i<8;i++)
	{
		var found = 0;
		for(var j in args)
		{
			if(args[j]==(i+1))
			{
				found = 127;
			}
		}
		outlet(0, 'key', i, found);
	}
	if(active_preset > 0)
	{
		outlet(0, 'key', active_preset - 1, 1);
		for(var k=0;k<8;k++)
		{
			outlet(0, 'column', k, ((k+1)==active_preset) * 127);
		}
	}
	else if(args.length > 0)
	{
		preset.message(args[0]);
	}
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

function parameter_cb(args)
{
	//var args = arrayfromargs(messagename, arguments);
	//post('parameter_callback', args[0], ', ', args[1], '\n');
	if((this.id != 0)&&(args[0]=='value')&&(args[1]!='bang')&&(alive>0))
	{
		var new_val = parseFloat(scale(args[1], parseFloat(this.obj.min), parseFloat(this.obj.max), 0, 1));
		this.obj.val = new_val;
		if(this.obj.bank == selected.num)
		{
			outlet(0, 'wheel', this.obj.x_c, this.obj.y_c, 'value', Math.floor(new_val * 11) + 1);
		}
	}
}

function anything()
{
	var args = arrayfromargs(messagename, arguments);
	//post('anything', args, '\n');
}

function recall(num)
{
	if(alive > 0)
	{
		active_preset = num;
		for(var i=0;i<8;i++)
		{
			outlet(0, 'column', i, 127 * ((i + 1)==num));
		}
		load_preset();
	}
}	

function knob_in(num, val)
{
	if(alive>0)
	{
		knob[num].val = val/100;
		outlet(0, 'wheel', num, 0, 'value', Math.round(knob[num].val * 11) + 1);
		for(var i=0;i<24;i++)
		{
			if((knob[num][i].parameter.id != 0)&&(knob[num][i].active>0))
			{
				knob[num][i].breakpoint.message(knob[num].val);
			}
		}
	}
}

function button(x, y, val)
{
	//post('button', x, y, val, '\n');
	if(val>0)
	{
		if(y==0)
		{
			if(rows[0].pressed>0)
			{
				for(var i=0;i<24;i++)
				{
					clear_breakpoint(i);
				}
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
				select_knob(x);
				this.patcher.getnamed('breakpoints').message('wclose');
				this.patcher.getnamed('breakpoints').message('open', x+1);
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
				clear_breakpoint(((y-1)*8)+x);
			}
			if(rows[1].pressed>0)
			{
				set_breakpoint(((y-1)*8)+x);
			}
			else if(rows[2].pressed>0)
			{
				select_parameter(((y-1)*8)+x);
			}
			else
			{
				toggle_active(selected[((y-1)*8)+x]);
			}
		}
	}
}

function column(num, val)
{
	if(num < 8)
	{
		columns[num].pressed = (val!=0);
		if(val > 0)
		{
			preset.message('int', num + 1);
		}
	}
	//post('column', num, val, columns[num].pressed, '\n');
}

function row(num, val)
{
	if(num < 3)
	{
		rows[num].pressed = (val!=0);
		outlet(0, 'row', num, val * 127);
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
		//accel = parseFloat(ACCEL_FACTORS[parseInt(rows[3].pressed > 0)]);
	}
	//post('row', num, val, rows[num].pressed, '\n');
}

function keyin(num, val)
{
	if(num<8)
	{
		//post('key', num, val);
		keys[num].pressed = (val!=0);
		if(val > 0)
		{
			active_preset = num+1;
			storage.message('store', num + 1);
			storage.message('getslotlist');
		}
	}
}

function dial(x, y, val)
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
}

function dial_return(bank, number, value)
{
	//post(bank, number, value, 'knob\n');
	var new_val = scale(value, 0, 1, parseFloat(knob[bank-1][number].min), parseFloat(knob[bank-1][number].max));
	knob[bank-1][number].parameter.set('value', new_val);
	//post('parameter send', new_val, '\n');
}

function set_breakpoint(num)
{
	selected[num].breakpoint.message('list', selected.val, selected[num].val);
}

function clear_breakpoint(num)
{
	selected[num].breakpoint.message('clear');
}

function select_knob(num)
{
	selected = knob[num];
	gui_selected.message('set', num);
	for(var h=0;h<8;h++)
	{
		outlet(0, 'wheel', h, 0, 'white', (num == h)*127);
	}
	for(var i=0;i<3;i++)
	{
		for(var j=0;j<8;j++)
		{
			var assigned = (selected[(i*8)+j].parameter.id != 0);
			outlet(0, 'wheel', j, i+1, 'white', 127 * assigned);
			if(assigned > 0)
			{
				outlet(0, 'wheel', j, i+1, 'value', Math.floor(selected[(i*8)+j].val * 13));
				outlet(0, 'wheel', j, i+1, 'green', selected[(i*8)+j].active);
			}
			else
			{
				outlet(0, 'wheel', j, i+1, 'value', 0);
				outlet(0, 'wheel', j, i+1, 'green', 0);
			}
		}
	}
}

function select_parameter(num)
{
	var to_active = (selected[num].parameter.id == 0);
	finder.goto('live_set', 'view', 'selected_parameter');
	var new_parameter_id = parseInt(finder.id);
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
		selected[num].parameter.property = 'value';
		selected[num].max = selected[num].parameter.get('max');
		selected[num].min = selected[num].parameter.get('min');
		selected.id_numbers[num] = new_parameter_id;
		selected.assignment.message('list', selected.id_numbers);
		var new_name = [];
		finder.goto('canonical_parent');
		finder.goto('canonical_parent');
		new_name.unshift(selected[num].parameter.get('name'));
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
			if((knob[i][j].parameter.id == selected[num].parameter.id)&&(knob[i][j].active > 0))
			{
				knob[i][j].active = 0;
				knob[i].active_states[j] = 0;
				if(i == selected.num)
				{
					outlet(0, 'wheel', knob[i][j].x_c, knob[i][j].y_c, 'green', 0);
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
}

function toggle_active(dial)
{
	set_active(dial.num, Math.abs(dial.active - 1));
	//dial.active = Math.abs(dial.active - 1);
	//selected.active_states[num] = dial.active;
	//selected.active.setvalueof(selected.active_states);
	//outlet(0, 'wheel', dial.x_c, dial.y_c, 'green', dial.active);
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
	//for(var i=0;i<8;i++)
	//{
	//	for(var j=0;j<24;j++)
	//	{
	//		knob[i][j].parameter.id = 0;
	//	}
	//}
	//finder.id = 0;
	alive = 0;
}

function Edit()
{
	if(alive > 0)
	{
		this.patcher.getnamed('breakpoints').message('open', selected.num+1);
	}
}

function select(num)
{
	if(alive > 0)
	{
		this.patcher.getnamed('breakpoints').message('wclose');
		select_knob(num);
	}
}

function select_button(sel, num)
{
	if(alive > 0)
	{
		//select_knob(sel);
		select_parameter(num);
	}
}

function active_button(sel, num)
{
	//post('active', sel, num, '\n');
	if(alive > 0)
	{
		toggle_active(selected[num]);
	}
}

function clear_surface()
{
	for(var i = 0; i < 8; i ++)
	{
		outlet(0, 'column', i, 0);
		for(var j = 0; j < 4; j ++)
		{
			outlet(0, 'wheel', i, j, 'mode', 0);
			outlet(0, 'wheel', i, j, 'white', 0);
			outlet(0, 'wheel', i, j, 'green', 0);
			outlet(0, 'wheel', i, j, 'value', 0);
		}
	}
	for(var j = 0; j < 4; j ++)
	{
		outlet(0, 'row', j, 0);
	}
}


