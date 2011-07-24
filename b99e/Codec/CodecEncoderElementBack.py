# emacs-mode: -*- python-*-
import Live
from _Framework.EncoderElement import EncoderElement
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
output = []
setledringindicators = (240, 0, 1, 97, 4, 32, output, 247)
localringcontrol = (240, 0, 1, 97, 4, 32, output, 247)

WALK = [[0, 0], [1, 0], [2, 0], [4, 0], [8, 0], [16, 0], [32, 0], [64, 0], [0, 1], [0, 2], [0, 4], [0, 16], [0, 32], [0, 64]]
FILL = [[0, 0], [1, 0], [3, 0], [7, 0], [15, 0], [31, 0], [63, 0], [127, 0], [127, 1], [127, 3], [127, 7], [127, 31], [127, 63], [127, 127]]
CENTER =  [[127, 0], [63, 0], [31, 0], [15, 0], [7, 0], [3, 0], [1, 0], [1, 1], [0, 1], [0, 3], [0, 7], [0, 31], [0, 63], [0, 127]]
SPREAD =  [[1, 64], [3, 96], [7, 112], [15, 120], [31, 124], [63, 126], [127, 127], [126, 63], [124, 31], [127, 63], [127, 31], [127, 7], [96, 3], [64, 1]]
RING_MODE = [WALK, FILL, CENTER, SPREAD];

class CodecEncoderElement(EncoderElement):
	__module__ = __name__
	__doc__ = ' Class representing a slider on the controller '


	def __init__(self, msg_type, channel, identifier, map_mode, name, num, script):
		EncoderElement.__init__(self, msg_type, channel, identifier, map_mode)
		self.name = name
		self.num = num
		self._parameter = None
		self._ring_mode = 0
		self._ring_value = 0
		self._ring_leds = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0']
		self._ring_green_led = ['1']
		self._ring_offset = 0
		self._ring_led = [0, 0]
		self._script = script
		self._is_enabled = True
		self._report_input = True
		self._report_output = True
		self._paramter_lcd_name = ' '
		self._parameter_last_value = None
		self._mapped_to_midi_velocity = False
	

	def disconnect(self):
		self.remove_parameter_listener(self._parameter)
		EncoderElement.disconnect(self)
	
	def ring_offset(self):
		return self._ring_offset

	def ring_mode(self):
		return self._ring_mode

	def ring_leds(self):
		return len(self._ring_leds)

	def set_ring_led(self, num, val, force):
		assert isinstance(num, int)
		assert isinstance(val, int)
		assert isinstance(force, int)
		if(force == 0):
			self._ring_leds[(num - self._ring_offset) % len(self._ring_leds)] = str(val)
			self._calculate_ring()
		else:
			self._ring_leds[num] = str(val)

	def set_all_ring_leds(self, a, b, c, d, e, f, g, h, i, j, k, l, m):
		self._ring_leds = [`a`, `b`, `c`, `d`, `e`, `f`, `g`, `h`, `i`, `j`, `k`, `l`, `m`, self._ring_green_led[0]]
		self._calculate_ring()

	def set_green_led(self, val):
		assert isinstance(val, int)
		self._ring_green_led = [`int(val != 0)`]
		
	def set_ring_value(self, val):
		self._ring_value = val

#	def rotate_ring_led(self, direction):
#		assert isinstance(direction, int)
#		self._ring_offset = (self._ring_offset + direction) % (len(self._ring_leds))
#		self._ring_leds = self._ring_leds[direction:] + self._ring_leds[:direction] 
#		self._calculate_ring()
		
	def set_ring_led_rotation(self, offset):
		self._ring_offset = offset % len(self._ring_leds)

	def rotate_ring_led(self, direction):
		assert isinstance(direction, int)
		self._ring_offset = (self._ring_offset + direction) % (len(self._ring_leds))
	
	def _calculate_ring(self):
		if(self._ring_mode == 2):
			led_ring = self._ring_leds[self._ring_offset:] + self._ring_leds[:self._ring_offset]
			byte1 = ''.join(led_ring[0:7])[::-1]
			byte2 = ''.join(led_ring[7:10] + [`0`] + led_ring[10:12] + self._ring_green_led)[::-1]
			self._ring_led[0] = int(byte1, 2)
			self._ring_led[1] = int(byte2, 2) 
		elif(self._ring_mode == 1):
			self._ring_led = WALK[int(self._ring_value)]
		return self._ring_led
		
	def reset_rotation(self):
		self._ring_offset = 0

	def change_ring_mode(self, mode):
		self._ring_mode  = mode

	def set_pattern_length(self, length):
		assert isinstance(length, int)
		if(length < len(self._ring_leds)):
			self._ring_leds = self._ring_leds[:length]
		else:
			self._ring_leds = self._ring_leds + ['0' for index in range(length - len(self._ring_leds))]
		if(len(self._ring_leds) < 13):
		 	self._ring_leds = self._ring_leds + ['0' for index in range(13 - len(self._ring_leds))]
		#self._script.log_message('array' + str(self._ring_leds))
			
#	def send_midi(self, message):
#		assert (message != None)
#		assert isinstance(message, tuple)
#		self._send_midi(message)
#		#self._script.log_message(str(message))
#		if(message[2]!=self._listener._mode_index):
#			self._listener.set_mode(int(message[2]))

	def set_value(self, value):
		if(self._parameter_to_map_to != None):
			newval = float(value * (self._parameter_to_map_to.max - self._parameter_to_map_to.min)) + self._parameter_to_map_to.min
			self._parameter_to_map_to.value = newval
			return [value, str(self.mapped_parameter())]
		else:
			self.receive_value(int(value*127))

	def connect_to(self, parameter):
		assert (parameter != None)
		assert isinstance(parameter, Live.DeviceParameter.DeviceParameter)
		assignment = parameter
		if(str(parameter.name) == str('Track Volume')):		#checks to see if parameter is track volume
			if(parameter.canonical_parent.canonical_parent.has_audio_output is False):		#checks to see if track has audio output
				if(len(parameter.canonical_parent.canonical_parent.devices) > 0):
					if(str(parameter.canonical_parent.canonical_parent.devices[0].class_name)==str('MidiVelocity')):	#if not, looks for velicty as first plugin
						assignment = parameter.canonical_parent.canonical_parent.devices[0].parameters[6]				#if found, assigns fader to its 'outhi' parameter
		self._parameter_to_map_to = assignment
		self.add_parameter_listener(self._parameter_to_map_to)
	
	def release_parameter(self):
		if(self._parameter_to_map_to != None):
			self.remove_parameter_listener(self._parameter_to_map_to)
			self._parameter_to_map_to = None

	def install_connections(self):	#this override has to be here so that translation will happen when buttons are disabled
		if self._is_enabled:
			EncoderElement.install_connections(self)
		elif ((self._msg_channel != self._original_channel) or (self._msg_identifier != self._original_identifier)):
			self._install_translation(self._msg_type, self._original_identifier, self._original_channel, self._msg_identifier, self._msg_channel)

	def set_enabled(self, enabled):
		self._is_enabled = enabled

#	def method6(self):
#  		return ''.join([`num` for num in xrange(loop_count)])

	def forward_parameter_value(self):
		if(not (type(self._parameter) is type(None))):
			#new_value=int(((self._parameter.value - self._parameter.min) / (self._parameter.max - self._parameter.min))  * 127)
			if(str(self.mapped_parameter())!=self._parameter_last_value):
				self._parameter_last_value = str(self.mapped_parameter())
				self._script.notification_to_bridge(self._parameter_lcd_name, self._parameter_last_value, self)

	def add_parameter_listener(self, parameter):
		self._parameter = parameter
		if parameter:
			if isinstance(parameter, Live.DeviceParameter.DeviceParameter):
				#if str(parameter.original_name) == 'Track Volume' or self._mapped_to_midi_velocity is True:
				#	self._parameter_lcd_name = str(parameter.canonical_parent.canonical_parent.name)
				#elif str(parameter.original_name) == 'Track Panning':
				#	self._parameter_lcd_name = 'Pan'
				#else:
				self._parameter_lcd_name = str(parameter.name)
			#self._last_value(int(((self._parameter.value - self._parameter.min) / (self._parameter.max - self._parameter.min))  * 127))
			#self._parameter_last_value = str(self.mapped_parameter())
			self._script.notification_to_bridge(self._parameter_lcd_name, self._parameter_last_value, self)
			cb = lambda: self.forward_parameter_value()
			parameter.add_value_listener(cb)

	def remove_parameter_listener(self, parameter):
		self._parameter = None
		#self._script.log_message('remove_parameter_listener ' + str(parameter.name + str(self.name)))
		if parameter:
			cb = lambda: self.forward_parameter_value()
			if(parameter.value_has_listener is True):
				parameter.remove_value_listener(cb)
			self._parameter_lcd_name = ' '
			self._parameter_last_value = ' '
			self._script.notification_to_bridge(' ', ' ', self)


# local variables:
# tab-width: 4
