from __future__ import with_statement
from functools import partial

import Live

from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ChannelTranslationSelector import ChannelTranslationSelector
from _Framework.ControlSurface import ControlSurface, OptimizedControlSurface
from _Framework.DeviceComponent import DeviceComponent
from _Framework.Layer import Layer
from _Framework.ModesComponent import ModesComponent
from _Framework.Resource import PrioritizedResource
from _Framework.SessionZoomingComponent import SessionZoomingComponent
from _Framework.Skin import merge_skins
from _Framework.Util import nop
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext
from _Framework.ModeSelectorComponent import ModeSelectorComponent


from _Framework.EncoderElement import EncoderElement
from _Framework.SliderElement import SliderElement
from _Framework.ButtonElement import ButtonElement
from _Framework.InputControlElement import InputControlElement, MIDI_NOTE_TYPE, MIDI_CC_TYPE

from _Framework.ModesComponent import AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *
from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext


from APC20.APC20 import APC20
from APC20.consts import NOTE_MODE, ABLETON_MODE
#from APC40.TransportComponent import TransportComponent
#from APC40.SessionComponent import SessionComponent

from _APC.APC import APC
from _APC.ControlElementUtils import make_pedal_button, make_slider, make_knob, make_encoder
from _APC.DeviceBankButtonElement import DeviceBankButtonElement
from _APC.DeviceComponent import DeviceComponent
from _APC.MixerComponent import MixerComponent
from _APC.SkinDefault import make_default_skin, make_biled_skin
from _APC.DetailViewCntrlComponent import DetailViewCntrlComponent
from _APC.RingedEncoderElement import RingedEncoderElement

from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.Debug import *
from _Mono_Framework.Mod import *

from MonoRingedEncoderElement import MonoRingedEncoderElement


MapMode = Live.MidiMap.MapMode
SESSION_WIDTH = 8
SESSION_HEIGHT = 5
MIXER_SIZE = 8


def make_button(channel, identifier, name = '', cs = None, *a, **k):
	return AumPCMonoButtonElement(True, MIDI_NOTE_TYPE, channel, identifier, name = name, cs = cs, *a, **k)


def make_slider(channel, identifier, name = '', num = 0, script = None, *a, **k):
	return MonoEncoderElement(MIDI_CC_TYPE, channel, identifier, MapMode.absolute, name=name, num=num, script=script, *a, **k)


def make_ring_encoder(encoder_identifer, button_identifier, name = '', num = 0, script = None, *a, **k):
	button_name = '%s_Ring_Mode_Button' % name
	button = ButtonElement(False, MIDI_CC_TYPE, 0, button_identifier, name=button_name)
	encoder = MonoRingedEncoderElement(MIDI_CC_TYPE, 0, encoder_identifer, MapMode.absolute, name=name, num=num, script=script, *a, **k)
	encoder.name = name
	encoder.set_ring_mode_button(button)
	encoder.set_feedback_delay(-1)
	return encoder


class AumPCMonoButtonElement(MonoButtonElement): 


	def __init__(self, *a, **k):
		super(AumPCMonoButtonElement, self).__init__(*a, **k)
		self.set_color_map(tuple([1, 1, 1, 1, 1, 1, 1]))
	

	def send_value(self, value, force = False):
		if not self._script is None and self._script.flash_status:
			super(AumPCMonoButtonElement, self).send_value(value, force)
		else:
			InputControlElement.send_value(self, value, force)
	


class MonomodModeComponent(ModeSelectorComponent):


	def __init__(self, callback, script, *a, **k):
		super(MonomodModeComponent, self).__init__(*a, **k)
		self._script = script
		self.update = callback
		self._set_protected_mode_index(0)
	

	def number_of_modes(self):
		return 2
	

	def set_mode_toggle(self, button):
		assert (button == None or isinstance(button, ButtonElement))
		if self._mode_toggle != None:
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if self._mode_toggle != None:
			self._mode_toggle.add_value_listener(self._toggle_value)
	


class AumPC20(APC20):


	def __init__(self, c_instance, *a, **k):
		self._monomod_version = 'b996'
		self._host_name = 'AumPC'
		self._color_type = 'APC'
		self._timer = 0
		self._touched = 0
		self.flash_status = False
		super(AumPC20, self).__init__(c_instance, *a, **k)
		with self.component_guard():
			self._setup_mod()
	

	def disconnect(self):
		super(AumPC20, self).disconnect()
		rebuild_sys()
	

	def _create_controls(self):
		make_color_button = partial(make_button, skin=self._skin)
		self._shift_button = make_button(0, 81, name='Shift_Button', num = 0, cs = self)
		self._matrix = ButtonMatrixElement(name='Button_Matrix')
		self._scene_launch_buttons_raw = [ make_color_button(0, index + 82, name='Scene_%d_Launch_Button' % index, num = index, cs = self) for index in xrange(SESSION_HEIGHT) ]
		self._track_stop_buttons = [ make_color_button(index, 52, name='Track_%d_Stop_Button' % index, num = index, cs = self) for index in xrange(SESSION_WIDTH) ]
		self._matrix_rows_raw = []
		for scene_index in xrange(SESSION_HEIGHT):
			row = [ make_color_button(track_index, scene_index + 53, name='%d_Clip_%d_Button' % (track_index, scene_index), num = index, cs = self) for track_index in xrange(SESSION_WIDTH) ]
			self._matrix_rows_raw.append(row)
			self._matrix.add_row(row)

		self._selected_scene_launch_button = make_pedal_button(64, name='Selected_Scene_Launch_Button')
		self._scene_launch_buttons = ButtonMatrixElement(rows=[self._scene_launch_buttons_raw])
		self._solo_buttons = [ make_button(track_index, 49, name='%d_Solo_Button' % track_index, num = track_index, cs = self) for track_index in xrange(MIXER_SIZE) ]
		self._mute_buttons = [ make_button(track_index, 50, name='%d_Mute_Button' % track_index, num = track_index, cs = self) for track_index in xrange(MIXER_SIZE) ]
		self._master_volume_control = make_slider(0, 14, name='Master_Volume_Control', num = 0, script = self)
		self._prehear_control = EncoderElement(MIDI_CC_TYPE, 0, 47, MapMode.relative_two_compliment, name='Prehear_Volume_Control', num = 0, script = self)
		self._master_select_button = make_button(0, 80, name='Master_Select_Button', num = index, cs = self)
		self._select_buttons = [ make_button(track_index, 51, name='%d_Select_Button' % track_index, num = track_index, cs = self ) for track_index in xrange(8) ]
		self._arm_buttons = [ make_button(track_index, 48, name='%d_Arm_Button' % track_index, num = track_index, cs = self) for track_index in xrange(8) ]
		self._sliders = [ make_slider(track_index, 7, name='%d_Volume_Control' % track_index, num = track_index, script = self) for track_index in xrange(8) ]

		self._monomod = ButtonMatrixElement(name = 'Monomod')
		for row in self._matrix_rows_raw:
			self._monomod.add_row(row)
		self._monomod.add_row(self._track_stop_buttons)
		self._monomod.add_row(self._select_buttons)
		self._monomod.add_row(self._mute_buttons)

		self._setup_monobridge()	#had to put this here b/c the original author foolishly placed assignment methods inside of creation methods...argh.
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = APCModHandler(self)
		self.modhandler.name = 'ModHandler' 
		self.modhandler.layer = Layer(priority = 5,
										grid = self._monomod,
										nav_up_button = self._scene_launch_buttons_raw[2], 
										nav_down_button = self._scene_launch_buttons_raw[3], 
										lock_button = self._scene_launch_buttons_raw[4],
										shiftlock_button = self._scene_launch_buttons_raw[0],
										alt_button = self._scene_launch_buttons_raw[1],
										shift_button = self._shift_button)
		self.modhandler.set_enabled(False)
		self._monomod_mode = MonomodModeComponent(self._monomod_mode_update, self)
		self._monomod_mode.name = "Monomod_Mode_Component"
		self._monomod_mode.layer = Layer(priority = 5, mode_toggle = self._master_select_button)
		self._on_shift_value.subject = self._shift_button
		self._on_master_value.subject = self._master_select_button
	

	@subject_slot('value')
	def _on_shift_value(self, value):
		self._monomod_mode.set_enabled(value>0)
	

	@subject_slot('value')
	def _on_master_value(self, value):
		if not self._shift_button.is_pressed() and not self.modhandler.is_enabled():
			self.schedule_message(1, self._shift_modes.update)
	

	def _monomod_mode_update(self):
		#self.log_message('mode update: ' + str(self._monomod_mode._mode_index))
		if(self._monomod_mode._mode_index == 0):
			self.flash_status = False
			self.modhandler.set_enabled(False)
			self._slider_modes.set_enabled(True)
			self._shift_modes.set_enabled(True)
			self._scene_launch_buttons[2].set_on_off_values(127, 0)
			self._scene_launch_buttons[3].set_on_off_values(127, 0)
			self._monomod.reset()
			self._shift_modes.set_enabled(True)
			for track in range(8):
				self._mixer.channel_strip(track).set_mute_button(self._mute_buttons[track])
			self._session.set_enabled(True)
			self._session_zoom._is_zoomed_out = False
			self._session_zoom.set_enabled(True)
			self._transport.set_enabled(True)
			self.request_rebuild_midi_map()
			self.schedule_message(1, self._shift_modes.update)
		elif(self._monomod_mode._mode_index == 1):
			self._slider_modes.set_enabled(False)
			if self._shift_modes._note_mode_active is True:
				self._shift_modes._mode_callback(ABLETON_MODE)
				self._shift_modes._note_mode_active = False
				self._session_zoom.set_ignore_buttons(False)
				self._shift_modes._transport.update()
				self._shift_modes._on_note_mode_changed()
			self._shift_modes.set_enabled(False)
			self._session.set_clip_launch_buttons(None)
			for track in range(8):
				self._mixer.channel_strip(track).set_select_button(None)
				self._mixer.channel_strip(track).set_mute_button(None)
			self._session.set_track_bank_buttons(None, None)
			self._session.set_scene_bank_buttons(None, None)
			for scene in range(5):
				self._scene_launch_buttons[scene].turn_off()
			self._transport.set_enabled(False)
			self._session.set_enabled(False)
			self._session_zoom.set_enabled(False)
			self.flash_status = True
			self._monomod.reset()
			self.modhandler.set_enabled(True)
		self._master_select_button.send_value(self._monomod_mode._mode_index)
	

	"""m4l bridge"""
	def generate_strip_string(self, display_string):
		#self.log_message(display_string)
		NUM_CHARS_PER_DISPLAY_STRIP = 12
		if (not display_string):
			return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
		if ((len(display_string.strip()) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.endswith('dB') and (display_string.find('.') != -1))):
			display_string = display_string[:-2]
		if (len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			for um in [' ',
			 'i',
			 'o',
			 'u',
			 'e',
			 'a']:
				while ((len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.rfind(um, 1) != -1)):
					um_pos = display_string.rfind(um, 1)
					display_string = (display_string[:um_pos] + display_string[(um_pos + 1):])
		else:
			display_string = display_string.center((NUM_CHARS_PER_DISPLAY_STRIP - 1))
		ret = u''
		for i in range((NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			if ((ord(display_string[i]) > 127) or (ord(display_string[i]) < 0)):
				ret += ' '
			else:
				ret += display_string[i]

		ret += ' '
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	def notification_to_bridge(self, name, value, sender):
		if isinstance(sender, (MonoRingedEncoderElement, MonoEncoderElement)):
			self._monobridge._send(sender.name, 'lcd_name', str(self.generate_strip_string(name)))
			self._monobridge._send(sender.name, 'lcd_value', str(self.generate_strip_string(value)))
	

	def touched(self):
		if self._touched is 0:
			self._monobridge._send('touch', 'on')
			self.schedule_message(2, self.check_touch)
		self._touched +=1
	

	def check_touch(self):
		if self._touched > 5:
			self._touched = 5
		elif self._touched > 0:
			self._touched -= 1
		if self._touched is 0:
			self._monobridge._send('touch', 'off')
		else:
			self.schedule_message(2, self.check_touch)
	

	def get_clip_names(self):
		clip_names = []
		for scene in self._session._scenes:
			for clip_slot in scene._clip_slots:
				if clip_slot.has_clip() is True:
					clip_names.append(clip_slot._clip_slot)##.clip.name)
					return clip_slot._clip_slot
					##self.log_message(str(clip_slot._clip_slot.clip.name))
		return clip_names
	

	def update_display(self):
		super(AumPC20, self).update_display()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if self.flash_status:
			for control, _ in self._monomod.iterbuttons():
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

class APCModHandler(ModHandler):


	def __init__(self, *a, **k):
		super(APCModHandler, self).__init__(*a, **k)
		self._color_type = 'APC'
		self.navbox_selected = 8
		self.navbox_unselected = 127
	

	def _receive_grid(self, x, y, value, *a, **k):
		#self.log_message('receive_grid: ' + str(x) + ' ' + str(y) + ' ' + str(value))
		if self._active_mod:
			if not self._grid_value.subject is None:
				if self.active_mod().legacy:
					adj_x = x - self.x_offset 
					adj_y = y - self.y_offset - (int(self.is_shifted()) * 2)
				else:
					adj_x = x
					adj_y = y
				if (adj_x) in range(8) and (adj_y) in range(8):
					try:
						self._grid_value.subject.send_value(adj_x, adj_y, self._colors[value], True)
					except:
						pass
	

	@subject_slot('value')
	def _grid_value(self, value, x, y, *a, **k):
		#self.log_message('_base_grid_value ' + str(x) + str(y) + str(value))
		if self.active_mod():
			if self._active_mod.legacy:
				if self.is_shifted():
					if value > 0:
						if x in range(6, 8) and y in range(2,4):
							self.set_offset((x - 6) * 8,  (y - 2) * 8)
							self.update()
				else:
					self._active_mod.send('grid', x + self.x_offset, y + self.y_offset, value)
			else:
				self._active_mod.send('grid', x, y, value)
	

	def _display_nav_box(self):
		if self._grid and self.is_shifted():
			for column in range(2):
				for row in range(2):
					if (column == int(self.x_offset/8)) and (row == int(self.y_offset/8)):
						self._grid.get_button(column +6, row+4).send_value(self.navbox_selected)
					else:
						self._grid.get_button(column +6, row+4).send_value(self.navbox_unselected)
	

	def update(self, *a, **k):
		if self.is_enabled():
			mod = self.active_mod()
			if not mod is None:
				if self._grid:
					if self.is_shifted():
						self.set_channel_buttons(self._grid.submatrix[:, 1:2])
						self._grid_value.subject = self._grid.submatrix[:, 2:7]
						self.set_key_buttons(self._grid.submatrix[:, 7:8])
					elif self.is_shiftlocked():
						self._grid_value.subject = self._grid.submatrix[:, :7]
						self.set_key_buttons(self._grid.submatrix[:, 7:8])
						self.set_channel_buttons(None)
					else:
						self.set_key_buttons(None)
						self._grid_value.subject = self._grid
						self.set_channel_buttons(None)
				self._script.schedule_message(1, mod.restore)
				if mod.legacy:
					if self.is_shifted():
						self._script.schedule_message(1, self._display_nav_box)
			else:
				if not self._grid_value.subject is None:
					self._grid_value.subject.reset()
				if not self._keys_value.subject is None:
					self._keys_value.subject.reset()
			if self.is_shifted() and self._grid:
				buttons = [button for button, _ in self._grid.iterbuttons()]
				self._device_selector.set_buttons(buttons[:8])
			else:
				self._device_selector.set_matrix(None)
			if self._device_component:
				self._device_component.update()
		else:
			self._device_selector.set_matrix(None)
		
	

