autowatch = 1;

var DEBUG = false;

var script = this;
var BIG = [96, 64, 32, 0];
var ALPHA = [' ', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z',
				'!', '#', '$', '%', '&', '(', ')', '*', '?', '@'];

var sysex = [];
for(var i=0;i<193;i++)
{
	sysex[i]==0;
}

var funcs = [['lfosource', 47, 'div16', 68],
			['lfodest', 48, 'div16', 69],
			['osc1oct', 50, 'min16div16', 74],
			['osc2oct', 51, 'min16div16', 75],
			['lforate', 60, 'ret', 3],
			['va', 86, 'ret', 28],
			['vd', 89, 'ret', 29],
			['vs', 92, 'ret', 30],
			['vr', 95, 'ret', 31],
			['fa', 98, 'ret', 23],
			['fd', 101, 'ret', 24],
			['fs', 104, 'ret', 25],
			['fr', 107, 'ret', 26],
			['osc1wave', 113, 'ret', 9],
			['osc1lvl', 116, 'ret', 15],
			['glide', 119, 'ret', 5],
			['osc2wave', 126, 'ret', 11],
			['osc2lvl', 129, 'ret', 16],
			['osc2freq', 131, 'ret', 10],
			['cutoff', 134, 'ret', 19],
			['res', 137, 'ret', 21],
			['kb', 140, 'ret', 22],
			['eg', 143, 'ret', 27],
			['oi', 146, 'ret', 18],
			['modamnt', 158, 'ret', 6]];

var cntl_funcs = [[7, 'volume', 'ret'],
				[65, 'glideenable', 'div64']];

var ladder = {'alive':false};
var ladder_obj = ['ladder_key_follow', 'ladder_cutoff', 'ladder_filter_envelope', 'ladder_filter_attack', 'ladder_filter_decay',
				'ladder_filter_sustain', 'ladder_filter_release', 'ladder_amp_attack', 'ladder_amp_decay',
				'ladder_amp_sustain', 'ladder_amp_release', 'ladder_resonance', 'ladder_shape', 
				'ladder_osc1_wave', 'ladder_osc1_volume', 'ladder_osc1_octave', 'ladder_oscsync',
				'ladder_osc2_wave', 'ladder_osc2_volume', 'ladder_osc2_octave', 'ladder_osc2_tune',
				'ladder_port', 'ladder_volume'];

var assgns = [];
for(var i=0;i<193;i++)
{
	assgns[i]=0;
}

var cntls = [];
for(var i=0;i<128;i++)
{
	cntls[i]='none';
}

for(var i in funcs)
{
	assgns[funcs[i][1]] = funcs[i][0];
	cntls[funcs[i][3]] = [funcs[i][0], funcs[i][2]];
}

for(var i in cntl_funcs)
{
	cntls[cntl_funcs[i][0]] = [cntl_funcs[i][1], funcs[i][2]];
}


function list()
{
    var args = arrayfromargs(arguments);
    //post(args.length, args);
	if((args.length == 193)&&(sysex.length > 0))
	{
		//post('dump: checking....\n');
		for(var i=24;i<40;i++)
		{
			if(args[i] != sysex[i])
			{
				post('item', i, 'changed, old:', sysex[i], 'new:', args[i], '\n');
			}
		}
		decode_pgm(args);
	}
	else if(args[0] == 192)
	{
		pgm_change(args[1]);
		return;
	}
	else if(args[0] == 176)
	{
		cntl_in(args[1], args[2]);
	}
	if(args.length == 193)
	{
		sysex = args;
	}
}

function pgm_change(num)
{
	outlet(0, 240, 4, 5, 6, 4, num, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247);
}

function decode_pgm(args)
{
	for(var i in args)
	{
		if((assgns[i]!=0)&&(script[assgns[i]]))
		{
			script[assgns[i]](args);
		}
	}
	var name = [];
	for(var i=24;i<37;i++)
	{
		name.push(ALPHA[args[i]]);
	}
	this.patcher.getnamed('patchname').set(name.join(''));
}

function osc1_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 74, (val*16) + 16);
			if(ladder.alive){ladder.ladder_osc1_octave.message('float', val);}
			break;
		case 1:
			outlet(0, 176, 9, val);
			if(ladder.alive){ladder.ladder_osc1_wave.message('float', ((val/127)*100));}
			break;
		case 2:
			outlet(0, 176, 15, val);
			if(ladder.alive){ladder.ladder_osc1_volume.message('float', ((val/127)*100));}
			break;
	}
}

function osc2_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 75, (val*16) + 16);
			if(ladder.alive){ladder.ladder_osc2_octave.message('float', val);}
			break;
		case 1:
			outlet(0, 176, 11, val);
			if(ladder.alive){ladder.ladder_osc2_wave.message('float', ((val/127)*100));}
			break;
		case 2:
			outlet(0, 176, 16, val);
			if(ladder.alive){ladder.ladder_osc2_volume.message('float', ((val/127)*100));}
			break;
		case 3:
			outlet(0, 176, 10, val);
			if(ladder.alive){ladder.ladder_osc2_tune.message('float', ((val/127)*200)-100);}
			break;
	}
}

function filter_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 19, val);
			if(ladder.alive){ladder.ladder_cutoff.message('float', val-32);}
			break;
		case 1:
			outlet(0, 176, 21, val);
			if(ladder.alive){ladder.ladder_resonance.message('float', (val/127)*100);}
			break;
		case 2:
			outlet(0, 176, 22, val);
			if(ladder.alive){ladder.ladder_key_follow.message('float', (val/127)*100);}
			break;
		case 3:
			outlet(0, 176, 27, val);
			if(ladder.alive){ladder.ladder_filter_envelope.message('float', val-36);}
			break;
		case 4:
			outlet(0, 176, 18, val);
			break;
		case 5:
			outlet(0, 176, 110, val);
			break;
	}
}

function modulation_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 3, val);
			break;
		case 1:
			outlet(0, 176, 6, val);
			break;
		case 2:
			outlet(0, 176, 68, val*16);
			break;
		case 3:
			outlet(0, 176, 69, val*16);
			break;
		case 4:
			outlet(0, 176, 102, val*64);
			break;
		case 5:
			outlet(0, 176, 103, val*6);
			break;
		case 6:
			outlet(0, 176, 104, val*64);
			break;
		case 7:
			outlet(0, 176, 105, val*64);
			break;
		case 8:
			outlet(0, 176, 106, val*25);
			break;
	}
}

function vol_env_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 28, val);
			if(ladder.alive){ladder.ladder_amp_attack.message('float', (val/127)*10000);}
			break;
		case 1:
			outlet(0, 176, 29, val);
			if(ladder.alive){ladder.ladder_amp_decay.message('float', (val/127)*10000);}
			break;
		case 2:
			outlet(0, 176, 30, val);
			if(ladder.alive){ladder.ladder_amp_sustain.message('float', (val/127)*100);}
			break;
		case 3:
			outlet(0, 176, 31, val);
			if(ladder.alive){ladder.ladder_amp_release.message('float', (val/127)*10000);}
			break;
	}
}

function filt_env_out(num, val)
{
	switch(num)
	{
		case 0:
			outlet(0, 176, 23, val);
			if(ladder.alive){ladder.ladder_filter_attack.message('float', (val/127)*10000);}
			break;
		case 1:
			outlet(0, 176, 24, val);
			if(ladder.alive){ladder.ladder_filter_decay.message('float', (val/127)*10000);}
			break;
		case 2:
			outlet(0, 176, 25, val);
			if(ladder.alive){ladder.ladder_filter_sustain.message('float', (val/127)*100);}
			break;
		case 3:
			outlet(0, 176, 26, val);
			if(ladder.alive){ladder.ladder_filter_release.message('float', (val/127)*10000);}
			break;
	}
}

function syncosc(args)
{
	this.patcher.getnamed('syncosc').set(Math.floor(args[45]!=25));
}

function lfosource(args)
{
	this.patcher.getnamed('lfosource').set(args[47]/4);
}

function lfodest(args)
{
	this.patcher.getnamed('lfodest').set(args[48]);
}

function osc1oct(args)
{
	this.patcher.getnamed('osc1oct').set(args[50]/4);
}

function osc2oct(args)
{
	this.patcher.getnamed('osc2oct').set(args[51]);
}

function lforate(args)
{
	this.patcher.getnamed('lforate').set(BIG[args[60]%4]+Math.floor(Math.abs(args[61]-64)/2));
}

function va(args)
{
	this.patcher.getnamed('va').set(BIG[args[86]%4]+Math.floor(Math.abs(args[87]-64)/2));
}

function vd(args)
{
	this.patcher.getnamed('vd').set(BIG[args[89]%4]+Math.floor(Math.abs(args[90]-64)/2));
}

function vs(args)
{
	this.patcher.getnamed('vs').set(BIG[args[92]%4]+Math.floor(Math.abs(args[93]-64)/2));
}

function vr(args)
{
	this.patcher.getnamed('vr').set(BIG[args[95]%4]+Math.floor(Math.abs(args[96]-64)/2));
}

function fa(args)
{
	this.patcher.getnamed('fa').set(BIG[args[98]%4]+Math.floor(Math.abs(args[99]-64)/2));
}

function fd(args)
{
	this.patcher.getnamed('fd').set(BIG[args[101]%4]+Math.floor(Math.abs(args[102]-64)/2));
}

function fs(args)
{
	this.patcher.getnamed('fs').set(BIG[args[104]%4]+Math.floor(Math.abs(args[105]-64)/2));
}

function fr(args)
{
	this.patcher.getnamed('fr').set(BIG[args[107]%4]+Math.floor(Math.abs(args[108]-64)/2));
}

function osc1wave(args)
{
	this.patcher.getnamed('osc1wave').set(BIG[args[113]%4]+Math.floor(Math.abs(args[114]-64)/2));
}

function osc1lvl(args)
{
	this.patcher.getnamed('osc1lvl').set(BIG[args[116]%4]+Math.floor(Math.abs(args[117]-64)/2));
}

function glide(args)
{
	this.patcher.getnamed('glide').set(BIG[args[119]%4]+Math.floor(Math.abs(args[120]-64)/2));
}

function osc2wave(args)
{
	this.patcher.getnamed('osc2wave').set(BIG[args[126]%4]+Math.floor(Math.abs(args[127]-64)/2));
}

function osc2lvl(args)
{
	this.patcher.getnamed('osc2lvl').set(BIG[args[129]%4]+Math.floor(Math.abs(args[130]-64)/2));
}

function osc2freq(args)
{
	this.patcher.getnamed('osc2freq').set(BIG[args[131]%4]+Math.floor(Math.abs(args[132]-64)/2));
}

function cutoff(args)
{
	this.patcher.getnamed('cutoff').set(BIG[args[134]%4]+Math.floor(Math.abs(args[135]-64)/2));
}

function res(args)
{
	this.patcher.getnamed('res').set(BIG[args[137]%4]+Math.floor(Math.abs(args[138]-64)/2));
}

function kb(args)
{
	this.patcher.getnamed('kb').set(BIG[args[140]%4]+Math.floor(Math.abs(args[141]-64)/2));
}

function eg(args)
{
	this.patcher.getnamed('eg').set(BIG[args[143]%4]+Math.floor(Math.abs(args[144]-64)/2));
}

function oi(args)
{
	this.patcher.getnamed('oi').set(BIG[args[146]%4]+Math.floor(Math.abs(args[147]-64)/2));
}

function modamnt(args)
{
	this.patcher.getnamed('modamnt').set(BIG[args[158]%4]+Math.floor(Math.abs(args[159]-64)/2));
}

function cntl_in(num, val)
{
	if(DEBUG){post('cntl_in', num, val, '\n');}
	if(cntls[num]!='none')
	{
		this.patcher.getnamed(cntls[num][0]).set(script[cntls[num][1]](val));
	}
}

function ret(val)
{
	return val;
}

function div16(val)
{
	var temp = Math.floor(val/16)
	return temp;
}

function min16div16(val)
{
	var temp = Math.floor((val-16)/16);
	return temp;
}

function div64(val)
{
	var temp = Math.floor(val/64);
	return temp;
}

function glideenable_out(val){}

function volume_out(val){
	if(ladder.alive){ladder.ladder_volume.message('float', (val/127)*100);}
}

function syncosc_out(val){
	if(ladder.alive){ladder.ladder_oscsync.message('float', val);}
}

function glide_out(val){
	if(ladder.alive){ladder.ladder_port.message('float', (val/127)*100);}
}

function init_ladder(val)
{
	if(val)
	{
		ladder = {};
		var ladder_patcher = this.patcher.getnamed('ladder');
		for(var i = 0;i<ladder_obj.length;i++)
		{
			ladder[ladder_obj[i]] = ladder_patcher.subpatcher().getnamed(ladder_obj[i]);
		}
		ladder.alive = true;
	}
	else
	{
		ladder.alive = false;
	}
}