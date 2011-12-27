# emacs-mode: -*- python-*-
from _Tools.re import *
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ClipSlotComponent import ClipSlotComponent

#import sys

class MonoBridgeElement(ButtonMatrixElement):
	__module__ = __name__
	__doc__ = ' Class representing a 2-dimensional set of buttons '

	def __init__(self, script):
		ButtonMatrixElement.__init__(self)
		self.bridge = 'None'
		self._script = script
		self._page_str = '/2'
		self._elapsed_events = 0
		self._threshold = 50
		self._buffer = []
		self._script._register_timer_callback(self._send_buffer)
		self._device = None
		self._device_parent = None
		self._connected = False

	def disconnect(self):
		#self._send('disconnect')
		self._disconnect_client()
		ButtonMatrixElement.disconnect(self)
	

	def _is_connected(self):
		return self._connected
	

	def connect_to(self, device):
		#self._host.log_message('client ' + str(self._number) + ' connect_to'  + str(device.name))
		self._connected = True
		self._script.connected = 1
		self.device = device
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._device_parent = device.canonical_parent
		if not self._device_parent.devices_has_listener(self._device_listener):
			self._device_parent.add_devices_listener(self._device_listener)
		#self._host._refresh_stored_data()
	
	def _disconnect_client(self):
		##self._host.log_message('disconnect' + str(self._number))
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._connected = False
		self._script.connected = 0
	

	def _device_listener(self):
		#self._host.log_message('device_listener' + str(self.device))
		if self.device == None:
			self._disconnect_client()
	

	def refresh_state(self):
		self._script.refresh_state()

	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		self._button_value(args1, args2, args3, args4)

	def reset(self):
#		for entry in self._value_notifications:
#			callback = entry['Callback']
#			self.remove_value_notification(callback)
		pass

	def _button_value(self, args1 = None, args2 = None, args3 = None, args4 = None):
		for entry in self._value_notifications:
			callback = entry['Callback']
			callback(args1, args2, args3, args4)

	def osc_in(self, messagename, arguments = None):
		#self._script.log_message('osc_in ' + str(messagename) +  '-' + str(arguments))
		if self._script._osc_registry.has_key(messagename):
			self._script._osc_registry[messagename](arguments)
		else:
			self._script.log_message(str(messagename) + ' : ' + str(arguments))
		#ew_args = re.split(' ', args)
			#self._script.log_message('in reg:' + str(self._script._osc_registry[messagename]) + str(arguments))
		
	def osc_extra(self, messagename):
		#self._script.log_message(str(self) + 'osc_extra ' + str(messagename))
		pass

	def _send_osc(self, osc, value, force = False, name = False):
		#self._script.log_message(str(osc) + str(value))
		if osc != None: 			# and ((osc.find(self._page_str) == 0) or force is True): 
			#self._script.log_message('string ' + str(osc.split('/')) + ' ' + str(osc.find('/1')))
			self._elapsed_events += 1
			if self._elapsed_events < self._threshold:
				if(name == True):
					self._send('name', osc, value)
				else:
					self._send('osc', osc, value)
			else:
				self._buffer.append([osc, value, name])

	def _send_buffer(self):
		#if(len(self._buffer)>0):
		#	self._script.log_message('buffer:' + str(len(self._buffer)))
		for index in range(min(len(self._buffer), self._threshold)):
			if(self._buffer[0][2] == True):
				self._send('name', self._buffer[0][0], self._buffer[0][1])
			else:
				self._send('osc', self._buffer[0][0], self._buffer[0][1])
			self._buffer.pop(0)
		self._elapsed_events = 0
	

	def ping(self, message):  #, sender, message):
		#self._script.log_message('ping')
		if self._connected is False:
			self._send('page', self._page_str)
			self._connected = True
			self._script.refresh_state()
		
	def page1(self, message):  #, sender, message):
		#self._script.log_message('page 1')
		self._page_str = '/1'	
		#self._script.refresh_state()
		#self._script._host2.update()
		#self._script._host.set_enabled(False)
		#self._script._host2.set_enabled(True)				
		
	def page2(self, message):  #, sender, message):
		#self._script.log_message('page 2')
		self._page_str = '/2'
		#self._script.refresh_state()
		#self._script._host2.set_enabled(False)	
		#self._script._host.set_enabled(True)
		
	def reset_grid(self):
		self._script._key_buttons.reset()
		self._script._bank_buttons.reset()

	def set_brightness(self, value):
		self._script._set_brightness(value)
	
	def set_threshold(self, value):
		self._threshold = int(value)
	

# local variables:
# tab-width: 4
