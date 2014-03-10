autowatch = 1;

outlets = 2;

var finder;
var this_device;
var patch_type = jsarguments[1];
var unique = jsarguments[2];
var wiki_addy = 'http://www.aumhaa.com/wiki/index.php?title='+patch_type;
var script = this;
var DEBUG = false;
var DEBUG_CB = false;
var MONOMODULAR=new RegExp(/(monomodular)/);
var FUNCTION = new RegExp(/(function)/);
var PROPERTY = new RegExp(/(property)/);
var WS = new RegExp('');
var modFunctions = [];
var modAddresses = [];
var this_device_id = 0;
var stored_messages = [];
var legacy = false;
var alive = false;


function init()
{

	if(DEBUG){post('patch:', patch_type, 'init');}
	var found = false;
	if(DEBUG){post('init_b996\n');}
	assign_attributes();
	if(!(finder instanceof LiveAPI))
	{
		finder = new LiveAPI(callback, 'control_surfaces');
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
				if(DEBUG){post('new object name is', finder.get('name'), '\n');}
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
				for(var address in modAddresses)
				{
					if(DEBUG){post('address length', modAddresses[address].length);}
					if(DEBUG){post('making func:', modAddresses[address], '\n');}
					script[modAddresses[address]] = make_receive_func(modAddresses[address]);
				}
				for(var func in modFunctions)
				{
					script[modFunctions[func]] = make_func(modFunctions[func]);
				}
				if(legacy)
				{
					finder.call('set_legacy', 1);
				}
				outlet(1, 'init');
				send_stored_messages();
				//return;
			}
		}
		if(found)
		{
			break;
		}
	}
}

function assign_attributes()
{
	for(var i=0;i<jsarguments.length;i++)
	{
		if(jsarguments[i].toString().charAt(0) == '@')
		{
			var new_att = jsarguments[i].slice(1).toString();
			script[new_att] = jsarguments[i+1];
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

function make_func(address)
{
	var func = function()
	{
		var args = arrayfromargs(arguments);
		if(DEBUG){post('accessing func', address, args.join('^'), '\n');}
		//finder.apply(address, args);
		finder.call('distribute', address, args.join('^'))
	}
	return func;
}

function anything()
{
	var args = arrayfromargs(arguments);
	if(DEBUG){post('anything', messagename, args, '\n');}
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
		if(DEBUG_CB){post('from client:', args, '\n');}
		outlet(0, args.slice(1));
	}
}

function dummy_callback(){}

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
	stored_messages = [];
}

function send_explicit()
{
	var args = arrayfromargs(arguments);
	//post('finder.call('+args[0], args[1], args[2], args[3], args[4], args[5]+');');
	finder.call(args[0], args[1], args[2], args[3], args[4], args[5]);
}

function disconnect()
{
	post('received disconnect!');
}

//function send_explicit(){}

//function init(){}

//function send_stored_messages(){}

//function anything(){}

//function callback(){}