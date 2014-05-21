# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
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

from _Framework.ModesComponent import AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.Layer import Layer
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *

from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext

"""Imports from _Mono_Framework"""
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.LiveUtils import *

"""Custom files, overrides, and files from other scripts"""
from MonOhm.MonOhm import MonOhm, FunctionModeComponent
from _Generic.Devices import *
from Map import *


""" Here we define some global variables """
switchxfader = (240, 00, 01, 97, 02, 15, 01, 247)
switchxfaderrgb = (240, 00, 01, 97, 07, 15, 01, 247)
assigncolors = (240, 00, 01, 97, 07, 34, 00, 07, 03, 06, 05, 01, 02, 04, 247)
assign_default_colors = (240, 00, 01, 97, 07, 34, 00, 07, 06, 05, 01, 04, 03, 02, 247)
check_model = (240, 126, 127, 6, 1, 247)


KNOB_CC = [3, 2, 1, 0, 5, 4, 6, 7]

SLIDER_CC = [9, 8]

FUNCTION_NOTES = (71, 68, 66, 67, 69, 70)

LIVID = 64

SHIFT_L = (69)

SHIFT_R = (70)

class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		component.pop_mode(mode)
	

	def update_button(self, component, mode, selected_mode):
		button = component.get_mode_button(mode)
		groups = component.get_mode_groups(mode)
		selected_groups = component.get_mode_groups(selected_mode)
		value = (mode == selected_mode or bool(groups & selected_groups))*32 or 1
		button.send_value(value, True)
	

class ShiftCancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		component.pop_mode(mode)
	

	def update_button(self, component, mode, selected_mode):
		pass
	



class BlockModShiftModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Special Class that uses two shift buttons and is lockable '


	def __init__(self, script, callback, *a, **k):
		super(BlockModShiftModeComponent, self).__init__(*a, **k)
		self._script = script
		self.update = callback
		self._mode_toggle1 = None
		self._mode_toggle2 = None
		self._toggle1_value = 0
		self._toggle2_value = 0
		self._last_mode = 0
		self._set_protected_mode_index(0)
	

	def set_mode_toggle(self, button1, button2):
		assert ((button1 == None) or isinstance(button1, ButtonElement))
		if (self._mode_toggle1 != None):
			self._mode_toggle1.remove_value_listener(self._toggle_value_left)
		self._mode_toggle1 = button1
		if (self._mode_toggle1 != None):
			self._mode_toggle1.add_value_listener(self._toggle_value_left)
		assert ((button2 == None) or isinstance(button2, ButtonElement))
		if (self._mode_toggle2 != None):
			self._mode_toggle2.remove_value_listener(self._toggle_value_right)	
		self._mode_toggle2 = button2
		if (self._mode_toggle2 != None):
			self._mode_toggle2.add_value_listener(self._toggle_value_right)
	

	def _toggle_value_left(self, value):
		self._toggle1_value = value
		self._toggle_value(value, 'left')
	

	def _toggle_value_right(self, value):
		self._toggle2_value = value
		self._toggle_value(value, 'right')
	

	def _toggle_value(self, value, side):
		if self.is_enabled():
			if((value > 0) and ((side is 'left' and self._toggle2_value > 0) or (side is 'right' and self._toggle1_value > 0))):
				if(self._last_mode is 0):
					self._last_mode = 1
					self.set_mode(4) #self.set_mode(self._last_mode)
				else:
					self._last_mode = 0
					#self.set_mode(self._last_mode)
					if(side is 'left'):
						self.set_mode(2)
					if(side is 'right'):
						self.set_mode(3)
			#elif((value > 0) and ((side is 'left' and self._toggle2_value > 0) or (side is 'right' and self._toggle1_value > 0))):	
			elif(value is 0) and (self._toggle1_value is 0) and (self._toggle2_value is 0):
				self.set_mode(self._last_mode)
			elif(value > 0 and self._last_mode is 1):
				self.set_mode(4)
			else:
				if (side is 'left' and value > 0):
					self.set_mode(2)
				elif (side is 'right' and value > 0):
					self.set_mode(3)
	

	def number_of_modes(self):
		return 5
	


class MonomodModeComponent(ModeSelectorComponent):


	def __init__(self, script, callback, *a, **k):
		super(MonomodModeComponent, self).__init__()
		self._script = script
		self.update = callback
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, ButtonElement or FlashingButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	

	def number_of_modes(self):
		return 2
	


class BlockMod(MonOhm):
	__module__ = __name__
	__doc__ = " Monomodular controller script for Livid Block "


	def __init__(self, *a, **k):
		self._shift_button = None
		#self._shift_pressed = 0
		#self._shift_pressed_timer = 0
		#self._shift_thresh = SHIFT_THRESH
		super(BlockMod, self).__init__(*a, **k)
		self._host_name = 'BlockMod'
		self._color_type = 'Monochrome'
		self._link_mixer = LINK_MIXER
		self._rgb = 1
		self._ohm = 127
		self._ohm_type = 'static'
		self._pad_translations = PAD_TRANSLATION
		self._mem = [4, 8, 12, 16]
		#self._host._navbox_selected = 8
	

	"""script initialization methods"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True
		self._fader = [None for index in range(8)]
		self._dial = [None for index in range(16)]
		self._button = [None for index in range(8)]
		self._menu = [None for index in range(6)]
		for index in range(2):
			self._fader[index] = MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, SLIDER_CC[index], Live.MidiMap.MapMode.absolute, 'Fader_' + str(index), index, self)
		#for index in range(8):
		#	self._button[index] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, OHM_BUTTONS[index], 'Button_' + str(index), self)
		for index in range(8):
			self._dial[index] = MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, KNOB_CC[index], Live.MidiMap.MapMode.absolute, 'Dial_' + str(index), index + 8, self)
		for index in range(4):
			self._menu[index] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, FUNCTION_NOTES[index], 'Menu_' + str(index), self)	
		#self._livid = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, LIVID, 'Livid_Button', self)
		self._livid = DoublePressElement(MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, LIVID, 'Livid_Button', self))
		self._shift_l = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_L, 'Shift_Button_Left', self)
		self._shift_r = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_R, 'Shift_Button_Right', self)
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Matrix'
		self._monomod = ButtonMatrixElement()
		self._monomod.name = 'Monomod'
		self._grid = [None for index in range(8)]
		for column in range(8):
			self._grid[column] = [None for index in range(8)]
			for row in range(8):
				self._grid[column][row] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, (column * 8) + row, 'Grid_' + str(column) + '_' + str(row), self)
		for row in range(5):
			button_row = []
			for column in range(7):
				button_row.append(self._grid[column][row])
			self._matrix.add_row(tuple(button_row)) 
		for row in range(8):
			button_row = []
			for column in range(8):
				button_row.append(self._grid[column][row])
			self._monomod.add_row(tuple(button_row))
		self._dummy_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 125)
		self._dummy_button.name = 'Dummy1'
		self._dummy_button2 = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 126)
		self._dummy_button2.name = 'Dummy2'
		self._dummy_button3 = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 127)
		self._dummy_button2.name = 'Dummy3'
	

	def _setup_transport_control(self):
		self._transport = TransportComponent() 
		self._transport.name = 'Transport'
	

	def _setup_crossfader(self):
		pass
	

	def _setup_modes(self):
		self._monomod_mode = MonomodModeComponent(self, self.monomod_mode_update)
		self._monomod_mode.name = 'Monomod_Mode'
		#self.set_shift_button(self._livid)
		self._on_shift_doublepress_value.subject = self._livid.double_press
		self._shift_mode = BlockModShiftModeComponent(self, self.shift_update) 
		self._shift_mode.name = 'Shift_Mode'
		self._shift_mode.set_mode_toggle(self._shift_l, self._shift_r)
		self._l_function_mode = FunctionModeComponent(self, self.l_function_update)
		self._l_function_mode.name = 'Left_Function_Mode'
		self._r_function_mode = FunctionModeComponent(self, self.r_function_update)
		self._r_function_mode.name = 'Right_Function_Mode'
		self._m_function_mode = FunctionModeComponent(self, self.m_function_update)
		self._m_function_mode.name = 'Main_Function_Mode'
		self._function_modes = [self._l_function_mode, self._r_function_mode, self._m_function_mode]
	


	"""livid double press mechanism"""
	def set_shift_button(self, button):
		assert ((button == None) or (isinstance(button, MonoButtonElement)))
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = button
		if self._shift_button != None:
			self._shift_button.add_value_listener(self._shift_value)
	

	def _shift_value(self, value):
		"""self._shift_pressed = int(value != 0)
		if self._shift_pressed > 0:
			if (self._shift_pressed_timer + self._shift_thresh) > self._timer:
				if(self._host._active_client != None):
					if(self._host.is_enabled() != True):
						self._monomod_mode.set_mode(1)
					else:
						self._monomod_mode.set_mode(0)
			else:
				self._shift_pressed_timer = self._timer % 256"""
	

	@subject_slot('value')
	def _on_shift_doublepress_value(self, value):
		self._monomod_mode.set_mode(abs(self._monomod_mode._mode_index -1))
	

	"""shift/zoom methods"""
	def deassign_matrix(self):
		self._session_zoom.set_button_matrix(None)
		self._session_zoom2.set_button_matrix(None)
		#self._session.set_stop_track_clip_buttons(None)
		#self._session2.set_stop_track_clip_buttons(None)
		self._session_zoom_main.set_button_matrix(None)
		#self._session_main.set_stop_track_clip_buttons(None)
		for column in range(4):
			self._mixer2.channel_strip(column).set_select_button(None)
			self._mixer2.return_strip(column).set_mute_button(None)
			self._mixer2.return_strip(column).set_solo_button(None)
			self._mixer2.return_strip(column).set_arm_button(None)
			self._mixer2.return_strip(column).set_crossfade_toggle(None)
			self._mixer2.return_strip(column).set_select_button(None)			#shouldn't this be somewhere else?
			self._mixer2.channel_strip(column).set_crossfade_toggle(None)
			self._mixer2.channel_strip(column).set_mute_button(None)
			self._mixer2.channel_strip(column).set_solo_button(None)
			self._mixer2.channel_strip(column).set_arm_button(None)
			for row in range(5):
				self._scene[row].clip_slot(column).set_launch_button(None)
				self._scene2[row].clip_slot(column).set_launch_button(None)
		for index in range(5):
			self._scene[index].set_launch_button(None)
			self._scene2[index].set_launch_button(None)
			self._scene_main[index].set_launch_button(None)
		self._session_zoom.set_nav_buttons(None, None, None, None)
		self._session_zoom2.set_nav_buttons(None, None, None, None)
		self._session_zoom_main.set_nav_buttons(None, None, None, None)
		self._session.set_track_bank_buttons(None, None)
		self._session.set_scene_bank_buttons(None, None)
		self._session2.set_track_bank_buttons(None, None)
		self._session2.set_scene_bank_buttons(None, None)
		self._session_main.set_track_bank_buttons(None, None)
		self._session_main.set_scene_bank_buttons(None, None)
		for column in range(8):
			self._mixer.channel_strip(column).set_select_button(None)
			self._mixer.channel_strip(column).set_crossfade_toggle(None)
			self._mixer.channel_strip(column).set_mute_button(None)
			self._mixer.channel_strip(column).set_solo_button(None)
			self._mixer.channel_strip(column).set_arm_button(None)
			for row in range(5):
				self._scene_main[row].clip_slot(column).set_launch_button(None)
			for row in range(8):
				self._grid[column][row].set_channel(0)
				self._grid[column][row].release_parameter()
				self._grid[column][row].use_default_message()
				self._grid[column][row].set_enabled(True)
				self._grid[column][row].set_on_off_values(127, 0)
				self._grid[column][row].send_value(0, True)
		self._send_reset.set_buttons(tuple(None for index in range(4)))
	

	def zoom_off(self):
		for column in range(4):
			self._grid[column][5].set_on_value(MUTE[self._rgb])
			self._mixer.channel_strip(column).set_mute_button(self._grid[column][5])
			self._grid[column][6].set_on_value(ARM[self._rgb])
			self._mixer.channel_strip(column).set_arm_button(self._grid[column][6])
			for row in range(5):
				self._scene[row].clip_slot(column).set_launch_button(self._grid[column][row])
			if(self._r_function_mode._mode_index in range(0,3)):
				self._grid[column + 4][5].set_on_value(MUTE[self._rgb])
				self._mixer2.channel_strip(column).set_mute_button(self._grid[column + 4][5])
				self._grid[column + 4][6].set_on_value(ARM[self._rgb])
				self._mixer2.channel_strip(column).set_arm_button(self._grid[column + 4][6])
				for row in range(5):
					self._scene2[row].clip_slot(column).set_launch_button(self._grid[column + 4][row])
			elif(self._r_function_mode._mode_index is 3):
				self._grid[column + 4][5].set_on_value(MUTE[self._rgb])
				self._mixer2.return_strip(column).set_mute_button(self._grid[column + 4][5])
				for row in range(5):
					self._grid[column + 4][row].send_value(USER1_COLOR[self._rgb], True)
					self._grid[column + 4][row].set_channel(RIGHT_USER1_CHANNEL)
					self._grid[column + 4][row].set_identifier(RIGHT_USER1_MAP[column][row])
					self._grid[column + 4][row].set_enabled(False)	 #this has to happen for translate to work
				#self._session_zoom2.set_ignore_buttons(True)
		if(self._r_function_mode._mode_index is 0):
			for index in range(4):
				self._grid[index + 4][7].send_value(SEND_RESET[self._rgb], True)
			self._send_reset.set_buttons(tuple(self._grid[index + 4][7] for index in range(4)))
	

	def zoom_off_m(self):
		self.deassign_dials()
		for column in range(8):
			self._grid[column][5].set_on_value(MUTE[self._rgb])
			self._mixer.channel_strip(column).set_mute_button(self._grid[column][5])
			self._grid[column][6].set_on_value(ARM[self._rgb])
			self._mixer.channel_strip(column).set_arm_button(self._grid[column][6])
			for row in range(5):
				self._scene_main[row].clip_slot(column).set_launch_button(self._grid[column][row])
		#self._session_zoom.set_button_matrix(self._matrix)
	

	def zoom_left(self):
		track_stop_buttons = []
		track_stop_buttons2 = []
		for index in range(4):
			self._grid[index][6].set_off_value(TRACK_STOP[self._rgb])
			track_stop_buttons.append(self._grid[index][6])
			self._grid[index + 4][6].set_off_value(TRACK_STOP[self._rgb])
			track_stop_buttons2.append(self._grid[index + 4][6])
		for index in range(5):
			self._grid[7][index].set_off_value(SCENE_LAUNCH[self._rgb])
			self._scene[index].set_launch_button(self._grid[7][index])
		#self._session.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		#self._session.set_stop_track_clip_buttons(self._matrix.submatrix[:4][7:])
		#self._session2.set_stop_track_clip_buttons(tuple(track_stop_buttons2))
		#self._session2.set_stop_track_clip_buttons(self._matrix.submatrix[4:8][7:])
		self._session_zoom.set_button_matrix(self._matrix)
		self._grid[0][5].set_on_value(RECORD[self._rgb])
		self._transport.set_record_button(self._grid[0][5])
		self._grid[1][5].set_on_value(OVERDUB[self._rgb])
		self._transport.set_overdub_button(self._grid[1][5])
		self._grid[2][5].set_on_value(LOOP[self._rgb])
		self._transport.set_loop_button(self._grid[2][5])
		self._grid[3][5].set_on_value(STOP_ALL[self._rgb])	
		self._session.set_stop_all_clips_button(self._grid[3][5])
		for index in range(4):
			self._grid[index + 4][5].send_value(SEND_RESET[self._rgb], True)
		self._send_reset.set_buttons(tuple(self._grid[index + 4][5] for index in range(4)))
		for index in range(4):
			self._grid[index + 4][7].set_off_value(DEVICE_SELECT[self._rgb])
		self._device_selector.set_matrix(self._monomod.submatrix[4:8][7:])
		self._device_selector.set_offset(4)
	

	def zoom_right(self):
		track_stop_buttons = []
		track_stop_buttons2 = []
		for index in range(4):
			self._grid[index][6].set_off_value(TRACK_STOP[self._rgb])
			track_stop_buttons.append(self._grid[index][6])
		for index in range(5):
			self._grid[7][index].set_off_value(SCENE_LAUNCH[self._rgb])
			self._scene2[index].set_launch_button(self._grid[7][index])
		#self._session.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		#self._session.set_stop_track_clip_buttons(self._matrix.submatrix[:4][7:])
		if(self._r_function_mode._mode_index < 3):
			for index in range(4):
				self._grid[index + 4][6].set_off_value(TRACK_STOP[self._rgb])
				track_stop_buttons2.append(self._grid[index + 4][6])
			#self._session2.set_stop_track_clip_buttons(self._matrix.submatrix[4:8][7:])
			#self._session2.set_stop_track_clip_buttons(tuple(track_stop_buttons2))
		self._session_zoom2.set_button_matrix(self._matrix)
		self._grid[0][5].set_on_value(RECORD[self._rgb])
		self._transport.set_record_button(self._grid[0][5])
		self._grid[1][5].set_on_value(OVERDUB[self._rgb])
		self._transport.set_overdub_button(self._grid[1][5])
		self._grid[2][5].set_on_value(LOOP[self._rgb])
		self._transport.set_loop_button(self._grid[2][5])
		self._grid[3][5].set_on_value(STOP_ALL[self._rgb])
		self._session.set_stop_all_clips_button(self._grid[3][5])
		for index in range(4):
			self._grid[index + 4][5].send_value(SEND_RESET[self._rgb], True)
		self._send_reset.set_buttons(tuple(self._grid[index + 4][5] for index in range(4)))
		for index in range(4):
			self._grid[index][7].set_off_value(DEVICE_SELECT[self._rgb])
		self._device_selector.set_matrix(self._monomod.submatrix[:4][7:])
		self._device_selector.set_offset(0)
	

	def zoom_main(self):
		track_stop_buttons = []
		for index in range(8):
			self._grid[index][6].set_on_value(TRACK_STOP[self._rgb])
			track_stop_buttons.append(self._grid[index][6])
		for index in range(5):
			self._grid[7][index].set_on_value(SCENE_LAUNCH[self._rgb])
			self._scene_main[index].set_launch_button(self._grid[7][index])
		#self._session_main.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		#self._session_main.set_stop_track_clip_buttons(self._matrix[0:8][7:])
		self._session_zoom_main.set_button_matrix(self._matrix)
		self._grid[0][5].set_on_value(RECORD[self._rgb])
		self._transport.set_record_button(self._grid[0][5])
		self._grid[1][5].set_on_value(OVERDUB[self._rgb])
		self._transport.set_overdub_button(self._grid[1][5])
		self._grid[2][5].set_on_value(LOOP[self._rgb])
		self._transport.set_loop_button(self._grid[2][5])
		self._grid[3][5].set_on_value(STOP_ALL[self._rgb])	
		self._session.set_stop_all_clips_button(self._grid[3][5])
		for index in range(4):
			self._grid[index + 4][5].send_value(SEND_RESET[self._rgb], True)
		self._send_reset.set_buttons(tuple(self._grid[index + 4][5] for index in range(4)))
		for index in range(4):
			self._grid[index + 4][7].set_off_value(DEVICE_SELECT[self._rgb])
		self._device_selector.set_matrix(self._monomod.submatrix[4:8][7:])
		self._device_selector.set_offset(4)
	


	"""function mode callbacks"""
	def l_function_update(self):
		mode = self._l_function_mode._mode_index
		if(self._l_function_mode.is_enabled() is False):
			self._l_function_mode.set_mode_buttons(None)
		if not self.modhandler.is_enabled():
			if(self._l_function_mode.is_enabled() is True):
				if(len(self._l_function_mode._modes_buttons) is 0):
					for index in range(4):
						self._mixer.channel_strip(index).set_select_button(None)
					buttons = []
					for index in range(4):
						buttons.append(self._grid[index][7]) 
					self._l_function_mode.set_mode_buttons(tuple(buttons))
				if(self._shift_mode._mode_index is 2):
					for index in range(4):
						if(mode != index):
							self._grid[index][7].turn_off()
						else:
							self._grid[index][7].turn_on()
			if(mode is 0):
				self.assign_device_dials()
				self.show_message('Mixer Split:Dials Device Mode')
			elif(mode is 1):
				self.assign_send_dials()
				self.show_message('Mixer Split:Dials Send Mode')
			elif(mode is 2):
				self.assign_split_volume_dials()
				self.show_message('Mixer Split:Dials Volume Mode')
			elif(mode is 3):
				self.assign_user_dials()
				self.show_message('Mixer Split:Dials User Map Mode')
	

	def r_function_update(self):
		mode = self._r_function_mode._mode_index
		if(self._r_function_mode.is_enabled() is False):
			self._r_function_mode.set_mode_buttons(None)
			#self._session2.set_show_highlight(False)
			#self._session._highlighting_callback(self._session._track_offset, self._session._scene_offset, 4, 5, 1)
		if not self.modhandler.is_enabled():
			if(self._r_function_mode.is_enabled() is True):
				if(len(self._r_function_mode._modes_buttons) is 0):
					for index in range(4):
						self._mixer2.channel_strip(index).set_select_button(None)
					buttons = []
					for index in range(4):
						buttons.append(self._grid[index + 4][7]) 
					self._r_function_mode.set_mode_buttons(tuple(buttons))
				if(self._shift_mode._mode_index is 3):
					for index in range(4):
						if(mode != index):
							self._grid[index + 4][7].turn_off()
						else:
							self._grid[index + 4][7].turn_on()
			self._session2.set_offsets(int(self._mem[mode]), self._session2._scene_offset)
			self.show_message('Mixer Split: Track Offset' + str(RIGHT_MODE_OFFSETS[mode]))
	

	def m_function_update(self):
		mode = self._m_function_mode._mode_index
		if(self._m_function_mode.is_enabled() is False):
			self._m_function_mode.set_mode_buttons(None)
			#self._session.set_show_highlight(False)
			#self._session2.set_show_highlight(False)
			#self._session_main._highlighting_callback(self._session_main._track_offset, self._session_main._scene_offset, 8, 5, 1)
		if not self.modhandler.is_enabled():
			if(self._m_function_mode.is_enabled() is True):
				if(len(self._m_function_mode._modes_buttons) is 0):
					for index in range(8):
						self._mixer.channel_strip(index).set_select_button(None)
					buttons = []
					for index in range(4):
						buttons.append(self._grid[index][7]) 
					self._m_function_mode.set_mode_buttons(tuple(buttons))
				if(self._shift_mode._mode_index is 4):
					for index in range(4):
						if(mode != index):
							self._grid[index][7].turn_off()
						else:
							self._grid[index][7].turn_on()
			if(mode is 0):
				self.assign_device_dials()
				self.show_message('Mixer Linked:Dials Device Mode')
			elif(mode is 1):
				self.assign_send_dials()
				self.show_message('Mixer Linked:Dials Send Mode')
			elif(mode is 2):
				self.assign_volume_dials()
				self.show_message('Mixer Linked:Dials Volume Mode')
			elif(mode is 3):
				self.assign_user_dials()
				self.show_message('Mixer Linked:Dials User Map Mode')
	

	def shift_update(self):
		self._clutch_device_selection = True
		#self.allow_updates(False)
		#if(not self._in_build_midi_map):
		#	self.set_suppress_rebuild_requests(True)
		self.deassign_channel_select_buttons()
		self.deassign_matrix()
		self.deassign_menu()
		if(self._monomod_mode._mode_index is 0):		#if monomod is not on
			if(self._shift_mode._mode_index is 0):							#if no shift is pressed
				self._shift_mode._mode_toggle1.turn_off()
				self._shift_mode._mode_toggle2.turn_off()
				if(self.split_mixer() is False):
					self.set_split_mixer(True)
				for zoom in self._zooms:
					zoom._on_zoom_value(0)
				self.zoom_off()
				self._device_selector.set_enabled(False)
				for mode in self._function_modes:
					mode.set_enabled(False)
				self.assign_channel_select_buttons()
				#self._recalculate_selected_channel()
				#self.assign_transport_to_menu()
				self.assign_session_nav_to_menu()
				self.l_function_update()
				self.r_function_update()
				self.assign_crossfader()
				self.set_highlighting_session_component(self._session)
				self._session._do_show_highlight()	
				#self._session.set_show_highlight(True)
			elif(self._shift_mode._mode_index is 1):						#if no shift is pressed, but mixer is linked
				self._shift_mode._mode_toggle1.turn_on()
				self._shift_mode._mode_toggle2.turn_on()
				if(self.split_mixer() is True):
					self.set_split_mixer(False)
				for zoom in self._zooms:
					zoom._on_zoom_value(0)
				self.zoom_off_m()
				self._device_selector.set_enabled(False)
				for mode in self._function_modes:
					mode.set_enabled(False)
				self.assign_main_channel_select_buttons()
				self.assign_session_main_nav_to_menu()
				self.m_function_update()
				self.assign_crossfader()
				self.set_highlighting_session_component(self._session_main)
				self._session_main._do_show_highlight()
			elif(self._shift_mode._mode_index > 1):						#if a shift is pressed
				self.assign_device_nav_to_menu()
				self.deassign_channel_select_buttons()
				if(self._shift_mode._mode_index is 2):					#if shift left
					self._shift_mode._mode_toggle1.turn_on()
					self.zoom_left()
					self._session_zoom._on_zoom_value(1)
					self._session.set_enabled(True) #this is a workaround so that the stop buttons still function
					self._l_function_mode.set_enabled(True)
					self.set_highlighting_session_component(self._session)
					self._session._do_show_highlight()
				elif(self._shift_mode._mode_index is 3):				#if shift right
					self._shift_mode._mode_toggle2.turn_on()
					self.zoom_right()
					self._session_zoom2._on_zoom_value(1)
					self._session2.set_enabled(True)  #this is a workaround so that the stop buttons still function
					self._r_function_mode.set_enabled(True)
					self.assign_master_fader()
					if(self._r_function_mode._mode_index < 4):
						self.set_highlighting_session_component(self._session2)
						self._session2._do_show_highlight()
				elif(self._shift_mode._mode_index is 4):				#if either shift pressed while mixer is linked
					self._shift_mode._mode_toggle1.turn_on()
					self._shift_mode._mode_toggle2.turn_on()
					self.zoom_main()
					self._session_zoom_main._on_zoom_value(1)
					self._session_main.set_enabled(True) #this is a workaround so that the stop buttons still function
					self._m_function_mode.set_enabled(True)
					self.assign_master_fader()
					self.set_highlighting_session_component(self._session_main)
					self._session_main._do_show_highlight()
				self._device_selector.set_enabled(True)
			#self.modhandler._shift_value(int(self._shift_mode._mode_index>1))
		else:
			for mode in self._function_modes:
				mode.set_enabled(False)
		self.allow_updates(True)
		#self.set_suppress_rebuild_requests(False)
		self._clutch_device_selection = False
		if(self._shift_mode._mode_index < 2):
			self._monobridge._send('touch', 'off')
		else:
			self._monobridge._send('touch', 'on')
	

	def monomod_mode_update(self):
		if(self._monomod_mode._mode_index == 0):
			self.modhandler.set_enabled(False)
			self.modhandler.set_grid(None)
			self.modhandler.set_nav_buttons(None)
			self.modhandler.set_shiftlock_button(None)
			self.modhandler.set_alt_button(None)
			self._livid.turn_off()
			self._shift_mode.set_mode_toggle(self._shift_l, self._shift_r)
			self._shift_mode.update()
			#self._session._reassign_scenes()

		elif(self._monomod_mode._mode_index == 1):
			self._livid.turn_on()
			self.deassign_matrix()
			self.deassign_menu()
			#self._monomod.reset()
			self.modhandler.set_grid(self._monomod)
			self.modhandler.set_nav_buttons(self._menu[0:4])
			self.modhandler.set_shiftlock_button(self._shift_l)
			self.modhandler.set_alt_button(self._shift_r)
			self.modhandler.set_shift_button(self._livid)
			self.modhandler.set_enabled(True)
			self._shift_mode.set_mode_toggle(None, None)
			#self._shift_mode.update()
			self.show_message('Monomod grid enabled')
	

	"""left control management methods"""
	def deassign_dials(self):
		for index in range(8):
			self._dial[index].use_default_message()
			self._dial[index].release_parameter()
			self._dial[index].set_enabled(True)
		if(self._device._parameter_controls != None):
			for control in self._device._parameter_controls:
				control.release_parameter()
			self._device._parameter_controls = None
		self._mixer.selected_strip().set_send_controls(None)
		self._mixer.selected_strip().set_volume_control(None)
		for track in range(4):
			self._mixer.channel_strip(track).set_volume_control(None)
			self._mixer.channel_strip(track+4).set_volume_control(None)
			self._mixer2.channel_strip(track).set_volume_control(None)
			self._mixer2.return_strip(track).set_volume_control(None)
	

	def assign_device_dials(self):
		self._ohm_type = OHM_TYPE[0]
		self._ohm = OHM_VALUE[0]
		self.deassign_dials()
		self._device.set_enabled(True)
		device_param_controls = []
		for index in range(8):
			device_param_controls.append(self._dial[index])
		self._device.set_parameter_controls(tuple(device_param_controls))
		self._mixer.selected_strip().set_volume_control(self._fader[0])
	

	def assign_send_dials(self):
		self._ohm_type = OHM_TYPE[1]
		self._ohm = OHM_VALUE[1]
		self.deassign_dials()
		dials = []
		for index in range(4):
			dials.append(self._dial[index])
		for index in range(4):
			if(self._mixer2.return_strip(index)):
				self._mixer2.return_strip(index).set_volume_control(self._dial[index + 4])
		self._mixer.selected_strip().set_send_controls(tuple(dials))
		self._mixer.selected_strip().set_volume_control(self._fader[0])
	

	def assign_volume_dials(self):
		self._ohm_type = OHM_TYPE[2]
		self._ohm = OHM_VALUE[2]
		self.deassign_dials()
		for track in range(8):
			self._mixer.channel_strip(track).set_volume_control(self._dial[track])
		self._mixer.selected_strip().set_volume_control(self._fader[0])
	

	def assign_split_volume_dials(self):
		self._ohm_type = OHM_TYPE[2]
		self._ohm = OHM_VALUE[2]
		self.deassign_dials()
		for track in range(4):
			self._mixer.channel_strip(track).set_volume_control(self._dial[track])
			self._mixer2.channel_strip(track).set_volume_control(self._dial[track+4])
		self._mixer.selected_strip().set_volume_control(self._fader[0])
	

	def assign_user_dials(self):
		self._ohm_type = OHM_TYPE[3]
		self._ohm = OHM_VALUE[3]
		self.deassign_dials()
		for index in range(8):
			self._dial[index].set_channel(L_USER_DIAL_CHAN)
			self._dial[index].set_identifier(L_USER_DIAL_MAP[index])
			self._dial[index].set_enabled(False)
		self._mixer.selected_strip().set_volume_control(self._fader[0])
	


	"""menu button management methods"""
	def deassign_menu(self):
		self._device.set_lock_button(None)
		self._device.set_on_off_button(None)
		self._device_navigator.set_device_nav_buttons(None, None)	
		self._device.set_bank_nav_buttons(None, None)
		self._transport.set_play_button(None)	
		self._transport.set_record_button(None) 
		self._transport.set_stop_button(None)
		self._transport.set_loop_button(None)	
		self._transport.set_overdub_button(None)	
		self._session.set_stop_all_clips_button(None)
		self._transport.set_play_button(None)	
		self._transport.set_stop_button(None)
		self._session_main.set_track_bank_buttons(None, None)
		self._session_main.set_scene_bank_buttons(None, None)
	

	def assign_device_nav_to_menu(self):
		self._device_navigator.set_device_nav_buttons(self._menu[2], self._menu[3]) 
		self._device.set_bank_nav_buttons(self._menu[0], self._menu[1])
	

	def assign_transport_to_menu(self):
		self._transport.set_play_button(self._menu[0])	
		self._transport.set_record_button(self._menu[2])
		self._transport.set_stop_button(self._menu[1])
		session.set_stop_all_clips_button(self._menu[3])
	

	def assign_session_nav_to_menu(self):
		self._session.set_track_bank_buttons(self._menu[3], self._menu[2])
		self._session.set_scene_bank_buttons(self._menu[1], self._menu[0])
	

	def assign_monomod_shift_to_menu(self):
		self._device_navigator.set_device_nav_buttons(self._menu[3], self._menu[2]) 
		self._device.set_bank_nav_buttons(self._menu[1], self._menu[0])
	

	def assign_session_bank_to_menu(self):
		self._session.set_track_bank_buttons(self._menu[3], self._menu[2])
		self._session.set_scene_bank_buttons(self._menu[1], self._menu[0])
	

	def assign_session2_bank_to_menu(self):
		self._session2.set_track_bank_buttons(self._menu[3], self._menu[2])
		self._session2.set_scene_bank_buttons(self._menu[1], self._menu[0])
	

	def assign_session_main_nav_to_menu(self):
		self._session_main.set_track_bank_buttons(self._menu[3], self._menu[2])
		self._session_main.set_scene_bank_buttons(self._menu[1], self._menu[0])
	


	"""channel selection management methods"""
	def deassign_channel_select_buttons(self):
		for index in range(8):
			if(self._mixer.channel_strip(index)):
				self._mixer.channel_strip(index).set_select_button(None)
			self._grid[index][7].release_parameter()
		for index in range(4):
			self._mixer2.channel_strip(index).set_select_button(None)
			self._mixer2.return_strip(index).set_select_button(None)
			self._mixer2.master_strip().set_select_button(None)
			self._grid[index + 4][7].release_parameter()
	

	def assign_channel_select_buttons(self):
		for index in range(4):
			#if(self._mixer.channel_strip(index)):
			self._grid[index][7].set_on_off_values(127, 0)
			self._mixer.channel_strip(index).set_select_button(self._grid[index][7])
		if(self._r_function_mode._mode_index < 3):
			for index in range(4):
				self._grid[index][7].set_on_off_values(127, 0)
				self._mixer2.channel_strip(index).set_select_button(self._grid[index + 4][7])	
		else:
			for index in range(4):
				self._grid[index][7].set_on_off_values(1, 0)
				self._mixer2.return_strip(index).set_select_button(self._grid[index + 4][7])
	

	def assign_return_select_buttons(self):
		for index in range(4):
			self._grid[index + 4][7].set_off_value(0) 
			if(self._mixer.channel_strip(index)):
				self._grid[index + 4][7].set_on_value(1)
				self._mixer.channel_strip(index).set_select_button(self._grid[index + 4][7])
	

	def assign_l_channel_select_buttons(self):
		self._mixer.set_select_buttons(None, None)
		self._session.set_select_buttons(None, None)
		for index in range(4):
			self._grid[index][7].set_off_value(0)
			if(self._mixer.channel_strip(index)):
				self._mixer.channel_strip(index).set_select_button(self._grid[index][7])
	

	def assign_r_channel_select_buttons(self):
		self._mixer2.set_select_buttons(None, None)
		self._session2.set_select_buttons(None, None)
		for index in range(4):
			self._grid[index + 4][7].set_off_value(0)
			if(self._mixer2.channel_strip(index)):
				self._mixer2.channel_strip(index).set_select_button(self._grid[index + 4][7])
	

	def assign_main_channel_select_buttons(self):
		for index in range(8):
			self._grid[index][7].set_off_value(0)
			if(self._mixer.channel_strip(index)):
				self._grid[index][7].set_on_value(127)
				self._mixer.channel_strip(index).set_select_button(self._grid[index][7])
	

	def assign_master_fader(self):
		self._mixer.set_crossfader_control(None)
		self._mixer.master_strip().set_volume_control(self._fader[1])
	

	def assign_crossfader(self):
		self._mixer.master_strip().set_volume_control(None)
		self._mixer.set_crossfader_control(self._fader[1])
	


	"""called on timer"""
	def update_display(self):
		super(BlockMod, self).update_display()
		if(self._timer == 0):
			self._shift_pressed_timer = -12
	

	def strobe(self):
		if(self._ohm_type != 'static'):
			if(self._ohm_type is 'pulse'):
				self._ohm = int(math.fabs(((self._timer * 8) % 64) -32) +32)
			if(self._ohm_type is 'up'):
				self._ohm = int(((self._timer * 4) % 64) + 16)
			if(self._ohm_type is 'down'):
				self._ohm = int(math.fabs(int(((self._timer * 4) % 64) - 64)) + 16)
		self._send_midi(tuple([176, 63, int(self._ohm)]))
		self._send_midi(tuple([176, 31, int(self._ohm)]))	
	

	def handle_sysex(self, midi_bytes):
		pass
	

	def _on_session_offset_changes(self):
		if self._r_function_mode._mode_index in range(0,4):
			self._mem[int(self._r_function_mode._mode_index)] = self._session2.track_offset()
	



#	a