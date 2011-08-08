# emacs-mode: -*- python-*-
from _Tools.re import *
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ClipSlotComponent import ClipSlotComponent

#import sys

class MonoBridgeElement(ButtonMatrixElement):
	__module__ = __name__
	__doc__ = ' Class representing a 2-dimensional set of buttons '

	def __init__(self, script):
		ButtonMatrixElement.__init__(self)
		self._script = script
		#self._script.log_message(str(' '))
		#self._script.log_message(str(sys.modules))
		#self._script.log_message(str(ClipSlotComponent))

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

	def osc_in(self, messagename, arguments = None):
		#self._script.log_message('osc_in ' + str(messagename) +  '-' + str(arguments))
		if self._script._osc_registry.has_key(messagename):
			self._script._osc_registry[messagename](arguments)
		#ew_args = re.split(' ', args)
			#self._script.log_message('in reg:' + str(self._script._osc_registry[messagename]) + str(arguments))
		
	def osc_extra(self, messagename):
		pass

	def _send_osc(self, osc, value):
		#self._script.log_message(str(sender.osc) + str(message[2]/127))
		self._send('osc', osc, value)
		
	def ping(self, sender, message):
		pass
		
	def page1(self, sender, message):
		pass		
		
	def page2(self, sender, message):
		pass
		
	def reset_grid(self):
		self._script._key_buttons.reset()
		self._script._bank_buttons.reset()

	def set_brightness(self, value):
		self._script._set_brightness(value)
	

# local variables:
# tab-width: 4
