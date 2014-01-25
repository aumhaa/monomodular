autowatch=1;

outlets=2;

var DEBUG = false;
var FORCELOAD = true;

var unique = jsarguments[1];
var protocol = 1;
var prefix="256";
var in_port = 8000;
var out_port = 8080;
var slash=new RegExp(/^\//);
var space=new RegExp(/^\S/);

var xquads = [{'X':0, 'Y':0}, {'X':8, 'Y':0}, {'X':0, 'Y':8}, {'X':8, 'Y':8}];
var yquads = [{'X':0, 'Y':0}, {'X':0, 'Y':8}, {'X':8, 'Y':0}, {'X':8, 'Y':8}];

debug('newmodjs');

function debug()
{
	if(DEBUG)
	{
		var args = arrayfromargs(arguments);
		for(var i in args)
		{
			if(args[i] instanceof Array)
			{
				args[i] = args[i].join(' ');
			}
		}
		post('debug->', args, '\n');
	}
}

function init(val)
{
	if(val)
	{
		loadbang();
		set_prefix(this.patcher.getnamed('prefix').getvalueof().toString());
		set_inport(this.patcher.getnamed('inport').getvalueof());
		set_outport(this.patcher.getnamed('outport').getvalueof());
		debug('inits:', prefix, in_port, out_port);
	}
}

function loadbang()
{
	this.patcher.getnamed('service').message('name', 'modlink_'+unique);
	this.patcher.getnamed('service').message('bang');
}

function set_prefix(str)
{
	prefix=str.replace(slash, "");
	debug("prefix:", prefix);
	change_protocol(protocol);
}

function set_inport(val)
{
	if(val == 'init')
	{
		val = 10000 + parseInt(unique);
		this.patcher.getnamed('inportbox').message('set', val);
	}
	in_port = val;
	this.patcher.getnamed('udpin').message('port', in_port);
	this.patcher.getnamed('service').message('port', in_port);
	this.patcher.getnamed('service').message('bang');
}

function set_outport(val)
{
	out_port = val;
	this.patcher.getnamed('udpout').message('port', out_port);
}

function change_protocol(val)
{
	debug('change_protocol', val);
	protocol = Math.floor(val>0);
	switch(protocol)
	{
		case 0:
			this.patcher.getnamed('prependout').message('set', '/'+prefix+'/press');
			break;
		case 1:
			this.patcher.getnamed('prependout').message('set', '/'+prefix+'/grid/key');
			break;
	}
}

function anything()
{
	var args=arrayfromargs(arguments);
	var str=messagename.split("/");
	debug('str:', str);
	for (i in str)
	{
		str[i].replace(space, "");
	}
	debug('de-spaced:', str);
	if(protocol==0)
	{
		switch (str[2])
		{
			case "led":	   
				outlet(0, args[0], args[1], args[2]);
				break;
			case "clear":
				for(var x=0;x<15;x++)
				{
					for(var y=0;y<15;y++)
					{
						outlet(0, x, y, 0);
					}
				}
			case "led_col":
				var dec1=dectobin(args[1]);
				for(var i=0;i<dec1.length;i++)
				{
					outlet(0, parseInt(args[0]), i, dec1[i]);
				}
				break;
			case "led_row":
				var dec1=dectobin(args[1]);
				for(var i=0;i<dec1.length;i++)
				{
					outlet(0,  i, parseInt(args[0]), dec1[i]);
				}
				break;
			case "prefix":
				this.patcher.getnamed('prefixbox').message('set', args[0]);
				this.patcher.getnamed('prefixbox').message('bang');
				//outlet(0, "/sys/"+prefix);  //causes feedback loop
				break;
			case "cable":
				debug('cable', args);
				break;
		}
	}
	else
	{
		switch(str[1])
		{
			case prefix:
				debug('match prefix');
				switch(str[2])
				{
					case 'grid':
						debug('grid');
						if(str[3]=='led')
						{
							switch(str[4])
							{
								case 'set':
									outlet(0, args[0], args[1], args[2]);
									break;
								case 'all':
									for(var x=0;x<15;x++)
									{
										for(var y=0;y<15;y++)
										{
											outlet(0, x, y, args[0]);
										}
									}
									break;
								case 'map':
									if(args.length == 10)
									{
										var xOff = args.shift();
										var yOff = args.shift();
										for(var index=0;index<8;index++)
										{
											var dec1=dectobin(args.shift());
											for(var i=0;i<dec1.length;i++)
											{
												X = xOff+index;
												Y = yOff+i;
												outlet(0, X%16, Y%16, dec1[i]);
											}
										}
									}
									break;
								case 'row':
									if((args.length > 2)&&(args[0]%8==0))
									{
										var xOff = args.shift();
										var yOff = args.shift();
										for(var index=0;index<args.length;index++)
										{
											var dec1=dectobin(args[index]);
											for(var i=0;i<dec1.length;i++)
											{
												X = xOff+i+xquads[index].X;
												Y = yOff+xquads[index].Y;
												outlet(0, X%16, Y%16, dec1[i]);
											}
										}
									}
									break;
								case 'col':
									debug('col---------------', args);
									if((args.length > 2)&&(args[1]%8==0))
									{
										var xOff = args.shift();
										var yOff = args.shift();
										for(var index=0;index<args.length;index++)
										{
											var dec1=dectobin(args[index]);
											for(var i=0;i<dec1.length;i++)
											{
												X = xOff+yquads[index].X;
												Y = yOff+i+yquads[index].Y;
												outlet(0, X%16, Y%16, dec1[i]);
											}
										}
									}
									break;
							}
						}
						break;	  
				}
				break;
			case 'sys':
				debug('sys');
				switch(str[2])
				{
					case 'port':
						debug('setting new output port', args[0]);
						this.patcher.getnamed('outportbox').message('set', args[0]);
						this.patcher.getnamed('outportbox').message('bang');
						break;
					case 'host':
						this.patcher.getnamed('udpout').message('host', args[0]);
						break;
					case 'prefix':
						this.patcher.getnamed('prefixbox').message('set', args[0]);
						this.patcher.getnamed('prefixbox').message('bang');
						break;
					case 'info':
						debug('info', args);
						switch(args.length)
						{
							case 1:
								this.patcher.getnamed('outportbox').message('set', args[0]);
								this.patcher.getnamed('outportbox').message('bang');
								break;
							case 2:
								this.patcher.getnamed('udpout').message('host', args[0]);
								this.patcher.getnamed('outportbox').message('set', args[1]);
								this.patcher.getnamed('outportbox').message('bang');
								break;
						}
						this.patcher.getnamed('udpout').message('/sys/port', out_port);
						this.patcher.getnamed('udpout').message('/sys/prefix', '/'+prefix);
						this.patcher.getnamed('udpout').message('/sys/id', unique);
						break;
				}
				break;
		}
	}
}

function dectobin(arg)
{
	var dec = [];
	for(var i=0;i<8;i++)
	{
		dec.unshift(arg&1);
		arg = arg>>>1;
	}
	return dec;
}


//used to reinitialize the script immediately on saving; 
//can be turned on by changing FORCELOAD to 1;
//should only be turned on while editing
function forceload()
{
	if(FORCELOAD){init(1);}
}

forceload();


