# emacs-mode: -*- python-*-
import Live
#from ValueListenerComponent import ValueListenerComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.InputControlElement import InputControlElement
from _Framework.NotifyingControlElement import NotifyingControlElement
from MonOhm_Map import COLOR_MAP

MIDI_NOTE_TYPE = 0
MIDI_CC_TYPE = 1
MIDI_PB_TYPE = 2
MIDI_MSG_TYPES = (MIDI_NOTE_TYPE,
 MIDI_CC_TYPE,
 MIDI_PB_TYPE)
MIDI_NOTE_ON_STATUS = 144
MIDI_NOTE_OFF_STATUS = 128
MIDI_CC_STATUS = 176
MIDI_PB_STATUS = 224

class FlashingButtonElement(ButtonElement):
	__module__ = __name__
	__doc__ = ' Special button class that can be configured with custom on- and off-values, some of which flash at specified intervals called by _Update_Display'

	def __init__(self, is_momentary, msg_type, channel, identifier, name, cs):
		ButtonElement.__init__(self, is_momentary, msg_type, channel, identifier)
		self._last_pressed = 0
		self._flash_state = 0
		self._color = 0
		self._on_value = 127
		self._off_value = 0
		self._is_enabled = True
		self._is_notifying = False
		self._force_next_value = False
		self.name = name
		self._script = cs
		self._report_value = True
		#self._parameter = None

	def set_on_off_values(self, on_value, off_value):
		assert (on_value in range(128))
		assert (off_value in range(128))
		self._last_sent_value = -1
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
		assert isinstance(value, int)
		assert (value in range(128))
		self._last_sent_value = -1
		for notification in self._value_notifications:
			callback = notification['Callback']
			if notification['Identify']:
				callback(value, self)
			else:
				callback(value)

	def send_value(self, value, force_send = False):
		if(type(self) != type(None)):
			assert (value != None)
			assert isinstance(value, int)
			assert (value in range(128))
			if (force_send or ((value != self._last_sent_value) and self._is_being_forwarded)):
				data_byte1 = self._original_identifier
				if value in range(1, 127):
					data_byte2 = COLOR_MAP[(value - 1) % 6]
				elif value == 127:
					data_byte2 = COLOR_MAP[6]
				else:
					data_byte2 = 0
				self._color = data_byte2
				status_byte = self._original_channel
				if (self._msg_type == MIDI_NOTE_TYPE):
					status_byte += MIDI_NOTE_ON_STATUS
				elif (self._msg_type == MIDI_CC_TYPE):
					status_byte += MIDI_CC_STATUS
				else:
					assert False
				self.send_midi((status_byte,
				 data_byte1,
				 data_byte2))
				self._last_sent_value = value
				if self._report_output:
					is_input = True
					self._report_value(value, (not is_input))
				self._flash_state = round((value - 1)/7)
				self._last_pressed = int(self._script._timer)

	def install_connections(self):	#this override has to be here so that translation will happen when buttons are disabled
		if self._is_enabled:
			ButtonElement.install_connections(self)
		elif ((self._msg_channel != self._original_channel) or (self._msg_identifier != self._original_identifier)):
			self._install_translation(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)

	def flash(self, timer):
		if (self._is_being_forwarded and self._flash_state in range(1, 18) and (timer % self._flash_state) == 0):
			data_byte1 = self._original_identifier
			data_byte2 = self._color * int((timer % (self._flash_state * 2)) > 0)
			status_byte = self._original_channel
			if (self._msg_type == MIDI_NOTE_TYPE):
				status_byte += MIDI_NOTE_ON_STATUS
			elif (self._msg_type == MIDI_CC_TYPE):
				status_byte += MIDI_CC_STATUS
			else:
				assert False
			self.send_midi((status_byte,
			 data_byte1,
			 data_byte2))


#	def install_connections(self):
#		self._is_mapped = False
#		self._is_being_forwarded = False
#		if ((self._msg_channel != self._original_channel) or (self._msg_identifier != self._original_identifier)):
#			self._install_translation(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)
#		if (self._parameter_to_map_to != None):
#			value_map = tuple()
#			if (self._mapping_feedback_delay != 0):
#				if (self._msg_type != MIDI_PB_TYPE):
#					value_map = tuple(range(128))
#				else:
#					assert False
#			self._is_mapped = self._install_mapping(self, self._parameter_to_map_to, self._mapping_feedback_delay, value_map)
#		if ((len(self._value_notifications) > 0) or self._report_input):
#			self._is_being_forwarded = self._install_forwarding(self)
			
#	def set_value(self, value):
#		if(self._parameter_to_map_to != None):
#			newval = float(value * (self._parameter_to_map_to.max - self._parameter_to_map_to.min)) + self._parameter_to_map_to.min
#			self._parameter_to_map_to.value = newval
#			return [value, str(self.mapped_parameter())]
#		self.receive_value(int(value*127))
			

#	def send_midi(self, message):
#		assert (message != None)
#		assert isinstance(message, tuple)
#		self._script._send_midi(message)
#		#self._script.log_message(str(message))
#		if(message[2]!=self._listener._mode_index):
#			self._listener.set_mode(int(message[2]))

	#def add_value_listener(self, callback, identify_sender = False):  #commented trying to restore midi_translation
	#	if (not self._is_notifying):
	#		ButtonElement.add_value_listener(self, callback, identify_sender)
	#	else:
	#		self._pending_listeners.append((callback,
 	#		 identify_sender))

#	def receive_value(self, value):
#		self._is_notifying = True
#		ButtonElement.receive_value(self, value)
#		self._is_notifying = False
#		for listener in self._pending_listeners:
#			self.add_value_listener(listener[0], listener[1])
#
#		self._pending_listeners = []
#		self._listener.set_mode(value)

# local variables:
# tab-width: 4
