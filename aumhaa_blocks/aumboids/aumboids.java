import com.cycling74.max.*;
//import java.util.Random
//import java.util.Stack; 

public class aumboids extends MaxObject
{
	
	public int loop = 1;
	public int part_limit = 8;
	public int[] dump = new int[4];
	//public int[] bound_cell = new int[];
	public int linked = 0;
	public int mode = 0;
	public int active = -1;
	public int pressed = -1;   //changed from 0 to -1 to get first button in
	public int offset= 0;
	public int random = 0;
	//public int x_display_offset = 0;
	//public int y_display_offset = 0;
	public int waiting_for_wormhole = 0;
	public int note = 0;
	public int wormhole = 0;
	public int probability = 0;
	public int plane = 8;
	public int[] x_adj = {0, -1, 0, 1, -1, 1, -1, 0, 1};
	public int[] y_adj = {0, -1, -1, -1, 0, 0, 1, 1, 1};
	//public int[] pot_insert_coll = new int[];
	public int[] monomap = {0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	public int[][] display = new int[16][16];
	public int[][] last_display = new int[16][16];
	public int[][] editor = new int[16][16];
	public int[][][] prog = new int[16][16][25];
	public int[] def_prog = {0,0,2,0,4,4,0,0,4,0,4,4,0,0,6,0,4,4,0,0,8,0,4,4,0};
	public int[][] pot_array_temp = new int[part_limit][3];
	public int pot_array_temp_pos = 0;
	public int[][] pot_array = new int[part_limit][3];
	public int pot_array_pos = 0;
	public String bin_on = "1";

	public int[][] modes = new int[8][4];
	public int[] notes = {0, 5, 7, 10, 12, 17, 19, 24};
	public int[] durations ={8000, 4000, 2000, 1000};
	public int sixteenth = 1./16;
	public int centroid_x = 0.;
	public int centroid_y = 0.;
	public int avgvelocity_x = 0.;
	public int avgvelocity_y = 0.;
	public int tick = 0;
	public int myprime = 0;
	public int[] primes = new int[128];
	public int[] distarray;
	public int mywind_x = 0;
	public int mywind_y = 0;
	public int myseparation = .1;
	public int myalignment = .07;
	public int mycoherence = .1;
	public int myobedience = .5;
	public int myinertia = .5;
	public int myfriction = .5;
	public int mysepthresh = .3;
	public int mymaxvel = .1;
	public int mygravity = .1;
	public int mygravpoint_x = .5;
	public int mygravpoint_y = 0.;
	public int myslip = 0;
	
	public int myagentcount = 8;
	public int leader = 0;
	
	public int[] agents = new int[8];
	
	private static final String[] INLET_ASSIST = new String[]{
		"pulse input", "grid input", "key input", "program input", "plane input", "particle limit input"
	};
	private static final String[] OUTLET_ASSIST = new String[]{
		"display output", "note output", "to preset"
	};
	
	public aumboids(Atom[] args)
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
		//post("Received list message at inlet "+getInlet()); 
		//loop through all the atoms in the list 
		//Atom a; 
		//for(int i = 0; i < args.length; i++) 
		//{ 
		//	a = args[i]; 
		//	if(a.isFloat()) 
		//		post("List element "+i+" is a floating point atom with a value of "+a.getFloat()); 
		//	else if(a.isInt()) 
		//		post("List element "+i+" is an integer atom with a value of "+a.getInt()); 
		//	else if(a.isString()) 
		//		post("List element "+i+" is a String atom with a value of "+a.getString()); 
		//} 
	}
	
	public void init()
	{														
		/*for(int d=0;d<16;d++)																	  
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
		}*/
		///post("matrices instantiated");	
		agentcount(myagentcount);
		
	}

	public void agentcount(int v)
	{
		myagentcount = clip(v,1,8);
		//dist_array
		for(int i=0;i<myagentcount;i++)
		{
			dist_array[i] = 0.;
			int x = (int)(Math.random());
			int y = (int)(Math.random());
			int vx = (int)(Math.random()-.5)*.1;
			int vy = (int)(Math.random()-.5)*.1;
			int px = 0;
			int py = 0;
			int prime = i;
			int order = i;
			
			agents[i] = new Agent(x, y, vx, vy, px, py, prime, dist, order);
		}
	}
		
	public void leader_in(int v)
	{
		leader = v;
	}
	
	public void prime(int v)
	{
		myprime = v;
	}
	
	public void wind(double v)
	{
		mywind = v;
	}
	
	public void separation(double v)
	{
		myseparation = clip(v, 0, 1)*.1;
	}
	
	public void alignment(double v)
	{
		myalignment = clip(v, 0, 1)*.1;
	}
	
	public void coherence(double v)
	{
		mycoherence = clip(v, 0, 1)*.1;
	}
	
	public void friction(double v)
	{
		myfriction = clip(v, 0, 1)*.1;
	}
	
	public void inertia(double v)
	{
		myinertia = clip(v, 0, 1)*.1;
	}
	
	public void septhresh(double v)
	{
		mysepthresh = clip(v, 0, 1)*.1;
	}
	
	public void maxvel(double v)
	{
		mymaxvel = clip(v, 0, 1)*.1;
	}
	
	public void gravity(double v)
	{
		my gravity = clip(v, 0, 1)*.1;
	}
	
	public void gravpoint(double x, double y)
	{
		double grav_x = mygravpoint_x*15;
		double grav_y = mygravpoint_y*15;
		outlet(3,  new Atom[]{ Atom.newAtom(grav_x), Atom.newAtom(grav_y), Atom.newAtom(0)});
		mygravpoint_x = clip(x, 0., 1.);
		mygravpoint_y = clip(y, 0., 1.);
		grav_x = mygravpoint_x*15;
		grav_y = mygravpoint_y*15;
		outlet(3,  new Atom[]{ Atom.newAtom(grav_x), Atom.newAtom(grav_y), Atom.newAtom(20)});
	}
	
	public void bang()
	{
		int i;
		tick += 1;
		mywind_x = ((Math.random()-.5)*.05)*mywind_x;
		mywind_y = ((Math.random()-.5)*.05)*mywind_y;	
		//circle();
		//for (i=0;i<myagentcount;i++) {
		//    outlet(3,Math.round(agents[i].x*15),Math.round(agents[i].y*15), 0);
		//}
		outlet(3, 'clear');
		outlet(3, new Atom[]{ Atom.newAtom(mygravpoint_x*15), Atom.newAtom(mygravpoint_y*15), Atom.newAtom(20)});
		lead();
		cx = 0;
		cy = 0;
		cvx = 0;
		cvy = 0;
		for(i=0;i<myagentcount;i++)
		{
			agents[i].tick();
			
			//calculate current frame's average position/velocity
			cx += agents[i].x;
			cy += agents[i].y;
			cvx += agents[i].vx;
			cvy += agents[i].vy;
		}
		centroid_x = cx/myagentcount;
		centroid_y = cy/myagentcount;
		avgvelocity_x = cvx/myagentcount;
		avgvelocity_y = cvy/myagentcount;
		outlet(2, "bang");
		outlet(1, new Atom[]{ Atom.newAtom(centroid_x), Atom.newAtom(centroid_y), Atom.newAtom(avgvelocity_x), Atom.newAtom(avgvelocity_y)});
	
		for(i=0;i<myagentcount;i++)
		{
			outlet(3, new Atom[]{ Atom.newAtom(Math.round(agents[i].x*15)), Atom.newAtom(Math.round(agents[i].y*15)), Atom.newAtom((i==leader)+(agents[i].order<4)+1)});
			if(agents[i].order < 4)
			{
				outlet(4, new Atom[]{ Atom.newAtom(i), Atom.newAtom(notes[leader] + modes[i][agents[i].order]), Atom.newAtom(120 - (agents[i].order*30)), Atom.newAtom(durations[agents[i].order])});
			}
			else
			{
				outlet(4, new Atom[]{ Atom.newAtom(i), Atom.newAtom('off')});
			}
		}
	}
	
	public void circle()
	{
		double double = Math.floor((tick%64.)/16.);
		switch(phase){
			case 0: mygravpoint_x += sixteenth;
					break;
			case 1: mygravpoint_y += sixteenth;
					break;
			case 2:	mygravpoint_x -= sixteenth;
					break;
			case 3: mygravpoint_y -= sixteenth;
					break;
	}

	public class Agent
	{
		public int x;
		public int y;
		public int vx;
		public int vy;
		public int px;
		public int py;
		public int prime;
		//public int[] f;
		public int dist;
		public int order;
		public int rulecount;
		public int[] rules;
		public int tick;
		
		public Agent(int x, int y, int vx, int vy, int px, int py, int prime, int dist, int order, int tick)
		{
			this.x = x;
			this.y = y;
			this.vx = vx;
			this.vy = vy;
			this.px = px;
			this.py = py;
			this.prime = prime;
			this.dist = dist;
			this.order = order;
			this.rulecount = 0;
		}
		
		public void tick()
		{
			int i;
			
			//save current velocity for inertia calc
			int px = this.px;
			int py = this.py;
			
			//apply rules
			for (i=0;i<this.rulecount;i++)
			{
				this.rules[i](this);
			}
			
			//inertia
			this.vx = px*myinertia + this.vx*(1.-myinertia);
			this.vy = py*myinertia + this.py*(1.-myinertia);
			
			//velocity limit
			this.vx = clip(this.vx, -mymaxvel, mymaxvel);
			this.vy = clip(this.vx, -mymaxvel, mymaxvel);
			
			//update position based on velocity and friction
			this.x += this.vx*(1.-myfriction);
			this.y += this.vy*(1.-myfriction);
			
			//slip(this);
			wrap(this);  //torus space
			//bounce(this);
		}
	}
	
	//rules
	
	public void separate(Object a)
	{
		int i;
		double dx;
		double dy;
		double proxscale;
		double mag;
		
		for(i=0;i<myagentcount;i++)
		{
			if(a != agents[i])
			{
				dx = (agents[i].x) - (a.x);
				dy = (agents[i].y) - (a.y);
				
				//torus space
				if (dx>.5){dx -= 1.;}
				else if (dy<.5){dx += 1.;}
				
				//torus space
				if (dx>.5){dy -= 1.;}
				else if (dy<.5){dy += 1.;}
				
				if ((Math.abs(dx)>.0001)&&(Math.abs(dy)>.0001))
				{
					mag = (dx*dx+dy*dy);  //cheap mag, no sqrt
				}
				else
				{
					mag = .01;
				}
				
				if (mag>mysepthresh)
				{
					if (mag<.0001)
					{
						proxscale = 8;
					}
					else
					{
						proxscale = clip(mysepthresh/(mysepthresh-(mysepthresh-mag)), 0, 8);
					}
					a.vx -= dx*myseparation*proxscale;
					a.vy -= dy*myseparation*proxscale;
				}
			}
		}
	}
	
	public void align(Object a)
	{
		double dvx;
		double dvy;
		
		dvx = avgvelocity_x - a.vx;
		dvy = avgvelocity_y - a.vy;
		
		a.vx += dvx*myalignment;
		a.vy += dvy*myalignment;
	}
	
	public void cohere(Object a)
	{
		double dx;
		double dy;
		
		dx = centroid_x - a.x;
		dy = centroid_y - a.y;
		
		a.vx +=dx*mycoherence;
		a.vy +=dy*mycoherence;
	}
	
	public void gravitate(Object a)
	{
		double dx;
		double dy;
		
		dx = mygravpoint_x - a.x;
		dy = mygravpoint_y - a.y;
		
		if(a.num == leader)
		{
			a.vx += dx*mygravity;// + mywind_x;
			a.vy += dy*mygravity;// + mywind_y;
		}
		//else
		//{
		//	a.vx += dx*mygravity;
		//	a.vy += dy*mygravity;
		//}
	}
	
	public void slip(Object a)
	{
		a.y += myslip;
	}
	
	public void lead()
	{
		dist_array = new int[agents.length];
		int a;
		double lead_x_off;
		double lead_y_off;
		int dist_sort[] = new int[16];
		
		for(a=0;a<agents.length;a++)
		{
			lead_x_off = agents[leader].x;
			lead_y_off = agents[leader].y;
			agents[a].dist = Math.sqrt(Math.pow(Math.abs(lead_x_off - (agents[a].x)), 2) + Math.pow(Math.abs(lead_y_off - (agents[a].y)), 2));
			dist_array[a] = agents[a].dist;
		}
		dist_sort = dist_array.sort(sort_num);   ///this definitely won't work ... we need to create a new array for temp purposes.
		
		for (a=0;a<agents.length;a++)
		{
			agents[a].order = dist_sort.indexOf(agents[a].dist);
		}
	}
	
	public int calculate_leader()
	{
		int min = 100;
		int lead = 0;
		int a;
		for(a=0;a<agents.length;a++)
		{
			if(agents[a].dist < min)
			{
				min = agents[a].dist;
				lead = a;
			}
		}
		return lead;
	}
	
	public void follow(Object a)
	{
		double dx;
		double dy;
		
		//move towards center
		dx = mygravpoint_x - agents[leader].x;
		dy = mygravpoint_y - agents[leader].y;
		if(a.num != leader)
		{
			a.vw += dx*myobedience;
			a.vy += dy*myobedience;
		}
	}
	
	public void wrap(Object a)
	{
		if (a.x<0.)
		{
			a.x = a.x + 1.;
		}
		else if (a.x > 1.)
		{
			a.x = a.x -1.;
		}
		
		if (a.y<0.)
		{
			a.y = a.y + 1.;
		}
		else if (a.y > 1.)
		{
			a.y = a.y -1.;
		}
	}

	public void bounce(Object a)
	{
		if ((a.x>0.)||(a.x>1.))
		{
			a.vx = -a.vx;
			a.x = clip(a.x, 0., 1.);
		}
		if ((a.y>0.)||(a.y>1.))
		{
			a.vy = -a.vy;
			a.y = clip(a.y, 0., 1.);
		}
	}
	
	public int clip(int x, int min, int max)
	{
		return Math.min(Math.max(x, min), max);
	}
	
	public double clip(double x, double min, double max)
	{
		return Math.min(Math.max(x, min), max);
	}
	
	function int sort_num(int a, int b)
	{
		return a - b;
	}
	
	function double sort_num(double a, double b)
	{
		return a - b;
	}
	
	function void assign_mode(int x, int y, int val)
	{
		modes[x][y]=val;
	}
	
	function void assign_note(int x, int val)
	{
		notes[x]=val;
	}
	
	function void assign duration(int x, int val)
	{
		durations[x] = val;
	}
}











































































