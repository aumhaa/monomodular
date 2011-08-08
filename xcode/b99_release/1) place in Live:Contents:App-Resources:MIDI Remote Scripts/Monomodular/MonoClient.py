# emacs-mode: -*- python-*-
from _Framework.NotifyingControlElement import NotifyingControlElement
#from _Framework.ButtonElement import ButtonElement
#from _Framework.ButtonMatrixElement import ButtonMatrixElement
#default_wheel = []
#default_wheel._value = 0
#default_wheel._mode = 0
#default_wheel._white = 0
#default_wheel._green = 0
#default_wheel._custom = [[1, 2]]

wheel_parameter = {0: 'value', 1: 'mode', 2:'green', 3:'white', 4:'custom'}

class MonoClient(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class representing a 2-dimensional set of buttons capable of holding data in an array '


	def __init__(self, script, number):
		#ButtonMatrixElement.__init__(self)
		NotifyingControlElement.__init__(self)
		self._host = script
		self._active_host = []
		self._number  = number
		self._channel = 0
		self._connected = False
		self.device = None
		self._device_parent = None
		self._swing = 0
		self._autoselect_enabled = 1
		self._offset = [0, 0]
		self._report_offset = False
		self._create_grid()
		self._create_keys()
		self._create_wheels()

	

	def is_active(self):
		return (len(self._active_host) > 0)
	

	def is_connected(self):
		return self._connected
	

	def disconnect(self):
		self._disconnect_client()
		self._active_host = []
		self._send('client disconnect')
		NotifyingControlElement.disconnect(self)
#		ButtonMatrixElement.disconnect(self)
#		self._buttons = None
#		self._button_coordinates = None
	

	def reset(self):
#		for entry in self._value_notifications:
#			callback = entry['Callback']
#			self.remove_value_notification(callback)
		pass
	

	def _connect_to(self, device):
		#self._host.log_message('client ' + str(self._number) + ' connect_to'  + str(device.name))
		self._connected = True
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
		self._create_grid()
		self._create_keys()
		self._swing = 0
		self._report_offset = False
		for host in self._active_host:
			host._update_grid()
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._connected = False
	

	def _device_listener(self):
		#self._host.log_message('device_listener' + str(self.device))
		if self.device == None:
			self._disconnect_client()
	


	def _create_grid(self):
		self._grid = [None for index in range(16)]
		for column in range(16):
			self._grid[column] = [None for index in range(16)]
			for row in range(16):
				self._grid[column][row] = 0
	

	def _create_keys(self):
		self._key = [None for index in range(8)]
		for index in range(8):
			self._key[index] = 0
	


	def _send_offset(self, x, y):
		self._offset = [x, y]
		if(self._report_offset is True):
			self._send('offset', x, y)	
	

	def _send_key(self, index, value):
		self._send('key', index, value)
	

	def _send_grid(self, column, row, value):
		self._send('grid', column, row, value)
		#self._host.log_message('client ' + str(self._number) + ' received')
	

	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		#self._button_value(args1, args2, args3, args4)
		for entry in self._value_notifications:
			callback = entry['Callback']
			callback(args1, args2, args3, args4)
	


	def receive_key(self, index, value):
		self._key[index] = value
		if self.is_active():
			for host in self._active_host:
				host._send_key(index, value)
	
		
	def receive_grid(self, column, row, value):
		self._grid[column][row] = value
		if self.is_active():
			for host in self._active_host:
				host._send_grid(column, row, value)
	
		
	def receive_swing(self, swing):
		#self._host.log_message('receive swing' + str(self.name) + str(swing))
		self._swing = swing
		self._send('swing', swing)
	

	def receive_autoselect_enabled(self, val):
		self._autoselect_enabled = val
	


	def autoselect_enabled(self):
		return self._autoselect_enabled > 0
	

	def report_swing(self, swing):
		#self._host.log_message('report swing' + str(self.name) + str(swing))
		self._send('report_swing', swing)
	

	def _set_channel(self, channel):
		self._send('channel', channel)
		self._channel = channel
	

	def _autoselect(self):
		#self._send('autoselect')
		#if self.autoselect_enabled():
		#	if self.device != None:
		#		for host in self._active_host:
		#			host.set_appointed_device(self.device)
		pass
	

	def set_report_offset(self, val):
		self._report_offset = (val == 1)
		#self._host._script.log_message('report offset' + str(self._report_offset))
		self._send_offset(self._offset[0], self._offset[1])
	



	"""Codec specific methods"""
	def _send_dial(self, column, row, value):
		self._send('dial', column, row, value)
	

	def _send_dial_button(self, column, row, value):
		if column < 8 and row < 4:
			self._send('dial_button', column, row, value)
		elif row is 4:
			self._send('column_button', column, value)
		else:
			self._send('row_button', row, value)
	

	def _create_wheels(self):
		self._wheel = [[] for index in range(9)]
		for column in range(9):
			self._wheel[column] = [[] for index in range(5)]
			for row in range(5):
				self._wheel[column][row] = {'value': 0, 'mode':0, 'white': 0, 'green': 0, 'custom':'00000000'}
	

	def receive_wheel(self, number, parameter, value):
		column = number%9
		row = int(number/9)
		self._wheel[column][row][parameter] = value
		if self.is_active():
			for host in self._active_host:
				host._send_wheel(column, row, self._wheel[column][row])
	



#self.device = self._host.song().view.selected_track.view.selected_device
# local variables:
# tab-width: 4
