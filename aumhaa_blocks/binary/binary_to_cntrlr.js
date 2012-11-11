autowatch = 1;

outlets = 2;

const BANK = [0, 1];
const BOUND = [0, 1];
const BOUNDED = [1, 127];

var alive = 0;
var script = this;
var pattr_obj = [];
var dial_mode = 0;
var bank = 0;
const Bank = [[0, 0], [4, 0], [0, 2], [4, 2]];
const Names = [['Swing', 'Root', '8ve', 'Type'], ['Chan', 'Dir', 'Len', 'Speed']]

var Colors = [];
for(var i=0;i<127;i++){Colors[i]=i};
Colors[127] = 1;
Colors[3] = 13;

function init()
{
	post('init');
	alive = 1;
	outlet(0, 'set_dial_mode');
	outlet(1, 'grid', 0, 1, 1);
	for(var i=0;i<4;i++)
	{
		outlet(1, 'wheel', i, 1, 'pn', Names[0][i]);
		outlet(1, 'wheel', i, 2, 'pn', Names[1][i]);
	}
}

function anything()
{
	//var args = arrayfromargs(messagename, arguments)
	//post('cntrlr_in', args, '\n');
}

function cntrl_in()
{
	var args = arrayfromargs(arguments)
	//post('ctrl_in', messagename, args, '\n');
	switch(args[0])
	{	 
		case('dial'):
			if(args[2]>0)
			{
				outlet(0, 'dial', args[1]+Bank[bank][0], (args[2]+Bank[bank][1])-1, args[3]);
			}
			else
			{
				outlet(0, 'dial', args[1]+(dial_mode*4), 3, args[3]);
			}	
			break;
		case('button'):
			outlet(0, 'button', args[1]+Bank[bank][0], args[2]+Bank[bank][1], args[3]);
			break;
		case('grid'):
			if(args[2]==0)
			{
				if(args[1]==3)
				{
					if(args[3]>0)
					{
						dial_mode = Math.abs(dial_mode - 1);
						outlet(1, 'grid', 3, 0, dial_mode+2);
						outlet(0, 'set_dial_mode');
					}
				}
				else
				{
					outlet(0, 'row', args[1], args[3]);
				}
			}
			else if(args[2]==1)
			{
				if(args[3]>0)
				{
					change_bank(args[1]);
				}
			}
			else
			{
				outlet(0, 'column', args[1]+Math.floor(args[2]/4) + (4 * Math.floor(args[2]>2)), args[3]);
			}
			break;
	}
}

function change_bank(val)
{
	bank = val;
	for(var i=0;i<4;i++)
	{
		outlet(1, 'grid', i, 1, Math.floor(i==bank));
	}
	outlet(0, 'refresh');
}
	
function cntrl_out()
{
	var args = arrayfromargs(arguments)
	//post('ctrl_out', messagename, args, '\n');
	switch(args[0])
	{
		case('wheel'):
			if(args[3]=='white')
			{
				args[4] = Colors[args[4]];
			}
			if(dial_mode==0 && args[2]==3 && args[1]<4)
			{	
				args[2] -= 3;
				outlet(1, args);
				return;
			}
			else if(dial_mode==1 && args[2]==3 && args[1]>3)
			{
				args[2] -= 3;
				args[1] -= 4;
				outlet(1, args);
				return;
			}
			else if(args[1]>=Bank[bank][0] && args[1]<Bank[bank][0]+4 && args[2]>=Bank[bank][1] && args[2]<Bank[bank][1]+2)
			{
				args[1] -= Bank[bank][0];
				args[2] -= Bank[bank][1];
				args[2] += 1;
				outlet(1, args);
			} 
			break;
		case('column'):
			outlet(1, 'grid', args[1]%4, Math.floor(args[1]/4)+2, (args[2]>0)*6);
			break;
		case('row'):
			if(args[1]!=3)
			{
				outlet(1, 'grid', args[1], 0, args[2]);
			}
			break;
	}
}

function lcd()
{
	var args = arrayfromargs(arguments);
	if(args[0]<8)
	{
		if(args[0]<4 && args.length > 1)
		{
			outlet(1, 'wheel', args[0], 1, 'pn', Names[0][args[0]]);
			outlet(1, 'wheel', args[0], 1, 'pv', args[1].toString());
		}
		else if(args.length > 1)
		{
			if(args[0]<7)
			{
				outlet(1, 'wheel', args[0]-4, 2, 'pn', Names[1][args[0]-4]);
			}
			outlet(1, 'wheel', args[0]-4, 2, 'pv', args[1].toString());
		}
	}
	else if(args.length > 1)
	{
		outlet(1, 'wheel', 3, 2, 'pn', args[1].toString());
	}
}
