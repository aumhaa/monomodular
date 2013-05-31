autowatch = 1;

var finder;

var DEBUG = 1;
var MONOMODULAR=new RegExp(/(monomodular)/);
var FUNCTION = new RegExp(/(function)/);
var PROPERTY = new RegExp(/(property)/);
var WS = new RegExp('');

var this_device_id = 0;

function init()
{
	if(DEBUG){post('init_b996\n');}
	if(!finder)
	{
		finder = new LiveAPI(callback, 'this_device');
	}
	finder.goto('this_device');
	this_device_id = parseInt(finder.id);
	if(DEBUG){post('this device id:', this_device_id);}
	finder.goto('control_surfaces');
	var children = parseInt(finder.children[0]);
	if(DEBUG){post('control_surfaces length:', children , '\n');}
	for(var i= 0;i<children;i++)
	{
	   	finder.goto('control_surfaces', i);
		var children = finder.info.toString().split(new RegExp("\n"));
		var functions = [];
		var properties = [];
		for(var item in children)
		{
			if(FUNCTION.test(children[item]))
			{
				//post('adding function:', children[item].replace('function ', ''), '\n');
				functions.push(children[item].replace('function ', ''));
			}
			if(PROPERTY.test(children[item]))
			{
				//post('adding property:', children[item].replace('property ', ''), '\n');
				properties.push(children[item].replace('property ', ''));
			}	
		}
		for(var item in properties)
		{
			if(DEBUG){post(item, '\n', properties[item]);}
			if(MONOMODULAR.test(properties[item])>0)
			{
				
				var new_id = finder.get('monomodular');
				if(DEBUG){post('found, focusing on', new_id, '\n');}
				finder.id = parseInt(new_id[1]);
				finder.id = parseInt(finder.call('add_mod', 'id', this_device_id)[1]);
				if(DEBUG){post('client id returned is: ', finder.id, '\n');}
				finder.property = 'value';
			}
		}
	}
}

function callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		outlet(0, args.slice(1));
	}
}

function send_msg()
{
	var args = arrayfromargs(arguments).toString();
	finder.call('receive', 'base_grid', 'value', '0^0^1');
}

function base_grid()
{
	var args = arrayfromargs(arguments);
	finder.call('receive', 'base_grid', 'value', args.join('^'));
}