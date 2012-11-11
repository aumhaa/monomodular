autowatch = 1

inlets = 2;
outlets	 = 2;
setinletassist(0, "input from clients");
setinletassist(1, "osc input");
setoutletassist(0, "ipad osc output");
setoutletassist(1, "osc address");

undefined = (function(){var u; return u;})();	///required to return an actual 'undefined', in case its variable name gets reassigned
var elements=[];	///array that holds all elements(MAX API Objects) in the script
var surface;   		///finder for the control_surface; represents the specific control_surface script

////this section is script specific
var script=this;
var tasks=[];
var alive=0;
var timer=0;
var grid_option_mode=0;
var option=0;
var mnm_x_off=0;
var mnm_y_off=0;
var monomebank=0;
var colors=multi;
var monochrome=0;
var control=[];
var modes=[];
var cell;
var active_mode;
var shift_mode;
var shift_r;
var shift_r_listener;
var shift_l;
var shift_l_listener;
var xfader;
var xfader_listener;
var button=[];
var button_listener=[];
var menu=[];
var menu_listener=[];
var matrix=[];
var matrix_listener=[];
var session_l=[];
var session_r=[];
var session_m=[];
var fader=[];
var fader_listener=[];
var dial=[];
var dial_listener=[];
var livid;
var livid_listener;
var xfader;
var xfader_listener;
var names;
var ipad_scene;
var ipad_cell;
var commands=[];
var ipad;
var ipad_controls=[];
var page=2;
var bright=1;
var last_offsets=[0,0,0,0];
var last_mode=0;
var cs = "0";
var is_loaded="0";
var mnm;
var page_str = '1';
var threshold = 50;
var extra;
var last_grid = [];

const LEMAUR256=new RegExp(/(Lemaur256)/);

const old_multi=[0, 1, 2, 3, 4, 5, 6, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6];
const multi=[0, 127, 5, 3, 1, 6, 9, 127, 0, 1, 3, 127, 0, 2, 4, 127, 0, 3, 5, 127, 0, 4, 6, 127, 0, 5, 8, 127, 0, 6, 9];
const mono=[0, 127, 5, 3, 1, 6, 9, 127, 0, 1, 3, 127, 0, 2, 4, 127, 0, 3, 5, 127, 0, 4, 6, 127, 0, 5, 8, 127, 0, 6, 9];

const all_colors=["green", "green", "yellow", "orange", "red", "purple", "blue", "gray"];
const mono_colors=["gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray"];
var colors=all_colors;

const menu_names=['play', 'green', 'stop', 'gray', 'record', 'red', 'loop', 'yellow', 'stop clips', 'purple', 'overdub', 'orange', '-', 'green', '+', 'green', 'lock', 'purple', '- track', 'blue', 'track +', 'blue', 'on/off', 'gray'];

function callback(){}

function init(cid)
{
	if(alive==0)
	{
		for(var i=0;i<256;i++)
		{
			last_grid[i]=[];
			last_grid[i].val = 0;
			last_grid[i].X = i%16;
			last_grid[i].Y = Math.floor(i/16);
		}
		extra = this.patcher.getnamed('extra');
		connect_to_aumpad();
	}
}

function connect_to_aumpad()
{
	surface = new LiveAPI(pipe, 'control_surfaces')
	for(var i= 0;i<6;i++)
	{
		surface.goto('control_surfaces', i);
		if(LEMAUR256.test(surface.type)==1)
		{
			post('connected=', surface.get('connected'), '\n');
			if(surface.get('connected')==0)
			{
				cs = i;
				assign_api();
				extra.message('activebgcolor', .57, .62, .66, 1.)
				surface.call('reset');
				surface.call('refresh_state');
				set_brightness(bright);
				set_threshold(threshold);
				post(this_name, ' is connected to Aum256 script\n');
				break;
			}
		}
	}
}

function assign_api()
{
	device = new LiveAPI(callback, 'this_device');
	this_id = device.id;
	this_name = device.get('name');
	surface.num=cs;
	monobridge = new LiveAPI(pipe, 'control_surfaces', cs, 'controls', 0);
	monobridge.property = 'value';
	monobridge.call('connect_to', 'id', this_id);
	alive=1;
	post("Done building Lemur API Objects.\n");
	//post('monobridge name', monobridge.get('name'), '\n');
}

function pipe(args)
{
	//args = arrayfromargs(messagename, arguments);
	//post('monobridge callback', args, '\n');
	if(args[0]=='value')
	{
		//post('pipe osc: ', args[2], '~', args[3], ':', typeof(args[3]), '\n');
		switch(args[1])
		{
			case 'osc':
				//if ((args[3]!=undefined)&&(typeof(args[3])=='string')&&(args[3].charAt(0)=='`'))
				//{
				//	args[3] = args[3].replace(/_/g, ' ');
				//	args[3] = args[3].slice(1);
				//}
				outlet(0, args[2], args[3], args[4], args[5]);
				//outlet(0, args[2], args[3]);
				break;
			case 'page':
				//outlet(0, args[2])
				break;
			case 'clip_name':
				//post('clip_name', args, '\n');
				break;
			default:
				post('pipe default: ', args[0], args[1], args[2], args[3], '\n');
				break;
		}
	}
}

function dissolve()
{
	if(alive>0)
	{
		alive=0;
		if((device)&&(device.property)){
			device.property = 0;
			device.id = 0;
		}
		if((monobridge)&&(monobridge.property)){
			monobridge.property = 0;
			monobridge.id = 0;
		}
		post('Lemaur256 script dissolved\n');	
	}
	//outlet(3, "dissolve");
}

function toggle_monochrome(n)
{
	{
		monochrome=n;
		switch (n)
		{
			case 0:
				colors=multi;
				break;
			case 1:
				colors=mono;
				break;
		}
		if(grid_option_mode>0)
		{
			update_client();
		}
	}
}

function clock()
{
	timer++;
	for(var a in tasks)
	{
		post('task:', tasks[a], '\n');
		if(tasks[a].length==1)
		{
			if (script[tasks[a]] instanceof Function)
	    	{
				post('function:', tasks[a], '\n');
		        script[tasks[a]].apply(script[tasks[a]],[]);
			}
		}
		else if(tasks[a].length==2)
		{
			if (tasks[a][0][tasks[a][1]] instanceof Function)
			{
				post('function:', tasks[a], '\n');
				tasks[a][0][tasks[a][1]].apply(tasks[a][0], []);
			}
	    }
		tasks.splice(a,1);
	}
}

function add_task(task)
{
	tasks.push(task);
	//post("adding_task", task, "\n");
}

function anything()
{	
	args = arrayfromargs(messagename, arguments);
	//post('anything in to osc_in:', messagename, arguments[0], '\n');
	if (alive > 0)
	{
		switch(messagename)
		{
			case '/Grid/value':
				monobridge.call('osc_in', '/Grid_'+args[1]+'_'+args[2], args[3]);
				break;
			case '/Keys/value':
				monobridge.call('osc_in', '/Keys_'+args[1], args[2]);
				break;
			case '/Shift/value':
				monobridge.call('osc_in', '/Shift_'+args[1], args[2]);
				break;
			default:
				monobridge.call('osc_in', messagename, arguments[0]);
				break;
		}
	}
}

function set_brightness(args)
{
	if(alive > 0)
	{
		monobridge.call('set_brightness', args);
	}
	bright=args;
}	

function set_threshold(val)
{
	if(alive > 0)
	{
		monobridge.call('set_threshold', val);
	}
	threshold = val;
}

function port(number)
{
	outlet(0, 'port', number);
}

function host(address)
{
	if (address.charAt(address.length -1) == '.')
	{
		address = address.slice(0, -1);
	}
	outlet(1, 'set', address);
	outlet(1, 'bang');
	if(alive > 0)
	{
		surface.call('reset');
		surface.call('refresh_state');
		set_brightness(bright);
	}
}

