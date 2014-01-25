# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
from contextlib import contextmanager
from functools import partial
from itertools import izip, chain, imap, ifilter
from _Tools.re import *
from _Framework.Dependency import inject
from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.InputControlElement import MIDI_CC_TYPE, MIDI_NOTE_TYPE, MIDI_CC_STATUS, MIDI_NOTE_ON_STATUS
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.DisplayDataSource import DisplayDataSource
from _Framework.ModesComponent import AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, ModeButtonBehaviour, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.SysexValueControl import SysexValueControl
from _Framework.Layer import Layer
from _Framework.Resource import PrioritizedResource
from _Framework.DeviceBankRegistry import DeviceBankRegistry
from _Framework.SubjectSlot import subject_slot, subject_slot_group
from _Framework.Util import find_if, clamp, nop, mixin, const, forward_property, first
from _Framework import Defaults
from _Framework import Task
from _Framework.MixerComponent import MixerComponent
from _Framework.ButtonElement import ButtonElement
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
from Push.ProviderDeviceComponent import ProviderDeviceComponent
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
from Push.MatrixMaps import *
from Push.consts import *
from Push.Settings import make_pad_parameters, SETTING_WORKFLOW, SETTING_THRESHOLD, SETTING_CURVE
#from Push.PadSensitivity import PadSensitivity

from Push.NavigationNode import RackNode
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.MonoEncoderElement import MonoEncoderElement
from _Mono_Framework.ModDevices import *
from _Mono_Framework.DeviceSelectorComponent import DeviceSelectorComponent
from _Mono_Framework.ResetSendsComponent import ResetSendsComponent
from Push.consts import *

import Live.DrumPad
from _Framework.CompoundComponent import CompoundComponent
from _Framework.SubjectSlot import subject_slot
from _Framework.Util import find_if, in_range, NamedTuple, forward_property
from _Framework.Disconnectable import disconnectable
from _Framework.Dependency import depends, inject
from Push.MessageBoxComponent import MessageBoxComponent
from Push.ScrollableListComponent import ScrollableListWithTogglesComponent
from Push.NavigationNode import make_navigation_node
#from Push.MelodicComponent import MelodicPattern
from Push.SpecialMixerComponent import SpecialMixerComponent
from Push.SpecialChanStripComponent import SpecialChanStripComponent

from MonoScaleComponent import MonoScaleComponent

from _Mono_Framework.Mod import *

CHANNEL_TEXT = ['Ch. 1', 'Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8']

DEVICE_COLORS = {'midi_effect':2,
				'audio_effect':5,
				'instrument':7,
				'Operator':3,
				'DrumGroupDevice':6,
				'MxDeviceMidiEffect':4,
				'MxDeviceInstrument':4,
				'MxDeviceAudioEffect':4,
				'InstrumentGroupDevice':1,
				'MidiEffectGroupDevice':1,
				'AudioEffectGroupDevice':1}

class AumPushValueComponent(ValueComponent):


	@subject_slot('value')
	def _on_encoder_value(self, value):
		value = self.view_transform(getattr(self._subject, self._property_name)) + value * self.encoder_factor
		setattr(self._subject, self._property_name, self.model_transform(value))
	


class CancellableBehaviourWithRelease(CancellableBehaviour):


	def release_delayed(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	


class AumPushResetSendsComponent(ResetSendsComponent):


	def set_buttons(self, buttons):

		for button in self._buttons:
			if button != None:
				button.remove_value_listener(self.reset_send)

		self._buttons = []
		for button in buttons:
			if button != None:
				button.add_value_listener(self.reset_send, identify_sender=True)
			self._buttons.append(button)
	


class AumPushTrollComponent(CompoundComponent):


	def __init__(self, script, *a, **k):
		super(AumPushTrollComponent, self).__init__(*a, **k)
		self._script = script
		self._mixer = TrollMixerComponent(16, 4)
		self._device_selector = AumPushDeviceSelectorComponent(self._script)
		self._send_reset = AumPushResetSendsComponent(self._script)
		self._encoder_mode = TrollModeSelectorComponent()
		self._top_buttons = [None for index in range(8)]
		self._bottom_buttons = [None for index in range(8)]
		self._display_line1 = None
		self._display_line2 = None
		self._display_line3 = None
		self._display_line4 = None
		self._matrix = None
		self._encoders = [None for index in range(8)]
		self._encoder_buttons = [None for index in range(8)]
		self._shift_button = None
		self._encoder_mode.update = self.update_encoders
		self._encoder_mode._set_protected_mode_index(0)
		self.register_component(self._encoder_mode)
		self.register_component(self._send_reset)
		self._encoder_mode.set_enabled(True)
	

	def set_top_buttons(self, buttons):
		new_buttons = [None for index in range(8)]
		if not buttons is None:
			new_buttons = [button for button in buttons]
		self._top_buttons = new_buttons

		#self._send_reset.set_buttons(tuple(self._top_buttons[4:]))
	

	def set_bottom_buttons(self, buttons):
		new_buttons = [None for index in range(8)]
		if not buttons is None:
			new_buttons = [button for button in buttons]
		self._bottom_buttons = new_buttons
		
		for button in self._bottom_buttons[4:]:
			if not button == None:
				button.set_on_off_values('DefaultButton.On', 'DefaultButton.Off')
		self._encoder_mode.set_mode_buttons(tuple(self._bottom_buttons[4:]))
		self.update_mode_buttons()
	

	def set_matrix(self, matrix):
		BUTTON_COLORS = ['Scales.Selected', 'Scales.Chromatic', 'DrumGroup.PadMutedSelected', 'Scales.Unselected']
		self._matrix = matrix
		if not self._matrix is None:
			buttons = []
			for button, _ in matrix.iterbuttons():
				button.use_default_message()
				button.set_enabled(True)
				buttons.append(button)
		else:
			buttons = [None for index in range(64)]
		
		for index in range(16):
			if not buttons[index] is None:
				buttons[index].set_on_off_values('Scales.Diatonic', BUTTON_COLORS[int(index/4)])
			self._mixer.channel_strip(index).set_select_button(buttons[index])
		self._device_selector.set_mode_buttons(tuple(buttons[16:32]))
	

	def set_display_line1(self, display):
		#self._mixer.set_selected_names_display(display)
		self._display_line1 = display
	

	def set_display_line2(self, display):
		#self._mixer.set_encoder_names_display(display)
		self._display_line2 = display
	

	def set_display_line3(self, display):
		#self._mixer.set_encoder_values_display(display)
		self._display_line3 = display
	

	def set_display_line4(self, display):
		#self._mixer.set_selected_names_display(display)
		self._display_line4 = display
	

	def set_encoders(self, encoders):
		if encoders is None:
			encoders = [None for index in range(8)]
		self._encoders = encoders
		self.update_encoders()
	

	def set_encoder_buttons(self, buttons):
		if buttons is None:
			buttons = [None for index in range(8)]
		self._encoder_buttons = buttons
	

	def set_shift_button(self, button):
		self._shift_button = button
	

	def update_encoders(self):
		
		for strip in self._mixer._channel_strips:
			strip.set_send_controls(tuple([None, None, None, None]))
			strip.set_volume_control(None)
		for strip in self._mixer._return_strips:
			strip.set_send_controls(tuple([None, None, None, None]))
			strip.set_volume_control(None)

		mode = self._encoder_mode._mode_index
		line1 = []
		line2 = []
		line3 = []
		if mode == 0:
			self._mixer.selected_strip().set_send_controls(tuple(self._encoders[:4]))
			line1 = [ self._mixer.selected_strip().track_parameter_name_sources(index) for index in range(2, 6) ]
			line2 = [ self._mixer.selected_strip().track_parameter_graphic_sources(index) for index in range(2, 6) ]
			line3 = [ self._mixer.selected_strip().track_parameter_data_sources(index) for index in range(2, 6) ]
			for index in range(4):
				self._mixer.return_strip(index).set_volume_control(self._encoders[index+4])
				line1.append(self._mixer.return_strip(index).track_name_data_source())
				line2.append(self._mixer.return_strip(index).track_parameter_graphic_sources(0))
				line3.append(self._mixer.return_strip(index).track_parameter_data_sources(0))

			self._send_reset.set_buttons(tuple(self._top_buttons[4:]))
			#if not self._shift_button is None and not self._encoder_buttons[0] is None:
			#	self._script.log_message('making zeros!')
			#	self._send_reset.set_buttons(tuple( [ComboElement(self._encoder_buttons[0], [self._shift_button]), ComboElement(self._encoder_buttons[1], [self._shift_button]), ComboElement(self._encoder_buttons[2], [self._shift_button]), ComboElement(self._encoder_buttons[3], [self._shift_button]) ]) )

		elif mode == 1:
			for index in range(4):
				self._mixer.channel_strip(index).set_volume_control(self._encoders[index])
				line1.append(self._mixer.channel_strip(index).track_name_data_source())
				line2.append(self._mixer.channel_strip(index).track_parameter_graphic_sources(0))
				line3.append(self._mixer.channel_strip(index).track_parameter_data_sources(0))
			for index in range(4):
				self._mixer.channel_strip(index+12).set_volume_control(self._encoders[index+4])
				line1.append(self._mixer.channel_strip(index+12).track_name_data_source())
				line2.append(self._mixer.channel_strip(index+12).track_parameter_graphic_sources(0))
				line3.append(self._mixer.channel_strip(index+12).track_parameter_data_sources(0))
			self._send_reset.set_buttons(tuple([None, None, None, None]))

		elif mode == 2:
			for index in range(4):
				self._mixer.channel_strip(index+4).set_volume_control(self._encoders[index])
				line1.append(self._mixer.channel_strip(index+4).track_name_data_source())
				line2.append(self._mixer.channel_strip(index+4).track_parameter_graphic_sources(0))
				line3.append(self._mixer.channel_strip(index+4).track_parameter_data_sources(0))
			for index in range(4):
				self._mixer.channel_strip(index+8).set_volume_control(self._encoders[index+4])
				line1.append(self._mixer.channel_strip(index+8).track_name_data_source())
				line2.append(self._mixer.channel_strip(index+8).track_parameter_graphic_sources(0))
				line3.append(self._mixer.channel_strip(index+8).track_parameter_data_sources(0))
			self._send_reset.set_buttons(tuple([None, None, None, None]))

		elif mode == 3:
			for index in range(4):
				self._mixer.selected_strip().set_send_controls(tuple(self._encoders[:4]))
				line1 = [ self._mixer.selected_strip().track_parameter_name_sources(index) for index in range(2, 6) ]
				line2 = [ self._mixer.selected_strip().track_parameter_graphic_sources(index) for index in range(2, 6) ]
				line3 = [ self._mixer.selected_strip().track_parameter_data_sources(index) for index in range(2, 6) ]
			self._mixer.return_strip(0).set_send_controls(tuple([None, self._encoders[4], None, None]))
			self._mixer.return_strip(1).set_send_controls(tuple([self._encoders[5], None, None, None]))
			self._mixer.return_strip(2).set_send_controls(tuple([self._encoders[6], self._encoders[7], None, None]))
			line1.append(self._mixer.return_strip(0).track_name_data_source())
			line1.append(self._mixer.return_strip(1).track_name_data_source())
			line1.append(self._mixer.return_strip(2).track_name_data_source())
			line1.append(self._mixer.return_strip(2).track_name_data_source())
			line2.append(self._mixer.return_strip(0).track_parameter_graphic_sources(3))
			line2.append(self._mixer.return_strip(1).track_parameter_graphic_sources(2))
			line2.append(self._mixer.return_strip(2).track_parameter_graphic_sources(2))
			line2.append(self._mixer.return_strip(2).track_parameter_graphic_sources(3))
			line3.append(self._mixer.return_strip(0).track_parameter_data_sources(3))
			line3.append(self._mixer.return_strip(1).track_parameter_data_sources(2))
			line3.append(self._mixer.return_strip(2).track_parameter_data_sources(2))
			line3.append(self._mixer.return_strip(2).track_parameter_data_sources(3))
			self._send_reset.set_buttons(tuple(self._top_buttons[4:]))

		if self._display_line1:
			self._display_line1.set_data_sources(line1)
		if self._display_line2:
			self._display_line2.set_data_sources(line2)
		if self._display_line3:
			self._display_line3.set_data_sources(line3)
		if self._display_line4:
			self._script._device_navigation.set_display_line(self._display_line4)

		
		self.update_mode_buttons()
	

	def update_mode_buttons(self):
		for button in self._encoder_mode._modes_buttons:
			if self._encoder_mode._modes_buttons.index(button) == self._encoder_mode._mode_index:
				button.turn_on()
			else:
				button.turn_off()
	

	def update(self):
		#if self.is_enabled():
		#	self._script.log_message('Troll update')
		pass
	

	def set_enabled(self, enabled = True):
		super(AumPushTrollComponent, self).set_enabled(enabled)
		if not enabled:
			self._script._select_note_mode()
	

	def set_mode_matrix(self, matrix):
		if not matrix is None:
			buttons = [button for button, _ in matrix.iterbuttons()]
		else:
			buttons = None
		self.set_mode_buttons(buttons)
	

	def set_device_selector_matrix(self, matrix):
		buttons = []
		if not matrix is None:
			for button, address in matrix.iterbuttons():
				button.use_default_message()
				button.set_enabled(True)
				buttons.append(button)
		
		self._device_selector.set_mode_buttons(tuple(buttons))
	

	def set_track_selector_matrix(self, matrix):
		if not matrix == None:
			buttons = []
			self._script.log_message('matrix:  width: ' + str(matrix.width()) + ' height: ' + str(matrix.height()))
			self._script.log_message('button from matrix: ' + str(matrix.get_button(0, 0)))
			for button, _ in matrix.iterbuttons():
				self._script.log_message('button: ' + str(button))
				button.use_default_message()
				button.set_enabled(True)
				buttons.append(button)
		else:
			buttons = [None for index in range(16)]
		for index in range(16):
			self._mixer.channel_strip(index).set_select_button(buttons[index])
	

	def set_return_encoders(self, encoders):
		if encoders is None:
			encoders = [None for index in range(4)]
		for index in range(4):
			#self._script.log_message('encoder ' + str(encoders[index]) + ' return ' + str(index) + ' ' + str(self._mixer.return_strip(index)))
			self._mixer.selected_strip().set_send_controls(encoders[:4])
			self._mixer.return_strip(index).set_volume_control(encoders[index+4])
	

	def set_send_reset_buttons(self, buttons):
		self._send_reset.set_buttons(tuple(buttons[0:4]))
	

	def on_selected_track_changed(self):
		pass
		#if self.is_enabled():
			#self._script.
	


class AumPushDeviceSelectorComponent(DeviceSelectorComponent):


	def __init__(self, *a, **k):
		super(AumPushDeviceSelectorComponent, self).__init__(*a, **k)
	

	def set_matrix(self, matrix):
		buttons = []
		if not matrix is None:
			for button, address in matrix.iterbuttons():
				#self._script.log_message('button: ' + str(button))
				button.use_default_message()
				button.set_enabled(True)
				buttons.append(button)
		self.set_mode_buttons(tuple(buttons))
	

	def set_mode_buttons(self, buttons):
		assert(isinstance(buttons, tuple) or buttons is None)
		if buttons == None:
			buttons = []

		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)

		self._modes_buttons = []
		for button in buttons:
			if not button is None:
				button.add_value_listener(self._mode_value, identify_sender=True)
				self._modes_buttons.append(button)
			self._number_of_modes = len(self._modes_buttons) + self._offset
		self.update()
	

	def update(self):
		if self.is_enabled():
			for button in range(len(self._modes_buttons)):
				if button + self._offset == self._last_preset:
					self._modes_buttons[button].send_value(13)
				else:
					self._modes_buttons[button].send_value(1)
	

	def update(self):
		if self.is_enabled():
			name = 'None'
			dev = self.song().appointed_device
			if hasattr(dev, 'name'):
				name = dev.name
				dev_type = dev.type
				dev_class = dev.class_name
			if self._modes_buttons:
				for index in range(len(self._modes_buttons)):
					if match('p' + str(index+1) + ' ', name) != None:
						val = (dev_class in DEVICE_COLORS and DEVICE_COLORS[dev_class]) or (dev_type in DEVICE_COLORS and DEVICE_COLORS[dev_type])
						self._modes_buttons[index].send_value(val)
					else:
						self._modes_buttons[index].send_value(20)
	

	def _update_mode(self):
		mode = self._modes_heap[-1][0]
		assert(mode in range(self.number_of_modes()))
		if self._mode_index != mode:
			self._mode_index = mode

		if self.is_enabled():
			key = str('p' + str(self._mode_index + 1 + self._offset) + ' ')
			preset = None
			for track in self.song().tracks:
				for device in self.enumerate_track_device(track):
					if(match(key, str(device.name)) != None):
						preset = device
						break
			for return_track in self.song().return_tracks:
				for device in self.enumerate_track_device(return_track):
					if(match(key, str(device.name)) != None):
						preset = device
						break
			for device in self.enumerate_track_device(self.song().master_track):
				if(match(key, str(device.name)) != None):
					preset = device
					break

			if preset != None:
				#self._script.log_message('preset found: ' + str(preset.name))
				self._script.set_appointed_device(preset)
				self.song().view.select_device(preset)
				self._last_preset = self._mode_index + self._offset

			self.update()
	

	def set_mode(self, mode):
		self._clean_heap()
		self._modes_heap = [(mode, None, None)]
		self._update_mode()
	


class AumPushSpecialMixerComponent(SpecialMixerComponent):


	def _create_strip(self):
		return AumPushSpecialChanStripComponent()
	

	def set_crossfader_control(self, control):
		if self._crossfader_control != None:
			self._crossfader_control.release_parameter()
		self._crossfader_control = control
		self.update()
	


class TrollMixerComponent(AumPushSpecialMixerComponent):


	def tracks_to_use(self):
		return tuple(self.song().visible_tracks)
	

	def set_track_names_display(self, display):
		if display:
			sources = []
			for index in range(4):
				sources.append(self.channel_strip(index).track_name_data_source())
			for index in range(4):
				sources.append(self.channel_strip(index+12).track_name_data_source())
			display.set_data_sources(sources)
	

	def set_encoder_names_display(self, display):
		if display:
			sources = []
			for index in range(4):
				sources.append(self.return_strip(index).track_name_data_source())
			for index in range(4):
				sources.append(self.channel_strip(index+12).track_parameter_name_sources(0))
			display.set_data_sources(sources)
	

	def set_encoder_values_display(self, display):
		if display:
			sources = []
			for index in range(4):
				sources.append(self.return_strip(index).track_parameter_data_sources(0))
			for index in range(4):
				sources.append(self.channel_strip(index+12).track_parameter_data_sources(0))
			display.set_data_sources(sources)
	

	def set_selected_names_display(self, display):
		pass
	

	def _reassign_tracks(self):
		tracks = self.tracks_to_use()
		returns = self.song().return_tracks
		num_empty_tracks = max(0, len(self._channel_strips) + self._track_offset - len(tracks))
		num_visible_tracks = max(0, len(tracks) - len(returns) - self._track_offset)
		num_visible_returns = len(self._channel_strips) - num_empty_tracks - num_visible_tracks
		for index in range(len(self._channel_strips)):
			track_index = self._track_offset + index
			if len(tracks) > track_index:
				track = tracks[track_index]
				if tracks[track_index] not in returns:
					self._channel_strips[index].set_track(track)
				else:
					self._channel_strips[index + num_empty_tracks].set_track(track)
			else:
				self._channel_strips[index - num_visible_returns].set_track(None)

		for index in range(len(self._return_strips)):
			if len(returns) > index:
				self._return_strips[index].set_track(returns[index])
			else:
				self._return_strips[index].set_track(None)
	


class TrollModeSelectorComponent(ModeSelectorComponent):


	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			if button.value_has_listener(self._mode_value):
				button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		for button in buttons:
			if not button is None:
				button.add_value_listener(self._mode_value, identify_sender=True)
				self._modes_buttons.append(button)
	

	def number_of_modes(self):
		return 4
	


class AumPushSpecialChanStripComponent(SpecialChanStripComponent):


	def _arm_value(self, value):
		assert(not self._arm_button != None)
		assert(value in range(128))
		if self.is_enabled():
			if self._track != None and self._track.can_be_armed:
				arm_exclusive = self.song().exclusive_arm != self._shift_pressed
				new_value = not self._track.arm
				respect_multi_selection = self._track.is_part_of_selection
				for track in self.song().tracks:
					if track.can_be_armed:
						if track == self._track or respect_multi_selection and track.is_part_of_selection:
							track.arm = new_value
						#elif arm_exclusive and track.arm:
						#	track.arm = False
	

	def _select_value(self, value):
		if self.is_enabled() and self._track and value:
			if self._duplicate_button and self._duplicate_button.is_pressed():
				self._do_duplicate_track(self._track)
			elif self._delete_button and self._delete_button.is_pressed():
				self._do_delete_track(self._track)
			elif self._shift_pressed:
				if self._track.can_be_armed:
					self._track.arm = not self._track.arm
			else:
				if self._track.can_be_armed and self.song().view.selected_track == self._track:
					self._track.arm = not self._track.arm
				else:
					super(SpecialChanStripComponent, self)._select_value(value)
				#if self._track.can_be_armed and (self._track.implicit_arm or self._track.arm):
				#	for track in self.song().tracks:
				#		if track.can_be_armed and track != self._track:
				#			track.arm = False

			if self._selector_button and self._selector_button.is_pressed():
				self._do_select_track(self._track)
				if not self._shift_pressed:
					if self._track.is_foldable and self._select_button.is_momentary():
						self._fold_task.restart()
					else:
						self._fold_task.kill()
	

	def set_select_button(self, button):
		if button != self._select_button:
			if self._select_button != None:
				self._select_button.remove_value_listener(self._select_value)
				self._select_button.reset()
			self._select_button = button
			self._select_button != None and self._select_button.add_value_listener(self._select_value)
		self.update()
	

	def _update_track_listeners(self):
		mixer = self._track.mixer_device if self._track else None
		sends = mixer.sends if mixer and self._track != self.song().master_track else ()
		cue_volume = mixer.crossfader if self._track == self.song().master_track else None
		self._cue_volume_slot.parameter = cue_volume
		self._on_volume_value_changed.subject = mixer and mixer.volume
		self._on_panning_value_changed.subject = mixer and mixer.panning
		self._on_sends_value_changed.replace_subjects(sends)
	

class AumPushInstrumentComponent(InstrumentComponent):


	def _override_channel(self):
		return -1
	

	def _setup_instrument_mode(self):
		if self.is_enabled() and self._matrix:
			self._matrix.reset()
			pattern = self._pattern
			max_j = self._matrix.width() - 1
			for button, (i, j) in ifilter(first, self._matrix.iterbuttons()):
				if not button == None:
					profile = 'default' if self._takeover_pads else 'instrument'
					button.sensitivity_profile = profile
					note_info = pattern.note(i, max_j - j)
					if note_info.index != None:
						button.set_on_off_values('Instrument.NoteAction', 'Instrument.' + note_info.color)
						button.turn_off()
						button.set_enabled(self._takeover_pads)
						if override_channel > -1:
							button.set_channel(override_channel)
						else:
							button.set_channel(note_info.channel)
						button.set_identifier(note_info.index)
					else:
						button.set_channel(NON_FEEDBACK_CHANNEL)
						button.set_light('Instrument.' + note_info.color)
						button.set_enabled(True)
	

	def on_selected_track_changed(self, *a, **k):
		super(AumPushInstrumentComponent, self).on_selected_track_changed(*a, **k)
		self.update()
	


class AumPushDeviceNavigationComponent(DeviceNavigationComponent):


	def __init__(self, script, *a, **k):
		self._script = script
		super(AumPushDeviceNavigationComponent, self).__init__(*a, **k)
	

	@subject_slot('selected_device')
	def _on_selected_device_changed(self):
		selected_device = self._selected_track.view.selected_device
		#if selected_device:
		#	self._script.log_message('selected_device=' + str(selected_device.name))
		if selected_device == None:
			self._set_current_node(self._make_exit_node())
			return
		is_just_default_child_selection = False
		if self._current_node and self._current_node.children:
			selected = self.selected_object
			#self._script.log_message('selected=' + str(selected))
			if isinstance(selected, Live.DrumPad.DrumPad) and find_if(lambda pad: pad.chains and pad.chains[0].devices and pad.chains[0].devices[0] == selected_device, selected.canonical_parent.drum_pads):
				is_just_default_child_selection = True
			if isinstance(selected, Live.Chain.Chain) and selected_device and selected_device.canonical_parent == selected and selected.devices[0] == selected_device:
				is_just_default_child_selection = True
		if not is_just_default_child_selection:
			if selected_device:
				target = selected_device.canonical_parent
				self._script.log_message('target=' + str(target))
				if (not self._current_node or self._current_node.object != target): 
					node = self._make_navigation_node(target, is_entering=False)
					#self._script.log_message('node=' + str(node))
					self._set_current_node(node)
	


class AumPush(Push):


	def __init__(self, c_instance):
		self._monomod_version = 'b995'
		self._cntrlr_version = 'b995'
		self._host_name = 'AumPush'
		self._color_type = 'Push'
		self.hosts = []
		self._auto_arm_calls = 0
		super(AumPush, self).__init__(c_instance)
		with self.component_guard():
			#self._create_CC_controls()
			self._device_parameter_provider._alt_pressed = False
			self._host.set_device_component(self._device_parameter_provider)
			self._device_parameter_provider.add_device_listener(self._on_new_device_set)
			self.set_feedback_channels(FEEDBACK_CHANNELS)
			self._hack_stepseq()
			self._hack_stuff()
		self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>') 
	

	"""def _create_controls(self):
		super(AumPush, self)._create_controls()
		self._pad_CC = [MonoEncoderElement(MIDI_CC_TYPE, 15, index, Live.MidiMap.MapMode.absolute, 'Pad_CC_' + str(index), index, self) for index in range(64)]
		self._matrix_CC = ButtonMatrixElement()
		for index in range(8):
			self._matrix_CC.add_row(self._pad_CC[(index*8):(index*8)+8])"""
	

	def _init_instrument(self):
		super(AumPush, self)._init_instrument()
		self._instrument._instrument._setup_instrument_mode = self._make_setup_instrument_mode(self._instrument._instrument)
		"""
		self._instrument = AumPushInstrumentComponent(name='Instrument_Component')
		self._instrument.set_enabled(False)
		self._instrument.layer = Layer(matrix=self._matrix, touch_strip=self._touch_strip_control, scales_toggle_button=self._scale_presets_button, presets_toggle_button=self._shift_button, octave_up_button=self._octave_up_button, octave_down_button=self._octave_down_button)
		self._instrument.scales_layer = Layer(top_display_line=self._display_line3, bottom_display_line=self._display_line4, top_buttons=self._select_buttons, bottom_buttons=self._track_state_buttons, encoder_touch_buttons=self._global_param_touch_buttons, _notification=self._notification.use_single_line(1))
		self._instrument.scales_layer.priority = MODAL_DIALOG_PRIORITY
		self._instrument._scales.presets_layer = Layer(top_display_line=self._display_line3, bottom_display_line=self._display_line4, top_buttons=self._select_buttons, bottom_buttons=self._track_state_buttons)
		self._instrument._scales.presets_layer.priority = DIALOG_PRIORITY
		self._instrument._scales.scales_info_layer = Layer(info_line=self._display_line1, blank_line=self._display_line2)
		self._instrument._scales.scales_info_layer.priority = MODAL_DIALOG_PRIORITY
		self._instrument._override_channel = self._get_current_instrument_channel
		#instrument_basic_layer = Layer(octave_strip=ComboElement(self._touch_strip_control, [self._shift_button]), scales_toggle_button=self._scale_presets_button, presets_toggle_button=self._shift_button, octave_up_button=self._octave_up_button, octave_down_button=self._octave_down_button, scale_up_button=ComboElement(self._octave_up_button, [self._shift_button]), scale_down_button=ComboElement(self._octave_down_button, [self._shift_button]))
		#self._instrument = MelodicComponent(skin=self._skin, is_enabled=False, clip_creator=self._clip_creator, name='Melodic_Component', grid_resolution=self._grid_resolution, note_editor_settings=self._add_note_editor_setting(), layer=Layer(playhead=self._playhead_element, mute_button=self._global_mute_button, quantization_buttons=self._side_buttons, loop_selector_matrix=self._double_press_matrix.submatrix[:, 0], short_loop_selector_matrix=self._double_press_event_matrix.submatrix[:, 0], note_editor_matrices=ButtonMatrixElement([[ self._matrix.submatrix[:, 7 - row] for row in xrange(7) ]])), instrument_play_layer=instrument_basic_layer + Layer(matrix=self._matrix, touch_strip=self._touch_strip_control, aftertouch_control=self._aftertouch_control, delete_button=self._delete_button), instrument_sequence_layer=instrument_basic_layer + Layer(note_strip=self._touch_strip_control))
		#self._on_note_editor_layout_changed.subject = self._instrument

		self._instrument._instrument = self._instrument.register_component(AumPushInstrumentComponent(name='Instrument_Component'))
		self._instrument._instrument._override_channel = self._get_current_instrument_channel
		"""
	

	@subject_slot('failure')
	def _on_handshake_failure(self, bootloader_mode):
		pass
	

	@subject_slot('success')
	def _on_handshake_success(self):
		self.log_message('Handshake succeded with firmware version %.2f!' % self._handshake.firmware_version)
		self.update()
		if hasattr(self._c_instance, 'set_firmware_version'):
			self._c_instance.set_firmware_version(self._handshake.firmware_version)
	

	def _get_current_instrument_channel(self):
		#self.log_message('_get_current_instrument_channel channel')
		cur_track = self._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if len(cur_chan) == 0:
				self.set_feedback_channels(FEEDBACK_CHANNELS)
				return -1
			elif cur_chan in CHANNEL_TEXT:
				chan = CHANNEL_TEXT.index(cur_chan)
				self.set_feedback_channels([chan])
				return chan
			else:
				self.set_feedback_channels(FEEDBACK_CHANNELS)
				return -1
		else:
			self.set_feedback_channels(FEEDBACK_CHANNELS)
			return -1
	

	def _setup_monoscale(self):
		self._monoscale = MonoScaleComponent(self)
		self._monoscale.name = 'MonoScaleComponent'
		self._monoscale.layer = Layer( button_matrix = self._matrix, touchstrip = self._touch_strip_control, scales_toggle_button=self._scale_presets_button, octave_up_button = self._octave_up_button, octave_down_button = self._octave_down_button)
		self._monoscale.display_layer = Layer( controls = self._track_state_buttons, name_display_line = self._display_line3, value_display_line = self._display_line4 )
		#self._monoscale.shift_layer = AddLayerMode( self._monoscale, Layer(shifted_controls = 
	

	def _setup_mod(self):
		self._host = PushMonomodComponent(self)
		self._host.name = 'Monomod_Host'
		self._host._host_name = 'AumPush'
		self._host.layer = Layer( lock_button = self._note_mode_button, button_matrix = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, key_buttons = self._track_state_buttons) #, nav_up_button = OptionalElement( self._nav_up_button, self._host._alt_pressed, False), nav_down_button = OptionalElement( self._nav_down_button, self._host._alt_pressed, False), nav_left_button = OptionalElement( self._nav_left_button, self._host._alt_pressed, False), nav_right_button = OptionalElement( self._nav_right_button, self._host._alt_pressed, False)) #name_display_line=self._display_line1, value_display_line=self._display_line2, alternating_display=self._display_line3, device_controls = self._global_param_controls, encoder_touch_buttons=self._global_param_touch_buttons, lcd_displays = self._display_line1)
		self._host.layer.priority = 5
		self._host.alt_display_layer = Layer( name_display_line = self._display_line3, value_display_line = self._display_line4 ) #alt_controls = self._track_state_buttons, 
		self._host.shift_display_layer = Layer( name_display_line = self._display_line3, value_display_line = self._display_line4 ) #alt_controls = self._track_state_buttons, 

		self._host.nav_buttons_layer = AddLayerMode( self._host, Layer(nav_up_button = self._nav_up_button, nav_down_button = self._nav_down_button, nav_left_button = self._nav_left_button, nav_right_button = self._nav_right_button) )
		
		self.hosts = [self._host]
	

	def _setup_newmod(self):
		if isinstance(__builtins__, dict):
			if not 'monomodular' in __builtins__.keys() or not isinstance(__builtins__['monomodular'], ModRouter):
				__builtins__['monomodular'] = ModRouter()
		else:
			if not hasattr(__builtins__, 'monomodular') or not isinstance(__builtins__['monomodular'], ModRouter):
				setattr(__builtins__, 'monomodular', ModRouter())
		self.monomodular = __builtins__['monomodular']
		if not self.monomodular.has_host():
			self.monomodular.set_host(self)
		self.monomodular.name = 'monomodular_switcher'
		self.modhandler = PushModHandler(self)
		self.modhandler.name = 'ModHandler'
		self.modhandler.layer = Layer( lock_button = self._note_mode_button, push_grid = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, key_buttons = self._track_state_buttons)
		# self.log_message('mod is: ' + str(self.monomodular) + ' ' + str(__builtins__['monomodular']))
	

	def _init_matrix_modes(self):
		super(AumPush, self)._init_matrix_modes()
		#self._setup_monoscale()
		self._setup_mod()
		self._setup_newmod()
		self._note_modes.add_mode('newmod', self.modhandler)
		self._note_modes.add_mode('mod', self._host)
		self._note_modes.add_mode('looperhack', self._audio_loop)
		#self._note_modes.add_mode('monoscale', self._monoscale)
	

	def _init_device(self, *a, **k):
		super(AumPush, self)._init_device(*a, **k)
		self._device = self._device_parameter_provider
		self._device_parameter_provider._current_bank_details = self._make_current_bank_details(self._device_parameter_provider)
		self.modhandler._device_component = self._device_parameter_provider
		#self.modhandler.layer = Layer( lock_button = self._note_mode_button, push_grid = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, key_buttons = self._track_state_buttons, device_component = self._device )
		#self._device_navigation._on_selected_device_changed = self._make_on_selected_device_changed(self._device_navigation)
	

	def _init_mixer(self):
		self._mixer = AumPushSpecialMixerComponent(self._matrix.width())
		self._mixer.set_enabled(False)
		self._mixer.name = 'Mixer'
		self._mixer_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons) #, crossfader_control=ComboElement(self._master_volume_control, [self._shift_button])
		self._mixer_pan_send_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons, pan_send_toggle=self._pan_send_mix_mode_button, pan_send_controls=self._global_param_controls, pan_send_names_display=self._display_line1, pan_send_graphics_display=self._display_line2, selected_track_name_display=self._display_line3, pan_send_values_display=ComboElement(self._display_line3, [self._any_touch_button]))
		self._mixer_volume_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons, volume_controls=self._global_param_controls, volume_names_display=self._display_line1, volume_graphics_display=self._display_line2, selected_track_name_display=self._display_line3, volume_values_display=ComboElement(self._display_line3, [self._any_touch_button]))
		self._mixer_track_layer = Layer(selected_track_name_display=self._display_line3, track_names_display=self._display_line4, track_select_buttons=self._select_buttons)
		self._mixer_solo_layer = Layer(solo_buttons=self._track_state_buttons)
		self._mixer_mute_layer = Layer(mute_buttons=self._track_state_buttons)
		#self._mixer.layer = self._mixer_layer
		for track in xrange(self._matrix.width()):
			strip = self._mixer.channel_strip(track)
			strip.name = 'Channel_Strip_' + str(track)
			strip.set_invert_mute_feedback(True)
			if hasattr(strip, 'set_delete_handler'):
				strip.set_delete_handler(self._delete_component)
			strip._do_select_track = self._selector.on_select_track
			strip.layer = Layer(shift_button=self._shift_button, duplicate_button=self._duplicate_button, selector_button=self._select_button)

		self._mixer.selected_strip().name = 'Selected_Channel_strip'
		self._mixer.master_strip().name = 'Master_Channel_strip'
		self._mixer.master_strip()._do_select_track = self._selector.on_select_track
		#self._mixer.master_strip().layer = Layer(volume_control=self._master_volume_control, cue_volume_control=ComboElement(self._master_volume_control, [self._shift_button]), select_button=self._master_select_button, selector_button=self._select_button)
		self._mixer.master_strip().layer = Layer(volume_control=self._master_volume_control, cue_volume_control=ComboElement(self._master_volume_control, [self._shift_button]), select_button=ComboElement(self._master_select_button, [self._select_button]), selector_button=self._select_button)  #select_button=self._master_select_button,
		self._mixer.set_enabled(True)
	

	def _hack_stepseq(self):
		self._step_sequencer._drum_group._update_control_from_script = self._make_update_control_from_script(self._step_sequencer._drum_group)
	

	def _hack_stuff(self):
		self._troll = AumPushTrollComponent(self)
		self._troll.set_enabled(False)
		self._troll.layer = Layer(top_buttons = self._select_buttons, bottom_buttons = self._track_state_buttons, matrix = self._matrix.submatrix[:, :4], display_line1=self._display_line1, display_line2=self._display_line2, display_line3=self._display_line3, display_line4=self._display_line4, encoder_buttons = self._global_param_touch_buttons, encoders = self._global_param_controls)  #shift_button = self._shift_button, 
		self._troll.layer.priority = 6
		self._main_modes.add_mode('troll', self._troll, behaviour=CancellableBehaviourWithRelease())
		self._main_modes.layer = Layer(volumes_button=self._vol_mix_mode_button, pan_sends_button=self._pan_send_mix_mode_button, track_button=self._single_track_mix_mode_button, clip_button=self._clip_mode_button, device_button=self._device_mode_button, browse_button=self._browse_mode_button, add_effect_right_button=self._create_device_button, add_effect_left_button=ComboElement(self._create_device_button, [self._shift_button]), add_instrument_track_button=self._create_track_button, troll_button=self._master_select_button)

		"""self._tempo.layer = Layer(button=ComboElement(self._tempo_control_tap, [self._shift_button]))
		self._transport.layer = Layer(shift_button=self._shift_button, play_button=self._play_button, tap_tempo_button=self._tap_tempo_button, metronome_button=self._metronome_button, quantization_button=self._quantize_button, tempo_encoder=ComboElement(self._tempo_control, [self._shift_button]), undo_button=self._undo_button)"""

		"""self._swing_amount = AumPushValueComponent('swing_amount', self.song(), display_label='Swing Amount:', display_format='%d%%', model_transform=lambda x: clamp(x / 200.0, 0.0, 0.5), view_transform=lambda x: x * 200.0, encoder_factor=100.0, encoder=self._swing_control)
		self._swing_amount.layer = Layer(button=ComboElement(self._swing_control_tap, [self._shift_button]), encoder=ComboElement(self._swing_control, [self._shift_button]))
		self._swing_amount.display_layer = Layer(label_display=self._display_line1, value_display=self._display_line3, graphic_display=self._display_line2, clear_display1=self._display_line4)
		self._swing_amount.display_layer.priority = DIALOG_PRIORITY"""

		self._master_cue_vol = ParameterValueComponent(self.song().master_track.mixer_device.crossfader, display_label='Crossfader:', display_seg_start=3, name='Cue_Volume_Display', encoder=ComboElement(self._master_volume_control, [self._shift_button]))
		self._master_cue_vol.layer = Layer(button=ComboElement(self._master_volume_control_tap, [self._shift_button]))
		self._master_cue_vol.display_layer = Layer(label_display=self._display_line1, value_display=self._display_line3, graphic_display=self._display_line2, clear_display2=self._display_line4)
		self._master_cue_vol.display_layer.priority = DIALOG_PRIORITY

		if len(self.song().visible_tracks)>=16:
			self._session.set_offsets(4, 8)

		self.schedule_message(5, self._remove_pedal)
	

	def _remove_pedal(self):

		self._session_recording.layer = Layer(new_button=OptionalElement(self._new_button, self._settings[SETTING_WORKFLOW], False), scene_list_new_button=OptionalElement(self._new_button, self._settings[SETTING_WORKFLOW], True), record_button=self._record_button, automation_button=self._automation_button, new_scene_button=ComboElement(self._new_button, [self._shift_button]), re_enable_automation_button=ComboElement(self._automation_button, [self._shift_button]), delete_automation_button=ComboElement(self._automation_button, [self._delete_button]), length_button=self._fixed_length_button)
		for control in self.controls:
			if isinstance(control, ConfigurableButtonElement) and control._original_identifier is 69:
				self.log_message('found control: ' + str(control))
				self.controls.remove(control)
				break
		self._foot_pedal_button = None
		self.request_rebuild_midi_map()
	
	
	def _make_update_control_from_script(self, drum_group):
		def _update_control_from_script(): 
			takeover_drums = drum_group._takeover_drums or drum_group._selected_pads
			profile = 'default' if takeover_drums else 'drums'
			if drum_group._drum_matrix:
				for button, _ in drum_group._drum_matrix.iterbuttons():
					if button:
						translation_channel = self._get_current_instrument_channel()
						if translation_channel < 0:
							translation_channel = PAD_FEEDBACK_CHANNEL
						button.set_channel(translation_channel)
						button.set_enabled(takeover_drums and (translation_channel is PAD_FEEDBACK_CHANNEL))
						button.sensitivity_profile = profile
		return _update_control_from_script
		
	

	def _on_new_device_set(self):
		self.schedule_message(1, self._select_note_mode)
	

	def _select_note_mode(self, mod_device = None):
		if not self._main_modes.selected_mode is 'troll':
			track = self.song().view.selected_track
			drum_device = self._drum_group_finder.drum_group
			self._step_sequencer.set_drum_group_device(drum_device)
			current_device = self._device_parameter_provider._device
			mod_device = self._is_mod(current_device)
			newmod_device = self._is_newmod(current_device)
			#self.log_message('newmod_device = ' + str(newmod_device))
			#drum_device = find_if(lambda d: d.can_have_drum_pads, track.devices)
			channelized = False
			#self.log_message('track has midi input: ' + str(track.has_midi_input) + ' current subrouting in CHANNELS: ' + str(track.current_input_sub_routing))
			if track.has_midi_input and track.current_input_sub_routing in ['Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8', 'Ch. 9', 'Ch. 10', 'Ch. 11', 'Ch. 12', 'Ch. 13', 'Ch. 14', 'Ch. 15', 'Ch. 16']:
				channelized = True
			if not (self._note_modes.selected_mode is 'mod' and self._host.is_modlocked()):
				self._step_sequencer.set_drum_group_device(drum_device)
				if track == None or track.is_foldable or track in self.song().return_tracks or track == self.song().master_track or (hasattr(track, 'is_frozen') and track.is_frozen):
					self._note_modes.selected_mode = 'disabled'
				elif not mod_device is None:
					#self._note_modes.selected_mode = 'disabled'
					self._note_modes.selected_mode = 'mod'
					if not self._host._active_client is mod_device:
						self._host._select_client(mod_device._number)
				elif not newmod_device is None:
					#self._note_modes.selected_mode = 'disabled'
					#self.log_message('selecting notemode: newmod')
					self._note_modes.selected_mode = 'newmod'
					self.modhandler.select_mod(newmod_device)
					self.schedule_message(1, self.modhandler.update)
				elif track and track.has_audio_input:
					self._note_modes.selected_mode = 'looperhack'
				#elif channelized:
				#	self._note_modes.selected_mode = 'monoscale'
				elif drum_device:
					self._note_modes.selected_mode = 'sequencer'
				else:
					self._note_modes.selected_mode = 'instrument'
				self.reset_controlled_track()
	

	def _on_selected_track_changed(self):
		super(AumPush, self)._on_selected_track_changed()
		self.reset_controlled_track()
		self._main_modes.pop_groups(['add_effect'])
		self._note_repeat_enabler.selected_mode = 'disabled'
		self._select_note_mode()
	

	def disconnect(self):
		#if self.monomodular._host is self:
		#	self.monomodular.disconnect()
		self.monomodular = None
		super(AumPush, self).disconnect()
	

	def _make_current_bank_details(self, device_component):
		def _current_bank_details():
			if not self._is_mod(device_component.device()) is None:
				if self._host._active_client._device_component._device_parent != None:
					bank_name = self._host._active_client._device_component._bank_name
					bank = [param._parameter for param in self._host._active_client._device_component._params]
					if device_component._alt_pressed is True:
						bank = bank[8:]
					#self.log_message('current mod bank details: ' + str(bank_name) + ' ' + str(bank))
					return (bank_name, bank)
				else:
					return ProviderDeviceComponent._current_bank_details(device_component)
			elif not self._is_newmod(device_component.device()) is None:
				if self.modhandler.active_mod() and self.modhandler.active_mod()._param_component._device_parent != None:
					bank_name = self.modhandler.active_mod()._param_component._bank_name
					bank = [param._parameter for param in self.modhandler.active_mod()._param_component._params]
					if self.modhandler._alt_value.subject:
						if self.modhandler._alt_value.subject.is_pressed():
							bank = bank[8:]
					#self.log_message('current mod bank details: ' + str(bank_name) + ' ' + str(bank))
					return (bank_name, bank)
				else:
					return ProviderDeviceComponent._current_bank_details(device_component)
			else:
				return ProviderDeviceComponent._current_bank_details(device_component)
		return _current_bank_details
		
	

	def _make_setup_instrument_mode(self, instrument_component):
		def _setup_instrument_mode():
			if instrument_component.is_enabled() and instrument_component._matrix:
				instrument_component._matrix.reset()
				pattern = instrument_component._pattern
				max_j = instrument_component._matrix.width() - 1
				for button, (i, j) in ifilter(first, instrument_component._matrix.iterbuttons()):
					if not button == None:
						profile = 'default' if instrument_component._takeover_pads else 'instrument'
						button.sensitivity_profile = profile
						note_info = pattern.note(i, max_j - j)
						if note_info.index != None:
							button.set_on_off_values('Instrument.NoteAction', 'Instrument.' + note_info.color)
							button.turn_off()
							button.set_enabled(instrument_component._takeover_pads)
							button.set_channel(note_info.channel)
							button.set_identifier(note_info.index)
						else:
							button.set_channel(NON_FEEDBACK_CHANNEL)
							button.set_light('Instrument.' + note_info.color)
							button.set_enabled(True)
					else:
						self.log_message('button is None: ' + str(i, j))
		return _setup_instrument_mode
	

	def _is_mod(self, device):
		mod_device = None
		if isinstance(device, Live.Device.Device):
			try:
				if device.can_have_chains and not device.can_have_drum_pads and len(device.view.selected_chain.devices)>0:
					device = device.view.selected_chain.devices[0]
			except:
				pass
		if not device is None:
			if self._host and self._host._client:
				for client in self._host._client:
					if client.device == device:
						mod_device = client
						break
		#self.log_message('device is mod: ' + str(mod_device))
		return mod_device
	

	def _is_newmod(self, device):
		mod_device = None
		if isinstance(device, Live.Device.Device):
			try:
				if device.can_have_chains and not device.can_have_drum_pads and len(device.view.selected_chain.devices)>0:
					device = device.view.selected_chain.devices[0]
			except:
				pass
		if not device is None:
			if self.monomodular and self.monomodular._mods:
				for mod in self.monomodular._mods:
					if mod.device == device:
						mod_device = mod
						break
		return mod_device
	

	"""def update(self):
		self._on_session_record_changed()
		
		#removed @ 9124
		#self._on_note_repeat_mode_changed(self._note_repeat.selected_mode)
		
		if self._get_current_instrument_channel() < 0:
			self.set_feedback_channels(FEEDBACK_CHANNELS)
		self._update_calibration()
		super(Push, self).update()"""
	

	def set_highlighting_session_component(self, session_component):
		self._highlighting_session_component = session_component
		self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)
	

	def _can_auto_arm_track(self, track):
		routing = track.current_input_routing
		return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('AumPush')
	

	def _make_channel_strip_arm_value(self, channelstrip):
		def _arm_value(value):
			assert(not channelstrip._arm_button != None)
			assert(value in range(128))
			self.log_message('channelstrip arm value')
			if channelstrip.is_enabled():
				if channelstrip._track != None and channelstrip._track.can_be_armed:
					arm_exclusive = channelstrip.song().exclusive_arm != channelstrip._shift_pressed
					new_value = not channelstrip._track.arm
					respect_multi_selection = channelstrip._track.is_part_of_selection
					for track in channelstrip.song().tracks:
						if track.can_be_armed:
							if track == channelstrip._track or respect_multi_selection and track.is_part_of_selection:
								track.arm = new_value
								self.log_message('armed track')
							#elif arm_exclusive and track.arm:
							#	track.arm = False
		return _arm_value
		
	

	def _update_device_selection(self):
		if not self._host.is_modlocked():
			super(AumPush, self)._update_device_selection()
	

	
	"""
	def receive_midi(self, midi_bytes):
		self.log_message('midi in: ' + str(midi_bytes))
		super(AumPush, self).receive_midi(midi_bytes)

	

	def _do_receive_midi(self, midi_bytes):
		self.log_message('do midi in: ' + str(midi_bytes))
		super(AumPush, self)._do_receive_midi(midi_bytes)
	

	def _send_midi(self, midi_event_bytes, optimized = True):
		self.log_message('send_midi: ' + str(midi_event_bytes))
		super(AumPush, self)._send_midi(midi_event_bytes, optimized)
	

	def _do_send_midi(self, midi_event_bytes):
		self.log_message('do_send midi: ' + str(midi_event_bytes))
		super(AumPush, self)._do_send_midi(midi_event_bytes)
	
	"""

class MonomodDisplayComponent(ControlSurfaceComponent):


	def __init__(self, parent, display_strings, value_strings, *a, **k):
		assert len(display_strings) == len(value_strings)
		super(MonomodDisplayComponent, self).__init__(*a, **k)
		self.num_segments = len(display_strings)
		self._parent = parent
		self._name_display_line = None
		self._value_display_line = None
		self._name_data_sources = [ DisplayDataSource(string) for string in display_strings ]
		self._value_data_sources = [ DisplayDataSource(string) for string in value_strings ]
	

	def set_name_display_line(self, display_line):
		self._name_display_line = display_line
		if self._name_display_line:
			self._name_display_line.set_data_sources(self._name_data_sources)
	

	def set_value_display_line(self, display_line):
		self._value_display_line = display_line
		if self._value_display_line:
			self._value_display_line.set_data_sources(self._value_data_sources)
	

	def set_value_string(self, value, source = 0):
		if source in range(len(self._value_data_sources)):
			self._value_data_sources[source].set_display_string(str(value))
	

	def update(self):
		pass
	


class ModShiftBehaviour(ModeButtonBehaviour):


	def press_immediate(self, component, mode):
		component.push_mode(mode)
	

	def release_immediate(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	

	def release_delayed(self, component, mode):
		if len(component.active_modes) > 1:
			component.pop_mode(mode)
	


class PushMonomodComponent(MonomodComponent):


	def __init__(self, *a, **k):
		super(PushMonomodComponent, self).__init__(*a, **k)
		self._buttons = None
		self._shift = None
		self._is_modlocked = False
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

		self._alt_display = MonomodDisplayComponent(self, [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', 'Display', 'Mute', 'Enable', 'Select'])
		self._shift_display = MonomodDisplayComponent(self, ['ModLock', ' ', ' ', ' ', ' ', ' ', 'Channel', 'Name'], [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '])

		self._shift_modes = self.register_component(ModesComponent())
		self._shift_modes.add_mode('disabled', None)
		self._shift_modes.add_mode('alt', self._alt_display, groups = 'alt', behaviour = ModShiftBehaviour())
		self._shift_modes.add_mode('shift', self._shift_display, groups = 'shift', behaviour = ModShiftBehaviour())
		self._shift_modes.selected_mode = 'disabled'

		self._shift_display.set_value_string(self._is_modlocked, 0)
	

	alt_display_layer = forward_property('_alt_display')('layer')
	shift_display_layer = forward_property('_shift_display')('layer')

	def set_device_component(self, device_component):
		if not device_component is self._device_component:
			self._device_component = device_component
			#self._device_component.udpate()
	

	def _notify_new_connection(self, device):
		self._script._select_note_mode(device)
	

	def _select_client(self, *a, **k):
		super(PushMonomodComponent, self)._select_client(*a, **k)
		if self._active_client != None and self._active_client.device != None:
			self._shift_display.set_value_string(str(self._active_client.device.name), 7)
			self._shift_display.set_value_string(str(self._active_client._channel), 6)
		else:
			self._shift_display.set_value_string('Empty', 7)
			self._shift_display.set_value_string(str(self._active_client._channel), 6)	
	

	def udpate(self):
		#self.log_message('updating Monomodcomponent')
		super(PushMonomodComponent, self).update()
		if self.is_enabled() and not self._active_client is None:
			self._active_client._device_component.update()
		if not self._device_component is None:
			self._device_component.update()
	

	def select_active_client(self):
		if not self._active_client.linked_device() is None:
			#super(PushMonomodComponent, self).select_active_client()
			self.song().view.select_device(self._active_client.linked_device())
			for client in self._client:
				client._send('pop', client.is_active())
	

	def set_button_matrix(self, buttons):
		self._set_button_matrix(buttons)
	

	def _set_button_matrix(self, grid):
		assert isinstance(grid, (ButtonMatrixElement, type(None)))
		self._grid = grid
		self._matrix_value.subject = grid
		#self._script.log_message('set_grid: ' + str(grid))
		if not grid is None:
			for button in grid:
				button.use_default_message()
				button.set_enabled(True)
		self.update()
	

	@subject_slot('value')
	def _matrix_value(self, value, x, y, is_momentary):
		value = int(value>0)
		super(PushMonomodComponent, self)._matrix_value(value, x, y, is_momentary)
	

	def set_lock_button(self, button):
		self._on_lock_value.subject = button
		self._on_lock_value(self.is_modlocked())
	

	def set_shift_button(self, button):
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = button
		if self._shift_button != None:
			self._shift_button.add_value_listener(self._shift_value)
		#self._shift_modes.set_toggle_button(button)
		self._shift_modes.set_mode_button('shift', self._shift_button)
		#self._shift_modes.set_mode_toggle(self._shift_button)
	

	@subject_slot('value')
	def _on_lock_value(self, value):
		if value:
			self._is_modlocked = not self._is_modlocked
			self._shift_display.set_value_string("Locked" if self._is_modlocked else "Unlocked")
			button = self._on_lock_value.subject
			if not button is None:
				button.set_light('DefaultButton.Alert' if self.is_modlocked() else True)
	

	def is_modlocked(self):
		return bool(self.is_enabled() and self._is_modlocked)
	

	def set_alt_button(self, button):
		if self._alt_button != None:
			self._alt_button.remove_value_listener(self._alt_value)
		self._alt_button = button
		if self._alt_button != None:
			self._alt_button.add_value_listener(self._alt_value)
		self._shift_modes.set_mode_button('alt', self._alt_button)
	

	def _alt_value(self, value):
		super(PushMonomodComponent, self)._alt_value(value)
		if self._shift_pressed > 0 and value > 0:
			self._nav_locked = not self._nav_locked
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
		#self._script.log_message('set nav buttons ' + str(self._nav_locked))
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
	

	def on_enabled_changed(self, *a, **k):
		super(PushMonomodComponent, self).on_enabled_changed(*a, **k)
		if not self._is_enabled:
			self._is_modlocked = False
			#self._script._on_selected_track_changed()
		else:
			button = self._on_lock_value.subject
			if button:
				button.set_light(True)
	


class PushGrid(Grid):


	def __init__(self, active_handlers, name, width, height):
		self._active_handlers = active_handlers
		self._name = name
		self._cell = [[StoredElement(active_handlers, _name = self._name + '_' + str(x) + '_' + str(y), _x = x, _y = y, _id = -1, _channel = -1 ) for y in range(height)] for x in range(width)]
	

	def restore(self):
		for column in self._cell:
			for element in column:
				self.update_element(element)
				for handler in self._active_handlers():
					handler.receive_address(self._name, element._x, element._y, element, True)
	

	def identifier(self, x, y, identifier = -1):
		element = self._cell[x][y]
		element._id = min(127, max(-1, identifier))
		for handler in self._active_handlers():
			handler.receive_address(self._name, element._x, element._y, element, True)
	

	def channel(self, x, y, channel = -1):
		element = self._cell[x][y]
		element._channel = min(15, max(-1, channel))
		for handler in self._active_handlers():
			handler.receive_address(self._name, element._x, element._y, element, True)
	


class PushModHandler(ModHandler):


	def __init__(self, *a, **k):
		super(PushModHandler, self).__init__(*a, **k)
		self._push_grid = None
		self._push_grid_CC = None
		self._keys = None
		self._alt = None
		self._shift = None
		self._receive_methods = {'grid': self._receive_grid, 'push_grid': self._receive_push_grid, 'key': self._receive_key} # 'shift': self._receive_shift, 'alt': self._receive_alt}
		self._colors = range(128)
		self._colors[1:8] = [3, 85, 33, 95, 5, 21, 67]
		self._colors[127] = 67
		self._shifted = False
	

	def _register_addresses(self, client):
		#if not 'grid' in client._addresses:
		#	client._addresses['grid'] = PushGrid(client.active_handlers, 'grid', 16, 16)
		if not 'push_grid' in client._addresses:
			client._addresses['push_grid'] = PushGrid(client.active_handlers, 'push_grid', 8, 8)
		if not 'grid' in client._addresses:
			client._addresses['grid'] = client._addresses['push_grid']
		if not 'key' in client._addresses:
			client._addresses['key'] = Array(client.active_handlers, 'key', 8)
		if not 'shift' in client._addresses:
			client._addresses['shift'] = StoredElement(client.active_handlers, _name = 'shift')
		if not 'alt' in client._addresses:
			client._addresses['alt'] = StoredElement(client.active_handlers, _name = 'alt')
	

	def _receive_push_grid(self, x, y, value, is_id = False, *a, **k):
		#self.log_message('_receive_push_grid: %s %s %s %s' % (x, y, value, is_id))
		if not self._push_grid == None:
			if is_id:
				button = self._push_grid.get_button(x, y)
				if value._id is -1 and value._channel is -1:
					button.use_default_message()
					button.set_enabled(True)
				else:
					identifier = value._id
					if identifier < 0:
						identifier = button._original_identifier
					channel = value._channel
					if channel < 0:
						channel = button._original_channel
					button.set_identifier(identifier)
					button.set_channel(channel)
					button.set_enabled(False)
			else:
				#this needs to be limited to only size of the grid :(
				if x < 8 and y < 8:
					self._push_grid.send_value(x, y, self._colors[value], True)
				#else:
				#	self.log_message('out of range: ' + str(x) + ' ' + str(y) + '.')
	

	def _receive_grid(self, x, y, value, *a, **k):
		self._receive_push_grid(x, y, value, *a, **k)
		#if not self._push_grid is None:
		#	if (x - self.x_offset) in range(8) and (y - self.y_offset) in range(8):
		#		self._push_grid.send_value(x - self.x_offset, y - self.y_offset, value)	
	

	def _receive_key(self, x, value):
		#self.log_message('_receive_key: %s %s' % (x, value))
		if not self._keys is None:
			self._keys.send_value(x, 0, self._colors[value], True)
	

	def _receive_shift(self, value):
		if not self._shift is None:
			self._shift.send_value(value)
	

	def _receive_alt(self, value):
		if not self._alt is None:
			self._alt.send_value(value)
	

	def set_push_grid(self, grid):
		self._push_grid = grid
		self._push_grid_value.subject = self._push_grid
	

	def set_push_grid_CC(self, grid):
		self._push_grid_CC = grid
		self._push_grid_CC_value.subject = self._push_grid_CC
	

	def set_key_buttons(self, keys):
		self._keys = keys
		self._keys_value.subject = self._keys
	

	def set_lock_button(self, button):
		pass
	

	def set_shift_button(self, button):
		self._shift = button
		self._shift_value.subject = self._shift
	

	def set_alt_button(self, button):
		self._alt = button
		self._alt_value.subject = self._alt
	

	def update_device(self):
		if not self._push_grid_value.subject == None:
			self._device_component.update()
		#pass
	

	@subject_slot('value')
	def _keys_value(self, value, x, y, *a, **k):
		if self._active_mod:
			self._active_mod.send('key', x, value)
	

	@subject_slot('value')
	def _push_grid_value(self, value, x, y, *a, **k):
		#self.log_message('_base_grid_value ' + str(x) + str(y) + str(value))
		if self._active_mod:
			self._active_mod.send('push_grid', x, y, value)
	

	@subject_slot('value')
	def _push_grid_CC_value(self, value, x, y, *a, **k):
		#self.log_message('_base_grid_CC_value ' + str(x) + str(y) + str(value))
		if self._active_mod:
			self._active_mod.send('push_grid_CC', x, y, value)
	

	@subject_slot('value')
	def _shift_value(self, value, *a, **k):
		if self._active_mod:
			self._active_mod.send('shift', value)
	

	@subject_slot('value')
	def _alt_value(self, value, *a, **k):
		if self._active_mod:
			self._active_mod.send('alt', value)
			self.update_device()
	

		
#a