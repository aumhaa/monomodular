# emacs-mode: -*- python-*-
import Live
#from MonOhmod import MonOhmod
from ShiftModeComponent import ShiftModeComponent
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
			self._script._host._set_button_matrix(None)
			self._script._host._set_nav_buttons(None)
			self._script._host._set_lock_button(None)
			self._script._host._set_alt_button(None)
			self._script._livid.turn_off()
			self._script._shift_mode.update()
			#self._script._session._reassign_scenes()
			
		elif(self._mode_index == 1):
			self._script._livid.turn_on()
			#self._script.deassign_matrix()			#moved to set_mode so that the matrix doesn't clear AFTER it has been loaded by monomod
			if(self._script._host._active_client == None):
				self._script.assign_alternate_mappings()
			else:
				self._script.deassign_matrix()
				self._script.deassign_menu()
				self._script._monomod.reset()
				self._script._host._set_button_matrix(self._script._monomod)
				self._script._host._set_nav_buttons([self._script._menu[0], self._script._menu[3], self._script._menu[4], self._script._menu[5]])
				self._script._host._set_lock_button(self._script._menu[1])
				self._script._host._set_alt_button(self._script._menu[2])
				self._script._host.set_enabled(True)
				self._script._shift_mode.update()
			#self._script.show_message('Monomod grid enabled')

	def set_mode(self, mode):			
		assert isinstance(mode, int)
		assert (mode in range(self.number_of_modes()))
		#if (mode>0):			##necessary to allow updating from mode output (to light grid in monomod)
		#	self._script.deassign_matrix()
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()

# local variables:
# tab-width: 4
