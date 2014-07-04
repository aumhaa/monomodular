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

function protoarrayfromargs1(args)
{
	var arr =  Array.prototype.slice.call(args, 0);
	debug('working on:', arr);
	for(var i=0;i<arr.length;i++)
	{
		if(arr[i] instanceof Array)
		{
			debug('splicing:', arr[i]);
			var a = [i, arr[i].length].concat(arr[i]);
			debug('a:', a);
			arr.splice.apply(arr, a);
		}
	}
	return arr;
}

/*function flatten(array)
{
	var result = [], self = arguments.callee;
	array.forEach(
		function(item) 
		{
			Array.prototype.push.apply(result,Array.isArray(item) ? self(item) : [item]
	);
  });
  return result;
};*/

function flatten()
{
	var a = protoarrayfromargs(arguments);
	debug('new:', a);
	
}

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
	post('arrayfromargs', arrayfromargs, typeof(arrayfromargs));
	if(!mod)
	{
		mod = new ModComponent(script, 'test', '000', false, []);
		mod.debug = debug;
		mod.assign_api(new LiveAPI(mod.callback, 'this_device'));
	}
	mod.set_legacy(0);
	mod.Send('cntrlr_grid', 'value', 0, 0, 15);
}

function init()
{
	debug('flatten', protoarrayfromargs1([0, 40, 'blah', [0, 11, 156, [80, 120]]]));
}

function test()
{
	return protoarrayfromargs(arguments);
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
