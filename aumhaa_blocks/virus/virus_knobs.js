autowatch = 1;

var DEBUG = false;
var FORCELOAD = false;

var alive = false;
var finder;
var rec_level = 0;
var parameters = {};
var param_names = ['Softknob 1', 'Softknob 2', 'Softknob 3', 'Filter1 Cutoff', 'Filter1 Reso'];
var parameter_array = [];
var part_num = 0;

function instance(num)
{
	part_num = num;
	if(alive==true)
	{
		init();
	}
}
/*function init()
{
	if(DEBUG){post('virus_knobs_init\n');}
	setup_objects(part_num+1);
	var result = 0;
	finder = new LiveAPI('live_set');
	var num_tracks = finder.getcount('tracks');
	for(var i =0; i<num_tracks;i++)
	{
		finder.goto('tracks', i);
		var track_name = finder.get('name');
		if(track_name == 'Virus')
		{
			if(DEBUG){post('Checking items in track', finder.id, '\n');}
			var id = finder.id;
			result = new examine(id).result;
			//finder.id = id;
			break;
		}
		finder.goto('live_set');
	}
	if(DEBUG){post('Finished, result is:', result, '\n');}
	if(result)
	{
		link_ids(result);
		alive = true;
	}
}

function examine(id)
{
	this.orig_path = finder.unquotedpath;
	this.result = 0;
	this.orig_id = parseInt(id);
	rec_level += 1;
	finder.id = id;
	var num_devices = finder.getcount('devices');
	var name = finder.get('name');
	if(DEBUG){post(rec_prefix(), 'EXAMINE RECURSION:', this.orig_id, name, 'has', num_devices, 'devices.\n');}
	for(var j=0;j<num_devices;j++)
	{
		finder.goto('devices', j);
		var device_name = finder.get('name');
		var can_have_chains = finder.get('can_have_chains');
		if(DEBUG){post('Checking device:', device_name, '\n');}
		if((finder.get('class_name')=='AuPluginDevice')&&(finder.get('name')=='Virus TI Snow'))
		{
			this.result = parseInt(finder.id);
		}
		else if(can_have_chains>0)
		{
			var num_chains = finder.getcount('chains');
			for(var k=0;k<num_chains;k++)
			{
				if(DEBUG){post('-before recursing:', device_name, 'chain', k, ':', finder.get('name'), finder.path, '\n');}
				finder.goto('chains', k);
				if(DEBUG){post('-recursing:', device_name, 'chain', k, ':', finder.get('name'), finder.path, '\n');}
				var id_check = parseInt(finder.id);
				this.result = parseInt(new examine(id_check).result);
			}
			if(DEBUG){post('___INNER\n');}
			finder.goto('canonical_parent');	
		}
		if(DEBUG){post('___MIDDLE\n');}
		finder.goto('canonical_parent');
	}
	if(DEBUG){post('___OUTER\n');}
	if(DEBUG){post('-----', this.orig_id, id, finder.path, '\n');}
	finder.goto('canonical_parent');		///this causes jsliveapi:syntax error, but works
	//finder.id = this.orig_id;		///this seems to work, watch out for closures though!
	if(DEBUG){post('-----', this.orig_id, id, finder.path, '\n');}
	rec_level -= 1;
	return this;
}*/

function rec_prefix()
{
	var prefix = [];
	for(var i=0;i<rec_level;i++)
	{
		prefix.unshift('-->');
	}
	return prefix.join(' ');
}

function callback(args)
{
	if(DEBUG){post('callback:', args, finder.id, finder.path, '\n');}
}

function dummy()
{
	this.set = function(){};
	this.get = function(){};
	this.call = function(){};
}

function setup_objects(num)
{
	parameters = {};
	var pref = '['+num+'] ';
	for(var i=0;i<param_names.length;i++)
	{
		if(DEBUG){post('building', pref+param_names[i], '\n');}
		parameters[pref+param_names[i]] = {'obj':dummy, 'callback':val_cb(param_names[i]), val:0};
		parameter_array[i] = parameters[pref+param_names[i]];
	}
}

function val_cb(name)
{
	if(alive==true)
	{
		var cb = function(args)
		{
			if(args[0]=='value')
			{
				//this.patcher.getnamed(name).message('set', args[1]*127);
			}
			if(DEBUG){post('cb:', name, args[1], '\n');}
		}
		return cb;
	}
}

function link_ids(id)
{
	parameter_ids = [];
	if(id>0)
	{
		finder.id = id;
		var p_count = finder.getcount('parameters');
		if(DEBUG){post('parameter count:', p_count, '\n');}
		for(var i=0;i<p_count;i++)
		{
			finder.goto('parameters', i);
			var name = finder.get('name');
			if(DEBUG){post('name is:', name, '\n');}
			if(name in parameters)
			{
				if(DEBUG){post('found', name, 'linking...\n');}
				//parameters[name].obj = new LiveAPI(parameters[name].callback, 'id', parseInt(finder.id));
				parameters[name].obj = new LiveAPI(parameters[name].callback, 'live_set');
				parameters[name].obj.id = parseInt(finder.id);
				parameters[name].obj.property = 'value';
				if(DEBUG){post('linked object:', name, '\n');}
				if(DEBUG){post('new object is:', parameters[name].obj.get('name'), '\n');}
			}
			//finder.goto('canonical_parent');		///this causes jsliveapi:syntax error, but works
			finder.id = id;		///this seems to work, watch out for closures though!
		}
	}
}

function knob(num, val)
{
	if(alive==true)
	{
		//if(DEBUG){post('knobin', num, val, '\n');}
		parameter_array[num].obj.set('value', val);
	}
}

function init()
{
	if(DEBUG){post('virus_knobs_init\n');}
	setup_objects(part_num+1);
	var result = 0;
	finder = new LiveAPI('live_set');
	var num_tracks = finder.getcount('tracks');
	for(var i =0; i<num_tracks;i++)
	{
		finder.goto('tracks', i);
		var track_name = finder.get('name');
		if(track_name == 'Virus')
		{
			if(DEBUG){post('Checking items in track', finder.id, '\n');}
			var id = finder.id;
			result = new examine(id).result;
			break;
		}
		finder.goto('live_set');
	}
	if(DEBUG){post('Finished, result is:', result, '\n');}
	if(result)
	{
		link_ids(result);
		alive = true;
	}
}

function examine(id)
{
	this.result = 0;
	rec_level += 1;
	finder.id = id;
	var num_devices = finder.getcount('devices');
	var name = finder.get('name');
	if(DEBUG){post(rec_prefix(), 'EXAMINE RECURSION:', id, name, 'has', num_devices, 'devices.\n');}
	for(var j=0;j<num_devices;j++)
	{
		finder.id = parseInt(id);
		finder.goto('devices', j);
		var dev_id = finder.id;
		var device_name = finder.get('name');
		var can_have_chains = finder.get('can_have_chains');
		if(DEBUG){post('Checking device:', device_name, '\n');}
		if((finder.get('class_name')=='AuPluginDevice')&&(finder.get('name')=='Virus TI Snow'))
		{
			this.result = parseInt(finder.id);
		}
		else if(can_have_chains>0)
		{
			var num_chains = finder.getcount('chains');
			for(var k=0;k<num_chains;k++)
			{
				finder.id = parseInt(dev_id);
				if(DEBUG){post('-before recursing: dev_id', dev_id, 'finder_id', finder.id, device_name, 'chain', k, ':', finder.get('name'), finder.path, '\n');}
				finder.goto('chains', k);
				if(DEBUG){post('-recursing: dev_id', dev_id, 'finder_id', finder.id, device_name, 'chain', k, ':', finder.get('name'), finder.path, '\n');}
				var id_check = parseInt(finder.id);
				this.result = parseInt(new examine(id_check).result);
			}
		}
	}
	rec_level -= 1;
	finder.id = id;
	return this;
}

//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing
function forceload()
{
	if(FORCELOAD){post('FORCELOAD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n');init(1);}
}

forceload();
