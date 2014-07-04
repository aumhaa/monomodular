autowatch = 1;

var script = this;
var finder;
var mod;
var this_device;
var restart = new Task(init, this);

var DEBUG = true;
var FORCELOAD = true;
var debug = (DEBUG&&Debug) ? Debug : function(){};
var forceload = (FORCELOAD&&Forceload) ? Forceload : function(){};

function init()
{
	post('init\n');
	post(LiveAPI, '\n');
	var prot = Object.getPrototypeOf(LiveAPI);
	post(prot, prot.length, '\n');
	if(!this_device)
	{
		this.patcher.newdefault(50, 50, 'live.thisdevice');
	}
	for(var i in this_device)
	{
		post('this_device:', i, this_device[i], '\n');
	}
	for(var i in LiveAPI)
	{
		post('prop:', i, ':', LiveAPI[i]);
	}
	try
	{
		finder = new LiveAPI(callback, 'control_surfaces');
	}
	catch(err)
	{
		post('catch...\n');
	}
		
	/*finder = new LiveAPI(callback, 'control_surfaces');
	post('info:', finder.info, '\n');
	finder.property = 'children';
	for(var i in finder)
	{
		post('prop:', i, ':', finder[i], '\n');
	}*/
	restart.schedule(1000);
}

function init()
{
	for(var i in this)
	{
		post('--', i, this[i], '\n');
	}
	if(!mod)
	{
		mod = new ModComponent(script, 'test', '000', false, []);
		mod.debug = debug;
		mod.assign_api(new LiveAPI(mod.callback, 'this_device'));
	}
	mod.set_legacy(0);
	mod.Send('cntrlr_grid', 'value', 0, 0, 15);
}

function anything()
{
	var args = arrayfromargs(arguments);
	debug('anything', args);
}

function callback(args)
{
	//var args = arrayfromargs(arguments)
	post('callback:', args, '\n');
}

post('opening...\n');

forceload(script);
