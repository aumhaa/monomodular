# by amounra 0413 : http://www.aumhaa.com

import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement
from Tweaker_Map import *

class PadOffsetComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '

	def __init__(self, script):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._mode_index = 0

	def set_mode_buttons(self, buttons):
		#self._script.log_message('set mode buttons' + str(buttons))
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
					#self._script.log_message('turn on ' + str(index))
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
		return 8
	

	def _mode_value(self, value, sender):
		#self._script.log_message('mode_value ' + str(value) + str(sender.name))
		assert (len(self._modes_buttons) > 0)
		assert isinstance(value, int)
		assert isinstance(sender, ButtonElement)
		assert (self._modes_buttons.count(sender) == 1)
		if ((value is not 0) or (not sender.is_momentary())):
			self.set_mode(self._modes_buttons.index(sender))


	def update(self):
		#self._script.log_message('mode update')
		if(self.is_enabled() is True):
			#for index in range(8):
			#	self._script._pad[index].set_identifier(int(index + (self._mode_index*8)))
			#	self._script._pad[index].set_channel(1)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].send_value(127, True)
					#self._script.log_message('turn on ' + str(index))
				else:
					self._modes_buttons[index].send_value(0, True)
		else:
			for button in self._modes_buttons:
				button.send_value(0, True)
				
	
				
# local variables:
# tab-width: 4
