import com.cycling74.max.*;

public class boiingg_b99b extends MaxObject
{
	public int[][] arColumns = new int[16][4];
	public int nColumns = 16;
	public int nRows = 8;
	public int[] arNoteVals = {60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 77, 79, 81, 83, 84, 86};
	public double[] arVelocities  = {1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.};
	public int[] arDurations = {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
	public double nBase = 60;
	public double nBPM = 120;
	public int nMode = 0;
	public int[] dump_out = new int[66];


	private static final String[] INLET_ASSIST = new String[]{
		"commands"
	};
	private static final String[] OUTLET_ASSIST = new String[]{
		"grid output", "midi output", "dump_output"
	};
	
	public boiingg_b99b(Atom[] args)
	{
		
		declareInlets(new int[]{DataTypes.ALL});
		declareOutlets(new int[]{DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});
		
		setInletAssist(INLET_ASSIST);
		setOutletAssist(OUTLET_ASSIST);
		createInfoOutlet(false); 

	}
    
	public void bang()
	{
		
	}
    
	public void inlet(int i)
	{
	}
    
	public void inlet(float f)
	{
	}
    
    
	public void list(Atom[] args) 
	{ 

	}
	
	public void fnNoteVals(int[] args)
	{
		for(int i = 0; i < args.length; i++) 
		{ 
			arNoteVals[i] = args[i]; 
		}
	}

	public void fnVelocities(float[] args)
	{
		for(int i = 0; i < args.length; i++) 
		{ 
			arVelocities[i] = args[i]; 
		}	
	}

	public void fnDurations(int[] args)
	{
		for(int i = 0; i < args.length; i++) 
		{ 
			arDurations[i] = args[i]; 
		}	
	}
    
	public void fnSetup(int x)
	{
		fnMonomeType(x);
		// arColumn Object Constructor
		for(int i=0;i<nColumns;i++)
		{
			arColumns[i][0] = 0;// 0 is stopped, 1 is playing  //playstate
			arColumns[i][1] = 1;// 1 is down, 0 is up   //direction
			arColumns[i][2] = 0;// the trigger button  //trigger
			arColumns[i][3] = 0;// the current row position  //row
		}
		fnClear();
	}
	
	public void restore(int[] d)
	{
		for(int i=0;i<16;i++)
		{
			//outlet(0, new Atom[]{ Atom.newAtom(i), Atom.newAtom(arColumns[i][3]), Atom.newAtom(0)});
			arColumns[i][0] = d[i];
			arColumns[i][1] = d[i+16];
			arColumns[i][2] = d[i+32];
			arColumns[i][3] = d[i+48];
			nColumns = d[64];
			nRows = d[65];
		}
	}

	
	public void fnClear()
	{
		//post("clear");
		for(int i=0;i<nColumns;i++)// iterate thru columns
		{
			arColumns[i][0] = 0;// 0 is stopped, 1 is playing  //playstate
			arColumns[i][1] = 1;// 0 is down, 1 is up   //direction
			arColumns[i][2] = 0;// the trigger button     //trigger
			arColumns[i][3] = 0;// the current row position   //row
			for(int n=0;n<nRows;n++)
			{// iterate thru rows - turn off all lights / states
				outlet(0, new Atom[]{ Atom.newAtom(i), Atom.newAtom(n), Atom.newAtom(0) });// turn off current row light
			}
		}
	}
	
	public void fnUpdate()
	{
		for(int i=0;i<nColumns;i++)
		{// iterate thru columns	
			if((arColumns[i][0] > 0)&&(arColumns[i][3]<nRows)&&(arColumns[i][3]>=0))  //playstate
			{	// we are playing so do this bit
				outlet(0, new Atom[]{ Atom.newAtom(i), Atom.newAtom(arColumns[i][3]), Atom.newAtom(0)});// turn off current row light
				if(arColumns[i][1] == 0)
				{// we are moving downwards
					
					arColumns[i][3] += 1;
				}
				else 
				{
					arColumns[i][3] -= 1;
				}
				outlet(0, new Atom[]{ Atom.newAtom(i), Atom.newAtom(arColumns[i][3]), Atom.newAtom(1)});// turn on new row light
				// check future direction
				if(arColumns[i][3] == nRows-1)
				{
					arColumns[i][1] = 1; // change direction // hit bottom
					int a = arNoteVals[i];
					double b = arVelocities[i]*128;
					double c = ((240/nBPM)/arDurations[i])*1000;
					outlet(1, new Atom[]{ Atom.newAtom(a), Atom.newAtom(b), Atom.newAtom(c) });
				}
				if(arColumns[i][3] == arColumns[i][2])
				{
					arColumns[i][1] = 0; // change direction // hit top
				}
			}
		}
	}
	
	public void fnButton(int colnum, int rownum, int togval)
	{
		if((colnum < nColumns) && (rownum < nRows) && (togval>0))
		{
			int nRow = rownum;
			int nCol = colnum;
			int nVal = togval;
			if(nRow == nRows-1)
			{// bottom button pressed
				//outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(arColumns[nCol][3]), Atom.newAtom(0)});// turn off row light
				arColumns[nCol][0] = 0;// stop playstate
				arColumns[nCol][1] = 1;// reset the direction
				arColumns[nCol][2] = 0;// reset the trigger
				arColumns[nCol][3] = 0;
				outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(arColumns[nCol][3]), Atom.newAtom(0)});// turn off reset light
				//for(int j = 0;j < 16; j ++)
				//{
				//	outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(j), Atom.newAtom(0)});// turn off reset light
				//}
			}
			else 
			{// other button
				outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(arColumns[nCol][3]), Atom.newAtom(0)});// turn off current light
				outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(nRow), Atom.newAtom(0)});// turn off trigger light
				arColumns[nCol][0] = 1;// start playstate
				arColumns[nCol][2] = nRow;//set the trigger
				if(nMode > 0)
				{// aka trigger-on-press, bounce from bottom
					arColumns[nCol][3] = nRows-1;
					arColumns[nCol][1] = 1;// reset the direction
					outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(nRows-1), Atom.newAtom(1)});// turn on or retrigger trigger light
					int a = arNoteVals[nCol];
					double b = arVelocities[nCol]*128;
					double c = ((240/nBPM)/arDurations[nCol])*1000.0;
					outlet(1, new Atom[]{ Atom.newAtom(a), Atom.newAtom(b), Atom.newAtom(c) });
				} 
				else 
				{// original mode*/
					arColumns[nCol][3] = nRow;// set the row
					arColumns[nCol][1] = 0;// reset the direction
					outlet(0, new Atom[]{ Atom.newAtom(nCol), Atom.newAtom(nRow), Atom.newAtom(1)});// turn on or retrigger trigger light
				} 
			}
			dump();
		}
	}
	
	public void fnMonomeType(int x)
	{
		int type = x;
		switch(type)
		{
			case 1:// 64
				nColumns = 8;
				nRows = 8;
				break;
			case 2:// 256
				nColumns = 16;
				nRows = 16;
				break;
			case 3:// 128w
				nColumns = 16;
				nRows = 8;
				break;
			case 4:// 128t
				nColumns = 8;
				nRows = 16;
				break;
			default:
				break;
		}
	}
	
	public void fnMode(int x)
	{
		nMode = x;	
	}

	public void fnBPM(double n)
	{
		nBPM = n;
	}
	
	public void dump()
	{
		for(int c = 0; c < 16; c++)
		{
			dump_out[c] = arColumns[c][0];
			dump_out[c+16] = arColumns[c][1];
			dump_out[c+32] = arColumns[c][2];
			dump_out[c+48] = arColumns[c][3];
		}
		dump_out[64] = nColumns;
		dump_out[65] = nRows;
		outlet(2, dump_out);
	}
		
		
}
















































