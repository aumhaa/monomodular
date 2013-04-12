# http://aumhaa.blogspot.com

import Live
import time
import math

""" _Framework files """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values

"""Custom files, overrides, and files from other scripts"""
from OSCFlashingButtonElement import OSCFlashingButtonElement
from MonoBridgeElement import MonoBridgeElement
from SpecialMonomodComponent import SpecialMonomodComponent



#this bit of code replaces the default path where Python assumes the _Framework file resides, therefore the 
#override file has to be carefully written to make sure it doesn't interfere with other scripts that us it, 
#since this path will be used for the remainder of the Python session (i.e. until Live quits and restarts)
#import sys
#sys.modules['ClipSlotComponent'] = sys.modules['AumPad.NewClipSlotComponent']

import LiveUtils
from _Generic.Devices import *
from Lemaur256_Map import *

""" Here we define some global variables """
CHANNEL = 0 
session = None 
mixer = None 
session2 = None
mixer2 = None


class Lemaur256(ControlSurface):
	__module__ = __name__
	__doc__ = " Lemaur256 controller script "


	def __init__(self, c_instance):
		"""everything except the '_on_selected_track_changed' override and 'disconnect' runs from here"""
		ControlSurface.__init__(self, c_instance)
		self.log_message("--------------= Lemaur256 log opened =--------------") 
		self._suggested_input_port = 'None'
		self._suggested_output_port = 'None'
		self.set_suppress_rebuild_requests(True)
		self._monomod_version = 'b994'
		self._host_name = 'AumPad'
		self._color_type = 'AumPad'
		self.connected = 0
		self.hosts = []
		self._osc_registry = {}
		self._bright = True
		self._rgb = 0
		self._timer = 0
		self.flash_status = 1
		self._setup_monobridge()
		self._setup_controls()
		self._setup_monomod()
		self._setup_touchosc()
		self._host2._set_shift_button(self._bank_button[0])
		self._host2._set_alt_button(self._bank_button[1])
		self._host2._set_button_matrix(self._monomod256)
		self._host2._set_key_buttons(self._key_button)
		self._host2.set_enabled(True)
		self.set_suppress_rebuild_requests(False)
		self.reset()
		self.refresh_state()
		self.show_message('Aum256 Control Surface Loaded')
	

	"""script initialization methods"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True
		self._monomod256 = ButtonMatrixElement()
		self._monomod256.name = 'Monomod256'
		self._square = [None for index in range(16)]
		for column in range(16):
			self._square[column] = [None for index in range(16)]
			for row in range(16):
				self._square[column][row] = OSCFlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, int(column/8) + 1, row + ((column%8) * 16), '256Grid_' + str(column) + '_' + str(row), '/Grid_'+str(column)+'_'+str(row), '/Grid/set '+str(column)+' '+str(row), None, self)
		for row in range(16):
			button_row = []
			for column in range(16):
				button_row.append(self._square[column][row])
			self._monomod256.add_row(tuple(button_row))
		#self._bank_buttons = ButtonMatrixElement()
		self._key_buttons = ButtonMatrixElement()
		self._bank_button = [None for index in range(2)]
		for index in range(2):
			self._bank_button[index] = OSCFlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, index, '256Grid_Bank_' + str(index), '/Shift_'+str(index), '/Shift/set '+str(index), None, self)
		#button_row = []
		#for index in range(2):
		#	button_row.append(self._bank_button[index])
		#self._bank_buttons.add_row(tuple(button_row))
		button_row = []
		self._key_button = [None for index in range(8)]
		for index in range(8):
			self._key_button[index] = OSCFlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, index+8, '256Grid_Key_' + str(index), '/Keys_'+str(index), '/Keys/set '+str(index), None, self)
		for index in range(8):
			button_row.append(self._key_button[index])
		self._key_buttons.add_row(tuple(button_row))
	

	def _setup_monomod(self):
		self._host2 = SpecialMonomodComponent(self)
		self._host2.name = '256_Monomod_Host'
		self.hosts = [self._host2]
	

	def _setup_touchosc(self):
		self._osc_registry = {}
		self._osc_registry['/ping'] = self._monobridge.ping
		self._osc_registry['/1'] = self._monobridge.page1
		for control in self.controls:
			if hasattr(control, 'osc'):
				self._osc_registry[control.osc] = control.set_value
			#if hasattr(control, 'osc_alt'):
			#	self._osc_registry[control.osc_alt] = control.set_value
	

	"""called on timer"""
	def update_display(self):
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, OSCFlashingButtonElement):
					control.flash(self._timer)
	


	"""m4l bridge"""
	def generate_strip_string(self, display_string):
		NUM_CHARS_PER_DISPLAY_STRIP = 9
		if (not display_string):
			#return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
			return ('`_')
		if ((len(display_string.strip()) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.endswith('dB') and (display_string.find('.') != -1))):
			display_string = display_string[:-2]
		if (len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			for um in [' ',
			 'i',
			 'o',
			 'u',
			 'e',
			 'a']:
				while ((len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.rfind(um, 1) != -1)):
					um_pos = display_string.rfind(um, 1)
					display_string = (display_string[:um_pos] + display_string[(um_pos + 1):])
		else:
			display_string = display_string.center((NUM_CHARS_PER_DISPLAY_STRIP - 1))
		ret = u''
		for i in range((NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			if ((ord(display_string[i]) > 127) or (ord(display_string[i]) < 0)):
				ret += ' '
			else:
				ret += display_string[i]

		ret += ' '
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return '`' + ret.replace(' ', '_')
	

	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, MonoEncoderElement2)):
			#self.log_message(str(name) + str(value) + str(sender.num))
			self._monobridge._send('lcd_name', sender.name, self.generate_strip_string(str(name)))
			self._monobridge._send('lcd_value', sender.name, self.generate_strip_string(str(value)))
	

	def clip_name(self, sender, name):
		self._monobridge._send_osc(sender.osc_name, self.generate_strip_string(str(name)))
	

	def get_clip_names(self):
		clip_names = []
		for scene in self._session._scenes:
			for clip_slot in scene._clip_slots:
				if clip_slot.has_clip():
					clip_names.append(clip_slot._clip_slot)##.clip.name)
					return clip_slot._clip_slot
					##self.log_message(str(clip_slot._clip_slot.clip.name))
		return clip_names
	


	"""midi functionality"""
	def max_to_midi(self, message): #takes a 'tosymbol' list from Max, such as "240 126 0 6 1 247"
		msg_str = str(message) #gets rid of the quotation marks which 'tosymbol' has added
		midi_msg = tuple(int(s) for s in msg_str.split()) #converts to a tuple 
		self._send_midi(midi_msg) #sends to controller
	

	def max_from_midi(self, message): #takes a 'tosymbol' list from Max, such as "240 126 0 6 1 247"
		msg_str = str(message) #gets rid of the quotation marks which 'tosymbol' has added
		midi_msg = tuple(int(s) for s in msg_str.split()) #converts to a tuple 
		self.receive_external_midi(midi_msg) #sends to controller
	

	def to_encoder(self, num, val):
		rv=int(val*127)
		self._device._parameter_controls[num].receive_value(rv)
		p = self._device._parameter_controls[num]._parameter_to_map_to
		newval = (val * (p.max - p.min)) + p.min
		p.value = newval
	

	def receive_external_midi(self, midi_bytes):
		#self.log_message('receive_external_midi' + str(midi_bytes))
		assert (midi_bytes != None)
		assert isinstance(midi_bytes, tuple)
		self.set_suppress_rebuild_requests(True)
		if (len(midi_bytes) is 3):
			msg_type = (midi_bytes[0] & 240)
			forwarding_key = [midi_bytes[0]]
			self.log_message(str(self._forwarding_registry))
			if (msg_type is not MIDI_PB_TYPE):
				forwarding_key.append(midi_bytes[1])
			recipient = self._forwarding_registry[tuple(forwarding_key)]
			self.log_message('receive_midi recipient ' + str(recipient))
			if (recipient != None):
				recipient.receive_value(midi_bytes[2])
		else:
			self.handle_sysex(midi_bytes)
		self.set_suppress_rebuild_requests(False)
	


	"""general functionality"""
	def disconnect(self):
		"""clean things up on disconnect"""
		#self._disconnect_notifier.set_mode(0)
		self.log_message("--------------= Lemaur256 log closed =--------------") #Create entry in log file
		ControlSurface.disconnect(self)
		return None
	
	
	def allow_updates(self, allow_updates):
		for component in self.components:
			component.set_allow_update(int(allow_updates!=0))
	

	
	def _set_brightness(self, value):
		#self._bright = (value != 0)
		#for control in self.controls:
		#	if isinstance(control, OSCFlashingButtonElement):
		#		self._monobridge._send_osc(control.osc_alt, int(self._bright), True)
		pass

	def reset(self):
		for control in self.controls:
			control.reset()
	

		