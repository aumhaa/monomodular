# emacs-mode: -*- python-*-
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ButtonSliderElement import ButtonSliderElement
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.ChannelStripComponent import ChannelStripComponent
from _Framework.SceneComponent import SceneComponent
from _Framework.SessionZoomingComponent import SessionZoomingComponent
from _Framework.MixerComponent import MixerComponent
from FlashingButtonElement import FlashingButtonElement
from SpecialSessionComponent import SpecialSessionComponent
from SubSelectorComponent import *

SHIFT = [8, 7]

class MainSelectorComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class that reassigns the button on the launchpad to different functions '

	def __init__(self, matrix, top_buttons, side_buttons, config_button, knobs, sliders, script):
		assert isinstance(matrix, ButtonMatrixElement)
		assert ((matrix.width() == 8) and (matrix.height() == 8))
		assert isinstance(top_buttons, tuple)
		assert (len(top_buttons) == 8)
		assert isinstance(side_buttons, tuple)
		assert (len(side_buttons) == 8)
		assert isinstance(config_button, ButtonElement)
		ModeSelectorComponent.__init__(self)
		self._script = script
		self._session = SpecialSessionComponent(matrix.width(), matrix.height())
		for scene in self._session._scenes:
			for slot in scene._clip_slots:
				slot._triggered_to_play_value = 4
				slot._triggered_to_record_value = 3
				slot._started_value = 2
				slot._recording_value = 1
				slot._stopped_value = 127
		self._zooming = SessionZoomingComponent(self._session)
		self._zooming._stopped_value = 127
		self._zooming._playing_value = 2
		self._zooming._selected_value = 1
		self._matrix = matrix
		self._knobs = knobs
		self._sliders = sliders
		self._side_buttons = side_buttons
		self._nav_buttons = top_buttons[:4]
		self._config_button = config_button
		self._shift_button = top_buttons[5]
		self._zooming.set_empty_value(LED_OFF)
		self._all_buttons = []
		for button in (self._side_buttons + self._nav_buttons):
			self._all_buttons.append(button)
		self._shift_pressed = 0
		self._shift_pressed_timer = 0
		self._last_normal_mode = 0
		self._shift_button = None
		self.set_shift_button(top_buttons[6])
		self._sub_modes = SubSelectorComponent(matrix, side_buttons, self._session)
		self._sub_modes.set_update_callback(self._update_control_channels)
		self._init_session()
		self._all_buttons = tuple(self._all_buttons)
		self.set_modes_buttons(top_buttons[4:6])



	def disconnect(self):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)

		self._session = None
		self._zooming = None
		for button in self._all_buttons:
			button.set_on_off_values(127, LED_OFF)

		self._config_button.turn_off()
		self._matrix = None
		self._side_buttons = None
		self._nav_buttons = None
		self._config_button = None
		ModeSelectorComponent.disconnect(self)



	def set_shift_button(self, button):
		assert ((button == None) or (isinstance(button, FlashingButtonElement)))
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = button
		if self._shift_button != None:
			self._shift_button.add_value_listener(self._shift_value)
	

	def _shift_value(self, value):
		self._shift_pressed = int(value != 0)
		if self._shift_pressed > 0:
			if (self._shift_pressed_timer + 5) > self._script._timer:
				if(self._script._host.is_enabled() != True):
					self.set_mode(4)
				else:
					self._script.log_message('here')
					self.set_mode(self._last_normal_mode)	
			else:
				self._shift_pressed_timer = self._script._timer % 256
		if(self._script._host.is_enabled() != True):
			if(self._mode_index == 1):
				if value > 0:
					self._session.set_track_bank_buttons(None, None)
					self._session.set_scene_bank_buttons(None, None)
					self._sub_modes.set_modes_buttons(self._nav_buttons)
					self._sub_modes.update()
				else:
					self._sub_modes.set_modes_buttons(None)
					self._session.set_track_bank_buttons(self._nav_buttons[3], self._nav_buttons[2])
					self._session.set_scene_bank_buttons(self._nav_buttons[1], self._nav_buttons[0])
					self._sub_modes.update()
			elif(self._mode_index == 0):
					self._setup_session(True, True)
					self._session.update()
		
	

	def set_modes_buttons(self, buttons):
		assert ((buttons == None) or (isinstance(buttons, tuple) or (len(buttons) == 2)))
		identify_sender = True
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)

		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement)
				self._modes_buttons.append(button)
				button.add_value_listener(self._mode_value, identify_sender)
		self.set_mode(0)

	def _mode_value(self, value, sender):
		assert (len(self._modes_buttons) > 0)
		assert isinstance(value, int)
		assert isinstance(sender, ButtonElement)
		assert (self._modes_buttons.count(sender) == 1)
		if self._script._host.is_enabled() != True:
			if ((value is not 0) or (not sender.is_momentary())):
				if self._shift_pressed > 0:
					if self._modes_buttons.index(sender) == 0:
						self.set_mode(2)
					if self._modes_buttons.index(sender) == 1:
						self.set_mode(3)
				else:
					self._last_normal_mode = int(self._modes_buttons.index(sender))
					self.set_mode(self._modes_buttons.index(sender))
		else:
			pass
				
			

	def number_of_modes(self):
		return 5



	def on_enabled_changed(self):
		self.update()



	def set_mode(self, mode):
		assert (mode in range(self.number_of_modes()))
		if ((self._mode_index != mode) or (mode == 1)):
			self._mode_index = mode
			self.update()



	def update(self):
		assert (self._modes_buttons != None)
		if self.is_enabled():

			for scene_index in range(8):
				for track_index in range(8):
					self._matrix.get_button(track_index, scene_index).set_enabled(True)


			for button in self._nav_buttons:
				button.set_enabled(True)

			as_active = True
			as_enabled = True
			self._session.set_allow_update(False)
			self._zooming.set_allow_update(False)
			self._config_button.send_value(40)
			self._config_button.send_value(1)
			release_buttons = (self._mode_index == 1)
			if (self._mode_index < 4):
				self._script._host.set_enabled(False)
				self._script._host._set_button_matrix(None)
				self._script._host._set_alt_button(None)
				self._script._host._set_shift_button(None)
				self._script._host._set_nav_buttons(None)
				if (self._mode_index == 0):				#session
					self._setup_mixer((not as_active))
					self._setup_session(as_active, as_enabled)
				elif (self._mode_index == 1):			#mixer
					self._setup_session((not as_active), as_enabled)
					self._setup_mixer(as_active)
				elif (self._mode_index == 2):			#user1
					self._setup_session((not as_active), (not as_enabled))
					self._setup_mixer((not as_active))
					self._setup_user(release_buttons)
				elif (self._mode_index == 3):			#user2
					self._setup_session((not as_active), (not as_enabled))
					self._setup_mixer((not as_active))
					self._setup_user(release_buttons)
			elif (self._mode_index == 4):				#monomodular
				self._setup_session((not as_active), (not as_enabled))
				self._setup_mixer((not as_active))
				self._setup_user(release_buttons)
				self._script._host._set_button_matrix(self._matrix)
				self._script._host._set_shift_button(self._shift_button)
				self._script._host._set_lock_button(self._modes_buttons[0])
				self._script._host._set_alt_button(self._modes_buttons[1])
				self._script._host._set_nav_buttons(self._nav_buttons)
				self._script._host.set_enabled(True)
			else:
				assert False
			self._session.set_allow_update(True)
			self._zooming.set_allow_update(True)
			self._update_control_channels()
			#self._script.request_rebuild_midi_map()



	def _update_control_channels(self):
		if self._mode_index < 4:
			new_channel = (self._mode_index + self._sub_modes.mode())
			if (new_channel > 0):
				new_channel += 3
		else:
			new_channel = 15
		for button in self._all_buttons:
			button.set_channel(new_channel)
			button.set_force_next_value()




	def _setup_session(self, as_active, as_enabled):
		assert isinstance(as_active, type(False))
		for button in self._nav_buttons:
			if as_enabled:
				button.set_on_off_values(127, 0)
			else:
				button.set_on_off_values(127, 0)

		for scene_index in range(8):
			scene = self._session.scene(scene_index)
			if as_active and (self._shift_pressed == 1):
				scene_button = self._matrix.get_button(7, scene_index)
				scene_button.set_on_off_values(127, 0)
				scene.set_launch_button(scene_button)
			else:
				scene.set_launch_button(None)
			for track_index in range(SHIFT[self._shift_pressed]):
				if as_active:
					button = self._matrix.get_button(track_index, scene_index)
					button.set_on_off_values(127, 0)
					scene.clip_slot(track_index).set_launch_button(button)
				else:
					scene.clip_slot(track_index).set_launch_button(None)


		if as_active:
			self._zooming.set_zoom_button(self._modes_buttons[0])
			self._zooming.set_button_matrix(self._matrix)
			self._zooming.set_scene_bank_buttons(self._side_buttons)
			self._zooming.set_nav_buttons(self._nav_buttons[0], self._nav_buttons[1], self._nav_buttons[2], self._nav_buttons[3])
			self._zooming.update()
		else:
			self._zooming.set_zoom_button(None)
			self._zooming.set_button_matrix(None)
			self._zooming.set_scene_bank_buttons(None)
			self._zooming.set_nav_buttons(None, None, None, None)
		if as_enabled:
			self._session.set_track_bank_buttons(self._nav_buttons[3], self._nav_buttons[2])
			self._session.set_scene_bank_buttons(self._nav_buttons[1], self._nav_buttons[0])
		else:
			self._session.set_track_bank_buttons(None, None)
			self._session.set_scene_bank_buttons(None, None)




	def _setup_mixer(self, as_active):
		assert isinstance(as_active, type(False))
		self._sub_modes.set_enabled(as_active)




	def _setup_user(self, release_buttons):
		for scene_index in range(8):
			scene_button = self._side_buttons[scene_index]
			scene_button.set_on_off_values(127, LED_OFF)
			scene_button.turn_off()
			scene_button.set_enabled((not release_buttons))
			for track_index in range(8):
				button = self._matrix.get_button(track_index, scene_index)
				button.set_on_off_values(127, LED_OFF)
				button.turn_off()
				button.set_enabled((not release_buttons))


		for button in self._nav_buttons:
			button.set_on_off_values(127, LED_OFF)
			button.turn_off()
			button.set_enabled((not release_buttons))

		self._config_button.send_value(32)
		if release_buttons:
			self._config_button.send_value(2)



	def _init_session(self):
		self._session.set_stop_track_clip_value(3)
		for scene_index in range(self._matrix.height()):
			scene = self._session.scene(scene_index)
			scene.set_triggered_value(1)
			for track_index in range(self._matrix.width()):
				clip_slot = scene.clip_slot(track_index)
				clip_slot.set_triggered_to_play_value(4)
				clip_slot.set_triggered_to_record_value(3)
				clip_slot.set_stopped_value(127)
				clip_slot.set_started_value(2)
				clip_slot.set_recording_value(1)
				self._all_buttons.append(self._matrix.get_button(track_index, scene_index))


		self._zooming.set_stopped_value(127)
		self._zooming.set_selected_value(1)
		self._zooming.set_playing_value(2)




# local variables:
# tab-width: 4
