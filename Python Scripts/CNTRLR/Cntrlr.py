# by amounra 0513 : http://www.aumhaa.com

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
from VCM600.MixerComponent import MixerComponent # Class encompassing several channel strips to form a mixer
from _Framework.ModeSelectorComponent import ModeSelectorComponent # Class for switching between modes, handle several functions with few controls
from _Framework.NotifyingControlElement import NotifyingControlElement # Class representing control elements that can send values
from _Framework.SceneComponent import SceneComponent # Class representing a scene in Live
from _Framework.SessionComponent import SessionComponent # Class encompassing several scene to cover a defined section of Live's session
from _Framework.SessionZoomingComponent import DeprecatedSessionZoomingComponent as SessionZoomingComponent # Class using a matrix of buttons to choose blocks of clips in the session
from _Framework.SliderElement import SliderElement # Class representing a slider on the controller
from VCM600.TrackEQComponent import TrackEQComponent # Class representing a track's EQ, it attaches to the last EQ device in the track
from VCM600.TrackFilterComponent import TrackFilterComponent # Class representing a track's filter, attaches to the last filter in the track
from _Framework.TransportComponent import TransportComponent # Class encapsulating all functions in Live's transport section
from _Framework.ModesComponent import AddLayerMode, LayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.Layer import Layer
from _Framework.SubjectSlot import SubjectEvent, subject_slot, subject_slot_group
from _Framework.Task import *
from _Framework.M4LInterfaceComponent import M4LInterfaceComponent
from _Framework.ComboElement import ComboElement, DoublePressElement, MultiElement, DoublePressContext



"""Imports from the Monomodular Framework"""
from _Mono_Framework.CodecEncoderElement import CodecEncoderElement
from _Mono_Framework.EncoderMatrixElement import NewEncoderMatrixElement as EncoderMatrixElement
from _Mono_Framework.MonoBridgeElement import MonoBridgeElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from _Mono_Framework.DetailViewControllerComponent import DetailViewControllerComponent
from _Mono_Framework.DeviceSelectorComponent import NewDeviceSelectorComponent as DeviceSelectorComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.LiveUtils import *
from _Mono_Framework.Debug import *
from _Mono_Framework.Mod import *

"""Custom files, overrides, and files from other scripts"""

from _Generic.Devices import *
from ModDevices import *
from Map import *


""" Here we define some global variables """
switchxfader = (240, 00, 01, 97, 02, 15, 01, 247)
switchxfaderrgb = (240, 00, 01, 97, 07, 15, 01, 247)
assigncolors = (240, 00, 01, 97, 07, 34, 00, 07, 03, 06, 05, 01, 02, 04, 247)
assign_default_colors = (240, 00, 01, 97, 07, 34, 00, 07, 06, 05, 01, 04, 03, 02, 247)
check_model = (240, 126, 127, 6, 1, 247)


factoryreset = (240,0,1,97,8,6,247)
btn_channels = (240, 0, 1, 97, 8, 19, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 0, 247);
enc_channels = (240, 0, 1, 97, 8, 20, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, CHANNEL, 247);
SLOWENCODER = (240, 0, 1, 97, 8, 30, 69, 00, 247)
NORMALENCODER = (240, 0, 1, 97, 8, 30, 00, 00, 247)
FASTENCODER = (240, 0, 1, 97, 8, 30, 04, 00, 247)


class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		component.pop_mode(mode)
	

	def update_button(self, component, mode, selected_mode):
		button = component.get_mode_button(mode)
		groups = component.get_mode_groups(mode)
		selected_groups = component.get_mode_groups(selected_mode)
		value = (mode == selected_mode or bool(groups & selected_groups))*32 or 1
		button.send_value(value, True)
	


class ShiftModeComponent(ModeSelectorComponent):


	def __init__(self, script, callback, *a, **k):
		super(ShiftModeComponent, self).__init__(*a, **k)
		self._script = script
		self.update = callback
		self._modes_buttons = []
		self._last_mode = 0
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement or FlashingButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
	

	def number_of_modes(self):
		return 3
	

	def set_mode(self, mode):
		assert isinstance(mode, int)
		mode += 1
		assert (mode in range(self.number_of_modes()))
		if (self._mode_index != mode):
			self._mode_index = mode
			self.update()
		elif (self._mode_index != 0):
			self._mode_index = 0
			self.update()
	

	def _mode_value(self, value, sender):
		assert (len(self._modes_buttons) > 0)
		assert isinstance(value, int)
		assert isinstance(sender, ButtonElement)
		assert (self._modes_buttons.count(sender) == 1)
		if ((value is not 0) or (not sender.is_momentary())):
			self.set_mode(self._modes_buttons.index(sender))
	


class MonomodModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '


	def __init__(self, script, *a, **k):
		super(MonomodModeComponent, self).__init__(*a, **k)
		self._script = script
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, ButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, ButtonElement or FlashingButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	

	def number_of_modes(self):
		return 2
	


class DeviceNavigator(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Component that can toggle the device chain- and clip view of the selected track '


	def __init__(self, device_component, mixer, script):
		super(DeviceNavigator, self).__init__()
		self._prev_button = None
		self._next_button = None
		self._enter_button = None
		self._exit_button = None
		self._chain_prev_button = None
		self._chain_next_button = None
		self._device = device_component
		self._mixer = mixer
		self._script = script
		return None
	

	def deassign_all(self):
		self.set_nav_buttons(None, None)
		self.set_layer_buttons(None, None)
		self.set_chain_nav_buttons(None, None)
	

	def set_nav_buttons(self, prev_button, next_button):
		#self._script.log_message('set nav: ' + str(prev_button) + ' ' + str(next_button))
		identify_sender = True
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		self._prev_button = prev_button
		if self._prev_button != None:
			self._prev_button.add_value_listener(self._nav_value, identify_sender)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)
		self._next_button = next_button
		if self._next_button != None:
			self._next_button.add_value_listener(self._nav_value, identify_sender)
		self.update()
		return None
	

	def set_chain_nav_buttons(self, chain_prev_button, chain_next_button):
		#self._script.log_message('set nav: ' + str(prev_button) + ' ' + str(next_button))
		identify_sender = True
		if self._chain_prev_button != None:
			if self._chain_prev_button.value_has_listener(self._chain_nav_value):
				self._chain_prev_button.remove_value_listener(self._chain_nav_value)
		self._chain_prev_button = chain_prev_button
		if self._chain_prev_button != None:
			self._chain_prev_button.add_value_listener(self._chain_nav_value, identify_sender)
		if self._chain_next_button != None:
			if self._chain_next_button.value_has_listener(self._chain_nav_value):
				self._chain_next_button.remove_value_listener(self._chain_nav_value)
		self._chain_next_button = chain_next_button
		if self._chain_next_button != None:
			self._chain_next_button.add_value_listener(self._chain_nav_value, identify_sender)
		self.update()
		return None
	

	def set_layer_buttons(self, enter_button, exit_button):
		#self._script.log_message('set nav: ' + str(prev_button) + ' ' + str(next_button))
		identify_sender = True
		if self._enter_button != None:
			if self._enter_button.value_has_listener(self._enter_value):
				self._enter_button.remove_value_listener(self._enter_value)
		self._enter_button = enter_button
		if self._enter_button != None:
			self._enter_button.add_value_listener(self._enter_value)
		if self._exit_button != None:
			if self._exit_button.value_has_listener(self._exit_value):
				self._exit_button.remove_value_listener(self._exit_value)
		self._exit_button = exit_button
		if self._exit_button != None:
			self._exit_button.add_value_listener(self._exit_value)
		self.update()
		return None
	

	def set_shift_button(self, shift_button):
		self._shift_value.subject = shift_button
	

	def update(self):
		track = self._mixer.selected_strip()._track
		if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
			track = self._device._device.canonical_parent
		if track != None:
			if not self._prev_button is None:
				if self._device._device and len(track.devices)>0 and self._device._device in track.devices and [t for t in track.devices].index(self._device._device)>0:
					self._prev_button.turn_on()
				else:
					self._prev_button.turn_off()
			if not self._next_button is None:
				if self._device._device and len(track.devices)>0 and self._device._device in track.devices and [t for t in track.devices].index(self._device._device)<(len(track.devices)-1):
					self._next_button.turn_on()
				else:
					self._next_button.turn_off()
			if not self._chain_prev_button is None:
				if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
					parent_chain = self._device._device.canonical_parent
					parent = parent_chain.canonical_parent
					if len(parent.chains)>0 and parent_chain in parent.chains and [c for c in parent.chains].index(parent_chain)>0:
						self._chain_prev_button.turn_on()
					else:
						self._chain_prev_button.turn_off()
			if not self._chain_next_button is None:
				if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
					parent_chain = self._device._device.canonical_parent
					parent = parent_chain.canonical_parent
					if len(parent.chains)>0 and parent_chain in parent.chains and [c for c in parent.chains].index(parent_chain)<(len(parent.chains)-1):
						self._chain_next_button.turn_on()
					else:
						self._chain_next_button.turn_off()
			if not self._enter_button is None:
				if self._device._device and self._device._device.can_have_chains and len(self._device._device.chains):
					self._enter_button.turn_on()
				else:
					self._enter_button.turn_off()
			if not self._exit_button is None:
				if self._device._device and self._device._device.canonical_parent and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
					self._exit_button.turn_on()
				else:
					self._exit_button.turn_off()
	

	def _nav_value(self, value, sender):
		if self.is_enabled():
			if ((not sender.is_momentary()) or (value != 0)):
				track = self._mixer.selected_strip()._track
				if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
					track = self._device._device.canonical_parent
				if track != None:
					if(sender == self._prev_button):
						#self._script.log_message('prev button')
						if self._device._device and self._device._device in track.devices:
							device = track.devices[min(len(track.devices)-1, max(0, [item for item in track.devices].index(self._device._device)-1))]
							self._script.set_appointed_device(device)
							self.song().view.select_device(device)
					elif(sender == self._next_button):
						if self._device._device and self._device._device in track.devices:
							#self._script.log_message('next button')
							device = track.devices[min(len(track.devices)-1, max(0, [item for item in track.devices].index(self._device._device)+1))]
							self._script.set_appointed_device(device)
							self.song().view.select_device(device)	
	

	def _chain_nav_value(self, value, sender):
		if self.is_enabled():
			if self.shifted():
				if(sender == self._chain_prev_button):
					self._exit_value(value)
				else:
					self._enter_value(value)
			else:
				if ((not sender.is_momentary()) or (value != 0)):
					track = self._mixer.selected_strip()._track
					if track != None:
						if(sender == self._chain_prev_button):
							#self._script.log_message('prev button')
							if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
								parent_chain = self._device._device.canonical_parent
								parent = parent_chain.canonical_parent
								device = parent.chains[min(len(parent.chains)-1, max(0, [item for item in parent.chains].index(parent_chain)-1))].devices[0]
								self._script.set_appointed_device(device)
								self.song().view.select_device(device)
						elif(sender == self._chain_next_button):
							if self._device._device and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
								parent_chain = self._device._device.canonical_parent
								parent = parent_chain.canonical_parent
								device = parent.chains[min(len(parent.chains)-1, max(0, [item for item in parent.chains].index(parent_chain)+1))].devices[0]
								self._script.set_appointed_device(device)
								self.song().view.select_device(device)
	

	def _enter_value(self, value):
		#self._script.log_message('enter: ' + str(value) + ' ; ' + str(self._device._device.can_have_chains) + ' ' + str(len(self._device._device.chains)))
		if value:
			if self._device._device and self._device._device.can_have_chains and len(self._device._device.chains):
				device = self._device._device.chains[0].devices[0]
				self._script.set_appointed_device(device)
				self.song().view.select_device(device)
	

	def _exit_value(self, value):
		#self._script.log_message('exit: ' + str(value) + ' ; ' + str(self._device._device.canonical_parent) + ' ' + str(isinstance(self._device._device.canonical_parent, Live.Chain.Chain)))
		if value:
			if self._device._device and self._device._device.canonical_parent and isinstance(self._device._device.canonical_parent, Live.Chain.Chain):
				device = self._device._device.canonical_parent.canonical_parent
				self._script.set_appointed_device(device)
				self.song().view.select_device(device)
	

	@subject_slot('value')
	def _shift_value(self, value):
		self._shifted = value > 0
	

	def shifted(self):
		return self._shifted
	

	def disconnect(self):
		if self._prev_button != None:
			if self._prev_button.value_has_listener(self._nav_value):
				self._prev_button.remove_value_listener(self._nav_value)
		if self._next_button != None:
			if self._next_button.value_has_listener(self._nav_value):
				self._next_button.remove_value_listener(self._nav_value)	
	

	def _find_track(self, obj):
		if(type(obj.canonical_parent) == type(self.song().tracks[0])):
			return obj.canonical_parent
		elif(type(obj.canonical_parent)==type(None)) or (type(obj.canonical_parent)==type(self.song())):
			return None
		else:
			return self.find_track(obj.canonical_parent)
	

	def on_enabled_changed(self):
		pass
	


class CntrlrDetailViewControllerComponent(DetailViewControllerComponent):


	def __init__(self, script, *a, **k):
		super(CntrlrDetailViewControllerComponent, self).__init__(*a, **k)
		self._script = script
	

	def _nav_value(self, value, sender):
		super(CntrlrDetailViewControllerComponent, self)._nav_value(value, sender)
		if (self.is_enabled() and (not self._shift_pressed)):
			if ((not sender.is_momentary()) or (value != 0)):
				modifier_pressed = True
				if not ((not self.application().view.is_view_visible('Detail')) or (not self.application().view.is_view_visible('Detail/DeviceChain'))):
					self._script._update_selected_device()
	


class Cntrlr(ControlSurface):
	__module__ = __name__
	__doc__ = " Monomodular controller script for Livid CNTRLR "


	def __init__(self, *a, **k):
		super(Cntrlr, self).__init__(*a, **k)
		"""MonoComponent specific variables - best not change these unless you know what you're doing"""
		self._version_check = 'b996'
		self._host_name = 'Cntrlr'
		self._color_type = 'OhmRGB'
		self._client = [None for index in range(4)]
		self._active_client = None
		self._rgb = 0									##will change which color scheme is used, 0 is Livid 1 is AumHaa 2 is Monochrome(deprecated)
		self._timer = 0									#used for flashing states, and is incremented by each call from self._update_display()
		self._touched = 0								#used by the LCD patch to determine the last time a control was changed
		self.flash_status = 1							#used to determine whether button LED's use flashing states or not
		self._alt_enabled = False
		self._device_selection_follows_track_selection = FOLLOW
		with self.component_guard():
			"""Initialization methods - comments included in the corresponding method"""
			self._setup_monobridge()
			self._setup_controls()
			self._setup_transport_control() 
			self._setup_mixer_control()
			self._setup_session_control()
			self._assign_session_colors()
			self._setup_device_control()
			self._setup_device_selector()
			self._setup_mod()
			self._setup_modes() 
		self.schedule_message(1, self._open_log)
		self.song().view.add_selected_track_listener(self._update_selected_device)		#Add a listener so that when the track content changes our device selection will aslo be updated
	

	"""script initialization methods"""

	def _open_log(self):
		self.log_message("<<<<<<<<<<<<<<<<<<<<= " + str(self._host_name) + " " + str(self._version_check) + " log opened =>>>>>>>>>>>>>>>>>>>") 
		self.show_message(str(self._host_name) + ' Control Surface Loaded')
	

	"""monobridge is used to send parameter names and values to the m4l LCD patch"""
	def _setup_monobridge(self):
		self._monobridge = MonoBridgeElement(self)
		self._monobridge.name = 'MonoBridge'
	

	"""it is valuable to set up all of our controls at the beginning of our script so that we"""
	"""don't make the mistake of double assignments of identifiers, something that is not tolerated by """
	"""the components they are assigned to.	 Each control element will also be named, so that it """
	"""can be accessed via m4l if we need to listen to it or send messages to it"""
	def _setup_controls(self):
		is_momentary = True		#this variable will be used when sending arguments to the __init__ function of the modules we are creating instances of
		"""since we have several controls of each type, we'll first need to set up some arrays to hold each collection of controls"""
		"""initially, we set each one to None as a placeholder.	 We could, in fact, create them at the same time as creating these functions in
			the following manner:
				self._fader = [MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, CNTRLR_FADERS[index], Live.MidiMap.MapMode.absolute, 'Fader_' + str(index), index, self) for index in range(8)]
			Instead, we'll name them later so that the script is a little more readable."""
		
		self._fader = [None for index in range(8)]
		self._dial_left = [None for index in range(12)]
		self._dial_right = [None for index in range(12)]
		self._encoder = [None for index in range(12)]	
		self._encoder_button = [None for index in range(12)]	
		self._grid = [None for index in range(16)]
		self._button = [None for index in range(32)]
		
		"""Now that we have our arrays, we can fill them with the controltypes that we'll be using."""
		for index in range(8):
			self._fader[index] = MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, CNTRLR_FADERS[index], Live.MidiMap.MapMode.absolute, 'Fader_' + str(index), index, self)
		self._knobs = []
		for index in range(12):
			self._dial_left[index] = MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, CNTRLR_KNOBS_LEFT[index], Live.MidiMap.MapMode.absolute, 'Dial_Left_' + str(index), CNTRLR_KNOBS_LEFT[index], self)
			self._knobs.append(self._dial_left[index])
		for index in range(12):
			self._dial_right[index] = MonoEncoderElement(MIDI_CC_TYPE, CHANNEL, CNTRLR_KNOBS_RIGHT[index], Live.MidiMap.MapMode.absolute, 'Dial_Right_' + str(index), CNTRLR_KNOBS_RIGHT[index], self)
			self._knobs.append(self._dial_right[index])
		for index in range(12):
			self._encoder[index] = CodecEncoderElement(MIDI_CC_TYPE, CHANNEL, CNTRLR_DIALS[index], Live.MidiMap.MapMode.absolute, 'Encoder_' + str(index), CNTRLR_DIALS[index], self)
		for index in range(12):
			self._encoder_button[index] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CNTRLR_DIAL_BUTTONS[index], 'Encoder_Button_' + str(index), self)
		for index in range(16):
			self._grid[index] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CNTRLR_GRID[index], 'Grid' + str(index), self)
		for index in range(32):
			self._button[index] = MonoButtonElement(is_momentary, MIDI_NOTE_TYPE, CHANNEL, CNTRLR_BUTTONS[index], 'Button_' + str(index), self)
		
		"""We'll also need to assign some of our controls to ButtonMatrixElements so that we can use them with the Session Zoom and the Mod components"""
		"""We use the same formula here:  first we create the holders:"""
		self._matrix = ButtonMatrixElement()				#this is a standard _Framework object used by many of the other scripts
		self._matrix.name = 'Matrix'
		self._dial_matrix = EncoderMatrixElement(self)		#this is a special Mono object, used specifically for the mod components
		self._dial_matrix.name = 'Dial_Matrix'
		self._dial_button_matrix = ButtonMatrixElement()	#this is a special Mono object, used specifically for the mod components
		self._dial_button_matrix.name = 'Dial_Button_Matrix'
		self._key_matrix = ButtonMatrixElement()

		"""And then we fill the with the control elements that are assigned to them"""
		for row in range(4):		#we have 4 rows, and 4 columns, forming the 4x4 grid in the center of the controller
			button_row = []			#since the matrix is two dimensional, first we create the outer array,
			for column in range(4):
				button_row.append(self._grid[(row*4) + column])		#then we create the inner array.  The process is the same for the other controls here.
			self._matrix.add_row(tuple(button_row))					#add_row() is a method of the ButtonMatrixElement.	You can look in its parent module to see how it works
		for row in range(3):
			dial_row = []
			for column in range(4):
				dial_row.append(self._encoder[(row*4) + column])
			self._dial_matrix.add_row(tuple(dial_row))
		for row in range(1,3):
			dial_button_row = []
			for column in range(4):
				dial_button_row.append(self._encoder_button[(row*4) + column])
			self._dial_button_matrix.add_row(tuple(dial_button_row))
		self._key_matrix.add_row(tuple(self._button[0:16]))
		self._key_matrix.add_row(tuple(self._button[16:32]))
	

	"""the transport component allows us to assign controls to transport functions in Live"""
	def _setup_transport_control(self):
		self._transport = TransportComponent() 
		self._transport.name = 'Transport'
	

	"""the mixer component corresponds and moves with our selection in Live, and allows us to assign physical controls"""
	"""to Live's mixer functions without having to make all the links ourselves"""
	def _setup_mixer_control(self):
		is_momentary = True
		self._num_tracks = (4)								#A mixer is one-dimensional; 
		self._mixer = MixerComponent(4, 2, True, False)		#These values represent the (Number_of_tracks, Number_of_returns, EQ_component, Filter_component)
		self._mixer.name = 'Mixer'							#We name everything that we might want to access in m4l
		self._mixer.set_track_offset(0)						#Sets start point for mixer strip (offset from left)
		for index in range(4):								
			self._mixer.channel_strip(index).set_volume_control(self._fader[index])		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
			self._mixer.channel_strip(index).name = 'Mixer_ChannelStrip_' + str(index)	#We also name the individual channel_strip so we can access it
			self._mixer.track_eq(index).name = 'Mixer_EQ_' + str(index)					#We also name the individual EQ_component so we can access it
			self._mixer.channel_strip(index)._invert_mute_feedback = True				#This makes it so that when a track is muted, the corresponding button is turned off
		self.song().view.selected_track = self._mixer.channel_strip(0)._track			#set the selected strip to the first track, so that we don't, for example, try to assign a button to arm the master track, which would cause an assertion error
		self._send_reset = ResetSendsComponent(self)		#This creates a custom MonoComponent that allows us to reset all the sends on a track to zero with a single button
		self._send_reset.name = 'Sends_Reset'				#We name it so that we can access it from m4l
	

	"""the session component represents a grid of buttons that can be used to fire, stop, and navigate clips in the session view"""
	def _setup_session_control(self):
		is_momentary = True
		num_tracks = 4															#we are working with a 4x4 grid,	
		num_scenes = 4															#so the height and width are both set to 4
		self._session = SessionComponent(num_tracks, num_scenes)				#we create our SessionComponent with the variables we set above it
		self._session.name = "Session"											#we name it so we can access it in m4l
		self._session.set_offsets(0, 0)											#we set the initial offset to the far left, top of the session grid
		self._session.set_stop_clip_value(STOP_CLIP[self._rgb])			#we assign the colors that will be displayed when the stop_clip button is pressed. This value comes from CNTRLR_Map.py, which is imported in the header of our script
		self._scene = [None for index in range(4)]								#we create an array to hold the Scene subcomponents so that we can get to them if we need them.
		for row in range(num_scenes):											#now we'll fill the array with different objects that were created when we called the SessionComponent() module
			self._scene[row] = self._session.scene(row)							#each session row is a SceneComponent
			self._scene[row].name = 'Scene_' + str(row)							#name it so we can access it in m4l
			for column in range(num_tracks):									#now we'll create holders and names for the contents of each scene
				clip_slot = self._scene[row].clip_slot(column)					#we use our assignment of the scene above to gain access to the individual clipslots.  Here, we are just assigning 'clip_slot' each time as a local variable so we can manipulated it's properties
				clip_slot.name = str(column) + '_Clip_Slot' + str(row)			#name it so that we can acces it in m4l
				clip_slot.set_triggered_to_play_value(CLIP_TRG_PLAY[self._rgb]) #set its triggered to play color
				clip_slot.set_triggered_to_record_value(CLIP_TRG_REC[self._rgb])#set its triggered to record color
				clip_slot.set_stopped_value(CLIP_STOP[self._rgb])				#set its stop color
				clip_slot.set_started_value(CLIP_STARTED[self._rgb])			#set its started color
				clip_slot.set_recording_value(CLIP_RECORDING[self._rgb])		#set its recording value
		self.set_highlighting_session_component(self._session)
		self._session.set_mixer(self._mixer)									#now we link the MixerComponent we created in _setup_mixer_control() to our session component so that they will follow each other when either is navigated
		self._session_zoom = SessionZoomingComponent(self._session)				#this creates the ZoomingComponent that allows navigation when the shift button is pressed
		self._session_zoom.name = 'Session_Overview'							#name it so we can access it in m4l
		self._session_zoom.set_stopped_value(ZOOM_STOPPED[self._rgb])			#set the zooms stopped color
		self._session_zoom.set_playing_value(ZOOM_PLAYING[self._rgb])			#set the zooms playing color
		self._session_zoom.set_selected_value(ZOOM_SELECTED[self._rgb])			#set the zooms selected color
		self._session_zoom.set_button_matrix(self._matrix)						#assign the ButtonMatrixElement that we created in _setup_controls() to the zooming component so that we can control it
		self._session_zoom.set_zoom_button(self._button[31])					#assign a shift button so that we can switch states between the SessionComponent and the SessionZoomingComponent
	

	"""this section is used so that we can reassign the color properties of each state.	 Legacy, from the OhmModes script, to support either RGB or Monochrome"""
	def _assign_session_colors(self):
		num_tracks = 4
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
	

	"""the device component allows us to assign encoders to the selected device in Live"""
	def _setup_device_control(self):
		self._device = DeviceComponent()			#create the device component
		self._device.name = 'Device_Component'		#name it so we can access it in m4l
		self._device._is_banking_enabled = self.device_is_banking_enabled(self._device)	 #we do this to defeat some undesirable behavior in the DeviceComponent which defeats banking if no controls are assigned
		#self._device.set_device = self._device_set_device(self._device)
		self._device.update = self._device_update(self._device)
		self._device.set_parameter_controls(tuple([self._encoder[index+4] for index in range(8)]))		#set its controls to the bottom 8 encoders;	 we use [index+4] to offset past the first 4 encoders
		self.set_device_component(self._device)		#assign our component to the control_surface main script;  this allows special updating, like being able to lock the devicecomponent to the currently selected device
		
		self._device_navigator = DeviceNavigator(self._device, self._mixer, self)
		self._device_navigator.name = 'Device_Navigator'
		
		#self._device_navigator = CntrlrDetailViewControllerComponent(self)		#this is a special component taken out of the APC scripts; its used to move from one device to another with the controller
		#self._device_navigator.name = 'Device_Navigator'					#name it so that we can access it in m4l
		self._device_selection_follows_track_selection = FOLLOW				#_device_selection_follows_track_selection is a property of the main ControlSurface script, and does what it says it does.	The FOLLOW variable is taken from CNTRLR_Map.py
	

	"""the device selector component allows the user to set buttons that will automatically select a device based on its name"""
	"""its not used in the stock CNTRLR script, but it could easily be assigned to any buttons using the correct syntax"""
	"""for more information, check out the documentation for the MonOhm script"""
	def _setup_device_selector(self):
		self._device_selector = DeviceSelectorComponent(self)
		self._device_selector.name = 'Device_Selector'
		self._device_selector.set_matrix(self._matrix)
	

	"""this method finds or creates a new modselector component and links to its instance"""
	def _setup_mod(self):
		self.monomodular = get_monomodular(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = CntrlrModHandler(self)
		self.modhandler.name = 'ModHandler' 
		self.modhandler.set_lock_button(self._encoder_button[1])
	

	"""since there are many different configurations possible with the modButtons, we'll need to create a ModeSelectorComponent"""
	"""to manage the different states of our controller"""
	def _setup_modes(self):
		self._shift_mode = ShiftModeComponent(self, self.shift_update)			#here we call a new component by passing this module and its shift_update method
		self._shift_mode.name = 'Mod_Mode'										#name it so we can access it
		self._shift_mode.set_mode_buttons([self._encoder_button[0], self._encoder_button[3]])		#set the mode buttons that we will use to change states
		self._alt_mode = ModesComponent()
		self._alt_mode.add_mode('alt', tuple([self._enable_alt, self._disable_alt]), behaviour = CancellableBehaviourWithRelease())
		self._alt_mode.set_mode_button('alt', self._encoder_button[2])
	

	def _enable_alt(self):
		self.modhandler.set_cntrlr_grid(None)
		for column in range(4): 
			for row in range(4):
				self._scene[row].clip_slot(column).set_launch_button(None)
		self._alt_enabled = True
		self._device_selector.set_enabled(True)
	

	def _disable_alt(self):
		self._alt_enabled = False
		self._device_selector.set_enabled(False)
		self.shift_update()
	

	"""cntrlr modes"""
	"""here we set up some methods that will be used to update the control assignments when we change between different modes"""
	

	"""this method is called everytime we change modes.	 If we make any assignments in the other mode assignment methods, we"""
	"""have to be sure to remove them in this function.	 This creates a 'blank slate' for all the CNTRLRs control elements"""
	def deassign_live_controls(self):

		"""THIS SECTION IS MISSING FROM THE ORIGINAL SCRIPT AND NEEDS TO BE FIXED...THE ASSIGNMENTS WERE MADE AT __init__"""
		for index in range(4):								
			self._mixer.channel_strip(index).set_volume_control(None)		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
		for index in range(2):
			self._mixer.return_strip(index).set_volume_control(None)	#assign the right faders to control the volume of our return strips
		self._mixer.master_strip().set_volume_control(None)					#assign the far right fader to control our master channel strip
		self._mixer.set_prehear_volume_control(None)							#assign the remaining fader to control our prehear volume of the the master channel strip

		for index in range(4):											#for the left side of the mixer
			self._mixer.channel_strip(index).set_solo_button(None)		#remove the solo button assignments
			self._mixer.channel_strip(index).set_arm_button(None)		#remove the arm button assignments
			self._mixer.channel_strip(index).set_mute_button(None)		#remove the mute button assignments
			self._mixer.channel_strip(index).set_select_button(None)	#remove the select button assignments
		for column in range(4): 
			for row in range(4):
				self._scene[row].clip_slot(column).set_launch_button(None)	#remove the clip launch assignments
		self._send_reset.set_buttons(tuple([None for index in range(4)]))	#remove the send_reset button assignments - this has to be sent as a tuple
		self._session.set_stop_track_clip_buttons(None)						#remove the clip_stop button assignments
		self._transport.set_play_button(None)								#remove the play button assignment
		self._transport.set_record_button(None)								#remove the record button assignment
		self._transport.set_stop_button(None)								#remove the stop button assignment
		for index in range(16):
			self._grid[index].set_on_off_values(127, 0)						#reset the on/off values of the grid buttons
			self._grid[index].reset()										#turn the buttons LEDs off
		for index in range(32):
			self._button[index].set_on_off_values(127, 0)					#reset the on/off values for the key buttons
			self._button[index].reset()										#turn the buttons LEDs off
			self._button[index].release_parameter()							#remove the parameter assignment that was assigned to the keys
		self._device_navigator.set_nav_buttons(None, None)			#remove the assignment of the device nav buttons
		self._device_navigator.set_chain_nav_buttons(None, None)
		self._device_navigator.set_shift_button(None)
		self._device_navigator.set_enabled(False)							#turn off the device navigator
		self._device.set_on_off_button(None)								#remove the assignment of the on/off button from the device component
		self._device.set_lock_button(None)									#remove the assignment of the lock button from the device component 
		self._device.set_bank_nav_buttons(None, None)						#remove the assignment of the navigation buttons from the device component
		self._device.set_enabled(False)										#turn off the device component
		self._session.set_track_bank_buttons(None, None)					#set the track bank buttons for the Session navigation controls
		self._session.set_scene_bank_buttons(None, None)					#set the scnee bank buttons for the Session navigation controls
		self._session.set_enabled(False)									#turn off the session component
		self._session_zoom.set_enabled(False)								#turn off the zoom component
		for index in range(16):
			self._grid[index].clear_send_cache()							#set the last_sent value of the grid to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(32):
			self._button[index].clear_send_cache()							#set the last_sent value of the keys to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(12):
			self._device._parameter_controls = None
			self._encoder[index].release_parameter()
			self._encoder[index].send_value(0, True)						#turn off all the encoder rings.  We send it the second argument, True, so that it is forced to update regardless of its last_sent property
			self._encoder[index].clear_send_cache()							#set the last_sent value of the encoder rings to -1, so that the next value it receives will always be transmitted to the CNTRLR
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)				#turn off all the encoder LEDs.	 We send it the second argument, True, so that it is forced to update regardless of its last_sent property
			self._encoder_button[index+4].clear_send_cache()				#set the last_sent value of the encoder LEDs to -1, so that the next value it receives will always be transmitted to the CNTRLR
		self._session_zoom.set_zoom_button(None)							#remove the assignment of the shift button from the ZoomingComponent
		self.request_rebuild_midi_map()										#now that we've finished deassigning all of our controls, we tell the main script to rebuild its MIDI map and update the values in Live
	

	"""this assigns the CNTRLR's controls on the main mode the CNTRLR script boots up in"""
	"""if you're trying to customize your layout, this is probably where you want to concentrate"""
	def assign_live_controls(self):
		"""the following lines update all of the controls' last_sent properties, so that they forward the next value they receive regardless of whether or not it is the same as the last it recieved"""
		"""we also reset the encoder rings and buttons, since the device component will not update them if it is not locked to a device in Live"""
		for index in range(16):
			self._grid[index].clear_send_cache()
		for index in range(32):
			self._button[index].clear_send_cache()
		for index in range(8):
			self._encoder_button[index+4].send_value(0, True)
			self._encoder_button[index+4].clear_send_cache()
		for index in range(8):
			self._encoder[index+4].send_value(0, True)
		for index in range(12):
			self._encoder[index].clear_send_cache()

		"""here we assign the left side of our mixer's buttons on the lower 32 keys"""
		for index in range(4):															#we set up a recursive loop to assign all four of our track channel strips' controls
			self._button[index].set_on_value(SOLO[self._rgb])							#set the solo color from the Map.py
			self._mixer.channel_strip(index).set_solo_button(self._button[index])		#assign the solo buttons to our mixer channel strips
			self._button[index+4].set_on_value(ARM[self._rgb])							#set the arm color from the Map.py
			self._mixer.channel_strip(index).set_arm_button(self._button[index+4])		#assign the arm buttons to our mixer channel strips
			self._button[index+16].set_on_value(MUTE[self._rgb])						#set the mute color from the Map.py
			self._mixer.channel_strip(index).set_mute_button(self._button[index+16])	#assign the mute buttons to our mixer channel strips
			self._button[index+20].set_on_value(SELECT[self._rgb])						#set the select color from the Map.py
			self._mixer.channel_strip(index).set_select_button(self._button[index+20])	#assign the select buttons to our mixer channel strips
		self._send_reset.set_buttons(tuple(self._button[index + 8] for index in range(4)))			#this is yet another way to quickly assign multiple elements conveniently in-place.	 We are creating a recursion inside an assignment.	The tuple() method creates an immutable array.	It can't be modified until it gets where it's going and is unpacked.
		self._session.set_stop_track_clip_buttons(tuple(self._button[index+24] for index in range(4)))	#these last two lines assign the send_reset buttons and the stop_clip buttons for each track
		for index in range(4):
			self._button[index+8].send_value(SEND_RESET[self._rgb], True)				#now we are going to send a message to turn the LEDs on for the send_reset buttons
			self._button[index + 24].set_on_off_values(STOP_CLIP[self._rgb], STOP_CLIP[self._rgb])	#this assigns the custom colors defined in the Map.py file to the stop_clip buttons.  They have seperate on/off values, but we assign them both the same value so we can always identify them
			self._button[index+24].send_value(STOP_CLIP[self._rgb], True)				#finally, we send the on/off colors out to turn the LEDs on for the stop clip buttons
		self._button[28].set_on_off_values(PLAY_ON[self._rgb], PLAY[self._rgb])			#assing the on/off colors for play.	 These are two seperate values, dependant upon whether play is engaged or not
		self._transport.set_play_button(self._button[28])								#set the transports play control to the corresponding button on the CNTRLR
		self._button[30].set_on_off_values(RECORD_ON[self._rgb], RECORD[self._rgb])		#set the on/off colors for the transport record buttons
		self._transport.set_record_button(self._button[30])								#assign the correct button for the transport record control
		self._button[29].set_on_value(STOP[self._rgb])									#set the on value for the Stop button
		self._transport.set_stop_button(self._button[29])								#assign the correct button for the transport stop control
		self._button[29].send_value(STOP_OFF[self._rgb], True)							#turn on the LED for the stop button
		for index in range(4):															#set up a for loop to generate an index for assigning the session nav buttons' colors
			self._button[index + 12].set_on_off_values(SESSION_NAV[self._rgb], SESSION_NAV_OFF[self._rgb])	#assign the colors from Map.py to the session nav buttons
		self._session.set_track_bank_buttons(self._button[15], self._button[14])		#set the track bank buttons for the Session navigation controls
		self._session.set_scene_bank_buttons(self._button[13], self._button[12])		#set the scnee bank buttons for the Session navigation controls

		"""this section assigns the grid to the clip launch functionality of the SessionComponent"""
		for column in range(4):															#we need to set up a double recursion so that we can generate the indexes needed to assign the grid buttons
			for row in range(4):														#the first recursion passes the column index, the second the row index
				self._scene[row].clip_slot(column).set_launch_button(self._grid[(row*4)+column])	#we use the indexes to grab the first the scene and then the clip we assigned above, and then we use them again to define the button held in the grid array that we want to assign to the clip slot from the session component

		"""this section assigns the faders and knobs"""
		for index in range(4):								
			self._mixer.channel_strip(index).set_volume_control(self._fader[index])		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
		for index in range(2):
			self._mixer.return_strip(index).set_volume_control(self._fader[index+4])	#assign the right faders to control the volume of our return strips
		self._mixer.master_strip().set_volume_control(self._fader[7])					#assign the far right fader to control our master channel strip
		self._mixer.set_prehear_volume_control(self._fader[6])							#assign the remaining fader to control our prehear volume of the the master channel strip
		for track in range(4):															#we set up a recursive loop to assign all four of our track channel strips' controls
			channel_strip_send_controls = []											#the channelstripcomponent requires that we pass the send controls in an array, so we create a local variable, channel_strip_send_controls, to hold them
			for control in range(2):													#since we are going to assign two controls to the sends, we create a recursion
				channel_strip_send_controls.append(self._dial_left[track + (control * 4)])		#then use the append __builtin__ method to add them to the array
			self._mixer.channel_strip(track).set_send_controls(tuple(channel_strip_send_controls))	#now that we have an array containing the send controls, we pass it to the channelstrip component with its set_send_controls() method
			self._mixer.channel_strip(track).set_pan_control(self._dial_left[track + 8])		#now we set the pan control to the bottom 
			self._mixer.track_eq(track).set_gain_controls(tuple([self._dial_right[track+8], self._dial_right[track+4], self._dial_right[track]]))	#here's another way of doing the same thing, but instead of creating the array before hand, we define it in-place.	Its probably bad coding to mix styles like this, but I'll leave it for those of you trying to figure this stuff out
			self._mixer.track_eq(track).set_enabled(True)								#turn the eq component on

		"""this section assigns the encoders and encoder buttons"""
		self._device.set_parameter_controls(tuple([self._encoder[index+4] for index in range(8)]))			#assign the encoders from the device component controls - we are doing this here b
		self._encoder_button[5].set_on_value(DEVICE_LOCK[self._rgb])					#set the on color for the Device lock encoder button
		self._device.set_lock_button(self._encoder_button[5])							#assign encoder button 7 to the device lock control
		self._encoder_button[4].set_on_value(DEVICE_ON[self._rgb])						#set the on color for the Device on/off encoder button 
		self._device.set_on_off_button(self._encoder_button[4])							#assing encoder button 4 to the device on/off control
		for index in range(2):															#setup a recursion to generate indexes so that we can reference the correct controls to assing to the device_navigator functions
			self._encoder_button[index + 8].set_on_value(DEVICE_NAV[self._rgb])			#assign the on color for the device navigator
			self._encoder_button[index + 10].set_on_value(DEVICE_NAV[self._rgb])		#assign the on color for the device bank controls
			self._encoder_button[index + 6].set_on_value(DEVICE_BANK[self._rgb])		#assign the on color for the device bank controls

		self._device_navigator.set_nav_buttons(self._encoder_button[8], self._encoder_button[9])	#set the device navigators controls to encoder buttons 10 and 11
		self._device_navigator.set_chain_nav_buttons(self._encoder_button[10], self._encoder_button[11])
		self._device_navigator.set_shift_button(self._button[31])
		self._device.set_bank_nav_buttons(self._encoder_button[6], self._encoder_button[7])		#set the device components bank nav controls to encoder buttons 8 and 9
		self._session_zoom.set_zoom_button(self._button[31])							#assign the lower right key button to the shift function of the Zoom component

		"""now we turn on and update some of the components we've just made assignments to"""
		self._device.set_enabled(True)													#enable the Device Component
		self._device_navigator.set_enabled(True)										#enable the Device Navigator
		self._session.set_enabled(True)													#enable the Session Component
		self._session_zoom.set_enabled(True)											#enable the Session Zoom
		self._device.update()															#tell the Device component to update its assingments so that it will detect the currently selected device parameters and display them on the encoder rings
		self._session.update()															#tell the Session component to update so that the grid will display the currently selected session region
	

	"""this method changes modes when we press a modButton.	 It is also called from Monomod when it needs to update the modDial assignments"""
	def shift_update(self):
		#self.log_message('shift_update')

		mode = self._shift_mode._mode_index

		self.deassign_live_controls()
		self.assign_alternate_mappings(0)
		self._device_selector.set_enabled(False)
		self.modhandler.set_cntrlr_encoder_grid(None)
		self.modhandler.set_cntrlr_encoder_button_grid(None)
		self.modhandler.set_cntrlr_grid(None)
		self.modhandler.set_cntrlr_keys(None)
		self.modhandler.set_mod_nav_buttons([None, None])
		self.modhandler.set_enabled(False)
		if mode is 0:
			self.assign_live_controls()
		elif mode is 1:
			self.assign_mixer_controls()
			self.modhandler.set_cntrlr_encoder_grid(self._dial_matrix)
			self.modhandler.set_cntrlr_encoder_button_grid(self._dial_button_matrix)
			self.modhandler.set_cntrlr_grid(self._matrix)
			self.modhandler.set_cntrlr_keys(self._key_matrix)
			self.modhandler.set_mod_nav_buttons([self._encoder_button[2], self._encoder_button[3]])
			self.modhandler.set_enabled(True)
		elif mode is 2:
			self.assign_alternate_mappings(1)
		for button in self._shift_mode._modes_buttons:
			button.send_value((self._shift_mode._modes_buttons.index(button) == (mode-1))*3, True)
	

	def assign_mixer_controls(self):
		for index in range(4):								
			self._mixer.channel_strip(index).set_volume_control(self._fader[index])		#Since we gave our mixer 4 tracks above, we'll now assign our fader controls to it						
		for index in range(2):
			self._mixer.return_strip(index).set_volume_control(self._fader[index+4])	#assign the right faders to control the volume of our return strips
		self._mixer.master_strip().set_volume_control(self._fader[7])					#assign the far right fader to control our master channel strip
		self._mixer.set_prehear_volume_control(self._fader[6])							#assign the remaining fader to control our prehear volume of the the master channel strip
	

	"""assign alternate mappings to the controls when a modSlot is selected that doesn't contain a mod"""
	def assign_alternate_mappings(self, chan):
		chan = min(16, max(chan, 0))
		for index in range(8):
			self._encoder_button[index + 4].set_channel(chan)		#set the contols channel to the methods second argument
			self._encoder_button[index + 4].set_enabled(chan is 0)	#if the channel is not 0, we need to disable the control so that it 
			self._encoder_button[index + 4].force_next_send()
		for encoder in self._encoder:								#is forwarded to Live, but not used by the script for internal processing
			encoder.set_channel(chan)
			encoder.set_enabled(chan is 0)
			encoder.force_next_send()
		for button in self._button:
			button.set_channel(chan)
			button.set_enabled(chan is 0)
			button.force_next_send()
		for cell in self._grid:
			cell.set_channel(chan)
			cell.set_enabled(chan is 0)
			cell.force_next_send()
		if FADER_BANKING:
			for fader in self._fader:
				fader.release_parameter()
				fader.set_channel(chan)
				fader.set_enabled(chan is 0)
				fader.force_next_send()
		if DIAL_BANKING:
			for dial in self._dial_right:
				dial.release_parameter()
				dial.set_channel(chan)
				dial.set_enabled(chan is 0)
				dial.force_next_send()
			for dial in self._dial_left:
				dial.release_parameter()
				dial.set_channel(chan)
				dial.set_enabled(chan is 0)
				dial.force_next_send()

		self.request_rebuild_midi_map()
			
	

	"""reassign the original channel and identifier to all the controls that can be remapped through assign_alternate_mappings"""
	def assign_original_mappings(self):
		for index in range(8):
			self._encoder_button[index + 4].set_channel(self._encoder_button[index + 4]._original_channel)
			self._encoder_button[index + 4].set_enabled(True)
			self._encoder_button[index + 4].force_next_send()
		for encoder in self._encoder:
			encoder.set_channel(encoder._original_channel)
			encoder.set_enabled(True)
			encoder.force_next_send()
		for button in self._button:
			button.set_channel(button._original_channel)
			button.set_enabled(True)
			button.force_next_send()
		for cell in self._grid:
			cell.set_channel(cell._original_channel)
			cell.set_enabled(True)
			cell.force_next_send()	
		if FADER_BANKING:
			for fader in self._fader:
				fader.set_channel(fader._original_channel)
				fader.set_enabled(True)
				fader.force_next_send()
		if DIAL_BANKING:
			for dial in self._dial_right:
				dial.set_channel(dial._original_channel)
				dial.set_enabled(True)
				dial.force_next_send()
			for dial in self._dial_left:
				dial.set_channel(dial._original_channel)
				dial.set_enabled(True)
				dial.force_next_send()
		self.request_rebuild_midi_map()
	

	"""called on timer"""
	def update_display(self):
		super(Cntrlr, self).update_display()		#since we are overriding this from the inherited method, we need to call the original routine as well
		self._timer = (self._timer + 1) % 256	#each 100/60ms, increase the self._timer property by one.  Start over at 0 when we hit 256
		self.modhandler.send_ring_leds()	#if local rings are turned off, then we need to send the new values if they've changed			
		self.flash()							#call the flash method below
	

	def flash(self):
		if(self.flash_status > 0):
			for control in self.controls:
				if isinstance(control, MonoButtonElement):
					control.flash(self._timer)		
	


	"""m4l bridge"""

	"""this is a method taken and modified from the MackieControl scripts"""
	"""it takes a display string and modifies it to be a specified length"""
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
		ret = ret.replace(' ', '_')
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	"""this method forwards display information from control elements to the LCD patch"""
	def notification_to_bridge(self, name, value, sender):
		if(isinstance(sender, (MonoEncoderElement, CodecEncoderElement))):
			pn = str(self.generate_strip_string(name))
			pv = str(self.generate_strip_string(value))
			self._monobridge._send(sender.name, 'lcd_name', pn)
			self._monobridge._send(sender.name, 'lcd_value', pv)
	

	"""this method regulates parameter values from being sent on updates if the control has not actually been changed"""
	def touched(self):
		if self._touched is 0:
			self._monobridge._send('touch', 'on')
			self.schedule_message(2, self.check_touch)
		self._touched +=1
	

	"""this method is called by the LCD patch to determine whether any controls have been changed"""
	def check_touch(self):
		if self._touched > 5:
			self._touched = 5
		elif self._touched > 0:
			self._touched -= 1
		if self._touched is 0:
			self._monobridge._send('touch', 'off')
		else:
			self.schedule_message(2, self.check_touch)
	


	"""midi functionality"""

	"""this method needs to be here so that Live knows what to do (nothing, in this case) when it receives sysex from the CNTRLR"""
	def handle_sysex(self, midi_bytes):
		pass
	

	"""general functionality"""
	
	"""this method is called by Live when it needs to disconnect.  It's very important that any observers that were set up in the script are removed here"""
	def disconnect(self):
		"""clean things up on disconnect"""
		if self.song().view.selected_track_has_listener(self._update_selected_device):
			self.song().view.remove_selected_track_listener(self._update_selected_device)
		self.log_message("<<<<<<<<<<<<<<<<<<<<<<<<< " + str(self._host_name) + " log closed >>>>>>>>>>>>>>>>>>>>>>>>>") #Create entry in log file
		super(Cntrlr, self).disconnect()
		rebuild_sys()
	

	def restart_monomodular(self):
		#self.log_message('restart monomodular')
		self.modhandler.disconnect()
		with self.component_guard():
			self._setup_mod()
	

	def connect_script_instances(self, instanciated_scripts):
		#self.log_message('connect script instances')
		pass
	

	"""this provides a hook that can be called from m4l to change the DeviceComponent's behavior"""
	def device_follows_track(self, val):
		self._device_selection_follows_track_selection = (val == 1)
		return self
	

	"""this is a customizationo of the inherited behavior of ControlSurface"""
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
	

	"""this provides a hook to get the current tracks length from other modules"""
	def _get_num_tracks(self):
		return self.num_tracks
	


	"""device component methods and overrides"""

	"""this closure replaces the default DeviceComponent update() method without requiring us to build an override class"""
	"""it calls the _update_selected_device method of this script in addition to its normal routine"""
	"""it also ensures a rebuilt midi_map; for some reason the Abe's pulled that part out of the post 8.22 scripts, and under certain circumstances"""
	"""things don't work as expected anymore."""
	def _device_update(self, device):
		def _update():
			#for client in self._client:
			#	if (device._device != None) and (client.device == device._device):
			#		device._bank_index = max(client._device_component._cntrl_offset, device._bank_index)
			DeviceComponent.update(device)
			self.request_rebuild_midi_map()
		return _update
		
	

	def _device_set_device(self, device_component):
		def set_device(device):
			is_monodevice = False
			for client in self._client:
				if (device != None) and (client.device == device):
					is_monodevice = client
			if is_monodevice != False:
				#device = client._device_component._device
				self.log_message('is monodevice' + str(device.name))
				assert ((device == None) or isinstance(device, Live.Device.Device))
				if ((not device_component._locked_to_device) and (device != device_component._device)):
					if (device_component._device != None):
						device_component._device.remove_name_listener(device_component._on_device_name_changed)
						device_component._device.remove_parameters_listener(device_component._on_parameters_changed)
						parameter = device_component._on_off_parameter()
						if (parameter != None):
							parameter.remove_value_listener(device_component._on_on_off_changed)
						if (device_component._parameter_controls != None):
							for control in device_component._parameter_controls:
								control.release_parameter()
					device_component._device = device
					if (device_component._device != None):
						device_component._bank_index = 0
						device_component._device.add_name_listener(self._on_device_name_changed)
						device_component._device.add_parameters_listener(self._on_parameters_changed)
						parameter = device_component._on_off_parameter()
						if (parameter != None):
							parameter.add_value_listener(device_component._on_on_off_changed)
					for key in device_component._device_bank_registry.keys():
						if (key == device_component._device):
							device_component._bank_index = device_component._device_bank_registry.get(key, 0)
							del device_component._device_bank_registry[key]
							break
					device_component._bank_name = '<No Bank>' #added
					device_component._bank_index = max(is_monodevice._cntrl_offset, device_component._bank_index)
					device_component._on_device_name_changed()
					device_component.update()	 
			else:
				DeviceComponent.set_device(device_component, device)
		return set_device
		
	

	"""this closure replaces the default ChannelStripComponent _on_cf_assign_changed() method without requiring us to build an override class"""
	"""it allows us to change different colors to its assigned controls based on the crossfade assignment, which the default _Framework doesn't support"""
	def mixer_on_cf_assign_changed(self, channel_strip):
		def _on_cf_assign_changed():
			if (channel_strip.is_enabled() and (channel_strip._crossfade_toggle != None)):
				if (channel_strip._track != None) and (channel_strip._track in (channel_strip.song().tracks + channel_strip.song().return_tracks)):
					if channel_strip._track.mixer_device.crossfade_assign == 1: #modified
						channel_strip._crossfade_toggle.turn_off()
					elif channel_strip._track.mixer_device.crossfade_assign == 0:
						channel_strip._crossfade_toggle.send_value(1)
					else:
						channel_strip._crossfade_toggle.send_value(2)
		return _on_cf_assign_changed
		
	

	"""a closure fix for banking when we deassign the bank buttons and still want to change bank indexes"""
	def device_is_banking_enabled(self, device):
		def _is_banking_enabled():
			return True
		return _is_banking_enabled
		
	


class CntrlrModHandler(ModHandler):


	def __init__(self, *a, **k):
		self._local = True
		self._last_sent_leds = 1
		self._cntrlr_grid = None
		self._cntrlr_encoder_grid = None
		self._cntrlr_keys = None
		addresses = {'cntrlr_grid': {'obj':Grid('cntrlr_grid', 4, 4), 'method':self._receive_cntrlr_grid},
					'cntrlr_encoder_grid': {'obj':RingedGrid('cntrlr_encoder_grid', 4, 3), 'method':self._receive_cntrlr_encoder_grid},
					'cntrlr_encoder_button_grid': {'obj':Grid('cntrlr_encoder_button_grid', 4, 2), 'method':self._receive_cntrlr_encoder_button_grid},
					'cntrlr_key': {'obj':  Grid('cntrlr_key', 16, 2), 'method': self._receive_cntrlr_key}}
		super(CntrlrModHandler, self).__init__(addresses = addresses, *a, **k)
		self._color_type = 'RGB'
	

		#'cntrlr_encoder_grid_relative': {'obj':StoredElement(_name = 'cntrlr_encoder_grid_relative'), 'method':self._receive_cntrlr_encoder_grid_relative},
		#'cntrlr_encoder_grid_local': {'obj':StoredElement(_name = 'cntrlr_encoder_grid_local'), 'method':self._receive_cntrlr_encoder_grid_local},

	def _receive_cntrlr_grid(self, x, y, value, *a, **k):
		#self.log_message('_receive_cntrlr_grid: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self.is_enabled() and self._active_mod and not self._active_mod.legacy and not self._cntrlr_grid is None and x < 4 and y < 4:
			self._cntrlr_grid.send_value(x, y, self._colors[value], True)
	

	def _receive_cntrlr_encoder_grid(self, x, y, *a, **k):
		#self.log_message('_receive_cntrlr_encoder_grid: %(x)s %(y)s %(k)s' % {'x':x, 'y':y, 'k':k})
		if self.is_enabled() and self._active_mod and not self._cntrlr_encoder_grid is None and x < 4 and y < 3:
			keys = k.keys()
			if 'value' in keys:
				if self._local:
					self._cntrlr_encoder_grid.send_value(x, y, k['value'], True)
				else:
					self._cntrlr_encoder_grid.get_button(x, y)._ring_value = k['value']
			if 'mode' in keys:
				self._cntrlr_encoder_grid.get_button(x, y).set_mode(k['mode'])
			if 'green' in keys:
				self._cntrlr_encoder_grid.get_button(x, y).set_green(k['green'])
			if 'custom' in keys:
				self._cntrlr_encoder_grid.get_button(x, y).set_custom(k['custom'])
	

	def _receive_cntrlr_encoder_button_grid(self, x, y, value, *a, **k):
		if self.is_enabled() and self._active_mod:
			if not self._cntrlr_encoder_button_grid is None:
				self._cntrlr_encoder_button_grid.send_value(x, y, self._colors[value], True)
	

	def _receive_cntrlr_encoder_grid_relative(self, value, *a):
		#self.log_message('_receive_cntrlr_encoder_grid_relative: %(v)s' % {'v':value})
		if self.is_enabled() and self._active_mod:
			value and self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 127, 127, 127, 127, 127, 127, 127, 127, 247])) or self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 247]))
	

	def _receive_cntrlr_encoder_grid_local(self, value, *a):
		#self.log_message('_receive_cntrlr_encoder_grid_local: %(v)s' % {'v':value})
		if self.is_enabled() and self._active_mod:
			self.clear_rings()
			self._local = value
			value and self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 72, 247])) or self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 64, 247]))
	

	def _receive_cntrlr_key(self, x, y=0, value=0, *a):
		#self.log_message('_receive_cntrlr_key: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self.is_enabled() and self._active_mod and not self._active_mod.legacy:
			if not self._cntrlr_keys is None:
				self._cntrlr_keys.send_value(x, y, self._colors[value], True)
	

	def _receive_grid(self, x, y, value, *a, **k):
		if self.is_enabled() and self._active_mod and self._active_mod.legacy:
			if not self._cntrlr_grid is None:
				if (x - self.x_offset) in range(4) and (y - self.y_offset) in range(4):
					self._cntrlr_grid.send_value(x - self.x_offset, y - self.y_offset, self._colors[value], True)
	


	def set_cntrlr_grid(self, grid):
		self._cntrlr_grid = grid
		self._cntrlr_grid_value.subject = self._cntrlr_grid
	

	def set_cntrlr_encoder_grid(self, grid):
		self._cntrlr_encoder_grid = grid
		self._cntrlr_encoder_grid_value.subject = self._cntrlr_encoder_grid
		self.set_parameter_controls(grid)
		#self.log_message('parameter controls are: ' + str(self._parameter_controls))
	

	def set_cntrlr_encoder_button_grid(self, buttons):
		self._cntrlr_encoder_button_grid = buttons
		self._cntrlr_encoder_button_grid_value.subject = self._cntrlr_encoder_button_grid
	

	def set_cntrlr_keys(self, keys):
		self._cntrlr_keys = keys
		self._cntrlr_keys_value.subject = self._cntrlr_keys
	


	@subject_slot('value')
	def _cntrlr_keys_value(self, value, x, y, *a, **k):
		#self.log_message('_cntrlr_keys_value: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self._active_mod:
			self._active_mod.send('cntrlr_key', x, y, value)
	

	@subject_slot('value')
	def _cntrlr_grid_value(self, value, x, y, *a, **k):
		#self.log_message('_cntrlr_grid_value: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self._active_mod:
			if self._active_mod.legacy:
				self._active_mod.send('grid', x + self.x_offset, y + self.y_offset, value)
			else:
				self._active_mod.send('cntrlr_grid', x, y, value)
	

	@subject_slot('value')
	def _cntrlr_encoder_grid_value(self, value, x, y, *a, **k):
		#self.log_message('_cntrlr_encoder_grid_value: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self._active_mod:
			self._active_mod.send('cntrlr_encoder_grid', x, y, value)
	

	@subject_slot('value')
	def _cntrlr_encoder_button_grid_value(self, value, x, y, *a, **k):
		#self.log_message('_cntrlr_encoder_button_grid_value: %(x)s %(y)s %(value)s ' % {'x':x, 'y':y, 'value':value})
		if self._active_mod:
			self._active_mod.send('cntrlr_encoder_button_grid', x, y, value)
	


	def _display_nav_box(self):
		if self._cntrlr_grid_value.subject:
			if self._shift_value.subject and self._shift_value.subject.is_pressed():
				for column in range(4):
					for row in range(4):
						if (column == int(self.x_offset/4)) and (row == int(self.y_offset/4)):
							self._cntrlr_grid_value.subject.get_button(column, row).send_value(self.navbox_selected)
						else:
							self._cntrlr_grid_value.subject.get_button(column, row).send_value(self.navbox_unselected)
	

	def update(self, *a, **k):
		mod = self.active_mod()
		#self.log_message('modhandler update: ' + str(mod))
		if self.is_enabled() and not mod is None:
			mod.restore()
			if mod.legacy:
				self._shift_value.subject and self._shift_value.subject.is_pressed() and self._display_nav_box()
		else:
			#self._script.log_message('disabling modhandler')
			self._script._send_midi(tuple([240, 0, 1, 97, 8, 17, 0, 0, 0, 0, 0, 0, 0, 0, 247]))
			self._script._send_midi(tuple([240, 0, 1, 97, 8, 8, 72, 247]))
			if not self._cntrlr_grid_value.subject is None:
				self._cntrlr_grid_value.subject.reset()
			if not self._cntrlr_encoder_grid_value.subject is None:
				self._cntrlr_encoder_grid_value.subject.reset()
			if not self._cntrlr_encoder_button_grid_value.subject is None:
				self._cntrlr_encoder_button_grid_value.subject.reset()
			if not self._keys_value.subject is None:
				self._keys_value.subject.reset()
		if not self._on_lock_value.subject is None:
			self._on_lock_value.subject.send_value((not mod is None) + ((not mod is None) and self.is_locked() * 4))
	

	def send_ring_leds(self):
		if self.is_enabled() and self._active_mod and not self._local and self._cntrlr_encoder_grid:
			leds = [240, 0, 1, 97, 8, 31]
			for encoder, coords in self._cntrlr_encoder_grid.iterbuttons():
				bytes = encoder._get_ring()
				leds.append(bytes[0])
				leds.append(int(bytes[1]) + int(bytes[2]))
			leds.append(247)
			if not leds==self._last_sent_leds:
				self._script._send_midi(tuple(leds))
				self._last_sent_leds = leds
	

	def clear_rings(self):
		self._last_sent_leds = 1
	

#	a