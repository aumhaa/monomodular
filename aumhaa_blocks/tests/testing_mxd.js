autowatch = 1;

var script = this;
var finder;

function init()
{
	finder = new LiveAPI(callback, 'control_surfaces');
	post('info:', finder.info, '\n');
	finder.property = 'children';
	for(var i in finder)
	{
		post('prop:', i, ':', finder[i], '\n');
	}
}

function callback(args)
{
	//var args = arrayfromargs(arguments)
	post('callback:', args, '\n');
}

init();