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

PEDAL_DEFS = [64, 65, 66, 67, 68, 69, 70]
LED_DEFS = [4, 3, 2, 1, 8, 7, 6, 5, 12, 11, 10, 9]
VALUES = [[1, 1, 1], [1, 1, 0], [0, 1, 1], [1, 0, 1], [1, 0, 0], [0, 1, 0], [0, 0, 1]]

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
		#self._script.log_message('exp val ' + str(value))
		#value = min(127, max(0, (value - 96)*4))
		#self._script.log_message('exp new val ' + str(value))
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
	


class RGB_LED(MonoButtonElement):


	def __init__(self, red, green, blue, *a, **k):
		super(RGB_LED, self).__init__(*a, **k)
		self._color_map = [1, 2, 3, 4, 5, 6, 7]
		self._red = red
		self._green = green
		self._blue = blue
	

	def send_value(self, value, force = False):		#commented this because of ButtonElement==NoneType errors in log
		if(type(self) != type(None)):
			assert (value != None)
			assert isinstance(value, int)
			assert (value in range(128))
			if (force or self._force_next_send or ((value != self._last_sent_value) and self._is_being_forwarded)):
				data_byte1 = self._original_identifier
				if value in range(1, 127):
					data_byte2 = self._color_map[(value - 1) % (self._num_colors)]
				elif value == 127:
					data_byte2 = self._color_map[self._num_colors-1]
				else:
					data_byte2 = self._darkened
				self._color = data_byte2
				self.send_RGB(data_byte2)
				self._last_sent_message = [value]
				if self._report_output:
					is_input = True
					self._report_value(value, (not is_input))
				self._flash_state = round((value -1)/self._num_colors)
				self._force_next_value = False
	

	def flash(self, timer):
		if (self._is_being_forwarded and self._flash_state in range(1, self._num_flash_states) and (timer % self._flash_state) == 0):
			data_byte2 = self._color * int((timer % (self._flash_state * 2)) > 0)
			status_byte = self._original_channel
			self.send_RGB(data_byte2)
	

	def send_RGB(self, value):
		values = [0, 0, 0]
		if not value == 0:
			values = VALUES[(value-1)%7]
		#self._script.log_message('sending values: ' + str(values))
		self._red.send_value(values[0]*127, True)
		self._green.send_value(values[1]*127, True)
		self._blue.send_value(values[2]*127, True)
	


class MonoPedal(ControlSurface):


	def __init__(self, *a, **k):
		super(MonoPedal, self).__init__(*a, **k)
		self._monomod_version = 'b995'
		self._codec_version = 'b996'
		self._cntrlr_version = 'b996'
		self._cntrlr = None
		self._host_name = 'MonoPedal'
		self._color_type = 'OhmRGB'
		self.hosts = []
		self._timer = 0
		self.flash_status = 1
		self._touched = 0
		with self.component_guard():
			self._setup_monobridge()
			self._setup_controls()
			#self._setup_transport_control() 
			#self._setup_mixer_control()
			#self._setup_session_control()
			#self._setup_device_control()
			#self._setup_crossfader()
			#self._setup_device_selector()
			#self._setup_monomod()
			#self._setup_modes() 
			#self.song().view.add_selected_track_listener(self._update_selected_device)
		self.schedule_message(1, self._open_log)
	

	"""script initialization methods"""
	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._monomod_version) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		self._pedal = [None for index in range(8)]
		for index in range(7):
			self._pedal[index] = LoopPedalButtonElement(MIDI_CC_TYPE, 0, PEDAL_DEFS[index], Live.MidiMap.MapMode.absolute)
			self._pedal[index].name = 'Pedal_'+str(index)
			self._pedal[index]._report = False
		self._pedal[7] = LoopPedalExpressionElement(self, MIDI_CC_TYPE, 0, 1, Live.MidiMap.MapMode.absolute)
		self._pedal[7].name = 'Pedal_'+str(7)
		self._pedal[7]._report = False
		self._leds = [None for index in range(4)]
		for index in range(4):
				red_led = ButtonElement(True, MIDI_NOTE_TYPE, 0, LED_DEFS[index])
				green_led = ButtonElement(True, MIDI_NOTE_TYPE, 0, LED_DEFS[index]+4)
				blue_led = ButtonElement(True, MIDI_NOTE_TYPE, 0, LED_DEFS[index]+8)
				self._leds[index] =  RGB_LED(red_led, green_led, blue_led, True, MIDI_NOTE_TYPE, 0, index+13, 'LED_' + str(index), self)
	

	def _setup_looper(self):
		pass
	
	def _setup_live_looper(self):
		pass
	

	def receive_led(self, button, value):
		#self.log_message('receive led: ' + str(index) + ' ' + str(value))
	
		
	"""called on timer"""
	def update_display(self):
		super(MonoPedal, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	


