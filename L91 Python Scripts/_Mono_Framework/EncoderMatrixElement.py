#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/EncoderMatrixElement.py
from __future__ import with_statement
import contextlib
from _Framework.EncoderElement import EncoderElement
from _Framework.SubjectSlot import SubjectEvent
from _Framework.Signal import Signal
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.Util import in_range
from _Framework.Debug import debug_print
from _Framework.Disconnectable import Disconnectable

class InputSignal(Signal):
    """
    Special signal type that makes sure that interaction with input
    works properly. Special input control elements that define
    value-dependent properties should use this kind of signal.
    """

    def __init__(self, sender = None, *a, **k):
        super(InputSignal, self).__init__(sender=sender, *a, **k)
        self._input_control = sender

    @contextlib.contextmanager
    def _listeners_update(self):
        old_count = self.count
        yield
        diff_count = self.count - old_count
        self._input_control._input_signal_listener_count += diff_count
        listener_count = self._input_control._input_signal_listener_count

    def connect(self, *a, **k):
        with self._listeners_update():
            super(InputSignal, self).connect(*a, **k)

    def disconnect(self, *a, **k):
        with self._listeners_update():
            super(InputSignal, self).disconnect(*a, **k)

    def disconnect_all(self, *a, **k):
        with self._listeners_update():
            super(InputSignal, self).disconnect_all(*a, **k)


class EncoderMatrixElement(NotifyingControlElement):
    """ Class representing a 2-dimensional set of buttons """

    def __init__(self, script, *a, **k):
        super(EncoderMatrixElement, self).__init__(*a, **k)
        self._script = script
        self._dials = []
        self._dial_coordinates = {}
        self._max_row_width = 0

    def disconnect(self):
        NotifyingControlElement.disconnect(self)
        self._dials = None
        self._dial_coordinates = None

    def add_row(self, dials):
        if not dials != None:
            raise AssertionError
            raise isinstance(dials, tuple) or AssertionError
            index = 0
            for dial in dials:
                raise dial != None or AssertionError
                raise isinstance(dial, EncoderElement) or AssertionError
                raise dial not in self._dial_coordinates.keys() or AssertionError
                dial.add_value_listener(self._dial_value, identify_sender=True)
                self._dial_coordinates[dial] = (index, len(self._dials))
                index += 1

            self._max_row_width = self._max_row_width < len(dials) and len(dials)
        self._dials.append(dials)

    def width(self):
        return self._max_row_width

    def height(self):
        return len(self._dials)

    def send_value(self, column, row, value, force = False):
        if not value in range(128):
            raise AssertionError
            raise column in range(self.width()) or AssertionError
            raise row in range(self.height()) or AssertionError
            len(self._dials[row]) > column and self._dials[row][column].send_value(value, force)

    def get_dial(self, column, row):
        if not column in range(self.width()):
            raise AssertionError
            raise row in range(self.height()) or AssertionError
            dial = None
            dial = len(self._dials[row]) > column and self._dials[row][column]
        return dial

    def reset(self):
        for dial_row in self._dials:
            for dial in dial_row:
                dial.send_value(0, True)

    def _dial_value(self, value, sender):
        raise isinstance(value, int) or AssertionError
        raise sender in self._dial_coordinates.keys() or AssertionError
        raise isinstance(self._dial_coordinates[sender], tuple) or AssertionError
        coordinates = tuple(self._dial_coordinates[sender])
        self.notify_value(value, coordinates[0], coordinates[1])