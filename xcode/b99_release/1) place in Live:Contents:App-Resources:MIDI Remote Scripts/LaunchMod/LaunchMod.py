# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from ConfigurableButtonElement import ConfigurableButtonElement
from MainSelectorComponent import MainSelectorComponent
from MonomodComponent import MonomodComponent
from MonoBridgeElement import MonoBridgeElement
from FlashingButtonElement import FlashingButtonElement

SIDE_NOTES = (8,
 24,
 40,
 56,
 72,
 88,
 104,
 120)
class LaunchMod(ControlSurface):
	__module__ = __name__
	__doc__ = " Script for Novation's Launchpad Controller "

	def __init__(self, c_instance):
		ControlSurface.__init__(self, c_instance)
		self._monomod_version = 'b99'
		self.hosts = []
		self._timer = 0
		self.set_suppress_rebuild_requests(True)
		self._suppress_send_midi = True
		self._suppress_session_highlight = True
		is_momentary = True
		self._suggested_input_port = 'Launchpad'
		self._suggested_output_port = 'Launchpad'
		self._wrote_user_byte = False
		self._control_is_with_automap = False
		self._challenge = (Live.Application.get_random_int(0, 400000000) & 2139062143)
		matrix = ButtonMatrixElement()
		for row in range(8):
			#button_row = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, ((row * 16) + column)) for column in range(8) ]
			button_row = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, ((row * 16) + column), 'Button_'+str(row)+'_'+str(column), self) for column in range(8) ]
			matrix.add_row(tuple(button_row))
		self._config_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 0)
		self._config_button.add_value_listener(self._config_value)
		top_buttons = [ FlashingButtonElement(is_momentary, MIDI_CC_TYPE, 0, (104 + index), 'Top_Button'+str(index), self) for index in range(8) ]
		side_buttons = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, SIDE_NOTES[index], 'Side_Button'+str(index), self) for index in range(8) ]
		self._setup_monobridge()
		self._setup_monomod()
		self._selector = MainSelectorComponent(matrix, tuple(top_buttons), tuple(side_buttons), self._config_button, self)
		self._suppress_session_highlight = False
		self._suppress_send_midi = False
		self._user_byte_write_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 16)
		self._user_byte_write_button.send_value(1)
		self._user_byte_write_button.add_value_listener(self._user_byte_value)
		self._suppress_send_midi = True
		self.set_suppress_rebuild_requests(False)
		self.log_message("--------------= LaunchMod log opened =--------------") #Create entry in log file
		self.refresh_state()

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_monomod(self):
		self._host = MonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self.hosts = [self._host]
	

	def disconnect(self):
		self._suppress_send_midi = True
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
		self.log_message("--------------= LaunchMod log closed =--------------") #Create entry in log file



	def refresh_state(self):
		ControlSurface.refresh_state(self)
		self.schedule_message(5, self._update_hardware)



	def handle_sysex(self, midi_bytes):
		if (len(midi_bytes) == 8):
			if (midi_bytes[1:5] == (0,
			 32,
			 41,
			 6)):
				response = long(midi_bytes[5])
				response += (long(midi_bytes[6]) << 8)
				if (response == Live.Application.encrypt_challenge2(self._challenge)):
					self._suppress_send_midi = False
					self.set_enabled(True)
					#self.refresh_state()



	def _send_midi(self, midi_bytes):
		if (not self._suppress_send_midi):
			ControlSurface._send_midi(self, midi_bytes)



	def _update_hardware(self):
		self._suppress_send_midi = False
		self._config_button.send_value(40)
		self._wrote_user_byte = True
		self._user_byte_write_button.send_value(1)
		self._suppress_send_midi = True
		self.set_enabled(False)
		self._suppress_send_midi = False
		self._send_challenge()



	def _send_challenge(self):
		for index in range(4):
			challenge_byte = ((self._challenge >> (8 * index)) & 127)
			self._send_midi((176,
			 (17 + index),
			 challenge_byte))




	def _user_byte_value(self, value):
		assert (value in range(128))
		enabled = (value == 1)
		if enabled:
			self._config_button.send_value(40)
		self._control_is_with_automap = (not enabled)
		for control in self.controls:
			if isinstance(control, ConfigurableButtonElement):
				control.set_force_next_value()

		if (not self._wrote_user_byte):
			self._selector.set_mode(0)
			self.set_enabled(enabled)
		else:
			self._wrote_user_byte = False
		self.request_rebuild_midi_map()



	def _config_value(self, value):
		assert (value in range(128))



	def _set_session_highlight(self, track_offset, scene_offset, width, height, include_returns = False):
		if (not self._suppress_session_highlight):
			ControlSurface._set_session_highlight(self, track_offset, scene_offset, width, height, include_returns)



	def _install_forwarding(self, control):
		result = False
		if ((not self._control_is_with_automap) or (control == self._user_byte_write_button)):
			result = ControlSurface._install_forwarding(self, control)
		return result



	def _translate_message(self, type, from_identifier, from_channel, to_identifier, to_channel):
		if (not self._control_is_with_automap):
			ControlSurface._translate_message(self, type, from_identifier, from_channel, to_identifier, to_channel)


	def update_display(self):
		""" Live -> Script
		Aka on_timer. Called every 100 ms and should be used to update display relevant
		parts of the controller
		"""
		for message in self._scheduled_messages:
			message['Delay'] -= 1
			if (message['Delay'] == 0):
				if (message['Parameter'] != None):
					message['Message'](message['Parameter'])
				else:
					message['Message']()
					del self._scheduled_messages[self._scheduled_messages.index(message)]

		for callback in self._timer_callbacks:
			callback()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		#if(self.flash_status > 0):
		for row in range(8):
			if(self._selector._side_buttons[row]._flash_state > 0):
				self._selector._side_buttons[row].flash(self._timer)
			for column in range(8):
				button = self._selector._matrix.get_button(column, row)
				if(button._flash_state > 0):
					button.flash(self._timer)
		for index in range(4):
			if(self._selector._nav_buttons[index]._flash_state > 0):
				self._selector._nav_buttons[index].flash(self._timer)
			if(self._selector._modes_buttons[index]._flash_state > 0):
				self._selector._modes_buttons[index].flash(self._timer)
	


# local variables:
# tab-width: 4
