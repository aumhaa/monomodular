#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/DeviceSelectorComponent.py
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Mono_Framework.MonoButtonElement import MonoButtonElement
from _Tools.re import *

class DeviceSelectorComponent(ModeSelectorComponent):
    __module__ = __name__
    __doc__ = ' Class for switching between modes, handle several functions with few controls '

    def __init__(self, script, *a, **k):
        super(DeviceSelectorComponent, self).__init__(*a, **k)
        self._script = script
        self._mode_index = 0
        self._number_of_modes = 0
        self._offset = 0
        self._buttons = None
        self._last_preset = 0

    def set_offset(self, offset = 0):
        raise isinstance(offset, int) or AssertionError
        self._offset = offset
        self.update()

    def assign_buttons(self, buttons, offset = 0):
        raise isinstance(offset, int) or AssertionError
        self._offset = offset
        if buttons != None:
            for button in buttons:
                raise isinstance(button, MonoButtonElement) or AssertionError

            self._buttons = buttons
        self.update()

    def set_mode_buttons(self, buttons):
        for button in self._modes_buttons:
            button.remove_value_listener(self._mode_value)

        self._modes_buttons = []
        if buttons != None:
            for button in buttons:
                raise isinstance(button, ButtonElement or MonoButtonElement) or AssertionError
                identify_sender = True
                button.add_value_listener(self._mode_value, identify_sender)
                self._modes_buttons.append(button)
                self._number_of_modes = len(self._modes_buttons) + self._offset

            for index in range(len(self._modes_buttons)):
                if index + self._offset == self._last_preset:
                    self._modes_buttons[index].turn_on()
                else:
                    self._modes_buttons[index].turn_off()

    def set_mode_toggle(self, button):
        if not (button == None or isinstance(button, ButtonElement or MonoButtonElement)):
            raise AssertionError
            if self._mode_toggle != None:
                self._mode_toggle.remove_value_listener(self._toggle_value)
            self._mode_toggle = button
            self._mode_toggle != None and self._mode_toggle.add_value_listener(self._toggle_value)

    def number_of_modes(self):
        return self._number_of_modes

    def update(self):
        if self.is_enabled() is False:
            self.set_mode_buttons(None)
        elif self.is_enabled() is True:
            if len(self._modes_buttons) is 0:
                self.set_mode_buttons(self._buttons)
        key = str('p' + str(self._mode_index + 1 + self._offset))
        preset = None
        for track in range(len(self.song().tracks)):
            for device in range(len(self.song().tracks[track].devices)):
                if match(key, str(self.song().tracks[track].devices[device].name)) != None:
                    preset = self.song().tracks[track].devices[device]

        for return_track in range(len(self.song().return_tracks)):
            for device in range(len(self.song().return_tracks[return_track].devices)):
                if match(key, str(self.song().return_tracks[return_track].devices[device].name)) != None:
                    preset = self.song().return_tracks[return_track].devices[device]

        for device in range(len(self.song().master_track.devices)):
            if match(key, str(self.song().master_track.devices[device].name)) != None:
                preset = self.song().master_track.devices[device]

        if preset != None:
            self._script.set_appointed_device(preset)
            self._last_preset = self._mode_index + self._offset
        for button in range(len(self._modes_buttons)):
            if button + self._offset == self._last_preset:
                self._modes_buttons[button].turn_on()
            else:
                self._modes_buttons[button].turn_off()

    def on_enabled_changed(self):
        if self.is_enabled() is False:
            self.set_mode_buttons(None)
        elif self.is_enabled() is True:
            if len(self._modes_buttons) is 0:
                self.set_mode_buttons(self._buttons)
        for button in range(len(self._modes_buttons)):
            if button + self._offset == self._last_preset:
                self._modes_buttons[button].turn_on()
            else:
                self._modes_buttons[button].turn_off()