# emacs-mode: -*- python-*-
import Live
#from MonOhmod import MonOhmod
#from MonomodModeComponent import *
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement

class ShiftModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Special Class that uses two shift buttons and is lockable '

	def __init__(self, script, callback):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self.update = callback
		self._mode_toggle1 = None
		self._mode_toggle2 = None
		self._toggle1_value = 0
		self._toggle2_value = 0
		self._mode_index = 0
		self._last_mode = 0

	def set_mode_toggle(self, button1, button2):
		assert ((button1 == None) or isinstance(button1, ButtonElement or FlashingButtonElement))
		if (self._mode_toggle1 != None):
			self._mode_toggle1.remove_value_listener(self._toggle_value_left)
		self._mode_toggle1 = button1
		if (self._mode_toggle1 != None):
			self._mode_toggle1.add_value_listener(self._toggle_value_left)
		assert ((button2 == None) or isinstance(button2, ButtonElement or FlashingButtonElement))
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
		assert (self._mode_toggle1 != None)
		assert (self._mode_toggle2 != None)
		assert isinstance(value, int)
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
		
		
	def set_mode(self, mode):
		assert isinstance(mode, int)
		assert (mode in range(self.number_of_modes()))
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()

# local variables:
# tab-width: 4