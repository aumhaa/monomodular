autowatch=1;

var slash=new RegExp(/^\//);
var space=new RegExp(/^\S/);


function list(col, a, b)
{
	var dec1=deciToBin(a);
	for(var i=0;i<dec1.length;i++)
	{
		outlet(0, parseInt(col), i, parseInt(dec1.charAt(dec1.length-i-1)));
	}
	var dec2=deciToBin(b);
	for(var i=0;i<dec2.length;i++)
	{
		outlet(0, parseInt(col), i+8, parseInt(dec2.charAt(dec2.length-i-1)));
	}
}

function deciToBin(arg)
{
	res1 = 999;
	args = arg;
	while(args>1)
	{
		arg1 = parseInt(args/2);
		arg2 = args%2;
		args = arg1;
		if(res1 == 999)
		{
			res1 = arg2.toString();
		}
		else
		{
			res1 = arg2.toString()+res1.toString();
		}
	}
	if(args == 1 && res1 != 999)
	{
		res1 = args.toString()+res1.toString();
	}
	else if(args == 0 && res1 == 999)
	{
		res1 = 0;
	}
	else if(res1 == 999)
	{
		res1 = 1;
	}
	var ll = res1.length;
	while(ll%8 != 0)
	{
		res1 = "0"+res1;
		ll = res1.length;
	}	
	return res1;
}