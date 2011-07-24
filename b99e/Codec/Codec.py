# http://aumhaa.blogspot.com

import Live
import time
import math

""" All of the Framework files are listed below, but we are only using using some of them in this script (the rest are commented out) """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
#from _Framework.ButtonSliderElement import ButtonSliderElement # Class representing a set of buttons used as a slider
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
#from _Framework.ChannelTranslationSelector import ChannelTranslationSelector # Class switches modes by translating the given controls' message channel
#from _Framework.ClipSlotComponent import ClipSlotComponent # Class representing a ClipSlot within Live
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent # Class representing a device in Live
#from _Framework.DisplayDataSource import DisplayDataSource # Data object that is fed with a specific string and notifies its observers
from _Framework.EncoderElement import EncoderElement # Class representing a continuous control on the controller
from _Framework.InputControlElement import * # Base class for all classes representing control elements on a controller
#from _Framework.LogicalDisplaySegment import LogicalDisplaySegment # Class representing a specific segment of a display on the controller
#from _Framework.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
#from _Framework.PhysicalDisplayElement import PhysicalDisplayElement # Class representing a display on the controller
#from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
#from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
#from _Framework.SessionZoomingComponent import SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
#from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
#from _Framework.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
#from _Framework.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section

"""Custom files, overrides, and files from other scripts"""
#from ShiftModeComponent import ShiftModeComponent
from MonomodModeComponent import MonomodModeComponent
from FlashingButtonElement import FlashingButtonElement
from DetailViewControllerComponent import DetailViewControllerComponent
from DeviceSelectorComponent import DeviceSelectorComponent
from CodecEncoderElement import CodecEncoderElement
from EncoderMatrixElement import EncoderMatrixElement
from ResetSendsComponent import ResetSendsComponent
from MonoBridgeElement import MonoBridgeElement
#from DisconnectNotifier import DisconnectNotifier
#from ClipSlotNameListener import ClipSlotNameListener
from MonomodComponent import MonomodComponent
from MonomodModeComponent import MonomodModeComponent
from CodecDeviceComponent import CodecDeviceComponent

import LiveUtils
from _Generic.Devices import *
from Codec_Map import *

""" Here we define some global variables """
CHANNEL = 0 
session = None 
mixer = None 

factoryreset = (240,0,1,97,4,6,247)
btn_channels = (240, 0, 1, 97, 4, 19, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 0, 247);
enc_channels = (240, 0, 1, 97, 4, 20, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 247);

class Codec(ControlSurface):
	__module__ = __name__
	__doc__ = " MonoCode controller script "


	def __init__(self, c_instance):
		"""everything except the '_on_selected_track_CHANNELged' override and 'disconnect' runs from here"""
		ControlSurface.__init__(self, c_instance)
		self.log_message(time.strftime("%d.%m.%Y %H:%M:%S", time.localtime()) + "--------------= Codec log opened =--------------") # Writes message into Live's main log file. This is a ControlSurface method.
		self.set_suppress_rebuild_requests(True) # Turn off rebuild MIDI map until after we're done setting up
		self._monomod_callback = None
		self._monomod_version = '99c'
		self._local_ring_control = True
		self.set_local_ring_control(1)
		self._setup_controls()
		self._last_device = None
		self._timer = 0
		self._device_selection_follows_track_selection=True
		self.set_suppress_rebuild_requests(False) #Turn rebuild back on, now that we're done setting up
		self.song().view.add_selected_track_listener(self._update_selected_device)
		self.show_message('MonoCode Control Surface Loaded')
		#self.local_ring_control(True)
		#self.set_absolute_mode(True)
		self._setup_monobridge()
		#self._setup_device_controls() # Setup the device object
		self._setup_special_device_control() 
		self._setup_monomod()
		self._setup_modes() 
		self._setup_device_selector()
		#self._setup_disconnect()
	

	"""script initialization methods"""
	def _initialize_code(self):
		#self._send_midi(factoryreset)
		#self._send_midi(btn_channels)
		#self._send_midi(enc_channels)	
		pass
	

	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	def _setup_controls(self):
		is_momentary = True
		self._livid = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, LIVID, 'Livid_Button', self)

		self._dial = [None for index in range(8)]
		for column in range(8):
			self._dial[column] = [None for index in range(4)]
			for row in range(4):
				self._dial[column][row] = CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, CODE_DIALS[row][column], Live.MidiMap.MapMode.absolute, 'Dial_' + str(column) + '_' +	str(row), (column + (row*8)), self)	#CODE_DIALS[row][column]
		
		self._button = [None for index in range(8)]
		for column in range(8):
			self._button[column] = [None for index in range(4)]
			for row in range(4):
				self._button[column][row] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CODE_BUTTONS[row][column], 'Button_' + str(column) + '_' + str(row), self) 
		

		self._column_button = [None for index in range(8)]
		for index in range(8):
			self._column_button[index] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CODE_COLUMN_BUTTONS[index], 'Column_Button_' + str(index), self)		
			
		self._row_button = [None for index in range(4)]
		for index in range(4):
			self._row_button[index] = FlashingButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CODE_ROW_BUTTONS[index], 'Row_Button_' + str(index), self)		

		self._dial_matrix = EncoderMatrixElement(self)
		self._dial_matrix.name = 'Encoder_Matrix'
		for row in range(4):
			dial_row = tuple([self._dial[column][row] for column in range(8)])
			self._dial_matrix.add_row(dial_row)

		self._button_matrix = ButtonMatrixElement()
		self._button_matrix.name = 'Button_Matrix'
		for row in range(4):
			button_row = [self._button[column][row] for column in range(8)]
			button_row.append(self._row_button[row])
			self._button_matrix.add_row(tuple(button_row))
		button_row = self._column_button
		button_row.append(self._livid)
		self._button_matrix.add_row(tuple(button_row))
	

	def _setup_modes(self):
		self._monomod_mode = MonomodModeComponent(self)
		self._monomod_mode.name = 'Monomod_Mode'
		self._monomod_mode.set_mode_toggle(self._livid)
		#self._shift_mode = ShiftModeComponent(self) 
		#self._shift_mode.name = 'Shift_Mode'
		#self._shift_mode.set_mode_toggle(self._livid)
	

	def _setup_transport_control(self):
		self._transport = TransportComponent() 
		self._transport.name = 'Transport'
	

	def _setup_monomod(self):
		self._host = MonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self._host._set_dial_matrix(self._dial_matrix, self._button_matrix)
		self._host._set_shift_button(self._row_button[3])
		self.hosts = [self._host]
		#self._host._set_button_matrix(self._button_matrix)
		#for index
		#self._host._set_shift
	

	def _setup_device_control(self):
		self._device = DeviceComponent()
		self._device.name = 'Device_Component'
		self.set_device_component(self._device)
		self._device_navigator = DetailViewControllerComponent()
		self._device_navigator.name = 'Device_Navigator'
		self._device_selection_follows_track_selection = FOLLOW
		#self._device.set_parameter_controls(tuple(self._dial[0][index] for index in range(8)))
	

	def _setup_special_device_control(self):
		self._special_device = CodecDeviceComponent(self)
		self._special_device.name = 'CodecDeviceComponent'
		device_param_controls = []
		for row in range(4):
			for column in range(8):
				#dial_index = control + (index*8)
				#dial_index = device_encoders[control + (index*8)]
				device_param_controls.append(self._dial[column][row])
		self._special_device.set_parameter_controls(tuple(device_param_controls))		
		self.set_device_component(self._special_device)
	


	"""this is where we take care of setting up the the multiple devices per page, we will need 4"""
	def _setup_device_controls(self):
		self._device = [None for index in range(4)]
		for index in range(4):
			self._device[index] = DeviceComponent()
			self._device[index].name = 'Device_Component_' + str(index)
			#self.set_device_component(self._device)  #this doesn't work anymore, because we have multiple devices for the controller....we'll have to get fancy here, but that's for later
			#self._device_navigator = DetailViewControllerComponent()  #its unclear if we'll need this....how is device navigation (i.e. banking for device parameter banks) going to be handled by the script? 
			#self._device_navigator.name = 'Device_Navigator'
			device_param_controls = []
			for control in range(8):
				#dial_index = control + (index*8)
				#dial_index = device_encoders[control + (index*8)]
				device_param_controls.append(self._dial[control][index])
			self._device[index].set_parameter_controls(tuple(device_param_controls))
	

	def _setup_device_selector(self):
		self._device_selector = DeviceSelectorComponent(self, 'c')
		self._device_selector.name = 'Device_Selector'
		#self._device_selector.set_mode_toggle(self._livid)
	

	def device_follows_track(self, val):
		self._device_selection_follows_track_selection = (val == 1)
		return self
	


	"""general functionality"""
	def disconnect(self):
		"""clean things up on disconnect"""
		self.song().view.remove_selected_track_listener(self._update_selected_device)
		#self._disconnect_notifier.set_mode(0)
		self.log_message(time.strftime("%d.%m.%Y %H:%M:%S", time.localtime()) + "--------------= Codec log closed =--------------") #Create entry in log file
		ControlSurface.disconnect(self)
		return None
	

	def _get_num_tracks(self):
		return self.num_tracks
	

	def flash(self):
		if(self.flash_status > 0):
			for row in range(4):
				if(self._row_button[row]._flash_state > 0):
					self._row_button[row].flash(self._timer)
				for column in range(8):
					if(self._dial_button[row][column]._flash_state > 0):
						self._dial_button[row][column].flash(self._timer)
			for column in range(8):
				if(self._column_button[column]._flash_state > 0):
					self._column_button[column].flash(self._timer)
	

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
		if(self._local_ring_control is False):
			self.send_ring_leds()
	

	def set_local_ring_control(self, val = 1):
		#assert val is isinstance(val, type(False))
		self._local_ring_control = (val!=0)
		if(self._local_ring_control is True):
			self._send_midi(tuple([240, 0, 1, 97, 4, 32, 0, 247]))
		else:
			self._send_midi(tuple([240, 0, 1, 97, 4, 32, 1, 247]))
	

	def send_ring_leds(self):
		leds = [240, 0, 1, 97, 4, 31]
		for column in range(8):
			for row in range(4):
				wheel = self._dial[column][row]
				bytes = wheel._get_ring()
				leds.append(bytes[0])
				leds.append(int(bytes[1]) + int(bytes[2]))
		leds.append(247)
		self._send_midi(tuple(leds))
	

	def set_absolute_mode(self, val = 1):
		self._absolute_mode = (val!=0)
		if self._absolute_mode is True:
			self._send_midi(tuple([240, 0, 1, 97, 4, 17, 0, 0, 0, 0, 0, 0, 0, 0, 247]))
		else:
			self._send_midi(tuple([240, 0, 1, 97, 4, 17, 127, 127, 127, 127, 127, 127, 127, 127, 247]))
	

	def _update_selected_device(self):
		if self._device_selection_follows_track_selection is True:
			track = self.song().view.selected_track
			device_to_select = track.view.selected_device
			if device_to_select == None and len(track.devices) > 0:
				device_to_select = track.devices[0]
			if device_to_select != None:
				self.song().view.select_device(device_to_select)
			self._special_device.set_device(device_to_select)
			#self.set_appointed_device(device_to_select)
			#self._device_selector.set_enabled(True)
			self.request_rebuild_midi_map()
		return None 
	


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
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, CodecEncoderElement)):
			#self.log_message(str(name) + str(value) + str(sender.num))
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
	

	def handle_sysex(self, midi_bytes):
		#self._send_midi(tuple([240, 00, 01, 97, 04, 15, 01, 247]))
		#response = [long(0),long(0)]
		#self.log_message(response)
		pass
	


	"""devices 1-8"""
	def activate_device_control(self):			##these need to be here anyway, whether or not there is a device present to control
		for index in range(4):
			self._device[index].set_enabled(True)
		self._reassign_devices()
	

	def activate_special_device_control(self):			##these need to be here anyway, whether or not there is a device present to control
		self._special_device.set_enabled(True)
		if len(self.song().view.selected_track.devices):
			self._special_device.set_device(self.song().view.selected_track.devices[0])
		else:
			self._special_device.set_device(None)
		self._special_device.update()
	

	def _reassign_devices(self):	
		track = self.song().view.selected_track
		for index in range(4):
			if index  < len(track.devices):
				self.log_message('assigning device')
				self._device[index].set_device(track.devices[index])
			else:
				self.log_message('assigning device to None')
				self._device[index].set_device(None)
			self._device[index].update()
	
#
#