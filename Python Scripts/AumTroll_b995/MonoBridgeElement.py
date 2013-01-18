# emacs-mode: -*- python-*-
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
class MonoBridgeElement(ButtonMatrixElement):
	__module__ = __name__
	__doc__ = ' Class representing a 2-dimensional set of buttons '

	def __init__(self, script):
		ButtonMatrixElement.__init__(self)
		self._script = script

	def refresh_state(self):
		self._script.refresh_state()

	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		self._button_value(args1, args2, args3, args4)

	def reset(self):
#		for entry in self._value_notifications:
#			callback = entry['Callback']
#			self.remove_value_notification(callback)
		pass

	def _button_value(self, args1 = None, args2 = None, args3 = None, args4 = None):
		for entry in self._value_notifications:
			callback = entry['Callback']
			callback(args1, args2, args3, args4)



# local variables:
# tab-width: 4
