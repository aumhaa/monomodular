autowatch = 1;

var DEBUG = true;

var alive = false;
var finder;
var rec_level = 0;
var parameters = {};
var param_names = ['Softknob 1', 'Softknob 2', 'Softknob 3', 'Filter1 Cutoff', 'Filter1 Reso'];
var parameter_array = [];

function init(num)
{
	
	setup_objects(num+1);
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
			var id = parseInt(finder.id);
			result = new examine(id).result;
			break;
		}
		finder.goto('live_set');
	}
	post('Finished, result is:', result, '\n');
	link_ids(result);
	alive = true;
}

function examine(id)
{
	this.orig_path = finder.unquotedpath;
	this.result = 0;
	rec_level += 1;
	finder.id = id;
	var num_devices = finder.getcount('devices');
	var name = finder.get('name');
	if(DEBUG){post(rec_prefix(), 'EXAMINE RECURSION:', name, 'has', num_devices, 'devices.\n');}
	for(var j=0;j<num_devices;j++)
	{
		finder.goto('devices', parseInt(j));
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
				finder.goto('chains', parseInt(k));
				if(DEBUG){post('-recursing:', device_name, 'chain', k, ':', finder.get('name'), '\n');}
				var id_check = parseInt(finder.id);
				this.result = parseInt(new examine(id_check).result);
			}
			finder.goto('canonical_parent');	
		}
		finder.goto('canonical_parent');
	}
	finder.goto('canonical_parent');
	rec_level -= 1;
	return this;
}

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
	post('callback:', args, finder.id, finder.path, '\n');
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
		post('building', pref+param_names[i], '\n');
		parameters[pref+param_names[i]] = {'obj':dummy, 'callback':val_cb(param_names[i])};
		parameter_array[i] = parameters[pref+param_names[i]];
	}
}

function val_cb(name)
{
	if(alive)
	{
		var cb = function(args)
		{
			if(args[0]=='value')
			{
				//this.patcher.getnamed(name).message('set', args[1]*127);
			}
			post('cb:', name, args[1], '\n');
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
		post('parameter count:', p_count, '\n');
		for(var i=0;i<p_count;i++)
		{
			finder.goto('parameters', i);
			var name = finder.get('name');
			post('name is:', name, '\n');
			if(name in parameters)
			{
				post('found', name, 'linking...\n');
				parameters[name].obj = new LiveAPI(parameters[name].callback, 'id', finder.id);
				parameters[name].obj.property = 'value';
			}
			finder.goto('canonical_parent');
		}
	}
}

function knob(num, val)
{
	if(alive)
	{
		parameter_array[num].obj.set('value', val);
	}
}

