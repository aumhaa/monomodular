# http://www.aumhaa.com
# by amounra 0413

from __future__ import with_statement
import Live
import time
import math

""" _Framework files """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent # Class representing a device in Live
from _Framework.DisplayDataSource import DisplayDataSource # Data object that is fed with a specific string and notifies its observers
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
from _Framework.PhysicalDisplayElement import PhysicalDisplayElement # Class representing a display on the controller
from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.SessionZoomingComponent import SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
from _Framework.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
from _Framework.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section
from _Framework.ModesComponent import AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.Layer import Layer
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *
from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext

from _Generic.Devices import *

"""Imports from _Mono_Framework"""
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.DeviceSelectorComponent import NewDeviceSelectorComponent as DeviceSelectorComponent
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.Mod import *
from _Mono_Framework.LiveUtils import *

"""Custom files, overrides, and files from other scripts"""
#from SpecialMonomodComponent import SpecialMonomodComponent
from MonOhm.MonOhm import MonOhm, OhmModHandler
from MonOhm.Map import *
from Map import *






class OSCMonoButtonElement(MonoButtonElement):


	def __init__(self, is_momentary, msg_type, channel, identifier, name, script, osc = None, osc_alt = None, osc_name = None, *a, **k):
		super(OSCMonoButtonElement, self).__init__(is_momentary, msg_type, channel, identifier, name, script, *a, **k)
		self.osc = osc
		self.osc_alt = osc_alt
		self.osc_name = osc_name
		self._value = 0
		self._last_sent = -1
		self._color_map = [7, 1, 3, 2, 6, 5, 4]
		self._script._monobridge._send_osc(self.osc, 0, True)
	

	def send_midi(self, message):
		assert (message != None)
		assert isinstance(message, tuple)
		if message[2] != self._last_sent:
			if message[2] == 127:
				color = 7
			else:
				color = int(message[2])
			self._script._monobridge._send_osc(str(self.osc_alt), color)
		self._last_sent = message[2]
	

	def set_value(self, value):
		if(self._parameter_to_map_to != None):
			newval = float(value * (self._parameter_to_map_to.max - self._parameter_to_map_to.min)) + self._parameter_to_map_to.min
			self._parameter_to_map_to.value = newval
			return [value, str(self.mapped_parameter())]
		else:
			#self._script.log_message('self:' + str(self) + 'value:' + str(value))
			self.receive_value(int(value!=0)*127) ##was self.receive_value(int(value*127))
	


class OSCMonoEncoderElement(MonoEncoderElement):


	def __init__(self, msg_type, channel, identifier, map_mode, name, num, script, osc = None, osc_parameter = None, osc_name = None, *a, **k):
		super(OSCMonoEncoderElement, self).__init__(msg_type, channel, identifier, map_mode, name, num, script, *a, **k)
		self.osc = osc
		self.osc_parameter = osc_parameter
		self.osc_name = osc_name
		self._mapping_feedback_delay = 0
		self._timer = 0
		self._threshold = 0
		self._script._monobridge._send_osc(self.osc, 0, True)
	

	def set_value(self, value):
		MonoEncoderElement.set_value(self, value)
		self._timer = self._script._timer
	

	def forward_parameter_value(self):
		if(not (type(self._parameter) is type(None))):
			try:
				parameter = str(self.mapped_parameter())
			except:
				parameter = ' '
			if(parameter!=self._parameter_last_value):
				try:
					self._parameter_last_value = str(self.mapped_parameter())
				except:
					self._parameter_last_value = ' '
				self._script._monobridge._send_osc(self.osc_parameter, self._script.generate_strip_string(self._parameter_last_value), True, True)
				if (self._timer  + self._threshold) < self._script._timer:
					new_value=float((self._parameter.value - self._parameter.min) / (self._parameter.max - self._parameter.min))
					self._script._monobridge._send_osc(self.osc, new_value)
					self._script.log_message(str(self._timer) + ' ' + str(self._script._timer) + ' ' + str(new_value))
	

	def forward_parameter_name(self):
		if(not (type(self._parameter) is type(None))):
			parameter = self._parameter
			if parameter:
				if isinstance(parameter, Live.DeviceParameter.DeviceParameter):
					if str(parameter.original_name) == 'Track Volume' or self._mapped_to_midi_velocity is True:
						self._parameter_lcd_name = str(parameter.canonical_parent.canonical_parent.name)
					elif str(parameter.original_name) == 'Track Panning':
						self._parameter_lcd_name = 'Pan'
					else:
						self._parameter_lcd_name = str(parameter.name)
				self._script._monobridge._send_osc(self.osc_name, self._script.generate_strip_string(self._parameter_lcd_name), False, True)	
	

	def add_parameter_listener(self, parameter):
		self._parameter = parameter
		if parameter:
			if isinstance(parameter, Live.DeviceParameter.DeviceParameter):
				if str(parameter.original_name) == 'Track Volume' or self._mapped_to_midi_velocity is True:
					self._parameter_lcd_name = str(parameter.canonical_parent.canonical_parent.name)
					cbb = lambda: self.forward_parameter_name()
					parameter.canonical_parent.canonical_parent.add_name_listener(cbb)
				elif str(parameter.original_name) == 'Track Panning':
					self._parameter_lcd_name = 'Pan'
				else:
					self._parameter_lcd_name = str(parameter.name)
			#self._last_value(int(((self._parameter.value - self._parameter.min) / (self._parameter.max - self._parameter.min))  * 127))
			try:
				self._parameter_last_value = str(self.mapped_parameter())
			except:
				self._parameter_last_value = ' '
			self._script._monobridge._send_osc(self.osc_name, self._script.generate_strip_string(self._parameter_lcd_name), False, True)
			self._script._monobridge._send_osc(self.osc_parameter, self._script.generate_strip_string(self._parameter_last_value), False, True)
			new_value=float((self._parameter.value - self._parameter.min) / (self._parameter.max - self._parameter.min))
			self._script._monobridge._send_osc(self.osc, new_value)
			cb = lambda: self.forward_parameter_value()
			parameter.add_value_listener(cb)
	

	def remove_parameter_listener(self, parameter):
		self._parameter = None
		#self._script.log_message('remove_parameter_listener ' + str(parameter.name + str(self.name)))
		if parameter:
			cb = lambda: self.forward_parameter_value()
			cbb = lambda: self.forward_parameter_name()
			if(parameter.value_has_listener is True):
				parameter.remove_value_listener(cb)
			if isinstance(parameter, Live.DeviceParameter.DeviceParameter):
				if str(parameter.original_name) == 'Track Volume' or self._mapped_to_midi_velocity is True:
					if(parameter.canonical_parent.canonical_parent.name_has_listener is True):
						parameter.canonical_parent.canonical_parent.remove_name_listener(cbb)
			self._parameter_lcd_name = ' '
			self._parameter_last_value = ' '
			#self._script.notification_to_bridge(' ', ' ', self)
			self._script._monobridge._send_osc(self.osc, 0)
			self._script._monobridge._send_osc(self.osc_name, '`_', False, True)
			self._script._monobridge._send_osc(self.osc_parameter, '`_', False, True)
	


class NameServerClipSlotComponent(ClipSlotComponent):


	def __init__(self, script, *a, **k):
		self._script = script
		super(NameServerClipSlotComponent, self).__init__(*a, **k)
		self._on_name_changed_slot = self.register_slot(None, self._name_listener, 'name')
	

	def set_clip_slot(self, clip_slot):
 		assert (clip_slot == None or isinstance(clip_slot, Live.ClipSlot.ClipSlot))
		if clip_slot != None:
			clip = clip_slot.clip 
		else:
			clip = None
		self._on_name_changed_slot.subject = clip
		super(NameServerClipSlotComponent, self).set_clip_slot(clip_slot)
	

	def _name_listener(self):
		#self._script.log_message('_name_listener')
		self.update()
	

	def update(self):
		super(NameServerClipSlotComponent, self).update()
		new_name = ' '
		if self._allow_updates:
			 if self.is_enabled() and not self._launch_button_value.subject == None:
				if (self._clip_slot != None):
					if self.has_clip():
						new_name = self._clip_slot.clip.name
				self._script.clip_name(self._launch_button_value.subject, new_name)
	


class NameServerSceneComponent(SceneComponent):
	__doc__ = '	 Override for SceneComponent that provides Clip NameServer support '


	def __init__(self, script, num_slots, tracks_to_use_callback, *a, **k):
		self._script = script
		super(NameServerSceneComponent, self).__init__(num_slots, tracks_to_use_callback, *a, **k)
	

	def _create_clip_slot(self):
		return NameServerClipSlotComponent(self._script)
	


class NameServerSessionComponent(SessionComponent):
	__doc__ = " Override for SessionComponent that provides Clip NameServer support "


	def __init__(self, num_tracks, num_scenes, script, *a, **k):
		self._script = script
		super(NameServerSessionComponent, self).__init__(num_tracks, num_scenes, *a, **k)
	

	def _create_scene(self): 
		return NameServerSceneComponent(self._script, num_slots=self._num_tracks, tracks_to_use_callback=self.tracks_to_use)
	


class OSCMonoBridgeElement(MonoBridgeElement):


	def __init__(self, *a, **k):
		super(OSCMonoBridgeElement, self).__init__(*a, **k)
		self.bridge = 'None'
		self._page_str = '/2'
		self._elapsed_events = 0
		self._threshold = 50
		self._buffer = []
		self._device = None
		self._device_parent = None
		self._connected = False
		self._script._register_timer_callback(self._send_buffer)
	

	def _is_connected(self):
		return self._connected
	

	def connect_to(self, device):
		#self._host.log_message('client ' + str(self._number) + ' connect_to'  + str(device.name))
		self._connected = True
		self._script.connected = 1
		self.device = device
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._device_parent = device.canonical_parent
		if not self._device_parent.devices_has_listener(self._device_listener):
			self._device_parent.add_devices_listener(self._device_listener)
		#self._host._refresh_stored_data()
	

	def _disconnect_client(self):
		##self._host.log_message('disconnect' + str(self._number))
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._connected = False
		self._script.connected = 0
	

	def _device_listener(self):
		#self._host.log_message('device_listener' + str(self.device))
		if self.device == None:
			self._disconnect_client()
	

	def reset(self):
		pass
	

	def osc_in(self, messagename, arguments = None):
		#self._script.log_message('osc_in ' + str(messagename) +  '-' + str(arguments))
		if self._script._osc_registry.has_key(messagename):
			self._script._osc_registry[messagename](arguments)
		else:
			self._script.log_message(str(messagename) + ' : ' + str(arguments))
	

	def osc_extra(self, messagename):
		#self._script.log_message(str(self) + 'osc_extra ' + str(messagename))
		pass
	

	def _send_osc(self, osc, value, force = False, name = False):
		#self._script.log_message(str(osc) + str(value))
		if osc != None: 			# and ((osc.find(self._page_str) == 0) or force is True): 
			#self._script.log_message('string ' + str(osc.split('/')) + ' ' + str(osc.find('/1')))
			self._elapsed_events += 1
			if self._elapsed_events < self._threshold:
				if(name == True):
					self._send('name', osc, value)
				else:
					self._send('osc', osc, value)
			else:
				self._buffer.append([osc, value, name])
	

	def _send_buffer(self):
		#if(len(self._buffer)>0):
		#	self._script.log_message('buffer:' + str(len(self._buffer)))
		for index in range(min(len(self._buffer), self._threshold)):
			if(self._buffer[0][2] == True):
				self._send('name', self._buffer[0][0], self._buffer[0][1])
			else:
				self._send('osc', self._buffer[0][0], self._buffer[0][1])
			self._buffer.pop(0)
		self._elapsed_events = 0
	

	def ping(self, message):  #, sender, message):
		#self._script.log_message('ping')
		if self._connected is False:
			self._send('page', self._page_str)
			self._connected = True
			self._script.refresh_state()
	

	def page1(self, message):  #, sender, message):
		#self._script.log_message('page 1')
		self._page_str = '/1'	
		#self._script.refresh_state()
		#self._script._host2.update()
		#self._script._host.set_enabled(False)
		#self._script._host2.set_enabled(True)				
	

	def page2(self, message):  #, sender, message):
		#self._script.log_message('page 2')
		self._page_str = '/2'
		#self._script.refresh_state()
		#self._script._host2.set_enabled(False)	
		#self._script._host.set_enabled(True)
	

	def reset_grid(self):
		self._script._key_buttons.reset()
		self._script._bank_buttons.reset()
	

	def set_brightness(self, value):
		self._script._set_brightness(value)
	

	def set_threshold(self, value):
		self._threshold = int(value)
	


class LemurPad(MonOhm):
	__module__ = __name__
	__doc__ = " Lemur version of the MonOhm companion controller script "


	def __init__(self, *a, **k):
		self._timer_callbacks = []		#Used for _monobridge, which uses L8 method for registering timer callbacks.  deprecated, needs to be replaced by new L9 Task class.
		self._osc_registry = {}
		self._display_button_names = DISPLAY_BUTTON_NAMES
		super(LemurPad, self).__init__(*a, **k)
		self._host_name = "LemurPad"
		self._color_type = 'AumPad'
		self.connected = 0
		with self.component_guard():
			self._setup_touchosc()
			self._assign_host2()
			self._assign_session_colors()
	

	def query_ohm(self):
		pass
	


	"""script initialization methods"""
	def _setup_monobridge(self):
		self._monobridge = OSCMonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True
		self._fader = [None for index in range(8)]
		self._dial = [None for index in range(16)]
		self._button = [None for index in range(8)]
		self._menu = [None for index in range(6)]
		for index in range(8):
			self._fader[index] = OSCMonoEncoderElement(MIDI_CC_TYPE, CHANNEL, OHM_FADERS[index], Live.MidiMap.MapMode.absolute, 'Fader_' + str(index), index, self, osc = '/Fader_'+str(index)+'/x', osc_parameter = '/Strip'+str(index+8)+'/set', osc_name = '/Strip'+str(index)+'/set')
		for index in range(8):
			self._button[index] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, OHM_BUTTONS[index], 'Button_'+str(index), self, osc = '/Select_'+str(index)+'/value', osc_alt = '/Select/set '+str(index),  osc_name = '/Select/text '+str(index))
		for index in range(16):
			self._dial[index] = OSCMonoEncoderElement(MIDI_CC_TYPE, CHANNEL, OHM_DIALS[index], Live.MidiMap.MapMode.absolute, 'Dial_' + str(index), index + 8, self, osc = '/Dial_'+str(index)+'/x', osc_parameter = '/Dial'+str(index)+'val/set', osc_name = '/Dial'+str(index)+'name/set')
		for index in range(6):
			self._menu[index] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, OHM_MENU[index], 'Menu_' + str(index), self, osc = '/Function_'+str(index)+'/value', osc_alt = '/Function/set '+str(index), osc_name = '/Function/text '+str(index))	
		self._crossfader = OSCMonoEncoderElement(MIDI_CC_TYPE, CHANNEL, CROSSFADER, Live.MidiMap.MapMode.absolute, "Crossfader", 24, self, osc = '/XFader/x', osc_parameter = '/XFader/none', osc_name = None)
		self._livid = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, LIVID, 'Livid_Button', self, osc = '/Livid/x', osc_alt = '/Livid/x', osc_name = None)
		self._shift_l = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_L, 'Shift_Button_Left', self, osc = '/ShiftL/x', osc_alt = '/ShiftL/x', osc_name = None)
		self._shift_r = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, SHIFT_R, 'Shift_Button_Right', self, osc = '/ShiftR/x', osc_alt = '/ShiftR/x', osc_name = None)
		self._matrix = ButtonMatrixElement()
		self._matrix.name = 'Matrix'
		self._monomod = ButtonMatrixElement()
		self._monomod.name = 'Monomod'
		self._grid = [None for index in range(8)]
		for column in range(8):
			self._grid[column] = [None for index in range(8)]
			for row in range(8):
				self._grid[column][row] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, (column * 8) + row, 'Grid_' + str(column) + '_' + str(row), self, osc = '/ClipGrid_'+str(column)+'_'+str(row)+'/value', osc_alt = '/ClipGrid/set '+str(column)+' '+str(row), osc_name = '/ClipGrid/text '+str(column)+' '+str(row))
		for row in range(5):
			button_row = []
			for column in range(7):
				button_row.append(self._grid[column][row])
			self._matrix.add_row(tuple(button_row)) 
		for row in range(8):
			button_row = []
			for column in range(8):
				button_row.append(self._grid[column][row])
			self._monomod.add_row(tuple(button_row))
		self._dummy_button = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 125)
		self._dummy_button.name = 'Dummy1'
		self._dummy_button2 = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 126)
		self._dummy_button2.name = 'Dummy2'
		self._dummy_button3 = ButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, 127)
		self._dummy_button2.name = 'Dummy3'
		self._monomod256 = ButtonMatrixElement()
		self._monomod256.name = 'Monomod256'
		self._square = [None for index in range(16)]
		for column in range(16):
			self._square[column] = [None for index in range(16)]
			for row in range(16):
				self._square[column][row] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, int(column/8) + 1, row + ((column%8) * 16), '256Grid_' + str(column) + '_' + str(row), self, osc = '/Grid_'+str(column)+'_'+str(row)+'/value', osc_alt = '/Grid/set '+str(column)+' '+str(row), osc_name = None)
				#self._square[column][row] = FlashingButtonElement(is_momentary, 0, 15, -1, '256Grid_' + str(column) + '_' + str(row), '/1/p_grid/'+str(column)+'/'+str(row), '/1/c_grid/'+str(column)+'/'+str(row), self)
		for row in range(16):
			button_row = []
			for column in range(16):
				button_row.append(self._square[column][row])
			self._monomod256.add_row(tuple(button_row))
		self._bank_buttons = ButtonMatrixElement()
		self._key_buttons = ButtonMatrixElement()
		self._bank_button = [None for index in range(2)]
		for index in range(2):
			self._bank_button[index] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, index, '256Grid_Bank_' + str(index), self,  osc = '/Shift_'+str(index)+'/value', osc_alt = '/Shift/set '+str(index), osc_name = None)
		button_row = []
		for index in range(2):
			button_row.append(self._bank_button[index])
		self._bank_buttons.add_row(tuple(button_row))
		button_row = []
		self._key_button = [None for index in range(8)]
		for index in range(8):
			self._key_button[index] = OSCMonoButtonElement(is_momentary, MIDI_NOTE_TYPE, 15, index+8, '256Grid_Key_' + str(index), self, osc = '/Keys_'+str(index)+'/value', osc_alt = '/Keys/set '+str(index), osc_name = None)
		for index in range(8):
			button_row.append(self._key_button[index])
		self._key_buttons.add_row(tuple(button_row))
	

	def _setup_session_control(self):
		is_momentary = True
		num_tracks = 4
		num_scenes = 5 
		self._session = NameServerSessionComponent(num_tracks, num_scenes, self)
		self._session.name = "Left_Session"
		self._session.set_offsets(0, 0)	 
		self._session.set_stop_clip_value(self._color_defs['STOP_CLIP'])
		self._scene = [None for index in range(5)]
		for row in range(num_scenes):
			self._scene[row] = self._session.scene(row)
			self._scene[row].name = 'L_Scene_' + str(row)
			for column in range(num_tracks):
				clip_slot = self._scene[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_L_' + str(row)
				clip_slot.set_triggered_to_play_value(self._color_defs['CLIP_TRG_PLAY'])
				clip_slot.set_triggered_to_record_value(self._color_defs['CLIP_TRG_REC'])
				clip_slot.set_stopped_value(self._color_defs['CLIP_STOP'])
				clip_slot.set_started_value(self._color_defs['CLIP_STARTED'])
				clip_slot.set_recording_value(self._color_defs['CLIP_RECORDING'])
		self._session.set_mixer(self._mixer)
		self._session_zoom = SessionZoomingComponent(self._session)	 
		self._session_zoom.name = 'L_Session_Overview'
		self._session_zoom.set_stopped_value(self._color_defs['ZOOM_STOPPED'])
		self._session_zoom.set_playing_value(self._color_defs['ZOOM_PLAYING'])
		self._session_zoom.set_selected_value(self._color_defs['ZOOM_SELECTED'])
		self._session_zoom._zoom_button = (self._dummy_button)
		self._session_zoom.set_enabled(True) 
		self._session2 = SessionComponent(num_tracks, num_scenes)
		self._session2.name = 'Right_Session'
		self._session2.set_offsets(4, 0)
		self._session2.set_stop_clip_value(self._color_defs['STOP_CLIP'])
		self._scene2 = [None for index in range(5)]
		for row in range(num_scenes):
			self._scene2[row] = self._session2.scene(row)
			self._scene2[row].name = 'R_Scene_' + str(row)
			for column in range(num_tracks):
				clip_slot = self._scene2[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_R_' + str(row)
				clip_slot.set_triggered_to_play_value(self._color_defs['CLIP_TRG_PLAY'])
				clip_slot.set_triggered_to_record_value(self._color_defs['CLIP_TRG_REC'])
				clip_slot.set_stopped_value(self._color_defs['CLIP_STOP'])
				clip_slot.set_started_value(self._color_defs['CLIP_STARTED'])
				clip_slot.set_recording_value(self._color_defs['CLIP_RECORDING'])
		self._session2.set_mixer(self._mixer2)
		self._session2.add_offset_listener(self._on_session_offset_changes)
		self._session_zoom2 = SessionZoomingComponent(self._session2)	   
		self._session_zoom2.name = 'R_Session_Overview'
		self._session_zoom2.set_stopped_value(self._color_defs['ZOOM_STOPPED'])
		self._session_zoom2.set_playing_value(self._color_defs['ZOOM_PLAYING'])
		self._session_zoom2.set_selected_value(self._color_defs['ZOOM_SELECTED'])
		self._session_zoom.set_enabled(True) 
		self._session_zoom2._zoom_button = (self._dummy_button2)
		self._session_main = SessionComponent(8, num_scenes)
		self._session_main.name = 'Main_Session'
		self._session_main.set_stop_clip_value(self._color_defs['STOP_CLIP'])
		self._scene_main = [None for index in range(5)]
		for row in range(num_scenes):
			self._scene_main[row] = self._session_main.scene(row)
			self._scene_main[row].name = 'M_Scene_' + str(row)
			for column in range(8):
				clip_slot = self._scene_main[row].clip_slot(column)
				clip_slot.name = str(column) + '_Clip_Slot_M_' + str(row)
				clip_slot.set_triggered_to_play_value(self._color_defs['CLIP_TRG_PLAY'])
				clip_slot.set_triggered_to_record_value(self._color_defs['CLIP_TRG_REC'])
				clip_slot.set_stopped_value(self._color_defs['CLIP_STOP'])
				clip_slot.set_started_value(self._color_defs['CLIP_STARTED'])
				clip_slot.set_recording_value(self._color_defs['CLIP_RECORDING'])
		self._session_main.set_mixer(self._mixer)
		self._session_zoom_main = SessionZoomingComponent(self._session_main)
		self._session_zoom_main.name = 'M_Session_Overview'
		self._session_zoom_main.set_stopped_value(self._color_defs['ZOOM_STOPPED'])
		self._session_zoom_main.set_playing_value(self._color_defs['ZOOM_PLAYING'])
		self._session_zoom_main.set_selected_value(self._color_defs['ZOOM_SELECTED'])
		self._session_zoom_main.set_enabled(True)
		self._session_zoom_main._zoom_button = (self._dummy_button3)
		self._sessions = [self._session, self._session2, self._session_main]
		self._zooms = [self._session_zoom, self._session_zoom2, self._session_zoom_main]
	

	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = LemurOhmModHandler(self)
		self.modhandler.name = 'ModHandler' 
		self.modhandler256 = LemurModHandler(self)
		self.modhandler256.name = 'ModHandler256'
	

	def _assign_host2(self):
		self.modhandler256.set_shift_button(self._bank_button[0])
		self.modhandler256.set_alt_button(self._bank_button[1])
		self.modhandler256.set_grid(self._monomod256)
		self.modhandler256.set_key_buttons(self._key_buttons)
		self.modhandler256.set_enabled(True)
	

	def _setup_touchosc(self):
		self._osc_registry = {}
		#self._osc_registry['/ping'] = self._monobridge.ping
		#self._osc_registry['/1'] = self._monobridge.page1
		#self._osc_registry['/2'] = self._monobridge.page2
		for control in self.controls:
			if hasattr(control, 'osc'):
				self._osc_registry[control.osc] = control.set_value
			#if hasattr(control, 'osc_alt'):
			#	self._osc_registry[control.osc_alt] = control.set_value
				#self.log_message('create dict key: ' + str(control.osc) + str(control.name))
	


	"""shift/zoom methods"""
	def deassign_matrix(self):
		super(LemurPad, self).deassign_matrix()
		self.clear_grid_names()
	

	"""menu button management methods"""
	def deassign_menu(self):
		super(LemurPad, self).deassign_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(' '))
	

	def assign_device_nav_to_menu(self):
		super(LemurPad, self).assign_device_nav_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(DEVICE_NAV_NAMES[index])))
	

	def assign_transport_to_menu(self):
		super(LemurPad, self).assign_transport_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(TRANSPORT_NAMES[index])))
	

	def assign_session_nav_to_menu(self):
		super(LemurPad, self).assign_session_nav_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(SESSION_NAV_NAMES[index])))
	

	def assign_session_main_nav_to_menu(self):
		super(LemurPad, self).assign_session_main_nav_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(SESSION_NAV_NAMES[index])))
	

	def assign_monomod_shift_to_menu(self):
		super(LemurPad, self).assign_monomod_shift_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(MONOMOD_SHIFT_NAMES[index])))
	

	def assign_monomod_to_menu(self):
		super(LemurPad, self).assign_monomod_shift_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(MONOMOD_NAMES[index])))
	

	def assign_session_bank_to_menu(self):
		super(LemurPad, self).assign_session_bank_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(SESSION_BANK_NAMES[index])))
	

	def assign_session2_bank_to_menu(self):
		super(LemurPad, self).assign_session2_bank_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(SESSION_BANK2_NAMES[index])))
	

	def assign_session_main_nav_to_menu(self):
		super(LemurPad, self).assign_session_main_nav_to_menu()
		for index in range(6):
			self._monobridge._send_osc(self._menu[index].osc_name, self.generate_strip_string(str(SESSION_MAIN_BANK_NAMES[index])))
	


	"""m4l bridge"""
	def generate_strip_string(self, display_string):
		NUM_CHARS_PER_DISPLAY_STRIP = 9
		if (not display_string):
			return ('`_')
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
		return '`' + ret.replace(' ', '_')
	

	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, MonoEncoderElement2)):
			#self.log_message(str(name) + str(value) + str(sender.num))
			self._monobridge._send('lcd_name', sender.name, self.generate_strip_string(str(name)))
			self._monobridge._send('lcd_value', sender.name, self.generate_strip_string(str(value)))
	

	def clip_name(self, sender, name):
		#self.log_message('clip name ' + str(sender.osc_name) + ' ' + str(self.generate_strip_string(str(name))))
		self._monobridge._send_osc(sender.osc_name, self.generate_strip_string(str(name)))
	

	"""def get_clip_names(self):
		clip_names = []
		for scene in self._session._scenes:
			for clip_slot in scene._clip_slots:
				if clip_slot.has_clip():
					clip_names.append(clip_slot._clip_slot)##.clip.name)
					#return clip_slot._clip_slot
					#self.log_message('clip name' + str(clip_slot._clip_slot.clip.name))
		return clip_names"""
	


	"""called on timer"""
	def update_display(self):
		super(LemurPad, self).update_display()
		for callback in self._timer_callbacks:
			callback()
	

	def strobe(self):
		pass
	


	"""general functionality"""
	def disconnect(self):
		super(MonOhm, self).disconnect()
	

	def clear_grid_names(self):
		#self.log_message('clear grid names' + str(self))
		for column in range(8):
			for row in range(8):
				self._monobridge._send_osc(self._grid[column][row].osc_name, '`_')	
	

	def _register_timer_callback(self, callback):
		""" Registers a callback that is triggerd on every call of update_display """		 
		assert (callback != None)
		assert (dir(callback).count('im_func') is 1)
		assert (self._timer_callbacks.count(callback) == 0)
		self._timer_callbacks.append(callback)
		return None
	

	def _unregister_timer_callback(self, callback):
		""" Unregisters a timer callback """		
		assert (callback != None)
		assert (dir(callback).count('im_func') is 1)
		assert (self._timer_callbacks.count(callback) == 1)
		self._timer_callbacks.remove(callback)
		return None
	

	def _set_brightness(self, value):
		#self._bright = (value != 0)
		#for control in self.controls:
		#	if isinstance(control, OSCMonoButtonElement):
		#		self._monobridge._send_osc(control.osc_alt, int(self._bright), True)
		pass
	

	def reset(self):
		#self._monobridge._send_osc('/reset')
		for control in self.controls:
			control.reset()
	

	def assign_lower_grid_names(self, mode):
		if self._display_button_names is True:
			for column in range(8):
				for row in range(3):
					self._monobridge._send_osc(self._grid[column][row+5].osc_name, self.generate_strip_string(str(GRID_NAMES[mode][row][column])))
	

	def reset_and_refresh_state(self, *a, **k):
		self.schedule_message(1, self.reset)
		self.schedule_message(2, self.refresh_state)
	


class LemurModHandler(ModHandler):


	def __init__(self, *a, **k):
		super(LemurModHandler, self).__init__(*a, **k)
		self._color_type = 'RGB'
	

	def _receive_grid(self, x, y, value, *a, **k):
		#self.log_message('_receive_grid ' + str(x) + str(y) + str(value)) 
		if self._active_mod:
			if not self._grid_value.subject is None:
				adj_x = x 
				adj_y = y - (int(self.is_shifted()) * 2)
				if (adj_x) in range(16) and (adj_y) in range(16):
					try:
						self._grid_value.subject.send_value(adj_x, adj_y, self._colors[value], True)
					except:
						pass
	

	@subject_slot('value')
	def _grid_value(self, value, x, y, *a, **k):
		#self.log_message('_base_grid_value ' + str(x) + str(y) + str(value))
		if self.active_mod():
			self.log_message('_base_grid_value2 ' + str(x) + str(y) + str(value))
			self._active_mod.send('grid', x, y, value)
	

	def _display_nav_box(self):
		if self._grid_value.subject:
			if self.is_shifted():
				for column in range(2):
					for row in range(2):
						if (column == int(self.x_offset/8)) and (row == int(self.y_offset/8)):
							self._grid_value.subject.get_button(column +6, row+2).send_value(self.navbox_selected)
						else:
							self._grid_value.subject.get_button(column +6, row+2).send_value(self.navbox_unselected)
	

	def update(self, *a, **k):
		mod = self.active_mod()
		with self._script.component_guard():
			if not mod is None:
				if self._grid:
					##self._grid_value.subject = self._grid
					if self.is_shifted():
						self.log_message('update, shifted')
						self.set_channel_buttons(self._grid.submatrix[:, 1:2])
						self._grid_value.subject = self._grid.submatrix[:, 2:]
					else:
						self.log_message('update, not shifted')
						self._grid_value.subject = self._grid
						self.set_channel_buttons(None)
				mod.restore()
			else:
				if not self._grid_value.subject is None:
					self._grid_value.subject.reset()
				if not self._keys_value.subject is None:
					self._keys_value.subject.reset()
			if self.is_shifted():
				self._grid and self._device_selector.set_matrix(self._grid.submatrix[:, :1])
			else:
				self._device_selector.set_matrix(None)
	

class LemurOhmModHandler(OhmModHandler):


	def update(self, *a, **k):
		mod = self.active_mod()
		with self._script.component_guard():
			if not mod is None:
				if self._grid:
					##self._grid_value.subject = self._grid
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
				mod.restore()
				if mod.legacy:
					if self.is_shifted():
						self._display_nav_box()
			else:
				if not self._grid_value.subject is None:
					self._grid_value.subject.reset()
				if not self._keys_value.subject is None:
					self._keys_value.subject.reset()
			if self.is_shifted():
				self._grid and self._device_selector.set_matrix(self._grid.submatrix[:, :1])
			else:
				self._device_selector.set_matrix(None)
	


