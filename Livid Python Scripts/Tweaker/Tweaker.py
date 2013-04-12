# by amounra 0413 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys
from itertools import chain

""" _Framework files """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
from _Framework.ClipSlotComponent import ClipSlotComponent # Class representing a ClipSlot within Live
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DisplayDataSource import DisplayDataSource # Data object that is fed with a specific string and notifies its observers
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.SessionZoomingComponent import SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
from _Framework.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
from _Framework.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section

"""Custom files, overrides, and files from other scripts"""
from MonoButtonElement import MonoButtonElement as FlashingButtonElement
from Live8DeviceComponent import Live8DeviceComponent as DeviceComponent
from DetailViewControllerComponent import DetailViewControllerComponent
from PadOffsetComponent import PadOffsetComponent

import LiveUtils
from _Generic.Devices import *
from Tweaker_Map import *

""" Here we define some global variables """
CHANNEL = 0 
session = None 
mixer = None 
NUM_TRACKS = 7
NUM_SCENES = 3

EQ3_BANK1 = ('GainHi',
 'GainMid',
 'GainLo',
 '',
 'FreqHi',
 'FreqLo',
 'Slope',
 '')
EQ3_BANK2 = ('FreqHi',
 'FreqLo',
 'Slope',
 '',
 'GainHi',
 'GainMid',
 'GainLo',
 '')
EQ3_BANKS = (EQ3_BANK1, EQ3_BANK2)
EQ3_BOBS = (EQ3_BANK1, EQ3_BANK2)
DEVICE_DICT = {'AudioEffectGroupDevice': RCK_BANKS,
 'MidiEffectGroupDevice': RCK_BANKS,
 'InstrumentGroupDevice': RCK_BANKS,
 'DrumGroupDevice': RCK_BANKS,
 'InstrumentImpulse': IMP_BANKS,
 'Operator': OPR_BANKS,
 'UltraAnalog': ALG_BANKS,
 'OriginalSimpler': SIM_BANKS,
 'MultiSampler': SAM_BANKS,
 'MidiArpeggiator': ARP_BANKS,
 'LoungeLizard': ELC_BANKS,
 'StringStudio': TNS_BANKS,
 'MidiChord': CRD_BANKS,
 'MidiNoteLength': NTL_BANKS,
 'MidiPitcher': PIT_BANKS,
 'MidiRandom': RND_BANKS,
 'MidiScale': SCL_BANKS,
 'MidiVelocity': VEL_BANKS,
 'AutoFilter': AFL_BANKS,
 'AutoPan': APN_BANKS,
 'BeatRepeat': BRP_BANKS,
 'Chorus': CHR_BANKS,
 'Compressor2': CP3_BANKS,
 'Tube': DTB_BANKS,
 'Eq8': EQ8_BANKS,
 'FilterEQ3': EQ3_BANKS,
 'Erosion': ERO_BANKS,
 'FilterDelay': FLD_BANKS,
 'Flanger': FLG_BANKS,
 'GrainDelay': GRD_BANKS,
 'Phaser': PHS_BANKS,
 'Redux': RDX_BANKS,
 'Saturator': SAT_BANKS,
 'Resonator': RSN_BANKS,
 'CrossDelay': SMD_BANKS,
 'StereoGain': UTL_BANKS,
 'Tube': DTB_BANKS,
 'Reverb': RVB_BANKS,
 'Vinyl': VDS_BANKS,
 'Gate': GTE_BANKS,
 'PingPongDelay': PPG_BANKS}
DEVICE_BOB_DICT = {'AudioEffectGroupDevice': RCK_BOBS,
 'MidiEffectGroupDevice': RCK_BOBS,
 'InstrumentGroupDevice': RCK_BOBS,
 'DrumGroupDevice': RCK_BOBS,
 'InstrumentImpulse': IMP_BOBS,
 'Operator': OPR_BOBS,
 'UltraAnalog': ALG_BOBS,
 'OriginalSimpler': SIM_BOBS,
 'MultiSampler': SAM_BOBS,
 'MidiArpeggiator': ARP_BOBS,
 'LoungeLizard': ELC_BOBS,
 'StringStudio': TNS_BOBS,
 'MidiChord': CRD_BOBS,
 'MidiNoteLength': NTL_BOBS,
 'MidiPitcher': PIT_BOBS,
 'MidiRandom': RND_BOBS,
 'MidiScale': SCL_BOBS,
 'MidiVelocity': VEL_BOBS,
 'AutoFilter': AFL_BOBS,
 'AutoPan': APN_BOBS,
 'BeatRepeat': BRP_BOBS,
 'Chorus': CHR_BOBS,
 'Compressor2': CP3_BOBS,
 'Tube': DTB_BOBS,
 'Eq8': EQ8_BOBS,
 'FilterEQ3': EQ3_BOBS,
 'Erosion': ERO_BOBS,
 'FilterDelay': FLD_BOBS,
 'Flanger': FLG_BOBS,
 'GrainDelay': GRD_BOBS,
 'Phaser': PHS_BOBS,
 'Redux': RDX_BOBS,
 'Saturator': SAT_BOBS,
 'Resonator': RSN_BOBS,
 'CrossDelay': SMD_BOBS,
 'StereoGain': UTL_BOBS,
 'Tube': DTB_BOBS,
 'Reverb': RVB_BOBS,
 'Vinyl': VDS_BOBS,
 'Gate': GTE_BOBS,
 'PingPongDelay': PPG_BOBS}




class Tweaker(ControlSurface):
	__module__ = __name__
	__doc__ = " MonOhmod companion controller script "


	def __init__(self, c_instance):
		"""everything except the '_on_selected_track_changed' override and 'disconnect' runs from here"""
		ControlSurface.__init__(self, c_instance)
		with self.component_guard():
			self._update_linked_device_selection = None
			self._tweaker_version_check = '0.2'
			self.log_message("--------------= Tweaker Session " + str(self._tweaker_version_check) + " log opened =--------------") 
			self._timer = 0
			self.flash_status = 1
			self._device_selection_follows_track_selection = False
			#self._pad_translations = PAD_TRANSLATION
			self._linked_session = None
			self._mixer_offset = 0
			self._nav_lock = True
			self._setup_controls()
			self._setup_transport_control() 
			self._setup_device_control()
			self._setup_mixer_control()
			self._setup_session_control()
			self._setup_crossfader()
			self._setup_modes() 
			self._setup_pads()
			self._setup_navigation_lock()
			self._setup_arrange_session_toggle()
			self.assign_main_configuration()
			self.request_rebuild_midi_map()
			self._mixer._reassign_tracks()	#this is to update rebuild the cf_assign closure, otherwise the colors aren't correct
			#self.schedule_message(30, self._detect_devices)
			#self.schedule_message(10, self._shift_value, (self, 0))
			self.show_message('Tweaker Control Surface Loaded')
		self._shift_value(0)  #this updates the pads so that they transmit to Live on the assigned PAD_CHANNEL

	

	"""script initialization methods"""
	def _setup_controls(self):
		is_momentary = True
		self._grid = [None for index in range(8)]
		for column in range(8):
			self._grid[column] = [FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, column + (row * 8) + 1, 'Grid_' + str(column) + '_' + str(row), self) for row in range(4)]
		self._button = [FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, TWEAKER_BUTTONS[index], 'Button_' + str(index), self) for index in range(len(TWEAKER_BUTTONS))]
		self._nav = [FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, TWEAKER_NAVS[index], 'Nav_' + str(index), self) for index in range(len(TWEAKER_NAVS))]
		self._encoder_button = [FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, TWEAKER_ENCODER_BUTTONS[index], 'Encoder_Button_' + str(index), self) for index in range(len(TWEAKER_ENCODER_BUTTONS))]
		self._dial = [EncoderElement(MIDI_CC_TYPE, CHANNEL, TWEAKER_DIALS[index], Live.MidiMap.MapMode.absolute) for index in range(len(TWEAKER_DIALS))]
		self._fader = [EncoderElement(MIDI_CC_TYPE, CHANNEL, TWEAKER_FADERS[index], Live.MidiMap.MapMode.absolute) for index in range(len(TWEAKER_FADERS))]
		self._crossfader = EncoderElement(MIDI_CC_TYPE, CHANNEL, CROSSFADER, Live.MidiMap.MapMode.absolute)
		self._encoder = [EncoderElement(MIDI_CC_TYPE, CHANNEL, TWEAKER_ENCODERS[index], Live.MidiMap.MapMode.absolute) for index in range(len(TWEAKER_ENCODERS))]
		self._pad = [FlashingButtonElement(False, MIDI_NOTE_TYPE, CHANNEL, TWEAKER_PADS[index], 'Pad_' + str(index), self) for index in range(len(TWEAKER_PADS))]
		self._pad_pressure = [EncoderElement(MIDI_CC_TYPE, CHANNEL, TWEAKER_PAD_PRESSURES[index], Live.MidiMap.MapMode.absolute) for index in range(len(TWEAKER_PADS))]
		for index in range(8):
			self._pad_pressure[index]._last_sent = 0
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Matrix'
		for row in range(4):
			button_row = []
			for column in range(7):
				button_row.append(self._grid[column][row])
			self._matrix.add_row(tuple(button_row)) 	
		self._send_midi(tuple([240,0,1,106,01,07,21,21,247])) #set all pots to walk mode
		self._send_midi(tuple([240, 0, 1, 106, 1, 6, 127 , 127, 25, 0, 15, 0, 9, PAD_SENSITIVITY, 247]))	#set pads to sensitivity set in Map file
	

	def _setup_transport_control(self):
		self._transport = TransportComponent() 
		self._transport.name = 'Transport'
	

	def _setup_mixer_control(self):
		is_momentary = True
		self._num_tracks = (2) #A mixer is one-dimensional; 
		self._mixer = MixerComponent(2, 0, False, False)
		self._mixer.name = 'Mixer'
		self._mixer.tracks_to_use = self._mixer_tracks_to_use(self._mixer)
		self._device_navigator = [None for index in range(2)]
		self._mixer.set_track_offset(0) #Sets start point for mixer strip (offset from left)
		for index in range(2):
			self._mixer.channel_strip(index).set_volume_control(self._fader[index])
			self._mixer.channel_strip(index)._on_cf_assign_changed = self._channelstrip_on_cf_assign_changed(self._mixer.channel_strip(index))
			self._mixer.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)
			#mixer.track_filter(index).name = 'Mixer_TrackFilter_' + str(index)
			self._mixer.channel_strip(index)._invert_mute_feedback = True
			self._mixer.channel_strip(index)._device_component = self._device[index]
			self._mixer.channel_strip(index).update = self._channelstrip_update(self._mixer.channel_strip(index))
			self._device_navigator[index] = DetailViewControllerComponent(self, self._mixer.channel_strip(index))
			self._device_navigator[index].name = 'Device_Navigator_'+str(index)
		#these need reinstated #
		self._mixer.channel_strip(0).set_track = self._channelstrip_set_track(self._mixer.channel_strip(0), self._channelstrip1_cb)
		#these need reinstated #
		self._mixer.channel_strip(1).set_track = self._channelstrip_set_track(self._mixer.channel_strip(1), self._channelstrip2_cb)
		self.song().view.selected_track = self._mixer.channel_strip(0)._track #set the selected strip to the first track, so that we don't, for example, try to assign a button to arm the master track, which would cause an assertion error
		#self._mixer._reassign_tracks()
	

	def _setup_session_control(self):
		is_momentary = True
		num_tracks = NUM_TRACKS
		num_scenes = NUM_SCENES
		#global session
		self._session = SessionComponent(num_tracks, num_scenes)
		self._session.name = "Session"
		self._session.set_offsets(0, 0)	 
		self._session.set_stop_track_clip_value(STOP_CLIP)
		self._scene = [None for index in range(3)]
		for row in range(num_scenes):
			self._scene[row] = self._session.scene(row)
			self._scene[row].name = 'Scene_' + str(row)
			for column in range(num_tracks):
				clip_slot = self._scene[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_' + str(row)
				clip_slot.set_triggered_to_play_value(CLIP_TRG_PLAY)
				clip_slot.set_triggered_to_record_value(CLIP_TRG_REC)
				clip_slot.set_stopped_value(CLIP_STOP)
				clip_slot.set_started_value(CLIP_STARTED)
				clip_slot.set_recording_value(CLIP_RECORDING)
		self._session._stop_track_value = self._session_stop_track_value(self._session)
		self._session._on_fired_slot_index_changed = self._session_on_fired_slot_index_changed(self._session)
		self._session._change_offsets = self._session_change_offsets(self._session)
		self._session.update = self._session_update(self._session)
		#self._session.add_offset_listener(self._update_navigation_view)
		self._session.set_mixer(self._mixer)
		self.set_highlighting_session_component(self._session)
		self._session_zoom = SessionZoomingComponent(self._session)	 
		self._session_zoom.name = 'Session_Overview'
		self._session_zoom.set_stopped_value(ZOOM_STOPPED)
		self._session_zoom.set_playing_value(ZOOM_PLAYING)
		self._session_zoom.set_selected_value(ZOOM_SELECTED)
		#self._session_zoom.set_enabled(True) 
		#self._session.add_offset_listener(self._update_track_position)
	

	def _setup_device_control(self):
		self._device = [None for index in range(2)]
		for index in range(2):
			self._device[index] = DeviceComponent()
			self._device[index].name = 'Device_Component_'+str(index)
			self._device[index].set_enabled(True)
			self._device[index]._number_of_parameter_banks = self._device_number_of_parameter_banks(self._device[index])
			self._device[index]._assign_parameters = self._device_assign_parameters(self._device[index])
			self._device[index]._device_banks = DEVICE_DICT
			self._device[index]._device_best_banks = DEVICE_BOB_DICT
			self._device[index]._device_bank_names = BANK_NAME_DICT
	

	def _setup_crossfader(self):
		self._mixer.set_crossfader_control(self._crossfader)
	

	def _setup_modes(self):
		self._pad_offset = PadOffsetComponent(self)
		self._pad_offset.set_enabled(False)
	

	def _setup_pads(self):
		for pad in self._pad_pressure:
			pad.add_value_listener(self._light_pad, True)
	

	def _setup_navigation_lock(self):
		if(self._encoder_button[0].value_has_listener(self._nav_lock_value)):
			self._encoder_button[0].remove_value_listener(self._nav_lock_value)
		self._encoder_button[0].add_value_listener(self._nav_lock_value)
	

	def _setup_arrange_session_toggle(self):
		if(self._nav[1].value_has_listener(self._arrange_session_value)):
			self._nav[1].remove_value_listener(self._arrange_session_value)
		self._nav[1].add_value_listener(self._arrange_session_value)
	

	"""configuration methods"""
	def assign_main_configuration(self):
		for column in range(7):
			for row in range(3):
				self._scene[row].clip_slot(column).set_launch_button(self._grid[column][row])
		self._session.set_stop_track_clip_buttons(tuple([self._grid[index][3] for index in range(7)]))
		for row in range(3):
			self._scene[row].set_launch_button(self._grid[7][row])
		self._device[0].set_parameter_controls(tuple([self._encoder[index+1] for index in range(3)]))
		self._device[0].set_enabled(True)
		self._device[1].set_parameter_controls(tuple([self._encoder[index+4] for index in range(3)]))
		self._device[1].set_enabled(True)
		for track in range(2):
			self._mixer.channel_strip(track).set_volume_control(self._fader[track])
			self._mixer.channel_strip(track).set_solo_button(self._button[track*3])
			self._button[track*3].set_on_off_values(SOLO, 0)
			self._mixer.channel_strip(track).set_arm_button(self._button[1 + (track*3)])
			self._button[1 + (track*3)].set_on_off_values(ARM, 0)
			self._mixer.channel_strip(track).set_crossfade_toggle(self._button[2 + (track*3)])
		self._mixer.master_strip().set_volume_control(self._dial[1])
		self._mixer.set_prehear_volume_control(self._dial[0])
		self._session.set_track_bank_buttons(self._nav[4], self._nav[3])
		self._session.set_scene_bank_buttons(self._nav[2], self._nav[0])
		self._session_zoom.set_zoom_button(self._grid[7][3])
		self._session_zoom.set_nav_buttons(self._nav[0], self._nav[2], self._nav[3], self._nav[4])
		self._session_zoom.set_button_matrix(self._matrix)
		self._device[0].set_on_off_button(self._encoder_button[1])
		self._device_navigator[0].set_device_nav_buttons(self._encoder_button[2], self._encoder_button[3]) 
		self._device[1].set_on_off_button(self._encoder_button[4])
		self._device_navigator[1].set_device_nav_buttons(self._encoder_button[5], self._encoder_button[6]) 
		for track in range(2):
			self._update_device(self._mixer.channel_strip(track))
		#self._device.set_bank_nav_buttons(self._menu[0], self._menu[3])
		self.assign_track_selector(self._encoder[0])
		#for index in range(8):
		#	self._pad[index].send_value(1, True)
		#	self._pad[index].set_channel(1)
		#	self._pad[index].set_identifier(index)
		#	self._pad[index].set_enabled(False)	 #this has to happen for translate to work
		if not self._grid[7][3].value_has_listener(self._shift_value):
			self._grid[7][3].add_value_listener(self._shift_value)	
	

	"""Tweaker custom methods"""
	def _shift_value(self, value):
		#self.log_message('shift ' + str(value))
		self._pad_offset.set_enabled(value>0)
		if value > 0:
			for pad in self._pad:
				pad.use_default_message()
				pad.set_enabled(True)
			self._pad_offset.set_mode_buttons(tuple(self._pad))
			if self._session.is_enabled():
				#self._update_navigation_view()
				#self.schedule_message(1, self._update_navigation_veiw)
				self._update_navigation_view()
			self._grid[7][3].send_value(SHIFT_ON)
		else:
			self._pad_offset.set_mode_buttons(None)
			for index in range(4):
				self._pad[index].set_enabled(False)
				self._pad[index].set_channel(PAD_CHANNEL)
				self._pad[index].set_identifier(index + 4 + (self._pad_offset._mode_index * 8))
				self._pad[index+4].set_enabled(False)
				self._pad[index+4].set_channel(PAD_CHANNEL)
				self._pad[index+4].set_identifier(index + (self._pad_offset._mode_index * 8))
			self._grid[7][3].send_value(SHIFT_OFF)
	

	def assign_track_selector(self, encoder):
		assert isinstance(encoder, EncoderElement)
		if not encoder.value_has_listener(self._track_selector_value):
			encoder.add_value_listener(self._track_selector_value)
	

	def deassign_track_selector(self, encoder):
		if encoder.value_has_listener(self._track_selector_value):
			encoder.remove_value_listener(self._track_selector_value)
	

	def _nav_lock_value(self, value):
		if value > 0:
			if self._nav_lock:
				self._mixer_offset = self._mixer_offset + self._session._track_offset
				self._mixer.set_track_offset(self._mixer_offset)
			else:
				if self._mixer_offset in range(self._session._track_offset, self._session._track_offset + 5):
					self._mixer_offset = self._mixer_offset - self._session._track_offset
				elif self._mixer_offset < self._session._track_offset:
					self._mixer_offset = 0
				else:
					self._mixer_offset = min(self._session._track_offset+5, len(self._session.tracks_to_use())-2)
				self._mixer.set_track_offset(self._session._track_offset + self._mixer_offset)
			self._nav_lock = not self._nav_lock
			self._session.update()
			#self.log_message('nav_lock_value ' + str(self._nav_lock))
	

	def _arrange_session_value(self, value):
		if value > 0:
			if (self.application().view.is_view_visible('Arranger')):
				self.application().view.show_view('Session') 
			else:
				self.application().view.show_view('Arranger')	  
	

	def _track_selector_value(self, value):
		if(value is 1):
			if self._nav_lock:
				self._mixer_offset = min(self._mixer_offset + 1, min(NUM_TRACKS - 2, len(self._session.tracks_to_use())-self._session._track_offset-2))
			else:
				self._mixer_offset = min(self._mixer_offset + 1, len(self._session.tracks_to_use())-2)
		elif(value is 127):
				self._mixer_offset = max(self._mixer_offset - 1, 0)
		if self._nav_lock:
			self._mixer.set_track_offset(self._session._track_offset + self._mixer_offset)
			#self._session.set_offsets(self._session._track_offset)  ??
		else:
			self._mixer.set_track_offset(self._mixer_offset)
		self._session.update()
		if self._linked_session != None:
			if self._linked_session._is_linked():
				self._linked_session._unlink()
			self._linked_session.set_offsets(self._mixer._track_offset, self._linked_session._scene_offset)
			self._linked_session._link()
	

	def _update_navigation_view(self):
		dif = self._mixer._track_offset - self._session._track_offset
		for index in range(7):
			#if (index + self._session._track_offset) in range(len(self._session.tracks_to_use())):
			if (index + self._session._track_offset) in range(len(self.song().visible_tracks)):
				self._grid[index][3].send_value(NAV_COLORS[int(index in range(dif, dif + 2))], True)
			elif (index + self._session._track_offset) in range(len(self._session.tracks_to_use())):
				self._grid[index][3].send_value(RETURN_NAV_COLORS[int(index in range(dif, dif + 2))], True)
			else:
				self._grid[index][3].send_value(0, True)
		self._send_midi(tuple([240,0,1,106,01,07,21,21,247])) #set all pots to walk mode
		
	

	def _update_device(self, channelstrip):
		#self.log_message('update device ' + str(channelstrip))
		for control in channelstrip._device_component._parameter_controls:
			control.send_value(0, True)
		if channelstrip._device_component._on_off_button != None:
			channelstrip._device_component._on_off_button.turn_off()
		if not channelstrip._track is None:
			if not channelstrip._device_component._device in channelstrip._track.devices:
				#self.log_message('update device 1' + str(channelstrip))
				track = channelstrip._track
				device_to_select = track.view.selected_device
				if (device_to_select == None) and (len(track.devices) > 0):
					device_to_select = track.devices[0]
					#self.log_message('no selected device' + str(device_to_select))
				elif channelstrip._device_component and not type(channelstrip._device_component) is type(None):
					channelstrip._device_component.set_device(device_to_select)
					#self.log_message('previous device' + str(device_to_select))
				else:
					channelstrip._device_component.set_device(None)	
					#self.log_message('device_none')
			else:
				#self.log_message('pass')
				pass
		else:
			channelstrip._device_component.set_device(None)	
			#self.log_message('failed all' + str(channelstrip))
		channelstrip._device_component._on_on_off_changed()	
	

	def _light_pad(self, value, sender):
		#with self.component_guard():
		self.log_message(str(sender.name) + ' ' + str(value))
		if not self._pad_offset.is_enabled():
			if value > sender._last_sent:
				self.log_message('more than zero')
				if self._pad[self._pad_pressure.index(sender)]._last_sent_value < 1:
					self._pad[self._pad_pressure.index(sender)].send_value(127, True)
			else:
				self.log_message('zero')
				#self.schedule_message(1, self._pad[self._pad_pressure.index(sender)].send_value, (self._pad[self._pad_pressure.index(sender)], 0))
				self._pad[self._pad_pressure.index(sender)].send_value(0, True)
		sender._last_sent = value
	

	"""called on timer"""
	def update_display(self):
		ControlSurface.update_display(self)
		self._timer = (self._timer + 1) % 256
		self.flash()
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, FlashingButtonElement):
					control.flash(self._timer)
	

	"""m4l bridge"""
	def generate_strip_string(self, display_string):
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
		return ret
	

	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, MonoEncoderElement2)):
			self._monobridge._send(sender.name, 'lcd_name', str(self.generate_strip_string(name)))
			self._monobridge._send(sender.name, 'lcd_value', str(self.generate_strip_string(value)))
	

	def touched(self):
		if(self._shift_mode._mode_index < 2):
			if self._touched is 0:
				self._monobridge._send('touch', 'on')
				self.schedule_message(2, self.check_touch)
			self._touched +=1
	

	def check_touch(self):
		if(self._shift_mode._mode_index < 2):
			if self._touched > 5:
				self._touched = 5
			elif self._touched > 0:
				self._touched -= 1
			if self._touched is 0:
				self._monobridge._send('touch', 'off')
			else:
				self.schedule_message(2, self.check_touch)
	

	def	handle_sysex(self, midi_bytes):
		pass
	

	"""general functionality"""
	def disconnect(self):
		"""clean things up on disconnect"""
		#self._update_linked_device_selection = None
		if self._session.offset_has_listener(self._update_navigation_view):
			self._session.remove_offset_listener(self._update_navigation_view)
		if(self._nav[1].value_has_listener(self._arrange_session_value)):
			self._nav[1].remove_value_listener(self._arrange_session_value)
		if(self._encoder_button[0].value_has_listener(self._nav_lock_value)):
			self._encoder_button[0].remove_value_listener(self._nav_lock_value)
		for pad in self._pad_pressure:
			if pad.value_has_listener(self._light_pad):
				pad.remove_value_listener(self._light_pad)
		if self._grid[7][3].value_has_listener(self._shift_value):
			self._grid[7][3].remove_value_listener(self._shift_value)
		if self._session._is_linked():
			self._session._unlink()
		self.deassign_track_selector(self._encoder[0])
		self.log_message("--------------= Tweaker Session " + str(self._tweaker_version_check) + " log closed =--------------") #Create entry in log file
		ControlSurface.disconnect(self)
		return None
	

	def _get_num_tracks(self):
		return self.num_tracks
	

 	def _on_selected_track_changed(self):
		ControlSurface._on_selected_track_changed(self)
		if self._session.is_enabled():
			self._session.update()
		for index in range(2):
			self._update_device(self._mixer.channel_strip(index))
			self._mixer.on_selected_track_changed()
	

	def connect_script_instances(self, instanciated_scripts):
		link = False
		for s in instanciated_scripts:
			if '_tweaker_version' in dir(s):
				if s._tweaker_version == self._tweaker_version_check:
					link = True
					break
		if link == True:
			if not self._session._is_linked():
				self._session._link()
	

	"""SessionComponent overrides"""
	def _session_update(self, session):
		def _update():
			SessionComponent.update(session)
			if session.is_enabled():
				self._update_navigation_view()
		return _update
		
	


	def _session_change_offsets(self, session): 
		def _change_offsets(track_increment, scene_increment):
			offsets_changed = (track_increment != 0) or (scene_increment != 0)
			if offsets_changed:
				session._track_offset += track_increment
				session._scene_offset += scene_increment
				assert (session._track_offset >= 0)
				assert (session._scene_offset >= 0)
				if (session._mixer != None):
					if(self._nav_lock):
						if (session.track_offset() + self._mixer_offset) > (len(session.tracks_to_use())-2):
							self._mixer_offset = max(len(session.tracks_to_use()) - session._track_offset - 2, 0)
						session._mixer.set_track_offset(max(0, session.track_offset() + self._mixer_offset))
			session._reassign_tracks()
			if offsets_changed:
				session._reassign_scenes()
				# this is replaced by notify_offset() in Live9 #for callback in session._offset_callbacks:
				# this is replaced by notify_offset() in Live9 #	callback()
				session.notify_offset()
				if ((session.width() > 0) and (session.height() > 0)):
					session._do_show_highlight()
		return _change_offsets
		
	

	def _session_on_fired_slot_index_changed(self, session):
		def _on_fired_slot_index_changed(index):
			"""if (session.is_enabled() and (session._stop_track_clip_buttons != None)):
				if ((index in range(len(session._tracks_and_listeners))) and (session._tracks_and_listeners[index][0] in session.song().tracks) and (session._tracks_and_listeners[index][0].fired_slot_index == -2)):
					session._stop_track_clip_buttons[index].send_value(session._stop_track_clip_value)
				elif index in range(len(session.tracks_to_use())):
					dif = self._mixer._track_offset - self._session._track_offset
					session._stop_track_clip_buttons[index].send_value(NAV_COLORS[int(index in range(dif, dif + 2))], True)
				else:
					session._stop_track_clip_buttons[index].turn_off()"""
			pass
		return _on_fired_slot_index_changed
	

	def _session_stop_track_value(self, session):
		def _stop_track_value(value, sender):
			assert (session._stop_track_clip_buttons != None)
			assert (list(session._stop_track_clip_buttons).count(sender) == 1)
			assert (value in range(128))
			if session.is_enabled():
				if ((value is not 0) or (not sender.is_momentary())):
					tracks = session.tracks_to_use()
					track_index = (list(session._stop_track_clip_buttons).index(sender) + session.track_offset())
					if (track_index in range(len(tracks))) and (tracks[track_index] in session.song().tracks):
						tracks[track_index].stop_all_clips()
					sender.send_value(3, True)
					self.schedule_message(10, self._update_navigation_view)
		
		return _stop_track_value
	

	"""ChannelStripComponent overrides"""
	def _channelstrip_update(self, channelstrip):
		def _update():
			ChannelStripComponent.update(channelstrip)
			self._update_device(channelstrip)
		return _update
	

	def _channelstrip_set_track(self, channelstrip, cb):
		def _set_track(track):
			assert ((track == None) or isinstance(track, Live.Track.Track))
			if channelstrip._track != None and isinstance(channelstrip._track, Live.Track.Track):
				if channelstrip._track.devices_has_listener(cb):
					channelstrip._track.remove_devices_listener(cb)
			if (track != None):
				track.add_devices_listener(cb)
			ChannelStripComponent.set_track(channelstrip, track)
		return _set_track
	

	def _channelstrip_on_cf_assign_changed(self, channel_strip):
		def _on_cf_assign_changed():
			if (channel_strip.is_enabled() and (channel_strip._crossfade_toggle != None)):
				if (channel_strip._track != None) and (channel_strip._track in chain(self.song().tracks, self.song().return_tracks)):
					if channel_strip._track.mixer_device.crossfade_assign == 1: #modified
						channel_strip._crossfade_toggle.turn_off()
					elif channel_strip._track.mixer_device.crossfade_assign == 0:
						channel_strip._crossfade_toggle.send_value(CROSSFADE_A)
					else:
						channel_strip._crossfade_toggle.send_value(CROSSFADE_B)
		return _on_cf_assign_changed
		
	

	def _channelstrip1_cb(self):
		self._on_selected_track_changed()
	

	def _channelstrip2_cb(self):
		self._on_selected_track_changed()
	

	"""MixerComponent overrides"""
	def _mixer_tracks_to_use(self, mixer):
		def tracks_to_use():
			return tuple(self.song().visible_tracks) + tuple(self.song().return_tracks)
		return tracks_to_use
		
	

	"""SessionComponent overrides"""
	def _device_number_of_parameter_banks(self, device):
		def _number_of_parameter_banks():
			return number_of_parameter_banks(device._device) #added
		return _number_of_parameter_banks
			
	

	def _device_assign_parameters(self, device):
		def _assign_parameters():
			assert device.is_enabled()
			assert (device._device != None)
			assert (device._parameter_controls != None)
			device._bank_name = ('Bank ' + str(device._bank_index + 1)) #added
			if (device._device.class_name in device._device_banks.keys()): #modified
				assert (device._device.class_name in device._device_best_banks.keys())
				banks = device._device_banks[device._device.class_name]
				bank = None
				if (not device._is_banking_enabled()):
					 banks = device._device_best_banks[device._device.class_name]
					 device._bank_name = 'Best of Parameters' #added
				if (len(banks) > device._bank_index):
					bank = banks[device._bank_index]
					if device._is_banking_enabled(): #added
						if device._device.class_name in device._device_bank_names.keys(): #added
							device._bank_name[device._bank_index] = device._device_bank_names[device._device.class_name] #added *recheck
				assert ((bank == None) or (len(bank) >= len(device._parameter_controls)))
				for index in range(len(device._parameter_controls)):
					parameter = None
					if (bank != None):
						parameter = get_parameter_by_name(device._device, bank[index])
					if (parameter != None):
						device._parameter_controls[index].connect_to(parameter)
					else:
						device._parameter_controls[index].release_parameter()
			else:
				parameters = device._device_parameters_to_map()
				num_controls = len(device._parameter_controls)
				index = (device._bank_index * num_controls)
				for control in device._parameter_controls:
					if (index < len(parameters)):
						control.connect_to(parameters[index])
					else:
						control.release_parameter()
					index += 1
		return _assign_parameters
		
	


