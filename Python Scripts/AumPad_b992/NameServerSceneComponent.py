# --== Decompile ==--

import Live
from _Framework.SceneComponent import SceneComponent
from NameServerClipSlotComponent import NameServerClipSlotComponent


class NameServerSceneComponent(SceneComponent):
	__doc__ = '	 Override for SceneComponent that provides Clip NameServer support '
	def __init__(self, num_slots, tracks_to_use_callback, script):
		self._script = script
		SceneComponent.__init__(self, num_slots, tracks_to_use_callback)


	def _create_clip_slot(self):
		return NameServerClipSlotComponent(self._script)



