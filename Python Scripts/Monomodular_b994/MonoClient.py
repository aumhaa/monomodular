# by amounra :  http://www.aumhaa.com

from _Framework.NotifyingControlElement import NotifyingControlElement
from MonoDeviceComponent import MonoDeviceComponent


wheel_parameter = {0: 'value', 1: 'mode', 2:'green', 3:'white', 4:'custom'}
LOGO = [[], [], [], [], [], [], [], [], 
				[[1, 1], [2, 1], [3, 1], [4, 1]], 
		[[0, 1]], 
				[[1, 1], [2, 1]], 
				[[1, 1], [2, 1], [3, 1]], 
		[[0, 1]], 
				[[1, 1], [2, 1], [3, 1], [4, 1]],
						[[2, 1], [3, 1], [4, 1]],
		[],
						[[2, 2], [3, 2]],
				[[1, 2],				 [4, 2]],
		[[0, 2],						 [4, 2]], 
		[[0, 2],				 [3, 2], [4, 2]],
				[[1, 2], [2, 2], [3, 2]],
		[],
				[[1, 3], [2, 3], [3, 3], [4, 3]],	 
		[[0, 3], [1, 3]], 
				[[1, 3], [2, 3]], 
						[[2, 3], [3, 3]],
		[[0, 3], [1, 3], [2, 3], [3, 3], [4, 3]],
		[],
						[[2, 4], [3, 4]],
				[[1, 4],				 [4, 4]], 
		[[0, 4],						 [4, 4]],
		[[0, 4], 				 [3, 4], [4, 4]], 
				[[1, 4], [2, 4], [3, 4]],
		[],
				[[1, 5], [2, 5], [3, 5], [4, 5]], 
		[[0, 5]],
				[[1, 5], [2, 5]], 
				[[1, 5], [2, 5], [3, 5]], 
		[[0, 5]],
				[[1, 5], [2, 5], [3, 5], [4, 5]], 
						[[2, 5], [3, 5], [4, 5]], 
		[],
						[[2, 6],[3, 6]], 
				[[1, 6], 				[4, 6]], 
		[[0, 6], 						 [4, 6]], 
		[[0, 6],				 [3, 6], [4, 6]], 
				[[1, 6], [2, 6], [3, 6]], 
		[],
		[[0, 1], [1, 1], [2, 1], [3, 1], [4, 1]], 
		[[0, 1], 				 	      [4, 1]], 
		[[0, 1], 				 		  [4, 1]], 
				[[1, 1], [2, 1], [3, 1], [4, 1]],
						[[2, 1], [3, 1], [4, 1]], 
		[], [], [], [], [], [], [], [], [], [], [], [], [], [], [], []]


class MonoClient(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class representing a single mod in a Monomodular hosted environment '


	def __init__(self, script, number):
		NotifyingControlElement.__init__(self)
		self._host = script
		self._is_monolink = False
		self._active_host = []
		self._number  = number
		self._channel = 0
		self._connected = False
		self._enabled = True
		self.device = None
		self._device_parent = None
		self._swing = 0
		self._mute = 0
		self._autoselect_enabled = 0
		self._offset = [0, 0]
		self._color_maps = []
		self._report_offset = False
		self._local_ring_control = 1
		self._raw = False
		self._controls = [{},{}]
		self._create_grid()
		self._create_keys()
		self._create_wheels()
		self._absolute_mode = 1
		#self._device_component = MonoDeviceComponent(self, self._host, self._host)
		self._banner_state = 0
	

	def is_active(self):
		return (len(self._active_host) > 0)
	

	def set_enabled(self, val):
		self._enabled = val!=0
	

	"""probably not necessary for monomodular"""
	"""def set_channel(self):
		if self.is_connected:
			self._host.assign_alternate_mappings(0)
		else:
			self._host.assign_alternate_mappings(self._number+1)"""
	

	def _banner(self):
		if not self.is_connected() and len(self._active_host)>0:
			if self._banner_state < 54:
				self.receive_grid_all(0)
				for index in range(16):
					for y in range(len(LOGO[self._banner_state + index])):
						self.receive_grid(index, LOGO[self._banner_state + index][y][0], LOGO[self._banner_state + index][y][1])
				self._banner_state += 1
				self._host.schedule_message(1, self._banner)
			else:
				self._banner_state = 0		
	

	def is_connected(self):
		return self._connected
	

	def disconnect(self):
		#self._host.log_message('client_disconnect')
		#self._device_component.disconnect()
		self._active_host = []
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		#NotifyingControlElement.disconnect(self)  #this would normally call part of the new reset in NCE, then reset in CE, both of which are handled by the new reset below this
		for entry in self._value_notifications:
			callback = entry['Callback']
			self.remove_value_listener(callback)
		self._value_notifications = []
		self._enabled = True
		self._local_ring_control = 1
		self._absolute_mode = 1
	

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
		self._mute = 0
		self._send('toggle_mute', self._mute)
		for host in self._active_host:
			host.update()
	

	def _disconnect_client(self, reconnect = False):
		#self._host.log_message('disconnect client ' + str(self._number))
		self._create_grid()
		self._create_keys()
		self._create_wheels()
		self.set_local_ring_control(1)
		self.set_absolute_mode(1)
		self._swing = 0
		self._report_offset = False
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		if reconnect == True:
			self._send('reconnect')
		for entry in self._value_notifications:
			callback = entry['Callback']
			self.remove_value_listener(callback)
		self._value_notifications = []
		#self._device_component.disconnect_client()
		self._connected = False
		self.device = None
		for host in self._active_host:
			host.update()
	

	def _device_listener(self):
		#self._host.log_message('device_listener' + str(self.device))
		if self.device == None:
			self._disconnect_client()
	

	def linked_device(self):
		return self.device
	


	"""initiation methods"""
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
	

	"""def _create_knobs(self):
		self._knob = [None for index in range(24)]
		for index in range(24):
			self._knob[index] = 0
	"""

	def _create_wheels(self):
		self._wheel = [[] for index in range(9)]
		for column in range(9):
			self._wheel[column] = [[] for index in range(5)]
			for row in range(5):
				self._wheel[column][row] = {'log': 0, 'value': 0, 'mode':0, 'white': 0, 'green': 0, 'custom':'00000000', 'pn':' ', 'pv': '0'}
	


	"""send methods (to m4l from host)"""
	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		if self._enabled is True:
			#self._host.log_message('send' + str(args1) + str(args2) + str(args3) + str(args4))
			for entry in self._value_notifications:
				callback = entry['Callback']
				callback(args1, args2, args3, args4)
	

	"""def _send_knob(self, index, value):
		self._send('knob', index, value)
	"""

	def _send_key(self, index, value):
		self._send('key', index, value)
		"""if self._raw is True:
			control = self._host._host._keys[index]
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
		"""
	

	def _send_grid(self, column, row, value):
		self._send('grid', column, row, value)
		"""if self._raw is True:
			control = self._host._host._grid.get_button(column, row)
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
		"""
		#self._host.log_message('client ' + str(self._number) + ' received')
	

	def _send_offset(self, x, y):
		self._offset = [x, y]
		if(self._report_offset is True):
			self._send('offset', x, y)	
	


	"""receive methods (from m4l)"""
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
	

	def receive_mask_key(self, num, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					host._send_key(num, value)
			else:
				for host in self._active_host:
					host._send_key(num, int(self._key[num]))
	

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
	

	def receive_hotline(self, client, func = None, arguments = None):
		self._host.log_message(str(client) + ' ' + str(func) + ' ' + str(arguments))
		if(client == 'all') and (func != None):
			for index in range(16):
				self._host._client[index]._send('hotline', func, arguments)
		elif(client in range(16)) and (func != None):
			self._host._client[client]._send('hotline', func, arguments)
	

	def receive_autoselect_enabled(self, val):
		self._autoselect_enabled = val
	

	def receive_swing(self, swing):
		self._swing = swing
		self._send('swing', swing)
	

	def report_swing(self, swing):
		self._send('report_swing', swing)
	

	def toggle_mute(self):
		self._mute = abs(self._mute-1)
		self._send('toggle_mute', self._mute)
	

	def set_mute(self, val):
		self._mute = val
	

	def receive_channel(self, channel):
		if channel in range(16):
			self._channel = channel
	

	def autoselect_enabled(self):
		return self._autoselect_enabled > 0
	

	def _autoselect(self):
		if self.autoselect_enabled():
			if self.device != None:
				for host in self._active_host:
					host.set_appointed_device(self.device)
	

	def _set_channel(self, channel):
		self._send('channel', channel)
		self._channel = channel
	

	def set_report_offset(self, val):
		self._report_offset = (val == 1)
		self._send_offset(self._offset[0], self._offset[1])
	

	def set_monomodular(self, val):
		self._monomodular = val
	

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
	

	def linked_device(self):
		return self.device
	


	"""Codec/CNTRLR specific methods"""
	def _send_dial(self, column, row, value):
		self._send('dial', column, row, value)
		"""if self._raw is True:
			control = self._host._host._dial_matrix.get_dial(column, row)
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)"""
	

	def _send_dial_button(self, column, row, value):
		if column < 8 and row < 4:
			self._send('dial_button', column, row, value)
		elif row is 4:
			self._send('column_button', column, value)
		else:
			self._send('row_button', row, value)
		#self._send('dial_button', column, row, value)
		"""if self._raw is True:
			control = self._host._host._dial_button_matrix.get_button(column, row)
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)"""
		
	

	def receive_wheel(self, number, parameter, value):
		column = number%9
		row = int(number/9)
		#if parameter=='custom' and not type(value) is type('x'):
		#	value = 'x000000000000'
		self._wheel[column][row][parameter] = value
		if self.is_active():
			if parameter == 'pn' or parameter == 'pv':
				for host in self._active_host:
					#host._script.log_message(str(column) + str(row) + str(self._wheel[column][row][parameter]))
					host._send_to_lcd(column, row, self._wheel[column][row])
			if parameter!='white':
				for host in self._active_host:
					host._send_wheel(column, row, self._wheel[column][row])
			elif row > -1:
				for host in self._active_host:
					host._send_wheel(column, row, self._wheel[column][row])
		#elif (column==self._number) and  (parameter=='value'):
		#	self._wheel[column][row][parameter] = value	
			
	

	def set_local_ring_control(self, val = 0):
		self._local_ring_control = val
		if self._enabled:
			for host in self._active_host:
				if 'set_local_ring_control' in dir(host._script):
					host._script.set_local_ring_control(self._local_ring_control)
	

	def set_absolute_mode(self, val = 1):
		#self._host.log_message('client set absolute mode ' + str(val))
		self._absolute_mode = val
		if self._enabled:
			for host in self._active_host:
				if 'set_absolute_mode' in dir(host._script):
					host._script.set_absolute_mode(self._absolute_mode)
	

	"""MonoDevice integration"""
	def receive_device(self, command, args0 = None, args1 = None, args2 = None):
		if command in dir(self._device_component):
			getattr(self._device_component, command)(args0, args1, args2)
	
