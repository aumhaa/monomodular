# http://aumhaa.blogspot.com

from __future__ import with_statement
import Live
import time
import math

""" All of the Framework files are listed below, but we are only using using some of them in this script (the rest are commented out) """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
#from _Framework.ButtonSliderElement import ButtonSliderElement # Class representing a set of buttons used as a slider
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
#from _Framework.ChannelTranslationSelector import ChannelTranslationSelector # Class switches modes by translating the given controls' message channel
from _Framework.ClipSlotComponent import ClipSlotComponent # Class representing a ClipSlot within Live
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent # Class representing a device in Live
from _Framework.DisplayDataSource import DisplayDataSource # Data object that is fed with a specific string and notifies its observers
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
#from _Framework.LogicalDisplaySegment import LogicalDisplaySegment # Class representing a specific segment of a display on the controller
from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
#from _Framework.PhysicalDisplayElement import PhysicalDisplayElement # Class representing a display on the controller
from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.SessionZoomingComponent import SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
#from _Framework.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
from _Framework.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section
from SpecialMixerComponent import SpecialMixerComponent
from ShiftModeComponent import ShiftModeComponent
from DetailViewControllerComponent import DetailViewControllerComponent
from FlashingButtonElement import FlashingButtonElement
from ScaleModeComponent import ScaleModeComponent
from OctaveModeComponent import OctaveModeComponent
from LooperListenerComponent import LooperListenerComponent
from MonoBridgeElement import MonoBridgeElement
import LiveUtils
from _Generic.Devices import *
from Ohm64_Map import *
from APC40.APC import APC

""" Here we define some global variables """
CHANNEL = 0 
session = None 
mixer = None 
switchxfader = (240, 00, 01, 97, 02, 15, 01, 247)
check_model = (240, 126, 127, 6, 1, 247)
#model_response = (240 126 0 6 2 0 1 97 1 0 3 xx xx xx xx xx 247)
#240 126 0 6 2 0 1 97 1 0 ID 0 7 2 0 0 247

TEMPO_TOP = 200.0
TEMPO_BOTTOM = 60.0

MIDI_NOTE_TYPE = 0
MIDI_CC_TYPE = 1
MIDI_PB_TYPE = 2
MIDI_MSG_TYPES = (MIDI_NOTE_TYPE,
 MIDI_CC_TYPE,
 MIDI_PB_TYPE)
MIDI_NOTE_ON_STATUS = 144
MIDI_NOTE_OFF_STATUS = 128
MIDI_CC_STATUS = 176
MIDI_PB_STATUS = 224

class OhmModesHH(ControlSurface):
	__module__ = __name__
	__doc__ = " OhmModes controller script, custom script for Herbie Hancock by amounra "


	def __init__(self, c_instance):
		ControlSurface.__init__(self, c_instance)
		with self.component_guard():
			self.log_message(time.strftime("%d.%m.%Y %H:%M:%S", time.localtime()) + "--------------= OhmModesHH2 log opened =--------------") # Writes message into Live's main log file. This is a ControlSurface method.
			#self.set_suppress_rebuild_requests(True) # Turn off rebuild MIDI map until after we're done setting up
			self.revision = 'HH'
			self.flash_status = 1
			self._backlight = 127
			self._backlight_type = 'static'
			self._ohm = 127
			self._ohm_type = 'static'
			self._pad_translations = PAD_TRANSLATION
			self._rgb = 1
			self._keys_octave = 5
			self._keys_scale = 0
			self._tempo_buttons = None
			self._scene_indexes = [[[0,0],  [8, 0], [16, 0], [24, 0], [32, 0],  [40, 0]], 
									[[0,0],  [8, 0], [16, 0], [24, 0], [32, 0],  [40, 0]], 
									[[0,0],  [8, 0], [16, 0], [24, 0], [32, 0],  [40, 0]], 
									[[0,0],  [8, 0], [16, 0], [24, 0], [32, 0],  [40, 0]], 
									[[0,0],  [8, 0], [16, 0], [24, 0], [32, 0],  [40, 0]]]
			self._scene_bank = 0
			self._bank_is_on = False
			self._setup_monobridge()
			self._setup_controls()
			self._setup_transport_control() # Run the transport setup part of the script
			self._setup_mixer_control() # Setup the mixer object
			self._setup_session_control()  # Setup the session object 
			self._setup_device_control() # Setup the device object
			self._setup_crossfader()
			self._setup_looper()
			#self._setup_scene_selector()
			#self._setup_modes() 
			self._assign_page_constants()
			self.assign_page_0()
			self._setup_hilight_knobs()
			self._last_device = None
			self._timer = 0
			#self.set_suppress_rebuild_requests(False) #Turn rebuild back on, now that we're done setting up
			self.song().view.add_selected_track_listener(self._update_selected_device)
			self._on_selected_scene_changed()
			self.show_message('OhmModes Control Surface Loaded')
			self._send_midi(tuple(switchxfader))
			self.schedule_message(10, self.query_ohm, None)
			#self.song().view.selected_scene = self.song().scenes[0]
		
	def query_ohm(self):
		#self.log_message('querying Ohm')
		self._send_midi(tuple(check_model))

	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	



	def update_display(self):
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()

	def get_device_bank(self):
		return self._device._bank_index
	

	def _setup_controls(self):
		is_momentary = True
		self._fader = [None for index in range(8)]
		self._dial = [None for index in range(16)]
		self._button = [None for index in range(8)]
		self._menu = [None for index in range(6)]
		for index in range(8):
			self._fader[index] = EncoderElement(MIDI_CC_TYPE, CHANNEL, OHM_FADERS[index], Live.MidiMap.MapMode.absolute)
			self._fader[index].name = 'Fader_' + str(index), self
		for index in range(8):
			self._button[index] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, OHM_BUTTONS[index], 'Button_' + str(index), self)
		for index in range(16):
			self._dial[index] = EncoderElement(MIDI_CC_TYPE, CHANNEL, OHM_DIALS[index], Live.MidiMap.MapMode.absolute)
			self._dial[index].name = 'Dial_' + str(index)
		for index in range(6):
			self._menu[index] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, OHM_MENU[index], 'Menu_' + str(index), self)	
		self._crossfader = EncoderElement(MIDI_CC_TYPE, CHANNEL, CROSSFADER, Live.MidiMap.MapMode.absolute)
		self._crossfader.name = "Crossfader"
		self._livid = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, LIVID, 'Livid_Button', self)
		self._shift_l = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_L, 'Page_Button_Left', self)
		self._shift_r = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_R, 'Page_Button_Right', self)
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Matrix'
		self._grid = [None for index in range(8)]
		for column in range(8):
			self._grid[column] = [None for index in range(8)]
			for row in range(8):
				self._grid[column][row] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, (column * 8) + row, 'Grid_' + str(column) + '_' + str(row), self)
		for row in range(6):
			button_row = []
			for column in range(7):
				button_row.append(self._grid[column][row])
			self._matrix.add_row(tuple(button_row)) 
	
		
	def _setup_modes(self):
		self._shift_mode = ShiftModeComponent(self) 
		self._shift_mode.name = 'Shift_Mode'
		#self._shift_mode.set_mode_toggle(self._shift_l, self._shift_r)
		#self._select_mode = ModeSelectorComponent(self)
		#self._select_mode.name = 'Select_Mode'
		#self._select_mode.set_mode_toggle(self._menu[5])
		#self._select_mode.update = self.select_mode_update(self._select_mode)
		#self._menu[5].add_value_listener(self._select_mode)
		#self._scale_mode = ScaleModeComponent(self)
		#self._scale_mode.name = "Scale_Mode"
		#self._octave_mode = OctaveModeComponent(self)
		#self._octave_mode.name = "Octave_Mode"
	

			
		
	

	def select_mode_update(self, mode_selector):
		def update():
			if mode_selector._mode_index>0:
				pass
		return update
		
	

	def _setup_looper(self):
		self._looper = [None for index in range(2)]
		for index in range(2):
			self._looper[index] = LooperListenerComponent(self, index + 1)
			self._looper[index].assign_buttons(self._button[index*4], self._button[(index*4)+1], self._button[(index*4)+2], self._button[(index*4)+3])
	
	def _setup_transport_control(self):
		self._transport = TransportComponent() 
		self._transport.name = 'Transport'

	def _setup_mixer_control(self):
		is_momentary = True
		self._num_tracks = (7) #A mixer is one-dimensional; 
		global mixer
		mixer = SpecialMixerComponent(7, 0, True, False)
		mixer.name = 'Mixer'
		self._mixer = mixer
		mixer.set_track_offset(0) #Sets start point for mixer strip (offset from left)
		for index in range(7):
			mixer.channel_strip(index).set_volume_control(self._fader[index])
		for index in range(7):
			mixer.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)
			mixer.track_eq(index).name = 'Mixer_EQ_' + str(index)
			mixer.channel_strip(index)._invert_mute_feedback = True
		self.song().view.selected_track = mixer.channel_strip(0)._track #set the selected strip to the first track, so that we don't, for example, try to assign a button to arm the master track, which would cause an assertion error


	def _setup_session_control(self):
		is_momentary = True
		num_tracks = 7
		num_scenes = 7  ###changed from 5 for HH 
		global session
		session = SessionComponent(num_tracks, num_scenes)
		session.name = "Session"
		session.set_offsets(0, 0)
		self._session = session		 
		self._scene = [None for index in range(num_scenes)]
		for row in range(num_scenes):
			self._scene[row] = session.scene(row)
			self._scene[row].name = 'Scene_' + str(row)
			for column in range(num_tracks):
				clip_slot = self._scene[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_' + str(row)		
		session.set_mixer(mixer)
		self._session_zoom = SessionZoomingComponent(session)	 
		self._session_zoom.name = 'Session_Overview'
		self.set_highlighting_session_component(self._session)

		
	def _assign_session_colors(self):
		num_tracks = 7
		num_scenes = 7 
		self._session.set_stop_track_clip_value(STOP_CLIP_COLOR[self._rgb])
		for row in range(num_scenes): 
			for column in range(num_tracks):
				self._scene[row].clip_slot(column).set_triggered_to_play_value(CLIP_TRIGD_TO_PLAY_COLOR[self._rgb])
				self._scene[row].clip_slot(column).set_triggered_to_record_value(CLIP_TRIGD_TO_RECORD_COLOR[self._rgb])
				self._scene[row].clip_slot(column).set_stopped_value(CLIP_STOPPED_COLOR[self._rgb])
				self._scene[row].clip_slot(column).set_started_value(CLIP_STARTED_COLOR[self._rgb])
				self._scene[row].clip_slot(column).set_recording_value(CLIP_RECORDING_COLOR[self._rgb])		
		self._session_zoom.set_stopped_value(ZOOM_STOPPED_COLOR[self._rgb])
		self._session_zoom.set_playing_value(ZOOM_PLAYING_COLOR[self._rgb])
		self._session_zoom.set_selected_value(ZOOM_SELECTED_COLOR[self._rgb])
		

	def _setup_device_control(self):
		self._device = DeviceComponent()
		self._device.name = 'Device_Component'
		self.set_device_component(self._device)
		self._device_navigator = DetailViewControllerComponent()
		self._device_navigator.name = 'Device_Navigator'
		self._device_selection_follows_track_selection = FOLLOW
		
	def device_follows_track(self, val):
		self._device_selection_follows_track_selection = (val == 1)
		return self
		
	def _setup_crossfader(self):
		self._mixer.set_crossfader_control(self._crossfader)
	

	def _setup_scene_selector(self):
		for index in range(5):
			self._menu[index].add_value_listener(self._select_new_scene, True)
	

	def set_bank(self, val):
		self._scene_bank = int(val)
		self._monobridge._send('bank', self._scene_bank)
		self._display_bank()
	

	def _select_mode(self, value):
		self.log_message('select mode update' + str(value))
		self._bank_is_on = value!=0
		if self._bank_is_on is True:
			self._display_bank()
		else:
			self._on_selected_scene_changed()
	

	def _select_new_scene(self, value, sender):
		if self._bank_is_on is False:
			if value > 0:
				new_scene = int(self._scene_indexes[self._scene_bank][self._menu.index(sender)][0])
				new_track = int(self._scene_indexes[self._scene_bank][self._menu.index(sender)][1])
				self.log_message('select new scene ' + str(new_scene) + ' and track ' + str(new_track))
				all_scenes = self.song().scenes
				all_tracks = self.song().tracks
				if (new_scene < len(all_scenes)) and (new_track < len(all_tracks)):
					self.song().view.selected_scene = all_scenes[(new_scene)]
					self.song().view.selected_track = all_tracks[(new_track)]
					self._session.set_offsets(self._scene_indexes[self._scene_bank][self._menu.index(sender)][1], self._scene_indexes[self._scene_bank][self._menu.index(sender)][0])
		else:
			if value > 0:
				self._scene_bank = int(self._menu.index(sender))
				self._monobridge._send('bank', self._scene_bank)
				self._display_bank()
	

	def _display_bank(self):
		if(self._bank_is_on):
			for index in range(5):
				if index == self._scene_bank:
					self._menu[index].send_value(11)
				else:
					self._menu[index].send_value(0)
	



	def _on_selected_scene_changed(self):
		ControlSurface._on_selected_scene_changed(self)
		#self.log_message('scene offset: ' + str(self._session._scene_offset))
		for index in range(6):
			if self._session._scene_offset == self._scene_indexes[self._scene_bank][index][0]:  ## and self._session._scene_offset < self._scene_indexes[index + 1]:
				self._menu[index].turn_on()
			else:
				self._menu[index].turn_off()
		#if self._session._scene_offset >= self._scene_indexes[5]:
		#	self._menu[5].turn_on
		#else:
		#	self._menu[5].turn_off
			
	
	def _setup_hilight_knobs(self):
		self._dial[15].add_value_listener(self._knob_set_scene, True)
		self._dial[14].add_value_listener(self._knob_set_track, True)
	

	def _knob_set_scene(self, value, sender):
		all_scenes = self.song().scenes
		num_scenes = len(all_scenes)
		new_scene = float(value/127.0) * float(num_scenes - 1)
		self.song().view.selected_scene = all_scenes[int(new_scene)]
		self._session.set_offsets(self._session._track_offset, int(new_scene))
	

	def _knob_set_track(self, value, sender):
		#self.log_message(str(value))
		all_tracks = self.song().visible_tracks  #self.song().tracks
		num_tracks = len(self.song().visible_tracks)
		new_track = float(value/127.0) * float(num_tracks - 1)
		#self.log_message(str(int(new_track)))
		#self.log_message(str(value) + str(float(value/127.0)))
		self.song().view.selected_track = all_tracks[int(new_track)]
		self._session.set_offsets(int(new_track), self._session._scene_offset)
	

	def disconnect(self):
		"""clean things up on disconnect"""
		for index in range(5):
			if self._menu[index].value_has_listener(self._select_new_scene):
				self._menu[index].remove_value_listener(self._select_new_scene)
		if self._menu[5].value_has_listener(self._select_mode):
			self._menu[5].remove_value_listener(self._select_mode)
		if self._dial[15].value_has_listener(self._knob_set_scene):
			self._dial[15].remove_value_listener(self._knob_set_scene)
		if self._dial[15].value_has_listener(self._knob_set_scene):		
			self._dial[15].remove_value_listener(self._knob_set_scene)
		self.song().view.remove_selected_track_listener(self._update_selected_device)
		ControlSurface.disconnect(self)
		self.log_message(time.strftime("%d.%m.%Y %H:%M:%S", time.localtime()) + "--------------= OhmModes log closed =--------------") #Create entry in log file
		return None

	def _get_num_tracks(self):
		return self.num_tracks

	def flash(self):
		#if(self.flash_status > 0):
		for index in range(6):
			if(self._menu[index]._flash_state>0):
				self._menu[index].flash(self._timer)
		for row in range(8):
			if(self._button[row]._flash_state > 0):
				self._button[row].flash(self._timer)
			for column in range(8):
				button = self._grid[column][row]
				if(button._flash_state > 0):
					button.flash(self._timer)


	def strobe(self):
		if(self._backlight_type != 'static'):
			if(self._backlight_type is 'pulse'):
				self._backlight = int(math.fabs(((self._timer * 16) % 64) -32) +32)
			if(self._backlight_type is 'up'):
				self._backlight = int(((self._timer * 8) % 64) + 16)
			if(self._backlight_type is 'down'):
				self._backlight = int(math.fabs(int(((self._timer * 8) % 64) - 64)) + 16)
		self._send_midi(tuple([176, 27, int(self._backlight)]))
		if(self._ohm_type != 'static'):
			if(self._ohm_type is 'pulse'):
				self._ohm = int(math.fabs(((self._timer * 16) % 64) -32) +32)
			if(self._ohm_type is 'up'):
				self._ohm = int(((self._timer * 8) % 64) + 16)
			if(self._ohm_type is 'down'):
				self._ohm = int(math.fabs(int(((self._timer * 8) % 64) - 64)) + 16)
		self._send_midi(tuple([176, 63, int(self._ohm)]))
		self._send_midi(tuple([176, 31, int(self._ohm)]))	

	def deassign_matrix(self):
		#self._scale_mode.set_mode_buttons(None)
		#self._scale_mode.set_enabled(False)
		#self._octave_mode.set_mode_buttons(None)
		#self._octave_mode.set_enabled(False)
		#self._session_zoom.set_button_matrix(None)
		#if self._dial[15].has_value_listener(self._knob_set_scene):
		#	self._dial[15].remove_value_listener(self._knob_set_scene)
		#if self._dial[14].has_value_listener(self._knob_set_track):
		#	self._dial[14].remove_value_listener(self._knob_set_track)
		self._session_zoom.set_enabled(False)
		self._session_zoom.set_nav_buttons(None, None, None, None)
		self._session.set_track_bank_buttons(None, None)
		self._session.set_scene_bank_buttons(None, None)
		for column in range(7):
			self._mixer.channel_strip(column).set_crossfade_toggle(None)
			self._mixer.channel_strip(column).set_mute_button(None)
			self._mixer.channel_strip(column).set_solo_button(None)
			self._mixer.channel_strip(column).set_arm_button(None)
			self._mixer.channel_strip(column).set_send_controls(None)
			self._mixer.channel_strip(column).set_pan_control(None)
			self._mixer.track_eq(column).set_enabled(False)
			for row in range(7):
				self._scene[row].clip_slot(column).set_launch_button(None)
		for column in range(8):
			#self._button[column]._on_value = SELECT_COLOR[self._rgb]
			for row in range(8):
				self._grid[column][row].set_channel(0)
				self._grid[column][row].release_parameter()
				self._grid[column][row].use_default_message()
				self._grid[column][row].set_enabled(True)
				self._grid[column][row].send_value(0, True)
				self._grid[column][row]._on_value = 127
				self._grid[column][row]._off_value = 0
		#for index in range(8):
		#	self._button[index].set_channel(0)
		#	self._button[index].use_default_message()
		#	self._button[index].set_enabled(True)
		#	self._button[index].reset()
		#for index in range(6):
		#	self._menu[index]._on_value = 127
		#	self._menu[index]._off_value = 0
		#	self._menu[index].reset()
		#for index in range(16):
		#	self._dial[index].use_default_message()
		#	self._dial[index].release_parameter()
			#self._dial[index].set_enabled(True)
		if(self._device._parameter_controls != None):
			for control in self._device._parameter_controls:
				control.release_parameter()
			self._device._parameter_controls = None
		self._device_navigator.set_enabled(False)
		self._mixer.update()
		self._matrix.reset()

		"""HH Specific"""
		#self._mixer.master_strip().set_select_button(None)
		#for column in range(7):
		#	self._mixer.channel_strip(column).set_select_button(None)
		self._session_zoom.set_zoom_button(None)
		self._transport.set_play_button(None)
		self._transport.set_stop_button(None)
		self._device_navigator.set_device_nav_buttons(None, None)
		
		#for index in range(2):
		#	self._looper[index].find_looper()
		
	def _assign_page_constants(self):
		#self._session_zoom.set_zoom_button(self._button[7]) #commented out pn 070111
		#self._session_zoom.set_zoom_button(self._grid[7][7]) #added pn 070111
		self._session_zoom.set_button_matrix(self._matrix)
		#self._session_zoom.set_enabled(True)
		#for column in range(7):
			#self._mixer.channel_strip(column).set_select_button(self._button[column])
		#	self._mixer.channel_strip(column).set_volume_control(self._fader[column])
		#self._mixer.master_strip().set_volume_control(self._fader[7])
		#for column in range(8):
		#	self._button[column]._on_value = SELECT_COLOR[self._rgb]
		#self._mixer.master_strip().set_select_button(self._button[7]) #added pn 070111
		#self._mixer.set_prehear_volume_control(self._dial[15])
		#self._transport.set_play_button(self._menu[0])
		#self._menu[0].send_value(PLAY_COLOR[self._rgb], True)	
		#self._menu[0]._on_value = PLAY_COLOR[self._rgb]
		#self._transport.set_stop_button(self._menu[1])
		#self._menu[1]._off_value = STOP_COLOR[self._rgb]
		#self._menu[1]._on_value = STOP_COLOR[self._rgb]
		#self._menu[1].send_value(STOP_COLOR[self._rgb], True)	
		self._livid._on_value = TAP_COLOR[self._rgb]
		self._transport.set_tap_tempo_button(self._livid)
		#self._livid.send_value(TAP_COLOR, True)
		#self._device_navigator.set_device_nav_buttons(self._menu[3], self._menu[4])
		for index in range(2):
			self._menu[index + 4]._on_value = SESSION_NAV[self._rgb]
			self._menu[index * 3]._on_value = SESSION_NAV[self._rgb]
		self._session.set_track_bank_buttons(self._menu[5], self._menu[4])
		self._session.set_scene_bank_buttons(self._menu[3], self._menu[0])


	def assign_page_0(self):
		self._backlight_type = 'static'
		#self._session_zoom.set_button_matrix(self._matrix)
		self._session_zoom.set_enabled(True)
		for column in range(7):
			#self._grid[column][5]._on_value = MUTE_COLOR[self._rgb]
			#self._mixer.channel_strip(column).set_mute_button(self._grid[column][5])
			#self._grid[column][6]._on_value = SOLO_COLOR[self._rgb]
			#self._mixer.channel_strip(column).set_solo_button(self._grid[column][6])
			#self._grid[column][7]._on_value = ARM_COLOR[self._rgb]
			#self._mixer.channel_strip(column).set_arm_button(self._grid[column][7])
			#self._mixer.channel_strip(column).set_pan_control(self._dial[column + 8])
			for row in range(7):
				self._scene[row].clip_slot(column).set_launch_button(self._grid[column][row])
		#for column in range(4):
		#	self._mixer.channel_strip(column).set_send_controls(tuple([self._dial[column], self._dial[column + 4]]))
		track_stop_buttons = []
		for index in range(7):
			self._grid[7][index]._off_value = SCENE_LAUNCH_COLOR[self._rgb]
			self._scene[index].set_launch_button(self._grid[7][index])
			self._grid[index][7]._on_value = TRACK_STOP[self._rgb]
			self._grid[index][7]._off_value = TRACK_STOP[self._rgb]
			track_stop_buttons.append(self._grid[index][7])
		self._session.set_stop_track_clip_buttons(tuple(track_stop_buttons))
		self._session.set_stop_all_clips_button(self._grid[7][7])
		#for index in range(4):
		#	self._menu[2 + index]._on_value = NAV_BUTTON_COLOR[self._rgb]
		#self._session.set_track_bank_buttons(self._menu[4], self._menu[3])
		#self._session.set_scene_bank_buttons(self._menu[5], self._menu[2])
		#for index in range(6):
		#	self._menu[index]._on_value = HHMENU[index][1]
		#	self._menu[index]._off_value = HHMENU[index][0]
		for index in range(8):
			self._button[index].set_channel(2)
			self._button[index].set_identifier(index)
			#self._button[index].reset()
			self._button[index].set_enabled(False)
		self.request_rebuild_midi_map()
		for index in range(7):
			self._grid[index][7].turn_on()
		for index in range(2):
			self._looper[index]._state_change()
			self._button[1 + (index * 4)].send_value(3)
			self._button[2 + (index * 4)].send_value(6)
			self._button[3 + (index * 4)].send_value(1)

	def assign_page_1(self):
		self._backlight_type = 'pulse'
		self._session_zoom.set_enabled(False)
		for column in range(4):
			for row in range(4):
				self._grid[column][row].set_channel(PAGE1_DRUM_CHANNEL)
				self._grid[column][row].set_identifier(PAGE1_DRUM_MAP[column][row])
				self._grid[column][row].send_value(DRUM_COLOR[self._rgb], True)
				self._grid[column][row].set_enabled(False)
				self._grid[column + 4][row].set_channel(PAGE1_BASS_CHANNEL)
				self._grid[column + 4][row].set_identifier(PAGE1_BASS_MAP[column][row])
				self._grid[column + 4][row].send_value(BASS_COLOR[self._rgb], True)
				self._grid[column + 4][row].set_enabled(False)
		scale_mode_buttons = []
		for column in range(8):
			for row in range(3):
				self._grid[column][row + 4].set_enabled(False)
				self._grid[column][row + 4].set_channel(PAGE1_KEYS_CHANNEL)
				self._grid[column][row + 4].set_identifier(int(PAGE1_KEYS_MAP[column][row]) + int(PAGE1_MODES_MAP[self._scale_mode._mode_index][column]) + int(self._octave_mode._mode_index * 12))
				self._grid[column][row + 4].send_value(KEYS_COLOR[self._rgb], True)
			for row in range(1):
				scale_mode_buttons.append(self._grid[column][7])
		self._scale_mode.set_mode_buttons(tuple(scale_mode_buttons))
		self._scale_mode.set_enabled(True)
		#self._octave_mode.set_mode_buttons(tuple([self._menu[5], self._menu[2]]))
		#self._octave_mode.set_enabled(True)
		for column in range(7):
			self._mixer.channel_strip(column).set_send_controls(tuple([self._dial[column + 8]]))
			#self._button[column].set_on_off_values(REC_ARM, 0)
			#self._mixer.channel_strip(column).set_arm_button(self._button[column])
		self._device.set_enabled(True)
		device_param_controls = []
		for index in range(8):
			device_param_controls.append(self._dial[index])
		self._device.set_parameter_controls(tuple(device_param_controls))
		#for index in range(4):
		#	self._menu[2 + index]._on_value = (DEVICE_NAV_COLOR[self._rgb])
		#self._device_navigator.set_enabled(True)

		"""HH Specific from Constants"""
		#self._mixer.master_strip().set_select_button(self._button[7])
		#for column in range(7):
		#	self._button[column].set_on_off_values(REC_ARM, 0)
		#self._session_zoom.set_zoom_button(self._grid[7][7])
		#self._transport.set_play_button(self._menu[0])
		#self._menu[0].send_value(PLAY_COLOR[self._rgb], True)	
		#self._menu[0]._on_value = PLAY_COLOR[self._rgb]
		#self._transport.set_stop_button(self._menu[1])
		#self._menu[1]._off_value = STOP_COLOR[self._rgb]
		#self._menu[1]._on_value = STOP_COLOR[self._rgb]
		#self._menu[1].send_value(STOP_COLOR[self._rgb], True)
		#self._device_navigator.set_device_nav_buttons(self._menu[3], self._menu[4])
		for index in range(8):
			self._button[index].set_channel(2)
			self._button[index].set_identifier(index)
			#self._button[index].reset()
			self._button[index].set_enabled(False)
		self.request_rebuild_midi_map()
		#for index in range(8):
		#	self._grid[index][7].send(self.
		for index in range(2):
			self._looper[index]._state_change()
			self._button[1 + (index * 4)].send_value(3)
			self._button[2 + (index * 4)].send_value(6)
			self._button[3 + (index * 4)].send_value(1)
	
	def assign_page_2(self):
		self._backlight_type = 'up'
		#self._session_zoom.set_button_matrix(self._matrix)
		self._session_zoom.set_enabled(True)
		for column in range(7):
			self._grid[column][5]._on_value = MUTE_COLOR[self._rgb]
			self._mixer.channel_strip(column).set_mute_button(self._grid[column][5])
			self._grid[column][6]._on_value = CROSSFADE_ASSIGN_COLOR[self._rgb]
			self._mixer.channel_strip(column).set_crossfade_toggle(self._grid[column][6])
			self._grid[column][7].set_channel(2)
			self._grid[column][7].set_identifier(column)
			self._grid[column][7].reset()
			self._grid[column][7].set_enabled(False)
			self._grid[column][7].send_value(4, True)
			for row in range(5):
				self._scene[row].clip_slot(column).set_launch_button(self._grid[column][row])
		for row in range(5):
			self._grid[7][row]._off_value = SCENE_LAUNCH_COLOR[self._rgb]
			self._scene[row].set_launch_button(self._grid[7][row])
		for column in range(4):
			self._mixer.track_eq(column).set_gain_controls(tuple([self._dial[column + 8], self._dial[column + 4], self._dial[column]]))
			self._mixer.track_eq(column).set_enabled(True)	
		for column in range(3):
			self._mixer.channel_strip(column+4).set_pan_control(self._dial[column + 12])
		#for index in range(4):
		#	self._menu[2 + index]._on_value = NAV_BUTTON_COLOR[self._rgb]
		#self._session.set_track_bank_buttons(self._menu[4], self._menu[3])
		#self._session.set_scene_bank_buttons(self._menu[5], self._menu[2])
		self._set_tempo_buttons([self._grid[7][5], self._grid[7][6]])
		
		"""HH Specific from Constants"""
		#self._mixer.master_strip().set_select_button(self._button[7])
		#for column in range(7):
		#	self._mixer.channel_strip(column).set_select_button(self._button[column])
		#for index in range(8):
		#	self._button[index].set_on_off_values(SELECT_COLOR[self._rgb], 0)
		self._session_zoom.set_zoom_button(self._grid[7][7])
		#self._transport.set_play_button(self._menu[0])
		#self._menu[0].send_value(PLAY_COLOR[self._rgb], True)	
		#self._menu[0]._on_value = PLAY_COLOR[self._rgb]
		#self._transport.set_stop_button(self._menu[1])
		#self._menu[1]._off_value = STOP_COLOR[self._rgb]
		#self._menu[1]._on_value = STOP_COLOR[self._rgb]
		#self._menu[1].send_value(STOP_COLOR[self._rgb], True)
		#self._device_navigator.set_device_nav_buttons(self._menu[3], self._menu[4])
		for index in range(8):
			self._button[index].set_channel(2)
			self._button[index].set_identifier(index)
			#self._button[index].reset()
			self._button[index].set_enabled(False)
		self.request_rebuild_midi_map()
		for index in range(2):
			self._looper[index]._state_change()
			self._button[1 + (index * 4)].send_value(3)
			self._button[2 + (index * 4)].send_value(6)
			self._button[3 + (index * 4)].send_value(1)
		
	
	def _update_selected_device(self):
		if self._device_selection_follows_track_selection is True:
			track = self.song().view.selected_track
			device_to_select = track.view.selected_device
			if device_to_select == None and len(track.devices) > 0:
				device_to_select = track.devices[0]
			if device_to_select != None:
				self.song().view.select_device(device_to_select)
			#self._device.set_device(device_to_select)
			self.set_appointed_device(device_to_select)
			#self._device_selector.set_enabled(True)
			self.request_rebuild_midi_map()
		return None
	
	def handle_sysex(self, midi_bytes):
		#self.log_message(str('>>sysexIN') + str(midi_bytes))
		if len(midi_bytes) > 10:
			#self.log_message(str('>>sysex>10') + str(midi_bytes[:11]))
			if midi_bytes[:11] == tuple([240, 126, 0, 6, 2, 0, 1, 97, 1, 0, 7]):
				self.log_message(str('>>>color detected'))
				self._rgb = 1
			elif midi_bytes[:11] == tuple([240, 126, 0, 6, 2, 0, 1, 97, 1, 0, 2]):
				self.log_message(str('>>>mono detected'))
				self._rgb = 0
		self._assign_session_colors()
		#self._shift_mode.update()
		self.deassign_matrix()
		self._assign_page_constants()
		self.assign_page_0()
		#self._setup_hilight_knobs()
		for index in range(8):
			self._grid[7][index].send_value(SCENE_LAUNCH_COLOR[self._rgb])
		for index in range(7):
			self._grid[index][7].turn_on()

# 	def handle_sysex(self, midi_bytes):
# 		#assert(isinstance (midi_bytes, tuple))
# 		##self.log_message(str('sysex') + str(midi_bytes))
# 		if midi_bytes == tuple([240, 126, 0, 6, 2, 0, 1, 97, 1, 0, 7, 0, 15, 10, 0, 0, 247]):
# 			self.log_message(str('color detected'))
# 			self._rgb = 1
# 		elif midi_bytes == tuple([240, 126, 0, 6, 2, 0, 1, 97, 1, 0, 2, 0, 0, 1, 1, 0, 247]):
# 			self.log_message(str('mono detected'))
# 			self._rgb = 0
# 		self._assign_session_colors()

	def receive_midi(self, midi_bytes):
		""" Live -> Script
		MIDI messages are only received through this function, when explicitly 
		forwarded in 'build_midi_map'.
	"""
		assert (midi_bytes != None)
		assert isinstance(midi_bytes, tuple)
		##self.log_message('got message' + str(midi_bytes))
		#self.set_suppress_rebuild_requests(True)
		with self.component_guard():
			if (len(midi_bytes) is 3):
				msg_type = (midi_bytes[0] & 240)
				forwarding_key = [midi_bytes[0]]
				if (msg_type is not MIDI_PB_TYPE):
					forwarding_key.append(midi_bytes[1])
				if (tuple(forwarding_key) in self._forwarding_registry.keys()):
					recipient = self._forwarding_registry[tuple(forwarding_key)]
					if (recipient != None):
						recipient.receive_value(midi_bytes[2])
				else:
					self.log_message(('Got unknown message: ' + str(midi_bytes)))
			else:
				self.handle_sysex(midi_bytes)
		#self.set_suppress_rebuild_requests(False)		 

	def _set_tempo_buttons(self, buttons):
		if self._tempo_buttons != None:
			self._tempo_buttons[0].remove_value_listener(self._tempo_value)
			self._tempo_buttons[1].remove_value_listener(self._tempo_value)
		self._tempo_buttons = buttons
		if buttons != None:
			for button in buttons:
				assert isinstance(button, FlashingButtonElement)
			self._tempo_buttons[0].set_on_off_values(4, 0)
			self._tempo_buttons[0].add_value_listener(self._tempo_value, True)
			self._tempo_buttons[1].set_on_off_values(4, 0)
			self._tempo_buttons[1].add_value_listener(self._tempo_value, True)
			self._tempo_buttons[0].turn_on()
			self._tempo_buttons[1].turn_on()

	def _tempo_value(self, value, sender):
		if (value > 0) and (self._tempo_buttons.index(sender) == 0):
			self.song().tempo = round(min((self.song().tempo + 1), 999))
		elif (value > 0) and (self._tempo_buttons.index(sender) == 1):
			self.song().tempo = round(max((self.song().tempo - 1), 20))
			
		

	def set_scene_index_value(self, bank_index, scene, track):
		bank = int(bank_index)/5
		index = int(bank_index)%5
		self.log_message('set_scene_index_value' + str(bank) + str(index) + str(scene) + str(track))
		#self.log_message( str(type(index)) + str(type(scene)) + str(type(track)))
		self._scene_indexes[bank][index][0] = scene
		self._scene_indexes[bank][index][1] = track
		#self._on_selected_scene_changed()
	

	def connect_script_instances(self, instanciated_scripts):
		#link = False
		#offsets = [0, 0]
		#new_channel = CHAN
		for s in instanciated_scripts:
			if isinstance(s, APC) or s is self:
				#link = True
				if not s._session._is_linked():
					s._session._link()
					#self.log_message('found other linked instance')
					#offsets[0] += (int(self._link_offset[0]) * 8)
					#offsets[1] += (int(self._link_offset[1]) * 4)
					#new_channel += 1
		#if link and not self._session._is_linked():
			#self._session.set_offsets(offsets[0], offsets[1])
			#self._session._link()
		#self._set_code_channels(new_channel)
	
	
#
#