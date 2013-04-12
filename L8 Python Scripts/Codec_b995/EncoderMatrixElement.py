# emacs-mode: -*- python-*-
# -*- coding: utf-8 -*-

from _Framework.NotifyingControlElement import NotifyingControlElement 
from _Framework.EncoderElement import EncoderElement 
class EncoderMatrixElement(NotifyingControlElement):
	' Class representing a 2-dimensional set of buttons '


	def __init__(self, script):
		NotifyingControlElement.__init__(self)
		self._script = script
		self._dials = []
		self._dial_coordinates = {}
		self._max_row_width = 0


	def disconnect(self):
		NotifyingControlElement.disconnect(self)
		self._dials = None
		self._dial_coordinates = None


	def add_row(self, dials):
		assert (dials != None)
		assert isinstance(dials, tuple)
		index = 0
		for dial in dials:
			assert (dial != None)
			assert isinstance(dial, EncoderElement)
			assert (dial not in self._dial_coordinates.keys())
			dial.add_value_listener(self._dial_value, identify_sender=True)
			self._dial_coordinates[dial] = (index,
			 len(self._dials))
			index += 1

		if (self._max_row_width < len(dials)):
			self._max_row_width = len(dials)
		self._dials.append(dials)


	def width(self):
		return self._max_row_width


	def height(self):
		return len(self._dials)


	def send_value(self, column, row, value, force = False):
		assert (value in range(128))
		assert (column in range(self.width()))
		assert (row in range(self.height()))
		if (len(self._dials[row]) > column):
			self._dials[row][column].send_value(value, force)


	def get_dial(self, column, row):
		assert (column in range(self.width()))
		assert (row in range(self.height()))
		dial = None
		if (len(self._dials[row]) > column):
			dial = self._dials[row][column]
		return dial


	def reset(self):
		for dial_row in self._dials:
			for dial in dial_row:
				dial.send_value(0, True)
		#for dial in self._dials:
		#	dial.reset()

	def _dial_value(self, value, sender):
		assert isinstance(value, int)
		assert (sender in self._dial_coordinates.keys())
		assert isinstance(self._dial_coordinates[sender], tuple)
		coordinates = tuple(self._dial_coordinates[sender])
		for entry in self._value_notifications:
			callback = entry['Callback']
			callback(value, coordinates[0], coordinates[1])




# local variables:
# tab-width: 4
