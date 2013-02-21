# emacs-mode: -*- python-*-
import Live
#from MonOhmod import MonOhmod
from ShiftModeComponent import ShiftModeComponent
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement

class FunctionModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '

	def __init__(self, script, update):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._update = update
		self._mode_index = 0
		self._l_mode_index = 0
		self._r_mode_index = 0
		self._m_mode_index = 0

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
		return 6
		
	def update(self):
	#	for index in range(self.number_of_modes()):
	#		self._script._menu[index].turn_off()
	#	if(self._script._shift_mode._mode_index is 0):
	#		self._script._menu[self._mode_index].turn_on()
	#	elif(self._script._shift_mode._mode_index is 1):
	#		self._script._menu[self._l_mode_index].turn_on()
	#	elif(self._script._shift_mode._mode_index is 2):
	#		self._script._menu[self._r_mode_index].turn_on()
	#	elif(self._script._shift_mode._mode_index is 2):
	#		self._script._menu[self._m_mode_index].turn_on()
		self._update()		

			
				
# local variables:
# tab-width: 4
