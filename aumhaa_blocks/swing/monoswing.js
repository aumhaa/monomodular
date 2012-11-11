autowatch = 1;

inlets = 10;
outlets = 1;

setinletassist(0, 'live.thisdevice left outlet');
setinletassist(1, 'freebang');
setinletassist(2, 'swing1');
setinletassist(3, 'swing2');
setinletassist(4, 'swing3');
setinletassist(5, 'swing4');
setinletassist(6, 'swing5');
setinletassist(7, 'swing6');
setinletassist(8, 'swing7');
setinletassist(9, 'swing8');
setoutletassist(0, 'dump output');

var patch_type = jsarguments[1];
var unique = jsarguments[2];

const SWITCHBOARD = 16;
const MONOMOD=new RegExp(/(Monomodular)/);
var surface;
var connected = false
var cs = -1;
var this_name = patch_type;
var alive=0;
var script=this;
var swingui = [];


function init()
{	
	for(var i=0;i<8;i++)
	{
		swingui[i] = this.patcher.getnamed('swing'+(i+1));
	}
	post(this_name, " script initiated");
	surface=new LiveAPI(pipe, 'control_surfaces');
	connect_to_monomod();
	post('\n');
}

function connect_to_monomod()
{
	for(var i= 0;i<6;i++)
	{
		surface.goto('control_surfaces', i);
		if(MONOMOD.test(surface.type)==1)
		{
			cs = i;
			post('...connected to Monomodular');
			//var cont_count=surface.getcount('controls');
		    //for(var j=0;j<cont_count;j++)
		    //{
		    surface.goto('controls', SWITCHBOARD);
		    //if(surface.get('name')=='Switchboard')
			//{	
			surface.property = 'value';
			alive=1;
			post('...connected to Switchboard!');
			break;
			//}
		    //}
			//break;
		}
	}
}

function pipe(args)
{
	//post('pipe', args, '\n');
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		switch(args[1])
		{
			case('receive_swing'):
				swingui[args[2]].message('set', args[3]);
				break;
			default:
				//outlet(1, args);
				//post('receive', args, '\n');
				break;
		}
	}
}
		
function dissolve()
{
	if(alive > 0)
	{
		surface.property = 0;
		surface.id = 0;
		post(this_name, ' dissolved!\n');
	}
}

function anything(args)
{
	args = arrayfromargs(messagename, arguments);
	switch(inlet)
	{
		case 0:
			if(args[0] == 'bang')
			{
				init();
				break;
			}
		case 1:
			if(args[0] == 'bang')
			{
				dissolve();
				break;	
			}
		default:
			{
				send_swing(inlet - 2, args[0]);
				break;
			}
	}
}

function send_swing(client, value)
{
	if(alive > 0)
	{
		//post('send swing ', client, value, '\n');
		surface.call('send_swing', client, value);
	}
}




