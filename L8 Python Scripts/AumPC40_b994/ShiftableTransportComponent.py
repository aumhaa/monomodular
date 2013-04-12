
import Live
from _Framework.TransportComponent import TransportComponent
from _Framework.ButtonElement import ButtonElement
class ShiftableTransportComponent(TransportComponent):
    __doc__ = ' TransportComponent that only uses certain buttons if a shift button is pressed '

    def __init__(self):
        TransportComponent.__init__(self)
        self._shift_button = None
        self._quant_toggle_button = None
        self._shift_pressed = False
        self._last_quant_value = Live.Song.RecordingQuantization.rec_q_eight
        self.song().add_midi_recording_quantization_listener(self._on_quantisation_changed)
        self._on_quantisation_changed()


    def disconnect(self):
        TransportComponent.disconnect(self)
        if self._shift_button != None:
            self._shift_button.remove_value_listener(self._shift_value)
            self._shift_button = None
        if self._quant_toggle_button != None:
            self._quant_toggle_button.remove_value_listener(self._quant_toggle_value)
            self._quant_toggle_button = None
        self.song().remove_midi_recording_quantization_listener(self._on_quantisation_changed)


    def set_shift_button(self, button):
        assert ((button == None) or (isinstance(button, ButtonElement) and button.is_momentary()))
        if self._shift_button != button:
            if self._shift_button != None:
                self._shift_button.remove_value_listener(self._shift_value)
            self._shift_button = button
            if self._shift_button != None:
                self._shift_button.add_value_listener(self._shift_value)
            #self._rebuild_callback()
            self.update()


    def set_quant_toggle_button(self, button):
        assert ((button == None) or (isinstance(button, ButtonElement) and button.is_momentary()))
        if self._quant_toggle_button != button:
            if self._quant_toggle_button != None:
                self._quant_toggle_button.remove_value_listener(self._quant_toggle_value)
            self._quant_toggle_button = button
            if self._quant_toggle_button != None:
                self._quant_toggle_button.add_value_listener(self._quant_toggle_value)
            #self._rebuild_callback()
            self.update()


    def update(self):
        self._on_metronome_changed()
        self._on_overdub_changed()
        self._on_quantisation_changed()


    def _shift_value(self, value):
        assert (self._shift_button != None)
        assert (value in range(128))
        self._shift_pressed = value != 0
        if self.is_enabled():
            self.update()


    def _metronome_value(self, value):
        if not self._shift_pressed:
            TransportComponent._metronome_value(self, value)


    def _overdub_value(self, value):
        if not self._shift_pressed:
            TransportComponent._overdub_value(self, value)


    def _quant_toggle_value(self, value):
        assert (self._quant_toggle_button != None)
        assert (value in range(128))
        assert (self._last_quant_value != Live.Song.RecordingQuantization.rec_q_no_q)
        if (self.is_enabled() and (not self._shift_pressed)):
            if ((value != 0) or (not self._quant_toggle_button.is_momentary())):
                quant_value = self.song().midi_recording_quantization
                if (quant_value != Live.Song.RecordingQuantization.rec_q_no_q):
                    self._last_quant_value = quant_value
                    self.song().midi_recording_quantization = Live.Song.RecordingQuantization.rec_q_no_q
                else:
                    self.song().midi_recording_quantization = self._last_quant_value


    def _on_metronome_changed(self):
        if not self._shift_pressed:
            TransportComponent._on_metronome_changed(self)


    def _on_overdub_changed(self):
        if not self._shift_pressed:
            TransportComponent._on_overdub_changed(self)


    def _on_quantisation_changed(self):
        if self.is_enabled():
            quant_value = self.song().midi_recording_quantization
            quant_on = (quant_value != Live.Song.RecordingQuantization.rec_q_no_q)
            if quant_on:
                self._last_quant_value = quant_value
            if ((not self._shift_pressed) and (self._quant_toggle_button != None)):
                if quant_on:
                    self._quant_toggle_button.turn_on()
                else:
                    self._quant_toggle_button.turn_off()
