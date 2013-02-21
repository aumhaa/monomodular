import Live

from _Framework.ControlSurfaceComponent import ControlSurfaceComponent

class DeviceNavigator(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Component that can toggle the device chain- and clip view of the selected track '


	def __init__(self, device_component, script):
		ControlSurfaceComponent.__init__(self)
		self._prev_button = None
		self._next_button = None
		self._device = device_component
		self._script = script
		#self._script.log_message('Navigator init')
		return None
	

	def set_nav_buttons(self, prev_button, next_button):
		identify_sender = True
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		self._prev_button = prev_button
		if self._prev_button != None:
			self._prev_button.add_value_listener(self._nav_value, identify_sender)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)
		self._next_button = next_button
		if self._next_button != None:
			self._next_button.add_value_listener(self._nav_value, identify_sender)
		self.update()
		return None
	

	def update(self):
		pass
	

	def _nav_value(self, value, sender):
		if self.is_enabled():
			if ((not sender.is_momentary()) or (value != 0)):
				track = self._find_track(self._device._device)
				if track != None:
					if(sender == self._prev_button):
						self._device.set_device(track.devices[max(0, [item for item in track.devices].index(self._device._device)-1)])
					elif(sender == self._next_button):
						self._device.set_device(track.devices[min(len(track.devices), [item for item in track.devices].index(self._device._device)+1)])
	

	def disconnect(self):
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)	
	

	def _find_track(self, obj):
		if(type(obj.canonical_parent) == type(self.song().tracks[0])):
			return obj.canonical_parent
		elif(type(obj.canonical_parent)==type(None)) or (type(obj.canonical_parent)==type(self.song())):
			return None
		else:
			return self.find_track(obj.canonical_parent)
	

	def on_enabled_changed(self):
		pass
	
