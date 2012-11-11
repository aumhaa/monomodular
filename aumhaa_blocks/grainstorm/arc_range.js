autowatch = 1;

var arc = [];
for(var i = 0;i<4;i++)
{
	arc[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
}

function all(number, val)
{
	arc[number] = [val, val, val, val, val, val, val, val, val, val, val, val, val];
	outlet(0, 'wheel', 0, number, 'custom', arc[number]);
}

function set(number, pos, val)
{
	arc[number][pos] = Math.floor(val>0);
	outlet(0, 'wheel', 0, number, 'custom', arc[number]);
}

function map()
{
	var args = arrayfromargs(arguments)
	var array = args.slice(1, 14);
	for(var i = 0;i<13;i++)
	{
		arc[args[0]][i] = Math.floor(array[i]>0);
	}
	arc[args[0]] = args.slice(1, 14);
}

function range(number, start, end, val)
{
	start = start%14;
	end = end%14;
	if(start<end)
	{
		for(var i = start;i <= end;i++)
		{
			arc[number][i] = Math.floor(val>0);
		}
	}
	else
	{
		for(var i = 0; i<= end; i++)
		{
			arc[number][i] = Math.floor(val>0);
		}
		for(var i = start; i< 13; i++)
		{
			arc[number][i] = Math.floor(val>0);
		}
	}
	outlet(0, 'wheel', 0, number, 'custom', arc[number]);	  
}
