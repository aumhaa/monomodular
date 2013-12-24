autowatch = 1; 

inlets = 1;
outlets = 2;

var script = this;
var DEBUG = false;
var FORCELOAD = false;
var shifted = false;
var assignment_gui;
var assignment_coll;
var keys_gui;
var assignments = [];
var current_edit = 0;
var KEYS = [0, 1, 2, 3, 4, 5, 6, 7];
var NOTES = [-1, 0, 1, 2, 3, 4, 5, 6];
var groups={0:{'val':0, 'fsr':undefined}, 
			1:{'val':0, 'fsr':undefined}, 
			2:{'val':0, 'fsr':undefined}, 
			3:{'val':0, 'fsr':undefined},
 			4:{'val':0, 'fsr':undefined},
 			5:{'val':0, 'fsr':undefined}, 
			6:{'val':0, 'fsr':undefined}, 
			7:{'val':0, 'fsr':undefined}};


function anything()
{
	//post('anything', arrayfromargs(messagename, arguments));
}



function fsr(x, y)
{
	var self = this;
	this._x = x;
	this._y = y;
	this._group = 0;
}

function init()
{
	if(DEBUG){post('skin init.');}
	assignment_gui = this.patcher.getnamed('assignments');
	assignment_coll = this.patcher.getnamed('matrix');
	keys_gui = this.patcher.getnamed('keys');
	for(var i=0;i<8;i++)
	{
		outlet(0, 'base_fader', 'value', i, 1);
		assignments[i]=[];
		for(var j=0;j<8;j++)
		{
			assignments[i][j] = {'val':0, 'fsr':new fsr(i, j)}
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

function shift(val)
{
	if(DEBUG){post('shift', val, '\n');}
	shifted = val>0;
	update_assignment_grid();
}

function push_grid(x, y, val)
{
	if(DEBUG){post('push_grid', x, y, val, '\n');}
	base_grid(x, y, val);
}

function base_grid(x, y, val)
{
	if(shifted)
	{
		if(DEBUG){post('base_grid', x, y, val, '\n');}
		if((val>0))
		{
			if(assignments[x][y].val!=current_edit)
			{
				assignments[x][y].val = current_edit;
				outlet(0, 'base_grid', 'value', x, y, KEYS[current_edit]);
				outlet(0, 'push_grid', 'value', x, y, KEYS[current_edit]);
			}
		}
		else
		{
			
			/*var group = assignments[x][y].val;
			post('calculating for group', group, '\n');
			if(groups[group].val < val)
			{
				post('group.val < val');
				groups[group].fsr = assignments[x][y].fsr;
				groups[group].val = val;
				//outlet(1, group, groups[group].val);
				outlet(0, 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
			}
			else if(groups[group].fsr == assignments[x][y].fsr)
			{
				post('group.fsr == fsr');
				groups[group].val = val;
				//outlet(1, group, groups[group].val);
				outlet(0, 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]+(val>0));
			}*/
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
	if(!shifted)
	{
		//post('update assignment grid\n');
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
			for(var j=0;j<8;j++)
			{
			//	groups[assignments[i][j].value].push(assignments[i][j]);
				this.patcher.getnamed('assignments').message(i, j, assignments[i][j].val);
				outlet(0, 'push_grid', 'value', i, j, KEYS[assignments[i][j].val]);
				outlet(0, 'push_grid', 'identifier', i, j, NOTES[assignments[i][j].val]);
				outlet(0, 'push_grid', 'channel', i, j, 2);
				if(j<4)
				{
					outlet(0, 'base_grid', 'value', i, j, KEYS[assignments[i][j].val]);
					outlet(0, 'base_grid', 'identifier', i, j, NOTES[assignments[i][j].val]);
					outlet(0, 'base_grid', 'channel', i, j, 2);
				}
			}
		}
	}
	else
	{
		//post('reassigning default grids');
		var x=7;do{
			//post('basegrid...');
			var y=3;do{
				//post('x:', x, 'y:', y, '\n');
				outlet(0, 'base_grid', 'value', x, y, KEYS[assignments[x][y].val]);
				//post('a', assignments[x][y], '\n');
				//post('b', assignments[x][y].val, '\n');
				outlet(0, 'base_grid', 'channel', x, y, -1);
				outlet(0, 'base_grid', 'identifier', x, y, -1);
				//post('returning');
			}while(y--);
			post('pushgrid...');
			var y=7;do{
				outlet(0, 'push_grid', 'value', x, y, KEYS[assignments[x][y].val]);
				outlet(0, 'push_grid', 'channel', x, y, -1);
				outlet(0, 'push_grid', 'identifier', x, y, -1);
			}while(y--);
		}while(x--);
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

//post('new patch');

if(FORCELOAD){post('FORCELOAD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n');init();}


