autowatch = 1;

outlets = 2;

var finder;

var script = this;
var DEBUG = true;
var MONOMODULAR=new RegExp(/(monomodular)/);
var FUNCTION = new RegExp(/(function)/);
var PROPERTY = new RegExp(/(property)/);
var WS = new RegExp('');
var modFunctions = [];
var modAddresses = [];
var this_device_id = 0;
var stored_messages = [];

function init()
{
	var found = false;
	if(DEBUG){post('init_b996\n');}
	if(!finder)
	{
		finder = new LiveAPI(callback, 'this_device');
	}
	finder.goto('this_device');
	this_device_id = parseInt(finder.id);
	if(DEBUG){post('this device id:', this_device_id);}
	finder.goto('control_surfaces');
	var number_children = parseInt(finder.children[0]);
	if(DEBUG){post('control_surfaces length:', number_children , '\n');}
	for(var i=0;i<number_children;i++)
	{
		if(DEBUG){post('Checking control surface #:', i, '\n');}
	   	finder.goto('control_surfaces', i);
		var children = finder.info.toString().split(new RegExp("\n"));
		var functions = [];
		var properties = [];
		for(var item in children)
		{
			if(FUNCTION.test(children[item]))
			{
				//if(DEBUG){post('adding function:', children[item].replace('function ', ''), '\n');}
				functions.push(children[item].replace('function ', ''));
			}
			if(PROPERTY.test(children[item]))
			{
				//if(DEBUG){post('adding property:', children[item].replace('property ', ''), '\n');}
				properties.push(children[item].replace('property ', ''));
			}	
		}
		for(var item in properties)
		{
			//if(DEBUG){post('\nProperty #', item, ':', properties[item]);}
			if(MONOMODULAR.test(properties[item])>0)
			{
				if(DEBUG){post('in there\n');}
				found = true;
				var new_id = finder.get('monomodular');
				if(DEBUG){post('found, focusing on', new_id, '\n');}
				finder.id = parseInt(new_id[1]);
				finder.id = parseInt(finder.call('add_mod', 'id', this_device_id)[1]);
				if(DEBUG){post('client id returned is: ', finder.id, '\n');}
				finder.property = 'value';
				var children = finder.info.toString().split(new RegExp("\n"));	
				for(var item in children)
				{
					if(FUNCTION.test(children[item]))
					{
						if(DEBUG){post('adding function:', children[item].replace('function ', ''), '\n');}
						modFunctions.push(children[item].replace('function ', ''));
					}	
				}
				modAddresses = finder.call('addresses');
				if(DEBUG){post('addresses:', modAddresses, '\n');}
				for(address in modAddresses)
				{
					post('address length', modAddresses[address].length);
					post('making func:', modAddresses[address], '\n');
					script[modAddresses[address]] = make_receive_func(modAddresses[address]);
				}
				outlet(1, 'init');
				send_stored_messages();
				return;
			}
		}
	}
}

function make_receive_func(address)
{
	var func = function()
	{
		if(DEBUG){post('accessing func', address, '\n');}
		var args = arrayfromargs(arguments);
		finder.call('receive', address, args[0], args.slice(1).join('^'));
	}
	return func;
}

function anything()
{
	var args = arrayfromargs(arguments);
	post('anything', messagename, args, '\n');
	if(finder == null)
	{
		if(DEBUG){post('adding to stack:', messagename, args, '\n');}
		if(stored_messages.length>500)
		{
			stored_messages.shift();
		}
		stored_messages.push([messagename, args]);
		if(DEBUG){post('added:', stored_messages[0], '\n');}
	}
}

function list_functions()
{
	outlet(1, 'available_functions', modFunctions);
}

function list_addresses()
{
	outlet(1, 'available_addresses', modAddresses);
}

function callback(args)
{
	if((args[0]=='value')&&(args[1]!='bang'))
	{
		outlet(0, args.slice(1));
	}
}

function send_stored_messages()
{
	if(DEBUG){post('send_stored_messages()');}
	for(index in stored_messages)
	{
		if(DEBUG){post('sending stored message:', stored_messages[index], '\n');}
		if(stored_messages[index][0] in script)
		{
			if(DEBUG){post('found function in script.\n');}
			script[stored_messages[index][0]].apply(this, (stored_messages[index][1]));
		}
	}
}

