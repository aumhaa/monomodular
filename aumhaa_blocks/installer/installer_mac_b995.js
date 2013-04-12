autowatch = 1;

inlets = 2;
outlets = 2;

var DEBUG = 0;

var script = this;

var overlay;
var ui = [];
var major = 0
var ui_objects = ['installpkgui', 'liveappui', 'maxmspui', 'm4lui'];
var filepaths = ['none', 'none', 'none', 'none'];
var prependshell = this.patcher.getnamed('prependshell');
var subui = this.patcher.getnamed('subui');
var terminal = this.patcher.getnamed('terminal');
var meter = this.patcher.getnamed('meter');
var verstr='b995';
var revnum = '';
var regexp = [];
regexp.docscheck = new RegExp(/(Directories: Documents: Check)/);
regexp.docs = new RegExp(/(Directories: Documents: )/);
regexp.docs_rmv = new RegExp(/(Docs\/)/);
regexp.docs_rmv_new = new RegExp(/(LegalAndDocs\/)/);
regexp.contents = new RegExp(/(\/Contents\/)/);
regexp.presetscheck = new RegExp(/(Directories: Presets: Check)/);
regexp.presets = new RegExp(/(Directories: Presets: )/);
regexp.patch_rmv = new RegExp(/(\/installer.amxd)/);

var hints = ['pathhint[0]', 'pathhint[1]', 'pathhint[2]', 'pathhint[3]', 'pathboxhint', 'subversionhint', 'installhint', 'bloghint', 'helphint', 'terminalhint', 'progresshint', 'blockhint'];
var install_pkg_check_items = ['L9 Python Scripts', 'Python Scripts', 'Java', 'aumhaa_blocks', 'monomodular', 'Monomodular_'+verstr];
var liveapp_check_items = ['_Framework', '_Generic', '_MxDCore'];
var maxmsp_check_items = ['java', 'classes'];
var m4l_check_items = ['MIDI Effects']; 

var install_dev = 0;
var payload = [];
var delivering = false;
var del_deliver = new Task(deliver, this);

var installed = 0;

const cant_verify_error = 'could not verify path, please try selecting it manually';
const install_wiki_addy = ['http://www.aumhaa.com/wiki/index.php?title=Installation', 'http://www.aumhaa.com/wiki/index.php?title=Getting_Started'];
const blog_addy = 'http://www.aumhaa.com/wp/';

var svn_checkout_string = 'svn checkout http://monomodular.googlecode.com/svn/trunk/';
var svn_url = 'http://monomodular.googlecode.com/svn/trunk/';
var error_tag = '2>&1';

var subversion_path='none';
var prefs_path;
var live_path;
var home_path;
var patch_path;
var scripts_txt = 0;
var scripts_txt_path = 'none';
var apppath;
var root;
var live_app;

var os = this.max.os;

var alive = 0;

const guided_advice = ['The installation package can\'t be found.  Please select it manually or download it by pressing \"Subversion\" button',
					'The path to your Live application bundle can\'t be found.  Please select it manually.  (default path: ~/Applications/Live 8.x.x/Live.app', 
					'The path to your Max installation folder can\'t be found.  Please select it manually.  (default path: ~/Applications/Max5)',
					'The path to your Live presets can\'t be found.  Please select it manually.  (default path: ~/Library/Application Support/Ableton/Library/Presets)'];

function callback(){}

function home(path)
{
	home_path = path;
	terminal.message('set', 'home:', path);
}

//function init(){}

function init()
{
	alive = 1;
	live_app = new LiveAPI(callback, 'live_app');
 	major=live_app.call("get_major_version");
	if(DEBUG){post('major', major, '\n');}
	var minor=live_app.call('get_minor_version');
	var bugfix=live_app.call('get_bugfix_version');
	live_version = (major+'.'+minor+'.'+bugfix);
	post(live_version, 'is live version\n');
	if(DEBUG){post('platform:', os, '\n');}
	if(os!='macintosh')
	{
		notify_wrong_installer();
		return;
	}
	for(item in hints)
	{
		this.patcher.getnamed(hints[item]).message('enabled', 1);
	}
	meter.message('float', 0.);
	terminal.message('set', 'initializing.....');
	for(item in ui_objects)
	{
		ui[ui_objects[item]] = this.patcher.getnamed(ui_objects[item]);
		ui[ui_objects[item]].message('set', filepaths[item]);
	}
	find_installer_pkg();
	apppath = this.max.apppath;
	root = apppath.split('/')[0];
	select_path(2, apppath);
	var found_log = false;
	var m = new Folder(root+home_path+'/Library/Preferences/Ableton');
	if(DEBUG){post('looking for log @:', m.pathname, '\n');}
	while((!m.end)&&(found_log==false))
	{
		while((!m.end)&&(found_log==false))
		{
			if(DEBUG){post(m.filename);}
			//if(regexp.abe_vers[vers].test(m.filename)==1)
			if(m.filename == ('Live '+live_version))
			{
				if(DEBUG){post('log in ', m.filename);}
				prefs_path = m.pathname+'/'+m.filename;
				found_log=true;
				break;
			}
			m.next();
		}
	}
	if((found_log == true)&&(prefs_path != undefined))
	{
		var n = new Folder(prefs_path);
		while(!n.end)
		{
			if(n.filename == 'Log.txt')
			{
				var log_path = n.pathname+'/'+n.filename;
				terminal.message('set', 'found log file, reading file locations...\n');
				if(DEBUG){post('found log file, reading file locations...\n');}
				load_log(log_path);
				break;
			}
			n.next();
		}
	}
	if(found_log == false)
	{
		post('Installer could not find Live\'s log file.');
	}
	terminal.message('set', 'Ready.');
	guided_install();
}

function dev(val)
{
	install_dev = val;
}

function find_installer_pkg()
{
	patch_path = this.patcher.filepath;
	if(DEBUG){post('file path', patch_path, '\n');}
	//var new_path = patch_path.replace(regexp.patch_rmv, '');
	//var new_path = patch_path.slice(0, patch_path.lastIndexOf('/'));
	//post('file path new', new_path, '\n');
	select_path(0, patch_path);
}

function load_log(path)
{
	terminal.message('set', 'reading Live\'s Log.txt...');
	log_file = new File(path);
	if(DEBUG){post('log file @:', log_file.filename, '\n');}
	while(log_file.position < log_file.eof)
	{
		var line = log_file.readline(200);
		var a = line.split('ms.');
		if(regexp.docscheck.test(a[1])==1)
		{
			line = log_file.readline(200);
			var b = line.split('ms.');
			if(regexp.docs.test(b[1])==1)
			{
				if(DEBUG){post('log test path:', b[1], '\n');}
				var new_path = b[1].replace(regexp.docs, '');
				new_path = new_path.slice(1);
				new_path = new_path.replace(regexp.docs_rmv, '');
				new_path = new_path.replace(regexp.docs_rmv_new, '');
				live_path = root+new_path+'Live.app';
				if(DEBUG){post('select path:', live_path, '\n');}
				select_path(1, live_path);
				if(filepaths[1]==cant_verify_error)
				{
					new_path = new_path.replace(regexp.contents, '');
					live_path = root+new_path;
					if(DEBUG){post('select path:', live_path, '\n');}
					select_path(1, live_path);
				}
				//var c = new Folder(live_path);
				//while(!c.end)
				//{
				//	if(c.filename == 'monomod_version.txt')
				//	{
				//		scripts_txt_path = c.pathname+'/'+c.filename;
				//		check_scripts_version(scripts_txt_path);
				//		break;
				//	}
				//	c.next();
				//}
				//break;
			}
		}
	}
	log_file.close();
	log_file.open();
	while(log_file.position < log_file.eof)
	{
		var line = log_file.readline(200);
		var a = line.split('ms.');
		if(regexp.presetscheck.test(a[1])==1)
		{
			line = log_file.readline(200);
			var b = line.split('ms.');
			if(regexp.presets.test(b[1])==1)
			{
				var new_path = b[1].replace(regexp.presets, '');
				new_path = new_path.slice(1, new_path.lastIndexOf('/'));
				new_path = new_path.slice(0, new_path.lastIndexOf('/'));
				if(DEBUG){post('presets is at:', new_path, '\n');}
				select_path(3, root+new_path);
				//break;
			}
		}
	}
	log_file.close();
}

function load_log()
{}

function check_scripts_version(path)
{
	var file = new File(path);
 	script_txt = file.readline(10);
	terminal.message('set', 'scripts version:', script_txt);
}

function to_shell()
{
	args = arrayfromargs(arguments);
	if(DEBUG){post('out_to_shell', args, '\n');}
	outlet(1, args.join(' '));
}

function shell()
{
	if(alive > 0)
	{
		args = arrayfromargs(arguments);
		if(DEBUG){post('from shell:\n', args, '\n');}
		terminal.message('set', args.join(''));
		terminal.message("presentation_rect", 646, 49, 215, 40);
	}
}

function to_term()
{
	var args = arrayfromargs(arguments);
	if(DEBUG){post('term', args, '\n');}
	terminal.message('set', args.join(' '));
	terminal.message("presentation_rect", 646, 49, 215, 40);
}				

function select_path()
{
	var uis = [ui.installpkgui, ui.liveappui, ui.maxmspui, ui.m4lui];
	args = arrayfromargs(arguments);
	if(DEBUG){post('select path', args, '\n');}
	var verified = verify_path(args[0], args[1]);
	//if(verified != cant_verify_error)
	//{
	//	post('select_path:\n', args[0], '\n');
	filepaths[args[0]] = verified;
	//}
	uis[args[0]].message('set', verified);
	guided_install();
}

function verify_path(num, path)
{
	return script['verify_path'+num](num, path);
}

//find the installer package path
function verify_path0(num, path)
{
	if(DEBUG){post('verify0', path, '\n');}
	var found = false;
	var folder = new Folder(path);
	for(item in install_pkg_check_items)
	{
		if(DEBUG){post(install_pkg_check_items[item], '\n');}
		while((!folder.end)&&(found==false))
		{
			if(folder.filename == install_pkg_check_items[item])
			{
				found = true;
			}
			folder.next();
		}
		if(found == false)
		{
			if(DEBUG){post('Installer package missing', install_pkg_check_items[item], '\n');}
			path = cant_verify_error;
			break;
		}
	}
	if(found == true)
	{
		var version_file = new File(folder.pathname+'Monomodular/readme.txt');
		if(version_file.filetype=='TEXT')
		{
			if(DEBUG){post('filetype', version_file.filetype, '\n');}
			revnum = version_file.readline(6);
			this.patcher.getnamed('v_tag').message('set', 'version '+verstr+'r'+revnum);
			post('monomodular revnum:', revnum, '\n');
		}
	}
	else
	{
		this.patcher.getnamed('v_tag').message('set', 'no version data detected');
	}
	hilite_text(num, found);
	//post('path', path.replace(/\/$/, ''));
	return path.replace(/\/$/, '');
}

//find the Live Application path
function verify_path1(num, path)
{
	if(DEBUG){post(path, '\n');}
	var folder = new Folder(path+'/Contents/App-Resources/MIDI Remote Scripts');
	var found = false;
	for(item in liveapp_check_items)
	{
		found = false;
		while((!folder.end)&&(found==false))
		{
			if(folder.filename == liveapp_check_items[item])
			{
				found = true;
			}
			folder.next();
		}
		if(found == false)
		{
			path = cant_verify_error;
			break;
		}
	}
	hilite_text(num, found);
	return path;
}

function verify_path2(num, path)
{
	var folder = new Folder(path+'/Cycling \'74');
	var found = false;
	while((!folder.end)&&(found==false))
	{
		if(folder.filename == 'java')
		{
			var folder2 = new Folder(folder.pathname+'/java');
			while((!folder2.end)&&(found==false))
			{
				if(folder2.filename == 'classes')
				{						
					found = true;
				}
				folder2.next();
			}
		}
		folder.next();	
	}
	if(found == false)
	{
		path = cant_verify_error;
	}
	hilite_text(num, found);
	return path;
}

function verify_path3(num, path)
{
	var folder = new Folder(path+'/Presets');
	var found = false;
	for(item in m4l_check_items)
	{
		found = false;
		while((!folder.end)&&(found==false))
		{
			if(folder.filename == m4l_check_items[item])
			{
				found = true;
			}
			folder.next();
		}
		if(found == false)
		{
			path = cant_verify_error;
			break;
		}
	}
	hilite_text(num, found);
	return path;
}

function hilite_text(num, val)
{
	var uis = [ui.installpkgui, ui.liveappui, ui.maxmspui, ui.m4lui];
	if(val == false)
	{
		uis[num].message('textcolor', 1., 0., 0.2, 1.);
	}
	else
	{
		uis[num].message('textcolor', .86, .86, .86, 1.);	
	}
}

function SVN()
{
	Subversion();
}

function Subversion()
{
	if(subversion_path=='none')
	{
		subui.message('bang');
	}
	else
	{
		var path = subversion_path.replace(root, '');
		//shell('checkout to:', subversion_path.replace(root, ''), svn_url, '\n');
		to_term('Please wait while the Installation Package is downloading...');
		prependshell.message('set', 'finish_subversion');
		to_shell('svn export \''+svn_url+'\' \''+path+'Monomodular_'+verstr+'_Content/\' '+error_tag);
	}
}

function select_sub_path(path)
{
	if(DEBUG){post('sub path:', path, '\n');}
	subversion_path = path;
	Subversion();
}

function finish_subversion()
{
	var args = arrayfromargs(arguments);
	if(args[0] == 'bang')
	{
	
		prependshell.message('set', 'shell');
		select_path(0, subversion_path+'Monomodular_'+verstr+'_Content/');
		to_term('Finished downloading Installation Package');
	}
	//else if(regexp.revision.test(args.join(' '))==1)
	//{
	//	revnum = args.join(' ').replace(regexp.revision, '').replace('\.', '').replace(' ', '');
		//post('SVN version', args.join(' ').replace(regexp.revision, ''), '\n');
		//post('revnum', revnum, '\n');
	//}
	else
	{
		to_term(args.join(' '));
	}
}

function Install()
{
	var proceed = true;
	for(var item in filepaths)
	{
		if(DEBUG){post('filepath', item, filepaths[item], '\n');}
		if((filepaths[item]=='none')||(filepaths[item]==cant_verify_error))
		{
			proceed = false;
			break;
		}
	}
	if(proceed == false)
	{
		to_term('There are bad file paths...read the help file for more details on how to fix them');
	}
	else
	{
		build_payload();
	}
}

function build_payload()
{
	prependshell.message('set', 'payload_received');
	payload[0] = ('cp -R -f \"'+filepaths[0].replace(root, '')+'/aumhaa_blocks\" \"'+filepaths[2].replace(root, '')+'/patches\" ' +error_tag);
	payload[1] = ('cp -R -f \"'+filepaths[0].replace(root, '')+'/Java/\" \"'+filepaths[2].replace(root, '')+'/Cycling \'74/java/classes\" ' +error_tag);
	payload[2] = ('mkdir ~/Desktop/Monomodular_'+verstr+'r'+revnum+' '+error_tag);
	payload[3] = ('cp -R -H -f \"'+filepaths[0].replace(root, '')+'/Monomodular/\" ~/Desktop/Monomodular_'+verstr+'r'+revnum+' '+error_tag);
	if(major<9)
	{
		payload[4] = ('mkdir \"'+filepaths[3].replace(root, '')+'/MIDI Effects/Max MIDI Effect/Monomodular_'+verstr+'r'+revnum+'\" '+error_tag);
		payload[5] = ('cp -R -f \"'+filepaths[0].replace(root, '')+'/Monomodular_'+verstr+'/\" \"'+filepaths[3].replace(root, '')+'/Presets/MIDI Effects/Max MIDI Effect/Monomodular_'+verstr+'r'+revnum+'\" ' +error_tag);
	}
	else
	{
		payload[4] = ('mkdir ~/Desktop/Monomodular_'+verstr+'r'+revnum+'/Patches '+error_tag);
		payload[5] = ('cp -R -f \"'+filepaths[0].replace(root, '')+'/Monomodular_'+verstr+'/\" ~/Desktop/Monomodular_'+verstr+'r'+revnum+'/Patches '+error_tag);
	}
	var folder = new Folder(filepaths[0]+'/L'+major+' Python Scripts');
	folder.next();
	//folder.next(); //we'd do this if we wanted to skip past any svn files, since Max's file system can't chew on them
	while(!folder.end)
	{
		if(DEBUG){post('building:', folder.filename, folder.filetype, '\n');}
		if(major<9)
		{
			payload.push('mkdir \"'+filepaths[1].replace(root, '')+'/Contents/App-Resources/MIDI Remote Scripts/'+folder.filename+'r'+revnum+'\" '+error_tag);
			payload.push('cp -R -f \"'+filepaths[0].replace(root, '')+'/L8 Python Scripts/'+folder.filename+'/\" \"'+filepaths[1].replace(root, '')+'/Contents/App-Resources/MIDI Remote Scripts/'+folder.filename+'r'+revnum+'\" '+error_tag);
		}
		else
		{
			payload.push('mkdir \"'+filepaths[1].replace(root, '')+'/Contents/App-Resources/MIDI Remote Scripts/'+folder.filename+'\" '+error_tag);
			payload.push('cp -R -f \"'+filepaths[0].replace(root, '')+'/L9 Python Scripts/'+folder.filename+'/\" \"'+filepaths[1].replace(root, '')+'/Contents/App-Resources/MIDI Remote Scripts/'+folder.filename+'\" '+error_tag);
		}
		folder.next();
	}
	if(install_dev)
	{
		payload.push('cp -R -f \"'+filepaths[0].replace(root, '')+'/aumhaa_blocks/mod_clippings_'+verstr+'\" \"'+filepaths[2].replace(root, '')+'/patches/clippings\" ' +error_tag);
	}
	payload.delivering = 0;
	deliver();
}

function deliver()
{
	delivering = true;
	meter.message('float', parseFloat(payload.delivering/payload.length));
	if(payload.delivering < payload.length)
	{
		to_term(payload[payload.delivering]);
		to_shell(payload[payload.delivering]);
	}
	else
	{
		installed = 1;
		to_term('Installation complete! You will need to restart Live in order for the new Control scripts to be available.  Please hit the \? button to read instructions on how to get started with Monomodular.');
		//meter.message('float', 0.0);
		delivering = false;
		prependshell.message('set', 'shell');
	}
}

function payload_received()
{
	var args = arrayfromargs(arguments);
	if(args[0] == 'bang')
	{
		if(DEBUG){post('bang at pay-rec\n');}
		payload.delivering+=1;
		del_deliver.schedule(1000);
	}
	else
	{
		if(DEBUG){post('payload rcvd:', args.join(' '), '\n');}
		to_term(args.join(' '));
	}
}
			
function help()
{
	this.max.launchbrowser(install_wiki_addy[installed]);
}
				
function Blog()
{
	this.max.launchbrowser(blog_addy);
}				

function guided_install()
{
	var proceed = true;
	for(var item in filepaths)
	{
		if(DEBUG){post('filepath', item, filepaths[item], '\n');}
		if((filepaths[item]=='none')||(filepaths[item]==cant_verify_error))
		{
			proceed = false;
			break;
		}
	}	
	if(proceed == true)
	{
		to_term('It appears that all filepaths are correct, you may press the \"Install\" button to proceed with the installation');
	}
	else
	{
	 	to_term(guided_advice[item]);
	}
}

function notify_wrong_installer()
{
	post('wrong installer version...this is for macintosh');
	//this.patcher.wind.setlocation(0, 0, 1200, 1200);
	overlay = this.patcher.newdefault(0, 0, "textbutton", "@presentation", 1, "@presentation_rect", 5, 5, 922, 163, "@text", 'wrong_OS_version');
	this.patcher.bringtofront(overlay);
	for(item in hints)
	{
		this.patcher.getnamed(hints[item]).message('enabled', 0);
	}
}


