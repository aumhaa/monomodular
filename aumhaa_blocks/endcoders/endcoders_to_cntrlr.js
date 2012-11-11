autowatch = 1;

outlets = 2;

const BANK = [1, 3];
const BOUND = [0, 1];

function anything()
{
	var args = arrayfromargs(messagename, arguments)
	//post('cntrlr_in', args, '\n');
}

function cntrl_in()
{
	//post('ctrl_in');
	var args = arrayfromargs(arguments)
	//post('ctrl_in', messagename, args, '\n');
	switch(args[0])
	{	
		case('dial'):
			outlet(0, 'dial', args[1], args[2], args[3]);
			break;
		case('button'):
			outlet(0, 'button', args[1], args[2]+1, args[3]);
			break;
		case('grid'):
			if(args[2]==0)
			{
				outlet(0, 'button', args[1], 0, args[3]);
			}
			else if(args[2]<3)
			{
				outlet(0, 'column', args[1]+Math.floor(args[2]/4) + (4 * Math.floor(args[2]>1)), args[3]);
			}
			else if(args[2]==3)
			{
				outlet(0, 'row', args[1], args[3]);
			}
			break;
	}
}

function cntrl_out()
{
	//post('ctrl_out');
	var args = arrayfromargs(arguments)
	//post('ctrl_out', messagename, args, '\n');
	switch(args[0])
	{
		case('wheel'):
			switch(args[3])
			{
				case('white'):
					if((args[1] < 4)&&(args[2] < 3))
					{
						if(args[2]==0)
						{
							outlet(1, 'grid', args[1], 0, BANK[Math.floor(args[4]>0)]);
						}
						else
						{
							outlet(1, 'wheel', args[1], args[2], 'white', BOUND[Math.floor(args[4]>0)]);
						}
					}
					break;
				case('green'):
					if((args[1] < 4)&&(args[2] < 3))
					{
						outlet(1, 'wheel', args[1], args[2], args[3], args[4]);
					}
					break;
				case('value'):
					if((args[1] < 4)&&(args[2] < 3))
					{
						outlet(1, 'wheel', args[1], args[2], args[3], args[4]);
					}
					break;
				default:
					if((args[1] < 4)&&(args[2] < 3))
					{
						outlet(1, args);
					}
					break;
			}
			break;
		case('column'):
			outlet(1, 'grid', args[1]%4, Math.floor(args[1]/4)+1, args[2]);
			break;
		case('row'):
			outlet(1, 'grid', args[1], 3, args[2]);
			break;
	}
}