# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math

""" All of the Framework files are listed below, but we are only using using some of them in this script (the rest are commented out) """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent as NewDeviceComponent
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section

from _Generic.Devices import *

"""Imports from _Mono_Framework"""
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement

from Codec_b995_9.Codec import *

TROLL_OFFSET = 8

class Codex(Codec):


	def __init__(self, c_instance, *a, **k):
		self._shifted = False
		super(Codex, self).__init__(c_instance, *a, **k)
		with self.component_guard():
			self._setup_alt_mixer()
			self._setup_alt_device_control()
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Codex subclass log opened >>>>>>>>>>>>>>>>>>>>>>>>>')
		self.schedule_message(1, self._shift_update)
	

	"""Mode Functions"""
	def _shift_update(self):
		if(self._shift_mode.is_enabled()):
			with self.component_guard():
				self.allow_updates(False)
				#if(not self._in_build_midi_map):
				#	self.set_suppress_rebuild_requests(True)
				self._deassign_all()
				if(self._shift_mode._mode_index is 0):
					#self._assign_volume()
					self._assign_aumtroll_cntrls()
				elif(self._shift_mode._mode_index is 1):
					self._assign_sends()
				elif(self._shift_mode._mode_index is 2):
					self._assign_devices()
				elif(self._shift_mode._mode_index is 3):
					self._assign_special_device()
				for index in range(self._shift_mode.number_of_modes()):
					if index == self._shift_mode._mode_index:
						self._shift_mode._modes_buttons[index].turn_on()
					else:
						self._shift_mode._modes_buttons[index].turn_off()
				self.allow_updates(True)
				#self.set_suppress_rebuild_requests(False)
				self.request_rebuild_midi_map()
	

	def _deassign_all(self):
		for index in range(8):
			self._mixer2.channel_strip(index).set_volume_control(None)
			self._mixer2.channel_strip(index).set_select_button(None)
		self._device1.set_enabled(False)
		self._device1._parameter_controls = None
		self._device2.set_enabled(False)
		self._device2._parameter_controls = None
		super(Codex, self)._deassign_all()
	

	def _assign_aumtroll_cntrls(self):
		for index in range(8):
			self._dial[index][2].set_channel(2)
			self._dial[index][2].set_enabled(False)
			self._mixer2.channel_strip(index).set_volume_control(self._dial[index][3])
			self._mixer2.channel_strip(index).set_select_button(self._column_button[index])
			self._mixer2.channel_strip(index).set_mute_button(self._dial_button[index][3])
		self._mixer2.set_track_offset(TROLL_OFFSET)
		#self._device_selector.set_mode_buttons(self._grid)
		#if not self._shifted:
		#	self._assign_monomodular_controls()
		#else:
		#	self._assign_shifted_controls()
		self._device1.set_parameter_controls(tuple([self._dial[index%4][int(index/4)] for index in range(8)]))
		self._device2.set_parameter_controls(tuple([self._dial[(index%4)+4][int(index/4)] for index in range(8)]))
		self._device1.set_enabled(True)
		self._device2.set_enabled(True)
		self._find_devices()
		self._device1.update()
		self._device2.update()
	


	"""these two secondary DeviceComponents are only set up if the MONOHM_LINK flag in .Map is turned on"""
	def _setup_alt_device_control(self):
		self._device1 = NewDeviceComponent()
		self._device1.name = 'Device_Component1'
		self._device2 = NewDeviceComponent()
		self._device2.name = 'Device_Component2'
	

	def _setup_alt_mixer(self):
		is_momentary = True
		self._num_tracks = (8) #A mixer is one-dimensional
		self._mixer2 = MixerComponent(8, 0, False, False)
		self._mixer2.name = 'Mixer'
		self._mixer2.set_track_offset(4) #Sets start point for mixer strip (offset from left)
		for index in range(8):
			self._mixer2.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)
			self._mixer2.channel_strip(index)._invert_mute_feedback = True
	

	"""this method is used to find the devices the alt controls will latch to"""
	def _find_devices(self):
		if self._device1:
			if len(self.song().return_tracks) > 0:
				if len(self.song().return_tracks[0].devices) > 0:
					if self._device1._locked_to_device:
						self._device1.set_lock_to_device(False, self._device1._device)
					self._device1.set_lock_to_device(True, self.song().return_tracks[0].devices[0])
		if self._device2:
			if len(self.song().return_tracks) > 1:
				if len(self.song().return_tracks[1].devices) > 0:
					if self._device2._locked_to_device:
						self._device2.set_lock_to_device(False, self._device2._device)
					self._device2.set_lock_to_device(True, self.song().return_tracks[1].devices[0])
	


	"""general functionality"""
	def disconnect(self):
		if not self._shift_button is None:
			if self._shift_button.value_has_listener(self._shift_value):
				self._shift_button.remove_value_listener(self._shift_value)
		for button in self._device_select_buttons:
			if button.value_has_listener(self._device_select_value):
				button.remove_value_listener(self._device_select_value)
		if self._session._is_linked():
			self._session._unlink()
		self.song().view.remove_selected_track_listener(self._update_selected_device)
		self._hosts = []
		if self._linked_script != None:
			self._linked_script._update_linked_device_selection = None
		self._linked_script = None
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Codec log closed >>>>>>>>>>>>>>>>>>>>>>>>>')
		super(Codex, self).disconnect()
		return None
		
	

	def connect_script_instances(self, instanciated_scripts):
		found = False
		for s in instanciated_scripts:
			if '_codec_version' in dir(s):
				if s._codec_version == self._version_check:
					if s._host_name == ('MonOhm'):
						self.log_message('found codec version ' + str(s._codec_version) + ' in script ' + str(s._host_name))
						found = True
						self._linked_script = s
						self._linked_script._update_linked_device_selection = self._update_linked_device_selection
						if not self._session._is_linked() and self._link_mixer is True:
							self._session.set_offsets(LINK_OFFSET[0], LINK_OFFSET[1])
							self._session._link()
				else:
					self.log_message('version mismatch: Monomod version ' + str(self._version_check) + ' vs. Host version ' + str(s._codec_version))
					

		if found == False:
			for s in instanciated_scripts:
				if '_codec_version' in dir(s):
					if s._codec_version == self._version_check:
						if s._host_name == 'BlockMod':
							self.log_message('found codec version ' + str(s._codec_version) + ' in script ' + str(s._host_name))
							self._linked_script = s
							self._linked_script._update_linked_device_selection = self._update_linked_device_selection
						if not self._session._is_linked() and self._link_mixer is True:
							self._session.set_offsets(LINK_OFFSET[0], LINK_OFFSET[1])
							self._session._link()
					else:
						self.log_message('version mismatch: Monomod version ' + str(self._version_check) + ' vs. Host version ' + str(s._codec_version))
		#self.log_message('hosts: ' + str(self._hosts))"""
	



#
#