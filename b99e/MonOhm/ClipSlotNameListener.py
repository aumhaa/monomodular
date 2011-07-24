# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import *

class ClipSlotNameListener(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '

	def __init__(self, script, clip):
		ModeSelectorComponent.__init__(self)
		#ModeSelectorComponent._set_protected_mode_index = self._set_protected_mode_index
		self._script = script
		self._clip = clip
		self._mode_index = " "
		
	def _set_protected_mode_index(self, mode, listener):
		self._script.log_message('got here')

	def set_mode(self, mode):
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()

	def update(self):
		pass		

# local variables:
# tab-width: 4
