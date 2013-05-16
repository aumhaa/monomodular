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

DISCRETE_PARAMETERS_DICT = {'GlueCompressor': ('Ratio', 'Attack', 'Release', 'Peak Clip In')}

def is_parameter_quantized(parameter, parent_device):
	is_quantized = False
	if parameter != None:
		device_class = parent_device.class_name
		is_quantized = parameter.is_quantized or device_class in DISCRETE_PARAMETERS_DICT and parameter.name in DISCRETE_PARAMETERS_DICT[device_class]
	return is_quantized


def graphic_bar_for_parameter(parameter):
	if parameter.min == -1 * parameter.max:
		return GRAPH_PAN
	elif parameter.is_quantized:
		return GRAPH_SIN
	return GRAPH_VOL


def convert_parameter_value_to_graphic(param):
	if param != None:
		param_range = param.max - param.min
		param_bar = graphic_bar_for_parameter(param)
		graph_range = len(param_bar) - 1
		value = int((param.value - param.min) / param_range * graph_range)
		graphic_display_string = param_bar[value]
	else:
		graphic_display_string = ' '
	return graphic_display_string


from _Framework.DisplayDataSource import DisplayDataSource

class AumPushDisplayingDeviceComponent(MonoDeviceComponent):
	"""
	Special device class that displays parameter values
	"""


	def __init__(self, *a, **k):
		super(AumPushDisplayingDeviceComponent, self).__init__(*a, **k)
		self._parameter_name_data_sources = [ DisplayDataSource(' ') for _ in xrange(8) ]
		self._parameter_value_data_sources = [ DisplayDataSource(' ') for _ in xrange(8) ]
		self._parameter_graphic_data_sources = [ DisplayDataSource(' ') for _ in xrange(8) ]
		self._blank_data_sources = [ DisplayDataSource(' ') for _ in xrange(8) ]
		self._mapped_parameters = []
		self._alternating_display = None
		self._encoder_touch_buttons = []
		self._device_banks = MOD_TYPES
		self._device_best_banks = MOD_TYPES
		self._device_bank_names = MOD_BANK_DICT
		self._device_bank_registry = {}
	

	def set_device(self, *a, **k):
		super(AumPushDisplayingDeviceComponent, self).set_device(*a, **k)
		if self._device == None:
			for source in chain(self._parameter_name_data_sources, self._parameter_value_data_sources, self._parameter_graphic_data_sources):
				source.set_display_string(' ')
	

	def set_encoder_touch_buttons(self, encoder_touch_buttons):
		if not encoder_touch_buttons:
			encoder_touch_buttons = []
		if self._encoder_touch_buttons != encoder_touch_buttons:
			self._encoder_touch_buttons = encoder_touch_buttons
			self._on_encoder_touch_value.subject = encoder_touch_buttons or None
		self._try_set_alternate_display()
	

	def set_alternating_display(self, display):
		#self._parent._host.log_message('set alternating display: ' + str(display))
		if not display:
			display = None
		if self._alternating_display != display:
			self._alternating_display = display
		self._try_set_alternate_display()
	

	def set_name_display_line(self, line):
		#self._parent._host.log_message('set name display: ' + str(line))
		self._set_display_line(line, self._parameter_name_data_sources)
	

	def set_value_display_line(self, line):
		#self._parent._host.log_message('set value display: ' + str(line))
		self._set_display_line(line, self._parameter_value_data_sources)
	

	def set_graphic_display_line(self, line):
		#self._parent._host.log_message('set graphic display: ' + str(line))
		self._set_display_line(line, self._parameter_graphic_data_sources)
	

	def _set_display_line(self, line, sources):
		if line:
			line.set_num_segments(len(sources))
			for segment in xrange(len(sources)):
				line.segment(segment).set_data_source(sources[segment])
	

	def parameter_value_data_source(self, index):
		return self._parameter_value_data_sources[index]
	

	def parameter_name_data_source(self, index):
		return self._parameter_name_data_sources[index]
	

	def _is_banking_enabled(self):
		return True
	

	def _assign_parameters(self, host, *a, **k):
		if hasattr(host, 'is_push'):
			self._update_mapping_sensitivity()		
			self.set_encoder_touch_buttons(host._encoder_touch_buttons)
			self.set_alternating_display(host._alternating_display_line)
			self.set_name_display_line(host._name_display_line)
			self.set_value_display_line(host._value_display_line)

		#self._parent._host.log_message('assign_parameters '+str(host))
		assert self.is_enabled()
		assert (self._device != None)
		assert (host._parameter_controls != None)
		if(host.is_enabled()):
			host_is_push = hasattr(host, 'is_push')
			for control in host._parameter_controls:
				control.clear_send_cache()
			self._bank_name = ('Bank ' + str(self._bank_index + 1)) #added
			if (self._device.class_name in self._device_banks.keys()): #modified
				assert (self._device.class_name in self._device_best_banks.keys())
				banks = self._device_banks[self._device.class_name]
				if '_alt_device_banks' in dir(host):
					if self._type in host._alt_device_banks.keys():
						if (self._device.class_name in host._alt_device_banks[self._type].keys()):
							banks = host._alt_device_banks[self._type][self._device.class_name]
				bank = None
				if (len(banks) > self._bank_index):
					bank = banks[self._bank_index]
					if self._is_banking_enabled(): #added
						if self._device.class_name in self._device_bank_names.keys(): #added
							self._bank_name[self._bank_index] = self._device_bank_names[self._device.class_name] #added *recheck
				#assert (bank == None)	# or (len(bank) >= len(self._parameter_controls)))
				if host_is_push:
					self._mapped_parameters = []
				shift_knobs = int(host._alt_pressed and host_is_push) * 4
				for index in range(len(host._parameter_controls)):
					parameter_index = index + (shift_knobs * (index > 3))
					#self._parent._host.log_message('index: ' + str(parameter_index) + ' ' + str(shift_knobs))
					parameter = None
					if (bank != None) and (parameter_index in range(len(bank))):
						parameter = self.get_parameter_by_name(self._device, bank[parameter_index])
					if (parameter != None):
						host._parameter_controls[index].connect_to(parameter)
					else:
						host._parameter_controls[index].release_parameter()
					if host_is_push:
						self._mapped_parameters.append(parameter)
			else:
				parameters = self._device_parameters_to_map(host)
				if host_is_push:
					self._mapped_parameters = parameters
				num_controls = len(host._parameter_controls)
				index = (self._bank_index * num_controls)
				for control in host._parameter_controls:
					if (index < len(parameters)):
						control.connect_to(parameters[index])
					else:
						control.release_parameter()
					index += 1

			#_, self._mapped_parameters = self._current_bank_details()
			#self._parent._host.log_message('new parameters: ' + str(self._mapped_parameters))
			parameters = map(self._mapped_parameter, xrange(len(self._parameter_name_data_sources)))
			self._update_parameter_values()
			for parameter, name_data_source in zip(parameters, self._parameter_name_data_sources):
				param_name = parameter.name if parameter else ' '
				name_data_source.set_display_string(param_name)			
		#super(AumPushDisplayingDeviceComponent, self)._assign_parameters(host, *a, **k)
	

	def _on_device_name_changed(self):
		if self._device_name_data_source != None:
			if self.is_enabled() and self._device != None:
				self._device_name_data_source.set_display_string(self._device.name)
			else:
				self._device_name_data_source.set_display_string('No Device')
	

	@subject_slot_group('value')
	def _on_parameter_value_changed(self, parameter):
		self._update_parameter_values()
	

	def _params_value_change(self, *a, **k):
		super(AumPushDisplayingDeviceComponent, self)._params_value_change(*a, **k)
		self._update_parameter_values()
	

	def _update_parameter_values(self):
		#self._parent._host.log_message('update, enabled?: ' + str(self.is_enabled()))
		if self.is_enabled():
			for index, data_source in enumerate(self._parameter_value_data_sources):
				parameter = self._mapped_parameter(index)
				data_source.set_display_string(' ' if parameter == None else unicode(parameter))
				#self._parent._host.log_message('parameter: ' + str(' ' if parameter == None else unicode(parameter)))

			for index, data_source in enumerate(self._parameter_graphic_data_sources):
				param = self._mapped_parameter(index)
				graph = convert_parameter_value_to_graphic(param)
				data_source.set_display_string(graph)
	

	def _update_mapping_sensitivity(self):
		device = self.device()
		if device != None:
			if self._parameter_controls:
				for control in self._parameter_controls:
					if control != None:
						parameter = control.mapped_parameter()
						is_quantized = is_parameter_quantized(parameter, device)
						control.mapping_sensitivity = QUANTIZED_MAPPING_SENSITIVITY if is_quantized else CONTINUOUS_MAPPING_SENSITIVITY
	

	def _mapped_parameter(self, index):
		if index < len(self._mapped_parameters):
			return self._mapped_parameters[index] 
		else:
			return None
	

	@subject_slot('value')
	def _on_encoder_touch_value(self, value, x, y, is_momentary):
		self._try_set_alternate_display()
	

	def _try_set_alternate_display(self):
		if self._alternating_display != None:
			for button in self._encoder_touch_buttons:
				if button and button.is_pressed():
					self.set_graphic_display_line(self._alternating_display)
					return
			else:
				self._set_display_line(self._alternating_display, self._blank_data_sources)
	

	def _current_bank_details(self):
		bank_name = self._bank_name
		bank = []
		#best_of = self._best_of_parameter_bank()
		if not self._device is None:
			banks = self._device_banks[self._device.class_name]
			bank_names = self._device_bank_names
			if banks and len(banks)>0:
				if self._bank_index != None:
					index = self._bank_index if self._bank_index != None else 0
					#names = banks[index]
					bank = [self.get_parameter_by_name(self.device(), name) for name in banks[index]]
					if self._device.class_name in bank_names.keys():
						bank_name = bank_names[self._device.class_name][index]
					else:
						bank_name = "-"
		return (bank_name, bank)
	

	def device(self):
		return self._device
	


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
		self._host.layer = Layer( button_matrix = self._matrix, shift_button = self._shift_button, alt_button = self._select_button, nav_up_button = self._nav_up_button, nav_down_button = self._nav_down_button, nav_left_button = self._nav_left_button, nav_right_button = self._nav_right_button, encoder_touch_buttons=self._global_param_touch_buttons, name_display_line=self._display_line1, value_display_line=self._display_line2, alternating_display=self._display_line3, device_controls = self._global_param_controls, key_buttons = self._track_state_buttons )  #, lcd_displays = self._display_line1)
		self._host.layer.priority = 4
		self.hosts = [self._host]
	

	def _init_matrix_modes(self):
		super(AumPush, self)._init_matrix_modes()
		self._setup_mod()
		self._note_modes.add_mode('mod', self._host)
		self._note_modes.add_mode('looperhack', self._audio_loop)
	

	def _init_global_actions(self, *a, **k):
		super(AumPush, self)._init_global_actions(*a, **k)
		self._tempo._display.update = self._make_display_update(self._tempo._display)
		self._swing_amount._display.update = self._make_display_update(self._swing_amount._display)
		self._master_vol._display.update = self._make_parameter_display_update(self._master_vol._display)
	

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
			#self._device.set_enabled(False)
			self._note_modes.selected_mode = 'mod'
			self._update_monodevice_hack()
		elif track and track.has_audio_input:
			self._note_modes.selected_mode = 'looperhack'
		elif drum_device:
			self._note_modes.selected_mode = 'sequencer'
		else:
			self._note_modes.selected_mode = 'instrument'
	

	def disconnect(self):
		super(AumPush, self).disconnect()
	

	def _make_display_update(self, display):
		def update():
			ValueDisplayComponent.update(display)
			if not display.is_enabled():
				self._update_monodevice_hack()
		return update
		
	

	def _make_parameter_display_update(self, display):
		def update():
			ParameterValueDisplayComponent.update(display)
			if not display.is_enabled():
				self._update_monodevice_hack()
		return update
		
	

	def _update_monodevice_hack(self):
		#self.log_message('update hack')
		if self._note_modes.selected_mode is 'mod':
			self._host._active_client._device_component.update()
	


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
		self._parameter_controls = []
		self._encoder_touch_buttons = []
		self._alternating_display_line = None
		self._name_display_line = None
		self._value_display_line = None
		self._graphic_display_line = None
		self._device_buttons = None
		self.is_push = True
		self._parameter_controls = []
		for index in range(16):
			self._color_maps[index][1:8] = [3, 85, 33, 95, 5, 21, 67]
			self._color_maps[index][127] = 67
	

	def udpate(self):
		super(PushMonomodComponent, self).update()
		if (self.is_enabled()) and (self._active_client != None):
			self._active_client._device_component.update()
		self._script.schedule_message(3, self._select_note_mode)
	

	def _select_client(self, number):
		if not isinstance(self._client[number]._device_component,  AumPushDisplayingDeviceComponent):
			with self._script.component_guard():
				self._client[number]._device_component = AumPushDisplayingDeviceComponent(self._client[number], MOD_BANK_DICT, MOD_TYPES)
		super(PushMonomodComponent, self)._select_client(number)
	

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
		self._active_client._device_component.update()
	

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
	

	def set_encoder_touch_buttons(self, encoder_touch_buttons):
		if not encoder_touch_buttons:
			encoder_touch_buttons = []
		self._encoder_touch_buttons = encoder_touch_buttons
	

	def set_alternating_display(self, line = None):
		self._alternating_display_line = line
	

	def set_name_display_line(self, line = None):
		self._name_display_line = line
	

	def set_value_display_line(self, line = None):
		self._value_display_line = line
	

	def set_graphic_display_line(self, line = None):
		self._graphic_display_line = line
	

	#@subject_slot('value')
	#def _on_device_control_value(self, *a, **k):
	#	pass	

	@subject_slot('value')
	def _on_device_buttons_value(self, value, column, row, *a, **k):
		row = int(column/4)+1
		column = (column%4)
		self._script.log_message('device_buttons ' + str(column) + ' ' + str(row) + ' ' + str(value))
		self._active_client._send_c_dial_button(column, row, int(value>0))
	

	@subject_slot('value')
	def _on_shift_value(self, value, *a, **k):
		self._script.log_message('shift value ' + str(value))
	

	@subject_slot('value')
	def _on_matrix_value(self, value, x, y, is_momentary):
		#if self.is_enabled():
		self._script.log_message('on matrix value ' + str(x) + ' ' + ' ' + str(y) + ' ' + str(value))
	





#a