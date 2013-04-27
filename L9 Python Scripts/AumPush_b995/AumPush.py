# by amounra 0413 : http://www.aumhaa.com

#from __future__ import with_statement
#import Live
#from contextlib import contextmanager
#from functools import partial
#from itertools import izip

from __future__ import with_statement
import Live
from contextlib import contextmanager
from functools import partial
from itertools import izip
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
from Push.ValueComponent import ValueComponent, ParameterValueComponent
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
from Push.PadSensitivity import PadSensitivity

#from _Framework.SubjectSlot import subject_slot
#from _Framework.CompoundComponent import CompoundComponent
#from _Framework.ButtonElement import ButtonElement
#from _Framework.ModesComponent import AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin
#from _Framework.Layer import Layer
#from _Framework.Util import find_if, clamp, nop, mixin, const, monkeypatch

#from Push.AutoArmComponent import AutoArmComponent
#from Push.Push import Push

from _Mono_Framework.MonomodComponent import MonomodComponent

#import Push.Skin
#import consts
#import Colors
#import Push.Sysex
#import Settings

#GLOBAL_MAP_MODE = Live.MidiMap.MapMode.relative_smooth_two_compliment

class AumPush(Push):


	def __init__(self, c_instance):
		self._monomod_version = 'b995'
		self._host_name = 'MonOhm'
		self._color_type = 'Push'
		self.hosts = []
		super(AumPush, self).__init__(c_instance)
		self._device.add_device_listener(self._on_new_device_set)
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
	

	def _setup_mod(self):
		self._host = PushMonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self._host._host_name = 'AumPush'
		#self._mod.set_button_matrix(self._matrix)
		self._host.layer = Layer( button_matrix = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, nav_up_button = self._nav_up_button, nav_down_button = self._nav_down_button, nav_left_button = self._nav_left_button, nav_right_button = self._nav_right_button) #  device_controls = self._global_param_controls, lcd_displays = self._display_line1)
		self.hosts = [self._host]
	


	def _init_matrix_modes(self):
		super(AumPush, self)._init_matrix_modes()
		self._setup_mod()
		self._note_modes.add_mode('mod', self._host)
		self._note_modes.add_mode('looperhack', self._audio_loop)
	

	def _on_new_device_set(self):
		self._select_note_mode()
	

	def _select_note_mode(self):
		track = self.song().view.selected_track
		mod_device = False
		current_device = self._device._device
		if not current_device is None:
			if self._host and self._host._client:
				for client in self._host._client:
					#self.log_message('cur device: ' + str(current_device) + ' client: ' + str(client.device))
					if client.device == current_device:
						mod_device = True
						break
		drum_device = find_if(lambda d: d.can_have_drum_pads, track.devices)
		self._step_sequencer.set_drum_group_device(drum_device)
		if track == None or track.is_foldable or track in self.song().return_tracks or track == self.song().master_track:
			self._note_modes.selected_mode = 'disabled'
		elif mod_device is True:
			#self.log_message('found mod device')
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
	

class PushMonomodComponent(MonomodComponent):


	def __init__(self, *a, **k):
		super(PushMonomodComponent, self).__init__(*a, **k)
		self._buttons = None
		self._shift = None
		self._device_controls = None
		self._lcd_displays = None
		self._nav_up_button = None
		self._nav_down_button = None
		self._nav_right_button = None
		self._nav_left_button = None
	

	def udpate(self):
		super(PushMonomodComponent, self).update()
		self._script.schedule_message(3, self._select_note_mode)
	

	def select_active_client(self):
		if not self._active_client.linked_device() is None:
			super(PushMonomodComponent, self).select_active_client()
	

	def set_button_matrix(self, buttons):
		#self._script.log_message('set matrix ' + str(buttons))
		#if buttons != self._buttons:
		#	self._buttons = buttons
		#	self._on_matrix_value.subject = self._buttons
		#	if self._client != None:
		#		self._set_button_matrix(buttons)
				#self.update()
		self._set_button_matrix(buttons)
	

	def set_shift_button(self, button):
		#if button != self._shift:
			#self._shift = button
			#self._on_shift_value.subject = self._shift
			#if self._client != None:
			#	self._set_shift_button(button)
			#	#self.update()
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
			#self._alt_button.set_on_off_values(8, 0)
			self._alt_button.add_value_listener(self._alt_value)
	

	def _alt_value(self, value):
		super(PushMonomodComponent, self)._alt_value(value)
		if self._shift_pressed > 0 and value > 0:
			self._locked = not self._locked
			self.update()
	

	def set_nav_up_button(self, button):
		self._nav_up_button = button
		self.set_nav_buttons()
	

	def set_nav_down_button(self, button):
		self._nav_down_button = button
		self.set_nav_buttons()
	

	def set_nav_left_button(self, button):
		self._nav_left_button = button
		self.set_nav_buttons()
	

	def set_nav_right_button(self, button):
		self._nav_right_button = button
		self.set_nav_buttons()
	

	def set_nav_buttons(self):
		nav_buttons = [self._nav_up_button, self._nav_down_button, self._nav_left_button, self._nav_right_button]
		if not None in nav_buttons:
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
	

	def set_lcd_displays(self, lcds):
		if lcds != self._lcd_displays:
			self._lcd_displays = lcds
	
	
	def _send_to_lcd(self, column, row, wheel):
		#self._script.log_message('send lcd ' + str(column) + ' ' + str(row) + ' ' + str(wheel['pn']))
		if self.is_enabled() and not self._active_client._device_component.is_enabled():
			#self._script.notification_to_bridge(str(wheel['pn']), str(wheel['pv']), self._dial_matrix.get_dial(column, row))
			self._script.log_message(str(wheel['pn']) + ' ' + str(wheel['pv']) + ' ' + str(self._dial_matrix.get_dial(column, row)))
	

	#@subject_slot('value')
	#def _on_device_control_value(self, *a, **k):
	#	pass
	

	@subject_slot('value')
	def _on_shift_value(self, value, *a, **k):
		self._script.log_message('shift value ' + str(value))
	

	@subject_slot('value')
	def _on_matrix_value(self, value, x, y, is_momentary):
		#if self.is_enabled():
		self._script.log_message('on matrix value ' + str(x) + ' ' + ' ' + str(y) + ' ' + str(value))
	