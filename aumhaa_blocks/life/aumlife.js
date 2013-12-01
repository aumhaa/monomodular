autowatch = 1;

inlets = 4;
outlets = 4;

var script = this;

var DEBUG = false;

var alive = false;
var slots_init = false;
var unique = jsarguments[1];
var alt_val = 0;
var last_mask = 0;
var solo = 0;
var mute = [1, 1, 1, 1]; 
var steps = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
var colors = [1, 2, 3, 4];
var key_colors = [1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0];
var plane = 0;
var solo = 0;
var preset = 1;
var lifeset = new JitterObject('jit.matrix', 'lifeset');
var repos = new JitterObject("jit.repos");
repos.boundmode=1;
repos.mode=1;
repos.offset_y = -1;
repos.outputmode="Normal";
var falling = new JitterMatrix(2, 'char', 16, 14);
var temp = new JitterMatrix(4, 'char', 16, 14);

var gravity = 0;
var imprint = 0;
var monoui = this.patcher.getnamed('monoui');
var gravityui = this.patcher.getnamed('gravityui');
var imprintui = this.patcher.getnamed('imprintui');

falling.setall(0, -1);
lifeset.clear();

var storage;

function init()
{
	storage = this.patcher.getnamed('life_preset');
	alive = true;
	for(var i=0;i<16;i++)
	{
		outlet(0, i, 14, 6 - steps[i]);
	}
	outlet(0, 0, 15, solo * 10);
	for(var i=0;i<4;i++)
	{
		outlet(0, i+12, 15, mute[i] * colors[i]);
	}
	outlet(2, 'key', 1, 1);
	display_gameboard();
	if(DEBUG){post('here...\n');}
	storage.message('getslotlist');
}

function anything()
{
	args = arrayfromargs(messagename, arguments);
	if(DEBUG){post('anything args', args, '\n');}
	switch(inlet)
	{
		case 0:
			grid(args[0], args[1], args[2]);
			break;
		case 1:
			key(args[0]);
			break;
		case 2:
			step(args[0]);
			break;
	}
}

function step(num)
{
	if(alt_val == 0)
	{
		outlet(2, 'mask', 'grid', last_mask, 14, -1);
		last_mask = num;
		outlet(2, 'mask', 'grid', num, 14, 0);
		if(num==0)
		{
			if(imprint > 0)
			{
				for(var i=0;i<16;i++)
				{
					var cell = lifeset.getcell(i, 13);
					if(solo>0)
					{
						steps[i] = Math.floor(cell[plane]>0);
					}
					else
					{
						steps[i] = Math.floor(((cell[0] * mute[0]) + (cell[1] * mute[1]) + (cell[2] * mute[2]) + (cell[3] * mute[3]))>0);
					}
					outlet(0, i, 14, 6 - steps[i]);
				}
			}
			outlet(1, 'bang');
			if(gravity > 0)
			{
				if(DEBUG){post('falling....\n');}
				repos.matrixcalc([lifeset,falling],temp);
				lifeset.frommatrix(temp);
			}	 
		}
		display_gameboard();	
		if(steps[num]>0)
		{
			outlet(0, 'getcolumn', num);
		}
	}
}

function display_gameboard()
{
	for(var x=0;x<16;x++)
	{
		for(var y=0;y<14;y++)
		{
			var cell = lifeset.getcell(x, y);
			var empty = true;
			if(solo > 0)
			{
				outlet(0, x, y, (cell[plane]>0) * (plane+1));
			}
			else
			{
				for(var p=0;p<4;p++)
				{
					if((mute[p]>0)&&(cell[p]>0))
					{
						outlet(0, x, y, p + 1);
						var empty = false;
						break;
					}
				}
				if(empty == true)
				{
					outlet(0, x, y, 0);
				}
			}
		}
	}
}
			
function key(num)
{
	if(num<5)
	{
		plane = num - 1;
		display_gameboard();
	}
}

function grid(x, y, val)
{
	if((y< 14)&&(val > 0))
	{
		if(alt_val>0)
		{
			outlet(3, x, y, 'inc');
		}
		else
		{
			var cell = lifeset.getcell(x, y);
			cell[plane] = Math.abs(cell[plane] - 255);
			lifeset.setcell2d(x, y, cell[0], cell[1], cell[2], cell[3]);
			outlet(0, x, y, (cell[plane]/255) * colors[plane]);
		}
	}
	else if((y==14)&&(val>0))
	{
		steps[x] = Math.abs(steps[x]-1);
		for(var i=0;i<16;i++)
		{
			outlet(0, i, 14, 6 - steps[i]);
		}
	}
	else if((y==15)&&(val>0))
	{
		if(x == 11)
		{
			if(alt_val>0)
			{
				outlet(3, 'clear');
			}
			else
			{
				clear_plane();
			}
		}
		else if(x > 11)
		{
			mute[x-12]=Math.abs(mute[x-12]-1);
			for(var i=0;i<4;i++)
			{
				outlet(0, i+12, 15, mute[i] * colors[i]);
			}
			display_gameboard();
		}
		else if(x==0)
		{
			solo = Math.abs(solo-1);
			outlet(0, 0, 15, solo * 10);
			display_gameboard();
		}
		else
		{
			if(alt_val > 0)
			{
				if(DEBUG){post('from grid store\n');}
				store_preset(preset);
			}
			recall_preset(x);
		}
	}
}

function alt(val)
{
	alt_val = val;
	if(alt_val > 0)
	{
		//display_presets();
		for(var i=0;i<14;i++)
		{
			outlet(2, 'batch', 'row', i, 0);
		}
		recall_preset(preset);
	}
	else
	{
		if(DEBUG){post('from alt store\n');}
		store_preset(preset);
		messnamed(unique+'refresh', 'bang');
	}
}

function store_preset(num)
{
	storage.message('store', num);
	if(DEBUG){post('store_preset', num, '\n');}
}

function recall_preset(num)
{
	preset = num;
	if(DEBUG){post('recall_preset', num, '\n');}
	for(var j=1;j<11;j++)
	{
		outlet(0, j, 15, Math.floor(j==preset) + 4);
	}
	storage.message('int', num);
	outlet(3, 'bang');
}

function slotlist()
{
	if(alive)
	{
		var args = arrayfromargs(arguments);
		if(slots_init == false)
		{
			if(DEBUG){post('initializing presets\n');}
			for(var i=1;i<11;i++)
			{
				var exists = false;
				for(var j=0;j<args.length;j++)
				{
					if(args[j]==i)
					{
						exists = true;
					}
				}
				if(exists == false)
				{
					if(DEBUG){post('resetting preset', i, '\n');}
					outlet(3, 'clear');
					store_preset(i);
				}
			}
			slots_init = true;
		}		 
		if(DEBUG){post('slotlist', args, '\n');}
		recall_preset(1);
	}
}

function recall(num)
{
	if(DEBUG){post('recalled', num, '\n');}
	if(alt_val == 0)
	{
		//display_presets();
		display_gameboard();
	}
}

function preset_data(x, y, val)
{
	if(DEBUG){post('preset_data', x, y, val, '\n');}
	if(alt_val>0)
	{
		if(DEBUG){post('outlet 0', x, y, val, '\n');}
		outlet(2, 'grid', x, y, Math.floor(val>0)*6);
	}
	else if(alt_val==0)
	{
		if(val>0)
		{
			cell = lifeset.getcell(x, y);
			cell[plane] = 255;
			lifeset.setcell2d(x, y, cell[0], cell[1], cell[2], cell[3]);
			if(DEBUG){post('setcell', x, y, val);}
		}
		if((x==15)&&(y==13))
		{
			display_gameboard();
		}
	}
}

function clear_plane()
{
	for(var x=0;x<16;x++)
	{
		for(var y=0;y<14;y++)
		{
			cell = lifeset.getcell(x, y);
			cell[plane] = 0;
			lifeset.setcell2d(x, y, cell[0], cell[1], cell[2], cell[3]);
		}
	}
	display_gameboard();
}

function set_gravity(val)
{
	gravity = val;
}

function set_imprint(val)
{
	imprint = val;
}

function pattrstorage()
{
	args=arrayfromargs(arguments);
	if(DEBUG){post('pattrstorage', args, '\n');}
}

/*function display_presets()
{
	storage.message('getslotlist');
}*/



	