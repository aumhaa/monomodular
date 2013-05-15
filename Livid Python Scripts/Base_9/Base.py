# by amounra 0413 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import math

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
from _Framework.PhysicalDisplayElement import PhysicalDisplayElement
from _Framework.SubjectSlot import subject_slot, subject_slot_group

"""Custom files, overrides, and files from other scripts"""
from _Mono_Framework.MonoButtonElement import *
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement

"""to be included from Monomodular"""
import sys
import _Mono_Framework.modRemixNet as RemixNet
import _Mono_Framework.modOSC

DIRS = [47, 48, 50, 49]
_NOTENAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B']
NOTENAMES = [(_NOTENAMES[index%12] + ' ' + str(int(index/12))) for index in range(128)]
SCALENAMES = None
SCALEABBREVS = None
from Map import *

_base_translations =	{'0': 0,
						'1': 1,
						'2': 2,
						'3': 3,
						'4': 4,
						'5': 5,
						'6': 6,
						'7': 7,
						'8': 8,
						'9': 9,
						'A': 10,
						'B': 11,
						'C': 12,
						'D': 13,
						'E': 14,
						'F': 15,
						'G': 16,
						'H': 17,
						'I': 18,
						'J': 19,
						'K': 20,
						'L': 21,
						'M': 22,
						'N': 23,
						'O': 24,
						'P': 25,
						'Q': 26,
						'R': 27,
						'S': 28,
						'T': 29,
						'U': 30,
						'V': 31,
						'W': 32,
						'X': 33,
						'Y': 34,
						'Z': 35,
						'a': 10,
						'b': 11,
						'c': 12,
						'd': 13,
						'e': 14,
						'f': 15,
						'g': 16,
						'h': 17,
						'i': 18,
						'j': 19,
						'k': 20,
						'l': 21,
						'm': 22,
						'n': 23,
						'o': 24,
						'p': 25,
						'q': 26,
						'r': 27,
						's': 28,
						't': 29,
						'u': 30,
						'v': 31,
						'w': 32,
						'x': 33,
						'y': 34,
						'z': 35,
						'_': 39, 
						'-': 42}
						


DEFAULT_MIDI_ASSIGNMENTS = {'mode':'chromatic', 'offset':36, 'vertoffset':12, 'scale':'Chromatic', 'drumoffset':0, 'split':False}
LAYERSPLASH = [63, 69, 70, 65]
USERBUTTONMODE = (240, 0, 1, 97, 12, 66, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 247)
MIDIBUTTONMODE = (240, 0, 1, 97, 12, 66, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 247)
LIVEBUTTONMODE = (240, 0, 1, 97, 12, 66, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 247)
SPLITBUTTONMODE = (240, 0, 1, 97, 12, 66, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 247)
STREAMINGON = (240, 0, 1, 97, 12, 62, 127, 247)
STREAMINGOFF = (240, 0, 1, 97, 12, 62, 0, 247)
LINKFUNCBUTTONS = (240, 0, 1, 97, 12, 68, 1, 247)
#DISABLECAPFADERNOTES = (240, 0, 1, 97, 12, 69, 1, 247)
DISABLECAPFADERNOTES = (240, 0, 1, 97, 12, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 247)


CHANNELS = ['Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8', 'Ch. 9', 'Ch. 10', 'Ch. 11', 'Ch. 12', 'Ch. 13', 'Ch. 14', 'Ch. 15', 'Ch. 16', 'All Channels']
MODES = ['chromatic', 'drumpad', 'scale', 'user']
INITIAL_SCROLLING_DELAY = 5
INTERVAL_SCROLLING_DELAY = 1

if SCALENAMES is None:
	SCALENAMES = [scale for scale in sorted(SCALES.iterkeys())]

if SCALEABBREVS is None:
	SCALEABBREVS = []

MIDI_NOTE_TYPE = 0
MIDI_CC_TYPE = 1
MIDI_PB_TYPE = 2
MIDI_MSG_TYPES = (MIDI_NOTE_TYPE, MIDI_CC_TYPE, MIDI_PB_TYPE)
MIDI_NOTE_ON_STATUS = 144
MIDI_NOTE_OFF_STATUS = 128
MIDI_CC_STATUS = 176
MIDI_PB_STATUS = 224

class BlockingMonoButtonElement(MonoButtonElement):


	def __init__(self, *a, **k):
		super(BlockingMonoButtonElement, self).__init__(*a, **k)
		self._is_held = False
		self._held_value = 1
		self.display_press = False
		self._last_flash = 0
		self.scale_color = 0
	

	"""def install_connections(self):
		if self._is_enabled:
			ButtonElement.install_connections(self)
		elif ((self._msg_channel != self._original_channel) or (self._msg_identifier != self._original_identifier)):
			self._install_translation(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)
			#self._install_original_forwarding(self)"""
	


	#def receive_value(self, value):
	#	#self._script.log_message('receive value ' + str(self.message_identifier) + ' ' + str(value))
	#	InputControlElement.receive_value(self, value)
	

	def press_flash(self, value, force = False):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(128))
		#self._script.log_message('blockbutton:' + str(self._original_identifier))
		if self.display_press and (not value is self._last_flash or force):
			data_byte1 = self._original_identifier
			if value == 0:
				if self.scale_color is 127:
					data_byte2 = COLOR_MAP[-1]
				elif self.scale_color is 0:
					data_byte2 = 0
				else:
					data_byte2 = COLOR_MAP[max(0, (self.scale_color-1)%7)]
			else:
				data_byte2 = 1
			status_byte = self._original_channel
			status_byte +=  144
			self.send_midi((status_byte, data_byte1, data_byte2))
			self._last_flash = value
	

 
class BaseMixerComponent(MixerComponent):


	def __init__(self, script, *a, **k):
		super(BaseMixerComponent,self).__init__(*a, **k)
		self._script = script
		self._held = None
		for strip in self._channel_strips:
			strip._select_value = self._strip_select_value(strip)
	

	def shifted(self):
		return not self._held is None
	

	def _strip_select_value(self, strip):
		def _select_value(value):
			ChannelStripComponent._select_value(strip, value)
			#self._script.log_message('select track ' + str(value))
			if not value is 0:
				self._held = strip
				self._script._select_update(self._held)
			elif self._held is strip:
				self._held = None
				self._script._select_update(self._held)
		return _select_value
		
	

	def tracks_to_use(self):
		return tuple(self.song().visible_tracks) + tuple(self.song().return_tracks)
	

	def deassign_all(self):
		self.set_bank_buttons(None, None)
		self.set_select_buttons(None, None)
		self.set_prehear_volume_control(None)
		self.set_crossfader_control(None)
		for component in self._sub_components:
			if isinstance(component, ChannelStripComponent):
				component.set_pan_control(None)
				component.set_volume_control(None)
				component.set_select_button(None)
				if not component is self._master_strip:
					component.set_mute_button(None)
					component.set_send_controls(None)
					component.set_solo_button(None)
					component.set_arm_button(None)
					component.set_shift_button(None)
					component.set_crossfade_toggle(None)
	


class BaseModeSelector(ModeSelectorComponent):


	def __init__(self, script):
		super(BaseModeSelector, self).__init__()
		self._held = None
		self._script = script
		self._set_protected_mode_index(0)	
	

	def number_of_modes(self):
		return 4
	

	def _mode_value(self, value, sender):
		if not self._script.pad_held():
			if not sender is self._held:
				super(BaseModeSelector, self)._mode_value(value, sender)
				self._held = sender
				self._script.schedule_message(3, self._script._check_mode_shift, self._held)
			elif value is 0:
				self._held = None
			self._script._shift_update(self._mode_index, not self._held is None)
	

	def update(self):
		if self._is_enabled:
			buttons = self._modes_buttons
			for index in range(len(buttons)):
				if index == self._mode_index:
					buttons[index].turn_on(True)
				else:
					buttons[index].turn_off(True)
			#for index in range(8):
				#self._script._send_midi((191, index+1, LAYERSPLASH[self._mode_index]))
	

	def is_shifted(self):
		return not self._held is None
	

	"""def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, MonoButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()"""
	


class BaseUserModeSelector(ModeSelectorComponent):


	def __init__(self, script):
		super(BaseUserModeSelector, self).__init__()
		self._held = None
		self._script = script
		self._set_protected_mode_index(0)	
	

	def number_of_modes(self):
		return 8
	

	def _mode_value(self, value, sender):
		if self._is_enabled:
			if not sender is self._held:
				super(BaseUserModeSelector, self)._mode_value(value, sender)
				self._held = sender
			elif value is 0:
				self._held = None
			self._script._user_shift_update(self._mode_index, not self._held is None)
	

	def update(self):
		if self._is_enabled:
			buttons = self._modes_buttons
			for index in range(len(buttons)):
				if index == self._mode_index:
					buttons[index].turn_on(True)
				else:
					buttons[index].turn_off(True)
	

	def is_shifted(self):
		return not self._held is None
	


class BaseMidiModeSelector(ModeSelectorComponent):


	def __init__(self, callback):
		super(BaseMidiModeSelector, self).__init__()
		self._report_mode = callback
		self._set_protected_mode_index(0)	
	

	def number_of_modes(self):
		return 2
	

	def _mode_value(self, value, sender):
		if self._is_enabled:
			super(BaseMidiModeSelector, self)._mode_value(value, sender)
			self._report_mode(self._mode_index)
	

	def update(self):
		if self._is_enabled:
			for index in range(len(self._modes_buttons)):
				if self._mode_index == index:
					self._modes_buttons[index].turn_on(True)
				else:
					self._modes_buttons[index].turn_off(True)
	


class BaseSplitModeSelector(ModeSelectorComponent):


	def __init__(self, callback):
		super(BaseSplitModeSelector, self).__init__()
		self._report_mode = callback
		self._modes_buttons = []
		self._set_protected_mode_index(0)
	

	def number_of_modes(self):
		return 2
	

	def _mode_value(self, value, sender):
		if self._is_enabled:
			super(BaseSplitModeSelector, self)._mode_value(value, sender)
			self._report_mode(self._mode_index)
	

	def update(self):
		if self._is_enabled:
			if len(self._modes_buttons) > 0:
				for index in range(len(self._modes_buttons)):
					if self._mode_index == index:
						self._modes_buttons[index].turn_on(True)
					else:
						self._modes_buttons[index].turn_off(True)
			if not self._mode_toggle is None:
				if self._mode_index > 0:
					self._mode_toggle.turn_on(True)
				else:
					self._mode_toggle.turn_off(True)
	


class BaseSessionComponent(SessionComponent):


	def __init__(self, num_tracks, num_scenes, script):
		super(BaseSessionComponent, self).__init__(num_tracks, num_scenes)
		self._shifted = False
		self._script = script
	

	def deassign_all(self):
		self._shifted = False
		self.set_scene_bank_buttons(None, None)
		self.set_track_bank_buttons(None, None)
		self.set_stop_all_clips_button(None)
		self.set_stop_track_clip_buttons(None)
		self.set_select_buttons(None, None)
		for scene in self._scenes:
			scene.set_launch_button(None)
			for slot in scene._clip_slots:
				slot.set_launch_button(None)
	

	def _bank_up_value(self, value):
		assert (value in range(128))
		assert (self._bank_up_button != None)
		if self.is_enabled():
			button_is_momentary = self._bank_up_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_up_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_up_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self.set_offsets(self._track_offset, (self._scene_offset + (1+(self._shifted*3))))
	

	def _bank_down_value(self, value):
		assert (value in range(128))
		assert (self._bank_down_button != None)
		if self.is_enabled():
			button_is_momentary = self._bank_down_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_down_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_down_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self.set_offsets(self._track_offset, max(0, self._scene_offset - (1+(self._shifted*3))))
	

	def _bank_right_value(self, value):
		assert (value in range(128))
		assert (self._bank_right_button != None)
		if self.is_enabled():
			button_is_momentary = self._bank_right_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_right_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_right_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self.set_offsets((self._track_offset + (1+(self._shifted*7))), self._scene_offset)
	

	def _bank_left_value(self, value):
		assert isinstance(value, int)
		assert (self._bank_left_button != None)
		if self.is_enabled():
			button_is_momentary = self._bank_left_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_left_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_left_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self.set_offsets(max(0, (self._track_offset - (1+(self._shifted*7)))), self._scene_offset)
	


class BaseDeviceComponent(DeviceComponent):


	def deassign_all(self):
		self.set_parameter_controls(None)
		self.set_bank_nav_buttons(None, None)
		self.set_bank_buttons(None)
	

	def set_parameter_controls(self, controls):
		assert (controls is None) or isinstance(controls, tuple)
		if self._device != None and self._parameter_controls != None:
			for control in self._parameter_controls:
				control.release_parameter()
		if not controls is None:
			for control in controls:
				assert (control != None)
				assert isinstance(control, EncoderElement)
		self._parameter_controls = controls
		self.update()
		return None
	

	def _is_banking_enabled(self):
		return True
	


class DeviceNavigator(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Component that can toggle the device chain- and clip view of the selected track '


	def __init__(self, device_component, mixer, script):
		super(DeviceNavigator, self).__init__()
		self._prev_button = None
		self._next_button = None
		self._device = device_component
		self._mixer = mixer
		self._script = script
		return None
	

	def deassign_all(self):
		self.set_nav_buttons(None, None)
	

	def set_nav_buttons(self, prev_button, next_button):
		#self._script.log_message('set nav: ' + str(prev_button) + ' ' + str(next_button))
		identify_sender = True
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		self._prev_button = prev_button
		if self._prev_button != None:
			self._prev_button.add_value_listener(self._nav_value, identify_sender)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)
		self._next_button = next_button
		if self._next_button != None:
			self._next_button.add_value_listener(self._nav_value, identify_sender)
		self.update()
		return None
	

	def update(self):
		pass
	

	def _nav_value(self, value, sender):
		if self.is_enabled():
			if ((not sender.is_momentary()) or (value != 0)):
				track = self._mixer.selected_strip()._track
				if track != None:
					if(sender == self._prev_button):
						self._script.log_message('prev button')
						device = track.devices[min(len(track.devices)-1, max(0, [item for item in track.devices].index(self._device._device)-1))]
						self._script.set_appointed_device(device)
						self.song().view.select_device(device)
					elif(sender == self._next_button):
						self._script.log_message('next button')
						device = track.devices[min(len(track.devices)-1, max(0, [item for item in track.devices].index(self._device._device)+1))]
						self._script.set_appointed_device(device)
						self.song().view.select_device(device)	
	

	def disconnect(self):
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)	
	

	def _find_track(self, obj):
		if(type(obj.canonical_parent) == type(self.song().tracks[0])):
			return obj.canonical_parent
		elif(type(obj.canonical_parent)==type(None)) or (type(obj.canonical_parent)==type(self.song())):
			return None
		else:
			return self.find_track(obj.canonical_parent)
	

	def on_enabled_changed(self):
		pass
	


class ScaleModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '


	def __init__(self, script):
		super(ScaleModeComponent, self).__init__()
		self._script = script
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, MonoButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, MonoButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	

	def number_of_modes(self):
		return 8
	

	def update(self):
		if self.is_enabled():
			scales = SCALES.keys()
			self._script._offsets['scale'] = scales[self._mode_index%len(scales)]
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	


class ScrollingOffsetComponent(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Class for handling held buttons for continued value changes '


	def __init__(self, callback):
		super(ScrollingOffsetComponent, self).__init__()
		self._report_change = callback
		self._maximum = 127
		self._minimum = 0
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1	
		self._scroll_up_button = None
		self._scroll_down_button = None
		self._register_timer_callback(self._on_timer)
	

	def disconnect(self):
		if (self._scroll_up_button != None):
			self._scroll_up_button.remove_value_listener(self._scroll_up_value)
			self._scroll_up_button = None
		if (self._scroll_down_button != None):
			self._scroll_down_button.remove_value_listener(self._scroll_down_value)
			self._scroll_down_button = None
	

	def on_enabled_changed(self):
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1
		self.update()
	

	def set_offset_change_buttons(self, up_button, down_button):
		assert ((up_button == None) or isinstance(up_button, ButtonElement))
		assert ((down_button == None) or isinstance(down_button, ButtonElement))
		do_update = False
		if (up_button is not self._scroll_up_button):
			do_update = True
			if (self._scroll_up_button != None):
				self._scroll_up_button.remove_value_listener(self._scroll_up_value)
			self._scroll_up_button = up_button
			if (self._scroll_up_button != None):
				self._scroll_up_button.add_value_listener(self._scroll_up_value)
		if (down_button is not self._scroll_down_button):
			do_update = True
			if (self._scroll_down_button != None):
				self._scroll_down_button.remove_value_listener(self._scroll_down_value)
			self._scroll_down_button = down_button
			if (self._scroll_down_button != None):
				self._scroll_down_button.add_value_listener(self._scroll_down_value)
		if do_update:
			self.update()
	

	def _scroll_up_value(self, value):
		assert (value in range(128))
		assert (self._scroll_up_button != None)
		if self.is_enabled():
			button_is_momentary = self._scroll_up_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_up_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_up_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self._offset = max(self._minimum, min(self._maximum, self._offset +1))
				self.update()
				self._report_change(self._offset)
	

	def _scroll_down_value(self, value):
		assert (value in range(128))
		assert (self._scroll_down_button != None)
		if self.is_enabled():
			button_is_momentary = self._scroll_down_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_down_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_down_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self._offset = max(self._minimum, min(self._maximum, self._offset -1))
				self.update()
				self._report_change(self._offset)
	

	def _on_timer(self):
		if self.is_enabled():
			scroll_delays = [self._scroll_up_ticks_delay,
							 self._scroll_down_ticks_delay]
			if (scroll_delays.count(-1) < 2):
				offset_increment = 0
				if (self._scroll_down_ticks_delay > -1):
					if self._is_scrolling():
						offset_increment -= 1
						self._scroll_down_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_down_ticks_delay -= 1
				if (self._scroll_up_ticks_delay > -1):
					if self._is_scrolling():
						offset_increment += 1
						self._scroll_up_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_up_ticks_delay -= 1
				new_offset = max(self._minimum, min(self._maximum, self._offset + offset_increment))
				if new_offset != self._offset:
					self._offset =  new_offset
					self.update()
					self._report_change(self._offset)
	

	def _is_scrolling(self):
		return (0 in (self._scroll_up_ticks_delay,
					  self._scroll_down_ticks_delay))
	

	def update(self):
		if (self._scroll_down_button != None):
			if (self._offset > self._minimum):
				self._scroll_down_button.turn_on(True)
			else:
				self._scroll_down_button.turn_off(True)
		if (self._scroll_up_button != None):
			if (self._offset < self._maximum):
				self._scroll_up_button.turn_on(True)
			else:
				self._scroll_up_button.turn_off(True)		
	

	def deassign_all(self):
		self.set_offset_change_buttons(None, None)
		self.on_enabled_changed()
	


 
class Base(ControlSurface):
	__module__ = __name__
	__doc__ = " Base controller script "


	def __init__(self, c_instance):
		super(Base, self).__init__(c_instance)
		with self.component_guard():
			self._host_name = 'Base'
			self._color_type = 'OhmRGB'
			self.oscServer = None
			self.log_message("<<<<<<<<<<<<<<<<<= Base log opened =>>>>>>>>>>>>>>>>>>>>>") 
			self._rgb = 0
			self._timer = 0
			self._current_nav_buttons = []
			self.flash_status = 1
			self._clutch_device_selection = False
			self._touched = 0
			self._update_linked_device_selection = None
			self._offsets = [{'offset':DEFAULT_OFFSET, 'vertoffset':DEFAULT_VERTOFFSET, 'drumoffset':DEFAULT_DRUMOFFSET, 'scale':DEFAULT_SCALE, 'split':DEFAULT_SPLIT} for index in range(16)]
			self._last_selected_track = None
			self._last_selected_track_arm = False
			self._last_pad_stream = [0 for i in range(0, 32)]
			self._layer = 0
			self._user_layer = 0
			self._layers = [self._set_layer0,
							self._set_layer1, 
							self._set_layer2, 
							self._set_layer3]

			self._setup_monobridge()
			if OSC_TRANSMIT:
				self._setup_OSC_layer()
			self._setup_controls()
			self._setup_mixer_control()
			self._setup_session_control()
			self._setup_selected_session_control()
			self._setup_device_control()
			self._setup_mode_select()
			self._setup_user_mode_select()
			self._setup_midi_mode_select()
			self._setup_split_mode_select()
			self._setup_offset_component()
			self._setup_vertical_offset_component()
			self._setup_scale_offset_component()
		self.schedule_message(3, self._send_midi, STREAMINGON)
		self.schedule_message(3, self._send_midi, LINKFUNCBUTTONS)
		self.schedule_message(3, self._send_midi, DISABLECAPFADERNOTES)
		self.schedule_message(3, self._send_midi, (191, 122, 64))
		self.schedule_message(3, self._layers[0])
	

	"""script initialization methods"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True
		self._fader = [MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, BASE_TOUCHSTRIPS[index], Live.MidiMap.MapMode.absolute, 'Fader_' + str(index), index, self) for index in range(9)]
		self._button = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, BASE_BUTTONS[index], 'Button_' + str(index), self) for index in range(8)]
		self._pad = [BlockingMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, BASE_PADS[index],	 'Pad_' + str(index), self) for index in range(32)]
		self._pad_CC = [MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, BASE_PADS[index], Live.MidiMap.MapMode.absolute, 'Pad_CC_' + str(index), index, self) for index in range(32)]
		self._touchpad = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, BASE_TOUCHPADS[index], 'TouchPad_' + str(index), self) for index in range(8)]
		self._runner = [MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, BASE_RUNNERS[index], 'Runner_' + str(index), self) for index in range(8)]
		self._stream_pads = [self._pad[index%8 + (abs((index/8)-3)*8)] for index in range(32)]
		self._nav_buttons = ButtonMatrixElement( name = 'nav_buttons' )
		self._nav_buttons.add_row(self._button[4:8])
		self._on_nav_button_value.subject = self._nav_buttons
	

	def _setup_mixer_control(self):
		is_momentary = True
		self._num_tracks = (8) #A mixer is one-dimensional; 
		self._mixer = BaseMixerComponent(self, 8, 4, False, False)
		self._mixer.name = 'Mixer'
		self._mixer.set_track_offset(0) #Sets start point for mixer strip (offset from left)
		for index in range(8):
			self._mixer.channel_strip(index)._invert_mute_feedback = True
			self._mixer.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)
		self.song().view.selected_track = self._mixer.channel_strip(0)._track 
	

	def _setup_session_control(self):
		self._session = BaseSessionComponent(8, 4, self)
		self._session.name = "Session"
		self._session.set_offsets(0, 0)	 
		self._session.set_stop_track_clip_value(STOP_CLIP)
		self._scene = [None for index in range(4)]
		for row in range(4):
			self._scene[row] = self._session.scene(row)
			self._scene[row].name = 'Scene_' + str(row)
			for column in range(8):
				clip_slot = self._scene[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_' + str(row)
				clip_slot.set_triggered_to_play_value(CLIP_TRG_PLAY)
				clip_slot.set_triggered_to_record_value(CLIP_TRG_REC)
				clip_slot.set_stopped_value(CLIP_STOP)
				clip_slot.set_started_value(CLIP_STARTED)
				clip_slot.set_recording_value(CLIP_RECORDING)
		self._session.set_mixer(self._mixer)
		self.set_highlighting_session_component(self._session)
		self._session._do_show_highlight()
	

	def _setup_selected_session_control(self):
		self._selected_session = BaseSessionComponent(1, 16, self)
		self._selected_session.name = "SelectedSession"
		self._selected_session.set_offsets(0, 0)	 
		self._selected_session.set_stop_track_clip_value(STOP_CLIP)
		self._selected_scene = [None for index in range(16)]
		for row in range(16):
			self._selected_scene[row] = self._selected_session.scene(row)
			self._selected_scene[row].name = 'SelectedScene_' + str(row)
			clip_slot = self._selected_scene[row].clip_slot(0)
			clip_slot.name = 'Selected_Clip_Slot_' + str(row)
			clip_slot.set_triggered_to_play_value(CLIP_TRG_PLAY)
			clip_slot.set_triggered_to_record_value(CLIP_TRG_REC)
			clip_slot.set_stopped_value(CLIP_STOP)
			clip_slot.set_started_value(CLIP_STARTED)
			clip_slot.set_recording_value(CLIP_RECORDING)
	

	def _setup_device_control(self):
		self._device = BaseDeviceComponent()
		self._device.name = 'Device_Component'
		self._device.update = self._device_update(self._device)
		self.set_device_component(self._device)
		self._device_navigator = DeviceNavigator(self._device, self._mixer, self)
		self._device_navigator.name = 'Device_Navigator'
		self._device_selection_follows_track_selection = FOLLOW 
	

	def _setup_mode_select(self):
		self._mode_selector = BaseModeSelector(self)
		self._mode_selector.set_mode_buttons(tuple(self._button[0:4]))
		self._button[0].set_on_off_values(1, 0)
		self._button[1].set_on_off_values(4, 0)
		self._button[2].set_on_off_values(3, 0)
		self._button[3].set_on_off_values(5, 0)
	

	def _setup_user_mode_select(self):
		self._user_mode_selector = BaseUserModeSelector(self)
		self._user_mode_selector.set_mode_buttons(tuple(self._button[4:8])) 
		self._user_mode_selector.set_enabled(False)
	

	def _setup_midi_mode_select(self):
		self._midi_mode_selector = BaseMidiModeSelector(self._midi_mode_value)
		self._midi_mode_selector.set_mode_buttons(tuple(self._button[4:6]))
		self._midi_mode_selector.set_enabled(False)
	

	def _setup_split_mode_select(self):
		self._split_mode_selector = BaseSplitModeSelector(self._split_mode_value)
		self._split_mode_selector.set_mode_buttons(tuple(self._touchpad[0:2]))
		#self._split_mode_selector.set_mode_toggle(self._touchpad[0])
		self._split_mode_selector.set_enabled(False)
	

	def _setup_offset_component(self):
		self._offset_component = ScrollingOffsetComponent(self._offset_value)
	

	def _setup_vertical_offset_component(self):
		self._vertical_offset_component = ScrollingOffsetComponent(self._vertical_offset_value)
	

	def _setup_scale_offset_component(self):
		self._scale_offset_component = ScrollingOffsetComponent(self._scale_offset_value)
		self._scale_offset_component._minimum = 0
		self._scale_offset_component._maximum = len(SCALES.keys())-1
	

	def _setup_OSC_layer(self):
		self._prefix = '/Base'
		self._outPrt = OSC_OUTPORT
		if not self.oscServer is None:
			self.oscServer.shutdown()
		self.oscServer = RemixNet.OSCServer('localhost', self._outPrt, 'localhost', 10001)
	

	"""shift/zoom methods"""
	def pad_held(self):
		#held = False
		#for pad in self._pad:
		#	if pad._is_held is True:
		#		held = True
		#		break
		return (sum(self._last_pad_stream)>0)
	

	def shift_pressed(self):
		return not self._mode_selector._held is None
	

	def select_pressed(self):
		return not self._mixer._held is None
	

	def _shift_update(self, mode, shifted = False):
		#self.log_message('new shift mode: ' + str(mode))
		assert isinstance(mode, int)
		if not self.pad_held():
			if not mode is self._layer:
				shifted = False
			self._layer = mode
			self._deassign_all()
			self._layers[self._layer](shifted)	
			#self.schedule_message(1, self._layers[self._layer], shifted)
	

	def _check_mode_shift(self, held_key = None):
		if held_key is self._mode_selector._held:
			self._shift_update(self._mode_selector._mode_index, True)
			#self.schedule_message(1, self._shift_update, [self._mode_selector._mode_index, True])
	

	def _select_update(self, held_strip = None):
		"""if self.shift_pressed():
			if self.select_pressed():
				cur_track = self._mixer._selected_strip._track
				if cur_track.has_midi_input:
					cur_chan = cur_track.current_input_sub_routing
					if len(cur_chan) == 0:
						cur_chan = 'All Channels'
					if cur_chan in CHANNELS:
						cur_chan = (CHANNELS.index(cur_chan)%15)+1
						self._offsets[cur_chan]['split'] = not self._offsets[cur_chan]['split'] 
						self.log_message('split is ' + str(self._offsets[cur_chan]['split'] ))"""
		if not self.shift_pressed() and not self.pad_held():
			if self.select_pressed():
				#self.schedule_message(3, self._delayed_select_update, held_strip)
				self._shift_update(self._mode_selector._mode_index, False)
				#self._delayed_select_update(held_strip)
			else:
				self._shift_update(self._mode_selector._mode_index, False)
		
	

	def _delayed_select_update(self, held_strip = None):
		self._display_mode()
		if self._mixer._held is held_strip:
			with self.component_guard():
				for pad in self._touchpad:
					pad.set_on_off_values(127, 0)
					pad.release_parameter()
					pad.use_default_message()
					pad.reset(True)
					pad.set_enabled(True)
				for pad in self._pad:
					pad.set_on_off_values(127, 0)
					pad.release_parameter()
					pad.use_default_message()
					pad.reset(True)
					pad.set_enabled(True)
					pad.set_force_next_value()
				for pad in self._pad_CC:
					pad.release_parameter()
					pad.use_default_message()
					pad.set_enabled(True)
				self._send_midi(LIVEBUTTONMODE)
				for column in range(8): 
					for row in range(4):
						self._scene[row].clip_slot(column).set_launch_button(self._pad[column + (row*8)])
				self._session.update()
				self.request_rebuild_midi_map()
			self.schedule_message(1, self._session._reassign_scenes)
	

	"""not currently being used"""
	def _check_select_shift(self, held_strip = None):
		if held_strip is self._mixer._held and not held_strip is None:
			#if self._session._shifted is True:
			if not self._mode_selector._held is None:
				#self.log_message('mode is shifted')
				cur_track = self._mixer._selected_strip._track
				if cur_track.has_midi_input:
					cur_chan = cur_track.current_input_sub_routing
					if len(cur_chan) == 0:
						cur_chan = 'All Channels'
					if cur_chan in CHANNELS:
						cur_chan = (CHANNELS.index(cur_chan)%15)+1
						self._offsets[cur_chan]['split'] = not self._offsets[cur_chan]['split'] 
						#self.log_message('split is ' + str(self._offsets[cur_chan]['split'] ))
				self._shift_update(self._mode_selector._mode_index, True)
			else:
				#self.log_message('mode is not shifted')
				with self.component_guard():
					for column in range(8): 
						for row in range(4):
							self._pad[column + (row*8)].set_force_next_value()
							self._scene[row].clip_slot(column).set_launch_button(self._pad[column + (row*8)])
				self.request_rebuild_midi_map()
		else:
			self._shift_update(self._mode_selector._mode_index, False)	
	

	def _user_shift_update(self, mode, shifted = False):
		if self._user_mode_selector._is_enabled:
			#self.log_message('user_shift_update ' + str(mode) + ' ' + str(shifted))		
			if not mode is self._user_layer:
				shifted = False
			self._user_layer = mode
			self._set_layer3(shifted)
	

	def _mode_update(self, mode):
		pass
	

	def _midi_mode_value(self, mode):
		#self.log_message('offset: ' + str(mode))
		cur_track = self._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			#self.log_message('cur_chan ' + str(cur_chan) + str(type(cur_chan)) + str(len(cur_chan)))
			if len(cur_chan) == 0:
				cur_chan = 'All Channels'
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan)%15)+1
				#self.log_message('chan in CHANNELS: ' + str(cur_chan))
				self._offsets[cur_chan]['mode'] = MODES[mode]
	

	def _offset_value(self, offset):
		#self.log_message('root offset: ' + str(self._offset_component._offset) + ' ' + str(offset))
		if not self.pad_held():
			cur_track = self._mixer._selected_strip._track
			if cur_track.has_midi_input:
				cur_chan = cur_track.current_input_sub_routing
				if len(cur_chan) == 0:
					cur_chan = 'All Channels'
				if cur_chan in CHANNELS:
					cur_chan = (CHANNELS.index(cur_chan)%15)+1
					scale = self._offsets[cur_chan]['scale']
					if scale is 'Auto':
						scale = self._detect_instrument_type(cur_track)
					if scale is 'DrumPad':
						old_offset = self._offsets[cur_chan]['drumoffset']
						self._offsets[cur_chan]['drumoffset'] = offset
						self.show_message('New drum root is ' + str(self._offsets[cur_chan]['drumoffset']))
						newval = list(str(offset))
						if len(newval)==2:
							self._display_chars(newval[0], newval[1])
						elif len(newval)==1:
							self._display_chars('-', newval[0])
					else:
						self._offsets[cur_chan]['offset'] = offset
						self.show_message('New root is Note# ' + str(self._offsets[cur_chan]['offset']) + ', ' + str(NOTENAMES[self._offsets[cur_chan]['offset']]))
						newval = list(str(offset))
						if len(newval)>=2:
							self._display_chars(newval[0], newval[1])
						elif len(newval)==1:
							self._display_chars('-', newval[0])
					#self._assign_notes_per_scale(cur_chan)
					self._assign_midi_layer()
	

	def _vertical_offset_value(self, offset):
		#self.log_message('vertical offset: ' + str(self._vertical_offset_component._offset) + ' ' + str(offset))
		if not self.pad_held():
			cur_track = self._mixer._selected_strip._track
			if cur_track.has_midi_input:
				cur_chan = cur_track.current_input_sub_routing
				if len(cur_chan) == 0:
					cur_chan = 'All Channels'
				if cur_chan in CHANNELS:
					cur_chan = (CHANNELS.index(cur_chan)%15)+1
					#self._assign_notes_per_scale(cur_chan)
					self._offsets[cur_chan]['vertoffset'] = offset
					self.show_message('New vertical offset is ' + str(self._offsets[cur_chan]['vertoffset']))
					newval = list(str(offset))
					if len(newval)>=2:
						self._display_chars(newval[0], newval[1])
					elif len(newval)==1:
						self._display_chars('-', newval[0])
					self._assign_midi_layer()
	

	def _scale_offset_value(self, offset):
		#self.log_message('scale offset ================= ' + str(offset))
		if not self.pad_held():
			cur_track = self._mixer._selected_strip._track
			if cur_track.has_midi_input:
				cur_chan = cur_track.current_input_sub_routing
				if len(cur_chan) == 0:
					cur_chan = 'All Channels'
				if cur_chan in CHANNELS:
					cur_chan = (CHANNELS.index(cur_chan)%15)+1
					self._offsets[cur_chan]['scale'] = SCALENAMES[offset]
					self.show_message('New scale is ' + str(self._offsets[cur_chan]['scale']))
					if str(SCALENAMES[offset]) in SCALEABBREVS.keys():
						newval = list(str(SCALEABBREVS[str(SCALENAMES[offset])]))		#sorry :/
					else:
						newval = list(str(SCALENAMES[offset]))
					if len(newval)>=2:
						self._display_chars(newval[0], newval[1])
					if len(SCALES[self._offsets[cur_chan]['scale']])>8:
						self._offsets[cur_chan]['vert_offset'] = 8
					#self._assign_notes_per_scale(cur_chan)
					self._assign_midi_layer()
	

	def _split_mode_value(self, mode):
		#self.log_message('split mode value' + str(mode))
		if not self.pad_held():
			if self.shift_pressed():
				#if self.select_pressed():
				cur_track = self._mixer._selected_strip._track
				if cur_track.has_midi_input:
					cur_chan = cur_track.current_input_sub_routing
					if len(cur_chan) == 0:
						cur_chan = 'All Channels'
					if cur_chan in CHANNELS:
						cur_chan = (CHANNELS.index(cur_chan)%15)+1
						self._offsets[cur_chan]['split'] = bool(mode)  #not self._offsets[cur_chan]['split'] 
						#self.log_message('split is ' + str(self._offsets[cur_chan]['split'] ))	
	

	def _deassign_all(self):
		self._current_nav_buttons = []
		with self.component_guard():
			self._offset_component.deassign_all()
			self._vertical_offset_component.deassign_all()
			self._scale_offset_component.deassign_all()
			self._device_navigator.deassign_all()
			self._device.deassign_all()
			self._mixer.deassign_all()
			self._selected_session.deassign_all()
			self._session.deassign_all()
			self.set_highlighting_session_component(self._session)
			self._session._do_show_highlight()
			self._user_mode_selector.set_enabled(False)
			self._midi_mode_selector.set_enabled(False)
			self._split_mode_selector.set_enabled(False)
			for pad in self._touchpad:
				pad.set_on_off_values(127, 0)
				pad.release_parameter()
				pad.use_default_message()
				pad.reset(True)
				pad.set_enabled(True)
			for pad in self._pad:
				pad.display_press = False
				pad.set_on_off_values(127, 0)
				pad.release_parameter()
				pad.use_default_message()
				pad.reset(True)
				pad.set_enabled(True)
				pad.set_force_next_value()
			for pad in self._pad_CC:
				pad.release_parameter()
				pad.use_default_message()
				pad.set_enabled(True)
			for button in self._button[4:8]:
				button.set_on_off_values(127, 0)
				button.release_parameter()
				button.use_default_message()
				button.reset(True)
				button.set_enabled(True)
			for fader in self._fader[0:8]:
				fader.release_parameter()
				fader.use_default_message()
				fader.send_value(0, True)
				fader.set_enabled(True)
				#fader.force_next_send()
		#self.request_rebuild_midi_map()
	

	def _set_layer0(self, shifted = False):
		with self.component_guard():
			self._display_mode()
			self._send_midi(LIVEBUTTONMODE)
			self._mixer.master_strip().set_volume_control(self._fader[8])
			self._send_midi(tuple([240, 0, 1, 97, 12, 61, 7, 7, 7, 7, 7, 7, 7, 7, 2, 247]))
			for index in range(8):
				#self._send_midi((191, index+1, LAYERSPLASH[0]))
				self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
				self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
				self._mixer.channel_strip(index).set_volume_control(self._fader[index])
			self._session.set_scene_bank_buttons(self._button[5], self._button[4])
			self._session.set_track_bank_buttons(self._button[6], self._button[7])
			self._current_nav_buttons = self._button[4:8]
			for index in range(4):
				self._button[index+4].set_on_off_values(SESSION_NAV[shifted], 0)
			self._session.update()
			if not shifted:
				for column in range(8): 
					for row in range(4):
						self._scene[row].clip_slot(column).set_launch_button(self._pad[column + (row*8)])
			else:
				self._send_midi(tuple([240, 0, 1, 97, 12, 61, 7, 7, 7, 7, 7, 7, 7, 7, 2, 247]))
				self._session._shifted = True
				for index in range(8):
					#self._send_midi((191, index+1, LAYERSPLASH[0]))
					self._pad[index].set_on_off_values(TRACK_MUTE, 0)
					self._mixer.channel_strip(index).set_mute_button(self._pad[index])
					self._pad[index+8].set_on_off_values(TRACK_SOLO, 0)
					self._mixer.channel_strip(index).set_solo_button(self._pad[index+8])
					self._pad[index+16].set_on_off_values(TRACK_ARM, 0)
					self._mixer.channel_strip(index).set_arm_button(self._pad[index+16])
					self._pad[index+24].set_on_off_values(TRACK_STOP, TRACK_STOP)
					self._pad[index+24].send_value(TRACK_STOP)
				self._session.set_stop_track_clip_buttons(tuple(self._pad[24:32]))
			self._mixer.update()
		self.request_rebuild_midi_map()
	

	def _set_layer1(self, shifted = False):
		with self.component_guard():
			self._display_mode()
			for index in range(4):
				self._mixer.return_strip(index).set_volume_control(self._fader[index+4])
			self._mixer._selected_strip.set_send_controls(tuple(self._fader[0:4]))
			self._mixer.master_strip().set_volume_control(self._fader[8])
			if not shifted:
				self._send_midi(tuple([240, 0, 1, 97, 12, 61, 5, 5, 5, 5, 4, 4, 4, 4, 2, 247]))
				for index in range(8):
					#self._send_midi((191, index+1, LAYERSPLASH[1]))
					self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
					self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
				if self._mixer.shifted() or not self._assign_midi_layer():
					self._send_midi(LIVEBUTTONMODE)
					for column in range(8): 
						for row in range(4):
							self._scene[row].clip_slot(column).set_launch_button(self._pad[column + (row*8)])
					self._session.set_scene_bank_buttons(self._button[5], self._button[4])
					self._session.set_track_bank_buttons(self._button[6], self._button[7])
					self._current_nav_buttons = self._button[4:8]
					self._session.set_show_highlight(True)
					for index in range(4):
						self._button[index+4].set_on_off_values(SESSION_NAV[shifted], 0)
					self._session.update()
			else:
				if not self._assign_midi_shift_layer():
					for index in range(8):
						self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
						self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
					self._send_midi(LIVEBUTTONMODE)
					self._session._shifted = True
					self._session.set_scene_bank_buttons(self._button[5], self._button[4])
					self._session.set_track_bank_buttons(self._button[6], self._button[7])
					self._current_nav_buttons = self._button[4:8]
					#self._session.set_show_highlight(True)
					for index in range(4):
						self._button[index+4].set_on_off_values(SESSION_NAV[shifted], 0)
					self._session.update()
				self._send_midi(tuple([240, 0, 1, 97, 12, 61, 7, 7, 7, 7, 7, 7, 7, 7, 2, 247]))
				for index in range(8):
					#self._send_midi((191, index+1, LAYERSPLASH[0]))
					self._mixer.channel_strip(index).set_volume_control(self._fader[index])
					self._pad[index].set_on_off_values(TRACK_MUTE, 0)
					self._mixer.channel_strip(index).set_mute_button(self._pad[index])
					self._pad[index+8].set_on_off_values(TRACK_SOLO, 0)
					self._mixer.channel_strip(index).set_solo_button(self._pad[index+8])
					self._pad[index+16].set_on_off_values(TRACK_ARM, 0)
					self._mixer.channel_strip(index).set_arm_button(self._pad[index+16])
					self._pad[index+24].set_on_off_values(TRACK_STOP, TRACK_STOP)
					self._pad[index+24].send_value(TRACK_STOP)
				self._session.set_stop_track_clip_buttons(tuple(self._pad[24:32]))
			self._mixer.update()
		self.request_rebuild_midi_map()
	

	def _set_layer2(self, shifted = False):
		with self.component_guard():
			self._display_mode()
			self._device.set_parameter_controls(tuple(self._fader[0:8]))
			self._device.set_enabled(True)
			self._mixer.master_strip().set_volume_control(self._fader[8])
			if not shifted:
				self._send_midi(tuple([240, 0, 1, 97, 12, 61, 6, 6, 6, 6, 6, 6, 6, 6, 2, 247]))
				for index in range(8):
					#self._send_midi((191, index+1, LAYERSPLASH[2]))
					self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
					self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
				if self._mixer.shifted() or not self._assign_midi_layer():
					self._send_midi(LIVEBUTTONMODE)
					for column in range(8): 
						for row in range(4):
							self._scene[row].clip_slot(column).set_launch_button(self._pad[column + (row*8)])
				self._device.set_bank_nav_buttons(self._button[4], self._button[5])
				self._device_navigator.set_nav_buttons(self._button[7], self._button[6])
				self._current_nav_buttons = self._button[4:8]
				for index in range(4):
					self._button[index+4].set_on_off_values(DEVICE_NAV, 0)
				self._device.update()
				self._device_navigator.update()
			else:
				if not self._assign_midi_shift_layer():
					for index in range(8):
						self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
						self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
					self._send_midi(LIVEBUTTONMODE)
					self._session._shifted = True
					for index in range(4):
						self._button[index+4].set_on_off_values(DEVICE_NAV, 0)
					#self._device.update()
					#self._device_navigator.update()
				self._device.deassign_all()
				self._send_midi(tuple([240, 0, 1, 97, 12, 61, 7, 7, 7, 7, 7, 7, 7, 7, 2, 247]))
				for index in range(8):
					#self._send_midi((191, index+1, LAYERSPLASH[0]))
					self._mixer.channel_strip(index).set_volume_control(self._fader[index])
					self._pad[index].set_on_off_values(TRACK_MUTE, 0)
					self._mixer.channel_strip(index).set_mute_button(self._pad[index])
					self._pad[index+8].set_on_off_values(TRACK_SOLO, 0)
					self._mixer.channel_strip(index).set_solo_button(self._pad[index+8])
					self._pad[index+16].set_on_off_values(TRACK_ARM, 0)
					self._mixer.channel_strip(index).set_arm_button(self._pad[index+16])
					self._pad[index+24].set_on_off_values(TRACK_STOP, TRACK_STOP)
					self._pad[index+24].send_value(TRACK_STOP)
				self._session.set_stop_track_clip_buttons(tuple(self._pad[24:32]))
			#self._device.set_bank_nav_buttons(self._button[4], self._button[5])
			#self._device_navigator.set_nav_buttons(self._button[7], self._button[6])
			self._mixer.update()
		self.request_rebuild_midi_map()
	

	def _set_layer3(self, shifted = False):
		self._send_midi(tuple([240, 0, 1, 97, 12, 61, 1, 1, 1, 1, 1, 1, 1, 1, 2, 247]))
		with self.component_guard():
			for pad in self._pad:
				pad.send_value(0, True)
			self._display_mode()
			self._deassign_all()
			self._send_midi(USERBUTTONMODE)
			for index in range(8):
				self._mixer.channel_strip(index).set_select_button(self._touchpad[index])
				self._touchpad[index].set_on_off_values(CHAN_SELECT, 0)
			self._mixer.master_strip().set_volume_control(self._fader[8])
			for button in self._button[4:8]:
				button.set_on_off_values(USERMODE, 0)
			self._user_mode_selector.set_enabled(True)
			self._assign_alternate_mappings(self._user_layer+12)

	

	def _assign_midi_layer(self):
		cur_track = self._mixer._selected_strip._track
		is_midi = False
		if cur_track.has_midi_input:
			#self._send_midi(USERBUTTONMODE)
			if AUTO_ARM_SELECTED:
				if not cur_track.arm:
					self.schedule_message(1, self._arm_current_track, cur_track)
			is_midi = True
			cur_chan = cur_track.current_input_sub_routing
			#self.log_message('cur_chan ' + str(cur_chan) + str(type(cur_chan)) + str(len(cur_chan)))
			if len(cur_chan) == 0:
				cur_chan = 'All Channels'
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan)%15)+1
				offset, vertoffset, scale, split = self._offsets[cur_chan]['offset'], self._offsets[cur_chan]['vertoffset'], self._offsets[cur_chan]['scale'], self._offsets[cur_chan]['split']
				if scale is 'Auto':
					scale = self._detect_instrument_type(cur_track)
					#self.log_message('auto found: ' + str(scale))
				if scale is 'Session':
					is_midi = False
				elif scale in SPLIT_SCALES or split:
					self._send_midi(SPLITBUTTONMODE)
					scale_len = len(SCALES[scale])
					for row in range(4):
						for column in range(4):
							if scale is 'DrumPad':
								self._pad[column + (row*8)].set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
								self._pad[column + (row*8)].scale_color = DRUMCOLORS[column<4]
								#self._pad[column + (row*8)].send_value(DRUMCOLORS[column<4], True)
								self._pad[column + (row*8)].display_press = True
								self._pad[column + (row*8)].press_flash(0, True)
								self._pad_CC[column + (row*8)].set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
							else:
								note_pos = column + (abs(3-row)*int(vertoffset))
								note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
								self._pad[column + (row*8)].set_identifier(note%127)
								self._pad[column + (row*8)].scale_color = KEYCOLORS[(note%12 in WHITEKEYS) + (((note_pos%scale_len)==0)*2)]
								#self._pad[column + (row*8)].send_value(self._pad[column + (row*8)].scale_color, True)
								self._pad[column + (row*8)].display_press = True
								self._pad[column + (row*8)].press_flash(0, True)
								self._pad_CC[column + (row*8)].set_identifier(note%127)
							self._pad[column + (row*8)].set_enabled(False)
							self._pad[column + (row*8)].set_channel(cur_chan)
							self._pad_CC[column + (row*8)].set_enabled(False)
							self._pad_CC[column + (row*8)].set_channel(cur_chan)
							#self._selected_session.deassign_all()
							self._selected_scene[column+(row*4)].clip_slot(0).set_launch_button(self._pad[column + 4 + (row*8)])
					#self._selected_session.set_scene_bank_buttons(self._button[5], self._button[4])
					self.set_highlighting_session_component(self._selected_session)
					self._selected_session._do_show_highlight()
				else:
					self._send_midi(MIDIBUTTONMODE)
					scale_len = len(SCALES[scale])
					for row in range(4):
						for column in range(8):
							if scale is 'DrumPad':
								self._pad[column + (row*8)].set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
								self._pad[column + (row*8)].scale_color = DRUMCOLORS[column<4]
								#self._pad[column + (row*8)].send_value(DRUMCOLORS[column<4], True)
								self._pad[column + (row*8)].display_press = True
								self._pad[column + (row*8)].press_flash(0, True)
								self._pad_CC[column + (row*8)].set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
							else:
								note_pos = column + (abs(3-row)*vertoffset)
								note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
								self._pad[column + (row*8)].set_identifier(note%127)
								self._pad[column + (row*8)].scale_color = KEYCOLORS[(note%12 in WHITEKEYS) + (((note_pos%scale_len)==0)*2)]
								#self._pad[column + (row*8)].send_value(self._pad[column + (row*8)].scale_color, True)
								self._pad[column + (row*8)].display_press = True
								self._pad[column + (row*8)].press_flash(0, True)
								self._pad_CC[column + (row*8)].set_identifier(note%127)
							self._pad[column + (row*8)].set_enabled(False)
							self._pad[column + (row*8)].set_channel(cur_chan)
							self._pad_CC[column + (row*8)].set_enabled(False)
							self._pad_CC[column + (row*8)].set_channel(cur_chan)
					#self._session.set_scene_bank_buttons(self._button[5], self._button[4])
					#self._session.set_track_bank_buttons(self._button[6], self._button[7])
			else:
				is_midi = False
		return is_midi	
	

	def _assign_midi_shift_layer(self):
		cur_track = self._mixer._selected_strip._track
		is_midi = False
		if cur_track.has_midi_input:
			self._send_midi(LIVEBUTTONMODE)
			if AUTO_ARM_SELECTED:
				if not cur_track.arm:
					self.schedule_message(1, self._arm_current_track, cur_track)
			is_midi = True
			cur_chan = cur_track.current_input_sub_routing
			if len(cur_chan) == 0:
				cur_chan = 'All Channels'
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan)%15)+1
				scale = self._offsets[cur_chan]['scale']
				for button in self._touchpad[0:2]:
					button.set_on_off_values(SPLITMODE, 0)
				self._split_mode_selector._mode_index = int(self._offsets[cur_chan]['split'])
				self._split_mode_selector.set_enabled(True)
				if not self._offsets[cur_chan]['scale'] is 'DrumPad':
					for button in self._touchpad[2:4]:
						button.set_on_off_values(VERTOFFSET, 0)
					self._vertical_offset_component._offset = self._offsets[cur_chan]['vertoffset']		
					self._vertical_offset_component.set_offset_change_buttons(self._touchpad[3], self._touchpad[2])
				for button in self._touchpad[4:6]:
					button.set_on_off_values(SCALEOFFSET, 0)
				self._scale_offset_component._offset = SCALENAMES.index(self._offsets[cur_chan]['scale'])
				self._scale_offset_component.set_offset_change_buttons(self._touchpad[5], self._touchpad[4])
				for button in self._touchpad[6:8]:
					button.set_on_off_values(OFFSET, 0)
				if scale is 'Auto':
					scale = self._detect_instrument_type(cur_track)
				if scale is 'DrumPad':
					self._offset_component._offset = self._offsets[cur_chan]['drumoffset']
				else:
					self._offset_component._offset = self._offsets[cur_chan]['offset']		
				self._offset_component.set_offset_change_buttons(self._touchpad[7], self._touchpad[6])
		return is_midi
	

	def _arm_current_track(self, track):
		track.arm = 1
	

	def _assign_alternate_mappings(self, chan = 0):
		self._send_midi(USERBUTTONMODE)
		for pad in self._touchpad:
			pad.use_default_message()
			pad.set_channel(chan)
			pad.set_enabled(False)
			pad.reset()
		for pad in self._pad:
			pad.use_default_message()
			pad.set_channel(chan)
			pad.set_enabled(False)
		for pad in self._pad_CC:
			pad.release_parameter()
			pad.set_channel(chan)
			pad.set_enabled(False)
		"""for pad in self._touchpad:
			pad.use_default_message()
			pad.set_channel(chan)
			pad.set_enabled(chan is 0)
		"""
		for fader in self._fader[0:8]:
			fader.use_default_message()
			fader.set_channel(chan)
			fader.set_enabled(False)
		self.request_rebuild_midi_map()
	

	def _detect_instrument_type(self, track):
		scale = DEFAULT_AUTO_SCALE
		#for device in self._get_devices(track):
		for device in track.devices:
			if isinstance(device, Live.Device.Device):
				#self.log_message('device: ' + str(device.class_name))
				if device.class_name == 'DrumGroupDevice':
					scale = 'DrumPad'
					break
		return scale
	

	def _get_devices(self, track):

		def dig(container_device):
			contained_devices = []
			if container_device.can_have_chains:
				for chain in container_device.chains:
					for chain_device in chain.devices:
						for item in dig(chain_device):
							contained_devices.append(item)
			else:
				contained_devices.append(container_device)
			return contained_devices
		

		devices = []
		for device in track.devices:
			for item in dig(device):
				devices.append(item)
				#self.log_message('appending ' + str(item))
		return devices
	

	"""not currently used"""
	def _assign_notes_per_scale(self, cur_chan):
		offset, vertoffset, scale, split = self._offsets[cur_chan]['offset'], self._offsets[cur_chan]['vertoffset'], self._offsets[cur_chan]['scale'], self._offsets[cur_chan]['split']
		if scale is 'Auto':
			scale = self._detect_instrument_type(cur_chan)
			#self.log_message('auto found: ' + str(scale))
		if scale is 'Drumpad':
			for index in range(16):
				self._pad[index].set_enabled(False)
				self._pad[index].set_identifier((DRUMNOTES[index] + (self._offsets[cur_chan]['drumoffset']*4))%127)
				self._pad[index].set_channel(cur_chan)
				self._pad[index].send_value(DRUMCOLORS[(index%8)<4], True)
				self._scene[int(index/4)].clip_slot(index%4).set_launch_button(self._pad[(index+4)%8])
		elif scale in SPLIT_SCALES or split:
			scale_len = len(SCALES[scale])
			for row in range(4):
				for column in range(4):
					note_pos = column + (abs(3-row)*int(vertoffset/2))
					note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
					self._pad[column + (row*8)].set_enabled(False)
					self._pad[column + (row*8)].set_identifier(note)
					self._pad[column + (row*8)].set_channel(cur_chan)
					self._pad[column + (row*8)].send_value(KEYCOLORS[note%12 in WHITEKEYS] + int((note%12)==0), True)
					self._scene[row].clip_slot(column+4).set_launch_button(self._pad[column + 4 + (row*8)])			
		else:
			scale_len = len(SCALES[scale])
			for row in range(4):
				for column in range(8):
					note_pos = column + (abs(3-row)*vertoffset)
					note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
					self._pad[column + (row*8)].set_enabled(False)
					self._pad[column + (row*8)].set_identifier(note)
					self._pad[column + (row*8)].set_channel(cur_chan)
					self._pad[column + (row*8)].send_value(KEYCOLORS[note%12 in WHITEKEYS] + int((note%12)==0), True)	
	

	def _display_chars(self, char1=None, char2=None):
		if char1 in _base_translations:
			self._send_midi((176, 34, _base_translations[char1]))
		if char2 in _base_translations:
			self._send_midi((176, 35, _base_translations[char2]))
	

	def _display_mode(self):
		char1 = ['L', 'S', 'D', 'U'][self._layer]
		char2 = '-'
		if self.shift_pressed():
			char2 = str(self._layer + 1)
		elif self.select_pressed():
			char2 = 'S'
		elif self._layer is 3:
			char2 = str(self._user_mode_selector._mode_index+1)
		self._display_chars(char1, char2)
	

	def _register_pad_pressed(self, bytes):
		assert(len(bytes) is 8)
		#No damned bin() in Live.py math!!!???
		decoded = []
		for i in range(0, 8):
			bin = bytes[i]
			for index in range(0, 4):
				decoded.append(bin & 1)
				bin = bin>>1
		self._last_pad_stream = decoded
		for index in range(len(decoded)):
			self._stream_pads[index].press_flash(decoded[index])
	

	@subject_slot('value')
	def _on_nav_button_value(self, value, x, y, is_momentary):
		button = self._nav_buttons.get_button(x, y)
		if button in self._current_nav_buttons:
			if value > 0:
				self._send_midi((176, 35, DIRS[self._current_nav_buttons.index(button)]))
			else:
				self._display_mode()
	

	"""called on timer"""
	def update_display(self):
		super(Base, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

	"""m4l bridge"""
	def generate_strip_string(self, display_string):
		NUM_CHARS_PER_DISPLAY_STRIP = 12
		if (not display_string):
			return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
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
		ret = ret.replace(' ', '_')
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	def notification_to_bridge(self, name, value, sender):
		if isinstance(sender, MonoEncoderElement):
			if OSC_TRANSMIT:
				self.oscServer.sendUDP('/Base/'+sender.name+'/lcd_name/ '+str(self.generate_strip_string(name)))
				self.oscServer.sendUDP('/Base/'+sender.name+'/lcd_value/ '+str(self.generate_strip_string(value)))
			#self._monobridge._send(sender.name, 'lcd_name', str(self.generate_strip_string(name)))
			#self._monobridge._send(sender.name, 'lcd_value', str(self.generate_strip_string(value)))"""
	

	def touched(self):
		"""if self._touched is 0:
			self._monobridge._send('touch', 'on')
			self.schedule_message(2, self.check_touch)
		self._touched +=1"""
		pass
	

	def check_touch(self):
		"""if self._touched > 5:
			self._touched = 5
		elif self._touched > 0:
			self._touched -= 1
		if self._touched is 0:
			self._monobridge._send('touch', 'off')
		else:
			self.schedule_message(2, self.check_touch)"""
		pass
		
	

	"""general functionality"""
	def disconnect(self):
		self._deassign_all()
		self._send_midi(STREAMINGOFF)
		if not self._last_selected_track is None:
			if self._last_selected_track.current_input_sub_routing_has_listener(self._on_selected_track_midi_subrouting_changed):
				self._last_selected_track.remove_current_input_sub_routing_listener(self._on_selected_track_midi_subrouting_changed)
		if not self.oscServer is None:
			self.oscServer.shutdown()
		self.oscServer = None
		self.log_message("--------------= Base log closed =--------------")
		super(Base, self).disconnect()
	

	def _on_selected_track_changed(self):
		super(Base, self)._on_selected_track_changed()
		track = self._mixer.selected_strip()._track
		track_list = []
		for t in self._mixer.tracks_to_use():
			track_list.append(t)
		self._selected_session._track_offset = track_list.index(track)
		#self.log_message('new track offset: ' + str(self._selected_session._track_offset))
		self._selected_session._reassign_tracks()
		self._selected_session._reassign_scenes()
		if track.can_be_armed:
			self._last_selected_track_arm = track.arm
		if not self._last_selected_track is None and isinstance(self._last_selected_track, Live.Track.Track) and self._last_selected_track in track_list:
			if self._last_selected_track.current_input_sub_routing_has_listener(self._on_selected_track_midi_subrouting_changed):
				self._last_selected_track.remove_current_input_sub_routing_listener(self._on_selected_track_midi_subrouting_changed)
		self._last_selected_track = track
		if not track is None:
			track.add_current_input_sub_routing_listener(self._on_selected_track_midi_subrouting_changed)
		if not self.pad_held():
			if self._layer in [1, 2]:
				self._deassign_all()
				self._layers[self._layer]()
		else:
			self.schedule_message(2, self._on_selected_track_changed)
	

	def _on_track_list_changed(self):
		super(Base, self)._on_track_list_changed()
	

	def _on_selected_track_midi_subrouting_changed(self):
		#self.log_message('on subrouting changed')
		if self._layer in [1, 2]:
			self._deassign_all()
			self._layers[self._layer]()
	

	def connect_script_instances(self, instanciated_scripts):
		pass
	

	"""some cheap overrides"""

	def set_highlighting_session_component(self, session_component):
		self._highlighting_session_component = session_component
		self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)
	

	"""this method includes a way to distribute MIDI received from Live that has been rerouted to different channels and ids back to its originating button"""
	#def receive_midi(self, midi_bytes):
	#	self.log_message(str(midi_bytes))
	#	super(Base, self).receive_midi(midi_bytes)
	
	def handle_sysex(self, midi_bytes):
		#self.log_message('sysex: ' + str(midi_bytes))
		if len(midi_bytes) > 14:
			if midi_bytes[:6] == tuple([240, 0, 1, 97, 12, 64]):
				self._register_pad_pressed(midi_bytes[6:14])
	

	#def _do_send_midi(self, midi_event_bytes):
	#	self.log_message(str(midi_event_bytes))
	#	super(Base, self)._do_send_midi(midi_event_bytes)

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
		
	

#	a