# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent

class ShiftModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Special Class that uses two shift buttons and is lockable '


	def __init__(self, script, update):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._modes_buttons = []
		self._mode_index = 0
		self._update = update
		#self.set_mode_buttons(buttons)
	

	def number_of_modes(self):
		return 4
	

	def set_mode(self, mode):
		if self.is_enabled():
			assert isinstance(mode, int)
			assert (mode in range(self.number_of_modes()))
			if (self._mode_index != mode):
				self._mode_index = mode
				self.update()
	

	def update(self):
		self._update()
	

	def on_selected_track_changed(self):				##this is a callback in every ControlSurfaceComponent Class every time the track changes
		self.update()
	


# local variables:
# tab-width: 4