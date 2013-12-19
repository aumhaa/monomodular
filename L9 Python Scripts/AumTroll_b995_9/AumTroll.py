# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys

""" _Framework files """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
from _Framework.ClipSlotComponent import ClipSlotComponent # Class representing a ClipSlot within Live
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent # Class representing a device in Live
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.SessionZoomingComponent import SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
from _Framework.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
from _Framework.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section
from _Framework.SubjectSlot import subject_slot, subject_slot_group

"""Imports from the Monomodular Framework"""
from _Mono_Framework.CodecEncoderElement import CodecEncoderElement
from _Mono_Framework.EncoderMatrixElement import EncoderMatrixElement
from _Mono_Framework.MonoChopperComponent import MonoChopperComponent
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.LiveUtils import *


"""Custom files, overrides, and files from other scripts"""
from CNTRLR_9.Cntrlr import Cntrlr
from ModDevices import *
from Map import *

from _Tools.re import *

switchxfader = (240, 00, 01, 97, 02, 15, 01, 247)
switchxfaderrgb = (240, 00, 01, 97, 07, 15, 01, 247)
assigncolors = (240, 00, 01, 97, 07, 34, 00, 07, 03, 06, 05, 01, 02, 04, 247)
assign_default_colors = (240, 00, 01, 97, 07, 34, 00, 07, 06, 05, 01, 04, 03, 02, 247)
check_model = (240, 126, 127, 6, 1, 247)
request_snapshot = (240, 00, 01, 97, 08, 07, 06, 247)

factoryreset = (240,0,1,97,8,6,247)
btn_channels = (240, 0, 1, 97, 8, 19, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 0, 247);
enc_channels = (240, 0, 1, 97, 8, 20, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 247);
SLOWENCODER = (240, 0, 1, 97, 8, 30, 69, 00, 247)
NORMALENCODER = (240, 0, 1, 97, 8, 30, 00, 00, 247)
FASTENCODER = (240, 0, 1, 97, 8, 30, 04, 00, 247)

ENDCODER_BANK_CONTROL = [['ModDevice_knob0', 'ModDevice_knob1', 'ModDevice_knob2', 'ModDevice_knob3'], ['ModDevice_knob4', 'ModDevice_knob5', 'ModDevice_knob6', 'ModDevice_knob7']]
ENDCODER_BANKS = {'NoDevice':[ENDCODER_BANK_CONTROL[int(bank>3)] + ['CustomParameter_'+str(index+(bank*24)) for index in range(8)] for bank in range(8)]}

ALT_DEVICE_BANKS = {'EndCoders':ENDCODER_BANKS}

INITIAL_SCROLLING_DELAY = 5
INTERVAL_SCROLLING_DELAY = 1

class LoopPedalButtonElement(EncoderElement):


	def __init__(self, *a, **k):
		self._last = 0
		super(LoopPedalButtonElement, self).__init__(*a, **k)
	

	def receive_value(self, value):
		self._verify_value(value)
		value = int(value > 120)*127
		self._last_sent_message = None
		if value != self._last:
			self.notify_value(value)
			self._last = value
			if self._report_input:
				is_input = True
				self._report_value(value, is_input)
	

class LoopPedalExpressionElement(EncoderElement):


	def __init__(self, script, *a, **k):
		self._last = 0
		self._script = script
		super(LoopPedalExpressionElement, self).__init__(*a, **k)
	

	def receive_value(self, value):
		self._verify_value(value)
		if (value > self._last and (value - self._last) < 10) or (value < self._last and (self._last - value) < 10):
			self.notify_value(value)
			self._last = value
			if self._report_input:
				is_input = True
				self._report_value(value, is_input)
		else:
			orig_value = value
			value += int((value - self._last) > 0)*5
			self.notify_value(value)
			self._script.schedule_message(1, self.update_value, [orig_value, value])
			self._last = value
	

	def update_value(self, values):
		if values[1] is self._last:
			self.receive_value(values[0])
	


class AumTrollMonoDevice(MonoDeviceComponent):


	def __init__(self, *a, **k):
		super(AumTrollMonoDevice, self).__init__(*a, **k)
	


class AumTrollMonomodComponent(MonomodComponent):


	def __init__(self, *a, **k):
		super(AumTrollMonomodComponent, self).__init__(*a, **k)
		self._alt_device_banks = MOD_TYPES
		self._host_name = 'AumTroll'
		"""for device in self._alt_device_banks.keys():
			for Type in self._alt_device_banks[device].keys():
				for bank in self._alt_device_banks[device][Type]:
					self._script.log_message(bank)"""
	

	def disconnect(self, *a, **k):
		self._release_mod_dials()
		super(AumTrollMonomodComponent, self).disconnect(*a, **k)
	

	def connect_to_clients(self, *a, **k):
		super(AumTrollMonomodComponent, self).connect_to_clients(*a, **k)
		for index in range(4):
			self._client[index]._mod_dial = (self._script._encoder[index])		#assign it a modDial so that we can control its modVolume from the unshifted CNTRLR
	

	def _select_client(self, *a, **k):
		super(AumTrollMonomodComponent, self)._select_client(*a, **k)		
		self._script.set_local_ring_control(self._active_client._c_local_ring_control)
		self._script.set_absolute_mode(self._active_client._c_absolute_mode)
		if not self._active_client._device_component == None:
			self._active_client._device_component.update()
	

	def _matrix_value(self, value, x, y, is_momentary):	   #to be sent to client from controller
		assert (self._grid != None)
		assert (value in range(128))
		assert isinstance(is_momentary, type(False))
		if (self.is_enabled()):
			self._active_client._send_c_grid(x + self._x, y + self._y, value)
	

	def _send_grid(self, *a):
		pass
	

	def _alt_value(self, value):
		if self._shift_pressed == 0:
			self._alt_pressed = value != 0
			self._active_client._send('alt', int(self._alt_pressed))
			self.update()
	

	def _set_key_buttons(self, buttons):
		#self._script.log_message('set key buttons ' + str(buttons))
		assert (buttons == None) or (isinstance(buttons, tuple))
		for key in self._keys:
			if key.value_has_listener(self._key_value):
				key.remove_value_listener(self._key_value)
		self._keys = []
		if buttons != None:
			assert len(buttons) == 32
			for button in buttons:
				assert isinstance(button, MonoButtonElement)
				self._keys.append(button)
				button.add_value_listener(self._key_value, True)
	

	def _key_value(self, value, sender):
		if self.is_enabled():
			self._active_client._send_c_key(self._keys.index(sender), int(value!=0))
	

	def _update_keys(self):
		for index in range(32):
			self._send_c_key(index, self._active_client._c_key[index])
	

	def _update_grid(self):
		if self.is_enabled() and self._grid != None:
			for column in range(self._grid.width()):
				for row in range(self._grid.height()):
					self._send_c_grid(column, row, self._active_client._c_grid[column][row])
	

	def _send_key(self, *a):
		pass
	

	def _set_knobs(self, knobs):
		assert (knobs == None) or (isinstance(knobs, tuple))
		for knob in self._knobs:
			if knob.has_value_listener(self._knob_value):
				knob.remove_value_listener(self._knob_value)
		self._knobs = []
		if knobs != None:
			assert len(knobs) == 24
			for knob in knobs:
				assert isinstance(knob, EncoderElement)
				self._knobs.append(knob)
				knob.add_value_listener(self._knob_value, True)
	

	def _knob_value(self, value, sender):
		if self.is_enabled():
			self._active_client._send_c_knob(self._knobs.index(sender), value)
	

	def on_enabled_changed(self, *a, **k):
		super(AumTrollMonomodComponent, self).on_enabled_changed(*a, **k)
		if self._active_client != None:
			if self.is_enabled():
				if not self._active_client._device_component is None:
					self._active_client._device_component.update()
				self._script.set_absolute_mode(self._active_client._c_absolute_mode)
				self._script.set_local_ring_control(self._active_client._c_local_ring_control)
			else:
				for control in self._parameter_controls:
					control.release_parameter()
				self._script.set_absolute_mode(1)
				self._script.set_local_ring_control(1)
	

	def _dial_matrix_value(self, value, x, y):
		if self.is_enabled() and self._active_client != None:
			if self._script._absolute_mode == 0:
				value = RELATIVE[int(value == 1)]
			self._active_client._send_c_dial(x, y, value)
	

	def _reset_encoder(self, coord):
		self._dial_matrix.get_dial(coord[0], coord[1])._reset_to_center()
	

	def _dial_button_matrix_value(self, value, x, y, force):
		if (self.is_enabled()) and (self._active_client != None):
			self._active_client._send_c_dial_button(x, y, value)
	

	"""CNTRLR specific methods"""
	def _send_c_grid(self, column, row, value):		#to be sent to controller from client
		if self.is_enabled() and self._grid != None:
			if column in range(self._x, self._x + 4):
				if row in range(self._y, self._y + 4):
					self._grid.get_button(column - self._x, row - self._y).send_value(int(self._colors[value]))

	

	def _send_c_key(self, index, value):
		if self.is_enabled():
			#if (self._shift_pressed > 0) or (self._locked > 0):
			#	self._grid.get_button(index, 7).send_value(int(self._colors[value]))
			if  self._keys != None and len(self._keys) > index:
				self._keys[index].send_value(int(self._colors[value]))
	

	def _send_c_wheel(self, column, row, wheel, parameter=None):		#to be sent to controller from client
		if self.is_enabled() and wheel != None: 
			if column < 4 and row < 3:
				dial = self._dial_matrix.get_dial(column, row)
				if(parameter=='value'):
					dial._ring_value = int(wheel['value'])
				dial._ring_mode = int(wheel['mode'])
				dial._ring_green = int(wheel['green']!=0)
				dial._ring_log = int(wheel['log'])
				if(parameter=='custom'):
					dial._ring_custom = dial._calculate_custom(str(wheel['custom']))
			self._dial_button_matrix.send_value(column, row, wheel['white'])
			if(self._script._absolute_mode > 0) and (not self._active_client._device_component.is_enabled()):
				dial.send_value(wheel['log'], True)
	

	def _update_c_wheel(self):
		if self._dial_button_matrix != None:
			for column in range(4):
				for row in range(3):
					self._send_c_wheel(column, row, self._active_client._c_wheel[column][row])
					if not self._active_client._device_component.is_enabled():
						self._send_to_lcd(column, row, self._active_client._c_wheel[column][row])
						#self._script.log_message('dial value update' +str(column) + str(row) + str(self._active_client._wheel[column][row]['value']))
	

	def _update_wheel(self):
		self._update_c_wheel()
	

	def set_c_local_ring_control(self, val = 1):
		self._c_local_ring_control = (val!=0)
		self._script.set_local_ring_control(self._c_local_ring_control)
	

	def set_c_absolute_mode(self, val=1):
		self._c_absolute_mode = (val!=0)
		self._script.set_absolute_mode(self._c_absolute_mode)
	

	def _release_mod_dials(self):
		if not self._client is None:
			for client in self._client:										#for each of our 4 clients:
				if not client._mod_dial == None:								#if the client has a modDial assigned to it
					#self._script.log_message('mod dial release ' + str(client))
					client._mod_dial.release_parameter()						#remove the modDial's parameter assignment
	

	def _assign_mod_dials(self):
		if not self._client is None:
			for client in self._client:					#recursion to contain all available clients
				param = client._mod_dial_parameter()	#param is a local variable, and we assign its value to the mod_dial_parameter (this is handled by each individual client module)
				#self._script.log_message('mod dial param ' + str(param))
				if not client._mod_dial == None:					#if the client has been assigned a mod dial (which it should have been in setup_mod() )
					if not param == None:										#if the param variable was properly assigned in the client module
						client._mod_dial.connect_to(param)			#connect the physical control to the parameter (this should be the moddial parameter in the m4l patch)
					else:
						client._mod_dial.release_parameter()		#if the param was None, release the physical control from any assignments
			self._script.request_rebuild_midi_map()
	

	def _display_mod_colors(self):
		if not self._client is None:
			for index in range(4):							#set up a recursion of 4
				self._script._shift_mode._modes_buttons[index].send_value(self._client[index]._mod_color)		#update the modLEDs to display the color assigned to its contained mod
			if self._is_enabled:
				self._script._shift_mode._modes_buttons[self._client.index(self._active_client)].send_value(8)
		else:
			for index in range(4):
				self._script._shift_mode._modes_buttons[index].send_value(0)
	

	def _send_nav_box(self):
		pass
	


class ShiftModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Special Class that selects mode 0 if a mode button thats active is pressed'


	def __init__(self, script, callback, *a, **k):
		super(ShiftModeComponent, self).__init__(*a, **k)
		self._script = script
		self.update = callback
		self._modes_buttons = []
		self._last_mode = 0
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement or FlashingButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
	

	def number_of_modes(self):
		return 5
	

	def set_mode(self, mode):
		assert isinstance(mode, int)
		mode += 1
		assert (mode in range(self.number_of_modes()))
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()
		elif (self._mode_index != 0):
			self._mode_index = 0
			self.update()
	

	def _mode_value(self, value, sender):
		assert (len(self._modes_buttons) > 0)
		assert isinstance(value, int)
		assert isinstance(sender, ButtonElement)
		assert (self._modes_buttons.count(sender) == 1)
		if ((value is not 0) or (not sender.is_momentary())):
			self.set_mode(self._modes_buttons.index(sender))
	


class AumTrollDetailViewController(DetailViewControllerComponent):


	def __init__(self, script, *a, **k):
		super(AumTrollDetailViewController, self).__init__(*a, **k)
		self._script = script
	

	def _nav_value(self, value, sender):
		super(AumTrollDetailViewController, self)._nav_value(value, sender)
		if (self.is_enabled() and (not self._shift_pressed)):
			if ((not sender.is_momentary()) or (value != 0)):
				modifier_pressed = True
				if not ((not self.application().view.is_view_visible('Detail')) or (not self.application().view.is_view_visible('Detail/DeviceChain'))):
					self._script._update_selected_device()
	


class AumTroll(Cntrlr):
	__module__ = __name__
	__doc__ = " MonOhmod companion controller script "


	def __init__(self, *a, **k):
		self._monohm = None
		self._aumpush = None
		self._shifted = False
		self._use_pedal = True
		self._suppress_next_mod_display = False
		self._monomod_version = 'b995'
		self._codec_version = 'b995'
		super(AumTroll, self).__init__(*a, **k)
		"""these need to be moved into the _setup_mod() method of CNTRLR"""
		self._client = None
		self._active_client = None
		self._host_name = "AumTroll"
		with self.component_guard():
			self._setup_alt_device_control()
			self._setup_alt_mixer()
			self._setup_pedal()
			#self._setup_alt_device_control()
		#self.schedule_message(3, self._session._do_show_highlight)
		self.send_midi(tuple(request_snapshot))
	

	"""script initialization methods"""

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._monomod_version) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	"""this section sets up the host environment that allows the controller to access different mods from the modButtons"""
	def _setup_mod(self):
		self._host = AumTrollMonomodComponent(self)						#the MonomodComponent is the bridge between the CNTRLR's controls and the client patches that connect to m4l
		self._host.name = 'Monomod_Host'						#name it so we can access it
		self.hosts = [self._host]
		self._host._set_parameter_controls(self._encoder)
	

	"""since there are many different configurations possible with the modButtons, we'll need to create a ModeSelectorComponent"""
	"""to manage the different states of our controller"""
	def _setup_modes(self):
		self._shift_mode = ShiftModeComponent(self, self.shift_update)			#here we call a new component by passing this module and its shift_update method
		self._shift_mode.name = 'Mod_Mode'										#name it so we can access it
		self._shift_mode.set_mode_buttons([self._encoder_button[index] for index in range(4)])		#set the mode buttons that we will use to change states
		self._monohm_shift = self._create_monohm_shift()
		self._last_client = None
	

	def _setup_switchboard(self):
		pass
	


	"""cntrlr modes"""
	"""here we set up some methods that will be used to update the control assignments when we change between different modes"""
	
	"""this method is called everytime we change modes.  If we make any assignments in the other mode assignment methods, we"""
	"""have to be sure to remove them in this function.  This creates a 'blank slate' for all the CNTRLRs control elements"""
	def deassign_live_controls(self):
		#for index in range(4):
		#	if self._encoder[index].value_has_listener(self._client[index]._mod_dial_value):
		#		self._encoder[index].remove_value_listener(self._client[index]._mod_dial_value)
		#self.log_message('deassign live controls')
		#self._device_selector.set_mode_buttons(None)

		self._leds_last = None
		self._device_selector.set_enabled(False)
		self._device._parameter_controls = None
		self._deassign_monomodular_controls()
		self._device1._parameter_controls = None
		self._device2._parameter_controls = None
		for index in range(8):
			self._mixer2.channel_strip(index).set_select_button(None)
			self._mixer2.channel_strip(index).set_volume_control(None)
		for index in range(4):
			self._mixer3.channel_strip(index).set_select_button(None)
			self._mixer3.channel_strip(index).set_volume_control(None)
			self._mixer3.return_strip(index).set_volume_control(None)
		if self._aumpush:
			self._aumpush._host._set_bank_buttons(None)
		self._on_shift_button_value.subject = None
		self._mixer.set_crossfader_control(None)


		"""THIS SECTION IS MISSING FROM THE ORIGINAL SCRIPT AND NEEDS TO BE FIXED...THE ASSIGNMENTS WERE MADE AT __init__"""
		for index in range(4):								
			self._mixer.channel_strip(index).set_volume_control(None)		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
		for index in range(2):
			self._mixer.return_strip(index).set_volume_control(None)	#assign the right faders to control the volume of our return strips
		self._mixer.master_strip().set_volume_control(None)					#assign the far right fader to control our master channel strip
		self._mixer.set_prehear_volume_control(None)							#assign the remaining fader to control our prehear volume of the the master channel strip

		for index in range(4):											#for the left side of the mixer
			self._mixer.channel_strip(index).set_solo_button(None)		#remove the solo button assignments
			self._mixer.channel_strip(index).set_arm_button(None)		#remove the arm button assignments
			self._mixer.channel_strip(index).set_mute_button(None)		#remove the mute button assignments
			self._mixer.channel_strip(index).set_select_button(None)	#remove the select button assignments
		for column in range(4):	
			for row in range(4):
				self._scene[row].clip_slot(column).set_launch_button(None)	#remove the clip launch assignments
		self._send_reset.set_buttons(tuple([None for index in range(4)]))	#remove the send_reset button assignments - this has to be sent as a tuple
		self._session.set_stop_track_clip_buttons(None)						#remove the clip_stop button assignments
		self._session.set_track_bank_buttons(None, None)		#set the track bank buttons for the Session navigation controls
		self._session.set_scene_bank_buttons(None, None)		#set the scnee bank buttons for the Session navigation controls
		self._transport.set_play_button(None)								#remove the play button assignment
		self._transport.set_record_button(None)								#remove the record button assignment
		self._transport.set_stop_button(None)								#remove the stop button assignment
		for index in range(16):
			self._grid[index].set_on_off_values(127, 0)						#reset the on/off values of the grid buttons
			self._grid[index].reset()										#turn the buttons LEDs off
		for index in range(32):
			self._button[index].set_on_off_values(127, 0)					#reset the on/off values for the key buttons
			self._button[index].release_parameter()							#remove the parameter assignment that was assigned to the keys
			self._button[index].send_value(0, True)										#turn the buttons LEDs off
		#self._host._release_mod_dials()
		
		
		#self._device.set_parameter_controls(tuple([self._encoder[index+4] for index in range(8)]))			#assign the encoders from the device component controls - we are doing this here b
		self._device_navigator.set_device_nav_buttons(None, None) 			#remove the assignment of the device nav buttons
		self._device_navigator.set_enabled(False)							#turn off the device navigator
		self._device.set_on_off_button(None)								#remove the assignment of the on/off button from the device component
		self._device.set_lock_button(None)									#remove the assignment of the lock button from the device component	
		self._device.set_bank_nav_buttons(None, None) 						#remove the assignment of the navigation buttons from the device component
		self._device.set_enabled(False)										#turn off the device component
		self._session.set_enabled(False)									#turn off the session component
		self._session_zoom.set_enabled(False)								#turn off the zoom component
		for index in range(16):
			self._grid[index].force_next_send()							#set the last_sent value of the grid to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(32):
			self._button[index].force_next_send()							#set the last_sent value of the keys to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(12):
			self._device._parameter_controls = None
			self._encoder[index].release_parameter()
			self._encoder[index].send_value(0, True)						#turn off all the encoder rings.  We send it the second argument, True, so that it is forced to update regardless of its last_sent property
			self._encoder[index].force_next_send()							#set the last_sent value of the encoder rings to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)				#turn off all the encoder LEDs.  We send it the second argument, True, so that it is forced to update regardless of its last_sent property
			self._encoder_button[index+4].force_next_send()				#set the last_sent value of the encoder LEDs to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(8):
			self._mixer2.channel_strip(index).set_select_button(None)
			self._mixer2.channel_strip(index).set_mute_button(None)
			self._mixer2.channel_strip(index).set_select_button(None)
		self._session_zoom.set_zoom_button(None)							#remove the assignment of the shift button from the ZoomingComponent
		self.request_rebuild_midi_map()										#now that we've finished deassigning all of our controls, we tell the main script to rebuild its MIDI map and update the values in Live
		
	

	"""this assigns the CNTRLR's controls on the main mode the CNTRLR script boots up in"""
	"""if you're trying to customize your layout, this is probably where you want to concentrate"""
	def assign_live_controls(self):
		"""the following lines update all of the controls' last_sent properties, so that they forward the next value they receive regardless of whether or not it is the same as the last it recieved"""
		"""we also reset the encoder rings and buttons, since the device component will not update them if it is not locked to a device in Live"""
		for index in range(16):
			self._grid[index].force_next_send()
		for index in range(32):
			self._button[index].force_next_send()
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)
			self._encoder_button[index+4].force_next_send()
		for index in range(12):
			self._encoder[index].send_value(0, True)
			self._encoder[index].force_next_send()

		"""here we assign the top encoders to the mod_dial, if it exists, in any connected mods"""
		#self.schedule_message(4, self._host._assign_mod_dials)
		self._host._assign_mod_dials()

		"""here we assign the left side of our mixer's buttons on the lower 32 keys"""
		if self._monohm == None and self._aumpush == None:
			for index in range(4):															#we set up a recursive loop to assign all four of our track channel strips' controls
				self._button[index].set_on_value(SOLO[self._rgb])							#set the solo color from the Map.py
				self._mixer.channel_strip(index).set_solo_button(self._button[index])		#assign the solo buttons to our mixer channel strips
				self._button[index+4].set_on_value(ARM[self._rgb])							#set the arm color from the Map.py
				self._mixer.channel_strip(index).set_arm_button(self._button[index+4])		#assign the arm buttons to our mixer channel strips
				self._button[index+16].set_on_value(MUTE[self._rgb])						#set the mute color from the Map.py
				self._mixer.channel_strip(index).set_mute_button(self._button[index+16])	#assign the mute buttons to our mixer channel strips
				self._button[index+20].set_on_value(SELECT[self._rgb])						#set the select color from the Map.py
				self._mixer.channel_strip(index).set_select_button(self._button[index+20])	#assign the select buttons to our mixer channel strips
			self._send_reset.set_buttons(tuple(self._button[index + 8] for index in range(4)))			#this is yet another way to quickly assign multiple elements conveniently in-place.  We are creating a recursion inside an assignment.  The tuple() method creates an immutable array.  It can't be modified until it gets where it's going and is unpacked.
			self._session.set_stop_track_clip_buttons(tuple(self._button[index+24] for index in range(4)))	#these last two lines assign the send_reset buttons and the stop_clip buttons for each track
			for index in range(4):
				self._button[index+8].send_value(SEND_RESET[self._rgb], True)				#now we are going to send a message to turn the LEDs on for the send_reset buttons
				self._button[index + 24].set_on_off_values(STOP_CLIP[self._rgb], STOP_CLIP[self._rgb])	#this assigns the custom colors defined in the Map.py file to the stop_clip buttons.  They have seperate on/off values, but we assign them both the same value so we can always identify them
				self._button[index+24].send_value(STOP_CLIP[self._rgb], True)				#finally, we send the on/off colors out to turn the LEDs on for the stop clip buttons
			self._button[28].set_on_off_values(PLAY_ON[self._rgb], PLAY[self._rgb])			#assing the on/off colors for play.  These are two seperate values, dependant upon whether play is engaged or not
			self._transport.set_play_button(self._button[28])								#set the transports play control to the corresponding button on the CNTRLR
			self._button[30].set_on_off_values(RECORD_ON[self._rgb], RECORD[self._rgb])		#set the on/off colors for the transport record buttons
			self._transport.set_record_button(self._button[30])								#assign the correct button for the transport record control
			self._button[29].set_on_value(STOP[self._rgb])									#set the on value for the Stop button
			self._transport.set_stop_button(self._button[29])								#assign the correct button for the transport stop control
			self._button[29].send_value(STOP_OFF[self._rgb], True)							#turn on the LED for the stop button
			for index in range(4):															#set up a for loop to generate an index for assigning the session nav buttons' colors
				self._button[index + 12].set_on_off_values(SESSION_NAV[self._rgb], SESSION_NAV_OFF[self._rgb])	#assign the colors from Map.py to the session nav buttons
			self._session.set_track_bank_buttons(self._button[15], self._button[14])		#set the track bank buttons for the Session navigation controls
			self._session.set_scene_bank_buttons(self._button[13], self._button[12])		#set the scnee bank buttons for the Session navigation controls

			"""this section assigns the grid to the clip launch functionality of the SessionComponent"""
			for column in range(4):															#we need to set up a double recursion so that we can generate the indexes needed to assign the grid buttons
				for row in range(4):														#the first recursion passes the column index, the second the row index
					self._scene[row].clip_slot(column).set_launch_button(self._grid[(row*4)+column])	#we use the indexes to grab the first the scene and then the clip we assigned above, and then we use them again to define the button held in the grid array that we want to assign to the clip slot from the session component

			"""this section assigns the faders and knobs"""
			for index in range(2):
				self._mixer.return_strip(index).set_volume_control(self._fader[index+4])	#assign the right faders to control the volume of our return strips
			self._mixer.master_strip().set_volume_control(self._fader[7])					#assign the far right fader to control our master channel strip
			self._mixer.set_prehear_volume_control(self._fader[6])							#assign the remaining fader to control our prehear volume of the the master channel strip
			for track in range(4):															#we set up a recursive loop to assign all four of our track channel strips' controls
				channel_strip_send_controls = []											#the channelstripcomponent requires that we pass the send controls in an array, so we create a local variable, channel_strip_send_controls, to hold them
				for control in range(2):													#since we are going to assign two controls to the sends, we create a recursion
					channel_strip_send_controls.append(self._dial_left[track + (control * 4)])		#then use the append __builtin__ method to add them to the array
				self._mixer.channel_strip(track).set_volume_control(self._fader[track])		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
				self._mixer.channel_strip(track).set_send_controls(tuple(channel_strip_send_controls))	#now that we have an array containing the send controls, we pass it to the channelstrip component with its set_send_controls() method
				self._mixer.channel_strip(track).set_pan_control(self._dial_left[track + 8])		#now we set the pan control to the bottom 
				self._mixer.track_eq(track).set_gain_controls(tuple([self._dial_right[track+8], self._dial_right[track+4], self._dial_right[track]]))	#here's another way of doing the same thing, but instead of creating the array before hand, we define it in-place.  Its probably bad coding to mix styles like this, but I'll leave it for those of you trying to figure this stuff out
				self._mixer.track_eq(track).set_enabled(True)								#turn the eq component on
			self._session_zoom.set_zoom_button(self._button[31])							#assign the lower right key button to the shift function of the Zoom component
			self._session.update()															#tell the Session component to update so that the grid will display the currently selected session region
			self._session.set_enabled(True)													#enable the Session Component
			self._session_zoom.set_enabled(True)											#enable the Session Zoom

		elif not self._monohm == None:
			for index in range(8):
				self._mixer2.channel_strip(index).set_volume_control(self._fader[index])
			self._mixer2.set_track_offset(TROLL_OFFSET)
			self._device_selector.set_mode_buttons(self._grid)
			if not self._shifted:
				self._assign_monomodular_controls()
			else:
				self._assign_shifted_controls()
			self._device1.set_parameter_controls(tuple([self._knobs[index] for index in range(8)]))
			self._device2.set_parameter_controls(tuple([self._knobs[index+12] for index in range(8)]))
			self._device1.set_enabled(True)
			self._device2.set_enabled(True)
			self._find_devices()
			self._device1.update()
			self._device2.update()

		elif not self._aumpush == None:
			self.assign_aumpush_controls()

		"""this section assigns the encoders and encoder buttons"""
		if self._aumpush == None:
			self._device.set_parameter_controls(tuple([self._encoder[index+4] for index in range(8)]))			#assign the encoders from the device component controls - we are doing this here b
			self._encoder_button[7].set_on_value(DEVICE_LOCK[self._rgb])					#set the on color for the Device lock encoder button
			self._device.set_lock_button(self._encoder_button[7])							#assign encoder button 7 to the device lock control
			self._encoder_button[4].set_on_value(DEVICE_ON[self._rgb])						#set the on color for the Device on/off encoder button 
			self._device.set_on_off_button(self._encoder_button[4])							#assing encoder button 4 to the device on/off control
			for index in range(2):															#setup a recursion to generate indexes so that we can reference the correct controls to assing to the device_navigator functions
				self._encoder_button[index + 8].set_on_value(DEVICE_NAV[self._rgb])			#assign the on color for the device navigator
				self._encoder_button[index + 10].set_on_value(DEVICE_BANK[self._rgb])		#assign the on color for the device bank controls
				self._device_navigator.set_device_nav_buttons(self._encoder_button[10], self._encoder_button[11]) 	#set the device navigators controls to encoder buttons 10 and 11
			self._device.set_bank_nav_buttons(self._encoder_button[8], self._encoder_button[9]) 	#set the device components bank nav controls to encoder buttons 8 and 9

			"""now we turn on and update some of the components we've just made assignments to"""
			self._device.set_enabled(True)													#enable the Device Component
			self._device_navigator.set_enabled(True)										#enable the Device Navigator
			self._device.update()															#tell the Device component to update its assingments so that it will detect the currently selected device parameters and display them on the encoder rings
	

	"""this assigns the CNTRLR's controls on for 4th empty modSlot"""
	"""these assignments mirror the main section; commenting is restricted to the differences"""
	def assign_chopper_controls(self):
		"""the following lines update all of the controls' last_sent properties, so that they forward the next value they receive regardless of whether or not it is the same as the last it recieved"""
		"""we also reset the encoder rings and buttons, since the device component will not update them if it is not locked to a device in Live"""
		for index in range(16):
			self._grid[index].force_next_send()
		for index in range(32):
			self._button[index].force_next_send()
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)
			self._encoder_button[index+4].force_next_send()
		for index in range(12):
			self._encoder[index].send_value(0, True)
			self._encoder[index].force_next_send()

		"""here we assign the top encoders to the mod_dial, if it exists, in any connected mods"""
		#self.schedule_message(4, self._host._assign_mod_dials)
		self._host._assign_mod_dials()

		"""the following lines differ from the assignments in self.assign_live_controls()"""
		"""the assignments merely moving certain elements from their original positions"""
		for index in range(4):
			self._button[index].set_on_value(MUTE[self._rgb])
			self._mixer.channel_strip(index).set_mute_button(self._button[index])
			self._button[index+4].set_on_value(SELECT[self._rgb])
			self._mixer.channel_strip(index).set_select_button(self._button[index+4])
		self._session.set_stop_track_clip_buttons(tuple(self._button[index+8] for index in range(4)))
		for index in range(4):
			self._button[index + 8].set_on_off_values(STOP_CLIP[self._rgb], STOP_CLIP[self._rgb])
			self._button[index+8].send_value(STOP_CLIP[self._rgb], True)
		for index in range(4):
			self._button[index + 12].set_on_off_values(SESSION_NAV[self._rgb], SESSION_NAV_OFF[self._rgb])
		self._session.set_scene_bank_buttons(self._button[13], self._button[12])
		self._session.set_track_bank_buttons(self._button[15], self._button[14])

		"""the rest of this method mirrors self._assign_live_controls, comments can be found there"""
		for index in range(2):
			self._mixer.return_strip(index).set_volume_control(self._fader[index+4])
		self._mixer.master_strip().set_volume_control(self._fader[7])
		self._mixer.set_prehear_volume_control(self._fader[6])
		for track in range(4):
			channel_strip_send_controls = []
			for control in range(2):
				channel_strip_send_controls.append(self._dial_left[track + (control * 4)])
			self._mixer.channel_strip(track).set_send_controls(tuple(channel_strip_send_controls))
			self._mixer.channel_strip(track).set_pan_control(self._dial_left[track + 8])
			gain_controls = []
			self._mixer.track_eq(track).set_gain_controls(tuple([self._dial_right[track+8], self._dial_right[track+4], self._dial_right[track]]))
			self._mixer.track_eq(track).set_enabled(True)	
		for column in range(4):
			for row in range(4):
				self._scene[row].clip_slot(column).set_launch_button(self._grid[(row*4)+column])
		self._encoder_button[7].set_on_value(DEVICE_LOCK[self._rgb])
		self._device.set_lock_button(self._encoder_button[7])
		self._encoder_button[4].set_on_value(DEVICE_ON[self._rgb])
		self._device.set_on_off_button(self._encoder_button[4])
		for index in range(2):
			self._encoder_button[index + 8].set_on_value(DEVICE_NAV[self._rgb])
			self._encoder_button[index + 10].set_on_value(DEVICE_BANK[self._rgb])
		self._device_navigator.set_device_nav_buttons(self._encoder_button[10], self._encoder_button[11]) 
		self._device.set_bank_nav_buttons(self._encoder_button[8], self._encoder_button[9]) 
		self._device.set_enabled(True)
		self._device_navigator.set_enabled(True)
		self._session.set_enabled(True)
		self._session_zoom.set_enabled(True)
		self._device.update()
		self._session.update()	
		self.request_rebuild_midi_map()
	

	"""function mode callbacks"""

	"""this method changes modes when we press a modButton.  It is also called from Monomod when it needs to update the modDial assignments"""
	def shift_update(self):
		#self.log_message('shift_update')
		
		#deassign current assignments and reset channel translation to 0
		self.assign_alternate_mappings(0)				#first, we remove any channel reassingments we might have made by assigning alternate mappings, but to channel 0 (the original channel)
		self._chopper.set_enabled(False)				#disable the chopper, we will enable it later if we are in chopper mode
		
		#update top button row to reflect current mode

		if self._shift_mode._mode_index is 0:			#if the shift mode is 0, meaning we've selecte the main script mode:

			self._host._set_dial_matrix(None, None)		#deassign the Monomod Components dial matrix 
			#self._host._set_knobs(None)
			self._host._set_button_matrix(None)			#deassign the Monomod Component's button matrix
			self._host._set_key_buttons(None)			#deassign the Monomod Component's key matrix
			self._host.set_enabled(False)				#disable the Monomod Component
			#self.set_local_ring_control(1)				#send sysex to the CNTRLR to put it in local ring mode
			self.deassign_live_controls()
			#self.assign_live_controls()					#assign our top level control assignments
			self.schedule_message(1, self.assign_live_controls)
			self.schedule_message(1, self._host._display_mod_colors)
		elif CHOPPER_ENABLE and not self._host._client is None and not self._host._client[3].is_connected() and self._shift_mode._mode_index == 4:		#if the fourth mod button has been pressed and there is no mod installed
			self.deassign_live_controls()				#deassign the top level assignments
			#self.schedule_message(4, self._host._assign_mod_dials)
			self._host._assign_mod_dials()
			self._host._set_dial_matrix(None, None)		#deassign the Monomod Components dial matrix 
			self._host._set_button_matrix(None)			#deassign the Monomod Component's button matrix
			self._host._set_key_buttons(None)			#deassign the Monomod Component's key matrix
			self._host.set_enabled(False)				#disable the Monomod Component
			self.set_local_ring_control(1)				#send sysex to the CNTRLR to put it in local ring mode
			self.assign_chopper_controls()				#assign the controls for the Chopper Component
			self._chopper.set_enabled(True)				#turn the Chopper Component on
			self._host._display_mod_colors()
			self._shift_mode._modes_buttons[3].send_value(8)		#turn on the LED below the modButton
		else:											#otherwise, if we are in modMode
			self.deassign_live_controls()				#remove all of our assignments from the controls and refresh their caches
			if self._aumpush == None:
				for index in range(8):
					self._mixer2.channel_strip(index).set_volume_control(self._fader[index])
				self._mixer2.set_track_offset(TROLL_OFFSET)
				self._device1.set_parameter_controls(tuple([self._knobs[index] for index in range(8)]))
				self._device2.set_parameter_controls(tuple([self._knobs[index+12] for index in range(8)]))
				self._device1.set_enabled(True)
				self._device2.set_enabled(True)
				self._find_devices()
				self._device1.update()
				self._device2.update()
			else:
				self.assign_aumpush_controls()
			if self._host._client is None or not self._host._client[self._shift_mode._mode_index-1].is_connected():		#if there is not a mod in the currently selected modSlot
				self.assign_alternate_mappings(self._shift_mode._mode_index)				#assign a different MIDI channel that the controls translated to when entering Live
				for index in range(4):
					self._shift_mode._modes_buttons[index].send_value(self._shift_mode._mode_index == (index+1))
			else:
				self._host._set_button_matrix(self._matrix)									#assign the 4x4 to it
				self._host._set_dial_matrix(self._dial_matrix, self._dial_button_matrix)	#assign the encoders to it
				if not self._shifted is True:
					#self.log_message('setting keys')
					self._host._set_key_buttons(tuple(self._button))						#assign the lower buttons to it
					if(self._host._active_client._monomodular > 0):
						if self._aumpush is None:
							#self.log_message('but monomod > 0')
							self._assign_monomodular_controls()
						
				else:
					#self.log_message('self._shifted is True')
					self._host._set_key_buttons(None)
					self._assign_shifted_controls()
				self._host._select_client(self._shift_mode._mode_index-1)					#select the client corresponding to the button we pressed
				if self._suppress_next_mod_display:
					self._suppress_next_mod_display = False
				else:
					self._host.display_active_client()										#tell Monomod Component to update the LEDs on the CNTRLR corresponding to the client that is selected
				self._host.set_enabled(True)												#turn on the Monomod Component
				self._host._display_mod_colors()
	

	def find_inputs(self):
		found_device = None
		tracks = self.song().tracks
		for track in tracks:
			if track.name == 'Inputs':
				for device in track.devices:
					if bool(device.can_have_chains) and device.name == 'Inputs':
						found_device = device
		return found_device
	

	def find_perc_crossfader(self):
		found_parameter = None
		tracks = self.song().tracks
		for track in tracks:
			if track.name == 'Perc':
				for device in track.devices:
					if bool(device.can_have_chains) and device.name == 'Perc':
						for parameter in device.parameters:
							if parameter.name == 'XFade':
								found_parameter = parameter
		return found_parameter
	

	def assign_aumpush_controls(self):
		if self._aumpush:
			self._mixer2.set_track_offset(TROLL_OFFSET)
			inputs = self.find_inputs()
			if not inputs is None:
				for index in range(4):
					self._knobs[index+8].connect_to(inputs.parameters[index+1])

			#for index in range(3):
			#	self._mixer2.channel_strip(index+4).set_volume_control(self._knobs[index+20])
			self._mixer.set_crossfader_control(self._knobs[23])
			xfade = self.find_perc_crossfader()
			if not xfade is None:
				self._knobs[20].connect_to(xfade)
			for index in range(4):
				self._mixer3.return_strip(index).set_volume_control(self._encoder[index+4])
				self._encoder_button[index+4].send_value(127, True)
			if self._shift_mode._mode_index is 0:
				self._device_selector.assign_buttons(self._grid[:15])
				self._device_selector.set_enabled(True)
				self._on_shift_button_value.subject = self._grid[15]
				if self._aumpush._host._is_connected:
					self._aumpush._host._set_bank_buttons(tuple(self._button[4:12]+self._button[20:28]))
				#for index in range(8):
				#	self._button[index+4].set_on_off_values(SELECT[self._rgb], (5, 6)[int(index>3)])
				#	self._mixer2.channel_strip(index).set_select_button(self._button[index+4])
				for index in range(4):
					self._send_reset.set_buttons(tuple(self._encoder_button[4:8]))
					self._button[index].set_on_off_values(SELECT[self._rgb], 1)
					self._mixer.channel_strip(index).set_select_button(self._button[index])
					self._mixer.channel_strip(index).set_mute_button(self._button[index+16])
					self._button[index+12].set_on_off_values(SELECT[self._rgb], 1)
					self._mixer2.channel_strip(index).set_select_button(self._button[index+12])
					self._mixer2.channel_strip(index).set_mute_button(self._button[index+28])
				if not self._shifted:
					self._mixer.selected_strip().set_send_controls(self._encoder[8:12])
					for index in range(4):
						self._encoder_button[index+8].send_value(3, True)
				else:
					self._mixer.return_strip(0).set_send_controls(tuple([None, self._encoder[8]]))
					self._mixer.return_strip(1).set_send_controls(tuple([self._encoder[9], None]))
					#self._mixer.set_crossfader_control(self._encoder[11])
					self._mixer3.channel_strip(0).set_volume_control(self._encoder[11])
					self._encoder_button[8].send_value(5, True)
					self._encoder_button[9].send_value(5, True)
					self._encoder_button[11].send_value(1, True)
			for index in range(4):
				self._mixer.channel_strip(index).set_volume_control(self._fader[index])
				self._mixer2.channel_strip(index).set_volume_control(self._fader[index+4])

			self._device1.set_parameter_controls(tuple([self._knobs[index] for index in range(8)]))
			self._device2.set_parameter_controls(tuple([self._knobs[index+12] for index in range(8)]))
			self._device1.set_enabled(True)
			self._device2.set_enabled(True)
			self._find_devices()
			self._device1.update()
			self._device2.update()
			self.request_rebuild_midi_map()
	

	"""used to connect different control_surfaces so that they can communicate"""
	def connect_script_instances(self, instanciated_scripts):
		if AUMPUSH_LINK is True:
			link = False
			for s in instanciated_scripts:
				#self.log_message('script check' + str(s))
				if link == False:
					#self.log_message(str(type(s)))
					if '_cntrlr_version' in dir(s):
						if s._cntrlr_version == self._monomod_version and s._host_name == 'AumPush':
							link = True
							with self.component_guard():
								self._connect_aumpush(s)
							break
		elif MONOHM_LINK is True:
			link = False
			for s in instanciated_scripts:
				#self.log_message('script check' + str(s))
				if link == False:
					#self.log_message(str(type(s)))
					if '_cntrlr_version' in dir(s):
						if s._cntrlr_version == self._monomod_version:
							link = True
							with self.component_guard():
								self._connect_monohm(s)
							break

	

	"""device component methods and overrides"""

	"""this closure replaces the default DeviceComponent update() method without requiring us to build an override class"""
	"""it calls the _update_selected_device method of this script in addition to its normal routine"""
	"""it also ensures a rebuilt midi_map; for some reason the Abe's pulled that part out of the post 8.22 scripts, and under certain circumstances"""
	"""things don't work as expected anymore."""
	def _device_update(self, device):
		def _update():
			#for client in self._client:
			#	if (device._device != None) and (client.device == device._device):
			#		device._bank_index = max(client._device_component._cntrl_offset, device._bank_index)
			DeviceComponent.update(device)
			self.request_rebuild_midi_map()
		return _update
		
	

	def _device_set_device(self, device_component):
		def set_device(device):
			is_monodevice = False
			for client in self._client:
				if (device != None) and (client.device == device):
					is_monodevice = client
			if is_monodevice != False:
				#device = client._device_component._device
				#self.log_message('is monodevice' + str(device.name))
				assert ((device == None) or isinstance(device, Live.Device.Device))
				if ((not device_component._locked_to_device) and (device != device_component._device)):
					if (device_component._device != None):
						device_component._device.remove_name_listener(device_component._on_device_name_changed)
						device_component._device.remove_parameters_listener(device_component._on_parameters_changed)
						parameter = device_component._on_off_parameter()
						if (parameter != None):
							parameter.remove_value_listener(device_component._on_on_off_changed)
						if (device_component._parameter_controls != None):
							for control in device_component._parameter_controls:
								control.release_parameter()
					device_component._device = device
					if (device_component._device != None):
						device_component._bank_index = 0
						device_component._device.add_name_listener(self._on_device_name_changed)
						device_component._device.add_parameters_listener(self._on_parameters_changed)
						parameter = device_component._on_off_parameter()
						if (parameter != None):
							parameter.add_value_listener(device_component._on_on_off_changed)
					for key in device_component._device_bank_registry.keys():
						if (key == device_component._device):
							device_component._bank_index = device_component._device_bank_registry.get(key, 0)
							del device_component._device_bank_registry[key]
							break
					device_component._bank_name = '<No Bank>' #added
					device_component._bank_index = max(is_monodevice._cntrl_offset, device_component._bank_index)
					device_component._on_device_name_changed()
					device_component.update()	 
			else:
				DeviceComponent.set_device(device_component, device)
		return set_device
		
	

	"""this closure replaces the default ChannelStripComponent _on_cf_assign_changed() method without requiring us to build an override class"""
	"""it allows us to change different colors to its assigned controls based on the crossfade assignment, which the default _Framework doesn't support"""
	def mixer_on_cf_assign_changed(self, channel_strip):
		def _on_cf_assign_changed():
			if (channel_strip.is_enabled() and (channel_strip._crossfade_toggle != None)):
				if (channel_strip._track != None) and (channel_strip._track in (channel_strip.song().tracks + channel_strip.song().return_tracks)):
					if channel_strip._track.mixer_device.crossfade_assign == 1: #modified
						channel_strip._crossfade_toggle.turn_off()
					elif channel_strip._track.mixer_device.crossfade_assign == 0:
						channel_strip._crossfade_toggle.send_value(1)
					else:
						channel_strip._crossfade_toggle.send_value(2)
		return _on_cf_assign_changed
		
	

	"""a closure fix for banking when we deassign the bank buttons and still want to change bank indexes"""
	def device_is_banking_enabled(self, device):
		def _is_banking_enabled():
			return True
		return _is_banking_enabled
		
	

	"""alt_build methods used when Monomodular capable controller is used in conjunction with the CNTRLR"""
	"""monohm connectivity methods"""

	"""this is called by connect_script_instances() when a MonOhm script is found to be installed"""
	def _connect_monohm(self, monohm):
		self.log_message('_connect_monohm')
		self._monohm = monohm
		self._monohm._cntrlr = self
		#self.set_device_component(self._monohm._device)
		"""if '_monohm_shift' in dir(monohm):
			if self._monohm._shift_mode.mode_index_has_listener(monohm._monohm_shift):
				self._monohm._shift_mode.remove_mode_index_listener(monohm._monohm_shift)
		else:
			monohm._monohm_shift = lambda: self._monohm_shift
		self._monohm._shift_mode.add_mode_index_listener(monohm._monohm_shift)"""
		#self._monohm._r_function_mode.set_enabled(True)
		self._monohm._shift_mode._mode_index = 3
		self._monohm._shift_mode.update()
		self._monohm._r_function_mode._mode_index = TROLL_RIGHT_MODE
		self._monohm._r_function_mode.update()
		self._monohm._shift_mode._mode_index = 0
		self._monohm._session_main.set_offsets(TROLL_MAIN_OFFSET, self._monohm._session_main._scene_offset)
		self._monohm.schedule_message(10, self._monohm._shift_mode.update)
		#self.deassign_live_controls()
		#self.shift_update()
		self._monohm_shift(0)
		
	

	"""this is called by connect_script_instances() when a AumPush script is found to be installed"""
	def _connect_aumpush(self, aumpush):
		self.log_message('AumTroll connecting to AumPush...')
		self._aumpush = aumpush
		self._aumpush._cntrlr = self
		with self.component_guard():
			self.deassign_live_controls()
			self.schedule_message(3, self.assign_live_controls)
		self._device_selector.update = self._make_device_selector_update(self._device_selector)
	

	def _make_device_selector_update(self, selector):
		def update():
			key = str('p'+ str(selector._mode_index + 1) + ' ')
			preset = None
			for track in range(len(self.song().tracks)):
				for device in range(len(self.song().tracks[track].devices)):
					if(match(key, str(self.song().tracks[track].devices[device].name)) != None):
						preset = self.song().tracks[track].devices[device]
			for return_track in range(len(self.song().return_tracks)):
				for device in range(len(self.song().return_tracks[return_track].devices)):
					if(match(key, str(self.song().return_tracks[return_track].devices[device].name)) != None):
						preset = self.song().return_tracks[return_track].devices[device]
			for device in range(len(self.song().master_track.devices)):
				if(match(key, str(self.song().master_track.devices[device].name)) != None):
					preset = self.song().master_track.devices[device]	
			if(preset != None):
				self.set_appointed_device(preset)
				self.song().view.select_device(preset)
				selector._last_preset = selector._mode_index
				for button in selector._modes_buttons:
					if selector._modes_buttons.index(button) == selector._mode_index:
						button.turn_on()
					else:
						button.turn_off()
		return update
		
	

	def display_active_client(self):
		if(not self._device._device is None):
			#self.log_message('selecting....')
			self.song().view.select_device(self._device._device)
			if ((not self.application().view.is_view_visible('Detail')) or (not self.application().view.is_view_visible('Detail/DeviceChain'))):
				self.application().view.show_view('Detail')
				self.application().view.show_view('Detail/DeviceChain')
	

	"""these two secondary DeviceComponents are only set up if the MONOHM_LINK flag in .Map is turned on"""
	def _setup_alt_device_control(self):
		self._device1 = DeviceComponent()
		self._device1.name = 'Device_Component1'
		self._device2 = DeviceComponent()
		self._device2.name = 'Device_Component2'
	

	"""this method is used to find the devices the alt controls will latch to"""
	def _find_devices(self):
		if self._device1:
			if len(self.song().return_tracks) > 0:
				if len(self.song().return_tracks[0].devices) > 0:
					#self._device.set_device(self.song().return_tracks[0].devices[0])
					if self._device1._locked_to_device:
						self._device1.set_lock_to_device(False, self._device1._device)
					self._device1.set_lock_to_device(True, self.song().return_tracks[0].devices[0])
		if self._device2:
			if len(self.song().return_tracks) > 1:
				if len(self.song().return_tracks[1].devices) > 0:
					#self._device2.set_device(self.song().return_tracks[1].devices[0])
					if self._device2._locked_to_device:
						self._device2.set_lock_to_device(False, self._device2._device)
					self._device2.set_lock_to_device(True, self.song().return_tracks[1].devices[0])
		#self.log_message('find devices')
	

	"""this secondary MixerComponent is only set up if the MONOHM_LINK flag in .Map is turned on"""
	def _setup_alt_mixer(self):
		is_momentary = True
		self._num_tracks = (8) #A mixer is one-dimensional
		self._mixer2 = MixerComponent(8, 0, False, False)
		self._mixer2.name = 'Mixer_2'
		self._mixer2.set_track_offset(4) #Sets start point for mixer strip (offset from left)
		for index in range(8):
			self._mixer2.channel_strip(index).name = 'Mixer_2_ChannelStrip_' + str(index)
			self._mixer2.channel_strip(index)._invert_mute_feedback = True
		self._mixer3 = MixerComponent(4, 4, False, False)
		self._mixer3.name = 'Mixer_3'
		self._mixer3.set_track_offset(8) #Sets start point for mixer strip (offset from left)
		for index in range(4):
			self._mixer3.channel_strip(index).name = 'Mixer_3_ChannelStrip_' + str(index)
			self._mixer3.channel_strip(index)._invert_mute_feedback = True


	

	def _setup_pedal(self):
		self._pedal = [None for index in range(8)]
		if self._use_pedal is True:
			for index in range(7):
				self._pedal[index] = LoopPedalButtonElement(MIDI_CC_TYPE, 0, 33+index, Live.MidiMap.MapMode.absolute)
				self._pedal[index].name = 'Pedal_'+str(index)
				self._pedal[index]._report = False
			self._pedal[7] = LoopPedalExpressionElement(self, MIDI_CC_TYPE, 0, 40, Live.MidiMap.MapMode.absolute)
			self._pedal[7].name = 'Pedal_'+str(7)
			self._pedal[7]._report = False
	

	"""this method is used instead of an unbound method so that another script (MonOhm) can have access to the CNTRLR's methods"""
	def _create_monohm_shift(self):
		def _monohm_shift(mode):
			#self.log_message('block monohm shift ' + str(mode))
			self._shifted = mode > 1
			self._suppress_next_mod_display = True
			self.shift_update() 
		return _monohm_shift
					
		
	

	def _assign_monomodular_controls(self):
		#self.log_message('assign mod controls')
		if self._monohm != None:
			self._monohm._host._set_key_buttons(tuple(self._button[4:12]))
			self._monohm._host._set_bank_buttons(tuple(self._button[16:32]))
			for index in range(4):
				self._button[index].set_on_off_values(SELECT[self._rgb], 1)
				self._mixer2.channel_strip(index).set_select_button(self._button[index])
				self._button[index+12].set_on_off_values(SELECT[self._rgb], 1)
				self._mixer2.channel_strip(index+4).set_select_button(self._button[index+12])
	

	def _deassign_monomodular_controls(self):
		#self.log_message('deassign mod controls')
		if self._monohm != None:
			self._monohm._host._set_key_buttons(None)
			self._monohm._host._set_bank_buttons(None)
			for index in range(8):
				self._mixer2.channel_strip(index).set_select_button(None)
	

	def _assign_shifted_controls(self):
		if self._monohm != None:
			self._monohm._host._set_key_buttons(tuple(self._button[4:12]))
			for index in range(4):
				self._button[index].set_on_off_values(SELECT[self._rgb], 1)
				self._mixer2.channel_strip(index).set_select_button(self._button[index])
				self._button[index+12].set_on_off_values(SELECT[self._rgb], 1)
				self._mixer2.channel_strip(index+4).set_select_button(self._button[index+12])
				self._button[index+16].set_on_off_values(MUTE[self._rgb], 0)
				self._mixer2.channel_strip(index).set_mute_button(self._button[index+16])
				self._button[index+28].set_on_off_values(MUTE[self._rgb], 0)
				self._mixer2.channel_strip(index+4).set_mute_button(self._button[index+28])
	

	def tick(self):
		self._chopper.get_pos()
	

	def _assign_mod_dials(self):
		pass
	

	@subject_slot('value')
	def _on_shift_button_value(self, value):
		shifted = value > 0
		if not self._shifted is shifted:
			self._shifted = shifted
			self.deassign_live_controls()
			self.assign_live_controls()
			if self._shifted and self._on_shift_button_value.subject:
				self._on_shift_button_value.subject.send_value(7, True)
	



#	a