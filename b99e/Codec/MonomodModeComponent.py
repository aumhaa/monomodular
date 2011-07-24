# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement

class MonomodModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '


	def __init__(self, script):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._mode_index = 0
	

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
	

	def update(self):
		if(self._mode_index == 0):
			self._script._host.set_enabled(False)
			self._script.set_local_ring_control(1)
			self._script.set_absolute_mode(1)
			self._script._dial_matrix.reset()
			#self._script.activate_device_control()
			self._script.activate_special_device_control()
			self._script._device_selector.set_enabled(True)
			self._script.request_rebuild_midi_map()
			self._script._livid.turn_off()
		elif(self._mode_index == 1):
			#for index in range(4):
			#	self._script._device[index].set_enabled(False) 
			self._script._device_selector.set_enabled(False)
			self._script._special_device.set_enabled(False)
			self._script.set_local_ring_control(0)
			self._script.set_absolute_mode(0)
			self._script._dial_matrix.reset()
			self._script._button_matrix.reset()
			self._script._host.set_enabled(True)
			self._script._livid.turn_on()
			self._script.request_rebuild_midi_map()
	

	def set_mode(self, mode):
		assert isinstance(mode, int)
		assert (mode in range(self.number_of_modes()))
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()
	


# local variables:
# tab-width: 4
