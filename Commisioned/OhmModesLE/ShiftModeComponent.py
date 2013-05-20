# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement

class ShiftModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Special Class that uses two shift buttons and is lockable '

	def __init__(self, script):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._mode_toggle1 = None
		self._mode_toggle2 = None
		self._mode_index = 0

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
		self._script.request_rebuild_midi_map()

	def _toggle_value_left(self, value):
		if(value>0):
			self._toggle_value(1)
		
	def _toggle_value_right(self, value):
		if(value>0):
			self._toggle_value(2)
		
	def _toggle_value(self, value):
		assert (self._mode_toggle1 != None)
		assert (self._mode_toggle2 != None)
		assert isinstance(value, int)
		if(value is self._mode_index):
			self.set_mode(0)
		else:
			self.set_mode(value)
		
	def number_of_modes(self):
		return 3

	def update(self):
		#self._script.deassign_matrix()
		#if(self._mode_index is 0):
		#	self._mode_toggle1.turn_off()
		#	self._mode_toggle2.turn_off()
		#	self._script._assign_page_constants()
		#	self._script.assign_page_0()
		#elif(self._mode_index is 1):
		#	self._mode_toggle1.turn_on()
		#	self._mode_toggle2.turn_off()
		#	self._script._assign_page_constants()
		#	self._script.assign_page_1()
		#elif(self._mode_index is 2):
		#	self._mode_toggle1.turn_off()
		#	self._mode_toggle2.turn_on()
		#	self._script._assign_page_constants()
		#	self._script.assign_page_2()
		for index in range(2):
			self._script._looper[index].find_looper()

	def set_mode(self, mode):
		assert isinstance(mode, int)
		assert (mode in range(self.number_of_modes()))
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()

# local variables:
# tab-width: 4