# emacs-mode: -*- python-*-
import Live
from _Framework.ButtonElement import ButtonElement
from _Framework.InputControlElement import InputControlElement
from _Framework.NotifyingControlElement import NotifyingControlElement
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
COLOR_MAP = [0, 1, 2, 3, 4, 5, 6, 7]

#all_colors=["green", "green", "yellow", "orange", "red", "purple", "blue", "gray"];
all_colors=["yellow", "orange", "blue", "purple", "green", "red", "gray", "gray"];
mono_colors=["gray", "gray", "gray", "gray", "gray", "gray", "gray", "gray"];

class OSCFlashingButtonElement(ButtonElement):
	__module__ = __name__
	__doc__ = ' Special button class that can be configured with custom on- and off-values, some of which flash at specified intervals called by _Update_Display'


	def __init__(self, is_momentary, msg_type, channel, identifier, name, osc, osc_alt, osc_name, cs):
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
		self.osc = osc
		self.osc_alt = osc_alt
		self.osc_name = osc_name
		self._value = 0
		self._last_sent = -1
		self._script._monobridge._send_osc(self.osc, 0, True)
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
		self._script._monobridge._send_osc(str(self.osc_alt+'/visible'), 0)
		self._script._monobridge._send_osc(str(self.osc_name), '`_')
	

	def receive_value(self, value):
		assert isinstance(value, int)
		assert (value in range(128))
		self._last_sent_value = -1
		self._value = value
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
					data_byte2 = value % 7  ##COLOR_MAP[value % 7]
				else:
					data_byte2 = value
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
				self._flash_state = round(value/7)
				self._last_pressed = int(self._script._timer)
	

	def install_connections(self):	#this override has to be here so that translation will happen when buttons are disabled
		if self._is_enabled:
			ButtonElement.install_connections(self)
		elif ((self._msg_channel != self._original_channel) or (self._msg_identifier != self._original_identifier)):
			self._install_translation(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)
	

	def flash(self, timer):
		if (self._is_being_forwarded and self._flash_state in range(1, 15) and (timer % self._flash_state) == 0):
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
	

	def send_midi(self, message):
		assert (message != None)
		assert isinstance(message, tuple)
		if message[2] != self._last_sent:
			if message[2] == 127:
				color = 8
			else:
				color = int(message[2])
			if color < 1:
				self._script._monobridge._send_osc(str(self.osc_alt+'/visible'), 0)
			else:
				self._script._monobridge._send_osc(str(self.osc_alt+'/color'), all_colors[color - 1])
				self._script._monobridge._send_osc(str(self.osc_alt+'/visible'), 1)
		self._last_sent = message[2]
		#if self._script._bright is True:
		#	self._script._monobridge._send_osc(self.osc_alt, 1)
		#self._script._monobridge._send_osc(self, message)
	

	def set_value(self, value):
		if(self._parameter_to_map_to != None):
			newval = float(value * (self._parameter_to_map_to.max - self._parameter_to_map_to.min)) + self._parameter_to_map_to.min
			self._parameter_to_map_to.value = newval
			return [value, str(self.mapped_parameter())]
		self.receive_value(int(value!=0)) ##was self.receive_value(int(value*127))
			
	

