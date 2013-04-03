import Live
from _Framework.ButtonElement import *

from _Mono_Framework.MonoButtonElement import MonoButtonElement

class ConfigurableButtonElement(MonoButtonElement):
	""" Special button class that can be configured with custom on- and off-values """

	def __init__(self, *a, **k):
		MonoButtonElement.__init__(self, *a, **k)
		self._color_map = [20, 21, 5, 36, 38, 6, 52, 55, 7]
		self._num_flash_states = 13
		self._num_colors = 9
		self._darkened = 4
		self._on_value = 127
		self._off_value = 0
		self._is_enabled = True
		self._is_notifying = False
		self._force_next_value = False
		self._pending_listeners = []

	def set_on_off_values(self, on_value, off_value):
		assert on_value in range(128)
		assert off_value in range(128)
		self.clear_send_cache()
		self._on_value = on_value
		self._off_value = off_value

	def set_force_next_value(self):
		self._force_next_value = True

	def turn_on(self):
		self.send_value(self._on_value)

	def turn_off(self):
		self.send_value(self._off_value)

	def reset(self):
		self.send_value(0)

	def add_value_listener(self, callback, identify_sender = False):
		if not self._is_notifying:
			ButtonElement.add_value_listener(self, callback, identify_sender)
		else:
			self._pending_listeners.append((callback, identify_sender))

	def receive_value(self, value):
		self._is_notifying = True
		MonoButtonElement.receive_value(self, value)
		self._is_notifying = False
		for listener in self._pending_listeners:
			self.add_value_listener(listener[0], listener[1])

		self._pending_listeners = []

	def send_value(self, value, force = False):
		MonoButtonElement.send_value(self, value, force or self._force_next_value)
		self._force_next_value = False

	def install_connections(self, install_translation_callback, install_mapping_callback, install_forwarding_callback):
		if self._is_enabled:
			MonoButtonElement.install_connections(self, install_translation_callback, install_mapping_callback, install_forwarding_callback)
		elif self._msg_channel != self._original_channel or self._msg_identifier != self._original_identifier:
			install_translation_callback(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)