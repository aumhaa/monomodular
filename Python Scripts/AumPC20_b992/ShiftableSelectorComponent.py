
import Live
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.ButtonElement import ButtonElement
from consts import *
class ShiftableSelectorComponent(ModeSelectorComponent):
	__doc__ = ' SelectorComponent that assigns buttons to functions based on the shift button '
	def __init__(self, select_buttons, master_button, arm_buttons, matrix, session, zooming, mixer, transport, slider_modes, mode_callback, script):
		assert len(select_buttons) == 8
		assert len(arm_buttons) == 8
		ModeSelectorComponent.__init__(self)
		self._toggle_pressed = False
		self._note_mode_active = False
		self._invert_assignment = False
		self._select_buttons = select_buttons
		self._master_button = master_button
		self._slider_modes = slider_modes
		self._arm_buttons = arm_buttons
		self._transport = transport
		self._session = session
		self._zooming = zooming
		self._matrix = matrix
		self._mixer = mixer
		self._mode_callback = mode_callback
		self._script = script
		self._master_button.add_value_listener(self._master_value)

	def disconnect(self):
		ModeSelectorComponent.disconnect(self)
		self._master_button.remove_value_listener(self._master_value)
		self._select_buttons = None
		self._master_button = None
		self._slider_modes = None
		self._arm_buttons = None
		self._transport = None
		self._session = None
		self._zooming = None
		self._matrix = None
		self._mixer = None
		self._mode_callback = None
		return None

	def set_mode_toggle(self, button):
		ModeSelectorComponent.set_mode_toggle(self, button)
		self.set_mode(0)

	def invert_assignment(self):
		self._invert_assignment = True
		self._recalculate_mode()

	def number_of_modes(self):
		return 2

	def update(self):
		if self.is_enabled():
			if (self._mode_index == 0):
				for index in range(len(self._select_buttons)):
					strip = self._mixer.channel_strip(index)
					strip.set_select_button(None)
				self._mixer.master_strip().set_select_button(None)
				#self._mixer.channel_strip(7).set_arm_button(self._script._user3)
				self._transport.set_play_button(self._select_buttons[0])
				self._transport.set_stop_button(self._select_buttons[1])
				self._transport.set_record_button(self._select_buttons[2])
				self._transport.set_overdub_button(self._select_buttons[3])
				self._session.set_track_bank_buttons(self._select_buttons[5], self._select_buttons[4])
				self._session.set_scene_bank_buttons(self._select_buttons[7], self._select_buttons[6])
				self._zooming.set_nav_buttons(self._select_buttons[6], self._select_buttons[7], self._select_buttons[4], self._select_buttons[5])
				self._on_note_mode_changed()
			elif (self._mode_index == 1):
				self._transport.set_play_button(None)
				self._transport.set_stop_button(None)
				self._transport.set_record_button(None)
				self._transport.set_overdub_button(None)
				self._session.set_track_bank_buttons(None, None)
				self._session.set_scene_bank_buttons(None, None)
				self._zooming.set_nav_buttons(None, None, None, None)
				for index in range(len(self._select_buttons)):
					strip = self._mixer.channel_strip(index)
					strip.set_select_button(self._select_buttons[index])
				#self._mixer.channel_strip(7).set_arm_button(None)
			else :
				assert False
			if self._mode_index == int(self._invert_assignment):
				self._slider_modes.set_mode_buttons(None)
				for index in range(len(self._select_buttons)):
					self._mixer.channel_strip(index).set_arm_button(self._arm_buttons[index])
			else:
				for index in range(7):
					self._mixer.channel_strip(index).set_arm_button(None)
				self._slider_modes.set_mode_buttons(self._arm_buttons[:7])
				self._mixer.master_strip().set_select_button(self._arm_buttons[7])
		return None

	def _toggle_value(self, value):
		assert self._mode_toggle != None
		assert value in range(128)
		self._toggle_pressed = value > 0
		self._recalculate_mode()
		if(self._mode_index > 0):
			self._script._monomod_mode.set_mode_toggle(self._master_button)
		else:
			self._script._monomod_mode.set_mode_toggle(None)
		return None

	def _recalculate_mode(self):
		self.set_mode((int(self._toggle_pressed) + int(self._invert_assignment)) % self.number_of_modes())

	def _master_value(self, value):
		assert self._master_button != None
		assert value in range(128)
		if self.is_enabled() and self._invert_assignment == self._toggle_pressed:
			if not self._master_button.is_momentary() or value > 0:
				for button in self._select_buttons:
					button.turn_off()
				self._matrix.reset()
				mode_byte = NOTE_MODE
				if self._note_mode_active:
					mode_byte = ABLETON_MODE
				self._mode_callback(mode_byte)
				self._note_mode_active = not self._note_mode_active
				self._zooming.set_ignore_buttons(self._note_mode_active)
				self._transport.update()
				self._on_note_mode_changed()
		return None

	def _on_note_mode_changed(self):
		assert self._master_button != None
		if self.is_enabled() and self._invert_assignment == self._toggle_pressed:
			if self._note_mode_active:
				self._master_button.turn_on()
			else:
				self._master_button.turn_off()
		return None



