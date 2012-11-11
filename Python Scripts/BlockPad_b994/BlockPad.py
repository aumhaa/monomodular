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
from _Framework.EncoderElement import EncoderElement

SIDE_NOTES = (80,
 81,
 82,
 83,
 84,
 85,
 86,
 87)

KNOB_CC = [3, 2, 1, 0, 5, 4, 6, 7]

SLIDER_CC = [9, 8]

TOP_NOTES = (71, 68, 66, 67, 69, 70, 64, 89)

class BlockPad(ControlSurface):
	__module__ = __name__
	__doc__ = " Script for Novation's Launchpad Controller adapted to Livid's Block controller and Monomodular by amounra "

	def __init__(self, c_instance):
		ControlSurface.__init__(self, c_instance)
		self._monomod_version = 'b994'
		self.hosts = []
		self._host_name = 'BlockPad'
		self._color_type = 'Monochrome'
		self._timer = 0
		is_momentary = True
		self._suggested_input_port = 'block (Controls)'
		self._suggested_output_port = 'block (Controls)'
		self._wrote_user_byte = False
		matrix = ButtonMatrixElement()
		for row in range(8):
			button_row = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, ((column * 8) + row), 'Button_'+str(column)+'_'+str(row), self) for column in range(8) ]
			matrix.add_row(tuple(button_row))
		knobs = [ EncoderElement(MIDI_CC_TYPE, 0, KNOB_CC[index], Live.MidiMap.MapMode.absolute) for index in range(8) ]
		sliders = [ EncoderElement(MIDI_CC_TYPE, 0, SLIDER_CC[index], Live.MidiMap.MapMode.absolute) for index in range(2) ]
		self._config_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 0)
		self._config_button.add_value_listener(self._config_value)
		top_buttons = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, TOP_NOTES[index], 'Top_Button'+str(index), self) for index in range(8) ]
		side_buttons = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, SIDE_NOTES[index], 'Side_Button'+str(index), self) for index in range(8) ]
		self._setup_monobridge()
		self._setup_monomod()
		self._selector = MainSelectorComponent(matrix, tuple(top_buttons), tuple(side_buttons), self._config_button, tuple(knobs), tuple(sliders), self)
		self._user_byte_write_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 16)
		self._user_byte_value(1)
		self._user_byte_write_button.add_value_listener(self._user_byte_value)
		self.set_enabled(True)
		self.log_message("--------------= BlockPad log opened =--------------") #Create entry in log file
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
		self.log_message("--------------= BlockPad log closed =--------------") #Create entry in log file


	def _user_byte_value(self, value):
		assert (value in range(128))
		enabled = (value == 1)
		if enabled:
			self._config_button.send_value(40)
		self._control_is_with_automap = (not enabled)
		for control in self.controls:
			if isinstance(control, FlashingButtonElement):
				control.set_force_next_value()

		if (not self._wrote_user_byte):
			self._selector.set_mode(0)
			self.set_enabled(enabled)
		else:
			self._wrote_user_byte = False
		self.request_rebuild_midi_map()



	def _config_value(self, value):
		assert (value in range(128))

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
		if(self._timer == 0):
			self._selector._shift_pressed_timer = -12
		self.flash()
	

	def flash(self):
		for row in range(8):
			for column in range(8):
				button = self._selector._matrix.get_button(column, row)
				if(button._flash_state > 0):
					button.flash(self._timer)
	


# local variables:
# tab-width: 4
