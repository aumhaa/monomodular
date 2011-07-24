# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent

class DisconnectNotifier(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '

	def __init__(self):
		ModeSelectorComponent.__init__(self)
		self._mode_index = 1
	
	def number_of_modes(self):
		return 2
		
	def update(self):
		pass		

# local variables:
# tab-width: 4
