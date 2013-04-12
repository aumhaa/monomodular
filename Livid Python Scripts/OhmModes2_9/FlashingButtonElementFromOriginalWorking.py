# 2013.03.09 19:22:44 PST
#Embedded file name: /Applications/Ableton Live 9 Beta.app/Contents/App-Resources/MIDI Remote Scripts/OhmModes2/FlashingButtonElement.py
import Live
from _Framework.ButtonElement import ButtonElement
from _Framework.InputControlElement import InputControlElement
from _Framework.NotifyingControlElement import NotifyingControlElement
from Ohm64_Map import COLOR_MAP
MIDI_NOTE_TYPE = 0
MIDI_CC_TYPE = 1
MIDI_PB_TYPE = 2
MIDI_MSG_TYPES = (MIDI_NOTE_TYPE, MIDI_CC_TYPE, MIDI_PB_TYPE)
MIDI_NOTE_ON_STATUS = 144
MIDI_NOTE_OFF_STATUS = 128
MIDI_CC_STATUS = 176
MIDI_PB_STATUS = 224

class FlashingButtonElement(ButtonElement):
    __module__ = __name__
    __doc__ = ' Special button class that can be configured with custom on- and off-values, some of which flash at specified intervals called by _Update_Display'

    def __init__(self, is_momentary, msg_type, channel, identifier, name, cs):
        ButtonElement.__init__(self, is_momentary, msg_type, channel, identifier)
        self._flash_state = 0
        self._color = 0
        self._on_value = 127
        self._off_value = 0
        self._last_sent_val = -1
        self._is_enabled = True
        self._is_notifying = False
        self._force_next_value = False
        self.name = name
        self._parameter = None
        self._script = cs
        self._is_enabled = True
        self._report_input = False
        self._trans_id = self._original_identifier

    def set_on_off_values(self, on_value, off_value):
        raise on_value in range(128) or AssertionError
        raise off_value in range(128) or AssertionError
        self._last_sent_val = -1
        self._on_value = on_value
        self._off_value = off_value

    def set_force_next_value(self):
        self._force_next_value = True

    def set_enabled(self, enabled):
        self._is_enabled = enabled

    def turn_on(self):
        self.send_value(self._on_value)

    def turn_off(self):
        self.send_value(self._off_value)

    def reset(self):
        self.send_value(0)

    def receive_value(self, value):
        self._last_sent_val = -1
        ButtonElement.receive_value(self, value)

    def send_value(self, value, force_send = False):
        raise type(self) != type(None) and (value != None or AssertionError)
        raise isinstance(value, int) or AssertionError
        if not value in range(128):
            raise AssertionError
            if force_send or value != self._last_sent_val and self._is_being_forwarded:
                data_byte1 = self._original_identifier
                if value in range(1, 127):
                    data_byte2 = COLOR_MAP[(value - 1) % 6]
                elif value == 127:
                    data_byte2 = COLOR_MAP[6]
                else:
                    data_byte2 = 0
                self._color = data_byte2
                status_byte = self._original_channel
                if self._msg_type == MIDI_NOTE_TYPE:
                    status_byte += MIDI_NOTE_ON_STATUS
                elif self._msg_type == MIDI_CC_TYPE:
                    status_byte += MIDI_CC_STATUS
                else:
                    raise False or AssertionError
                self.send_midi(tuple([status_byte, data_byte1, data_byte2]))
                self._last_sent_val = value
                if self._report_output:
                    is_input = True
                    self._report_value(value, not is_input)
                self._flash_state = round((value - 1) / 7)

    def script_wants_forwarding(self):
        if not self._is_enabled:
            return False
        else:
            return InputControlElement.script_wants_forwarding(self)

    def flash(self, timer):
        if self._is_being_forwarded and self._flash_state in range(1, 18) and timer % self._flash_state == 0:
            data_byte1 = self._original_identifier
            data_byte2 = self._color * int(timer % (self._flash_state * 2) > 0)
            status_byte = self._original_channel
            if self._msg_type == MIDI_NOTE_TYPE:
                status_byte += MIDI_NOTE_ON_STATUS
            elif self._msg_type == MIDI_CC_TYPE:
                status_byte += MIDI_CC_STATUS
            else:
                raise False or AssertionError
            self.send_midi(tuple([status_byte, data_byte1, data_byte2]))
# okay decompyling /Applications/Ableton Live 9 Beta.app/Contents/App-Resources/MIDI Remote Scripts/OhmModes2_b9061/FlashingButtonElement.pyc 
# decompiled 1 files: 1 okay, 0 failed, 0 verify failed
# 2013.03.09 19:22:44 PST
