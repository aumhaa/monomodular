# by amounra 0313 : http://www.aumhaa.com

from __future__ import with_statement
import Live

from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement

from ConfigurableButtonElement import ConfigurableButtonElement
from MainSelectorComponent import MainSelectorComponent

from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement

from MonomodComponent import MonomodComponent

from _Framework.M4LInterfaceComponent import M4LInterfaceComponent

SIDE_NOTES = (8, 24, 40, 56, 72, 88, 104, 120)
DRUM_NOTES = (41, 42, 43, 44, 45, 46, 47, 57, 58, 59, 60, 61, 62, 63, 73, 74, 75, 76, 77, 78, 79, 89, 90, 91, 92, 93, 94, 95, 105, 106, 107)

class LaunchMod(ControlSurface):
	""" Script for Novation's Launchpad Controller """

	def __init__(self, c_instance):
		ControlSurface.__init__(self, c_instance)
		with self.component_guard():
			self._monomod_version = 'b995'
			self._host_name = 'LaunchMod'
			self._color_type = 'Launchpad'
			self.hosts = []
			self._timer = 0
			self._suppress_send_midi = True
			self._suppress_session_highlight = True
			self._suppress_highlight = False
			is_momentary = True
			self._suggested_input_port = 'Launchpad'
			self._suggested_output_port = 'Launchpad'
			self._control_is_with_automap = False
			self._user_byte_write_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 16)
			self._user_byte_write_button.name = 'User_Byte_Button'
			self._user_byte_write_button.send_value(1)
			self._user_byte_write_button.add_value_listener(self._user_byte_value)
			self._wrote_user_byte = False
			self._challenge = Live.Application.get_random_int(0, 400000000) & 2139062143
			matrix = ButtonMatrixElement()
			matrix.name = 'Button_Matrix'
			for row in range(8):
				button_row = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, ((row * 16) + column), str(column) + '_Clip_' + str(row) + '_Button', self) for column in range(8) ]
				matrix.add_row(tuple(button_row))
			self._config_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 0, optimized_send_midi=False)
			self._config_button.add_value_listener(self._config_value)
			top_button_names = ['Bank_Select_Up_Button', 'Bank_Select_Down_Button', 'Bank_Select_Left_Button', 'Bank_Select_Right_Button', 'Session_Button', 'User1_Button', 'User2_Button', 'Mixer_Button']
			side_button_names = ['Vol_Button', 'Pan_Button', 'SndA_Button',  'SndB_Button', 'Stop_Button', 'Trk_On_Button', 'Solo_Button', 'Arm_Button']
			top_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_CC_TYPE, 0, (104 + index), top_button_names[index], self) for index in range(8) ]
			side_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, SIDE_NOTES[index], side_button_names[index], self) for index in range(8) ]
			self._setup_monobridge()
			self._setup_monomod()
			self._selector = MainSelectorComponent(matrix, tuple(top_buttons), tuple(side_buttons), self._config_button, self)
			self._selector.name = 'Main_Modes'
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.add_value_listener(self._button_value)
			self.set_highlighting_session_component(self._selector.session_component())
			self._suppress_session_highlight = False
		self.log_message("--------------= " + str(self._monomod_version) + " log opened =--------------") #Create entry in log file


	

	def allow_updates(self, allow_updates):
		for component in self.components:
			component.set_allow_update(int(allow_updates!=0))

	def disconnect(self):
		self._suppress_send_midi = True
		for control in self.controls:
			if isinstance(control, ConfigurableButtonElement):
				control.remove_value_listener(self._button_value)

		self._selector = None
		self._user_byte_write_button.remove_value_listener(self._user_byte_value)
		self._config_button.remove_value_listener(self._config_value)
		ControlSurface.disconnect(self)
		self._suppress_send_midi = False
		self._config_button.send_value(32)
		self._config_button.send_value(0)
		self._config_button = None
		self._user_byte_write_button.send_value(0)
		self._user_byte_write_button = None

	def refresh_state(self):
		ControlSurface.refresh_state(self)
		self.schedule_message(5, self._update_hardware)

	def handle_sysex(self, midi_bytes):
		if len(midi_bytes) == 8:
			if midi_bytes[1:5] == (0, 32, 41, 6):
				response = long(midi_bytes[5])
				response += long(midi_bytes[6]) << 8
				if response == Live.Application.encrypt_challenge2(self._challenge):
					self._suppress_send_midi = False
					self.set_enabled(True)

	def build_midi_map(self, midi_map_handle):
		ControlSurface.build_midi_map(self, midi_map_handle)
		if self._selector.mode_index == 1:
			new_channel = self._selector.channel_for_current_mode()
			for note in DRUM_NOTES:
				self._translate_message(MIDI_NOTE_TYPE, note, 0, note, new_channel)

	def _send_midi(self, midi_bytes, optimized = None):
		sent_successfully = False
		if not self._suppress_send_midi:
			sent_successfully = ControlSurface._send_midi(self, midi_bytes, optimized=optimized)
		return sent_successfully

	def _update_hardware(self):
		self._suppress_send_midi = False
		self._wrote_user_byte = True
		self._user_byte_write_button.send_value(1)
		self._suppress_send_midi = True
		self.set_enabled(False)
		self._suppress_send_midi = False
		self._send_challenge()


	def _send_challenge(self):
		for index in range(4):
			challenge_byte = self._challenge >> 8 * index & 127
			self._send_midi((176, 17 + index, challenge_byte))

	def _user_byte_value(self, value):
		assert value in range(128)
		enabled = self._wrote_user_byte or value == 1
		self._control_is_with_automap = not enabled
		self._suppress_send_midi = self._control_is_with_automap
		if not self._control_is_with_automap:
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.set_force_next_value()

		self._selector.set_mode(0)
		self.set_enabled(enabled)
		self._suppress_send_midi = False

	def _button_value(self, value):
		assert value in range(128)

	def _config_value(self, value):
		assert value in range(128)

	def _set_session_highlight(self, track_offset, scene_offset, width, height, include_return_tracks):
		if not self._suppress_session_highlight:
			ControlSurface._set_session_highlight(self, track_offset, scene_offset, width, height, include_return_tracks)
	

	def _setup_m4l_interface(self):
		self._m4l_interface = M4LInterfaceComponent(controls=self.controls, component_guard=self.component_guard)
		self.get_control_names = self._m4l_interface.get_control_names
		self.get_control = self._m4l_interface.get_control
		self.grab_control = self._m4l_interface.grab_control
		self.release_control = self._m4l_interface.release_control
	

	"""Mono overrides and additions"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_monomod(self):
		self._host = MonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self.hosts = [self._host]
	

	def update_display(self):
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if self._host.is_enabled():
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

	#def set_highlighting_session_component(self, session_component):
	#	self._highlighting_session_component = session_component
	#	if session_component:
	#		self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)
	


