import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Tools.re import *

from _Mono_Framework.MonoButtonElement import MonoButtonElement

class LooperListenerComponent(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '


	def __init__(self, script, num):
		ControlSurfaceComponent.__init__(self)
		self._script = script
		self._num = num
		self._button = None
		self._clear_button = None
		self._undo_button = None
		self._stop_button = None
		self._looper = None
		self._last_looper = None
		self._state = 0
		self._undo = 0
		self._button_values = [0, 5, 6, 2, 3]
		self.find_looper()
	

	def disconnect(self):
		self._button = None
		self._clear_button = None
		self._undo_button = None
		self._state = 0
		if self._looper != None:
			if len(self._looper.parameters)>1:
				if self._looper.parameters[1].value_has_listener(self._state_change):
					self._looper.parameters[1].remove_value_listener(self._state_change)
				
	def assign_buttons(self, button, undo_button, clear_button, stop_button):
		assert isinstance(button, None or MonoButtonElement)
		assert isinstance(undo_button, None or MonoButtonElement)
		assert isinstance(clear_button, None or MonoButtonElement)
		#if self._button != None:
		#	 if self._button.value_has_listener():
		#		self._button.remove_value_listener(self._button_value)
		self._button = button
		#if self._button != None:
		#	self._button.add_value_listener(self._button)
		#if self._stop_button != None:
		#	 if self._stop_button.value_has_listener():
		#		self._stop_button.remove_value_listener(self._stop_button_value)
		self._stop_button = stop_button
		#if self._stop_button != None:
		#	self._stop_button.add_value_listener(self._stop_button_value)
		self._undo_button = undo_button
		self._clear_button = clear_button
		self.update()
	

#	def _button_value(self, value):
#		self._script.log_message('button value ' + str(value))
		

#	def _stop_button_value(self, value):
#		self._script.log_message('stop button value ' + str(value))
			
	def on_track_list_changed(self):
		self._script.log_message('received bump')
		self.find_looper()
		

	def find_looper(self):
		#self._script.log_message('find_looper!')
		key = str('Looper ' + str(self._num))
		looper = None
		for track in range(len(self.song().tracks)):
			for device in range(len(self.song().tracks[track].devices)):
				if(match(key, str(self.song().tracks[track].devices[device].name)) != None):
					looper = self.song().tracks[track].devices[device]
		for return_track in range(len(self.song().return_tracks)):
			for device in range(len(self.song().return_tracks[return_track].devices)):
				if(match(key, str(self.song().return_tracks[return_track].devices[device].name)) != None):
					looper = self.song().return_tracks[return_track].devices[device]
		for device in range(len(self.song().master_track.devices)):
			if(match(key, str(self.song().master_track.devices[device].name)) != None):
				looper = self.song().master_track.devices[device]	
		if looper != self._looper:
			if self._looper != None:
				self._looper.parameters[1].remove_value_listener(self._state_change)
			self._looper = looper
			if self._looper != None:
				self._looper.parameters[1].add_value_listener(self._state_change)
		self.update()
		
	

	def update(self):
		#if hasattr(self._looper, 'name'):
		#	self._script.log_message('looper = ' + str(self._looper.name))
		self._state_change()
		#else:
		#	self._script.log_message('no looper found')
	
			
			
	

	def _state_change(self):
		#self._script.log_message('state_change: ' + str(self._looper.parameters[1].value))
		if self._looper != None:
			self._state = int(self._looper.parameters[1].value)
			#self._script.log_message('state' + str(self._state))
			if self._button != None:
				#self._script.log_message('sending state: ' + str(self._button_values[self._state]))
				self._button.force_next_send()
				self._button.send_value(self._button_values[self._state])
			if self._clear_button != None:
				if self._state != 0 and self._state != 3:
					self._clear_button.force_next_send()
					self._clear_button.send_value(1)
				else:
					self._clear_button.force_next_send()
					self._clear_button.send_value(0)
			if self._stop_button != None:
				if self._state != 0:
					self._stop_button.force_next_send()
					self._stop_button.send_value(5)
				else:
					self._stop_button.force_next_send()
					self._stop_button.send_value(0)
	
	
# local variables:
# tab-width: 4
