/* plinko_b99b - Decompiled by JODE
 * Visit http://jode.sourceforge.net/
 */
import com.cycling74.max.Atom;
import com.cycling74.max.MaxObject;

public class plinko_b99b extends MaxObject
{
    public int loop = 1;
    public int part_limit = 8;
    public int[] dump = new int[4];
    public int linked = 0;
    public int mode = 0;
    public int active = -1;
    public int pressed = -1;
    public int offset = 0;
    public int random = 0;
    public int waiting_for_wormhole = 0;
    public int note = 0;
    public int wormhole = 0;
    public int probability = 0;
    public int plane = 8;
    public int[] x_adj = { 0, -1, 0, 1, -1, 1, -1, 0, 1 };
    public int[] y_adj = { 0, -1, -1, -1, 0, 0, 1, 1, 1 };
    public int[] monomap = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
    public int[][] display = new int[16][16];
    public int[][] last_display = new int[16][16];
    public int[][] editor = new int[16][16];
    public int[][][] prog = new int[16][16][25];
    public int[] def_prog = { 0, 0, 2, 0, 4, 4, 0, 0, 4, 0, 4, 4, 0, 0, 6, 0,
			      4, 4, 0, 0, 8, 0, 4, 4, 0 };
    public int[][] pot_array_temp = new int[part_limit][3];
    public int pot_array_temp_pos = 0;
    public int[][] pot_array = new int[part_limit][3];
    public int pot_array_pos = 0;
    public String bin_on = "1";
    private static final String[] INLET_ASSIST
	= { "pulse input", "grid input", "key input", "program input",
	    "plane input", "particle limit input" };
    private static final String[] OUTLET_ASSIST
	= { "display output", "note output", "to preset" };
    
    public plinko_b99b(Atom[] atoms) {
	declareInlets(new int[] { 15, 15, 15, 15, 15, 15 });
	declareOutlets(new int[] { 15, 15, 15 });
	setInletAssist(INLET_ASSIST);
	setOutletAssist(OUTLET_ASSIST);
	createInfoOutlet(false);
    }
    
    public void inlet(int i) {
	if (getInlet() == 4)
	    set_plane(i);
	if (getInlet() == 5)
	    set_particle_limit(i);
    }
    
    public void inlet(float f) {
	/* empty */
    }
    
    public void list(Atom[] atoms) {
	/* empty */
    }
    
    public void init() {
	for (int i = 0; i < 16; i++) {
	    for (int i_0_ = 0; i_0_ < 16; i_0_++) {
		display[i][i_0_] = 0;
		for (int i_1_ = 0; i_1_ < 25; i_1_++)
		    prog[i][i_0_][i_1_] = def_prog[i_1_];
	    }
	}
	for (int i = 0; i < part_limit; i++) {
	    pot_array_temp[i][0] = -2;
	    pot_array[i][0] = -2;
	}
    }
    
    public void set_potential(int i, int i_2_, int i_3_) {
	if (pot_array_temp_pos < part_limit) {
	    pot_array_temp[pot_array_temp_pos][0] = i;
	    pot_array_temp[pot_array_temp_pos][1] = i_2_;
	    pot_array_temp[pot_array_temp_pos][2] = i_3_;
	    pot_array_temp_pos++;
	}
    }
    
    public void add_potential(int i, int i_4_, int i_5_) {
	if (pot_array_pos < part_limit) {
	    pot_array[pot_array_pos][0] = i;
	    pot_array[pot_array_pos][1] = i_4_;
	    pot_array[pot_array_pos][2] = i_5_;
	    pot_array_pos++;
	}
    }
    
    public void fire_node() {
	int i = active % 16;
	int i_6_ = active / 16;
	set_potential(i, i_6_, 4);
    }
    
    public void set_plane(int i) {
	plane = i;
    }
    
    public void set_particle_limit(int i) {
	int[][] is = new int[i][3];
	int[][] is_7_ = new int[i][3];
	for (int i_8_ = 0; i_8_ < Math.min(part_limit, i); i_8_++) {
	    for (int i_9_ = 0; i_9_ < 3; i_9_++) {
		is[i_8_][i_9_] = pot_array[i_8_][i_9_];
		is_7_[i_8_][i_9_] = pot_array_temp[i_8_][i_9_];
	    }
	}
	pot_array = is;
	pot_array_temp = is_7_;
	part_limit = i;
    }
    
    public void roll_random() {
	if (plane == 8)
	    random = (int) (Math.random() * 7.0) + 1;
	else
	    random = plane;
    }
    
    public void bang() {
	if (getInlet() == 0) {
	    pot_array_pos = 0;
	    pot_array_temp_pos = 0;
	    roll_random();
	    for (int i = 0; i < part_limit; i++) {
		boolean bool = false;
		int i_10_ = pot_array[i][0];
		int i_11_ = pot_array[i][1];
		int i_12_ = pot_array[i][2];
		if (i_10_ < 16 && i_11_ < 16 && i_10_ > -1 && i_11_ > -1) {
		    bool = true;
		    for (int i_13_ = 0; i_13_ < 4; i_13_++) {
			if (random <= prog[i_10_][i_11_][i_13_ * 6 + 2]) {
			    make_note(i_10_, i_11_,
				      prog[i_10_][i_11_][i_13_ * 6 + 3],
				      prog[i_10_][i_11_][i_13_ * 6 + 4],
				      prog[i_10_][i_11_][i_13_ * 6 + 5]);
			    if ((prog[i_10_][i_11_][i_13_ * 6 + 1]
				 + prog[i_10_][i_11_][i_13_ * 6])
				> 0) {
				int i_14_ = prog[i_10_][i_11_][i_13_ * 6 + 1];
				if (i_14_ > 0) {
				    int i_15_ = i_14_ % 16;
				    int i_16_ = i_14_ / 16;
				    set_potential(i_15_, i_16_, i_12_);
				    bool = false;
				}
				int i_17_ = prog[i_10_][i_11_][i_13_ * 6];
				if (i_17_ > 0) {
				    bool = false;
				    String string
					= Integer.toBinaryString(i_17_ + 256);
				    char[] cs = string.toCharArray();
				    for (int i_18_ = 1; i_18_ < 9; i_18_++) {
					if (cs[i_18_] == '1')
					    set_potential(i_10_, i_11_, i_18_);
				    }
				}
			    }
			    break;
			}
		    }
		    if (bool == true)
			set_potential(i_10_, i_11_, i_12_);
		    if (display[i_10_][i_11_] != 2)
			display[i_10_][i_11_] = 1;
		}
	    }
	    update_potential();
	    update_display();
	}
    }
    
    public void update_display() {
	for (int i = 0; i < 16; i++) {
	    for (int i_19_ = 0; i_19_ < 16; i_19_++) {
		if (display[i][i_19_] != last_display[i][i_19_])
		    outlet(0, "to_display",
			   new Atom[] { Atom.newAtom(i), Atom.newAtom(i_19_),
					Atom.newAtom(display[i][i_19_]) });
		last_display[i][i_19_] = display[i][i_19_];
		display[i][i_19_] = 0;
	    }
	}
    }
    
    public void update_potential() {
	for (int i = 0; i < part_limit; i++) {
	    pot_array[i][0]
		= pot_array_temp[i][0] - x_adj[pot_array_temp[i][2]];
	    pot_array[i][1]
		= pot_array_temp[i][1] - y_adj[pot_array_temp[i][2]];
	    pot_array[i][2] = pot_array_temp[i][2];
	    pot_array_temp[i][0] = -1;
	    pot_array_temp[i][1] = -1;
	    pot_array_temp[i][2] = 0;
	}
    }
    
    public void make_note(int i, int i_20_, int i_21_, int i_22_, int i_23_) {
	if (i_21_ > 0) {
	    display[i][i_20_] = 2;
	    outlet(1, new Atom[] { Atom.newAtom(i_21_), Atom.newAtom(i_22_),
				   Atom.newAtom(i_23_) });
	}
    }
    
    public void start_make_note(int i, int i_24_, int i_25_, int i_26_,
				int i_27_) {
	if (i_25_ > 0) {
	    outlet(0, new Atom[] { Atom.newAtom(i), Atom.newAtom(i_24_),
				   Atom.newAtom((int) 2) });
	    outlet(1, "start",
		   new Atom[] { Atom.newAtom(i_25_), Atom.newAtom(i_26_),
				Atom.newAtom(i_27_) });
	}
    }
    
    public void loopstart() {
	for (int i = 0; i < part_limit; i++) {
	    pot_array_temp[i][0] = -1;
	    pot_array_temp[i][1] = -1;
	    pot_array_temp[i][2] = 0;
	}
	for (int i = 0; i < 16; i++) {
	    for (int i_28_ = 0; i_28_ < 16; i_28_++) {
		if (prog[i][i_28_][24] > 0)
		    add_potential(i, i_28_, 4);
	    }
	}
    }
    
    public void set(int i, int i_29_, int i_30_, int i_31_) {
	prog[i][i_29_][i_30_] = i_31_;
    }
}

