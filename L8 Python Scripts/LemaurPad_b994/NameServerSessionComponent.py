# --== Decompile ==--

import Live
from _Framework.SessionComponent import SessionComponent
from NameServerSceneComponent import NameServerSceneComponent

class NameServerSessionComponent(SessionComponent):
	__doc__ = " Override for SessionComponent that provides Clip NameServer support "

	def __init__(self, num_tracks, num_scenes, script):
		self._script = script
		SessionComponent.__init__(self, num_tracks, num_scenes)



	def _create_scene(self, num_tracks): #added
		return NameServerSceneComponent(num_tracks, self.tracks_to_use, self._script)



