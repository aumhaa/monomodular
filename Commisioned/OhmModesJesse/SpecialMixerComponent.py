# emacs-mode: -*- python-*-
# -*- coding: utf-8 -*-

from _Framework.MixerComponent import MixerComponent 
from _Framework.ButtonElement import ButtonElement #added
from _Framework.EncoderElement import EncoderElement #added	   

class SpecialMixerComponent(MixerComponent):
	' Special mixer class that uses return tracks alongside midi and audio tracks'
	__module__ = __name__

	def __init__(self, num_tracks, num_returns, with_EQs, with_FILTERs):
		self._is_locked = False #added
		MixerComponent.__init__(self, num_tracks, num_returns, with_EQs, with_FILTERs)

	def on_selected_track_changed(self): #added override
		selected_track = self.song().view.selected_track
		if (self._selected_strip != None):
			if self._is_locked == False: #added
				self._selected_strip.set_track(selected_track)
		if self.is_enabled():
			if (self._next_track_button != None):
				if (selected_track != self.song().master_track):
					self._next_track_button.turn_on()
				else:
					self._next_track_button.turn_off()
			if (self._prev_track_button != None):
				if (selected_track != self.song().tracks[0]):
					self._prev_track_button.turn_on()
				else:
					self._prev_track_button.turn_off()		  

	def tracks_to_use(self):
		return (self.song().visible_tracks + self.song().return_tracks)




# local variables:
# tab-width: 4
