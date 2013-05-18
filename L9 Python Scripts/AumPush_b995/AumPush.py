# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
from contextlib import contextmanager
from functools import partial
from itertools import izip, chain
from _Framework.Dependency import inject
from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import MIDI_CC_TYPE, MIDI_NOTE_TYPE, MIDI_CC_STATUS, MIDI_NOTE_ON_STATUS
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModesComponent import AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin
from _Framework.SysexValueControl import SysexValueControl
from _Framework.Layer import Layer
from _Framework.Resource import PrioritizedResource
from _Framework.DeviceBankRegistry import DeviceBankRegistry
from _Framework.SubjectSlot import subject_slot, subject_slot_group
from _Framework.Util import find_if, clamp, nop, mixin, const
from _Framework import Defaults
from _Framework import Task
from Push.Push import Push
from Push.OptionalElement import OptionalElement
from Push.ComboElement import ComboElement
from Push.HandshakeComponent import HandshakeComponent, make_dongle_message
from Push.ValueComponent import ValueComponent, ParameterValueComponent, ValueDisplayComponent, ParameterValueDisplayComponent
from Push.ConfigurableButtonElement import ConfigurableButtonElement
from Push.SpecialSessionComponent import SpecialSessionComponent, SpecialSessionZoomingComponent
from Push.SpecialMixerComponent import SpecialMixerComponent
from Push.SpecialTransportComponent import SpecialTransportComponent
from Push.SpecialPhysicalDisplay import SpecialPhysicalDisplay
from Push.InstrumentComponent import InstrumentComponent
from Push.StepSeqComponent import StepSeqComponent
from Push.LoopSelectorComponent import LoopSelectorComponent
from Push.ViewControlComponent import ViewControlComponent
from Push.ClipControlComponent import ClipControlComponent
from Push.DisplayingDeviceComponent import DisplayingDeviceComponent
from Push.DeviceNavigationComponent import DeviceNavigationComponent
from Push.SessionRecordingComponent import SessionRecordingComponent
from Push.NoteRepeatComponent import NoteRepeatComponent
from Push.ClipCreator import ClipCreator
from Push.MatrixMaps import PAD_TRANSLATIONS, FEEDBACK_CHANNELS
from Push.BackgroundComponent import BackgroundComponent, ModifierBackgroundComponent
from Push.BrowserComponent import BrowserComponent
from Push.BrowserModes import BrowserHotswapMode
from Push.Actions import CreateInstrumentTrackComponent, CreateDefaultTrackComponent, CaptureAndInsertSceneComponent, DuplicateLoopComponent, SelectComponent, DeleteComponent, DeleteSelectedClipComponent, DeleteSelectedSceneComponent, CreateDeviceComponent
from Push.M4LInterfaceComponent import M4LInterfaceComponent
from Push.UserSettingsComponent import UserComponent
from Push.MessageBoxComponent import DialogComponent, NotificationComponent
from Push.TouchEncoderElement import TouchEncoderElement
from Push.TouchStripElement import TouchStripElement
from Push.TouchStripController import TouchStripControllerComponent, TouchStripEncoderConnection
from Push.Selection import L9CSelection
from Push.AccentComponent import AccentComponent
from Push.AutoArmComponent import AutoArmComponent
#from Push.PadSensitivity import PadSensitivity

from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.ModDevices import *

from Push.consts import *


class AumPush(Push):


	def __init__(self, c_instance):
		self._monomod_version = 'b995'
		self._host_name = 'MonOhm'
		self._color_type = 'Push'
		self.hosts = []
		super(AumPush, self).__init__(c_instance)
		with self.component_guard():
			self._device._alt_pressed = False
			self._host.set_device_component(self._device)
			self._device.add_device_listener(self._on_new_device_set)
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
	

	def _setup_mod(self):
		self._host = PushMonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self._host._host_name = 'AumPush'
		self._host.layer = Layer( button_matrix = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, key_buttons = self._track_state_buttons) #, nav_up_button = OptionalElement( self._nav_up_button, self._host._alt_pressed, False), nav_down_button = OptionalElement( self._nav_down_button, self._host._alt_pressed, False), nav_left_button = OptionalElement( self._nav_left_button, self._host._alt_pressed, False), nav_right_button = OptionalElement( self._nav_right_button, self._host._alt_pressed, False)) #name_display_line=self._display_line1, value_display_line=self._display_line2, alternating_display=self._display_line3, device_controls = self._global_param_controls, encoder_touch_buttons=self._global_param_touch_buttons, lcd_displays = self._display_line1)
		self._host.layer.priority = 4
		self._host.nav_buttons_layer = AddLayerMode( self._host, Layer(nav_up_button = self._nav_up_button, nav_down_button = self._nav_down_button, nav_left_button = self._nav_left_button, nav_right_button = self._nav_right_button) )
		self.hosts = [self._host]
	

	def _init_matrix_modes(self):
		super(AumPush, self)._init_matrix_modes()
		self._setup_mod()
		self._note_modes.add_mode('mod', self._host)
		self._note_modes.add_mode('looperhack', self._audio_loop)
	

	def _init_device(self, *a, **k):
		super(AumPush, self)._init_device(*a, **k)
		self._device._current_bank_details = self._make_current_bank_details(self._device)

	

	def _on_new_device_set(self):
		self._select_note_mode()
	

	def _select_note_mode(self, mod_device = None):
		track = self.song().view.selected_track
		current_device = self._device._device
		if not current_device is None:
			if self._host and self._host._client:
				for client in self._host._client:
					self.log_message('cur device: ' + str(current_device) + ' client: ' + str(client.device) + ' ' + str(mod_device))
					if client.device == current_device:
						mod_device = client.device
						break
		drum_device = find_if(lambda d: d.can_have_drum_pads, track.devices)
		self._step_sequencer.set_drum_group_device(drum_device)
		if track == None or track.is_foldable or track in self.song().return_tracks or track == self.song().master_track:
			self._note_modes.selected_mode = 'disabled'
		elif not mod_device is None:
			if not self._host._active_client.device is current_device:
				self._host._select_client(self._host._client.index(client))
			self._note_modes.selected_mode = 'disabled'
			self._note_modes.selected_mode = 'mod'
		elif track and track.has_audio_input:
			self._note_modes.selected_mode = 'looperhack'
		elif drum_device:
			self._note_modes.selected_mode = 'sequencer'
		else:
			self._note_modes.selected_mode = 'instrument'
	

	def disconnect(self):
		super(AumPush, self).disconnect()
	

	def _make_current_bank_details(self, device_component):
		def _current_bank_details():
			if self._is_mod(device_component.device()):
				if self._host._active_client._device_component._device_parent != None:
					bank_name = self._host._active_client._device_component._bank_name
					bank = [param._parameter for param in self._host._active_client._device_component._params]
					if device_component._alt_pressed is True:
						bank = bank[8:]
					self.log_message('current mod bank details: ' + str(bank_name) + ' ' + str(bank))
					return (bank_name, bank)
				else:
					return DisplayingDeviceComponent._current_bank_details(device_component)
			else:
				return DisplayingDeviceComponent._current_bank_details(device_component)
		return _current_bank_details
		
	

	def _is_mod(self, device):
		mod_device = False
		if not device is None:
			if self._host and self._host._client:
				for client in self._host._client:
					#self.log_message('cur device: ' + str(current_device) + ' client: ' + str(client.device))
					if client.device == device:
						mod_device = True
						break
		return mod_device
	



class PushMonomodComponent(MonomodComponent):


	def __init__(self, *a, **k):
		super(PushMonomodComponent, self).__init__(*a, **k)
		self._buttons = None
		self._shift = None
		self._nav_up_button = None
		self._nav_down_button = None
		self._nav_right_button = None
		self._nav_left_button = None
		self._nav_locked = False
		self.nav_buttons_layer = None
		self.is_push = True
		self._device_component = None
		for index in range(16):
			self._color_maps[index][1:8] = [3, 85, 33, 95, 5, 21, 67]
			self._color_maps[index][127] = 67
	

	def set_device_component(self, device_component):
		if not device_component is self._device_component:
			self._device_component = device_component
			#self._device_component.udpate()
	

	def _notify_new_connection(self, device):
		self._script._select_note_mode(device)
	

	def udpate(self):
		super(PushMonomodComponent, self).update()
		if (self.is_enabled()) and (self._active_client != None):
			self._active_client._device_component.update()
		if not self.device_component is None:
			self._device_component.update()
	

	def select_active_client(self):
		if not self._active_client.linked_device() is None:
			super(PushMonomodComponent, self).select_active_client()
	

	def set_button_matrix(self, buttons):
		self._set_button_matrix(buttons)
	

	def set_shift_button(self, button):
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = button
		if self._shift_button != None:
			self._shift_button.add_value_listener(self._shift_value)
	

	def set_alt_button(self, button):
		if self._alt_button != None:
			self._alt_button.remove_value_listener(self._alt_value)
		self._alt_button = button
		if self._alt_button != None:
			self._alt_button.add_value_listener(self._alt_value)
	

	def _alt_value(self, value):
		super(PushMonomodComponent, self)._alt_value(value)
		self._script.log_message('alt value ' + str(value))
		if self._shift_pressed > 0 and value > 0:
			self._nav_locked = not self._nav_locked
			self._script.log_message('nav_locked ' + str(self._nav_locked))
			self.set_nav_buttons()
		self._device_component._alt_pressed = (value > 0)
		self._device_component.update()
	

	def set_nav_up_button(self, button):
		self._nav_up_button = button
		#self.set_nav_buttons()
	

	def set_nav_down_button(self, button):
		self._nav_down_button = button
		#self.set_nav_buttons()
	

	def set_nav_left_button(self, button):
		self._nav_left_button = button
		#self.set_nav_buttons()
	

	def set_nav_right_button(self, button):
		self._nav_right_button = button
		#self.set_nav_buttons()
	

	def set_nav_buttons(self):
		self._script.log_message('set nav buttons ' + str(self._nav_locked))
		if self.nav_buttons_layer:
			if self._nav_locked:
				self.nav_buttons_layer.enter_mode()
			else:
				self.nav_buttons_layer.leave_mode()
		nav_buttons = [self._nav_up_button, self._nav_down_button, self._nav_left_button, self._nav_right_button]
		if not None in nav_buttons and self._nav_locked:
			self._set_nav_buttons(nav_buttons)
		else:
			self._set_nav_buttons(None)
	

	def _set_nav_buttons(self, buttons):
		if self._nav_buttons != None:
			self._nav_buttons[0].remove_value_listener(self._nav_up_value)
			self._nav_buttons[1].remove_value_listener(self._nav_down_value)
			self._nav_buttons[2].remove_value_listener(self._nav_left_value)
			self._nav_buttons[3].remove_value_listener(self._nav_right_value)
		self._nav_buttons = buttons
		if buttons != None:
			assert len(buttons) == 4	
			self._nav_buttons[0].add_value_listener(self._nav_up_value)	
			self._nav_buttons[1].add_value_listener(self._nav_down_value)	
			self._nav_buttons[2].add_value_listener(self._nav_left_value)
			self._nav_buttons[3].add_value_listener(self._nav_right_value)	
	

	def set_device_controls(self, controls):
		if controls != self._device_controls:
			self._device_controls = controls
			if self._client != None:
				if not controls is None:
				#elf._on_device_control_value.subject = self._device_controls
					self._set_parameter_controls([control for control in controls])
				else:
					self._set_parameter_controls(None)
	

	def set_key_buttons(self, buttons):
		key_buttons = None
		if isinstance(buttons, ButtonMatrixElement):
			key_buttons = tuple([button for button in buttons])
		self._set_key_buttons(key_buttons)
	

	def set_lcd_displays(self, lcds):
		if lcds != self._lcd_displays:
			self._lcd_displays = lcds
	

	def _send_to_lcd(self, column, row, wheel):
		#self._script.log_message('send lcd ' + str(column) + ' ' + str(row) + ' ' + str(wheel['pn']))
		if self.is_enabled() and not self._active_client._device_component.is_enabled():
			#self._script.notification_to_bridge(str(wheel['pn']), str(wheel['pv']), self._dial_matrix.get_dial(column, row))
			self._script.log_message(str(wheel['pn']) + ' ' + str(wheel['pv']) + ' ' + str(self._dial_matrix.get_dial(column, row)))
	





#a