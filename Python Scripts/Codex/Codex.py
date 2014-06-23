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
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent, NewDeviceSelectorComponent
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent

from Codec.Codec import *

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
		self.schedule_message(1, self._mode_update)
	

	def _setup_alt_device_selector(self):
		self._alt_device_selector = NewDeviceSelectorComponent(self)
		self._alt_device_selector.name = 'Alt_Device_Selector'
	

	def _setup_alt_send_reset(self):
		self._alt_send_reset = ResetSendsComponent(self)
		self._alt_send_reset.name = 'Alt_Reset_Sends'
	

	"""these two secondary DeviceComponents are only set up if the MONOHM_LINK flag in Map is turned on"""
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
	

	"""Mode Functions"""


	def _enable_alt(self):
		if self._main_mode._mode_index == 0:
			for encoder, _ in self._encoder_matrix.submatrix[:, 0:2].iterbuttons():
				encoder.set_enabled(False)
				encoder.reset()
			self._alt_enabled = True
			self._mode_update()
		super(Codex, self)._enable_alt()
	

	def _disable_alt(self):
		if self._main_mode._mode_index == 0:
			self._button_matrix.submatrix[:, 0:2].reset()
			for encoder, _ in self._encoder_matrix.submatrix[:, 0:2].iterbuttons():
				encoder.set_enabled(True)
		super(Codex, self)._disable_alt()
	

	def _deassign_all(self):
		self._alt_send_reset.set_buttons(tuple([None for index in range(4)]))
		self._alt_send_reset.set_enabled(False)
		self._alt_device_selector.set_buttons(None)
		self._alt_device_selector.set_enabled(False)
		self._mixer2.selected_strip().set_send_controls(None)
		for index in range(8):
			self._mixer2.channel_strip(index).set_volume_control(None)
			self._mixer2.channel_strip(index).set_select_button(None)
			self._mixer2.channel_strip(index).set_mute_button(None)
			self._dial[index][2].release_parameter()
		for index in range(3):
			self._mixer2.return_strip(index).set_volume_control(None)
		self._device1.set_enabled(False)
		self._device1._parameter_controls = None
		self._device2.set_enabled(False)
		self._device2._parameter_controls = None
		self._mixer2.return_strip(0).set_send_controls(None)
		self._mixer2.return_strip(1).set_send_controls(None)
		self._mixer2.return_strip(2).set_send_controls(None)
		super(Codex, self)._deassign_all()
	

	def _assign_volume(self):
		if self._alt_enabled:
			inputs = self.find_inputs()
			if not inputs is None:
				for index in range(4):
					self._dial[index][2].connect_to(inputs.parameters[index+1])
				self._dial[6][2].connect_to(inputs.parameters[5])
			xfade = self.find_perc_crossfader()
			if not xfade is None:
				self._dial[7][3].connect_to(xfade)
			self._alt_device_selector.set_matrix(self._button_matrix.submatrix[:, 0:2])
			self._alt_device_selector.set_enabled(True)
			self._mixer2.return_strip(0).set_send_controls([None, self._dial[4][2]])
			self._mixer2.return_strip(1).set_send_controls([self._dial[5][2], None])
		else:
			self._alt_send_reset.set_buttons(tuple([self._button[4][2], self._button[5][2], self._button[6][2], self._button[7][2]]))
			self._alt_send_reset.set_enabled(True)
			self._mixer2.selected_strip().set_send_controls([self._dial[0][2], self._dial[1][2], self._dial[2][2], self._dial[3][2]])
			for index in range(3):
				self._mixer2.return_strip(index).set_volume_control(self._dial[index+4][2])
			self._mixer2.set_crossfader_control(self._dial[7][2])
			self._device1.set_parameter_controls(tuple([self._dial[index%4][int(index/4)] for index in range(8)]))
			self._device2.set_parameter_controls(tuple([self._dial[(index%4)+4][int(index/4)] for index in range(8)]))
			self._device1.set_enabled(True)
			self._device2.set_enabled(True)
			self._find_devices()
			self._device1.update()
			self._device2.update()
			for index in range(8):
				self._mixer2.channel_strip(index).set_select_button(self._column_button[index])
		for index in range(8):
			self._mixer2.channel_strip(index).set_volume_control(self._dial[index][3])
			self._mixer2.channel_strip(index).set_mute_button(self._button[index][3])
		self._mixer2.update()
		self.request_rebuild_midi_map()
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
	


#
#