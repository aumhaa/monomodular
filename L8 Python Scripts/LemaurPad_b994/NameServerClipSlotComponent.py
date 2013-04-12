# --== Decompile ==--

import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
class NameServerClipSlotComponent(ControlSurfaceComponent):
	__doc__ = ' Class representing a ClipSlot within Live '
	def __init__(self, script):
		self._script = script
		ControlSurfaceComponent.__init__(self)
		self._clip_slot = None
		self._launch_button = None
		self._triggered_to_play_value = 126
		self._triggered_to_record_value = 121
		self._started_value = 127
		self._recording_value = 120
		self._stopped_value = 0
		self._has_fired_slot = False
		return None

	def disconnect(self):
		if self._clip_slot != None:
			if self.has_clip():
				self._clip_slot.clip.remove_playing_status_listener(self._on_playing_state_changed)
				self._clip_slot.clip.remove_is_recording_listener(self._on_recording_state_changed)
			self._clip_slot.remove_has_clip_listener(self._on_clip_state_changed)
			self._clip_slot.remove_playing_status_listener(self._on_playing_state_changed)
			self._clip_slot.remove_is_triggered_listener(self._on_slot_triggered_changed)
			self._clip_slot.remove_controls_other_clips_listener(self._on_clip_state_changed)
			self._clip_slot = None
		if self._launch_button != None:
			self._launch_button.remove_value_listener(self._launch_value)
			self._launch_button = None
		return None

	def on_enabled_changed(self):
		self.update()

	def set_clip_slot(self, clip_slot):
		assert ((clip_slot == None) or isinstance(clip_slot, Live.ClipSlot.ClipSlot))
		if clip_slot != self._clip_slot:
			if self._clip_slot != None:
				if self.has_clip():
					self._clip_slot.clip.remove_playing_status_listener(self._on_playing_state_changed)
					self._clip_slot.clip.remove_is_recording_listener(self._on_recording_state_changed)
					self._clip_slot.clip.remove_name_listener(self._name_listener)
				self._clip_slot.remove_is_triggered_listener(self._on_slot_triggered_changed)
				self._clip_slot.remove_playing_status_listener(self._on_playing_state_changed)
				self._clip_slot.remove_has_clip_listener(self._on_clip_state_changed)
				self._clip_slot.remove_controls_other_clips_listener(self._on_clip_state_changed)
			self._clip_slot = clip_slot
			if self._clip_slot != None:
				if self.has_clip():
					self._clip_slot.clip.add_playing_status_listener(self._on_playing_state_changed)
					self._clip_slot.clip.add_is_recording_listener(self._on_recording_state_changed)
					self._clip_slot.clip.add_name_listener(self._name_listener)
				self._clip_slot.add_is_triggered_listener(self._on_slot_triggered_changed)
				self._clip_slot.add_playing_status_listener(self._on_playing_state_changed)
				self._clip_slot.add_has_clip_listener(self._on_clip_state_changed)
				self._clip_slot.add_controls_other_clips_listener(self._on_clip_state_changed)
		self.update()
		return None

	def set_launch_button(self, button):
		assert ((button == None) or isinstance(button, ButtonElement))
		if button != self._launch_button:
			if self._launch_button != None:
				self._launch_button.remove_value_listener(self._launch_value)
				if button == None:
					self._script.clip_name(self._launch_button, ' ')
			self._launch_button = button
			if self._launch_button != None:
				self._launch_button.add_value_listener(self._launch_value)
			#self._rebuild_callback()
			self.update()
		return None

	def set_triggered_to_play_value(self, value):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(-1, 128))
		self._triggered_to_play_value = value
		return None

	def set_triggered_to_record_value(self, value):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(-1, 128))
		self._triggered_to_record_value = value
		return None

	def set_started_value(self, value):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(-1, 128))
		self._started_value = value
		return None

	def set_recording_value(self, value):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(-1, 128))
		self._recording_value = value
		return None

	def set_stopped_value(self, value):
		assert (value != None)
		assert isinstance(value, int)
		assert (value in range(-1, 128))
		self._stopped_value = value
		return None

	def has_clip(self):
		assert (self._clip_slot != None)
		return self._clip_slot.has_clip


	def update(self): #needs to be re-checked...
		self._has_fired_slot = False
		new_name = ' '
		if self._allow_updates:
			 if self._launch_button != None:
				if self.is_enabled():
					value_to_send = -1
					if (self._clip_slot != None):
						if self.has_clip():
							new_name = self._clip_slot.clip.name
							value_to_send = self._stopped_value
							if self._clip_slot.clip.is_triggered:
								if self._clip_slot.clip.will_record_on_start:
									value_to_send = self._triggered_to_record_value
								else:
									value_to_send = self._triggered_to_play_value
							elif self._clip_slot.clip.is_playing:
								if self._clip_slot.clip.is_recording:
									value_to_send = self._recording_value
								else:
									value_to_send = self._started_value
						elif self._clip_slot.is_triggered:
							if self._clip_slot.will_record_on_start:
								value_to_send = self._triggered_to_record_value
							else:
								value_to_send = self._triggered_to_play_value
						elif self._clip_slot.is_playing:
							if self._clip_slot.is_recording:
								value_to_send = self._recording_value
							else:
								value_to_send = self._started_value
						elif self._clip_slot.controls_other_clips:
							value_to_send = self._stopped_value
					if (value_to_send in range(128)):
						self._launch_button.send_value(value_to_send)
					else:
						self._launch_button.turn_off()
				self._script.clip_name(self._launch_button, new_name)
		else:
			self._update_requests += 1
		return None

	def _on_clip_state_changed(self):
		assert (self._clip_slot != None)
		if self.has_clip():
			if not self._clip_slot.clip.playing_status_has_listener(self._on_playing_state_changed):
				self._clip_slot.clip.add_playing_status_listener(self._on_playing_state_changed)
			if not self._clip_slot.clip.is_recording_has_listener(self._on_recording_state_changed):
				self._clip_slot.clip.add_is_recording_listener(self._on_recording_state_changed)
			if not self._clip_slot.clip.name_has_listener(self._name_listener):
				self._clip_slot.clip.add_name_listener(self._name_listener)
		self.update()
		return None

	def _on_playing_state_changed(self):
		self.update()

	def _on_recording_state_changed(self):
		self.update()

	def _on_slot_triggered_changed(self):
		if not self.has_clip():
			song = self.song()
			view = song.view
			if song.select_on_launch and self._clip_slot.is_triggered and self._has_fired_slot and self._clip_slot.will_record_on_start and self._clip_slot != view.highlighted_clip_slot:
				view.highlighted_clip_slot = self._clip_slot
			self.update()


	def _launch_value(self, value): #possibly some odd things in here...
		assert (self._launch_button != None)
		assert (value in range(128))
		if self.is_enabled() and self._clip_slot != None:
			object_to_launch = self._clip_slot
			launch_pressed = (value != 0) or not (self._launch_button.is_momentary())
			if self.has_clip():
				object_to_launch = self._clip_slot.clip
			else:
				self._has_fired_slot = True
			if self._launch_button.is_momentary():
				object_to_launch.set_fire_button_state(value != 0)
			elif value != 0:
				object_to_launch.fire()
			if launch_pressed and self.has_clip() and self.song().select_on_launch:
				self.song().view.highlighted_clip_slot = self._clip_slot
		return None

	def _name_listener(self):
		self.update()

	def listener():
		if self._launch_button != None and self._clip_slot != None:
			new_name = ' '
			if self.is_enabled():
				if self.has_clip():
					new_name = self._clip_slot.clip.name
			self._script.clip_name(clip_slot._launch_button, new_name)
			#self.log_message(str(self._launch_button.osc_name) + str(new_name))


