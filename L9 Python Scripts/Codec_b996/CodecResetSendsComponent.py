
#changed 091011:  added return sends to reset algorithm

import Live 
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent 
from _Framework.ButtonElement import ButtonElement

class CodecResetSendsComponent(ControlSurfaceComponent):
	' Special Component to reset all track sends to zero for the first four returns '
	__module__ = __name__

	def __init__(self, script, *a, **k):
		super(CodecResetSendsComponent, self).__init__(*a, **k)
		self._script = script
		self._buttons = [[None for index in range(4)] for index in range(8)]

	def disconnect(self):
		if (self._buttons != None):
			for column in self._buttons:
				for button in column:
					if (button != None):
						button.remove_value_listener(self.reset_send)
		self._buttons = []

	def on_enabled_changed(self):
		self.update()

	def set_buttons(self, buttons):
		#assert isinstance(buttons, tuple)
		#assert (len(buttons) is 8)
		for column in buttons:
			for button in column:
				assert isinstance(button, ButtonElement) or (button == None)
		#assert(for button in buttons(isinstance(button, ButtonElement) or (button == None)))
		for column in self._buttons:
			for button in column:
				if (button != None):
					button.remove_value_listener(self.reset_send)
		self._buttons = buttons
		for column in self._buttons:
			for button in column:
				if (button != None):
					button.add_value_listener(self.reset_send, identify_sender = True)


	def update(self):
		#debug_print('update is abstract. Forgot to override it?')
		pass
	
	def reset_send(self, value, sender):
		if self.is_enabled() and not self._script._shift_pressed:
			assert (self._buttons != None)
			assert isinstance(value, int)
			tracks = self.tracks_to_use()
			returns = self.returns_to_use()
			if ((value is not 0) or (not sender.is_momentary())):
				for column in range(8):
					for row in range(4):
						if sender is self._buttons[column][row]:
							if (row < len(returns)):
								for track in tracks:
									track.mixer_device.sends[row].value = 0
								for track in returns:
									track.mixer_device.sends[row].value = 0
							break
	

	def tracks_to_use(self):
		return self.song().tracks

	def returns_to_use(self):
		return self.song().return_tracks