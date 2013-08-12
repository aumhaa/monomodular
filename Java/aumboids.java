import com.cycling74.max.*;
import java.util.Arrays;

public class aumboids extends MaxObject
{
	public int[][] modes = new int[8][4];
	public int[] notes = {0, 5, 7, 10, 12, 17, 19, 24};
	public int[] durations = {8000, 4000, 2000, 1000};
	public double[] weights = {1., 1., 1., 1., 1., 1., 1., 1.}; 
	public double sixteenth = 1./16;
	public double centroid_x = 0.;
	public double centroid_y = 0.;
	public double avgvelocity_x = 0.;
	public double avgvelocity_y = 0.;
	public int tick = 0;
	public int myprime = 0;
	public int[] primes = new int[128];
	public double[] dist_array;
	public double mywind_x = 0.;
	public double mywind_y = 0.;
	public double myseparation = .1;
	public double myalignment = .07;
	public double mycoherence = .1;
	public double myobedience = .5;
	public double myinertia = .5;
	public double myfriction = .5;
	public double mysepthresh = .3;
	public double mymaxvel = .1;
	public double mygravity = .1;
	public double mygravpoint_x = .5;
	public double mygravpoint_y = 0.;
	public double myslip = 0.;
	public double mywind = 0.;
	//public long rand = System.nanoTime();
	
	public int myagentcount = 8;
	public int leader = 0;
	
	public Agent[] agents;
	
	private static final String[] INLET_ASSIST = new String[]{
		"main input"
	};
	private static final String[] OUTLET_ASSIST = new String[]{
		"old 1", "old 2", "old 3", "grid output", "note output", "cc output"
	};
	
	public aumboids(Atom[] args)
	{
		declareInlets(new int[]{DataTypes.ALL});
		declareOutlets(new int[]{DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL, DataTypes.ALL});
		
		setInletAssist(INLET_ASSIST);
		setOutletAssist(OUTLET_ASSIST);
		createInfoOutlet(false);
		init();
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
	
	public class Agent
	{
		public double num;
		public double x;
		public double y;
		public double vx;
		public double vy;
		public double px;
		public double py;
		public int prime;
		public double dist;
		public int order;
		public int rulecount;
		public double weight;
	
		public Agent(int num, double x, double y, double vx, double vy, double px, double py, int prime, int order)
		{
			this.num = num;
			this.x = x;
			this.y = y;
			this.vx = vx;
			this.vy = vy;
			this.px = px;
			this.py = py;
			this.prime = prime;
			this.order = order;
			this.dist = 0.;
			this.rulecount = 0;
			this.weight = 1.;
		}
	}
	
	/*public long randomLong() 
	{
		rand ^= (rand << 21);
		rand ^= (rand >>> 35);
		rand ^= (rand << 4);
		//post("random" + rand);
		return rand;
	}*/

	public void init()
	{
		//rand = System.nanoTime();
		agentcount(myagentcount);
	}

	public void agentcount(int v)
	{
		int i;
		//myagentcount = clip(v,1,8);
		dist_array = new double[myagentcount];
		agents = new Agent[myagentcount];
		for(i=0;i<myagentcount;i++)
		{
			dist_array[i] = 0.;
			int num = i;
			double x = (Math.random());
			double y = (Math.random());
			double vx = (Math.random()-.5)*.1;
			double vy = (Math.random()-.5)*.1;
			double px = 0;
			double py = 0;
			int prime = i;
			int order = i;
			
			agents[i] = new Agent(num, x, y, vx, vy, px, py, prime, order);
			agents[i].rulecount = 5;
		}
	}

	private void tick(Agent a)
	{
		int i;
		
		//save current velocity for inertia calc
		double px = a.px;
		double py = a.py;
		
		//apply rules
		//for (i=0;i<a.rulecount;i++)
		//{
		separate(a);
		align(a);
		cohere(a);
		gravitate(a);
		follow(a);
		//}
		
		//inertia
		a.vx = px*myinertia + a.vx*(1.-myinertia);
		a.vy = py*myinertia + a.vy*(1.-myinertia);
		
		//velocity limit
		a.vx = clip(a.vx, -mymaxvel, mymaxvel);
		a.vy = clip(a.vy, -mymaxvel, mymaxvel);
		
		//update position based on velocity and friction
		a.x += a.vx*(1.-myfriction);
		a.y += a.vy*(1.-myfriction);
		
		//slip(this);
		wrap(a);  //torus space
		//bounce(this);
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
		mygravity = clip(v, 0, 1)*.1;
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
		//mywind_x = ((Math.random()-.5)*.05)*mywind_x;
		//mywind_y = ((Math.random()-.5)*.05)*mywind_y;	
		//circle();
		//for (i=0;i<myagentcount;i++) {
		//    outlet(3,Math.round(agents[i].x*15),Math.round(agents[i].y*15), 0);
		//}
		outlet(3, Atom.newAtom("clear"));
		outlet(3, new Atom[]{ Atom.newAtom(mygravpoint_x*15), Atom.newAtom(mygravpoint_y*15), Atom.newAtom(20)});
		lead();
		double cx = 0;
		double cy = 0;
		double cvx = 0;
		double cvy = 0;
		Agent agent;
		for(i=0;i<myagentcount;i++)
		{
			agent = agents[i];
			tick(agent);
			
			//calculate current frame's average position/velocity
			cx += agent.x;
			cy += agent.y;
			cvx += agent.vx;
			cvy += agent.vy;
		}
		centroid_x = cx/myagentcount;
		centroid_y = cy/myagentcount;
		avgvelocity_x = cvx/myagentcount;
		avgvelocity_y = cvy/myagentcount;
		//outlet(2, Atom.newAtom("bang"));
		//outlet(1, new Atom[]{ Atom.newAtom(centroid_x), Atom.newAtom(centroid_y), Atom.newAtom(avgvelocity_x), Atom.newAtom(avgvelocity_y)});
	
		for(i=0;i<myagentcount;i++)
		{
		 	agent = agents[i];
			int order = agent.order;
			outlet(3, new Atom[]{ Atom.newAtom(Math.round(agent.x*15)), Atom.newAtom(Math.round(agent.y*15)), Atom.newAtom(((i==leader)?1:0)+((order<4)?1:0)+1)});
			if(order< 4)
			{
				outlet(4, new Atom[]{ Atom.newAtom(i), Atom.newAtom(notes[leader] + modes[i][order]), Atom.newAtom(120 - (order*30)), Atom.newAtom(durations[order]), Atom.newAtom(agent.weight)});
			}
			else
			{
				outlet(4, new Atom[]{ Atom.newAtom(i), Atom.newAtom("off")});
			}
			outlet(5, new Atom[]{ Atom.newAtom(i), Atom.newAtom(agent.dist)});
			//outlet(0, new Atom[]{ Atom.newAtom(agent.x), Atom.newAtom(agent.y), Atom.newAtom(agent.vx), Atom.newAtom(agent.vy)});
		}
	}
	
	private void circle()
	{
		int phase = (int)(Math.floor((tick%64.)/16.));
		switch(phase)
		{
			case 0: mygravpoint_x += sixteenth;
					break;
			case 1: mygravpoint_y += sixteenth;
					break;
			case 2:	mygravpoint_x -= sixteenth;
					break;
			case 3: mygravpoint_y -= sixteenth;
					break;
		}
	}

	private void separate(Agent a)
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
				else if (dx<.5){dx += 1.;}
				
				//torus space
				if (dy>.5){dy -= 1.;}
				else if (dy<.5){dy += 1.;}
				
				if ((Math.abs(dx)>.0001)&&(Math.abs(dy)>.0001))
				{
					mag = (dx*dx+dy*dy);  //cheap mag, no sqrt
				}
				else
				{
					mag = .01;
				}
				
				if (mag<mysepthresh)
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
	
	private void align(Agent a)
	{
		double dvx;
		double dvy;
		
		dvx = avgvelocity_x - a.vx;
		dvy = avgvelocity_y - a.vy;
		
		a.vx += dvx*myalignment;
		a.vy += dvy*myalignment;
	}
	
	private void cohere(Agent a)
	{
		double dx;
		double dy;
		
		dx = centroid_x - a.x;
		dy = centroid_y - a.y;
		
		a.vx +=dx*mycoherence;
		a.vy +=dy*mycoherence;
	}
	
	private void gravitate(Agent a)
	{
		double dx;
		double dy;

		if(a.num == leader)
		{
			dx = mygravpoint_x - a.x;
			dy = mygravpoint_y - a.y;
			a.vx += dx*mygravity;// + mywind_x;
			a.vy += dy*mygravity;// + mywind_y;
		}
		//else
		//{
		//	a.vx += dx*mygravity;
		//	a.vy += dy*mygravity;
		//}
	}
	
	private void slip(Agent a)
	{
		a.y += myslip;
	}
	
	private void lead()
	{
		dist_array = new double[myagentcount];
		double[] dist_sort = new double[myagentcount];
		int a;
		double lead_x_off;
		double lead_y_off;

		lead_x_off = agents[leader].x;
		lead_y_off = agents[leader].y;	
	
		for(a=0;a<myagentcount;a++)
		{
			agents[a].dist = Math.sqrt(Math.pow(Math.abs(lead_x_off - (agents[a].x)), 2) + Math.pow(Math.abs(lead_y_off - (agents[a].y)), 2));
			dist_array[a] = agents[a].dist;
		}
		System.arraycopy(dist_array, 0, dist_sort, 0, dist_array.length);
		Arrays.sort(dist_sort);   ///this definitely won't work ... we need to create a new array for temp purposes.
		
		for (a=0;a<myagentcount;a++)
		{
			//for(int j=0;j<myagentcount;j++)
			//{
			//	if(dist_sort[j]==agents[a].dist)
			//	{
			//		agents[a].order = j;
			//		break;
			//	}
			//}
			agents[a].order = Arrays.binarySearch(dist_sort, agents[a].dist);
		}
	}
	
	private int calculate_leader()
	{
		double min = 100;
		int lead = 0;
		int a;
		for(a=0;a<myagentcount;a++)
		{
			if(agents[a].dist < min)
			{
				min = agents[a].dist;
				lead = a;
			}
		}
		return lead;
	}
	
	private void follow(Agent a)
	{
		double dx;
		double dy;
		
		//move towards center
		dx = mygravpoint_x - agents[leader].x;
		dy = mygravpoint_y - agents[leader].y;
		if(a.num != leader)
		{
			a.vx += dx*myobedience;
			a.vy += dy*myobedience;
		}
	}
	
	private void wrap(Agent a)
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

	private void bounce(Agent a)
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
		
	private double clip(double x, double min, double max)
	{
		return Math.min(Math.max(x, min), max);
	}
		
	public void assign_mode(int x, int y, int val)
	{
		modes[x][y]=val;
	}
	
	public void assign_note(int x, int val)
	{
		notes[x]=val;
	}
	
	public void assign_duration(int x, int val)
	{
		durations[x] = val;
	}
	
	public void assign_weight(int x, double val)
	{
		//weights[x] = val;
		agents[x].weight = val;
	}
}










































































































