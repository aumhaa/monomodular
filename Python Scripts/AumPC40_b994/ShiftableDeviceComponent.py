
import Live 
from _Generic.Devices import * 
from _Framework.DeviceComponent import DeviceComponent 
from _Framework.ChannelTranslationSelector import ChannelTranslationSelector 
from _Framework.ButtonElement import ButtonElement 
class ShiftableDeviceComponent(DeviceComponent):
	' DeviceComponent that only uses bank buttons if a shift button is pressed '

	def __init__(self, script):
		DeviceComponent.__init__(self)
		self._shift_button = None
		self._shift_pressed = False
		self._script = script
		self._control_translation_selector = ChannelTranslationSelector(8)


	def disconnect(self):
		DeviceComponent.disconnect(self)
		self._control_translation_selector.disconnect()
		if (self._shift_button != None):
			self._shift_button.remove_value_listener(self._shift_value)
			self._shift_button = None


	def set_parameter_controls(self, controls):
		DeviceComponent.set_parameter_controls(self, controls)
		self._control_translation_selector.set_controls_to_translate(controls)
		self._control_translation_selector.set_mode(self._bank_index)


	def set_device(self, device):
		DeviceComponent.set_device(self, device)
		self._control_translation_selector.set_mode(self._bank_index)


	def set_shift_button(self, button):
		assert ((button == None) or (isinstance(button, ButtonElement) and button.is_momentary()))
		if (self._shift_button != button):
			if (self._shift_button != None):
				self._shift_button.remove_value_listener(self._shift_value)
			self._shift_button = button
			if (self._shift_button != None):
				self._shift_button.add_value_listener(self._shift_value)
			self.update()


	def update(self):
		if (self._parameter_controls != None):
			for control in self._parameter_controls:
				control.release_parameter()
		if (self.is_enabled() and (self._device != None)):
			self._device_bank_registry[self._device] = self._bank_index
			if ((self._parameter_controls != None) and (self._bank_index < number_of_parameter_banks(self._device))):
				old_bank_name = self._bank_name
				self._assign_parameters()
				if (self._bank_name != old_bank_name):
					self._show_msg_callback(((self._device.name + ' Bank: ') + self._bank_name))
		if (not self._shift_pressed):
			self._on_on_off_changed()
		elif (self._bank_buttons != None):
			for index in range(len(self._bank_buttons)):
				if (index == self._bank_index):
					self._bank_buttons[index].turn_on()
				else:
					self._bank_buttons[index].turn_off()
		self._script.request_rebuild_midi_map()


	def _shift_value(self, value):
		assert (self._shift_button != None)
		assert (value in range(128))
		self._shift_pressed = (value != 0)
		if(self._shift_pressed is True):
			self._script._mixer.master_strip().set_select_button(None)
			self._script._monomod_mode.set_mode_toggle(self._script._master_select_button)
		else:
			self._script._mixer.master_strip().set_select_button(self._script._master_select_button)
			self._script._monomod_mode.set_mode_toggle(None)
		self.update()


	def _bank_value(self, value, sender):
		assert ((sender != None) and (sender in self._bank_buttons))
		if (self._shift_pressed and self.is_enabled()):
			if ((value != 0) or (not sender.is_momentary())):
				self._bank_name = ''
				self._bank_index = list(self._bank_buttons).index(sender)
				self._control_translation_selector.set_mode(self._bank_index)
				self.update()


	def _on_off_value(self, value):
		if (not self._shift_pressed):
			DeviceComponent._on_off_value(self, value)


	def _on_on_off_changed(self):
		if (not self._shift_pressed):
			DeviceComponent._on_on_off_changed(self)
