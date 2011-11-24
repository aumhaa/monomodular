
import Live
from APC import APC
from _Framework.InputControlElement import *
from _Framework.SliderElement import SliderElement
from _Framework.ButtonElement import ButtonElement
from _Framework.EncoderElement import EncoderElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.TransportComponent import TransportComponent
from APCSessionComponent import APCSessionComponent
from SpecialMixerComponent import SpecialMixerComponent
from ShiftableZoomingComponent import ShiftableZoomingComponent
from ShiftableSelectorComponent import ShiftableSelectorComponent
from SliderModesComponent import SliderModesComponent
from consts import *

from MonoBridgeElement import MonoBridgeElement
from MonomodComponent import MonomodComponent
from MonomodModeComponent import MonomodModeComponent
from FlashingButtonElement import FlashingButtonElement

class APC20(APC):
	__doc__ = " Script for Akai's APC20 Controller "
	def __init__(self, c_instance):
		self._shift_modes = None
		APC.__init__(self, c_instance)
		return None

	def disconnect(self):
		self._shift_modes = None
		APC.disconnect(self)
		return None

	def _activate_combination_mode(self, track_offset, support_devices):
		APC._activate_combination_mode(self, track_offset, support_devices)
		if support_devices:
			self._shift_modes.invert_assignment()

	def _setup_session_control(self):
		is_momentary = True
		self._shift_button = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 81, self)		   
		self._session = APCSessionComponent(8, 5)
		self._session.name = 'Session_Control'
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Button_Matrix'
		scene_launch_buttons = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, (index + 82), self) for index in range(5) ]
		self._scene_launch_buttons = scene_launch_buttons
		track_stop_buttons = [ FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, index, 52, self) for index in range(8) ]
		self._track_stop_buttons = track_stop_buttons
		for index in range(len(scene_launch_buttons)):
			scene_launch_buttons[index].name = 'Scene_'+ str(index) + '_Launch_Button'
		for index in range(len(track_stop_buttons)):
			track_stop_buttons[index].name = 'Track_' + str(index) + '_Stop_Button'
		self._session.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		self._session.set_stop_track_clip_value(2)
		for scene_index in range(5):
			scene = self._session.scene(scene_index)
			scene.name = 'Scene_' + str(scene_index)
			button_row = []
			scene.set_launch_button(scene_launch_buttons[scene_index])
			scene.set_triggered_value(2)
			for track_index in range(8):
				button = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, track_index, (scene_index + 53), self)
				button.name = str(track_index) + '_Clip_' + str(scene_index) + '_Button'
				button_row.append(button)
				clip_slot = scene.clip_slot(track_index)
				clip_slot.name = str(track_index) + '_Clip_Slot_' + str(scene_index)
				clip_slot.set_triggered_to_play_value(2)
				clip_slot.set_triggered_to_record_value(4)
				clip_slot.set_stopped_value(5)
				clip_slot.set_started_value(1)
				clip_slot.set_recording_value(3)
				clip_slot.set_launch_button(button)

			self._matrix.add_row(tuple(button_row))
		self._session.selected_scene().name = 'Selected_Scene'
		self._session.selected_scene().set_launch_button(ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 64))
		self._session_zoom = ShiftableZoomingComponent(self._session, tuple(track_stop_buttons))
		self._session_zoom.name = 'Session_Overview'
		self._session_zoom.set_button_matrix(self._matrix)
		self._session_zoom.set_zoom_button(self._shift_button)
		self._session_zoom.set_scene_bank_buttons(tuple(scene_launch_buttons))
		self._session_zoom.set_stopped_value(3)
		self._session_zoom.set_selected_value(5)
	
	def _setup_mixer_control(self):
		is_momentary = True
		self._mixer = SpecialMixerComponent(8)
		self._mixer.name = 'Mixer'
		self._mixer.master_strip().name = 'Master_Channel_Strip'
		self._mixer.selected_strip().name = 'Selected_Channel_Strip'
		self._solo_buttons = []
		for track in range(8):
			strip = self._mixer.channel_strip(track)
			strip.name = 'Channel_Strip_' + str(track)
			solo_button = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 50, self)
			self._solo_buttons.append(solo_button)
			mute_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 49)
			solo_button.name = str(track) + '_Solo_Button'
			mute_button.name = str(track) + '_Mute_Button'
			strip.set_solo_button(solo_button)
			strip.set_mute_button(mute_button)
			strip.set_shift_button(self._shift_button)
			strip.set_invert_mute_feedback(True)
		master_volume_control = SliderElement(MIDI_CC_TYPE, 0, 14)
		prehear_control = EncoderElement(MIDI_CC_TYPE, 0, 47, Live.MidiMap.MapMode.relative_two_compliment)
		master_volume_control.name = 'Master_Volume_Control'
		prehear_control.name = 'Prehear_Volume_Control'
		self._mixer.set_prehear_volume_control(prehear_control)
		self._mixer.master_strip().set_volume_control(master_volume_control)

	def _setup_custom_components(self):
		is_momentary = True
		master_select_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 80)
		self._master_select_button = master_select_button
		master_select_button.name = 'Master_Select_Button'
		select_buttons = []
		self._select_buttons = []
		arm_buttons = []
		sliders = []
		for track in range(8):
			select_buttons.append(FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 51, self))
			self._select_buttons.append(select_buttons[track])
			arm_buttons.append(ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 48))
			if track is 7:
				self._user3 = arm_buttons[track]
			sliders.append(SliderElement(MIDI_CC_TYPE, track, 7))
			select_buttons[-1].name = str(track) + '_Select_Button'
			arm_buttons[-1].name = str(track) + '_Arm_Button'
			sliders[-1].name = str(track) + '_Volume_Control'
		transport = TransportComponent()
		transport.name = 'Transport'
		slider_modes = SliderModesComponent(self._mixer, tuple(sliders))
		slider_modes.name = 'Slider_Modes'
		self._shift_modes = ShiftableSelectorComponent(tuple(select_buttons), master_select_button, tuple(arm_buttons), self._matrix, self._session, self._session_zoom, self._mixer, transport, slider_modes, self._send_introduction_message, self)
		self._shift_modes.name = 'Shift_Modes'
		self._shift_modes.set_mode_toggle(self._shift_button)

	def _product_model_id_byte(self):
		return 123

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_monomod(self):
		self._host = MonomodComponent(self)
		self._host.name = 'Monomod_Host'
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
	

	def _monomod_mode_update(self):
		if(self._monomod_mode._mode_index == 0) or (self._host._active_client == None):
			self.flash_status = 0
			self._host.set_enabled(False)
			self._host._set_button_matrix(None)
			#self._host._set_nav_buttons(None)
			self._host._set_lock_button(None)
			self._host._set_alt_button(None)
			self._host._set_shift_button(None)
			self._monomod.reset()
			self._shift_modes.set_enabled(True)
			#self._session.set_track_bank_buttons(self._right_button, self._left_button)
			#self._session.set_scene_bank_buttons(self._down_button, self._up_button)
			for track in range(8):
				self._mixer.channel_strip(track).set_select_button(self._select_buttons[track])
				self._mixer.channel_strip(track).set_solo_button(self._solo_buttons[track])
			#self._transport.set_nudge_buttons(self._nudge_up_button, self._nudge_down_button)
			self._session.set_enabled(True)
			self._session_zoom._is_zoomed_out = False
			self._session_zoom.set_enabled(True)
			self.request_rebuild_midi_map()
			self._master_select_button.turn_off()
			
		elif(self._monomod_mode._mode_index == 1):
			if self._shift_modes._note_mode_active is True:
				self._shift_modes._mode_callback(ABLETON_MODE)
				self._shift_modes._note_mode_active = False
				self._session_zoom.set_ignore_buttons(False)
				self._shift_modes._transport.update()
				self._shift_modes._on_note_mode_changed()
			#self._transport.set_nudge_buttons(None, None)
			self._shift_modes.set_enabled(False)
			for track in range(8):
				self._mixer.channel_strip(track).set_select_button(None)
				self._mixer.channel_strip(track).set_solo_button(None)
			for scene in range(5):
				self._scene_launch_buttons[scene].turn_off()
			self._session.set_enabled(False)
			self._session_zoom.set_enabled(False)
			#self._session.set_track_bank_buttons(None, None)
			#self._session.set_scene_bank_buttons(None, None)
			self.flash_status = 1
			self._monomod.reset()
			self._host._set_button_matrix(self._monomod)
			#self._host._set_nav_buttons([self._up_button, self._down_button, self._left_button, self._right_button])
			self._host._set_shift_button(self._shift_button)
			self._host._set_lock_button(self._scene_launch_buttons[0])
			self._host._set_alt_button(self._scene_launch_buttons[1])
			self._host.set_enabled(True)
			self.request_rebuild_midi_map()
			self._master_select_button.turn_on()
	

	"""m4l bridge"""
	def generate_strip_string(self, display_string):
		#try:
		#	display_string = str(display_string)
		#except:
		#	return ' ? '
		#else:
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
		if isinstance(sender, MonoRingedEncoderElement):
			self._monobridge._send('lcd_name', sender.name, str(self.generate_strip_string(name)))
			self._monobridge._send('lcd_value', sender.name, str(self.generate_strip_string(value)))
	

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
		""" Live -> Script
		Aka on_timer. Called every 100 ms and should be used to update display relevant
		parts of the controller
		"""
		for message in self._scheduled_messages:
			message['Delay'] -= 1
			if (message['Delay'] == 0):
				if (message['Parameter'] != None):
					message['Message'](message['Parameter'])
				else:
					message['Message']()
					del self._scheduled_messages[self._scheduled_messages.index(message)]

		for callback in self._timer_callbacks:
			callback()
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for row in range(8):
				for column in range(8):
					button = self._monomod.get_button(column, row)
					if(button._flash_state > 0):
						button.flash(self._timer)
	


