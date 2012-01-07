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

Probably buggy as hell…I've done no real-world testing of this stuff, and I've changed a lot in this version.  There will probably be several sub-releases after this initial one, once I've heard (and checked myself) what is truly working and what's not.

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


Here's some basics of how the new control scripts work….I'll hopefully have some time to spend soon documenting this stuff and shooting some videos.

BlockMod:

This scripts work very similar to the way the MonOhm script works.  The top two function buttons are the Shift-L & Shift-R buttons.  The bottom row of buttons on the Grid are the channel & Mode select buttons.  To enter Mod Mode, double tap the Gary button (also to get out of it).  In Mod Mode, top two buttons are Lock and Alt, Gary is shift. Lower function buttons are always navigation.  Refer to the MonOhm videos if you get lost…and check my blog periodically, I'll probably publish a page there with instructions and more detailed info.

Codec:

A whole new beast here.  Left 4 buttons choose mode.
Mode 1 = 2 Sends, Pan, Volume.
Mode 2 = 4 Sends.
Mode 3 = 4 Devices (if a MonOhm is present, these four devices are the last four selected by its device section…otherwise, they are the first four devices on the chosen track)
Mode 4 = 1 Device (32 parameters…good for editing large devices)

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
