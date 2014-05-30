autowatch = 1;

inlets = 6;
outlets = 1;

setinletassist(0, 'live.thisdevice left outlet');
setinletassist(1, 'freebang');
setinletassist(2, 'lcd view switch');
setinletassist(3, 'autohide switch');
setinletassist(4, 'clock');
setinletassist(5, 'jit.displays');
setoutletassist(0, 'dump output');

DEBUG = 1;

var patch_type = jsarguments[1];
var unique = jsarguments[2];
var wiki_addy = 'http://www.aumhaa.com/wiki/index.php?title='+patch_type;
var finder;
var connected = false
var cs = -1;
var this_id = 0;
var this_name = patch_type;
var alive=0;
var script=this;
var colors=[1, 0, 0, 1];
var auto=1;
var auto_del = 2;
var time=1250;
var tasks=[];
var front=0;
var last=0;
var timer=0;
var x_val = 0;
var y_val = 0;
var x_start=0;
var y_start=0;
var x_end=0;
var y_end=0;
var screen_width = 1024;
var screen_heigth = 768;
var lcd_view=1;
var zoomfactor=1;
var screen_position = .65;
var lcd_screen;
var mp = [];
var pn = [];
var oscpn = [];
var oscmp = [];
var remote = 0;   //send to remote client if flag is 1
var sender;
var lcdui; //script name "gui"
var autohideui;		//script name "autohide"
var positions = [0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31];
var pipe = [];
var surfaces = [];

var MONOHM={colors:[.9, .9, .9, 1], regexp: new RegExp(/(MonOhm)/), n: 'MonOhm', 
				names:['Dial_0', 'Dial_1', 'Dial_2', 'Dial_3', 'None', 'None', 'None', 'Crossfader',
						'Dial_4', 'Dial_5', 'Dial_6', 'Dial_7', 'None', 'None', 'None', 'None', 
						'Dial_8', 'Dial_9', 'Dial_10', 'Dial_11', 'Dial_12', 'Dial_13', 'Dial_14', 'Dial_15',
						'Fader_0', 'Fader_1', 'Fader_2', 'Fader_3', 'Fader_4', 'Fader_5', 'Fader_6', 'Fader_7']};
var CODEC = {colors:[0, 1, 0, 1], regexp: new RegExp(/(Codec)/), n: 'Codec', 
				names:['Dial_0_0', 'Dial_1_0', 'Dial_2_0', 'Dial_3_0', 'Dial_4_0', 'Dial_5_0', 'Dial_6_0', 'Dial_7_0',
						'Dial_0_1', 'Dial_1_1', 'Dial_2_1', 'Dial_3_1', 'Dial_4_1', 'Dial_5_1', 'Dial_6_1', 'Dial_7_1', 
						'Dial_0_2', 'Dial_1_2', 'Dial_2_2', 'Dial_3_2', 'Dial_4_2', 'Dial_5_2', 'Dial_6_2', 'Dial_7_2',
						'Dial_0_3', 'Dial_1_3', 'Dial_2_3', 'Dial_3_3', 'Dial_4_3', 'Dial_5_3', 'Dial_6_3', 'Dial_7_3']};
var CODEX = {colors:[0, 1, 0, 1], regexp: new RegExp(/(Codex)/), n: 'Codex', 
				names:['Dial_0_0', 'Dial_1_0', 'Dial_2_0', 'Dial_3_0', 'Dial_4_0', 'Dial_5_0', 'Dial_6_0', 'Dial_7_0',
						'Dial_0_1', 'Dial_1_1', 'Dial_2_1', 'Dial_3_1', 'Dial_4_1', 'Dial_5_1', 'Dial_6_1', 'Dial_7_1', 
						'Dial_0_2', 'Dial_1_2', 'Dial_2_2', 'Dial_3_2', 'Dial_4_2', 'Dial_5_2', 'Dial_6_2', 'Dial_7_2',
						'Dial_0_3', 'Dial_1_3', 'Dial_2_3', 'Dial_3_3', 'Dial_4_3', 'Dial_5_3', 'Dial_6_3', 'Dial_7_3']};
var BLOCKMOD = {colors:[1, 1, 0, 1], regexp: new RegExp(/(BlockMod)/), n: 'BlockMod', 
				names:['None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 
						'Fader_0', 'Fader_1', 'None', 'None', 'None', 'None', 'None', 'None',
						'Dial_0', 'Dial_1', 'Dial_2', 'Dial_3', 'Dial_4', 'Dial_5', 'Dial_6', 'Dial_7']};
var CNTRLR_ORIG = {colors:[.5, .7, 1, 1], regexp: new RegExp(/(Cntrlr_Orig)/), n: 'Cntrlr', 
				names:['Dial_Left_0', 'Dial_Left_1', 'Dial_Left_2', 'Dial_Left_3', 'Dial_Right_0', 'Dial_Right_1', 'Dial_Right_2', 'Dial_Right_3',
						'Dial_Left_4', 'Dial_Left_5', 'Dial_Left_6', 'Dial_Left_7', 'Dial_Right_4', 'Dial_Right_5', 'Dial_Right_6', 'Dial_Right_7', 
						'Dial_Left_8', 'Dial_Left_9', 'Dial_Left_10', 'Dial_Left_11', 'Dial_Right_8', 'Dial_Right_9', 'Dial_Right_10', 'Dial_Right_11',
						'Encoder_4', 'Encoder_5', 'Encoder_6', 'Encoder_7', 'Encoder_8', 'Encoder_9', 'Encoder_10', 'Encoder_11']};
var CNTRLR = {colors:[.5, .7, 1, 1], regexp: new RegExp(/(Cntrlr)/), n: 'Cntrlr', 
				names:['Dial_Left_0', 'Dial_Left_1', 'Dial_Left_2', 'Dial_Left_3', 'Dial_Right_0', 'Dial_Right_1', 'Dial_Right_2', 'Dial_Right_3',
						'Dial_Left_4', 'Dial_Left_5', 'Dial_Left_6', 'Dial_Left_7', 'Dial_Right_4', 'Dial_Right_5', 'Dial_Right_6', 'Dial_Right_7', 
						'Dial_Left_8', 'Dial_Left_9', 'Encoder_0', 'Encoder_1', 'Encoder_2', 'Encoder_3', 'Dial_Right_10', 'Dial_Right_11',
						'Encoder_4', 'Encoder_5', 'Encoder_6', 'Encoder_7', 'Encoder_8', 'Encoder_9', 'Encoder_10', 'Encoder_11']};
var AUMPC40 = {colors:[0, 1, .3, 1], regexp: new RegExp(/(AumPC40)/), n: 'AumPC40', 
				names:['Track_Control_0', 'Track_Control_1', 'Track_Control_2', 'Track_Control_3', 'Device_Control_0', 'Device_Control_1', 'Device_Control_2', 'Device_Control_3',
						'Track_Control_4', 'Track_Control_5', 'Track_Control_6', 'Track_Control_7', 'Device_Control_4', 'Device_Control_5', 'Device_Control_6', 'Device_Control_7', 
						'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'0_Volume_Control', '1_Volume_Control', '2_Volume_Control', '3_Volume_Control', '4_Volume_Control', '5_Volume_Control', '6_Volume_Control', '7_Volume_Control']};
var AUMPC20 = {colors:[.3, .8, .3, 1], regexp: new RegExp(/(AumPC20)/), n: 'AumPC20', 
				names:['None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None', 
						'None', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'Slider_0', 'Slider_1', 'Slider_2', 'Slider_3', 'Slider_4', 'Slider_5', 'Slider_6', 'Slider_7']};
var OHMMODES = {colors:[.9, .9, .9, 1], regexp: new RegExp(/(OhmModes)/), n: 'OhmModes', 
				names:['Dial_0', 'Dial_1', 'Dial_2', 'Dial_3', 'None', 'None', 'None', 'None',
						'Dial_4', 'Dial_5', 'Dial_6', 'Dial_7', 'None', 'None', 'None', 'None', 
						'Dial_8', 'Dial_9', 'Dial_10', 'Dial_11', 'Dial_12', 'Dial_13', 'Dial_14', 'Dial_15',
						'Fader_0', 'Fader_1', 'Fader_2', 'Fader_3', 'Fader_4', 'Fader_5', 'Fader_6', 'Fader_7']};
var BASE = {colors:[1, 0, 0, 1], regexp: new RegExp(/(Base)/), n: 'Base', 
				names:['Device_Chain', 'None', 'None', 'None', 'None', 'None', 'None', 'Fader_8',
						'Device_Name', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'Device_Bank', 'None', 'None', 'None', 'None', 'None', 'None', 'None',
						'Fader_0', 'Fader_1', 'Fader_2', 'Fader_3', 'Fader_4', 'Fader_5', 'Fader_6', 'Fader_7']};
var AUMTROLL = {colors:[.5, .7, 1, 1], regexp: new RegExp(/(AumTroll)/), n: 'AumTroll', 
				names:['Dial_Left_0', 'Dial_Left_1', 'Dial_Left_2', 'Dial_Left_3', 'Dial_Right_0', 'Dial_Right_1', 'Dial_Right_2', 'Dial_Right_3',
						'Dial_Left_4', 'Dial_Left_5', 'Dial_Left_6', 'Dial_Left_7', 'Dial_Right_4', 'Dial_Right_5', 'Dial_Right_6', 'Dial_Right_7', 
						'None', 'None', 'Encoder_0', 'Encoder_1', 'Encoder_2', 'Encoder_3', 'None', 'None',
						'Encoder_4', 'Encoder_5', 'Encoder_6', 'Encoder_7', 'Encoder_8', 'Encoder_9', 'Encoder_10', 'Encoder_11']};

var Supported_Surfaces = [MONOHM, CODEC, BLOCKMOD, CNTRLR, AUMTROLL, AUMPC20, AUMPC40, OHMMODES, BASE, CODEX];

////Setup////

function init()
{
	lcdui = this.patcher.getnamed('gui');
	autohideui = this.patcher.getnamed('autohide');
	sender = this.patcher.getnamed('sender');
	sender.message('port', 8000);
	tasks=[];
	var i = this.patcher.getnamed('lcd');
	lcd_screen = i.subpatcher();
	for(var i=0;i<32;i++)
	{
		pn[i] = lcd_screen.getnamed('pn'+(i+1));
		mp[i] = lcd_screen.getnamed('mp'+(i+1));
	}
	post(this_name, " script initiated3\n");
	finder = new LiveAPI(callback, 'control_surfaces');
	/*post('finder properties:\n');
	for(i in finder)
	{
		post(i);
	}
	post('\n');*/
	connect_to_monomod();
	refresh();
	if(surfaces[0])
	{
		make_active(0);
	}
	init_display();
	lcd_screen.wclose();
	this.patcher.getnamed('jsclock').message('interval', time);
	this.patcher.getnamed('jsclock').message('active', 1);
	add_task('initial_close');
}

function initial_close()
{
	front = 1;
	hide_lcd();
	remove_task('initial_close');
}


function callback(){}
	
function connect_to_monomod()
{
	for(var i= 0;i<6;i++)
	{
		finder.goto('control_surfaces', i);
		for(var j=0;j<Supported_Surfaces.length;j++)
		{
			if(Supported_Surfaces[j].regexp.test(finder.type)==1)
			{
				cs = i;
				post('...connected to', Supported_Surfaces[j].n, '@ cs slot', i, '\n');
				var cont_count=finder.getcount('controls');
				for(var k=0;k<cont_count;k++)
				{
					finder.goto('control_surfaces', cs, 'controls', k);
					if(finder.get('name')=='MonoBridge')
					{	 
						surfaces.push(make_surface(cs, j, parseInt(finder.id)));
						post('...connected to MonoBridge!\n');
						break;
					}
				}
				break;
			}
		}
	}
	if(surfaces.length>0)
	{
		alive=1;
	}
}

////Protos////

function make_cell(parent, num, surface_type)
{
	var new_cell = [];
	new_cell.surface = parent;
	new_cell.num = num;
	new_cell.surface_type = surface_type;
	new_cell.n = Supported_Surfaces[new_cell.surface_type].names[new_cell.n];
	new_cell.pn = pn[new_cell.num];
	new_cell.oscpn = 'pn'+new_cell.num;
	new_cell.mp = mp[new_cell.num];
	new_cell.oscmp = 'pv'+new_cell.num;
	new_cell.pn_val = [''];
	new_cell.mp_val = [''];
	new_cell.lcd_name =	function(val, force)
	{
		if((new_cell.surface.active==true)&&((val!=new_cell.pn_val)||(force == true)))
		{
			new_cell.pn.message('text', val.join(' ').replace(/_/g, ' '));
			if(remote){
				sender.message('/LCD/set', new_cell.oscpn, val.join(' ').replace(/_/g, ' '));
			}
			last=timer;
		}
		new_cell.pn_val = val;
	}
	new_cell.lcd_value = function(val, force)
	{
		if((new_cell.surface.active==true)&&((val!=new_cell.mp_val)||(force = true)))
		{
			for(var index in val)
			{
				if(typeof(val[index]) == typeof(1.1))
				{
					val[index]=val[index].toFixed(2);
				}
			}
			new_cell.mp.message('text', val.join(' ').replace(/_/g, ' '));
			if(remote){
				sender.message('/LCD/set', new_cell.oscmp, val.join(' ').replace(/_/g, ' '));
			}
			last=timer;
		}
		new_cell.mp_val = val;
	}
	new_cell.update = function()
	{
		if(new_cell.surface.active==true)
		{
			new_cell.lcd_name(new_cell.pn_val, true)
			new_cell.lcd_value(new_cell.mp_val, true)
			last=timer;
		}
	}
	return new_cell;
}

function make_surface(num, surface_type, bridge_id)
{
	if(DEBUG){post('Make surface', num, surface_type, bridge_id, '\n');}
	var new_surface = [];
	new_surface.active = false;
	new_surface.touched = false;
	new_surface.order = 0;
	new_surface.num = num;
	new_surface.colors = Supported_Surfaces[surface_type].colors;
	new_surface.n = Supported_Surfaces[surface_type].n;
	new_surface.all_cells = [];
	for(var i=0;i<32;i++)
	{
		if(new_surface[Supported_Surfaces[surface_type].names[i]]!='None')
		{
			new_surface[Supported_Surfaces[surface_type].names[i]] = make_cell(new_surface, i, surface_type);
			new_surface.all_cells.push(new_surface[Supported_Surfaces[surface_type].names[i]]);
		}
	}
	new_surface.touch = [];
	new_surface.touch.on = function(args)
	{
		new_surface.touched = true;
		//if(new_surface.active==false)
		//{
			select_surface();
		//}
	}
	new_surface.touch.off = function(args)
	{
		new_surface.touched = false;
		select_surface();
	}
	new_surface.pipe = function(args)
	{
		//args = arrayfromargs(messagename, arguments);
		if(DEBUG){post(new_surface.n, ':', args, '\n');}
		if((args[0]=='value')&&(new_surface[args[1]]))
		{
			new_surface[args[1]][args[2]](args.slice(3,4));
		}
	}
	new_surface.change_color = function()
	{
		if(remote){
			sender.message('/LCD/change_colors', new_surface.colors[0], new_surface.colors[1], new_surface.colors[2]);
		}
		for(var n in new_surface.all_cells)
		{
			new_surface.all_cells[n].mp.message('activetextcolor', new_surface.colors);
			new_surface.all_cells[n].pn.message('activetextcolor', new_surface.colors);
		}
	}
	new_surface.update = function()
	{
		new_surface.change_color();
		for(var i in new_surface.all_cells)
		{
			new_surface.all_cells[i].update();
		}
	}
	new_surface.bridge = new LiveAPI(new_surface.pipe, 'control_surfaces');
	new_surface.bridge.id = bridge_id;
	new_surface.bridge.property = 'value';
	new_surface.refresh = function()
	{
		new_surface.bridge.call('refresh_state');
	}
	return(new_surface);
}

////Selection////

function select_surface()
{
	//post('select_surface');
	var bring_to_front = false;
	for(var i in surfaces)
	{
		if(surfaces[i].touched == true)
		{
			make_active(i);
			bring_to_front = true;
			break;
		}
	}
	touched(bring_to_front);
}

function make_active(num, force)
{
	if((surfaces[num].active == true)&&(force!=true))
	{
		//post(surfaces[num].n, 'already active\n');
		return;
	}
	else
	{
		for(var i in surfaces)
		{
			if(i!=num)
			{
				surfaces[i].active = false;
			}
		}
		//post(surfaces[num].n, 'active\n');
		surfaces[num].active = true;
		surfaces[num].update()
	}
}

function refresh()
{
	for(var i in surfaces)
	{
		surfaces[i].refresh();
	}
}

function dissolve()
{
	if(alive > 0)
	{
		//finder.property = 0;
		//finder.id = 0;
		//for(var i in surfaces)
		//{
		//	surfaces[i].bridge.property = 0;
		//	surfaces[i].bridge.id = 0;
		//}
		surfaces = [];
		post(this_name, 'dissolved!\n');
	}
}

////Messages////

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
			break;
		case 1:
			if(args[0] == 'bang')
			{
				dissolve();
				break;	  
			}
			break;
		case 2:
			lcd(args[0]);
			break;
		case 3:
			autohide(args[0]);
			break;
		case 4:
			clock_lcd();
			break;
		case 5:
			if(args[0]=='set_remote'){
				set_remote(args[1]);
			}
			else{
				currentstate(args[0], args[1], args[2], args[3], args[4]);
			}
			break;
	}
}

function init_colors()
{
	for(i=0;i<8;i++)
	{
		lcd_screen.getnamed('mp'+(i+1)).message('activetextcolor', colors);
		lcd_screen.getnamed('pn'+(i+1)).message('activetextcolor', colors);
	}
}

///Patcher LCD////

function init_display()
{
	this.patcher.getnamed('displays').message('currentstate', 0);
}

function lcd(args)
{
	if(alive > 0)
	{
		lcd_view=args;
		switch(args)
		{
			case 0:
				hide_lcd();
				break;
			case 1:
				//init_display();
				show_lcd();
				break;
		}
	}
}

function autohide(args)
{
	auto=args;
	switch(args)
	{
		case 1:
			if((alive > 0)&&(front==0))
			{
				lcdui.message('int', 1);
				//front=1;
				//lcd_screen.front();
				break;
			}
	}
}

function show_lcd()
{
	last = timer;
	if((alive > 0)&&(lcd_view>0)&&(front==0))
	{
		front=1;
		lcd_screen.front();
		lcd_screen.wind.scrollto(0, 0);
	}
}

function hide_lcd()
{
	if(DEBUG){post('hide_lcd, front==', front, '\n');}
	if(front==1)
	{
		front=0;
		lcd_screen.wclose();
	}
}

function unlock()
{
	lcd_screen.window('size', 0, 400, 1190, 800);
	lcd_screen.window('flags', 'minimize');
	lcd_screen.window('flags', 'zoom');
	lcd_screen.window('flags', 'close');
	lcd_screen.window('flags', 'grow');
	lcd_screen.window('flags', 'title');
	lcd_screen.window('flags', 'nofloat');
	lcd_screen.window('exec');
}

function lock()
{
	//lcd_screen.window('size', 0, y_start, x_end, y_end);
	lcd_screen.window('flags', 'nominimize');
	lcd_screen.window('flags', 'nozoom');
	lcd_screen.window('flags', 'noclose');
	lcd_screen.window('flags', 'nogrow');
	lcd_screen.window('flags', 'notitle');
	lcd_screen.window('flags', 'float');
	lcd_screen.window('exec');
}

function currentstate(a, b, c, d, e)
{
	screen_width = b;
	screen_heigth = c;
	lock();
	position(x_val, y_val, zoomfactor);
	//lcd_screen.zoomfactor(b/1280);  //I think this is a problem :|
}

function position(x, y, z)
{
	//post('position', x, y, z, '\n');
	zoomfactor = z;
	x_val = x;
	y_val = y;
	x_start = parseInt(x*screen_width);
	y_start = parseInt(y*screen_heigth);
	x_end = Math.max(parseInt(x_start + (850*zoomfactor)), screen_width-1);
	y_end = Math.min(parseInt(y_start + (220*zoomfactor)), screen_heigth-1);
	if(alive>0)
	{
		show_lcd();
		lcd_screen.window('size', x_start, y_start, x_end, y_end);
		lcd_screen.window('exec');
		lcd_screen.zoomfactor(zoomfactor);
		lcd_screen.wind.scrollto(0, 0);
		if(auto>0)
		{
			add_task('hide_lcd');	
		}
	}
}

function set_screen_position(flo)
{
	screen_position = flo;
	init_display();	   
}

function clear_lcds()
{
	for(var i=0;i<32;i++)
	{
		pn[names[i]].message('text', ' ');
		mp[names[i]].message('text', ' ');
	}
}

function touched(val)
{
	if(auto>0)
	{
		switch(val)
		{
			case true:
				if(front==0)
				{
					show_lcd();
				}
				break;
			case false:
				last = timer;
				//if(front>0)
				//{
				//	hide_lcd();
				//}
		}
	}
}

////Patcher Timing////

function increment_timer()
{
	timer++;
}

function clock_lcd()
{
	increment_timer();
	if((front>0)&&(auto>0)&&(timer>(last+auto_del)))
	{
		hide_lcd();
	}
	for(var a in tasks)
	{
		if (script[tasks[a]] instanceof Function)
		{
			script[tasks[a]].apply(tasks[a],[]);
		}
		tasks.shift();
	}
}

function remove_task(task)
{
	for(var a in tasks)
	{
		if(tasks[a]==task)
		{
			tasks.splice(a,1);
		}
	}
}

function add_task(task)
{
	tasks.push(task);
}

function wiki()
{
	this.max.launchbrowser(wiki_addy);
}

function set_remote(val)
{
	remote = val;
}


