from __future__ import with_statement
from functools import partial

import Live

from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ChannelTranslationSelector import ChannelTranslationSelector
from _Framework.ControlSurface import ControlSurface, OptimizedControlSurface
from _Framework.Layer import Layer
from _Framework.ModesComponent import ModesComponent
from _Framework.Resource import PrioritizedResource
from _Framework.SessionZoomingComponent import SessionZoomingComponent
from _Framework.Skin import merge_skins
from _Framework.Util import nop

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


from APC40.APC40 import APC40
from APC40.TransportComponent import TransportComponent
from APC40.SessionComponent import SessionComponent

from _APC.APC import APC
from _APC.ControlElementUtils import make_pedal_button, make_encoder, make_ring_encoder, make_slider
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
from _Mono_Framework.Mod import *

from MonoRingedEncoderElement import RingedEncoderElement, MonoRingedEncoderElement


MapMode = Live.MidiMap.MapMode
SESSION_WIDTH = 8
SESSION_HEIGHT = 5
MIXER_SIZE = 8


def make_button(channel, identifier, name = None, cs = None, *a, **k):
	return AumPCMonoButtonElement(True, MIDI_NOTE_TYPE, channel, identifier, name = name, cs = cs, *a, **k)



class AumPCMonoButtonElement(MonoButtonElement):


	def __init__(self, *a, **k):
		super(AumPCMonoButtonElement, self).__init__(*a, **k)
		self.set_color_map(tuple([1, 1, 1, 1, 1, 1, 1]))
	

	def send_value(self, value, force_send = False):
		if self._script and self._script.flash_status:
			super(AumPCMonoButtonElement, self).send_value(value, force_send)
		else:
			InputControlElement.send_value(self, value, force_send)
	


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
	


class AumPC40(APC40):


	def __init__(self, c_instance, *a, **k):
		super(AumPC40, self).__init__(c_instance, *a, **k)
		self._monomod_version = 'b996'
		self._host_name = 'AumPC'
		self._color_type = 'APC'
		self._timer = 0
		self.flash_status = 0
		with self.component_guard():
			self._setup_monobridge()
			self._setup_mod()
	

	def _create_controls(self):
		make_on_off_button = partial(make_button, skin=self._default_skin)
		make_color_button = partial(make_button, skin=self._color_skin)
		self._shift_button = make_button(0, 98, resource_type=PrioritizedResource, name='Shift_Button')
		self._right_button = make_button(0, 96, name='Bank_Select_Right_Button')
		self._left_button = make_button(0, 97, name='Bank_Select_Left_Button')
		self._up_button = make_button(0, 94, name='Bank_Select_Up_Button')
		self._down_button = make_button(0, 95, name='Bank_Select_Down_Button')
		self._session_matrix = ButtonMatrixElement(name='Button_Matrix')
		self._scene_launch_buttons = [ make_color_button(0, index + 82, name='Scene_%d_Launch_Button' % index, cs = self) for index in xrange(SESSION_HEIGHT) ]
		self._track_stop_buttons = [ make_color_button(index, 52, name='Track_%d_Stop_Button' % index, cs = self) for index in xrange(SESSION_WIDTH) ]
		self._stop_all_button = make_color_button(0, 81, name='Stop_All_Clips_Button', cs = self)
		self._matrix_rows_raw = [ [ make_color_button(track_index, scene_index + 53, name='%d_Clip_%d_Button' % (track_index, scene_index), cs = self) for track_index in xrange(SESSION_WIDTH) ] for scene_index in xrange(SESSION_HEIGHT) ]
		for row in self._matrix_rows_raw:
			self._session_matrix.add_row(row)

		self._selected_slot_launch_button = make_pedal_button(67, name='Selected_Slot_Launch_Button')
		self._selected_scene_launch_button = make_pedal_button(64, name='Selected_Scene_Launch_Button')
		self._volume_controls = []
		self._arm_buttons = []
		self._solo_buttons = []
		self._mute_buttons = []
		self._select_buttons = []
		for index in xrange(MIXER_SIZE):
			self._volume_controls.append(make_slider(index, 7, name='%d_Volume_Control' % index))
			self._arm_buttons.append(make_on_off_button(index, 48, name='%d_Arm_Button' % index, cs = self))
			self._solo_buttons.append(make_on_off_button(index, 49, name='%d_Solo_Button' % index, cs = self))
			self._mute_buttons.append(make_on_off_button(index, 50, name='%d_Mute_Button' % index, cs = self))
			self._select_buttons.append(make_on_off_button(index, 51, name='%d_Select_Button' % index, cs = self))

		self._crossfader_control = make_slider(0, 15, name='Crossfader')
		self._master_volume_control = make_slider(0, 14, name='Master_Volume_Control')
		self._master_select_button = make_on_off_button(0, 80, name='Master_Select_Button', cs = self)
		self._prehear_control = make_encoder(0, 47, name='Prehear_Volume_Control')
		self._device_bank_buttons = []
		self._device_param_controls_raw = []
		bank_button_labels = ('Clip_Track_Button', 'Device_On_Off_Button', 'Previous_Device_Button', 'Next_Device_Button', 'Detail_View_Button', 'Rec_Quantization_Button', 'Midi_Overdub_Button', 'Metronome_Button')
		for index in range(8):
			self._device_bank_buttons.append(make_on_off_button(0, 58 + index, name=bank_button_labels[index]))
			encoder_name = 'Device_Control_%d' % index
			ringed_encoder = make_ring_encoder(16 + index, 24 + index, name=encoder_name)
			self._device_param_controls_raw.append(ringed_encoder)

		self._play_button = make_button(0, 91, name='Play_Button')
		self._stop_button = make_button(0, 92, name='Stop_Button')
		self._record_button = make_button(0, 93, name='Record_Button')
		self._nudge_up_button = make_button(0, 100, name='Nudge_Up_Button')
		self._nudge_down_button = make_button(0, 101, name='Nudge_Down_Button')
		self._tap_tempo_button = make_button(0, 99, name='Tap_Tempo_Button')
		self._global_bank_buttons = []
		self._global_param_controls = []
		for index in range(8):
			encoder_name = 'Track_Control_%d' % index
			ringed_encoder = make_ring_encoder(48 + index, 56 + index, name=encoder_name)
			self._global_param_controls.append(ringed_encoder)

		self._global_bank_buttons = [ make_on_off_button(0, 87 + index, name=name) for index, name in enumerate(('Pan_Button', 'Send_A_Button', 'Send_B_Button', 'Send_C_Button')) ]
		self._device_clip_toggle_button = self._device_bank_buttons[0]
		self._device_on_off_button = self._device_bank_buttons[1]
		self._detail_left_button = self._device_bank_buttons[2]
		self._detail_right_button = self._device_bank_buttons[3]
		self._detail_toggle_button = self._device_bank_buttons[4]
		self._rec_quantization_button = self._device_bank_buttons[5]
		self._overdub_button = self._device_bank_buttons[6]
		self._metronome_button = self._device_bank_buttons[7]

		self._monomod = ButtonMatrixElement(name = 'Monomod')
		for row in self._matrix_rows_raw:
			self.log_message('button row: ' + str(row))
			self._monomod.add_row(row)
		self._monomod.add_row(self._track_stop_buttons)
		self._monomod.add_row(self._select_buttons)
		self._monomod.add_row(self._solo_buttons)

		def wrap_matrix(control_list, wrapper = nop):
			return ButtonMatrixElement(rows=[map(wrapper, control_list)])

		self._scene_launch_buttons = wrap_matrix(self._scene_launch_buttons)
		self._track_stop_buttons = wrap_matrix(self._track_stop_buttons)
		self._volume_controls = wrap_matrix(self._volume_controls)
		self._arm_buttons = wrap_matrix(self._arm_buttons)
		self._solo_buttons = wrap_matrix(self._solo_buttons)
		self._mute_buttons = wrap_matrix(self._mute_buttons)
		self._select_buttons = wrap_matrix(self._select_buttons)
		self._device_param_controls = wrap_matrix(self._device_param_controls_raw)
		self._device_bank_buttons = wrap_matrix(self._device_bank_buttons, partial(DeviceBankButtonElement, modifiers=[self._shift_button]))


	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = APCModHandler(self)
		self.modhandler.name = 'ModHandler' 
		self._monomod_mode = MonomodModeComponent(self._monomod_mode_update, self)
		self._monomod_mode.name = "Monomod_Mode_Component"
		self._on_shift_value.subject = self._shift_button
	

	def _setup_monomod(self):
		self._host = MonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self._host._navbox_selected = 16
		self._host._navbox_unselected = 1
		self.hosts = [self._host]
		self._monomod = ButtonMatrixElement()
		self._monomod.name = 'Monomod'
		for row in range(5):
			button_row = []
			for column in range(8):
				button_row.append(self._matrix.get_button(column, row))
			self._monomod.add_row(tuple(button_row))
		self._monomod.add_row(tuple(self._track_stop_buttons))
		self._monomod.add_row(tuple(self._select_buttons))
		self._monomod.add_row(tuple(self._solo_buttons))
		self._monomod_mode = MonomodModeComponent(self._monomod_mode_update, self)
		self._monomod_mode.name = "Monomod_Mode_Component"
		self._shift_button.add_value_listener(self._shift_value)
	

	@subject_slot('value')
	def _on_shift_value(self, value):
		#self.log_message('got shift: ' + str(value))
		if value:
			self._mixer.master_strip().set_select_button(None)
			self._monomod_mode.set_mode_toggle(self._master_select_button)
		else:
			self._mixer.master_strip().set_select_button(self._master_select_button)
			self._monomod_mode.set_mode_toggle(None)
	

	def _monomod_mode_update(self):
		#self.log_message('mode update: ' + str(self._monomod_mode._mode_index))
		if(self._monomod_mode._mode_index == 0):
			self.flash_status = 0
			self.modhandler.set_enabled(False)
			self.modhandler.set_grid(None)
			self.modhandler.set_nav_buttons(None)
			self.modhandler.set_lock_button(None)
			self.modhandler.set_alt_button(None)
			self.modhandler.set_shift_button(None)
			self._monomod.reset()
			self._session.set_track_bank_buttons(self._right_button, self._left_button)
			self._session.set_scene_bank_buttons(self._down_button, self._up_button)
			for track in range(8):
				self._mixer.channel_strip(track).set_select_button(self._select_buttons[track])
				self._mixer.channel_strip(track).set_solo_button(self._solo_buttons[track])
			self._transport.set_nudge_buttons(self._nudge_up_button, self._nudge_down_button)
			self._session.set_enabled(True)
			self._session_zoom._is_zoomed_out = False
			self._session_zoom.set_enabled(True)
			self.request_rebuild_midi_map()
			self._master_select_button.turn_off()
			
		elif(self._monomod_mode._mode_index == 1):
			self._transport.set_nudge_buttons(None, None)
			for track in range(8):
				self._mixer.channel_strip(track).set_select_button(None)
				self._mixer.channel_strip(track).set_solo_button(None)
			self._session.set_enabled(False)
			self._session_zoom.set_enabled(False)
			self._session.set_track_bank_buttons(None, None)
			self._session.set_scene_bank_buttons(None, None)
			self.flash_status = 1
			self._monomod.reset()
			self.modhandler.set_grid(self._monomod)
			self.modhandler.set_nav_buttons([self._up_button, self._down_button, self._left_button, self._right_button])
			self.modhandler.set_shift_button(self._shift_button)
			self.modhandler.set_lock_button(self._nudge_up_button)
			self.modhandler.set_alt_button(self._nudge_down_button)
			self.modhandler.set_enabled(True)
			self.request_rebuild_midi_map()
			self._master_select_button.turn_on()
			#self.log_message('mod mode')
	

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
		super(APC40, self).update_display()
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
	

	def _receive_grid(self, x, y, value, *a, **k):
		#self._receive_grid(x, y, value, *a, **k)
		if self._active_mod:
			if not self._grid_value.subject is None:
				if self.active_mod().legacy:
					adj_x = x - self.x_offset 
					adj_y = y - self.y_offset - (int(self.is_shifted()) * 3)
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
		"""if self._grid_value.subject:
			if self.is_shifted():
				for column in range(2):
					for row in range(2):
						if (column == int(self.x_offset/8)) and (row == int(self.y_offset/8)):
							self._grid_value.subject.get_button(column +6, row+2).send_value(self.navbox_selected)
						else:
							self._grid_value.subject.get_button(column +6, row+2).send_value(self.navbox_unselected)"""
		pass
	

	def update(self, *a, **k):
		mod = self.active_mod()
		if not mod is None:
			if self._grid:
				##self._grid_value.subject = self._grid
				if self.is_shifted():
					self.set_channel_buttons(self._grid.submatrix[:, 1:2])
					self._grid_value.subject = self._grid.submatrix[:, 3:7]
					self.set_key_buttons(self._grid.submatrix[:, 7:8])
				elif self.is_shiftlocked():
					self._grid_value.subject = self._grid.submatrix[:, :7]
					self.set_key_buttons(self._grid.submatrix[:, 7:8])
					self.set_channel_buttons(None)
				else:
					self.set_key_buttons(None)
					self._grid_value.subject = self._grid
					self.set_channel_buttons(None)
			mod.restore()
			if mod.legacy:
				if self.is_shifted():
					self._display_nav_box()
		else:
			if not self._grid_value.subject is None:
				self._grid_value.subject.reset()
			if not self._keys_value.subject is None:
				self._keys_value.subject.reset()
		#if self.is_shifted():
		#	self._grid and self._device_selector.set_matrix(self._grid.submatrix[:, :1])
		#else:
		#	self._device_selector.set_matrix(None)
	

