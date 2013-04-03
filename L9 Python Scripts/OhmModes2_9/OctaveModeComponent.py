# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement
from Ohm64_Map import *

INC_DEC = [-1, 1]

class OctaveModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '

	def __init__(self, script):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._mode_index = 3

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
			if (self._mode_index < 6):
				self._modes_buttons[1].turn_on()
			else:
				self._modes_buttons[1].turn_off()
			if (self._mode_index > 0):
				self._modes_buttons[0].turn_on()
			else:
				self._modes_buttons[0].turn_off()
		

	def set_mode(self, mode):
		assert isinstance(mode, int)
		mode = max(min(self._mode_index + INC_DEC[mode], 7), 0)
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()		
			

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, ButtonElement or FlashingButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	
	def number_of_modes(self):
		return 7
		
	def update(self):
		if(self.is_enabled() is True):
			for column in range(8):
				for row in range(3):
					self._script._grid[column][row + 4].set_identifier(int(PAGE1_KEYS_MAP[column][row]) + int(PAGE1_MODES_MAP[self._script._scale_mode._mode_index][column]) + int(self._script._octave_mode._mode_index * 12)) 
			if (self._mode_index < 6):
				self._modes_buttons[0].turn_on()
			else:
				self._modes_buttons[0].turn_off()
			if (self._mode_index > 0):
				self._modes_buttons[1].turn_on()
			else:
				self._modes_buttons[1].turn_off()
		
				
# local variables:
# tab-width: 4
