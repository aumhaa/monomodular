
import Live
from APC import APC
from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.SliderElement import SliderElement
from _Framework.ButtonElement import ButtonElement
from _Framework.EncoderElement import EncoderElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.MixerComponent import MixerComponent
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.ChannelStripComponent import ChannelStripComponent
from _Framework.SceneComponent import SceneComponent
from _Framework.SessionZoomingComponent import SessionZoomingComponent
from _Framework.ChannelTranslationSelector import ChannelTranslationSelector
from _Framework.ModeSelectorComponent import ModeSelectorComponent

from APC40.EncModeSelectorComponent import EncModeSelectorComponent
from APC40.DetailViewCntrlComponent import DetailViewCntrlComponent
from APC40.ShiftableDeviceComponent import ShiftableDeviceComponent
from APC40.ShiftableTransportComponent import ShiftableTransportComponent
from APC40.ShiftTranslatorComponent import ShiftTranslatorComponent
from APC40.PedaledSessionComponent import PedaledSessionComponent
from APC40.SpecialMixerComponent import SpecialMixerComponent

from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.MonomodComponent import MonomodComponent

from RingedEncoderElement import RingedEncoderElement
from MonoRingedEncoderElement import MonoRingedEncoderElement


#from Map import *


class AumPCMonoButtonElement(MonoButtonElement):


	def __init__(self, *a, **k):
		super(AumPCMonoButtonElement, self).__init__(*a, **k)
		self.set_color_map(tuple([1, 1, 1, 1, 1, 1, 1]))
	

	def send_value(self, value, force_send = False):
		if self._script.flash_status:
			super(AumPCMonoButtonElement, self).send_value(value, force_send)
		else:
			InputControlElement.send_value(self, value, force_send)
	


class MonomodModeComponent(ModeSelectorComponent):


	def __init__(self, callback, script, *a, **k):
		super(MonomodModeComponent, self).__init__(*a, **k)
		self._script = script
		self.update = callback
	

	def number_of_modes(self):
		return 2
	

	def set_mode_toggle(self, button):
		assert (button == None or isinstance(button, ButtonElement))
		if self._mode_toggle != None:
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if self._mode_toggle != None:
			self._mode_toggle.add_value_listener(self._toggle_value)
	


class AumPC40(APC):
	__doc__ = " Script for Akai's APC40 Controller "


	def __init__(self, c_instance, *a, **k):
		super(AumPC40, self).__init__(c_instance, *a, **k)
		self._device_selection_follows_track_selection = True
	

	def _setup_session_control(self):
		is_momentary = True
		self._shift_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 98, 'Shift_Button', self)		   
		right_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 96, 'Right_Button', self)
		self._right_button = right_button
		left_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 97, 'Left_Button', self)
		self._left_button = left_button
		up_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 94, 'Up_Button', self)
		self._up_button = up_button
		down_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 95, 'Down_Button', self)
		self._down_button = down_button
		self._session = PedaledSessionComponent(8, 5)
		self._session.name = 'Session_Control'
		self._session.set_track_bank_buttons(right_button, left_button)
		self._session.set_scene_bank_buttons(down_button, up_button)
		matrix = ButtonMatrixElement()
		self._matrix = matrix  # added a
		matrix.name = 'Button_Matrix'
		scene_launch_buttons = [ ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, (index + 82)) for index in range(5) ]
		track_stop_buttons = [ AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, index, 52, 'Track_' + str(index) + '_Stop_Button', self) for index in range(8) ]
		self._track_stop_buttons = track_stop_buttons  # added a
		for index in range(len(scene_launch_buttons)):
			scene_launch_buttons[index].name = 'Scene_'+ str(index) + '_Launch_Button'
		stop_all_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 81)
		stop_all_button.name = 'Stop_All_Clips_Button'
		self._session.set_stop_all_clips_button(stop_all_button)
		self._session.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		self._session.set_stop_track_clip_value(2)
		for scene_index in range(5):
			scene = self._session.scene(scene_index)
			scene.name = 'Scene_' + str(scene_index)
			button_row = []
			scene.set_launch_button(scene_launch_buttons[scene_index])
			scene.set_triggered_value(2)
			for track_index in range(8):
				button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track_index, (scene_index + 53), str(track_index) + '_Clip_' + str(scene_index) + '_Button', self)
				#button.name = str(track_index) + '_Clip_' + str(scene_index) + '_Button'
				button_row.append(button)
				clip_slot = scene.clip_slot(track_index)
				clip_slot.name = str(track_index) + '_Clip_Slot_' + str(scene_index)
				clip_slot.set_triggered_to_play_value(2)
				clip_slot.set_triggered_to_record_value(4)
				clip_slot.set_stopped_value(5)
				clip_slot.set_started_value(1)
				clip_slot.set_recording_value(3)
				clip_slot.set_launch_button(button)
			matrix.add_row(tuple(button_row))
		self._session.set_slot_launch_button(ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 67))
		self._session.selected_scene().name = 'Selected_Scene'
		self._session.selected_scene().set_launch_button(ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 64))
		self._session_zoom = SessionZoomingComponent(self._session)
		self._session_zoom.name = 'Session_Overview'
		self._session_zoom.set_button_matrix(matrix)
		self._session_zoom.set_zoom_button(self._shift_button)
		self._session_zoom.set_nav_buttons(up_button, down_button, left_button, right_button)
		self._session_zoom.set_scene_bank_buttons(tuple(scene_launch_buttons))
		self._session_zoom.set_stopped_value(3)
		self._session_zoom.set_selected_value(5)
	

	def _setup_mixer_control(self):
		is_momentary = True
		self._mixer = SpecialMixerComponent(8)
		self._mixer.name = 'Mixer'
		self._mixer.master_strip().name = 'Master_Channel_Strip'
		self._mixer.selected_strip().name = 'Selected_Channel_Strip'
		self._solo_buttons = []	# added a
		self._select_buttons = []	# added a
		for track in range(8):
			strip = self._mixer.channel_strip(track)
			strip.name = 'Channel_Strip_' + str(track)
			volume_control = EncoderElement(MIDI_CC_TYPE, track, 7, Live.MidiMap.MapMode.absolute) # 'Slider_' + str(track), track, self)
			arm_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 48)
			solo_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 50, str(track) + '_Solo_Button', self)
			self._solo_buttons.append(solo_button)	# added a
			mute_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 49)
			select_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 51, str(track) + '_Select_Button', self)
			self._select_buttons.append(select_button)	# added a
			#volume_control.name = str(track) + '_Volume_Control'
			arm_button.name = str(track) + '_Arm_Button'
			#solo_button.name = str(track) + '_Solo_Button'
			mute_button.name = str(track) + '_Mute_Button'
			#select_button.name = str(track) + '_Select_Button'
			strip.set_volume_control(volume_control)
			strip.set_arm_button(arm_button)
			strip.set_solo_button(solo_button)
			strip.set_mute_button(mute_button)
			strip.set_select_button(select_button)
			strip.set_shift_button(self._shift_button)
			strip.set_invert_mute_feedback(True)
		crossfader = SliderElement(MIDI_CC_TYPE, 0, 15)
		self._crossfader = crossfader
		self._crossfader.name = 'Crossfader'
		master_volume_control = SliderElement(MIDI_CC_TYPE, 0, 14)
		master_select_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 80)
		self._master_select_button = master_select_button
		prehear_control = EncoderElement(MIDI_CC_TYPE, 0, 47, Live.MidiMap.MapMode.relative_two_compliment)
		crossfader.name = 'Crossfader'
		master_volume_control.name = 'Master_Volume_Control'
		master_select_button.name = 'Master_Select_Button'
		prehear_control.name = 'Prehear_Volume_Control'
		self._mixer.set_crossfader_control(crossfader)
		self._mixer.set_prehear_volume_control(prehear_control)
		self._mixer.master_strip().set_volume_control(master_volume_control)
		self._mixer.master_strip().set_select_button(master_select_button)
	

	def _setup_custom_components(self):
		self._setup_device_and_transport_control()
		self._setup_global_control()
	

	def _setup_device_and_transport_control(self):
		is_momentary = True
		device_bank_buttons = []
		device_param_controls = []
		bank_button_labels = ('Clip_Track_Button', 'Device_On_Off_Button', 'Previous_Device_Button', 'Next_Device_Button', 'Detail_View_Button', 'Rec_Quantization_Button', 'Midi_Overdub_Button', 'Metronome_Button')
		for index in range(8):
			device_bank_buttons.append(ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 58 + index))
			device_bank_buttons[-1].name = bank_button_labels[index]
			ring_mode_button = ButtonElement(not is_momentary, MIDI_CC_TYPE, 0, 24 + index)
			ringed_encoder = MonoRingedEncoderElement(MIDI_CC_TYPE, 0, 16 + index, Live.MidiMap.MapMode.absolute, index, self)
			ringed_encoder.set_ring_mode_button(ring_mode_button)
			ringed_encoder.name = 'Device_Control_' + str(index)
			ring_mode_button.name = ringed_encoder.name + '_Ring_Mode_Button'
			device_param_controls.append(ringed_encoder)
		device = ShiftableDeviceComponent()
		device.name = 'Device_Component'
		device.set_bank_buttons(tuple(device_bank_buttons))
		device.set_shift_button(self._shift_button)
		device.set_parameter_controls(tuple(device_param_controls))
		device.set_on_off_button(device_bank_buttons[1])
		self.set_device_component(device)
		self._device = device
		detail_view_toggler = DetailViewCntrlComponent()
		detail_view_toggler.name = 'Detail_View_Control'
		detail_view_toggler.set_shift_button(self._shift_button)
		detail_view_toggler.set_device_clip_toggle_button(device_bank_buttons[0])
		detail_view_toggler.set_detail_toggle_button(device_bank_buttons[4])
		detail_view_toggler.set_device_nav_buttons(device_bank_buttons[2], device_bank_buttons[3])
		transport = ShiftableTransportComponent()
		transport.name = 'Transport'
		self._transport = transport
		play_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 91)
		stop_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 92)
		record_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 93)
		nudge_up_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 100, 'Nudge_Up_Button', self)
		self._nudge_up_button = nudge_up_button
		nudge_down_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 101, 'Nudge_Down_Button', self)
		self._nudge_down_button = nudge_down_button
		tap_tempo_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 99)
		play_button.name = 'Play_Button'
		stop_button.name = 'Stop_Button'
		record_button.name = 'Record_Button'
		#nudge_up_button.name = 'Nudge_Up_Button'
		#nudge_down_button.name = 'Nudge_Down_Button'
		tap_tempo_button.name = 'Tap_Tempo_Button'
		transport.set_shift_button(self._shift_button)
		transport.set_play_button(play_button)
		transport.set_stop_button(stop_button)
		transport.set_record_button(record_button)
		transport.set_nudge_buttons(nudge_up_button, nudge_down_button)
		transport.set_tap_tempo_button(tap_tempo_button)
		transport.set_quant_toggle_button(device_bank_buttons[5])
		transport.set_overdub_button(device_bank_buttons[6])
		transport.set_metronome_button(device_bank_buttons[7])
		bank_button_translator = ShiftTranslatorComponent()
		bank_button_translator.set_controls_to_translate(tuple(device_bank_buttons))
		bank_button_translator.set_shift_button(self._shift_button)
	

	def _setup_global_control(self):
		is_momentary = True
		global_bank_buttons = []
		global_param_controls = []
		for index in range(8):
			ring_button = ButtonElement(not is_momentary, MIDI_CC_TYPE, 0, 56 + index)
			ringed_encoder = MonoRingedEncoderElement(MIDI_CC_TYPE, 0, 48 + index, Live.MidiMap.MapMode.absolute, index + 8, self)
			ringed_encoder.name = 'Track_Control_' + str(index)
			ring_button.name = ringed_encoder.name + '_Ring_Mode_Button'
			ringed_encoder.set_ring_mode_button(ring_button)
			global_param_controls.append(ringed_encoder)
		global_bank_buttons = []
		global_bank_labels = ('Pan_Button', 'Send_A_Button', 'Send_B_Button', 'Send_C_Button')
		for index in range(4):
			global_bank_buttons.append(ButtonElement(not is_momentary, MIDI_NOTE_TYPE, 0, 87 + index))
			global_bank_buttons[-1].name = global_bank_labels[index]
		encoder_modes = EncModeSelectorComponent(self._mixer)
		encoder_modes.name = 'Track_Control_Modes'
		encoder_modes.set_modes_buttons(global_bank_buttons)
		encoder_modes.set_controls(tuple(global_param_controls))
		global_translation_selector = ChannelTranslationSelector()
		global_translation_selector.name = 'Global_Translations'
		global_translation_selector.set_controls_to_translate(tuple(global_param_controls))
		global_translation_selector.set_mode_buttons(tuple(global_bank_buttons))
	

	def _product_model_id_byte(self):
		return 115
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

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
		self._monomod_mode.set_mode(0)
		self._shift_button.add_value_listener(self._shift_value)
	

	def _shift_value(self, value):
		if value > 0:
			self._mixer.master_strip().set_select_button(None)
			self._monomod_mode.set_mode_toggle(self._master_select_button)
		else:
			self._mixer.master_strip().set_select_button(self._master_select_button)
			self._monomod_mode.set_mode_toggle(None)
	

	def _monomod_mode_update(self):
		self.log_message('mode update: ' + str(self._monomod_mode._mode_index))
		if(self._monomod_mode._mode_index == 0) or (self._host._active_client == None):
			self.flash_status = 0
			self._host.set_enabled(False)
			self._host._set_button_matrix(None)
			self._host._set_nav_buttons(None)
			self._host._set_lock_button(None)
			self._host._set_alt_button(None)
			self._host._set_shift_button(None)
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
			self._host._set_button_matrix(self._monomod)
			self._host._set_nav_buttons([self._up_button, self._down_button, self._left_button, self._right_button])
			self._host._set_shift_button(self._shift_button)
			self._host._set_lock_button(self._nudge_up_button)
			self._host._set_alt_button(self._nudge_down_button)
			self._host.set_enabled(True)
			self.request_rebuild_midi_map()
			self._master_select_button.turn_on()
			self.log_message('mod mode')
	

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
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if self.flash_status:
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	
