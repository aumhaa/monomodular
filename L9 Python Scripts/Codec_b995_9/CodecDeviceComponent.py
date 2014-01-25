

import Live

from _Generic.Devices import *

from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement

from _Mono_Framework.Live8DeviceComponent import Live8DeviceComponent as DeviceComponent

class CodecDeviceComponent(DeviceComponent):
	__doc__ = ' Class representing a device in Live '
	


	def __init__(self, script, *a, **k):
		super(CodecDeviceComponent, self).__init__(*a, **k)
		self._script = script
		self._display_device_button = None
		self._prev_button = None
		self._next_button = None
		
	

	def _lock_value(self, value):
		if not self._script._shift_pressed and self.is_enabled():
			assert (self._lock_button != None)
			assert (value != None)
			assert isinstance(value, int)
			if not self._lock_button.is_momentary() or value is not 0:
				self._locked_to_device = not self._locked_to_device
				self.update()
	

	def set_lock_to_device(self, lock, device):
		#self._script.log_message(str(lock) + ' ' + str(device))
		assert isinstance(lock, type(False))
		if lock is True:
			if not self.is_locked():
				self.set_device(device)
			self._locked_to_device = not self._locked_to_device
			if self.is_enabled():
				if (self._lock_button != None):
					if self._locked_to_device:
						self._lock_button.turn_on()
					else:
						self._lock_button.turn_off()  
			self._script.schedule_message(2, self._lock_callback)
	

	def _bank_up_value(self, value):
		if (not self._script._shift_pressed) and self.is_enabled():
			super(CodecDeviceComponent, self)._bank_up_value(value)
	

	def _bank_down_value(self, value):
		if (not self._script._shift_pressed) and self.is_enabled():
			super(CodecDeviceComponent, self)._bank_down_value(value)
	

	def _on_off_value(self, value):
		if (not self._script._shift_pressed) and self.is_enabled():
			super(CodecDeviceComponent, self)._on_off_value(value)
	

	def _bank_value(self, value):
		if (not self._script._shift_pressed) and self.is_enabled():
			super(DeviceComponent, self)._bank_value(value)
	

	def display_device(self):
		if(self._device != None):
			track = self.find_track(self._device)
			if (self.song().view.selected_track is not track):
				self.song().view.selected_track = track
			self.song().view.select_device(self._device)
			if ((not self.application().view.is_view_visible('Detail')) or (not self.application().view.is_view_visible('Detail/DeviceChain'))):
				self.application().view.show_view('Detail')
				self.application().view.show_view('Detail/DeviceChain')
	

	def find_track(self, obj):
		if obj != None:
			if(type(obj.canonical_parent)==type(None)) or (type(obj.canonical_parent)==type(self.song())):
				return None
			elif(type(obj.canonical_parent) == type(self.song().tracks[0])):
				return obj.canonical_parent
			else:
				return self.find_track(obj.canonical_parent)
		else:
			return None
	

	def is_locked(self):
		return self._locked_to_device
	

	def set_display_device_button(self, button):
		if self._display_device_button != None:
			if self._display_device_button.value_has_listener(self._display_device_value):
				self._display_device_button.remove_value_listener(self._display_device_value)
		self._display_device_button = button
		self._display_device_button.add_value_listener(self._display_device_value)	
	

	def _display_device_value(self, value):
		if self.is_enabled():
			if value > 0 and self._device != None:
				self.display_device()
	

	def disconnect(self):
		if self._display_device_button != None:
			if self._display_device_button.value_has_listener(self._display_device_value):
				self._display_device_button.remove_value_listener(self._display_device_value)
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)
		super(CodecDeviceComponent, self).disconnect()
	

	def set_nav_buttons(self, prev_button, next_button):		
		assert(prev_button == None or isinstance(prev_button, ButtonElement))
		assert(next_button == None or isinstance(next_button, ButtonElement))
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
	

	def _nav_value(self, value, sender):
		if self.is_enabled():
			if not self._script._shift_pressed:
				assert ((sender != None) and (sender in (self._prev_button, self._next_button)))
				if self.is_enabled() and not self.is_locked() and value != 0:		# and (not self._shift_pressed)):
					if ((not sender.is_momentary()) or (value != 0)):
						if self._script._device_component != self:
							self._script.set_device_component(self)
						direction = Live.Application.Application.View.NavDirection.left
						if (sender == self._next_button):
							direction = Live.Application.Application.View.NavDirection.right
						self.application().view.scroll_view(direction, 'Detail/DeviceChain', True)
						self.update()
	

	def update(self):
		super(CodecDeviceComponent, self).update()
		if self.is_enabled():
			if self._on_off_parameter() != None and self._on_off_button != None:
				self._on_off_button.send_value(self._on_off_parameter().value > 0)
			if self._lock_button != None:
				self._lock_button.send_value(self.is_locked())
			self._script.request_rebuild_midi_map()
	











		