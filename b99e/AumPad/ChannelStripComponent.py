# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.EncoderElement import EncoderElement
from _Framework.DisplayDataSource import DisplayDataSource
class ChannelStripComponent(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Class attaching to the mixer of a given track '

	def __init__(self, script):
		ControlSurfaceComponent.__init__(self)
		self._script = script
		self._track = None
		self._send_controls = []
		self._pan_control = None
		self._volume_control = None
		self._select_button = None
		self._mute_button = None
		self._solo_button = None
		self._arm_button = None
		self._shift_button = None
		self._crossfade_toggle = None
		self._track_name_data_source = None
		self._shift_pressed = False
		self._solo_pressed = False
		self._arm_pressed = False
		self._invert_mute_feedback = False
		self._solos_pressed_callback = None
		self._arms_pressed_callback = None



	def disconnect(self):
		""" releasing references and removing listeners"""
		self._solos_pressed_callback = None
		self._arms_pressed_callback = None
		if (self._select_button != None):
			self._select_button.remove_value_listener(self._select_value)
			self._select_button.reset()
			self._select_button = None
		if (self._mute_button != None):
			self._mute_button.remove_value_listener(self._mute_value)
			self._mute_button.reset()
			self._mute_button = None
		if (self._solo_button != None):
			self._solo_button.remove_value_listener(self._solo_value)
			self._solo_button.reset()
			self._solo_button = None
		if (self._arm_button != None):
			self._arm_button.remove_value_listener(self._arm_value)
			self._arm_button.reset()
			self._arm_button = None
		if (self._shift_button != None):
			self._shift_button.remove_value_listener(self._shift_value)
			self._shift_button.reset()
			self._shift_button = None
		if (self._crossfade_toggle != None):
			self._crossfade_toggle.remove_value_listener(self._crossfade_toggle_value)
			self._crossfade_toggle.reset()
			self._crossfade_toggle = None
		if (self._track_name_data_source != None):
			self._track_name_data_source.set_display_string('')
			self._track_name_data_source = None
		if (self._track != None):
			if (self._track != self.song().master_track):
				if self._track.mixer_device.sends_has_listener(self._on_sends_changed):
					self._track.mixer_device.remove_sends_listener(self._on_sends_changed)
				if self._track.mute_has_listener(self._on_mute_changed):
					self._track.remove_mute_listener(self._on_mute_changed)
				if self._track.name_has_listener(self._on_track_name_changed):
					self._track.remove_name_listener(self._on_track_name_changed)
				if self._track.solo_has_listener(self._on_solo_changed):
					self._track.remove_solo_listener(self._on_solo_changed)
				if self._track.mixer_device.crossfade_assign_has_listener(self._on_cf_assign_changed):
					self._track.mixer_device.remove_crossfade_assign_listener(self._on_cf_assign_changed)
				if (self._track not in self.song().return_tracks):
					if (self._track.can_be_armed and self._track.arm_has_listener(self._on_arm_changed)):
						self._track.remove_arm_listener(self._on_arm_changed)
					if self._track.current_input_routing_has_listener(self._on_input_routing_changed):
						self._track.remove_current_input_routing_listener(self._on_input_routing_changed)
			if (self._pan_control != None):
				self._pan_control.release_parameter()
				self._pan_control = None
			if (self._volume_control != None):
				self._volume_control.release_parameter()
				self._volume_control = None
			if (self._send_controls != None):
				for send_control in self._send_controls:
					if (send_control != None):
						send_control.release_parameter()

				self._send_controls = None
			self._track = None



	def set_track(self, track):
		assert ((track == None) or isinstance(track, Live.Track.Track))
		if (self._track != None):
			if (self._track != self.song().master_track):
				if self._track.mixer_device.sends_has_listener(self._on_sends_changed):
					self._track.mixer_device.remove_sends_listener(self._on_sends_changed)
				if self._track.mute_has_listener(self._on_mute_changed):
					self._track.remove_mute_listener(self._on_mute_changed)
				if self._track.name_has_listener(self._on_track_name_changed):
					self._track.remove_name_listener(self._on_track_name_changed)
				if self._track.solo_has_listener(self._on_solo_changed):
					self._track.remove_solo_listener(self._on_solo_changed)
				if self._track.mixer_device.crossfade_assign_has_listener(self._on_cf_assign_changed):
					self._track.mixer_device.remove_crossfade_assign_listener(self._on_cf_assign_changed)
				if (self._track not in self.song().return_tracks):
					if (self._track.can_be_armed and self._track.arm_has_listener(self._on_arm_changed)):
						self._track.remove_arm_listener(self._on_arm_changed)
					if self._track.current_input_routing_has_listener(self._on_input_routing_changed):
						self._track.remove_current_input_routing_listener(self._on_input_routing_changed)
		if (self._pan_control != None):
			self._pan_control.release_parameter()
		if (self._volume_control != None):
			self._volume_control.release_parameter()
		if (self._send_controls != None):
			for send_control in self._send_controls:
				if (send_control != None):
					send_control.release_parameter()
		self._track = track
		self._script.log_message(str(self._track) + " " + str(track))
		if (self._track != None):
			assert isinstance(self._track, Live.Track.Track)
			assert (self._track in ((self.song().tracks + self.song().return_tracks) + (self.song().master_track)))
			if (self._track != self.song().master_track):
				self._track.add_solo_listener(self._on_solo_changed)
				self._track.mixer_device.add_sends_listener(self._on_sends_changed)
				self._track.add_mute_listener(self._on_mute_changed)
				self._track.add_name_listener(self._on_track_name_changed)
				self._track.mixer_device.add_crossfade_assign_listener(self._on_cf_assign_changed)
				if (self._track not in self.song().return_tracks):
					if self._track.can_be_armed:
						self._track.add_arm_listener(self._on_arm_changed)
					self._track.add_current_input_routing_listener(self._on_input_routing_changed)
			if (self._track_name_data_source != None):
				self._track_name_data_source.set_display_string(self._track.name)
		else:
			if (self._track_name_data_source != None):
				self._track_name_data_source.set_display_string(' - ')
			if (self._select_button != None):
				self._select_button.turn_off()
			if (self._mute_button != None):
				self._mute_button.turn_off()
			if (self._solo_button != None):
				self._solo_button.turn_off()
			if (self._arm_button != None):
				self._arm_button.turn_off()
			if (self._crossfade_toggle != None):
				self._crossfade_toggle.turn_off()
		self.update()



	def set_send_controls(self, controls):
		assert ((controls == None) or isinstance(controls, tuple))
		if (controls != self._send_controls):
			self._send_controls = controls
			self.update()



	def set_pan_control(self, control):
		assert ((control == None) or isinstance(control, EncoderElement))
		if (control != self._pan_control):
			self._pan_control = control
			self.update()



	def set_volume_control(self, control):
		assert ((control == None) or isinstance(control, EncoderElement))
		if (control != self._volume_control):
			self._volume_control = control
			self.update()



	def set_select_button(self, button):
		assert ((button == None) or isinstance(button, ButtonElement))
		if (button != self._select_button):
			if (self._select_button != None):
				self._select_button.remove_value_listener(self._select_value)
				self._select_button.reset()
			self._select_button = button
			if (self._select_button != None):
				self._select_button.add_value_listener(self._select_value)
			self.update()



	def set_mute_button(self, button):
		assert ((button == None) or isinstance(button, ButtonElement))
		if (button != self._mute_button):
			if (self._mute_button != None):
				self._mute_button.remove_value_listener(self._mute_value)
				self._mute_button.reset()
			self._mute_button = button
			if (self._mute_button != None):
				self._mute_button.add_value_listener(self._mute_value)
			self.update()



	def set_solo_button(self, button):
		assert ((button == None) or isinstance(button, ButtonElement))
		if (button != self._solo_button):
			if (self._solo_button != None):
				self._solo_button.remove_value_listener(self._solo_value)
				self._solo_button.reset()
			self._solo_button = button
			if (self._solo_button != None):
				self._solo_button.add_value_listener(self._solo_value)
			self.update()



	def set_arm_button(self, button):
		assert (self._track != self.song().master_track)
		assert ((button == None) or isinstance(button, ButtonElement))
		if (button != self._arm_button):
			if (self._arm_button != None):
				self._arm_button.remove_value_listener(self._arm_value)
				self._arm_button.reset()
			self._arm_button = button
			if (self._arm_button != None):
				self._arm_button.add_value_listener(self._arm_value)
			self.update()



	def set_shift_button(self, button):
		assert (self._track != self.song().master_track)
		assert ((button == None) or (isinstance(button, ButtonElement) and button.is_momentary()))
		if (button != self._shift_button):
			if (self._shift_button != None):
				self._shift_button.remove_value_listener(self._shift_value)
				self._shift_button.reset()
			self._shift_button = button
			if (self._shift_button != None):
				self._shift_button.add_value_listener(self._shift_value)
			self.update()



	def set_crossfade_toggle(self, button):
		assert (self._track != self.song().master_track)
		assert ((button == None) or isinstance(button, ButtonElement))
		if (button != self._crossfade_toggle):
			if (self._crossfade_toggle != None):
				self._crossfade_toggle.remove_value_listener(self._crossfade_toggle_value)
				self._crossfade_toggle.reset()
			self._crossfade_toggle = button
			if (self._crossfade_toggle != None):
				self._crossfade_toggle.add_value_listener(self._crossfade_toggle_value)
			self.update()



	def set_mixer_callbacks(self, solos_pressed_callback, arms_pressed_callback):
		assert ((solos_pressed_callback == None) or (dir(solos_pressed_callback).count('im_func') == 1))
		assert ((arms_pressed_callback == None) or (dir(arms_pressed_callback).count('im_func') == 1))
		self._solos_pressed_callback = solos_pressed_callback
		self._arms_pressed_callback = arms_pressed_callback



	def set_invert_mute_feedback(self, invert_feedback):
		assert isinstance(invert_feedback, type(False))
		if (invert_feedback != self._invert_mute_feedback):
			self._invert_mute_feedback = invert_feedback
			self.update()



	def on_enabled_changed(self):
		self.update()



	def on_selected_track_changed(self):
		if (self.is_enabled() and (self._select_button != None)):
			if ((self._track != None) and (self.song().view.selected_track == self._track)):
				self._select_button.turn_on()
			else:
				self._select_button.turn_off()



	def solo_button_pressed(self):
		return self._solo_pressed



	def arm_button_pressed(self):
		return self._arm_pressed



	def track_name_data_source(self):
		if (self._track_name_data_source == None):
			self._track_name_data_source = DisplayDataSource()
			if (self._track != None):
				self._track_name_data_source.set_display_string(self._track.name)
			else:
				self._track_name_data_source.set_display_string(' - ')
		return self._track_name_data_source



	def update(self):
		if self._allow_updates:
			if self.is_enabled():
				if (self._track != None):
					if (self._pan_control != None):
						self._pan_control.connect_to(self._track.mixer_device.panning)
					if (self._volume_control != None):
						self._volume_control.connect_to(self._track.mixer_device.volume)
					if (self._send_controls != None):
						index = 0
						for send_control in self._send_controls:
							if (send_control != None):
								if (index < len(self._track.mixer_device.sends)):
									send_control.connect_to(self._track.mixer_device.sends[index])
								else:
									send_control.release_parameter()
							index += 1

				self._rebuild_callback()
				self.on_selected_track_changed()
				self._on_mute_changed()
				self._on_solo_changed()
				self._on_arm_changed()
				self._on_cf_assign_changed()
			else:
				if (self._track != None):
					if (self._pan_control != None):
						self._pan_control.release_parameter()
					if (self._volume_control != None):
						self._volume_control.release_parameter()
					if (self._send_controls != None):
						for send_control in self._send_controls:
							if (send_control != None):
								send_control.release_parameter()

				self._rebuild_callback()
		else:
			self._update_requests += 1



	def _select_value(self, value):
		assert (self._select_button != None)
		assert isinstance(value, int)
		if self.is_enabled():
			if (self._track != None):
				if ((value != 0) or (not self._select_button.is_momentary())):
					if (self.song().view.selected_track != self._track):
						self.song().view.selected_track = self._track



	def _mute_value(self, value):
		assert (self._mute_button != None)
		assert isinstance(value, int)
		if self.is_enabled():
			if ((self._track != None) and (self._track != self.song().master_track)):
				if ((not self._mute_button.is_momentary()) or (value != 0)):
					self._track.mute = (not self._track.mute)



	def _solo_value(self, value):
		assert (self._solo_button != None)
		assert (value in range(128))
		if self.is_enabled():
			if ((self._track != None) and (self._track != self.song().master_track)):
				self._solo_pressed = ((value != 0) and self._solo_button.is_momentary())
				solo_exclusive = (self._solo_pressed and (((self._solos_pressed_callback == None) or (self._solos_pressed_callback() == 1)) and (self.song().exclusive_solo != self._shift_pressed)))
				if solo_exclusive:
					for track in (self.song().tracks + self.song().return_tracks):
						if (track != self._track):
							track.solo = False

				if ((value != 0) or (not self._solo_button.is_momentary())):
					self._track.solo = (not self._track.solo)



	def _arm_value(self, value):
		assert (self._arm_button != None)
		assert (value in range(128))
		if self.is_enabled():
			if ((self._track != None) and self._track.can_be_armed):
				self._arm_pressed = ((value != 0) and self._arm_button.is_momentary())
				if ((not self._arm_button.is_momentary()) or (value != 0)):
					expected_arms_pressed = 0
					if self._arm_pressed:
						expected_arms_pressed = 1
					arm_exclusive = ((self.song().exclusive_arm != self._shift_pressed) and ((self._arms_pressed_callback == None) or (self._arms_pressed_callback() == expected_arms_pressed)))
					if arm_exclusive:
						for track in self.song().tracks:
							if ((track != self._track) and track.can_be_armed):
								track.arm = False

					self._track.arm = (not self._track.arm)



	def _shift_value(self, value):
		assert (self._shift_button != None)
		self._shift_pressed = (value != 0)



	def _crossfade_toggle_value(self, value):
		assert (self._crossfade_toggle != None)
		assert isinstance(value, int)
		if self.is_enabled():
			if (self._track != None):
				if ((value != 0) or (not self._crossfade_toggle.is_momentary())):
					self._track.mixer_device.crossfade_assign = ((self._track.mixer_device.crossfade_assign - 1) % len(self._track.mixer_device.crossfade_assignments.values))



	def _on_sends_changed(self):
		if self.is_enabled():
			self.update()



	def _on_mute_changed(self):
		if (self.is_enabled() and (self._mute_button != None)):
			if ((self._track != None) and ((self._track in (self.song().tracks + self.song().return_tracks)) and (self._track.mute != self._invert_mute_feedback))):
				self._mute_button.turn_on()
			else:
				self._mute_button.turn_off()



	def _on_solo_changed(self):
		if (self.is_enabled() and (self._solo_button != None)):
			if ((self._track != None) and ((self._track in (self.song().tracks + self.song().return_tracks)) and self._track.solo)):
				self._solo_button.turn_on()
			else:
				self._solo_button.turn_off()



	def _on_arm_changed(self):
		if (self.is_enabled() and (self._arm_button != None)):
			if ((self._track != None) and ((self._track in self.song().tracks) and (self._track.can_be_armed and self._track.arm))):
				self._arm_button.turn_on()
			else:
				self._arm_button.turn_off()



	def _on_track_name_changed(self):
		if (self._track != None):
			if (self.is_enabled() and (self._track_name_data_source != None)):
				self._track_name_data_source.set_display_string(self._track.name)



	def _on_cf_assign_changed(self):
		if (self.is_enabled() and (self._crossfade_toggle != None)):
			if ((self._track != None) and ((self._track in (self.song().tracks + self.song().return_tracks)) and (self._track.mixer_device.crossfade_assign == 1))):
				self._crossfade_toggle.turn_off()
			else:
				self._crossfade_toggle.turn_on()



	def _on_input_routing_changed(self):
		assert (self._track != None)
		if self.is_enabled():
			if (self._track.can_be_armed and (not self._track.arm_has_listener(self._on_arm_changed))):
				self._track.add_arm_listener(self._on_arm_changed)
			elif ((not self._track.can_be_armed) and self._track.arm_has_listener(self._on_arm_changed)):
				self._track.remove_arm_listener(self._on_arm_changed)
			self._on_arm_changed()




# local variables:
# tab-width: 4
