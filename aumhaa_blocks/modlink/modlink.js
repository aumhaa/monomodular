autowatch=1;

outlets=2;

var DEBUG = true;

var unique = jsarguments[1];
var protocol = 1;
var prefix="256";
var in_port = 8000;
var out_port = 8080;
var slash=new RegExp(/^\//);
var space=new RegExp(/^\S/);

var quads = [{'X':0, 'Y':0}, {'X':8, 'Y':0}, {'X':0, 'Y':8}, {'X':8, 'Y':8}];

post('newmodjs');

function loadbang()
{
	this.patcher.getnamed('service').message('name', 'modlink_'+unique);
	this.patcher.getnamed('service').message('bang');
}

function set_prefix(str)
{
    prefix=str.replace(slash, "");
    if(DEBUG){post("prefix:", prefix, "\n");}
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
    if(DEBUG){post('change_protocol', val, '\n');}
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
	post('str:', str);
    for (i in str)
    {
        str[i].replace(space, "");
    }
	if(DEBUG)
	{
	    for(i in str)
	    {
	        post(i, str[i]);
	    }
	    post("\n");
	    post('args', args, '\n');
	}
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
                if(DEBUG){post('cable', args, "\n");}
                break;
        }
    }
    else
    {
        switch(str[1])
        {
            case prefix:
                if(DEBUG){post('match prefix\n');}
                switch(str[2])
                {
                    case 'grid':
                        if(DEBUG){post('grid\n');}
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
                                                X = xOff+i+quads[index].X;
                                                Y = yOff+quads[index].Y;
                                                outlet(0, X%16, Y%16, dec1[i]);
                                            }
                                        }
                                    }
                                    break;
                                case 'col':
                                    if((args.length > 2)&&(args[1]%8==0))
                                    {
                                        var xOff = args.shift();
                                        var yOff = args.shift();
                                        for(var index=0;index<args.length;index++)
                                        {
                                            var dec1=dectobin(args[index]);
                                            for(var i=0;i<dec1.length;i++)
                                            {
                                                X = xOff+quads[index].X;
                                                Y = yOff+i+quads[index].Y;
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
                if(DEBUG){post('sys\n');}
                switch(str[2])
                {
                    case 'port':
                        if(DEBUG){post('setting new output port', args[0], '\n');}
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
                        if(DEBUG){post('info', args, '\n');}
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





