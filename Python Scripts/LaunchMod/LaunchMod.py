# by amounra 0313 : http://www.aumhaa.com

from __future__ import with_statement
import Live

from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.ButtonElement import *
from _Framework.ButtonMatrixElement import ButtonMatrixElement

from Launchpad.Launchpad import Launchpad
from Launchpad.SubSelectorComponent import SubSelectorComponent as LaunchpadSubSelectorComponent
from Launchpad.SpecialMixerComponent import SpecialMixerComponent as LaunchpadSpecialMixerComponent
from Launchpad.MainSelectorComponent import MainSelectorComponent as LaunchpadMainSelectorComponent
from Launchpad.DefChannelStripComponent import DefChannelStripComponent as LaunchpadDefChannelStripComponent
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.Mod import *
from _Mono_Framework.Debug import *

SIDE_NOTES = (8, 24, 40, 56, 72, 88, 104, 120)
DRUM_NOTES = (41, 42, 43, 44, 45, 46, 47, 57, 58, 59, 60, 61, 62, 63, 73, 74, 75, 76, 77, 78, 79, 89, 90, 91, 92, 93, 94, 95, 105, 106, 107)

START_IN_MOD = False

class LaunchMod(Launchpad):


	def __init__(self, *a, **k):
		ControlSurface.__init__(self, *a, **k)
		with self.component_guard():
			self._monomod_version = 'b996'
			self._host_name = 'LaunchMod'
			self._color_type = 'Launchpad'
			self._timer = 0
			self._suppress_send_midi = True
			self._suppress_session_highlight = True
			self._suppress_highlight = False
			is_momentary = True
			self._suggested_input_port = 'Launchpad'
			self._suggested_output_port = 'Launchpad'
			self._control_is_with_automap = False
			self._user_byte_write_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 16)
			self._user_byte_write_button.name = 'User_Byte_Button'
			self._user_byte_write_button.send_value(1)
			self._user_byte_write_button.add_value_listener(self._user_byte_value)
			self._wrote_user_byte = False
			self._challenge = Live.Application.get_random_int(0, 400000000) & 2139062143
			matrix = ButtonMatrixElement()
			matrix.name = 'Button_Matrix'
			for row in range(8):
				button_row = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, row * 16 + column, str(column) + '_Clip_' + str(row) + '_Button', self) for column in range(8) ]
				matrix.add_row(tuple(button_row))

			self._config_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 0, optimized_send_midi=False)
			self._config_button.add_value_listener(self._config_value)
			top_button_names = ['Bank_Select_Up_Button',
			 'Bank_Select_Down_Button',
			 'Bank_Select_Left_Button',
			 'Bank_Select_Right_Button',
			 'Session_Button',
			 'User1_Button',
			 'User2_Button',
			 'Mixer_Button']
			side_button_names = ['Vol_Button',
			 'Pan_Button',
			 'SndA_Button',
			 'SndB_Button',
			 'Stop_Button',
			 'Trk_On_Button',
			 'Solo_Button',
			 'Arm_Button']
			top_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_CC_TYPE, 0, 104 + index, top_button_names[index], self) for index in range(8) ]
			side_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, SIDE_NOTES[index], side_button_names[index], self) for index in range(8) ]
			self._side_buttons = ButtonMatrixElement()
			self._side_buttons.add_row(side_buttons)
			self._setup_monobridge()
			self._setup_mod()
			self._selector = MainSelectorComponent(self, matrix, tuple(top_buttons), tuple(side_buttons), self._config_button)
			self._selector.name = 'Main_Modes'
			for control in self.controls:
				isinstance(control, MonoButtonElement) and control.add_value_listener(self._button_value)
			self.set_highlighting_session_component(self._selector.session_component())
			self._suppress_session_highlight = False
		self.log_message('--------------= ' + str(self._monomod_version) + ' log opened =--------------')	
	

	"""Mono overrides and additions"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = LaunchModHandler(self)
		self.modhandler.name = 'ModHandler'
		#self.modhandler.layer = Layer( lock_button = self._note_mode_button, push_grid = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, key_buttons = self._track_state_buttons)
		#self.modhandler.layer.priority = 4
		#self.modhandler.nav_buttons_layer = AddLayerMode( self.modhandler, Layer(nav_up_button = self._nav_up_button, nav_down_button = self._nav_down_button, nav_left_button = self._nav_left_button, nav_right_button = self._nav_right_button) )
	

	def update_display(self):
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if self.modhandler.is_enabled():
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

	def disconnect(self):
		super(LaunchMod, self).disconnect()
		rebuild_sys()
	


class LaunchModHandler(ModHandler):


	def __init__(self, *a, **k):
		super(LaunchModHandler, self).__init__(*a, **k)
		self._color_type = 'RGB'
		self._colors = range(128)
	

	def _receive_grid(self, x, y, value, *a, **k):
		if self.is_enabled() and self._active_mod and self._active_mod.legacy:
			if not self._grid is None:
				if (x - self.x_offset) in range(8) and (y - self.y_offset) in range(8):
					self._grid.send_value(x - self.x_offset, y - self.y_offset, self._colors[value], True)
	

	def set_grid(self, grid):
		self._grid = grid
		self._grid_value.subject = self._grid
	

	def set_lock_button(self, button):
		pass
	

	@subject_slot('value')
	def _grid_value(self, value, x, y, *a, **k):
		#self.log_message('_base_grid_value ' + str(x) + str(y) + str(value))
		if self._active_mod:
			if self._active_mod.legacy:
				if self._shift_value.subject.is_pressed():
					if value > 0 and x in range(6, 8) and y in range(0, 2):
						self.set_offset((x - 6) * 8,  (y * 8))
						self.update()
				else:
					self._active_mod.send('grid', x + self.x_offset, y + self.y_offset, value)
			else:
				self._active_mod.send('grid', x, y, value)
	

	def _display_nav_box(self):
		if self._grid_value.subject:
			if self._shift_value.subject and self._shift_value.subject.is_pressed():
				for column in range(2):
					for row in range(2):
						if (column == int(self.x_offset/8)) and (row == int(self.y_offset/8)):
							self._grid_value.subject.get_button(column +6, row).send_value(self.navbox_selected)
						else:
							self._grid_value.subject.get_button(column +6, row).send_value(self.navbox_unselected)
	

	def update(self, *a, **k):
		mod = self.active_mod()
		#self.log_message('modhandler update: ' + str(mod))
		if self.is_enabled() and not mod is None:
			mod.restore()
			if mod.legacy:
				self._shift_value.subject and self._shift_value.subject.is_pressed() and self._display_nav_box()
		else:
			#self._script.log_message('disabling modhandler')
			if not self._grid_value.subject is None:
				self._grid_value.subject.reset()
			if not self._keys_value.subject is None:
				self._keys_value.subject.reset()
	


class MainSelectorComponent(LaunchpadMainSelectorComponent):


	def __init__(self, script, *a, **k):
		self._script = script
		LaunchpadMainSelectorComponent.__init__(self, *a, **k)
		self._sub_modes._mixer = SpecialMixerComponent(self._matrix.width())
		if START_IN_MOD is True:
			self._set_protected_mode_index(4)
	

	def set_mode(self, mode):
		assert (mode in range(self.number_of_modes()))
		if ((self._mode_index != mode) or (mode == 3)):
			self._mode_index = mode
			self.update()
	

	def update(self):
		assert (self._modes_buttons != None)
		if self.is_enabled():
			
			#for index in range(len(self._modes_buttons)):
			#	self._modes_buttons[index].set_force_next_value()
			#	if index == self._mode_index:
			#		self._modes_buttons[index].turn_on()
			#	else:
			#		self._modes_buttons[index].turn_off()

			for scene_index in range(8):
				self._side_buttons[scene_index].set_enabled(True)
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
			release_buttons = self._mode_index == 1
			if (self._mode_index < 4):
				self._script._suppress_session_highlight = False
				self._session.set_show_highlight(True)
				self._script.modhandler.set_key_buttons(None)
				self._script.modhandler.set_enabled(False)
				self._script.modhandler.set_grid(None)
				self._script.modhandler.set_alt_button(None)
				self._script.modhandler.set_shift_button(None)
				self._script.modhandler.set_nav_buttons(None)
				for button in self._modes_buttons:
					button.set_on_off_values(127, 4)

				if self._mode_index == 0:
					self._setup_mixer(not as_active)
					self._setup_session(as_active, as_enabled)
				elif self._mode_index == 1:
					self._setup_session(not as_active, not as_enabled)
					self._setup_mixer(not as_active)
					self._setup_user(release_buttons)
				elif self._mode_index == 2:
					self._setup_session(not as_active, not as_enabled)
					self._setup_mixer(not as_active)
					self._setup_user(release_buttons)
				elif self._mode_index == 3:
					self._setup_session(not as_active, as_enabled)
					self._setup_mixer(as_active)
			elif (self._mode_index == 4):
				#self._script.set_highlighting_session_component(None)
				self._session.set_show_highlight(False)
				self._script._suppress_session_highlight = True
				self._setup_session((not as_active), (not as_enabled))
				self._setup_mixer((not as_active))
				self._setup_user(release_buttons)
				self._script.modhandler.set_grid(self._matrix)
				self._script.modhandler.set_key_buttons(self._script._side_buttons)
				self._script.modhandler.set_shift_button(self._modes_buttons[0])
				self._script.modhandler.set_alt_button(self._modes_buttons[2])
				self._modes_buttons[3].send_value(9)
				self._script.modhandler.set_nav_buttons(self._nav_buttons)
				self._script.modhandler.set_enabled(True)
			else:
				assert False
			self._session.set_allow_update(True)
			self._zooming.set_allow_update(True)
			self._update_control_channels()
			if(self._mode_index < 4):
				for index in range(len(self._modes_buttons)):
					if (index == self._mode_index):
						self._modes_buttons[index].turn_on()
					else:
						self._modes_buttons[index].turn_off()	
			#self._script.request_rebuild_midi_map()
			self._script.schedule_message(1, self._session.update)
	

	def _update_control_channels(self):
		if self._mode_index < 4:
			new_channel = self.channel_for_current_mode()
		else:
			new_channel = 15
		for button in self._all_buttons:
			button.set_channel(new_channel)
			button.set_force_next_value()
	

	def _mode_value(self, value, sender):
		assert (len(self._modes_buttons) > 0)
		assert isinstance(value, int)
		assert isinstance(sender, ButtonElement)
		assert (self._modes_buttons.count(sender) == 1)
		if self._script.modhandler.is_enabled() != True:
			if ((value is not 0) or (not sender.is_momentary())):
				if ((self._modes_buttons[1]._last_received_value > 0) and (self._modes_buttons.index(sender) == 2)) or ((self._modes_buttons[2]._last_received_value > 0) and (self._modes_buttons.index(sender) == 1)):
					self.set_mode(4)
				else:
					self.set_mode(self._modes_buttons.index(sender))
		else:
			if self._modes_buttons.index(sender) == 3 and value > 0:
				self.set_mode(0)
	

	def number_of_modes(self):
		return 5
	


class ConfigurableButtonElement(MonoButtonElement):
	""" Special button class that can be configured with custom on- and off-values """


	def __init__(self, *a, **k):
		MonoButtonElement.__init__(self, *a, **k)
		self._color_map = [20, 21, 5, 36, 38, 6, 52, 55, 7]
		self._num_flash_states = 13
		self._num_colors = 9
		self._darkened = 4
		self._on_value = 127
		self._off_value = 4
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
	

	def send_value(self, *a, **k):
		if self._script.modhandler.is_enabled():
			super(ConfigurableButtonElement, self).send_value(*a, **k)
		else:
			ButtonElement.send_value(self, *a, **k)
			self._force_next_value = False	
	

	def install_connections(self, install_translation_callback, install_mapping_callback, install_forwarding_callback):
		if self._is_enabled:
			MonoButtonElement.install_connections(self, install_translation_callback, install_mapping_callback, install_forwarding_callback)
		elif self._msg_channel != self._original_channel or self._msg_identifier != self._original_identifier:
			install_translation_callback(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)
	


class DefChannelStripComponent(LaunchpadDefChannelStripComponent):


	def set_default_buttons(self, volume, panning, send1, send2):
		assert (volume == None or isinstance(volume, ConfigurableButtonElement or MonoButtonElement))
		assert(panning == None or isinstance(panning, ConfigurableButtonElement or MonoButtonElement))
		assert (send1 == None or isinstance(send1, ConfigurableButtonElement or MonoButtonElement))
		assert (send2 == None or isinstance(send2, ConfigurableButtonElement or MonoButtonElement))
		if volume != self._default_volume_button:
			if self._default_volume_button != None:
				self._default_volume_button.remove_value_listener(self._default_volume_value)
			self._default_volume_button = volume
			if self._default_volume_button != None:
				self._default_volume_button.add_value_listener(self._default_volume_value)
		if panning != self._default_panning_button:
			if self._default_panning_button != None:
				self._default_panning_button.remove_value_listener(self._default_panning_value)
			self._default_panning_button = panning
			if self._default_panning_button != None:
				self._default_panning_button.add_value_listener(self._default_panning_value)
		if send1 != self._default_send1_button:
			if self._default_send1_button != None:
				self._default_send1_button.remove_value_listener(self._default_send1_value)
			self._default_send1_button = send1
			if self._default_send1_button != None:
				self._default_send1_button.add_value_listener(self._default_send1_value)
		if send2 != self._default_send2_button:
			if self._default_send2_button != None:
				self._default_send2_button.remove_value_listener(self._default_send2_value)
			self._default_send2_button = send2
			if self._default_send2_button != None:
				self._default_send2_button.add_value_listener(self._default_send2_value)
		self.update()
	


class SpecialMixerComponent(LaunchpadSpecialMixerComponent):


	def _create_strip(self):
		return DefChannelStripComponent()
	
