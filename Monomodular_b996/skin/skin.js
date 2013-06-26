autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;
var DEBUG = true;
var FORCELOAD = false;
var assignment_gui;
var keys_gui;
var assignments = [];
var current_edit = 0;
var KEYS = [13, 1, 2, 3, 4, 5, 6, 127];
var NOTES = [-1, 36, 38, 40, 41, 43, 45, 47];
var groups={0:{'val':0, 'fsr':undefined}, 
			1:{'val':0, 'fsr':undefined}, 
			2:{'val':0, 'fsr':undefined}, 
			3:{'val':0, 'fsr':undefined},
 			4:{'val':0, 'fsr':undefined},
 			5:{'val':0, 'fsr':undefined}, 
			6:{'val':0, 'fsr':undefined}, 
			7:{'val':0, 'fsr':undefined}};


function anything(){}



function make_fsr(x, y)
{
	var new_fsr = {};
	new_fsr._x = x;
	new_fsr._y = y;
	new_fsr._group = 0;
	return new_fsr;
}

function init()
{
	assignment_gui = this.patcher.getnamed('assignments');
	keys_gui = this.patcher.getnamed('keys');
	for(var i=0;i<8;i++)
	{
		outlet(0, 'base_fader', 'value', i, KEYS[i]);
		assignments[i]=[];
		for(var j=0;j<4;j++)
		{
			assignments[i][j] = {'val':0, 'fsr':make_fsr(i, j)}
		}
	}
	get_assignment_grid();
	update_assignment_grid();
}

function key(num, val)
{
	//post('key',num, val, '\n');
	if(val > 0)
	{
		current_edit = num;
		//post('current_edit', current_edit, '\n');
		for(var i=0;i<8;i++)
		{
			outlet(0, 'key', 'value', i, parseInt((current_edit == i)*KEYS[i]));
		}
	}
}

function base_grid_CC(x, y, val)
{
	post('base_grid_CC', x, y, val, '\n');
	if((current_edit > 0)&&(val>0))
	{
		if(assignments[x][y].val!=current_edit)
		{
			assignments[x][y].val = current_edit;
			update_assignment_grid();
		}
	}
	else
	{
		var group = assignments[x][y].val;
		post('calculating for group', group, '\n');
		if(groups[group].val < val)
		{
			post('group.val < val');
			groups[group].fsr = assignments[x][y].fsr;
			groups[group].val = val;
			outlet(1, group, groups[group].val);
			outlet(0, 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
		}
		else if(groups[group].fsr == assignments[x][y].fsr)
		{
			post('group.fsr == fsr');
			groups[group].val = val;
			outlet(1, group, groups[group].val);
			outlet(0, 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
		}

	}
}


function get_assignment_grid()
{
	var assgn = assignment_gui.getvalueof()
	//post('assgn:', assgn, '\n');
	while(assgn.length)
	{
		assignments[assgn.shift()][assgn.shift()].val = assgn.shift();
	}
	//post_assignments();
}

function update_assignment_grid()
{
	post('update assignment grid\n');
	groups={0:{'val':0, 'fsr':undefined}, 
	1:{'val':0, 'fsr':undefined}, 
	2:{'val':0, 'fsr':undefined}, 
	3:{'val':0, 'fsr':undefined},
	4:{'val':0, 'fsr':undefined},
	5:{'val':0, 'fsr':undefined}, 
	6:{'val':0, 'fsr':undefined}, 
	7:{'val':0, 'fsr':undefined}};	
	for(var i=0;i<8;i++)
	{
		for(var j=0;j<4;j++)
		{
		//	groups[assignments[i][j].value].push(assignments[i][j]);
			assignment_gui.message(i, j, assignments[i][j].val);
			outlet(0, 'base_grid', 'value', i, j, KEYS[assignments[i][j].val]);
			outlet(0, 'base_grid', 'identifier', i, j, NOTES[assignments[i][j].val]);
			outlet(0, 'base_grid', 'channel', i, j, 2);
		}
	}
}

function post_assignments()
{
	/*post('assigns:')
	{
		for(var i=0;i<8;i++)
		{
			for(var j=0;j<4;j++)
			{
				post(i, j, assignments[i][j].value, '\n');
			}
		}
	}*/
}

post('new patch');

if(FORCELOAD){init();}


