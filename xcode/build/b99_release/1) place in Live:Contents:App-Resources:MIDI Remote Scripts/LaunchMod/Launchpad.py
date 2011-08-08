# emacs-mode: -*- python-*-
import Live
from _Framework.ControlSurface import ControlSurface
from _Framework.InputControlElement import *
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from ConfigurableButtonElement import ConfigurableButtonElement
from MainSelectorComponent import MainSelectorComponent
SIDE_NOTES = (8,
 24,
 40,
 56,
 72,
 88,
 104,
 120)
class Launchpad(ControlSurface):
    __module__ = __name__
    __doc__ = " Script for Novation's Launchpad Controller "

    def __init__(self, c_instance):
        ControlSurface.__init__(self, c_instance)
        self.set_suppress_rebuild_requests(True)
        self._suppress_send_midi = True
        self._suppress_session_highlight = True
        is_momentary = True
        self._suggested_input_port = 'Launchpad'
        self._suggested_output_port = 'Launchpad'
        self._wrote_user_byte = False
        self._control_is_with_automap = False
        self._challenge = (Live.Application.get_random_int(0, 400000000) & 2139062143)
        matrix = ButtonMatrixElement()
        for row in range(8):
            button_row = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, ((row * 16) + column)) for column in range(8) ]
            matrix.add_row(tuple(button_row))

        self._config_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 0)
        self._config_button.add_value_listener(self._config_value)
        top_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_CC_TYPE, 0, (104 + index)) for index in range(8) ]
        side_buttons = [ ConfigurableButtonElement(is_momentary, MIDI_NOTE_TYPE, 0, SIDE_NOTES[index]) for index in range(8) ]
        self._selector = MainSelectorComponent(matrix, tuple(top_buttons), tuple(side_buttons), self._config_button)
        self._suppress_session_highlight = False
        self._suppress_send_midi = False
        self._user_byte_write_button = ButtonElement(is_momentary, MIDI_CC_TYPE, 0, 16)
        self._user_byte_write_button.send_value(1)
        self._user_byte_write_button.add_value_listener(self._user_byte_value)
        self._suppress_send_midi = True
        self.set_suppress_rebuild_requests(False)



    def disconnect(self):
        self._suppress_send_midi = True
        self._selector = None
        self._user_byte_write_button.remove_value_listener(self._user_byte_value)
        self._config_button.remove_value_listener(self._config_value)
        ControlSurface.disconnect(self)
        self._suppress_send_midi = False
        self._config_button.send_value(32)
        self._config_button.send_value(0)
        self._config_button = None
        self._user_byte_write_button.send_value(0)
        self._user_byte_write_button = None



    def refresh_state(self):
        ControlSurface.refresh_state(self)
        self.schedule_message(5, self._update_hardware)



    def handle_sysex(self, midi_bytes):
        if (len(midi_bytes) == 8):
            if (midi_bytes[1:5] == (0,
             32,
             41,
             6)):
                response = long(midi_bytes[5])
                response += (long(midi_bytes[6]) << 8)
                if (response == Live.Application.encrypt_challenge2(self._challenge)):
                    self._suppress_send_midi = False
                    self.set_enabled(True)



    def _send_midi(self, midi_bytes):
        if (not self._suppress_send_midi):
            ControlSurface._send_midi(self, midi_bytes)



    def _update_hardware(self):
        self._suppress_send_midi = False
        self._config_button.send_value(40)
        self._wrote_user_byte = True
        self._user_byte_write_button.send_value(1)
        self._suppress_send_midi = True
        self.set_enabled(False)
        self._suppress_send_midi = False
        self._send_challenge()



    def _send_challenge(self):
        for index in range(4):
            challenge_byte = ((self._challenge >> (8 * index)) & 127)
            self._send_midi((176,
             (17 + index),
             challenge_byte))




    def _user_byte_value(self, value):
        assert (value in range(128))
        enabled = (value == 1)
        if enabled:
            self._config_button.send_value(40)
        self._control_is_with_automap = (not enabled)
        for control in self._controls:
            if isinstance(control, ConfigurableButtonElement):
                control.set_force_next_value()

        if (not self._wrote_user_byte):
            self._selector.set_mode(0)
            self.set_enabled(enabled)
        else:
            self._wrote_user_byte = False
        self.request_rebuild_midi_map()



    def _config_value(self, value):
        assert (value in range(128))



    def _set_session_highlight(self, track_offset, scene_offset, width, height):
        if (not self._suppress_session_highlight):
            ControlSurface._set_session_highlight(self, track_offset, scene_offset, width, height)



    def _install_forwarding(self, control):
        result = False
        if ((not self._control_is_with_automap) or (control == self._user_byte_write_button)):
            result = ControlSurface._install_forwarding(self, control)
        return result



    def _translate_message(self, type, from_identifier, from_channel, to_identifier, to_channel):
        if (not self._control_is_with_automap):
            ControlSurface._translate_message(self, type, from_identifier, from_channel, to_identifier, to_channel)




# local variables:
# tab-width: 4
