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
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent

from Codec_b995_9.Codec import *

from _Tools.re import *

TROLL_OFFSET = 0

DEVICE_COLORS = {'midi_effect':22,
				'audio_effect':8,
				'instrument':15,
				'Operator':22,
				'DrumGroupDevice':15,
				'MxDeviceMidiEffect':22,
				'MxDeviceInstrument':15,
				'MxDeviceAudioEffect':8,
				'InstrumentGroupDevice':15,
				'MidiEffectGroupDevice':22,
				'AudioEffectGroupDevice':8}


class AumTrollDeviceSelectorComponent(DeviceSelectorComponent):


	def __init__(self, *a, **k):
		super(AumTrollDeviceSelectorComponent, self).__init__(*a, **k)
		self.song().add_appointed_device_listener(self._device_listener)
	

	def disconnect(self, *a, **k):
		super(AumTrollDeviceSelectorComponent, self).disconnect()
		if self.song().appointed_device_has_listener(self._device_listener):
			self.song().remove_appointed_device_listener(self._device_listener)
	

	def set_matrix(self, matrix):
		buttons = []
		if not matrix is None:
			for button, address in matrix.iterbuttons():
				#self._script.log_message('button: ' + str(button))
				button.use_default_message()
				button.set_enabled(True)
				buttons.append(button)
		self.set_mode_buttons(tuple(buttons))
	

	def set_mode_buttons(self, buttons):
		#assert(isinstance(buttons, tuple) or buttons is None)
		if buttons == None:
			buttons = []

		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)

		self._modes_buttons = []
		for button in buttons:
			if not button is None:
				button.add_value_listener(self._mode_value, identify_sender=True)
				self._modes_buttons.append(button)
			self._number_of_modes = len(self._modes_buttons) + self._offset

		self.update()
	

	def assign_mode_buttons(self, buttons):
		pass
	

	def update(self):
		if self.is_enabled():
			name = 'None'
			dev = self.song().appointed_device
			if hasattr(dev, 'name'):
				name = dev.name
				dev_type = dev.type
				dev_class = dev.class_name
			if self._modes_buttons:
				for index in range(len(self._modes_buttons)):
					if match('p' + str(index+1) + ' ', name) != None:
						val = (dev_class in DEVICE_COLORS and DEVICE_COLORS[dev_class]) or (dev_type in DEVICE_COLORS and DEVICE_COLORS[dev_type]) or 126
						self._modes_buttons[index].send_value(val, True)
					else:
						self._modes_buttons[index].send_value(0, True)
	

	def _update_mode(self):
		mode = self._modes_heap[-1][0]
		assert(mode in range(self.number_of_modes()))
		if self._mode_index != mode:
			self._mode_index = mode

		if self.is_enabled():
			key = str('p' + str(self._mode_index + 1 + self._offset) + ' ')
			preset = None
			for track in self.song().tracks:
				for device in self.enumerate_track_device(track):
					if(match(key, str(device.name)) != None):
						preset = device
						break
			for return_track in self.song().return_tracks:
				for device in self.enumerate_track_device(return_track):
					if(match(key, str(device.name)) != None):
						preset = device
						break
			for device in self.enumerate_track_device(self.song().master_track):
				if(match(key, str(device.name)) != None):
					preset = device
					break

			if preset != None:
				#self._script.log_message('preset found: ' + str(preset.name))
				self._script.set_appointed_device(preset)
				self.song().view.select_device(preset)
				self._last_preset = self._mode_index + self._offset

			#self.update()
	

	def set_mode(self, mode):
		self._clean_heap()
		self._modes_heap = [(mode, None, None)]
		self._update_mode()
	

	def _device_listener(self, *a, **k):
		if self.is_enabled():
			self.update()
	

	def on_enabled_changed(self):
		#super(AumTrollDeviceSelectorComponent, self).on_enabled_change()
		if self.is_enabled():
			self.update()
	


class Codex(Codec):


	def __init__(self, c_instance, *a, **k):
		self._shifted = False
		super(Codex, self).__init__(c_instance, *a, **k)
		with self.component_guard():
			self._setup_alt_mixer()
			self._setup_alt_device_selector()
			self._setup_alt_send_reset()
			self._setup_alt_device_control()
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Codex subclass log opened >>>>>>>>>>>>>>>>>>>>>>>>>')
		self.schedule_message(1, self._shift_update)
	

	def _setup_alt_device_selector(self):
		self._alt_device_selector = AumTrollDeviceSelectorComponent(self)
		self._alt_device_selector.name = 'Alt_Device_Selector'
	

	def _setup_alt_send_reset(self):
		self._alt_send_reset = ResetSendsComponent(self)
		self._alt_send_reset.name = 'Alt_Reset_Sends'
	

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
	

	def _shift_value(self, value):
		super(Codex, self)._shift_value(value)
		if self._monomod_mode._mode_index == 0 and self._shift_mode._mode_index is 0:
			self._deassign_all()
			self._assign_aumtroll_cntrls()
	

	def _deassign_all(self):
		self._alt_send_reset.set_buttons(tuple([None for index in range(4)]))
		self._alt_send_reset.set_enabled(False)
		self._alt_device_selector.set_mode_buttons(tuple([None for index in range(16)]))
		self._alt_device_selector.set_enabled(False)
		self._mixer2.selected_strip().set_send_controls(None)
		for index in range(8):
			self._mixer2.channel_strip(index).set_volume_control(None)
			self._mixer2.channel_strip(index).set_select_button(None)
			self._mixer2.channel_strip(index).set_mute_button(None)
			self._dial[index][2].release_parameter()
		self._device1.set_enabled(False)
		self._device1._parameter_controls = None
		self._device2.set_enabled(False)
		self._device2._parameter_controls = None
		self._mixer2.return_strip(0).set_send_controls(None)
		self._mixer2.return_strip(1).set_send_controls(None)
		super(Codex, self)._deassign_all()
		for button, _ in self._button_matrix.iterbuttons():
			button.send_value(0, True)
		self._dial_matrix.reset()
	

	def _assign_aumtroll_cntrls(self):

			if self._shift_pressed:
				inputs = self.find_inputs()
				if not inputs is None:
					for index in range(4):
						self._dial[index][2].connect_to(inputs.parameters[index+1])
					self._dial[6][2].connect_to(inputs.parameters[5])
				xfade = self.find_perc_crossfader()
				if not xfade is None:
					self._dial[7][3].connect_to(xfade)
				self._alt_device_selector.set_mode_buttons(tuple([self._button[index%8][int(index/8)] for index in range(16)]))
				self._alt_device_selector.set_enabled(True)
				self._mixer2.return_strip(0).set_send_controls([None, self._dial[4][2]])
				self._mixer2.return_strip(1).set_send_controls([self._dial[5][2], None])
			else:
				self._alt_send_reset.set_buttons(tuple([self._button[4][2], self._button[5][2], self._button[6][2], self._button[7][2]]))
				self._alt_send_reset.set_enabled(True)
				self._mixer2.set_crossfader_control(self._dial[7][2])
				self._mixer2.selected_strip().set_send_controls([self._dial[0][2], self._dial[1][2], self._dial[2][2], self._dial[3][2]])
				for index in range(3):
					self._mixer2.return_strip(index).set_volume_control(self._dial[index+4][2])
				self._device1.set_parameter_controls(tuple([self._dial[index%4][int(index/4)] for index in range(8)]))
				self._device2.set_parameter_controls(tuple([self._dial[(index%4)+4][int(index/4)] for index in range(8)]))
				self._device1.set_enabled(True)
				self._device2.set_enabled(True)
				self._find_devices()
				self._device1.update()
				self._device2.update()
			for index in range(8):
				self._mixer2.channel_strip(index).set_volume_control(self._dial[index][3])
				self._mixer2.channel_strip(index).set_select_button(self._column_button[index])
				self._mixer2.channel_strip(index).set_mute_button(self._button[index][3])
			#self._mixer2.set_track_offset(TROLL_OFFSET)

	

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
	

	"""these two secondary DeviceComponents are only set up if the MONOHM_LINK flag in .Map is turned on"""
	def _setup_alt_device_control(self):
		self._device1 = NewDeviceComponent()
		self._device1.name = 'Device_Component1'
		self._device2 = NewDeviceComponent()
		self._device2.name = 'Device_Component2'
	

	def _setup_alt_mixer(self):
		is_momentary = True
		self._num_tracks = (8) #A mixer is one-dimensional
		self._mixer2 = MixerComponent(8, 4, False, False)
		self._mixer2.name = 'Mixer'
		#self._mixer2.set_track_offset(4) #Sets start point for mixer strip (offset from left)
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