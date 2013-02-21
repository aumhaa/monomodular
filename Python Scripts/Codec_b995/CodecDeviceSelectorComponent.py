# emacs-mode: -*- python-*-
import Live
#from MonOhmod import MonOhmod
#from ShiftModeComponent import ShiftModeComponent
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from FlashingButtonElement import FlashingButtonElement
from _Tools.re import *

class CodecDeviceSelectorComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for selecting a device based on a prefix added to its name'


	def __init__(self, script, prefix, devices):
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._mode_index = 0
		self._number_of_modes = 0
		self._prefix = prefix
		#self._devices = devices
		#self._select_buttons = [None for index in range(len(self._devices))]
		#self._selected_device = self._devices[0]
		#self._last_selected = None
	

	"""
	def set_select_buttons(self, buttons):
		assert len(buttons) <= len(self._devices)
		identify_sender = True
		for button in self._select_buttons:
			if button != None:
				if button.value_has_listener(self._select_value):
					button.remove_value_listener(self._select_value)
		self._select_buttons = buttons
		for button in self._select_buttons:
			button.add_value_listener(self._select_value, identify_sender)
	

	def _select_value(self, value, sender):
		if sender.is_momentary or value > 0:
			self._selected_device._lock_callback = None
			self._selected_device = self._devices[self._select_buttons.index(sender)]
			#self._script.set_device_component(self._selected_device)
			self._last_selected = self._selected_device
			self._selected_device.display_device()
		self.update()
	
	"""

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement or FlashingButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
				self._number_of_modes = len(self._modes_buttons)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, ButtonElement or FlashingButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	

	def number_of_modes(self):
		return self._number_of_modes
	

	def update(self):
		if self.is_enabled():
			for button in range(len(self._modes_buttons)):
				if(button is self._mode_index):
					self._modes_buttons[button].turn_on()
				else:
					self._modes_buttons[button].turn_off()
			"""for button in self._select_buttons:
				button.send_value(self._select_buttons.index(button) == self._devices.index(self._selected_device))
			"""
	

	def set_mode(self, mode):
		if self.is_enabled():
			assert isinstance(mode, int)
			assert (mode in range(self.number_of_modes()))
			if (self._mode_index != mode):
				self._mode_index = mode
				keys = (str('c' + str(self._mode_index + 1)), str('p' + str(self._mode_index + 1)))
				preset = None
				for key in keys:
					if preset == None:
						for track_type in (self.song().tracks, self.song().return_tracks, [self.song().master_track]):
							for track in track_type:
								for device in track.devices:
									if(match(key, str(device.name)) != None):
										preset = device
										break
									elif device.can_have_chains:
										for chain in device.chains:
											for chain_device in chain.devices:
												if(match(key, str(chain_device.name)) != None):
													preset = chain_device
													break
				if(preset != None):
					#self._selected_device.set_device(preset)
					self._script._device_component.set_device(preset)
					self._script.request_rebuild_midi_map()
				self.update()
	

	def set_preset(self, preset):
		pass
	

	def on_enabled_changed(self):
		self.update()	
	

# local variables:
# tab-width: 4
