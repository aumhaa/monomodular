autowatch = 1;
outlets = 2;
divs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
function list_fractions()
{
	var bigarray = []
	for(var x in divs)
	{	
		for(var i=1;i<17;i++)
		{
			var new_array = [];
			new_array.div = divs[x];
			new_array.val = i/divs[x];
			new_array.beg = i;
			bigarray.push(new_array);
		}
	}
	bigarray.sort(sortfunction);
	var last = 0;
	var num = 0;
	var out_to_mess = [];
	for(var i in bigarray)
	{
		if(bigarray[i].val.toFixed(2) != last)
		{
			outlet(0, num, bigarray[i].beg, bigarray[i].div);
			out_to_mess.push('\"'+bigarray[i].beg+'/'+bigarray[i].div+'\",');
			//post(bigarray[i].beg, '/', bigarray[i].div, '=', bigarray[i].val.toFixed(2), '\n');
			last = bigarray[i].val.toFixed(2);
			num += 1;
			
		}
	}
	outlet(1, out_to_mess);
}
	
function sortfunction(a, b)
{
	return (a.val - b.val) //causes an array to be sorted numerically and ascending
}

function is_int(value)
{ 
   return !isNaN(parseInt(value * 1));
}

function make_list()
{
	var array = [];
	var i=64;do{
		array.push('1/'+i);
	}while(i--);
	for(var i=0;i<64;i++)
	{
		array.push(''+i);
	}
	outlet(1, array);
}
		