#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/MonoChopperComponent.py
import Live
import time
import math
from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.SceneComponent import SceneComponent
from _Framework.SessionComponent import SessionComponent
from _Framework.MixerComponent import MixerComponent
from _Framework.ClipSlotComponent import ClipSlotComponent
from _Framework.ChannelStripComponent import ChannelStripComponent
from _Framework.ButtonMatrixElement import ButtonMatrixElement

class MonoChopperComponent(ControlSurfaceComponent):
    __module__ = __name__
    __doc__ = ' Class that holds chopper variables and methods'

    def __init__(self, cs, mixer, *a, **k):
        super(MonoChopperComponent, self).__init__(*a, **k)
        self._cs = cs
        self._mixer = mixer
        self._clip_focus = None
        self._matrix = None
        self._track = self.song().view.selected_track
        self._change = time.clock()
        self.song().add_tempo_listener(self._on_tempo_change)
        self._tempo = self._cs.song().tempo
        self._on_tempo_change()
        self.on_selected_track_changed()

    def _on_tempo_change(self):
        self._tempo = self._cs.song().tempo
        self._div = 60 / self._tempo

    def _set_button_matrix(self, buttons):
        if not isinstance(buttons, (ButtonMatrixElement, type(None))):
            raise AssertionError
            if buttons != self._matrix:
                if self._matrix != None:
                    self._matrix.remove_value_listener(self._matrix_value)
                self._matrix = buttons
                self._matrix != None and self._matrix.add_value_listener(self._matrix_value)
            self._cs.request_rebuild_midi_map()

    def _matrix_value(self, value, x, y, is_momentary):
        raise self.is_enabled() and (self._matrix != None or AssertionError)
        raise value in range(128) or AssertionError
        raise x in range(self._matrix.width()) or AssertionError
        raise y in range(self._matrix.height()) or AssertionError
        if not isinstance(is_momentary, type(False)):
            raise AssertionError
            if (value != 0 or not is_momentary) and self._clip_focus != None:
                report = self._clip_focus.playing_position
                add = (time.clock() - self._change) / self._div
                pos = report + add
                new_pos = (self._clip_focus.loop_end - self._clip_focus.loop_start) / 16 * x
                change = new_pos - pos
                self._clip_focus.move_playing_pos(change)

    def _clip_playing_position(self):
        if self._clip_focus != None:
            pos = self._clip_focus.playing_position
            start = self._clip_focus.loop_start
            end = self._clip_focus.loop_end
            length = end - start
            self._change = time.clock()
            if self.is_enabled():
                for index in range(16):
                    val = int(pos > length / 16 * index)
                    self._matrix.send_value(index, 0, val, True)

    def on_selected_track_changed(self):
        if self._track != None:
            if self._track.can_be_armed:
                if self._track.playing_slot_index_has_listener(self._capture_current_clip):
                    self._track.remove_playing_slot_index_listener(self._capture_current_clip)
        self._track = self.song().view.selected_track
        if self._track != None:
            if self._track.can_be_armed:
                self._track.add_playing_slot_index_listener(self._capture_current_clip)
        self._capture_current_clip()

    def _capture_current_clip(self):
        if self._clip_focus != None:
            if self._clip_focus.playing_position_has_listener(self._clip_playing_position):
                self._clip_focus.remove_playing_position_listener(self._clip_playing_position)
        self._clip_focus = None
        if self._track != None:
            if self._track.can_be_armed:
                slot = self._track.playing_slot_index
                if slot > -1:
                    self._clip_focus = self._track.clip_slots[slot].clip
                    self._clip_focus.add_playing_position_listener(self._clip_playing_position)
        if self._clip_focus == None and self.is_enabled():
            if self._matrix != None:
                for index in range(16):
                    self._matrix.send_value(index, 0, 0, True)

    def update(self):
        pass

    def disconnect(self):
        if self._matrix != None:
            self._matrix.remove_value_listener(self._matrix_value)
        if self._track != None:
            if self._track.can_be_armed:
                if self._track.playing_slot_index_has_listener(self._capture_current_clip):
                    self._track.remove_playing_slot_index_listener(self._capture_current_clip)
        if self._clip_focus != None:
            if self._clip_focus.playing_position_has_listener(self._clip_playing_position):
                self._clip_focus.remove_playing_position_listener(self._clip_playing_position)

    def on_enabled_changed(self):
        self._capture_current_clip()