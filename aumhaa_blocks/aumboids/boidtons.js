autowatch = 1;

inlets = 2;
outlets = 2;
var alt_val = 0;
var ccmutes=[];
var leader;

function bang()
{
	for(var i=0;i<8;i++)
	{
		ccmutes[i]=this.patcher.getnamed('ccmute['+i+']');
		ccmutes[i].val = ccmutes[i].getvalueof();
	}
	leader = this.patcher.getnamed('leader');
	leader.val = leader.getvalueof();
}

function msg_int(v)
{
	alt_val = v;
	outlet(0, 'batch', 'row', 0, 0);
	outlet(0, 'batch', 'row', 15, 0);
	update_display(alt_val);
}

function update_display(v)
{
	if(v > 0)
	{
		leader.val = leader.getvalueof();
		for(var i=0;i<8;i++)
		{
			ccmutes[i].val = ccmutes[i].getvalueof();
			outlet(0, 'grid', i, 15, ccmutes[i].val);
			outlet(0, 'grid', i, 0, (leader.val==i)*6);
		}
	}
	else
	{
		outlet(0, 'batch', 'row', 0, 0);
		outlet(0, 'batch', 'row', 15, 0);
	}
}


function list(x, y, val)
{
	if(val> 0)
	{
		if(alt_val > 0)
		{
			if((y == 0)&&(x < 8))
			{
				leader.message(x);
			}
			else if((y == 15)&&(x < 8))
			{
				ccmutes[x].message('bang');
			}
			update_display(alt_val);
		}
		else
		{
			outlet(1, 'gravpoint', x/15, y/15);
		}
	}
}