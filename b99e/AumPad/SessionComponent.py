# --== Decompile ==--

import Live
from CompoundComponent import CompoundComponent
from ControlSurfaceComponent import ControlSurfaceComponent
from SceneComponent import SceneComponent
from MixerComponent import MixerComponent
from ButtonElement import ButtonElement
INITIAL_SCROLLING_DELAY = 5
INTERVAL_SCROLLING_DELAY = 1

class SessionComponent(CompoundComponent):
    __doc__ = " Class encompassing several scene to cover a defined section of Live's session "
    _session_highlighting_callback = None

    def set_highlighting_callback(callback):
        """ set callback for setting the session highlight """
        assert (dir(callback).count('im_func') is 1)
        SessionComponent._session_highlighting_callback = callback

    set_highlighting_callback = staticmethod(set_highlighting_callback)

    def release_class_attributes():
        """ release all set objects to not have dependencies """
        SessionComponent._session_highlighting_callback = None
        return None

    release_class_attributes = staticmethod(release_class_attributes)

    _linked_session_instances = []
    _minimal_track_offset = -1
    _minimal_scene_offset = -1

    def _perform_offset_change(track_increment, scene_increment):
        """ Performs the given offset changes """
        assert (len(SessionComponent._linked_session_instances) > 0)
        scenes = Live.Application.get_application().get_document().scenes
        instances_covering_session = 0
        found_negative_offset = False
        minimal_track_offset = -1
        minimal_scene_offset = -1
        for instance in SessionComponent._linked_session_instances:
            new_track_offset = instance.track_offset() + track_increment
            new_scene_offset = instance.scene_offset() + scene_increment
            if (new_track_offset >= 0) and (new_scene_offset >= 0):
                if (new_track_offset < len(instance.tracks_to_use())) and (new_scene_offset < len(scenes)):
                    instances_covering_session += 1
                    if minimal_track_offset < 0:
                        minimal_track_offset = new_track_offset
                    else:
                        minimal_track_offset = min(minimal_track_offset, new_track_offset) 
                    if minimal_scene_offset < 0:
                        minimal_scene_offset = new_scene_offset
                    else:
                        minimal_scene_offset = min(minimal_scene_offset, new_scene_offset)
            else:
                found_negative_offset = True
                break
        if (not found_negative_offset) and (instances_covering_session > 0):
            SessionComponent._minimal_track_offset = minimal_track_offset
            SessionComponent._minimal_scene_offset = minimal_scene_offset
            for instance in SessionComponent._linked_session_instances:
                instance._change_offsets(track_increment, scene_increment)

    _perform_offset_change = staticmethod(_perform_offset_change)

    def __init__(self, num_tracks, num_scenes):
        assert (SessionComponent._session_highlighting_callback != None)
        assert isinstance(num_tracks, int)
        assert (num_tracks >= 0)
        assert isinstance(num_scenes, int)
        assert (num_scenes >= 0)
        CompoundComponent.__init__(self)
        self._track_offset = -1
        self._scene_offset = -1
        self._num_tracks = num_tracks
        self._bank_up_button = None
        self._bank_down_button = None
        self._bank_right_button = None
        self._bank_left_button = None
        self._stop_all_button = None
        self._next_scene_button = None
        self._prev_scene_button = None
        self._stop_track_clip_buttons = None
        self._scroll_up_ticks_delay = -1
        self._scroll_down_ticks_delay = -1
        self._scroll_right_ticks_delay = -1
        self._scroll_left_ticks_delay = -1
        self._stop_track_clip_value = 127
        self._offset_callbacks = []
        self._highlighting_callback = SessionComponent._session_highlighting_callback
        self._show_highlight = ((num_tracks > 0) and (num_scenes > 0))
        self._mixer = None
        self._selected_scene = SceneComponent(self._num_tracks, self.tracks_to_use)
        self.on_selected_scene_changed()
        self.register_components(self._selected_scene)
        self._scenes = []
        self._tracks_and_listeners = []
        for index in range(num_scenes):
            self._scenes.append(self._create_scene(self._num_tracks))
            self.register_components(self._scenes[index])
        self.set_offsets(0, 0)
        self._register_timer_callback(self._on_timer)
        return None


    def disconnect(self):
        CompoundComponent.disconnect(self)
        if self._is_linked(): #added
            self._unlink() #added
        self._unregister_timer_callback(self._on_timer)
        self._master_strip = None
        self._channel_strips = None
        for index in range(len(self._tracks_and_listeners)):
            track = self._tracks_and_listeners[index][0]
            listener = self._tracks_and_listeners[index][1]
            if ((track != None) and (track in self.song().tracks) and track.fired_slot_index_has_listener(listener)):
                track.remove_fired_slot_index_listener(listener)
        self._tracks_and_listeners = None
        if (self._bank_up_button != None):
            self._bank_up_button.remove_value_listener(self._bank_up_value)
            self._bank_up_button = None
        if (self._bank_down_button != None):
            self._bank_down_button.remove_value_listener(self._bank_down_value)
            self._bank_down_button = None
        if (self._bank_right_button != None):
            self._bank_right_button.remove_value_listener(self._bank_right_value)
            self._bank_right_button = None
        if (self._bank_left_button != None):
            self._bank_left_button.remove_value_listener(self._bank_left_value)
            self._bank_left_button = None
        if (self._stop_all_button != None):
            self._stop_all_button.remove_value_listener(self._stop_all_value)
            self._stop_all_button = None
        if (self._next_scene_button != None):
            self._next_scene_button.remove_value_listener(self._next_scene_value)
            self._next_scene_button = None
        if (self._prev_scene_button != None):
            self._prev_scene_button.remove_value_listener(self._prev_scene_value)
            self._prev_scene_button = None
        self._stop_track_clip_buttons = None


    def scene(self, index):
        assert isinstance(index, int)
        assert ((index >= 0) and (index < len(self._scenes)))
        return self._scenes[index]


    def selected_scene(self):
        return self._selected_scene


    def set_scene_bank_buttons(self, up_button, down_button):
        assert ((up_button == None) or isinstance(up_button, ButtonElement))
        assert ((down_button == None) or isinstance(down_button, ButtonElement))
        do_update = False
        if (up_button is not self._bank_up_button):
            do_update = True
            if (self._bank_up_button != None):
                self._bank_up_button.remove_value_listener(self._bank_up_value)
            self._bank_up_button = up_button
            if (self._bank_up_button != None):
                self._bank_up_button.add_value_listener(self._bank_up_value)
        if (down_button is not self._bank_down_button):
            do_update = True
            if (self._bank_down_button != None):
                self._bank_down_button.remove_value_listener(self._bank_down_value)
            self._bank_down_button = down_button
            if (self._bank_down_button != None):
                self._bank_down_button.add_value_listener(self._bank_down_value)
        if do_update:
            self._rebuild_callback()
            self.update()



    def set_track_bank_buttons(self, right_button, left_button):
        assert ((right_button == None) or isinstance(right_button, ButtonElement))
        assert ((left_button == None) or isinstance(left_button, ButtonElement))
        do_update = False
        if (right_button is not self._bank_right_button):
            do_update = True
            if (self._bank_right_button != None):
                self._bank_right_button.remove_value_listener(self._bank_right_value)
            self._bank_right_button = right_button
            if (self._bank_right_button != None):
                self._bank_right_button.add_value_listener(self._bank_right_value)
        if (left_button is not self._bank_left_button):
            do_update = True
            if (self._bank_left_button != None):
                self._bank_left_button.remove_value_listener(self._bank_left_value)
            self._bank_left_button = left_button
            if (self._bank_left_button != None):
                self._bank_left_button.add_value_listener(self._bank_left_value)
        if do_update:
            self._rebuild_callback()
            self.update()



    def set_stop_all_clips_button(self, button):
        assert ((button == None) or isinstance(button, ButtonElement))
        if (self._stop_all_button != button):
            if (self._stop_all_button != None):
                self._stop_all_button.remove_value_listener(self._stop_all_value)
            self._stop_all_button = button
            if (self._stop_all_button != None):
                self._stop_all_button.add_value_listener(self._stop_all_value)
            self._rebuild_callback()
            self.update()



    def set_stop_track_clip_buttons(self, buttons):
        assert ((buttons == None) or (isinstance(buttons, tuple) and (len(buttons) == self._num_tracks)))
        if (self._stop_track_clip_buttons != buttons):
            if (self._stop_track_clip_buttons != None):
                for button in self._stop_track_clip_buttons:
                    button.remove_value_listener(self._stop_track_value)
            self._stop_track_clip_buttons = buttons
            if (self._stop_track_clip_buttons != None):
                for button in self._stop_track_clip_buttons:
                    assert isinstance(button, ButtonElement)
                    button.add_value_listener(self._stop_track_value, identify_sender=True)
                    self._on_fired_slot_index_changed(list(buttons).index(button))
            self._rebuild_callback()
            self.update()



    def set_stop_track_clip_value(self, value):
        assert (value in range(128))
        self._stop_track_clip_value = value



    def set_select_buttons(self, next_button, prev_button):
        assert ((next_button == None) or isinstance(next_button, ButtonElement))
        assert ((prev_button == None) or isinstance(prev_button, ButtonElement))
        do_update = False
        if (next_button is not self._next_scene_button):
            do_update = True
            if (self._next_scene_button != None):
                self._next_scene_button.remove_value_listener(self._next_scene_value)
            self._next_scene_button = next_button
            if (self._next_scene_button != None):
                self._next_scene_button.add_value_listener(self._next_scene_value)
        if (prev_button is not self._prev_scene_button):
            do_update = True
            if (self._prev_scene_button != None):
                self._prev_scene_button.remove_value_listener(self._prev_scene_value)
            self._prev_scene_button = prev_button
            if (self._prev_scene_button != None):
                self._prev_scene_button.add_value_listener(self._prev_scene_value)
        if do_update:
            self._rebuild_callback()
            self.on_selected_scene_changed()



    def set_mixer(self, mixer):
        assert ((mixer == None) or isinstance(mixer, MixerComponent))
        self._mixer = mixer
        if (self._mixer != None):
            self._mixer.set_track_offset(self.track_offset())


    def set_offsets(self, track_offset, scene_offset):
        assert (track_offset >= 0)
        assert (scene_offset >= 0)
        track_increment = 0
        scene_increment = 0
        if self._is_linked():
            SessionComponent._perform_offset_change((track_offset - self._track_offset), (scene_offset - self._scene_offset)) 
        else:
            if (len(self.tracks_to_use()) > track_offset):
                track_increment = track_offset - self._track_offset  #modified
            if (len(self.song().scenes) > scene_offset):
                scene_increment = scene_offset - self._scene_offset #modified
            self._change_offsets(track_increment, scene_increment)


    def add_offset_listener(self, callback):
        assert (callback != None)
        assert (dir(callback).count('im_func') is 1)
        assert (not self.offset_has_listener(callback))
        self._offset_callbacks.append(callback)


    def remove_offset_listener(self, callback):
        assert (callback != None)
        assert (dir(callback).count('im_func') is 1)
        assert (self.offset_has_listener(callback))
        self._offset_callbacks.remove(callback)


    def offset_has_listener(self, callback):
        assert (callback != None)
        assert (dir(callback).count('im_func') is 1)
        return callback in self._offset_callbacks


    def set_show_highlight(self, show_highlight):
        assert isinstance(show_highlight, type(False))
        if (self._show_highlight != show_highlight):
            self._show_highlight = show_highlight
            self._do_show_highlight()


    def on_enabled_changed(self):
        self._scroll_up_ticks_delay = -1
        self._scroll_down_ticks_delay = -1
        self._scroll_right_ticks_delay = -1
        self._scroll_left_ticks_delay = -1
        self.update()
        self._do_show_highlight()


    def on_scene_list_changed(self):
        self._reassign_scenes()


    def on_track_list_changed(self):
        self.set_offsets(min(self.track_offset(), (len(self.tracks_to_use()) - 1)), self.scene_offset())


    def on_selected_scene_changed(self):
        if (self.scene_offset() >= len(self.song().scenes)):
            self.set_offsets(self.track_offset(), (self.scene_offset() - 1))
        if (self._selected_scene != None):
            self._selected_scene.set_scene(self.song().view.selected_scene)
            self.update()


    def width(self):
        return self._num_tracks


    def height(self):
        return len(self._scenes)


    def track_offset(self):
        return self._track_offset


    def scene_offset(self):
        return self._scene_offset


    def tracks_to_use(self):
        list_of_tracks = None
        if (self._mixer != None):
            list_of_tracks = self._mixer.tracks_to_use()
        else:
            list_of_tracks = self.song().visible_tracks
        return list_of_tracks


    def update(self):
        if self._allow_updates:
            if self.is_enabled():
                if self._is_linked():
                    self._update_banking_buttons(SessionComponent._minimal_track_offset, SessionComponent._minimal_scene_offset)
                else:
                    self._update_banking_buttons(self.track_offset(), self.scene_offset())
            else:
                for button in (self._bank_up_button, self._bank_down_button, self._bank_right_button, self._bank_left_button, self._prev_scene_button, self._next_scene_button):
                    if (button != None):
                        button.turn_off()
        else:
            self._update_requests += 1
        return None


    def _update_banking_buttons(self, track_offset, scene_offset):
        assert (self.is_enabled())
        scenes = self.song().scenes
        tracks = self.tracks_to_use()
        selected_scene = self.song().view.selected_scene
        if (self._bank_down_button != None):
            if (scene_offset > 0):
                self._bank_down_button.turn_on()
            else:
                self._bank_down_button.turn_off()
        if (self._bank_up_button != None):
            if (len(scenes) > (scene_offset + 1)):
                self._bank_up_button.turn_on()
            else:
                self._bank_up_button.turn_off()
        if (self._bank_left_button != None):
            if (track_offset > 0):
                self._bank_left_button.turn_on()
            else:
                self._bank_left_button.turn_off()
        if (self._bank_right_button != None):
            if (len(tracks) > (track_offset + 1)):
                self._bank_right_button.turn_on()
            else:
                self._bank_right_button.turn_off()
        if (self._next_scene_button != None):
            if (selected_scene != self.song().scenes[-1]):
                self._next_scene_button.turn_on()
            else:
                self._next_scene_button.turn_off()
        if (self._prev_scene_button != None):
            if (selected_scene != self.song().scenes[0]):
                self._prev_scene_button.turn_on()
            else:
                self._prev_scene_button.turn_off()
                        
                     
    def _change_offsets(self, track_increment, scene_increment):
        offsets_changed = (track_increment != 0) or (scene_increment != 0)
        if offsets_changed:
            self._track_offset += track_increment
            self._scene_offset += scene_increment
            assert (self._track_offset >= 0)
            assert (self._scene_offset >= 0)
            if (self._mixer != None):
                self._mixer.set_track_offset(self.track_offset())
        self._reassign_tracks()
        if offsets_changed:
            self._reassign_scenes()
            for callback in self._offset_callbacks:
                callback()
            if ((self.width() > 0) and (self.height() > 0)):
                self._do_show_highlight()
                    

    def _reassign_scenes(self):
        scenes = self.song().scenes
        for index in range(len(self._scenes)):
            scene_index = (self._scene_offset + index)
            if (len(scenes) > scene_index):
                self._scenes[index].set_scene(scenes[scene_index])
                self._scenes[index].set_track_offset(self._track_offset)
            else:
                self._scenes[index].set_scene(None)

        if (self._selected_scene != None):
            self._selected_scene.set_track_offset(self._track_offset)
        self.update()



    def _reassign_tracks(self):
        for index in range(len(self._tracks_and_listeners)):
            track = self._tracks_and_listeners[index][0]
            listener = self._tracks_and_listeners[index][1]
            if ((track != None) and (track in self.song().tracks) and track.fired_slot_index_has_listener(listener)):
                track.remove_fired_slot_index_listener(listener)

        self._tracks_and_listeners = []
        tracks_to_use = self.tracks_to_use()
        for index in range(self._num_tracks):
            listener = lambda index = index:self._on_fired_slot_index_changed(index)
            track = None
            if ((self._track_offset + index) < len(tracks_to_use)):
                track = tracks_to_use[(self._track_offset + index)]
                self._tracks_and_listeners.append((track,
                                                   listener))                
                if track in self.song().tracks:
                    track.add_fired_slot_index_listener(listener)
            listener()



    def _bank_up_value(self, value):
        assert (value in range(128))
        assert (self._bank_up_button != None)
        if self.is_enabled():
            button_is_momentary = self._bank_up_button.is_momentary()
            if button_is_momentary:
                if (value != 0):
                    self._scroll_up_ticks_delay = INITIAL_SCROLLING_DELAY
                else:
                    self._scroll_up_ticks_delay = -1
            if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
                self.set_offsets(self._track_offset, (self._scene_offset + 1))



    def _bank_down_value(self, value):
        assert (value in range(128))
        assert (self._bank_down_button != None)
        if self.is_enabled():
            button_is_momentary = self._bank_down_button.is_momentary()
            if button_is_momentary:
                if (value != 0):
                    self._scroll_down_ticks_delay = INITIAL_SCROLLING_DELAY
                else:
                    self._scroll_down_ticks_delay = -1
            if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
                self.set_offsets(self._track_offset, max(0, self._scene_offset - 1))



    def _bank_right_value(self, value):
        assert (value in range(128))
        assert (self._bank_right_button != None)
        if self.is_enabled():
            button_is_momentary = self._bank_right_button.is_momentary()
            if button_is_momentary:
                if (value != 0):
                    self._scroll_right_ticks_delay = INITIAL_SCROLLING_DELAY
                else:
                    self._scroll_right_ticks_delay = -1
            if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
                self.set_offsets((self._track_offset + 1), self._scene_offset)



    def _bank_left_value(self, value):
        assert isinstance(value, int)
        assert (self._bank_left_button != None)
        if self.is_enabled():
            button_is_momentary = self._bank_left_button.is_momentary()
            if button_is_momentary:
                if (value != 0):
                    self._scroll_left_ticks_delay = INITIAL_SCROLLING_DELAY
                else:
                    self._scroll_left_ticks_delay = -1
            if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
                self.set_offsets(max(0, (self._track_offset - 1)), self._scene_offset)



    def _stop_all_value(self, value):
        assert (self._stop_all_button != None)
        assert isinstance(value, int)
        if self.is_enabled():
            if ((value is not 0) or (not self._stop_all_button.is_momentary())):
                self.song().stop_all_clips()



    def _next_scene_value(self, value):
        assert (self._next_scene_button != None)
        assert (value != None)
        assert isinstance(value, int)
        if self.is_enabled():
            if ((value is not 0) or (not self._next_scene_button.is_momentary())):
                selected_scene = self.song().view.selected_scene
                all_scenes = self.song().scenes
                if (selected_scene != all_scenes[-1]):
                    index = list(all_scenes).index(selected_scene)
                    self.song().view.selected_scene = all_scenes[(index + 1)]



    def _prev_scene_value(self, value):
        assert (self._prev_scene_button != None)
        assert (value != None)
        assert isinstance(value, int)
        if self.is_enabled():
            if ((value is not 0) or (not self._prev_scene_button.is_momentary())):
                selected_scene = self.song().view.selected_scene
                all_scenes = self.song().scenes
                if (selected_scene != all_scenes[0]):
                    index = list(all_scenes).index(selected_scene)
                    self.song().view.selected_scene = all_scenes[(index - 1)]



    def _stop_track_value(self, value, sender):
        assert (self._stop_track_clip_buttons != None)
        assert (list(self._stop_track_clip_buttons).count(sender) == 1)
        assert (value in range(128))
        if self.is_enabled():
            if ((value is not 0) or (not sender.is_momentary())):
                tracks = self.tracks_to_use()
                track_index = (list(self._stop_track_clip_buttons).index(sender) + self.track_offset())
                if (track_index in range(len(tracks))) and (tracks[track_index] in self.song().tracks):
                    tracks[track_index].stop_all_clips()


    def _create_scene(self, num_tracks): #added
        return SceneComponent(num_tracks, self.tracks_to_use)


    def _do_show_highlight(self): #added
        return_tracks = self.song().return_tracks
        include_returns = (len(return_tracks) > 0) and (return_tracks[0] in self.tracks_to_use())
        if self._show_highlight:
            self._highlighting_callback(self._track_offset, self._scene_offset, self.width(), self.height(), include_returns)        
        else:
            self._highlighting_callback(-1, -1, -1, -1, include_returns)


    def _on_fired_slot_index_changed(self, index):
        if (self.is_enabled() and (self._stop_track_clip_buttons != None)):
            if ((index in range(len(self._tracks_and_listeners))) and (self._tracks_and_listeners[index][0] in self.song().tracks) and (self._tracks_and_listeners[index][0].fired_slot_index == -2)):
                self._stop_track_clip_buttons[index].send_value(self._stop_track_clip_value)
            else:
                self._stop_track_clip_buttons[index].turn_off()



    def _on_timer(self):
        if self.is_enabled():
            scroll_delays = [self._scroll_up_ticks_delay,
                             self._scroll_down_ticks_delay,
                             self._scroll_right_ticks_delay,
                             self._scroll_left_ticks_delay]
            if (scroll_delays.count(-1) < 4):
                tracks_increment = 0
                scenes_increment = 0
                if (self._scroll_right_ticks_delay > -1):
                    if self._is_scrolling():
                        tracks_increment += 1
                        self._scroll_right_ticks_delay = INTERVAL_SCROLLING_DELAY
                    self._scroll_right_ticks_delay -= 1
                if (self._scroll_left_ticks_delay > -1):
                    if self._is_scrolling():
                        tracks_increment -= 1
                        self._scroll_left_ticks_delay = INTERVAL_SCROLLING_DELAY
                    self._scroll_left_ticks_delay -= 1
                if (self._scroll_down_ticks_delay > -1):
                    if self._is_scrolling():
                        scenes_increment -= 1
                        self._scroll_down_ticks_delay = INTERVAL_SCROLLING_DELAY
                    self._scroll_down_ticks_delay -= 1
                if (self._scroll_up_ticks_delay > -1):
                    if self._is_scrolling():
                        scenes_increment += 1
                        self._scroll_up_ticks_delay = INTERVAL_SCROLLING_DELAY
                    self._scroll_up_ticks_delay -= 1
                new_track_offset = max(0, (self._track_offset + tracks_increment))
                new_scene_offset = max(0, (self._scene_offset + scenes_increment))
                if ((new_track_offset != self._track_offset) or (new_scene_offset != self._scene_offset)):
                    self.set_offsets(new_track_offset, new_scene_offset)



    def _is_scrolling(self):
        return (0 in (self._scroll_up_ticks_delay,
                      self._scroll_down_ticks_delay,
                      self._scroll_right_ticks_delay,
                      self._scroll_left_ticks_delay))

    def _is_linked(self):
        return (self in SessionComponent._linked_session_instances)

    def _link(self):
        assert (not self._is_linked())
        SessionComponent._linked_session_instances.append(self)

    def _unlink(self):
        assert (self._is_linked())
        SessionComponent._linked_session_instances.remove(self)


