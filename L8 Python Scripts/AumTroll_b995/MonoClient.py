# by amounra :  http://www.aumhaa.com

from _Framework.NotifyingControlElement import NotifyingControlElement
from MonoDeviceComponent import MonoDeviceComponent


wheel_parameter = {0: 'value', 1: 'mode', 2:'green', 3:'white', 4:'custom'}


class MonoClient(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class representing a single mod in a Monomodular hosted environment '


	def __init__(self, script, number):
		NotifyingControlElement.__init__(self)
		self._host = script
		self._active_host = []
		self._number  = number
		self._channel = 0
		self._connected = False
		self._enabled = True
		self.device = None
		self._device_parent = None
		self._swing = 0
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
		self._mod_dial = None
		self._mod_vol = 127
		self._mod_color = 0
		self._absolute_mode = 1
		self._monomodular = 0
		self._device_component = MonoDeviceComponent(self, script._host, script)
	

	def is_active(self):
		return (len(self._active_host) > 0)
	

	def set_enabled(self, val):
		self._enabled = val!=0
	

	def set_channel(self):
		if self.is_connected:
			self._host.assign_alternate_mappings(0)
		else:
			self._host.assign_alternate_mappings(self._number+1)
	

	def is_connected(self):
		return self._connected
	

	def disconnect(self):
		#self._host.log_message('client_disconnect')
		self._device_component.disconnect()
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
		self._mod_color = 0
		self._local_ring_control = 1
		self._absolute_mode = 1
		self._monomodular = 0
	

	def reset(self):
		pass
	

	def _connect_to(self, device):
		#self._host.log_message('client ' + str(self._number) + ' connect_to '  + str(device.name))
		self._connected = True
		self.device = device
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._device_parent = device.canonical_parent
		if not self._device_parent.devices_has_listener(self._device_listener):
			self._device_parent.add_devices_listener(self._device_listener)
		for host in self._active_host:
			host.update()
			#if not host.is_enabled():
			#	self._host.display_mod_colors()
		#self._host._refresh_stored_data()
	

	def _disconnect_client(self, reconnect = False):
		#self._host.log_message('disconnect client ' + str(self._number))
		old_callbacks = self._value_notifications
		self._create_grid()
		self._create_keys()
		self._local_ring_control = 1
		self._absolute_mode = 1
		self._monomodular = 0
		self._swing = 0
		self._mod_color = 0
		self._raw = False
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
		self._device_component.disconnect_client()
		self._connected = False
		self.device = None
		if not self._mod_dial == None:
			if self._mod_dial._parameter is self._mod_dial_parameter:
				self._mod_dial.release_parameter()
		for host in self._active_host:
			host.update()
			if not host.is_enabled():
				self._host.display_mod_colors()
	

	def _device_listener(self):
		#self._host.log_message('device_listener' + str(self.device))
		if self.device == None:
			self._disconnect_client()
	

	def linked_device(self):
		return self.device
	


	"""initiation methods"""
	def _create_grid(self):
		self._grid = [None for index in range(4)]
		for column in range(4):
			self._grid[column] = [None for index in range(16)]
			for row in range(4):
				self._grid[column][row] = 0
	

	def _create_keys(self):
		self._key = [None for index in range(32)]
		for index in range(32):
			self._key[index] = 0
	

	def _create_knobs(self):
		self._knob = [None for index in range(24)]
		for index in range(24):
			self._knob[index] = 0
	

	def _create_wheels(self):
		self._wheel = [[] for index in range(4)]
		for column in range(4):
			self._wheel[column] = [[] for index in range(3)]
			for row in range(3):
				self._wheel[column][row] = {'log': 0, 'value': 0, 'mode':0, 'white': 0, 'green': 0, 'custom':'00000000', 'pn':' ', 'pv': '0'}
	


	"""send methods (to m4l from host)"""
	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		if self._enabled is True:
			#self._host.log_message('send' + str(args1) + str(args2) + str(args3) + str(args4))
			for entry in self._value_notifications:
				callback = entry['Callback']
				callback(args1, args2, args3, args4)
	

	def _send_knob(self, index, value):
		self._send('knob', index, value)
	

	def _send_key(self, index, value):
		self._send('key', index, value)
		if self._raw is True:
			control = self._host._host._keys[index]
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
	

	def _send_grid(self, column, row, value):
		self._send('grid', column, row, value)
		if self._raw is True:
			control = self._host._host._grid.get_button(column, row)
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
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
					for index in range(4):
						host._send_grid(column, index, value)
			else:
				for host in self._active_host:
					for index in range(4):
						host._send_grid(column, index, self._grid[column][index])
	

	def receive_mask_row(self, row, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					for index in range(4):
						host._send_grid(index, row, value)
			else:
				for host in self._active_host:
					for index in range(4):
						host._send_grid(index, row, self._grid[index][row])
	

	def receive_mask_all(self, value):
		if self.is_active():
			if value > -1:
				for host in self._active_host:
					for column in range(4):
						for row in range(4):
							host._send_grid(column, row, value)
			else:
				for host in self._active_host:
					for column in range(4):
						for row in range(4):
							host._send_grid(column, row, self._grid[index][row])
	

	def receive_hotline(self, client, func = None, arguments = None):
		#self._host.log_message(str(client) + str(func) + str(arguments))
		if(client in range(4)) and (func != None):
			self._host._client[client]._send('hotline', func, arguments)
		elif(client == 'all') and (func != None):
			for client in self._host._client:
				client._send('hotline', func, arguments)
	

	def receive_autoselect_enabled(self, val):
		self._autoselect_enabled = val
	

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
	


	"""Codec/CNTRLR specific methods"""
	def _send_dial(self, column, row, value):
		self._send('dial', column, row, value)
		if self._raw is True:
			control = self._host._host._dial_matrix.get_dial(column, row)
			if control != None:
				self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
	

	def _send_dial_button(self, column, row, value):
		if row > 0:
			self._send('dial_button', column, row-1, value)
			if self._raw is True:
				control = self._host._host._dial_button_matrix.get_button(column, row)
				if control != None:
					self._send('raw', control._msg_type + control._original_channel, control._original_identifier, value)
	

	def receive_wheel(self, number, parameter, value):
		column = number%4
		row = int(number/4)
		#if row > 0:
		self._wheel[column][row][parameter] = value
		if self.is_active():
			if parameter == 'pn' or parameter == 'pv':
				for host in self._active_host:
					#host._script.log_message(str(column) + str(row) + str(self._wheel[column][row][parameter]))
					host._send_to_lcd(column, row, self._wheel[column][row])
			if parameter!='white':
				for host in self._active_host:
					host._send_wheel(column, row, self._wheel[column][row])
			elif row > 0:
				for host in self._active_host:
					host._send_wheel(column, row, self._wheel[column][row])
		#elif (column==self._number) and  (parameter=='value'):
		#	self._wheel[column][row][parameter] = value	
			
	

	def set_local_ring_control(self, val = 0):
		self._local_ring_control = val
		if self._enabled:
			for host in self._active_host:
				host._script.set_local_ring_control(self._local_ring_control)
	

	def set_absolute_mode(self, val = 1):
		#self._host.log_message('client set absolute mode ' + str(val))
		self._absolute_mode = val
		if self._enabled:
			for host in self._active_host:
				host._script.set_absolute_mode(self._absolute_mode)
	

	def receive_mod_color(self, val):
		#self._host.log_message('mod color' + str(val))
		if val != 1:
			self._mod_color = val
			self._host.shift_update()
	

	def _mod_dial_parameter(self):
		param = None
		if not self.device == None:
			for parameter in self.device.parameters:
				if (parameter.original_name == 'moddial'):
					param = parameter
					break
		return param

	

	"""def receive_mod_vol(self, val):
		#self._host.log_message('ring value' + str(val))
		self._mod_vol = val
		if self._host._shift_mode._mode_index is 0:
			if not (self._mod_dial is None):
				self._mod_dial.send_value(self._mod_vol)"""
	


	"""MonoDevice integration"""
	def receive_device(self, command, args0 = None, args1 = None, args2 = None):
		if command in dir(self._device_component):
			getattr(self._device_component, command)(args0, args1, args2)
	


	"""raw data integration"""
	def set_raw_enabled(self, value):
		self._raw = value > 0
		#self._host.log_message('raw enabled' + str(self._raw))
		if(self._raw is True):
			self._update_controls_dictionary()
	

	def receive_raw(self, Type, Identifier, value):
		#self._host.log_message('recieve raw' + str(Type) + str(Identifier) + str(value))
		if self._controls[Type]:
			if Identifier in self._controls[Type]:
				self._controls[Type][Identifier](value)
	

	def _update_controls_dictionary(self):
		if self._host._host != None:
			self._controls = [{}, {}]
			if self._control_defs['grid'] != None:
				for column in range(self._control_defs['grid'].width()):
					for row in range(self._control_defs['grid'].height()):
						button = self._control_defs['grid'].get_button(column, row)
						if button != None:
							self._controls[0][button._original_identifier]=self._make_grid_call(column, row)
			if self._control_defs['keys'] != None:
				for index in range(len(self._control_defs['keys'])):
					key = self._control_defs['keys'][index]
					if key != None:
						self._controls[0][key._original_identifier]=self._make_key_call(index)
			if self._control_defs['dials'] != None:
				for index in range(12):
					column = index%4
					row = int(index/4)
					dial = self._control_defs['dials'].get_dial(column, row)
					if dial != None:
						self._controls[1][dial._original_identifier]=self._make_dial_call(index)
			if self._control_defs['buttons'] != None:
				for index in range(8):
					column = index%4
					row = int(index/4)+1
					button = self._control_defs['buttons'].get_button(column, row)
					if button != None:
						self._controls[0][button._original_identifier]=self._make_dial_button_call(index+4)
	

	def _make_grid_call(self, column, row):
		def recieve_grid(value):
			#self._host.log_message('receive grid' + str(value) + str(column) + str(row))
			self.receive_grid(column, row, value)
		return recieve_grid
	

	def _make_key_call(self, number):
		def receive_key(value):
			#self._host.log_message('receive key' + str(number) + str(value))
			self.receive_key(number, value)
		return receive_key
	

	def _make_dial_call(self, number):
		def receive_wheel(value):
			self.receive_wheel(number, 'value', value)
		return receive_wheel
	

	def _make_dial_button_call(self, number):
		def receive_wheel(value):
			self.receive_wheel(number, 'white', value)
		return receive_wheel
		
	

