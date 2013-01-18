011712

Added some preliminary b995 Python scripts and patch files.  Changelog to come when I have time to add the rest of the stuff...

110912

Fixed another bug in Hex's init pattr, now it should recall state of selected sequence correctly.

Hopefully fixed problem with CNTRLR MonoDeviceComponent disconnect().

Added new version of MaxLooper with tighter timing for relative mode.  Hopefully tightens up Quantize mode, as well.

Added new versions of loopmaster to support new routines in MaxLooper.

Added new version of plinko, small changes to presets and MIDI window.  Also added capability to suspend processing in patch when it is turned off.

Added new version of life, small changes to MIDI window.  Also added capability to suspend processing in patch when it is turned off.

Added new version of aumboids, main routines are now written in Java and should be much faster.  Shouldn't interfere with Python and js routines in other patches now.  Also added capability to suspend processing in patch when it is turned off.



102312

Fixed initialization in Hex's pattr scheme.  

Fixed LaumerPad flashing function.

Added scripting capabilities Plinko and Monotes.

Updated all mods again to add bugfixes for med.'s.

Updated Hex to work with Plinko.

Updated Plinko to work with Hex triggering.

Updated AumTroll and CNTRLR scripts to reflect current state of MonoDeviceComponent as it exists in OhmModes working version.

Updated Codec script to version 2.

Updated all Codec mods to work with current Codec version.

Updated Hex with Poly mode and several features and fixes.


092912

Updated all mods to Max6 compatibility.

Added Hex mod.

Added CNTRLR compatibility for Codec mods.

Added AumTroll Python script for use of CNTRLR in conjunction with MonOhm.


032312

fixed flashing scene buttons in AumPC20 Script

fixed a few indent problems in several scripts.

fixed backwards behavior of LedCol, LedRow, and LedMap in MonoLinkClient.

added SerialOSC compatibility to monolink mod, renamed modlink.






031112


fix Win7 installer (why won't it install Remote Scripts?) ---because its stoopid.

add version stamp to installer window - done.

recompiled every freakin patch because batch and mask didn't have a gate, and for some reason the MIDI window was the wrong size even though I double checked it.

add optional installs for installer - nope, we're going the other way‚Ä¶less is more‚Ä¶I'll add the SVN stuff back in for the maintenance releases.

Fixed bug in some of the scripts that were using a color_map to assign colors to the nav box.

Fixed bug in all scripts with _select_device closure.

Added support for new MonoLinkComponent to all Scripts (uh, this is a big deal!).

Added indicators for mute and power state while holding alt and pressing shift.

added new port dependencies to aumblocks

help - added mute object to clippings

fixed timing in life (and checked others for triplet/coll reference)

fixed midi settings window in xor

lemur - removed bonjour browser from view

aumboids - removed extra zero from funnel object

AumPadLemur:  	crossfader fixed
	      	changed default threshold
		fixed x/y pads

added Lemur Code object.

all mods:  fixed swing reporting

ported new mods:  grainstorm,  xor, clipchopper.

MonomodComponent - fix select instrument --can't be fixed.  Chain views cant' be accessed through API.

binary - fixed default value for velocity 
binary - fixed masking on page 5 
binary - fixed page 4 flashing 
binary - fix startup play status - dependent upon initial value, which is triggered by pattr - needs a rewrite.
binary - fixed flush when changing exclusive channels 
binary - enabled non-exclusive channelling 

fixed linked Device selection in Codec script 

all mods:  changed midi_and_timing abstract to support mute, exclusive channel mode, and mute functionalities.

monotes:  added sustain functionality to key 8.

mod:  repaired restore_saved_data() function‚Äö√Ñ¬∂things should update correctly now if sent to the mod when its not connected to a client slot.

Added Alt-Key7:View active client to standard MonomodComponent.

Monomodular:  removed 'ping disconnect' from disconnect(), was causing exception due to misplaced callback.

monotes:  added key functionality for changing Thru and port assignment on the fly.

Monomodular:  added 'hotwire' function for inter-mod communication and scripting.  Why didn't I think of that before?

MonOhm, AumPad, LaumerPad, BlockMod:  added filter to prevent Device from locking to selected track every time that Shift is pressed and 'Device selection follows track selection' is set.  Will probably need some additional work to get desired behavior.  Also changed the DeviceSelectorComponent so that it didn't rechoose the last chosen device on every update.  Things appear to be working as originally desired now.

MonOhm, AumPad, LaumerPad, BlockMod:  Fixed set_buttons() to prevent updating (which was causing unintentional reselection of assigned device).

endcoders: fixed bug in parameter binding that caused linked parameter to jump around.

Monomodular.py/Mod.js:  added version checking and mismatch reporting.

Monomodular:  added sandbox for editing patches in Max edit mode.  Will no longer crash or throw errors when switching between modes or saving patches (well, mostly).

monomods:  changed name of js to 'mods'.  Added new switchboard functionality for switching between Max edit mode and Live mode without crashing.

OhmModes:  Updated to 1.15 and added support for LCD.

AumPC40:  Fixed device component (why didn't anyone tell me it was broken?).

AumPC20:  Added up/down navigation for 256grid on Scene Launch buttons 3&4.

New Patch:  LCD.  Combines all LCD patches, adding support for Livid's new CNTRL:R, AumPC40, and AumPC20.

Added 2 new functions to ControlSurface instance for use with new LCD patches:   touched() and check_touch()

Added new function and changes to EncoderElement for use with the new LCD.

All mods:  changed parameter ordering to make it easier to get to certain features from the device controller. Also fixed some parameter control issues where certain parameters were not controlled correctly.

Codec and BlockMod: added user SHIFT_THRESH setting to Map file so that double-press sensitivity can be set manually.

All mods: added [mod_chan] (where applicable) and [wiki] objects and repackaged.

All mods: changed naming convention so that mods are always lower-case, non-mods are upper case.

aumboids:  added hover texts describing functions.

aumboids:  added assignment popup for note/mode/duration of each agent.

aumboids:  Fixed gravpoint display.

presscafe: Fixed key 4 now does nothing (someday it will do hold instead of the Alt, but its a PITA to change the abstraction layer, since its several deep at this point).

presscafe: Fixed: the alt=hold function (don't know how that got broken?).

Added wiki abstraction, which directs to the appropriate mediawiki page according to the naming of the monomods js its connected to. Added the corresponding wiki function inside the monomers js.
 
Added mod_chan abstraction, function set_channel(val) to js, and def receive_channel(self, val) to Monoclient to deal with initiating the current channel indicator in reloaded Mods (this has been bugging me forever!)

Added mask-key function to monomods_b992_r6, and accompanying mask key function to Monomodular client.  They work like their corresponding mask-grid functions.

Added Improvements to basic MonOhm script (which will be ported to other scripts) to improve shift mode updating.  Includes new functions (allow_update, set_on_values, set_off_values) and general reordering and streamlining of main script.  

Removed redundant and commented(deprecated) scripting from main MonOhm script.

Added Alt-Key7:Toggle active client Device on/off status to standard MonomodularComponent.

Added Alt-Key6:Toggle active client Mute status to standard MonomodularComponent, and receiver in monomods_b992r6 (still requires individual programming via Max in each Mod - use alt-key7 to turn off plugin for now, it will be a while before I get back to this).

010612

b992r8ish:

Added more things than I can keep track of.  Mainly updating the readme file for version control with the new installer which has now been released in its initial version.  For more help on all this stuff, the new wiki is the best resource, and will soon be linked in each individual patch.

http://www.aumhaa.com/wiki

or 

http://www.aumhaa.com/wp

a


b992r5:

Added (hopefully) the ability to use up to 16 Mods and 16 Channels.  Select the second 8 Bank by pressing the 3rd button down on the far left side.  The toggle for the second 8 Channels is on the other side (3rd down, Right).

b992 release notes:

Probably buggy as hell‚Äö√Ñ√∂‚àö√ë¬¨‚àÇI've done no real-world testing of this stuff, and I've changed a lot in this version.  There will probably be several sub-releases after this initial one, once I've heard (and checked myself) what is truly working and what's not.

First of all, if you're on OSX, there is now an installer (sort of).  Make sure to tell it the proper locations to put the files, though.  I just tried to make things a little easier.

If you're on Windows, you'll still have to put everything where it goes.

The new stuff is completely self-contained, and shouldn't mess with your b991 stuff.  I've started naming the scripts with version numbers, so just make sure that everything corresponds when you try to use it together.  If you are using b992 plugs, you need to have the b992 scripts selected in Live.  Otherwise things won't work.

Two new plugins.  Click on their title bars to read the docs.

EndCoders:  a parameter management plug, and replacement for 'Knobs'.  Way better, way faster.  Direct support for Code(Codec script), and usable with standard MIDI mapping or device support (through any standard script).

Binary: a variable speed sequencer developed as my initial approach to scripting the functionality the Livid Code controller.  Direct support for Code(Codec script) and any other Monomodular capable script.  It really requires two controllers to fully realize its potential, but its usable in various ways even if you only have one or the other.  It does, well, a bunch of stuff.  I don't know if it will be useful to anyone, but its pretty cool nonetheless. 

Also, there is now a SoftLCD for the Codec and BlockMod scripts.

Many new controller scripts, and revisions of all the old ones.

APC40 = AumPC40
APC20 = AumPC20
Code = Codec
Launchpad = LaunchMod
Block = BlockMod
Block(Launchpad emulation) = BlockPad

In addition, there is a new timing engine in all the plugins that allows triggering by MIDI note instead of the internal timing engine.  This was the vision for Mod from the beginning, truly Modular capabilities.  If you're on Windows, I'm sorry you can't enjoy all this new freedom (as there is no lh_midi on Windows), but I've retained the normal means of using Nomeout in its place.  

I've made so many other changes, I don't even know where to start.  I will begin documenting each plugin and overhauling UI's again, and you can expect them to trickle out.  I've started the process of adding documentation to all of the plugins themselves, so everything is in the same place.

I've fixed a lot of bugs, but haven't kept a proper changelog.  I'll try to do better (but probably won't).


Here's some basics of how the new control scripts work‚Äö√Ñ√∂‚àö√ë¬¨‚àÇ.I'll hopefully have some time to spend soon documenting this stuff and shooting some videos.

BlockMod:

This scripts work very similar to the way the MonOhm script works.  The top two function buttons are the Shift-L & Shift-R buttons.  The bottom row of buttons on the Grid are the channel & Mode select buttons.  To enter Mod Mode, double tap the Gary button (also to get out of it).  In Mod Mode, top two buttons are Lock and Alt, Gary is shift. Lower function buttons are always navigation.  Refer to the MonOhm videos if you get lost‚Äö√Ñ√∂‚àö√ë¬¨‚àÇand check my blog periodically, I'll probably publish a page there with instructions and more detailed info.

Codec:

A whole new beast here.  Left 4 buttons choose mode.
Mode 1 = 2 Sends, Pan, Volume.
Mode 2 = 4 Sends.
Mode 3 = 4 Devices (if a MonOhm is present, these four devices are the last four selected by its device section‚Äö√Ñ√∂‚àö√ë¬¨‚àÇotherwise, they are the first four devices on the chosen track)
Mode 4 = 1 Device (32 parameters‚Äö√Ñ√∂‚àö√ë¬¨‚àÇgood for editing large devices)

Double tap Gary to get to Mod Mode.  

In Mod mode, Gary is shift, and bottom 8 buttons are Keys when shifted.  Everything else works depending upon the patch loaded.

AumPC40:

Solo and Active are swapped (so that you can mute tracks while in Mod Mode).  

Get to Mod Mode by pressing shift and Master Select.  Get out of it the same way.  

In Mod Mode, top two scene launch buttons are Lock and Alt.

AumPC20:

Same as APC40, except that to get to Mod Mode you do it a bit differently (Shift and NoteMode, I think).  Master select is moved to User3.

Sorry, but I decided to implement APC Mod's in monochrome since there is only a 5x8 colored grid.  I wasn't going to compromise the standard.  If you want RGB, get a Launchpad, Ohm, or iPad.



Here's some of the stuff that was changed, but I stopped keeping track at certain points:

AumPad:

Added event threshold function to Python script, removed from m4l patch.
Added connection routine so that multiple instances can be used at once.
Added assignment of XY pads to first four 'EndCoders' knobs.
Added filtering of events to Mod grid when page is not hilighted.
Added connection status indication to AumPad title background.
Added capability of connecting multiple versions of the Script/Mod for use with multiple iPads (as yet untested though - I only have one device to work with).

Bugs fixed/features added:

All plugins updated with b992 midi assignment page.

Cafe:

added sustain as Key 4.
removed limitation of having to release a key before pressing a new one.
fixed prevention of program values being displayed correctly after 	
	initialization.
updated to Monomods 992r4.

Gome:

added ability to kill all notes by pressing alt/key1.
updated to Monomods 992r4.

Plinko:

rearranged device controls to make better sense.
updated to Monomods 992r4.

Monotes:

added midi thru routing capability to nomeout, and restored inter-patch send capabilities.
updated to Monomods 992r4.

TR256:

added transpose.
added program automation through live envelopes.
added timing automation through live envelopes.
added playthrough while recording functionality.
updated to Monomods 992r4.

Boiingg:

Fixed top row bug, updated java external to b992b.
updated to Monomods 992r4.

MonOhm:

Right shift-modes 1-3 now go to the last session grid area that you navigated to while in that mode.
Various color improvements and reassignments.
When using a Codec as a secondary controller, the last Device page on the Code now reflects the last four plugins chosen on the MonOhm.
