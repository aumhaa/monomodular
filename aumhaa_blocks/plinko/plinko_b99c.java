import com.cycling74.max.*;

public class plinko_b99c extends MaxObject
{
	
	public int loop = 1;
	public int part_limit = 8;
	public int[] dump = new int[4];
	public int active = -1;
	public int random = 0;
	public int note = 0;
	public int plane = 8;
	public int[] x_adj = {0, -1, 0, 1, -1, 1, -1, 0, 1};
	public int[] y_adj = {0, -1, -1, -1, 0, 0, 1, 1, 1};
	public int[][] display = new int[16][16];
	public int[][] last_display = new int[16][16];
	public int[][][] prog = new int[16][16][25];
	public int[] def_prog = {0,0,2,0,4,4,0,0,4,0,4,4,0,0,6,0,4,4,0,0,8,0,4,4,0};
	public int[][] pot_array_temp = new int[part_limit][3];
	public int pot_array_temp_pos = 0;
	public int[][] pot_array = new int[part_limit][3];
	public int pot_array_pos = 0;
	
	private static final String[] INLET_ASSIST = new String[]{
		"pulse input", "grid input", "key input", "program input", "plane input", "particle limit input"
	};
	private static final String[] OUTLET_ASSIST = new String[]{
		"display output", "note output", "to preset"
	};
	
	public plinko_b99c(Atom[] args)
	{

		//Random generator = new Random();
		
		declareInlets(new int[]{DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});
		declareOutlets(new int[]{DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});
		
		setInletAssist(INLET_ASSIST);
		setOutletAssist(OUTLET_ASSIST);
		createInfoOutlet(false); 
		
		///init();

	}
	
	
	public void inlet(int i)
	{
		if(getInlet()==4)
		{
			set_plane(i);
		}
		if(getInlet()==5)
		{
			set_particle_limit(i);
		}
			
	}
	
	public void inlet(float f)
	{
	}
	
	
	public void list(Atom[] args) 
	{
	}
	
	public void init()
	{														
		for(int d=0;d<16;d++)																	  
		{  
			for(int dd=0;dd<16;dd++)
			{
				display[d][dd]=0;		///create the display arrays:16x16x3, one for each cell:edit, program, node
				for(int dddd=0;dddd<25;dddd++)
				{
					prog[d][dd][dddd] = def_prog[dddd];	  ///cells are : (direction, wormhole, probability, note)
				}
			}											///				[velocity, duration aren't implemented] 
		}											   ///matrix containing all program data: 6 cells per plane, 25 is start
		for(int p=0;p<part_limit;p++)
		{
			pot_array_temp[p][0] = -2;
			pot_array[p][0] = -2;
		}
		///post("matrices instantiated");	
		
	}
	
	public void set_potential(int x, int y, int d)	   /// add the potential to spawn in a certain direction from a node in the temp buffer
	{
		//post("set_potential" + x + y + d + pot_array_temp_pos);
		if(pot_array_temp_pos < part_limit)
		{
			pot_array_temp[pot_array_temp_pos][0] = x;
			pot_array_temp[pot_array_temp_pos][1] = y;
			pot_array_temp[pot_array_temp_pos][2] = d;
			pot_array_temp_pos += 1;
		}
	}
	
	public void add_potential(int x, int y, int d)		 /// add the potential to spawn in a certain direction from a node in the current buffer
	{
		//post("set_potential" + x + y + d + pot_array_pos);
		if(pot_array_pos < part_limit)
		{
			pot_array[pot_array_pos][0] = x;
			pot_array[pot_array_pos][1] = y;
			pot_array[pot_array_pos][2] = d;
			pot_array_pos += 1;
		}
	}
	
	public void fire_node()		   ///place potential in a cell for inclusion on next turn:	 this is where we play plinko in realtime
	{
		int a = (int)active%16;
		int b = (int)active/16;
		set_potential(a, b, 4);
		///post("fire_node" + a + b + 4);
	}
	
	public void set_plane(int p)	   ///set the current plane selected in edit mode
	{
		//post("old plane " + plane + " new plane " + p);
		plane = p;
	}
	
	public void set_particle_limit(int l)
	{
		//post("old limit " + part_limit + " new limit " + l);
		int[][] array = new int[l][3];
		int[][] array_temp = new int[l][3];
		for(int i=0;i<Math.min(part_limit, l);i++)
		{
			for(int j=0;j<3;j++)
			{
				array[i][j] = pot_array[i][j];
				array_temp[i][j] = pot_array_temp[i][j];
			}
		}
		pot_array = array;
		pot_array_temp = array_temp;
		part_limit = l;
	}
		
	
	public void roll_random()	   ///generate a random number for the turn
	{
		if(plane==8)			/// if the plane setting is open (9), then roll random number
		{
			random = (int)(Math.random() * 7)+1;
			//post("random" + random);
		}
		else					/// otherwise, use the plane setting to set chance
		{	
			random=plane;
		}
	}
	
	public void bang()			   /// this is the main operation...it is called every time a bang is received (a turn)
	{
		if(getInlet()==0)			
		{
			//post("resetting pot_array positions");
			pot_array_pos = 0;
			pot_array_temp_pos = 0;
			roll_random();		/// either generate a random number or assign a value entered from the gui
			for(int ref=0;ref<part_limit;ref++)
			{
				int thru = 0;										  /// unless something happens on this recurse, send 				
				int xx=pot_array[ref][0];	 	  /// the particle to the temp buffer for the next turn
				int yy=pot_array[ref][1];
				int pp=pot_array[ref][2];
				if((xx<16)&&(yy<16)&&(xx>-1)&&(yy>-1))			///if the particle is still within the confines of the grid...
				{
					thru = 1;
					//post("particle " + xx + " " + yy + " " + pp + " still within bounds");
					///see if there is an action to be done in the cell..
					for(int nn=0;nn<4;nn++)			///interpret whether potential blooms from program data and randomizer	 !!!!!!turn into switch
					{
						//post(prog[xx][yy][(nn*6)+2] + "to hit");
						if(random<=(int)prog[xx][yy][(nn*6)+2])			///if random hits this plane... 
						{  
							//post("plane " + nn + " hit");
							make_note(xx,yy,prog[xx][yy][(nn*6)+3],prog[xx][yy][(nn*6)+4],prog[xx][yy][(nn*6)+5]);	//send a note to the assignment gui and diplay it in edit 
							if(prog[xx][yy][(nn*6)+1] + prog[xx][yy][nn*6] > 0)  //if there is a direction or wormhole...
							{					   
								int wormhl = prog[xx][yy][(nn*6)+1]; 	///wormhole value from plane of program matrix
								//post("wormhl = " + wormhl);
								if(wormhl>0)		///if no wormhole in program, return; otherwise, place particle in temp
								{
									int a = (int)wormhl%16;
									int b = (int)wormhl/16;
									set_potential( a, b, pp);	///place new particle in the temp_array
									thru=0;									///destroy the old particle
								} 
								int dir= prog[xx][yy][nn*6];  ///direction value from plane of program matrix
								//post("dir = " + dir);
								if(dir>0)									///if no direction in program, return;	otherwise, set new directions
								{	
									thru=0;									///destroy the old particle
									boolean[] bin_split = new boolean[8];
									for(int bit=0;bit<8;bit++)
									{
										bin_split[bit] = (dir & (1 << bit)) != 0;
									}
									for(int cd=0;cd<8;cd++)			///recurse for length of binary array
									{	
										//post("if bin_split "  + bin_split[cd]);
										if(bin_split[cd])//Integer.parseInt(bin_split[cd])>0)		/// if a value of a binary position of the array is non-zero, create a potential 
										{									///	   with the direction value of the position in the binary array.
											set_potential(xx,yy,8-cd);		///place potential in the temp_array for updating on next turn
										}
									}
								}
							}
							break;										///if this plane was struck, stop here and move on to next particle
						}
					}
					if(thru==1)												///if no wormholes/direction changes
					{
						set_potential(xx,yy,pp);							///place particle in the temp_array for updating on next turn
					}						
					if(display[xx][yy]!=2)
					{
						display[xx][yy] = 1;
					}
					//outlet(0,  new Atom[]{ Atom.newAtom(xx), Atom.newAtom(yy), Atom.newAtom(1)});
					//display[xx][yy][0]=1;									///add particle to the diplay_array on the edit plane
				}
			}
			update_potential();												 ///advance all particles one turn according to their directions
			update_display();
			//outlet(0, "bang");
		}
	}
	
	public void update_display()
	{
		for(int xx=0;xx<16;xx++)
		{
			for(int yy=0;yy<16;yy++)
			{
				if(display[xx][yy]!=last_display[xx][yy])
				{
					outlet(0,  "to_display", new Atom[]{ Atom.newAtom(xx), Atom.newAtom(yy), Atom.newAtom(display[xx][yy])});
				}
				last_display[xx][yy]=display[xx][yy];
				display[xx][yy]=0;
			}
		}
	}


	public void update_potential()
	{                                               ///clear the old particles from last turn
		//post("update_potential");
	    for(int u=0;u<part_limit;u++)                                ///recurse for the number of particles
	    {
			pot_array[u][0] = pot_array_temp[u][0]-x_adj[pot_array_temp[u][2]];
			pot_array[u][1] = pot_array_temp[u][1]-y_adj[pot_array_temp[u][2]];
			pot_array[u][2] = pot_array_temp[u][2];
			pot_array_temp[u][0] = -1;     ///clear the temp buffer for processing on next turn
			pot_array_temp[u][1] = -1;
			pot_array_temp[u][2] = 0;
	    }                                         
	}

	public void make_note(int x, int y, int note, int velocity, int duration)
	{
		//post("make note " + x + y + note + velocity + duration);
	    if(note>0)
	    {
			//outlet(0,  new Atom[]{ Atom.newAtom(x), Atom.newAtom(y), Atom.newAtom(2)});
			display[x][y]=2;
	        //display[x][y][0]=2;                //indicate that a note is being played on the edit plane of the display
	        outlet(1, new Atom[]{ Atom.newAtom(note), Atom.newAtom(velocity), Atom.newAtom(duration)});   //send to be processed as noteout
	    	//outlet(1, x + (y*16));
		}
	}

	public void start_make_note(int x, int y, int note, int velocity, int duration)
	{
	    if(note>0)
	    {
			outlet(0,  new Atom[]{ Atom.newAtom(x), Atom.newAtom(y), Atom.newAtom(2)});
	        //display[x][y][0]=2;                //indicate that a note is being played on the edit plane of the display
	        outlet(1,"start", new Atom[]{ Atom.newAtom(note), Atom.newAtom(velocity), Atom.newAtom(duration)});                     //send to be processed as noteout
	    }
	}
	
	public void loopstart()
	{
		for(int u=0;u<part_limit;u++)                                ///recurse for the number of particles
	    {
			pot_array_temp[u][0] = -1;     ///  destroy all particles....
			pot_array_temp[u][1] = -1;
			pot_array_temp[u][2] = 0;
	    } 
	    for(int xx=0;xx<16;xx++)        /// parse program cells to see if there are possible start positions
	    {
	        for(int yy=0;yy<16;yy++)
	        {
	            if(prog[xx][yy][24]>0)
	            {
	                add_potential(xx, yy, 4);
	            }
	        }
	    }
	    //bang();
	}
	
	public void set(int x, int y, int pos, int val)
	{
		prog[x][y][pos] = val;
		//post("java set " + x + " " + y + " " + "pos" + pos + "val" + val); 
	}

			
}




