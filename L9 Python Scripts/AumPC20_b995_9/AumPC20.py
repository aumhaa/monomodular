
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
from _Framework.TransportComponent import TransportComponent
from _Framework.DeviceComponent import DeviceComponent

#from APC40.EncModeSelectorComponent import EncModeSelectorComponent
#from APC40.DetailViewCntrlComponent import DetailViewCntrlComponent
#from APC40.ShiftableDeviceComponent import ShiftableDeviceComponent
#from APC40.ShiftableTransportComponent import ShiftableTransportComponent
#from APC40.ShiftTranslatorComponent import ShiftTranslatorComponent
#from APC40.PedaledSessionComponent import PedaledSessionComponent
#from APC40.SpecialMixerComponent import SpecialMixerComponent

from APC40.APCSessionComponent import APCSessionComponent
from APC40.SpecialMixerComponent import SpecialMixerComponent
from APC20.ShiftableZoomingComponent import ShiftableZoomingComponent
from APC20.ShiftableSelectorComponent import ShiftableSelectorComponent
from APC20.SliderModesComponent import SliderModesComponent
from APC20.consts import *

from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.MonomodComponent import MonomodComponent

#from MonoRingedEncoderElement import RingedEncoderElement, MonoRingedEncoderElement

#from Map import *

class AumPC20ShiftableSelectorComponent(ShiftableSelectorComponent):


	def __init__(self, select_buttons, master_button, arm_buttons, matrix, session, zooming, mixer, transport, slider_modes, mode_callback, script):
		self._script = script
		super(AumPC20ShiftableSelectorComponent, self).__init__(select_buttons, master_button, arm_buttons, matrix, session, zooming, mixer, transport, slider_modes, mode_callback)
	

	def _toggle_value(self, value):
		super(AumPC20ShiftableSelectorComponent, self)._toggle_value(value)
		if(self._mode_index > 0):
			self._script._monomod_mode.set_mode_toggle(self._master_button)
		else:
			self._script._monomod_mode.set_mode_toggle(None)
	

class AumPC20MonomodComponent(MonomodComponent):


	def _update_nav_buttons(self):
		if self._nav_buttons != None:
			if(self._y > 0):
				self._nav_buttons[0].turn_on()
			else:
				self._nav_buttons[0].turn_off()
			if(self._y < 8):
				self._nav_buttons[1].turn_on()
			else:
				self._nav_buttons[1].turn_off() 
	

	def _set_nav_buttons(self, buttons):
		if self._nav_buttons != None:
			self._nav_buttons[0].remove_value_listener(self._nav_up_value)
			self._nav_buttons[1].remove_value_listener(self._nav_down_value)
		self._nav_buttons = buttons
		if buttons != None:
			assert len(buttons) == 2
			for button in buttons:
				assert isinstance(button, AumPCMonoButtonElement)
			self._nav_buttons[0].set_on_off_values(8, 2)	
			self._nav_buttons[0].add_value_listener(self._nav_up_value)
			self._nav_buttons[1].set_on_off_values(8, 2)	
			self._nav_buttons[1].add_value_listener(self._nav_down_value)
	


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
	


class AumPC20(APC):
	""" Monomodular script for Akai's APC20 Controller """


	def __init__(self, c_instance, *a, **k):
		self._shift_modes = None
		super(AumPC20, self).__init__(c_instance, *a, **k)
	

	def disconnect(self):
		self._shift_modes = None
		super(AumPC20, self).disconnect()
	

	def _activate_combination_mode(self, track_offset, support_devices):
		super(AumPC20, self)._activate_combination_mode(track_offset, support_devices)
		if support_devices:
			self._shift_modes.invert_assignment()
	

	def _setup_session_control(self):
		is_momentary = True
		self._shift_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, 81, 'Shift_Button', self)
		self._session = APCSessionComponent(8, 5)
		self._session.name = 'Session_Control'
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Button_Matrix'
		scene_launch_buttons = [ AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, (index + 82), 'Scene_' + str(index) + '_Launch_Button', self) for index in range(5) ]
		self._scene_launch_buttons = scene_launch_buttons
		track_stop_buttons = [ AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, index, 52, 'Track_' + str(index) + '_Stop_Button', self) for index in range(8) ]
		self._track_stop_buttons = track_stop_buttons
		for index in range(len(scene_launch_buttons)):
			scene_launch_buttons[index].name = 'Scene_' + str(index) + '_Launch_Button'

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
				button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track_index, (scene_index + 53), '_Clip_' + str(scene_index) + '_Button', self)
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
			solo_button = AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 49, str(track) + '_Solo_Button', self)
			self._solo_buttons.append(solo_button)
			mute_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 50)
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
		master_select_button.name = 'Master_Select_Button'
		self._master_select_button = master_select_button
		select_buttons = []
		arm_buttons = []
		sliders = []
		for track in range(8):
			select_buttons.append(AumPCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 51, str(track) + '_Select_Button', self))
			arm_buttons.append(ButtonElement(is_momentary, MIDI_NOTE_TYPE, track, 48))
			sliders.append(MonoEncoderElement(MIDI_CC_TYPE, track, 7, Live.MidiMap.MapMode.absolute, 'Slider_' + str(track), track, self))
			select_buttons[-1].name = str(track) + '_Select_Button'
			arm_buttons[-1].name = str(track) + '_Arm_Button'
			#sliders[-1].name = str(track) + '_Volume_Control'
		self._select_buttons = select_buttons

		transport = TransportComponent()
		transport.name = 'Transport'
		slider_modes = SliderModesComponent(self._mixer, tuple(sliders))
		slider_modes.name = 'Slider_Modes'
		self._shift_modes = AumPC20ShiftableSelectorComponent(tuple(select_buttons), master_select_button, tuple(arm_buttons), self._matrix, self._session, self._session_zoom, self._mixer, transport, slider_modes, self._send_introduction_message, self)
		self._shift_modes.name = 'Shift_Modes'
		self._shift_modes.set_mode_toggle(self._shift_button)
		self._device = DeviceComponent()
	

	def _product_model_id_byte(self):
		return 123
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_monomod(self):
		self._host = AumPC20MonomodComponent(self)
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
		#self._shift_button.add_value_listener(self._shift_value)
	

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
			#self._host._set_nav_buttons(None)
			self._host._set_lock_button(None)
			self._host._set_alt_button(None)
			self._host._set_shift_button(None)
			self._host._set_nav_buttons(None)
			self._scene_launch_buttons[2].set_on_off_values(127, 0)	
			self._scene_launch_buttons[3].set_on_off_values(127, 0)	
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
			self._host._set_nav_buttons([self._scene_launch_buttons[2], self._scene_launch_buttons[3]])
			self._host.set_enabled(True)
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
		if isinstance(sender, MonoEncoderElement):
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
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)
	

	def set_appointed_device(self, *a, **k):
		pass
	
