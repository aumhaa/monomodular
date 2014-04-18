# by amounra 0414 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import time
import math
import sys

""" _Framework files """
from _Framework.ButtonElement import ButtonElement # Class representing a button a the controller
from _Framework.ButtonMatrixElement import ButtonMatrixElement # Class representing a 2-dimensional set of buttons
from _Framework.ChannelStripComponent import ChannelStripComponent # Class attaching to the mixer of a given track
from _Framework.ClipSlotComponent import ClipSlotComponent # Class representing a ClipSlot within Live
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.ControlElement import ControlElement # Base class for all classes representing control elements on a controller 
from _Framework.ControlSurface import ControlSurface # Central base class for scripts based on the new Framework
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent # Base class for all classes encapsulating functions in Live
from _Framework.DeviceComponent import DeviceComponent # Class representing a device in Live
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


"""Imports from the Monomodular Framework"""
from _Mono_Framework.CodecEncoderElement import CodecEncoderElement
from _Mono_Framework.EncoderMatrixElement import EncoderMatrixElement
from _Mono_Framework.MonoChopperComponent import MonoChopperComponent
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.SwitchboardElement import SwitchboardElement
from _Mono_Framework.MonoClient import MonoClient
from _Mono_Framework.LiveUtils import *

from AumTroll.AumTroll import AumTroll
from Map import *

from _Framework.SessionRecordingComponent import *
from _Framework.ClipCreator import ClipCreator
from Push.ViewControlComponent import ViewControlComponent
from _APC.DetailViewCntrlComponent import DetailViewCntrlComponent


class AumTroll_G(AumTroll):


	def __init__(self, *a, **k):
		super(AumTroll_G, self).__init__(*a, **k)
		with self.component_guard():
			self._setup_session_recording_component()
			self._setup_APC_detail_component()
		self.log_message('Aumtroll G 4')
	


	def _setup_session_recording_component(self):
		self._recorder = SessionRecordingComponent(ClipCreator(), ViewControlComponent())
	

	def _setup_APC_detail_component(self):
		self._alt_device_navigator = DetailViewCntrlComponent()
	
	"""the mixer component corresponds and moves with our selection in Live, and allows us to assign physical controls"""
	"""to Live's mixer functions without having to make all the links ourselves"""
	def _setup_mixer_control(self):
		is_momentary = True
		self._num_tracks = (8) 								#A mixer is one-dimensional; 
		self._mixer = MixerComponent(8, 2, True, False)		#These values represent the (Number_of_tracks, Number_of_returns, EQ_component, Filter_component)
		self._mixer.name = 'Mixer'							#We name everything that we might want to access in m4l
		self._mixer.set_track_offset(0) 					#Sets start point for mixer strip (offset from left)
		for index in range(8):								
			#self._mixer.channel_strip(index).set_volume_control(self._fader[index])		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
			self._mixer.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)	#We also name the individual channel_strip so we can access it
			self._mixer.track_eq(index).name = 'Mixer_EQ_' + str(index)					#We also name the individual EQ_component so we can access it
			self._mixer.channel_strip(index)._invert_mute_feedback = True				#This makes it so that when a track is muted, the corresponding button is turned off
		self.song().view.selected_track = self._mixer.channel_strip(0)._track 			#set the selected strip to the first track, so that we don't, for example, try to assign a button to arm the master track, which would cause an assertion error
		self._send_reset = ResetSendsComponent(self)		#This creates a custom MonoComponent that allows us to reset all the sends on a track to zero with a single button
		self._send_reset.name = 'Sends_Reset'				#We name it so that we can access it from m4l
	

	"""the session component represents a grid of buttons that can be used to fire, stop, and navigate clips in the session view"""
	def _setup_session_control(self):
		is_momentary = True
		num_tracks = 8															#we are working with a 4x4 grid,	
		num_scenes = 4 															#so the height and width are both set to 4
		self._session = SessionComponent(num_tracks, num_scenes)				#we create our SessionComponent with the variables we set above it
		self._session.name = "Session"											#we name it so we can access it in m4l
		self._session.set_offsets(0, 0)											#we set the initial offset to the far left, top of the session grid
		self._session._track_banking_increment = 4
		self._session.set_stop_clip_value(STOP_CLIP[self._rgb])			#we assign the colors that will be displayed when the stop_clip button is pressed. This value comes from CNTRLR_Map.py, which is imported in the header of our script
		self._scene = [None for index in range(4)]								#we create an array to hold the Scene subcomponents so that we can get to them if we need them.
		for row in range(num_scenes):											#now we'll fill the array with different objects that were created when we called the SessionComponent() module
			self._scene[row] = self._session.scene(row)							#each session row is a SceneComponent
			self._scene[row].name = 'Scene_' + str(row)							#name it so we can access it in m4l
			for column in range(num_tracks):									#now we'll create holders and names for the contents of each scene
				clip_slot = self._scene[row].clip_slot(column)					#we use our assignment of the scene above to gain access to the individual clipslots.  Here, we are just assigning 'clip_slot' each time as a local variable so we can manipulated it's properties
				clip_slot.name = str(column) + '_Clip_Slot' + str(row)			#name it so that we can acces it in m4l
				clip_slot.set_triggered_to_play_value(CLIP_TRG_PLAY[self._rgb])	#set its triggered to play color
				clip_slot.set_triggered_to_record_value(CLIP_TRG_REC[self._rgb])#set its triggered to record color
				clip_slot.set_stopped_value(CLIP_STOP[self._rgb])				#set its stop color
				clip_slot.set_started_value(CLIP_STARTED[self._rgb])			#set its started color
				clip_slot.set_recording_value(CLIP_RECORDING[self._rgb])		#set its recording value
		self._session.set_mixer(self._mixer)									#now we link the MixerComponent we created in _setup_mixer_control() to our session component so that they will follow each other when either is navigated
		self.set_highlighting_session_component(self._session)
		self._session_zoom = SessionZoomingComponent(self._session)	 			#this creates the ZoomingComponent that allows navigation when the shift button is pressed
		self._session_zoom.name = 'Session_Overview'							#name it so we can access it in m4l
		self._session_zoom.set_stopped_value(ZOOM_STOPPED[self._rgb])			#set the zooms stopped color
		self._session_zoom.set_playing_value(ZOOM_PLAYING[self._rgb])			#set the zooms playing color
		self._session_zoom.set_selected_value(ZOOM_SELECTED[self._rgb])			#set the zooms selected color
		self._session_zoom.set_button_matrix(self._matrix)						#assign the ButtonMatrixElement that we created in _setup_controls() to the zooming component so that we can control it
		self._session_zoom.set_zoom_button(self._button[31])					#assign a shift button so that we can switch states between the SessionComponent and the SessionZoomingComponent
	

	"""this section is used so that we can reassign the color properties of each state.  Legacy, from the OhmModes script, to support either RGB or Monochrome"""
	def _assign_session_colors(self):
		num_tracks = 8
		num_scenes = 4 
		self._session.set_stop_clip_value(STOP_ALL[self._rgb])
		for row in range(num_scenes): 
			for column in range(num_tracks):
				self._scene[row].clip_slot(column).set_triggered_to_play_value(CLIP_TRG_PLAY[self._rgb])
				self._scene[row].clip_slot(column).set_triggered_to_record_value(CLIP_TRG_REC[self._rgb])
				self._scene[row].clip_slot(column).set_stopped_value(CLIP_STOP[self._rgb])
				self._scene[row].clip_slot(column).set_started_value(CLIP_STARTED[self._rgb])
				self._scene[row].clip_slot(column).set_recording_value(CLIP_RECORDING[self._rgb])		
		self._session_zoom.set_stopped_value(ZOOM_STOPPED[self._rgb])
		self._session_zoom.set_playing_value(ZOOM_PLAYING[self._rgb])
		self._session_zoom.set_selected_value(ZOOM_SELECTED[self._rgb])
		self.refresh_state()
	

	def deassign_live_controls(self, *a, **k):
		for index in range(4):
			self._encoder[index].send_value(0, True)
			self._encoder[index].clear_send_cache()							
			self._mixer.channel_strip(index+4).set_volume_control(None)		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it																#for the left side of the mixer
			self._mixer.channel_strip(index+4).set_solo_button(None)		#remove the solo button assignments
			self._mixer.channel_strip(index+4).set_arm_button(None)		#remove the arm button assignments
			self._mixer.channel_strip(index+4).set_mute_button(None)		#remove the mute button assignments
			self._mixer.channel_strip(index+4).set_select_button(None)	#remove the select button assignments
		#self._alt_device_navigator.set_arrange_session_toggle_button(None)
		self._alt_device_navigator.set_device_clip_toggle_button(None)
		self._alt_device_navigator.set_detail_toggle_button(None)
		self._alt_device_navigator.set_enabled(False)
		#self._alt_device_navigator.set_shift_button(None)
		self._transport.set_nudge_buttons(None, None)
		self._recorder.set_record_button(None)
		self._recorder.set_re_enable_automation_button(None)
		
		super(AumTroll_G, self).deassign_live_controls(*a, **k)
	


	def assign_live_controls(self):
		"""the following lines update all of the controls' last_sent properties, so that they forward the next value they receive regardless of whether or not it is the same as the last it recieved"""
		"""we also reset the encoder rings and buttons, since the device component will not update them if it is not locked to a device in Live"""
		for index in range(16):
			self._grid[index].force_next_send()
		for index in range(32):
			#self._button[index].set_on_off_values(0, 127)
			self._button[index].send_value(0, True)
			self._button[index].force_next_send()
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)
			self._encoder_button[index+4].force_next_send()
		for index in range(12):
			self._encoder[index].send_value(0, True)
			self._encoder[index].force_next_send()

		"""here we assign the left side of our mixer's buttons on the lower 32 keys"""
		if self._monohm is None:
			with self.component_guard():
				for index in range(4):															#we set up a recursive loop to assign all four of our track channel strips' controls
					self._button[index+16].set_on_value(MUTE[self._rgb])						#set the mute color from the Map.py
					self._mixer.channel_strip(index).set_mute_button(self._button[index+16])	#assign the mute buttons to our mixer channel strips
					self._button[index+28].set_on_value(MUTE[self._rgb])						#set the mute color from the Map.py
					self._mixer.channel_strip(index+4).set_mute_button(self._button[index+28])	#assign the mute buttons to our mixer channel strips

					self._button[index].set_on_off_values(SELECT[self._rgb], SELECT_OFF[self._rgb])
					self._mixer.channel_strip(index).set_select_button(self._button[index])	#assign the select buttons to our mixer channel strips
					self._button[index+12].set_on_off_values(SELECT[self._rgb], SELECT_OFF[self._rgb])	#set the select color from the Map.py
					self._mixer.channel_strip(index+4).set_select_button(self._button[index+12])	#assign the select buttons to our mixer channel strips

				#self._session.set_stop_track_clip_buttons(tuple(self._button[index+4] for index in range(8)))	#these last two lines assign the send_reset buttons and the stop_clip buttons for each track
				for index in range(8):
					#self._button[index + 4].set_on_off_values(SOLO[self._rgb], SOLO[self._rgb])	#this assigns the custom colors defined in the Map.py file to the stop_clip buttons.  They have seperate on/off values, but we assign them both the same value so we can always identify them
					self._mixer.channel_strip(index).set_solo_button(self._button[index+4])
					#self._button[index + 4].send_value(STOP_CLIP[self._rgb], True)				#finally, we send the on/off colors out to turn the LEDs on for the stop clip buttons
				for index in range(4):															#set up a for loop to generate an index for assigning the session nav buttons' colors
					self._button[index + 20].set_on_off_values(SESSION_NAV[self._rgb], SESSION_NAV_OFF[self._rgb])	#assign the colors from Map.py to the session nav buttons
				self._session.set_track_bank_buttons(self._button[21], self._button[20])		#set the track bank buttons for the Session navigation controls
				self._session.set_scene_bank_buttons(self._button[23], self._button[22])		#set the scnee bank buttons for the Session navigation controls

				"""this section assigns the grid to the clip launch functionality of the SessionComponent"""
				for column in range(4):															#we need to set up a double recursion so that we can generate the indexes needed to assign the grid buttons
					for row in range(4):														#the first recursion passes the column index, the second the row index
						self._scene[row].clip_slot(column).set_launch_button(self._grid[(row*4)+column])	#we use the indexes to grab the first the scene and then the clip we assigned above, and then we use them again to define the button held in the grid array that we want to assign to the clip slot from the session component

				for index in range(4):															#set up a for loop to generate an index for assigning the session nav buttons' colors
					self._button[index + 24].set_on_off_values(SHIFTS[self._rgb], SHIFTS_OFF[self._rgb])	#assign the colors from Map.py to the session nav buttons

				self._session.update()															#tell the Session component to update so that the grid will display the currently selected session region
				self._session.set_enabled(True)													#enable the Session Component
				self._session_zoom.set_enabled(True)											#enable the Session Zoom
				
				#self._alt_device_navigator.set_arrange_session_toggle_button(self._encoder_button[4])
				self._alt_device_navigator.set_device_clip_toggle_button(self._encoder_button[5])
				self._alt_device_navigator.set_detail_toggle_button(self._encoder_button[6])
				#self._device_navigator.set_shift_button(self._encoder_button[7])
				self._session_zoom.set_zoom_button(self._encoder_button[7])							#assign the lower right key button to the shift function of the Zoom component

				self._session.set_scene_bank_buttons(self._button[25], self._button[24])
				self._recorder.set_record_button(self._button[27])
				self._recorder.set_re_enable_automation_button(self._button[26])
		else:
			for index in range(8):
				self._mixer2.channel_strip(index).set_volume_control(self._fader[index])
			self._mixer2.set_track_offset(TROLL_OFFSET)
			self._device_selector.set_mode_buttons(self._grid)
			if not self._shifted:
				self._assign_monomodular_controls()
			else:
				self._assign_shifted_controls()
			self._device1.set_parameter_controls(tuple([self._knobs[index] for index in range(8)]))
			self._device2.set_parameter_controls(tuple([self._knobs[index+12] for index in range(8)]))
			self._device1.set_enabled(True)
			self._device2.set_enabled(True)
			self._find_devices()
			self._device1.update()
			self._device2.update()

		"""this section assigns the encoders and encoder buttons"""
		self._device.set_parameter_controls(tuple([self._encoder[index+4] for index in range(8)]))			#assign the encoders from the device component controls - we are doing this here b
		#self._encoder_button[7].set_on_value(DEVICE_LOCK[self._rgb])					#set the on color for the Device lock encoder button
		#self._device.set_lock_button(self._encoder_button[7])							#assign encoder button 7 to the device lock control
		#self._encoder_button[4].set_on_value(DEVICE_ON[self._rgb])						#set the on color for the Device on/off encoder button 
		#self._device.set_on_off_button(self._encoder_button[4])							#assing encoder button 4 to the device on/off control
		for index in range(2):															#setup a recursion to generate indexes so that we can reference the correct controls to assing to the device_navigator functions
			self._encoder_button[index + 8].set_on_value(DEVICE_NAV[self._rgb])			#assign the on color for the device navigator
			self._encoder_button[index + 10].set_on_value(DEVICE_BANK[self._rgb])		#assign the on color for the device bank controls
		self._device_navigator.set_nav_buttons(self._encoder_button[10], self._encoder_button[11]) 	#set the device navigators controls to encoder buttons 10 and 11
		self._device.set_bank_nav_buttons(self._encoder_button[8], self._encoder_button[9]) 	#set the device components bank nav controls to encoder buttons 8 and 9

		"""now we turn on and update some of the components we've just made assignments to"""
		self._device.set_enabled(True)													#enable the Device Component
		self._device_navigator.set_enabled(True)										#enable the Device Navigator
		self._alt_device_navigator.set_enabled(True)
		self._device.update()															#tell the Device component to update its assingments so that it will detect the currently selected device parameters and display them on the encoder rings
		#self._mixer.update()
		#self.request_rebuild_midi_map()
	




#a

