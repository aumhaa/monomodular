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
LOGO = [[0, 1, 1],  [0, 2, 1], [0, 3, 1], [0, 4, 1], 
		[1, 0, 1], [2, 1, 1], [2, 2, 1], 
		[3, 1, 1], [3, 2, 1], [3, 3, 1], 
		[4, 0, 1], [5, 1, 1], [5, 2, 1], [5, 3, 1], [5, 4, 1],
		[6, 2, 1], [6, 3, 1], [6, 4, 1],
		[8, 2, 1], [8, 3, 1],
		[9, 1, 1], [9, 4, 1],
		[10, 0, 1], [10, 4, 1], 
		[11, 0, 1], [11, 3, 1], [11, 4, 1],
		[12, 1, 1], [12, 2, 1], [12, 3, 1],
		[14, 1, 1], [14, 2, 1], [14, 3, 1], [14, 4, 1],  
		[15, 0, 1], [15, 1, 1], 
		[16, 1, 1], [16, 2, 1], 
		[17, 2, 1], [17, 3, 1],
		[18, 0, 1], [18, 1, 1], [18, 2, 1], [18, 3, 1], [18, 4, 1],
		[20, 2, 1], [20, 3, 1],
		[21, 1, 1], [21, 4, 1], 
		[22, 0, 1], [22, 4, 1],
		[23, 0, 1], [23, 3, 1],  [23, 4, 1], 
		[24, 1, 1], [24, 2, 1], [24, 3, 1],
		[26, 1, 1], [26, 2, 1], [26, 3, 1], [26, 4, 1], 
		[27, 0, 1], [28, 1, 1], [28, 2, 1], 
		[29, 1, 1], [29, 2, 1], [29, 3, 1], 
		[30, 0, 1],
		[31, 1, 1], [31, 2, 1], [31, 3, 1], [31, 4, 1], 
		[32, 2, 1], [32, 3, 1], [32, 4, 1], 
		[34, 2, 1], [34, 3, 1], 
		[35, 1, 1], [35, 4, 1], [36, 0, 1], 
		[36, 4, 1], 
		[37, 0, 1], [37, 3, 1], [37, 4, 1], 
		[38, 1, 1], [38, 2, 1], [38, 3, 1], 
		[40, 0, 1], [40, 1, 1], [40, 2, 1], [40, 3, 1], [40, 4, 1], 
		[41, 0, 1], [41, 4, 1], 
		[42, 0, 1], [42, 4, 1], 
		[43, 1, 1], [43, 2, 1], [43, 3, 1], [43, 4, 1], [44, 2, 1], [44, 3, 1], [44, 4, 1]]


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
		self._autoselect_enabled = 0
		self._offset = [0, 0]
		self._color_maps = []
		self._report_offset = False
		self._create_grid()
		self._create_keys()
		self._create_wheels()

	

	def is_active(self):
		return (len(self._active_host) > 0)
	

	def is_connected(self):
		return self._connected
	

	def disconnect(self):
		#self._disconnect_client()
		self._active_host = []
		#self._send('client disconnect')
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		#NotifyingControlElement.disconnect(self)  #this would normally call part of the new reset in NCE, then reset in CE, both of which are handled by the new reset below this
		for entry in self._value_notifications:
			callback = entry['Callback']
			self.remove_value_listener(callback)
		self._value_notifications = []
	

	def reset(self):
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
			host.update()
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
		if self._key[index] != value:
			self._key[index] = value
			if self.is_active():
				for host in self._active_host:
					host._send_key(index, value)
	
		
	def receive_grid(self, column, row, value):
		if self._grid[column][row] != value:
			self._grid[column][row] = value
			if self.is_active():
				for host in self._active_host:
					host._send_grid(column, row, value)
	

	def receive_grid_row(self, row, value):
		for column in range(len(self._grid)):
			self._grid[column][row] = value
		if self.is_active():
			for host in self._active_host:
				for column in range(len(self._grid)):
					host._send_grid(column, row, value)
	
	
	def receive_grid_column(self, column, value):
		for row in range(len(self._grid[column])):
			self._grid[column][row] = value
		if self.is_active():
			for host in self._active_host:
				for row in range(len(self._grid[column])):
					host._send_grid(column, row, value)
	

	def receive_grid_all(self, value):
		for column in range(len(self._grid)):
			for row in range(len(self._grid[column])):
				self._grid[column][row] = value
		if self.is_active():
			for host in self._active_host:
				for column in range(len(self._grid)):
					for row in range(len(self._grid[column])):
						host._send_grid(column, row, value)
	
		
	def receive_swing(self, swing):
		#self._host.log_message('receive swing' + str(self.name) + str(swing))
		self._swing = swing
		self._send('swing', swing)
	

	def receive_autoselect_enabled(self, val):
		self._autoselect_enabled = val
	

	def receive_mask_grid(self, column, row, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					host._send_grid(column, row, value)
			else:
				for host in self._active_host:
					host._send_grid(column, row, int(self._grid[column][row]))
	

	def receive_mask_column(self, column, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					for index in range(16):
						host._send_grid(column, index, value)
			else:
				for host in self._active_host:
					for index in range(16):
						host._send_grid(column, index, self._grid[column][index])
	

	def receive_mask_row(self, row, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					for index in range(16):
						host._send_grid(index, row, value)
			else:
				for host in self._active_host:
					for index in range(16):
						host._send_grid(index, row, self._grid[index][row])
	

	def receive_mask_all(self, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					for column in range(16):
						for row in range(16):
							host._send_grid(column, row, value)
			else:
				for host in self._active_host:
					for column in range(16):
						for row in range(16):
							host._send_grid(column, row, self._grid[index][row])
	

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
		if self.autoselect_enabled():
			if self.device != None:
				for host in self._active_host:
					host.set_appointed_device(self.device)
	

	def linked_device(self):
		return self.device
	

	def set_report_offset(self, val):
		self._report_offset = (val == 1)
		#self._host._script.log_message('report offset' + str(self._report_offset))
		self._send_offset(self._offset[0], self._offset[1])
	

	def set_color_map(self, color_type, color_map):
		for host in self._host._hosts:
			#self._host.log_message(str(host._host_name) + str(host_name))
			if str(host._script._color_type) == str(color_type):
				#new_map = [color_map[i] for i in range(len(color_map))]
				#self._host.log_message('mapping ' + str(host_name) + ' to ' + str(self._number))
				new_map = color_map.split('*')
				for index in range(len(new_map)):
					new_map[index] = int(new_map[index])
				#self._host.log_message(str(host_name) + str(new_map))
				host._color_maps[self._number] = new_map
				if host._active_client is self:
					host._select_client(self._number)
				#self._host.log_message(str(host_name) + ' ' + str(color_map.split('*')))
	


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
	

	
	def reset_clients_callbacks(self):
		self._host.log_message('reset_clients_callbacks')
		for callback in self._value_notifications:	
			self._host.log_message('removing' + str(callback))
			for notification in self._host._switchboard._value_notifications:
				self._host.log_message('from' + str(notification))
				if (notification['Callback'] == callback):
					self._host._switchboard._value_notifications.remove(notification)
					self._host.log_message('removing' + str(notification))
		self._value_notifications = []
	
#self.device = self._host.song().view.selected_track.view.selected_device
# local variables:
# tab-width: 4
