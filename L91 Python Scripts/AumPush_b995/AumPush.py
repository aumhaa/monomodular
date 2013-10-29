#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/AumPush_b995/AumPush.py
from __future__ import with_statement
import Live
from contextlib import contextmanager
from functools import partial
from itertools import izip, chain
from _Framework.Dependency import inject
from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.InputControlElement import MIDI_CC_TYPE, MIDI_NOTE_TYPE, MIDI_CC_STATUS, MIDI_NOTE_ON_STATUS
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.DisplayDataSource import DisplayDataSource
from _Framework.ModesComponent import AddLayerMode, MultiEntryMode, ModesComponent, SetAttributeMode, CancellableBehaviour, AlternativeBehaviour, ReenterBehaviour, DynamicBehaviourMixin, ExcludingBehaviourMixin, ImmediateBehaviour, LatchingBehaviour, ModeButtonBehaviour
from _Framework.SysexValueControl import SysexValueControl
from _Framework.Layer import Layer
from _Framework.Resource import PrioritizedResource
from _Framework.DeviceBankRegistry import DeviceBankRegistry
from _Framework.SubjectSlot import subject_slot, subject_slot_group
from _Framework.Util import find_if, clamp, nop, mixin, const, forward_property
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
from Push.MatrixMaps import *
from Push.NavigationNode import RackNode
from _Mono_Framework.MonomodComponent import MonomodComponent
from _Mono_Framework.MonoDeviceComponent import MonoDeviceComponent
from _Mono_Framework.ModDevices import *
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
from Push.MelodicComponent import MelodicPattern
from Push.SpecialMixerComponent import SpecialMixerComponent
from Push.SpecialChanStripComponent import SpecialChanStripComponent
from MonoScaleComponent import MonoScaleComponent
from _Mono_Framework.Mod import *
CHANNEL_TEXT = ['Ch. 1',
 'Ch. 2',
 'Ch. 3',
 'Ch. 4',
 'Ch. 5',
 'Ch. 6',
 'Ch. 7',
 'Ch. 8']

class AumPushSpecialMixerComponent(SpecialMixerComponent):

    def _create_strip(self):
        return AumPushSpecialChanStripComponent()


class AumPushSpecialChanStripComponent(SpecialChanStripComponent):

    def _arm_value(self, value):
        if not not self._arm_button != None:
            raise AssertionError
            if not value in range(128):
                raise AssertionError
                arm_exclusive = self.is_enabled() and self._track != None and self._track.can_be_armed and self.song().exclusive_arm != self._shift_pressed
                new_value = not self._track.arm
                respect_multi_selection = self._track.is_part_of_selection
                for track in self.song().tracks:
                    if track.can_be_armed:
                        if track == self._track or respect_multi_selection and track.is_part_of_selection:
                            track.arm = new_value

    def _select_value(self, value):
        if self.is_enabled() and self._track and value:
            if self._duplicate_button and self._duplicate_button.is_pressed():
                self._do_duplicate_track(self._track)
            elif self._delete_button and self._delete_button.is_pressed():
                self._do_delete_track(self._track)
            elif self._shift_pressed:
                if self._track.can_be_armed:
                    self._track.arm = not self._track.arm
            elif self._track.can_be_armed and self.song().view.selected_track == self._track:
                self._track.arm = not self._track.arm
            else:
                super(SpecialChanStripComponent, self)._select_value(value)
            if self._selector_button and self._selector_button.is_pressed():
                self._do_select_track(self._track)
                if not self._shift_pressed:
                    if self._track.is_foldable and self._select_button.is_momentary():
                        self._fold_task.restart()
                    else:
                        self._fold_task.kill()


class AumPushInstrumentComponent(InstrumentComponent):

    def _override_channel(self):
        return -1

    def _setup_instrument_mode(self, interval):
        if self.is_enabled() and self._matrix:
            for button, _ in self._matrix.iterbuttons():
                if button:
                    button.use_default_message()
                    button.force_next_send()

            pattern = self._get_pattern(interval)
            max_j = self._matrix.width() - 1
            for button, (i, j) in self._matrix.iterbuttons():
                if button:
                    note_info = pattern.note(i, max_j - j)
                    if note_info.index != None:
                        button.set_on_off_values(note_info.color, 'Instrument.NoteOff')
                        button.turn_on()
                        button.set_enabled(False)
                        override_channel = self._override_channel()
                        if override_channel > -1:
                            button.set_channel(override_channel)
                        else:
                            button.set_channel(note_info.channel)
                        button.set_identifier(note_info.index)
                    else:
                        button.set_channel(NON_FEEDBACK_CHANNEL)
                        button.set_light(note_info.color)
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
        if selected_device:
            self._script.log_message('selected_device=' + str(selected_device.name))
        if selected_device == None:
            self._set_current_node(self._make_exit_node())
            return
        is_just_default_child_selection = False
        if self._current_node and self._current_node.children:
            selected = self.selected_object
            self._script.log_message('selected=' + str(selected))
            if isinstance(selected, Live.DrumPad.DrumPad) and find_if(lambda pad: pad.chains and pad.chains[0].devices and pad.chains[0].devices[0] == selected_device, selected.canonical_parent.drum_pads):
                is_just_default_child_selection = True
            if isinstance(selected, Live.Chain.Chain) and selected_device and selected_device.canonical_parent == selected and selected.devices[0] == selected_device:
                is_just_default_child_selection = True
        if not is_just_default_child_selection:
            if selected_device:
                target = selected_device.canonical_parent
                self._script.log_message('target=' + str(target))
                if not self._current_node or self._current_node.object != target:
                    node = self._make_navigation_node(target, is_entering=False)
                    self._script.log_message('node=' + str(node))
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
            self._device._alt_pressed = False
            self._host.set_device_component(self._device)
            self._device.add_device_listener(self._on_new_device_set)
            self.set_feedback_channels(FEEDBACK_CHANNELS)
            self._hack_stepseq()
        self.log_message('<<<<<<<<<<<<<<<<<<<<<<<< AumPush ' + str(self._monomod_version) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>')

    def _init_instrument(self):
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

    def _get_current_instrument_channel(self):
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
        self._monoscale.layer = Layer(button_matrix=self._matrix, touchstrip=self._touch_strip_control, scales_toggle_button=self._scale_presets_button, octave_up_button=self._octave_up_button, octave_down_button=self._octave_down_button)
        self._monoscale.display_layer = Layer(controls=self._track_state_buttons, name_display_line=self._display_line3, value_display_line=self._display_line4)

    def _setup_mod(self):
        self._host = PushMonomodComponent(self)
        self._host.name = 'Monomod_Host'
        self._host._host_name = 'AumPush'
        self._host.layer = Layer(lock_button=self._note_mode_button, button_matrix=self._matrix, shift_button=self._shift_button, alt_button=self._select_button, key_buttons=self._track_state_buttons)
        self._host.layer.priority = 4
        self._host.alt_display_layer = Layer(name_display_line=self._display_line3, value_display_line=self._display_line4)
        self._host.shift_display_layer = Layer(name_display_line=self._display_line3, value_display_line=self._display_line4)
        self._host.nav_buttons_layer = AddLayerMode(self._host, Layer(nav_up_button=self._nav_up_button, nav_down_button=self._nav_down_button, nav_left_button=self._nav_left_button, nav_right_button=self._nav_right_button))
        self.hosts = [self._host]

    def _setup_newmod(self):
        if isinstance(__builtins__, dict):
            if 'monomodular' not in __builtins__.keys():
                __builtins__['monomodular'] = ModRouter()
            self.monomodular = __builtins__['monomodular']
        else:
            if not hasattr(__builtins__, 'monomodular'):
                setattr(__builtins__, 'monomodular', ModRouter())
            self.monomodular = __builtins__['monomodular']
        if not self.monomodular.has_host():
            self.monomodular.set_host(self)
        self.monomodular.name = 'monomodular_switcher'
        self.modhandler = PushModHandler(self)
        self.modhandler.name = 'ModHandler'
        self.modhandler.layer = Layer(lock_button=self._note_mode_button, push_grid=self._matrix, shift_button=self._shift_button, alt_button=self._select_button, key_buttons=self._track_state_buttons)

    def _init_matrix_modes(self):
        super(AumPush, self)._init_matrix_modes()
        self._setup_monoscale()
        self._setup_mod()
        self._setup_newmod()
        self._note_modes.add_mode('newmod', self.modhandler)
        self._note_modes.add_mode('mod', self._host)
        self._note_modes.add_mode('looperhack', self._audio_loop)
        self._note_modes.add_mode('monoscale', self._monoscale)

    def _init_device(self, *a, **k):
        super(AumPush, self)._init_device(*a, **k)
        self._device._current_bank_details = self._make_current_bank_details(self._device)

    def _init_mixer(self):
        self._mixer = AumPushSpecialMixerComponent(self._matrix.width())
        self._mixer.set_enabled(False)
        self._mixer.name = 'Mixer'
        self._mixer_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons)
        self._mixer_pan_send_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons, pan_send_toggle=self._pan_send_mix_mode_button, pan_send_controls=self._global_param_controls, pan_send_touch_buttons=self._global_param_touch_buttons, pan_send_names_display=self._display_line1, pan_send_graphics_display=self._display_line2, pan_send_alt_display=self._display_line3)
        self._mixer_volume_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons, volume_controls=self._global_param_controls, volume_touch_buttons=self._global_param_touch_buttons, volume_names_display=self._display_line1, volume_graphics_display=self._display_line2, volume_alt_display=self._display_line3)
        self._mixer_track_layer = Layer(track_names_display=self._display_line4, track_select_buttons=self._select_buttons, selected_controls=self._global_param_controls, track_mix_touch_buttons=self._global_param_touch_buttons, selected_names_display=self._display_line1, selected_graphics_display=self._display_line2, track_mix_alt_display=self._display_line3)
        self._mixer_solo_layer = Layer(solo_buttons=self._track_state_buttons)
        self._mixer_mute_layer = Layer(mute_buttons=self._track_state_buttons)
        self._mixer.layer = self._mixer_layer
        for track in xrange(self._matrix.width()):
            strip = self._mixer.channel_strip(track)
            strip.name = 'Channel_Strip_' + str(track)
            strip.set_invert_mute_feedback(True)
            strip._do_select_track = self._selector.on_select_track
            strip.layer = Layer(shift_button=self._shift_button, delete_button=self._delete_button, duplicate_button=self._duplicate_button, selector_button=self._select_button)

        self._mixer.selected_strip().name = 'Selected_Channel_strip'
        self._mixer.master_strip().name = 'Master_Channel_strip'
        self._mixer.master_strip()._do_select_track = self._selector.on_select_track
        self._mixer.master_strip().layer = Layer(volume_control=self._master_volume_control, cue_volume_control=ComboElement((self._shift_button,), self._master_volume_control), select_button=self._master_select_button, selector_button=self._select_button)
        self._mixer.set_enabled(True)

    def _hack_stepseq(self):
        self._step_sequencer._drum_group._update_control_from_script = self._make_update_control_from_script(self._step_sequencer._drum_group)

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
                        button.set_enabled(takeover_drums and translation_channel is PAD_FEEDBACK_CHANNEL)
                        button.sensitivity_profile = profile

        return _update_control_from_script

    def _on_new_device_set(self):
        self.schedule_message(1, self._select_note_mode)

    def _select_note_mode(self, mod_device = None):
        track = self.song().view.selected_track
        current_device = self._device._device
        mod_device = self._is_mod(current_device)
        newmod_device = self._is_newmod(current_device)
        drum_device = find_if(lambda d: d.can_have_drum_pads, track.devices)
        channelized = False
        if track.has_midi_input and track.current_input_sub_routing in ('Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8', 'Ch. 9', 'Ch. 10', 'Ch. 11', 'Ch. 12', 'Ch. 13', 'Ch. 14', 'Ch. 15', 'Ch. 16'):
            channelized = True
        if not (self._note_modes.selected_mode is 'mod' and self._host.is_modlocked()):
            self._step_sequencer.set_drum_group_device(drum_device)
            if track == None or track.is_foldable or track in self.song().return_tracks or track == self.song().master_track:
                self._note_modes.selected_mode = 'disabled'
            elif mod_device is not None:
                self._note_modes.selected_mode = 'disabled'
                self._note_modes.selected_mode = 'mod'
                if self._host._active_client is not mod_device:
                    self._host._select_client(mod_device._number)
            elif newmod_device is not None:
                self._note_modes.selected_mode = 'disabled'
                self._note_modes.selected_mode = 'newmod'
            elif track and track.has_audio_input:
                self._note_modes.selected_mode = 'looperhack'
            elif channelized:
                self._note_modes.selected_mode = 'monoscale'
            elif drum_device:
                self._note_modes.selected_mode = 'sequencer'
            else:
                self._note_modes.selected_mode = 'instrument'

    def disconnect(self):
        super(AumPush, self).disconnect()

    def _make_current_bank_details(self, device_component):

        def _current_bank_details():
            if self._is_mod(device_component.device()) is not None:
                if self._host._active_client._device_component._device_parent != None:
                    bank_name = self._host._active_client._device_component._bank_name
                    bank = [ param._parameter for param in self._host._active_client._device_component._params ]
                    if device_component._alt_pressed is True:
                        bank = bank[8:]
                    return (bank_name, bank)
                else:
                    return DisplayingDeviceComponent._current_bank_details(device_component)
            else:
                return DisplayingDeviceComponent._current_bank_details(device_component)

        return _current_bank_details

    def _is_mod(self, device):
        mod_device = None
        if isinstance(device, Live.Device.Device):
            if device.can_have_chains and not device.can_have_drum_pads and len(device.view.selected_chain.devices) > 0:
                device = device.view.selected_chain.devices[0]
        if device is not None:
            if self._host and self._host._client:
                for client in self._host._client:
                    if client.device == device:
                        mod_device = client
                        break

        return mod_device

    def _is_newmod(self, device):
        mod_device = None
        if isinstance(device, Live.Device.Device):
            if device.can_have_chains and not device.can_have_drum_pads and len(device.view.selected_chain.devices) > 0:
                device = device.view.selected_chain.devices[0]
        if device is not None:
            if self.monomodular and self.monomodular._mods:
                for mod in self.monomodular._mods:
                    if mod.device == device:
                        mod_device = mod
                        break

        return mod_device

    def update(self):
        self._on_session_record_changed()
        self._on_note_repeat_mode_changed(self._note_repeat.selected_mode)
        if self._get_current_instrument_channel() < 0:
            self.set_feedback_channels(FEEDBACK_CHANNELS)
        self._update_calibration()
        super(Push, self).update()

    def set_highlighting_session_component(self, session_component):
        self._highlighting_session_component = session_component
        self._highlighting_session_component.set_highlighting_callback(self._set_session_highlight)

    def _can_auto_arm_track(self, track):
        routing = track.current_input_routing
        return routing == 'Ext: All Ins' or routing == 'All Ins' or routing.startswith('AumPush')

    def _make_channel_strip_arm_value(self, channelstrip):

        def _arm_value(value):
            if not not channelstrip._arm_button != None:
                raise AssertionError
                if not value in range(128):
                    raise AssertionError
                    self.log_message('channelstrip arm value')
                    arm_exclusive = channelstrip.is_enabled() and channelstrip._track != None and channelstrip._track.can_be_armed and channelstrip.song().exclusive_arm != channelstrip._shift_pressed
                    new_value = not channelstrip._track.arm
                    respect_multi_selection = channelstrip._track.is_part_of_selection
                    for track in channelstrip.song().tracks:
                        if track.can_be_armed:
                            if track == channelstrip._track or respect_multi_selection and track.is_part_of_selection:
                                track.arm = new_value
                                self.log_message('armed track')

        return _arm_value

    def _update_device_selection(self):
        if not self._host.is_modlocked():
            super(AumPush, self)._update_device_selection()


class MonomodDisplayComponent(ControlSurfaceComponent):

    def __init__(self, parent, display_strings, value_strings, *a, **k):
        raise len(display_strings) == len(value_strings) or AssertionError
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
            self._color_maps[index][1:8] = [3,
             85,
             33,
             95,
             5,
             21,
             67]
            self._color_maps[index][127] = 67

        self._alt_display = MonomodDisplayComponent(self, [' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' '], [' ',
         ' ',
         ' ',
         ' ',
         'Display',
         'Mute',
         'Enable',
         'Select'])
        self._shift_display = MonomodDisplayComponent(self, ['ModLock',
         ' ',
         ' ',
         ' ',
         ' ',
         ' ',
         'Channel',
         'Name'], [' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' ',
         ' '])
        self._shift_modes = self.register_component(ModesComponent())
        self._shift_modes.add_mode('disabled', None)
        self._shift_modes.add_mode('alt', self._alt_display, groups='alt', behaviour=ModShiftBehaviour())
        self._shift_modes.add_mode('shift', self._shift_display, groups='shift', behaviour=ModShiftBehaviour())
        self._shift_modes.selected_mode = 'disabled'
        self._shift_display.set_value_string(self._is_modlocked, 0)

    alt_display_layer = forward_property('_alt_display')('layer')
    shift_display_layer = forward_property('_shift_display')('layer')

    def _matrix_value(self, value, x, y, is_momentary):
        value = int(value > 0)
        super(PushMonomodComponent, self)._matrix_value(value, x, y, is_momentary)

    def set_device_component(self, device_component):
        if device_component is not self._device_component:
            self._device_component = device_component

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
        super(PushMonomodComponent, self).update()
        if self.is_enabled() and self._active_client is not None:
            self._active_client._device_component.update()
        if self.device_component is not None:
            self._device_component.update()

    def select_active_client(self):
        if self._active_client.linked_device() is not None:
            self.song().view.select_device(self._active_client.linked_device())
            for client in self._client:
                client._send('pop', client.is_active())

    def set_button_matrix(self, buttons):
        self._set_button_matrix(buttons)

    def set_lock_button(self, button):
        self._on_lock_value.subject = button
        self._on_lock_value(self.is_modlocked())

    def set_shift_button(self, button):
        if self._shift_button != None:
            self._shift_button.remove_value_listener(self._shift_value)
        self._shift_button = button
        if self._shift_button != None:
            self._shift_button.add_value_listener(self._shift_value)
        self._shift_modes.set_mode_button('shift', self._shift_button)

    @subject_slot('value')
    def _on_lock_value(self, value):
        if value:
            self._is_modlocked = not self._is_modlocked
            self._shift_display.set_value_string('Locked' if self._is_modlocked else 'Unlocked')
            button = self._on_lock_value.subject
            if button is not None:
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
        self._device_component._alt_pressed = value > 0
        self._device_component.update()

    def set_nav_up_button(self, button):
        self._nav_up_button = button

    def set_nav_down_button(self, button):
        self._nav_down_button = button

    def set_nav_left_button(self, button):
        self._nav_left_button = button

    def set_nav_right_button(self, button):
        self._nav_right_button = button

    def set_nav_buttons(self):
        if self.nav_buttons_layer:
            if self._nav_locked:
                self.nav_buttons_layer.enter_mode()
            else:
                self.nav_buttons_layer.leave_mode()
        nav_buttons = [self._nav_up_button,
         self._nav_down_button,
         self._nav_left_button,
         self._nav_right_button]
        if None not in nav_buttons and self._nav_locked:
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
        if not (buttons != None and len(buttons) == 4):
            raise AssertionError
            self._nav_buttons[0].add_value_listener(self._nav_up_value)
            self._nav_buttons[1].add_value_listener(self._nav_down_value)
            self._nav_buttons[2].add_value_listener(self._nav_left_value)
            self._nav_buttons[3].add_value_listener(self._nav_right_value)

    def set_device_controls(self, controls):
        if controls != self._device_controls:
            self._device_controls = controls
            if self._client != None:
                if controls is not None:
                    self._set_parameter_controls([ control for control in controls ])
                else:
                    self._set_parameter_controls(None)

    def set_key_buttons(self, buttons):
        key_buttons = None
        if isinstance(buttons, ButtonMatrixElement):
            key_buttons = tuple([ button for button in buttons ])
        self._set_key_buttons(key_buttons)

    def set_lcd_displays(self, lcds):
        if lcds != self._lcd_displays:
            self._lcd_displays = lcds

    def _send_to_lcd(self, column, row, wheel):
        if self.is_enabled() and not self._active_client._device_component.is_enabled():
            self._script.log_message(str(wheel['pn']) + ' ' + str(wheel['pv']) + ' ' + str(self._dial_matrix.get_dial(column, row)))

    def on_enabled_changed(self, *a, **k):
        super(PushMonomodComponent, self).on_enabled_changed(*a, **k)
        if not self._is_enabled:
            self._is_modlocked = False
            self._script._on_selected_track_changed()
        else:
            button = self._on_lock_value.subject
            if button:
                button.set_light(True)


class PushGrid(Grid):

    def __init__(self, active_handlers, name, width, height):
        self._active_handlers = active_handlers
        self._name = name
        self._cell = [ [ StoredElement(active_handlers, _name=self._name + '_' + str(x) + '_' + str(y), _x=x, _y=y, _id=-1, _channel=-1) for y in range(height) ] for x in range(width) ]

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
        self._receive_methods = {'grid': self._receive_grid,
         'push_grid': self._receive_push_grid,
         'key': self._receive_key}
        self._shifted = False

    def _register_addresses(self, client):
        if 'push_grid' not in client._addresses:
            client._addresses['push_grid'] = PushGrid(client.active_handlers, 'push_grid', 8, 8)
        if 'key' not in client._addresses:
            client._addresses['key'] = Array(client.active_handlers, 'key', 8)

    def _receive_push_grid(self, x, y, value, is_id = False):
        self.log_message('_receive_base_grid: %s %s %s %s' % (x,
         y,
         value,
         is_id))
        if self._push_grid is not None:
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
                self._push_grid.send_value(x, y, value, True)

    def _receive_key(self, x, value):
        if self._keys is not None:
            self._keys.send_value(x, 0, value, True)

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
        pass

    def set_alt_button(self, button):
        pass

    @subject_slot('value')
    def _keys_value(self, value, x, y, *a, **k):
        if self._active_mod:
            self._active_mod.send('key', x, value)

    @subject_slot('value')
    def _push_grid_value(self, value, x, y, *a, **k):
        self.log_message('_base_grid_value ' + str(x) + str(y) + str(value))
        if self._active_mod:
            self._active_mod.send('push_grid', x, y, value)

    @subject_slot('value')
    def _push_grid_CC_value(self, value, x, y, *a, **k):
        self.log_message('_base_grid_CC_value ' + str(x) + str(y) + str(value))
        if self._active_mod:
            self._active_mod.send('push_grid_CC', x, y, value)