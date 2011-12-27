# Partial --== Decompile ==-- with fixes
import Live
from _Framework.CompoundComponent import CompoundComponent
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from OSCFlashingButtonElement import OSCFlashingButtonElement
#from EncoderMatrixElement import EncoderMatrixElement

FILTER = 	[[0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1]]

RELATIVE = [-1, 1]			

class SpecialMonomodComponent(CompoundComponent):
	__module__ = __name__
	__doc__ = ' Component that encompasses and controls 8 Monomod clients '


	def __init__(self, script):
		ControlSurfaceComponent.__init__(self)
		self._sub_components = []
		self._script = script
		self._host_name = 'AumPad'
		self._dial_matrix = None
		self._grid = None
		self._keys = None
		self._menu = None
		self._active_client = None
		self._shift_button = None
		self._shift_pressed = 0
		self._alt_button = None
		self._alt_pressed = 0
		self._locked = 0
		self._x = 0
		self._y = 0
		self._client_buttons = []
		self._channel_buttons = []
		self._color_maps = [range(128) for index in range(16)]
		self._colors = self._color_maps[0]
		self._offsets = [[0, 0] for index in range(16)]
		self._is_enabled = False
		self._is_connected = False
		self._key_buttons = None
		self._bank_buttons = None
		return None
	

	def disconnect(self):
		self.set_enabled(False)
		self._active_client = None
		self._set_button_matrix(None)
		self._client = []
		self._script = []
		return None	
	

	def connect_to_clients(self, monomod):
		self._script.log_message('connecting special monomod')
		self._client = monomod._client
		self._select_client(0)
		self.set_enabled(True)	
	

	def _select_client(self, number):
		self._active_client = self._client[number]
		self._colors = self._color_maps[number]
		for client in self._client:
			if self in client._active_host:
				client._active_host.remove(self)
		#	for index in range(len(client._active_host)):
		#		if client._active_host[index] is self:
		#			client._active_host.pop(index)
		self._active_client._active_host.append(self)
		self._x = self._offsets[number][0]
		self._y = self._offsets[number][1]
		self.update()
	

	def _update_grid(self):
		if self.is_enabled() and self._grid != None:
			for column in range(16):
				for row in range(16):
					self._send_grid(column, row, self._active_client._grid[column][row])
	

	def _send_grid(self, column, row, value):		#to be sent to controller from client
		if self.is_enabled() and self._grid != None:
			if(self._shift_pressed == 0):
				if column in range(0, 16) and row in range(0, 16):
					self._grid.get_button(column, row).send_value(int(self._colors[value]))
			else:
				if column in range(0, 16) and row in range(2, 16):
					self._grid.get_button(column, row).send_value(int(self._colors[value]))
	

	def _send_key(self, index, value):				#to be sent to controller from client
		if self.is_enabled() and self._key_buttons != None:
			#if (self._shift_pressed > 0) or (self._locked > 0):
			self._key_buttons.get_button(index, 0).send_value(int(self._colors[value]))
	

	def _send_wheel(self, row, column, value):
		pass
	

	def _set_button_matrix(self, grid):
		assert isinstance(grid, (ButtonMatrixElement,
		 type(None)))
		if grid != self._grid:
			if self._grid != None:
				self._grid.remove_value_listener(self._matrix_value)
			self._grid = grid
			if self._grid != None:
				self._grid.add_value_listener(self._matrix_value)
				self._grid.reset()
			#self._rebuild_callback()
			self.update()
		return None
	

	def _set_bank_buttons(self, buttons):
		assert isinstance(buttons, (ButtonMatrixElement, type(None)))
		if buttons != self._bank_buttons:
			if self._bank_buttons != None:
				self._bank_buttons.remove_value_listener(self._bank_value)
			self._bank_buttons = buttons
			if self._bank_buttons != None:
				self._bank_buttons.add_value_listener(self._bank_value)
				self._bank_buttons.reset()
				self.update()
		return None		
	

	def _lock_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._locked = not self._locked
			self.update()
	

	def _nav_up_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._set_offset(self._x, self._y - 1)	
	

	def _nav_down_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._set_offset(self._x, self._y + 1)
	

	def _nav_left_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._set_offset(self._x - 1, self._y)	
	

	def _nav_right_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._set_offset(self._x + 1, self._y)	
	

	def _matrix_value(self, value, x, y, is_momentary):	   #to be sent to client from controller
		#self._script.log_message('matrix_value' + str(value) + str(x) + str(y))
		assert (self._grid != None)
		assert (value in range(128))
		assert isinstance(is_momentary, type(False))
		#self._script.log_message(str(x) + str(y) + str(value) + ' @ monomod')
		if (self.is_enabled()):
			if self._shift_pressed == 1:
				if value > 0:
					if y == 0:
						self._select_client(x)
						self._display_bank()
					elif y == 1:
						self._active_client._set_channel(x)
						self._display_channel()	
			elif self._shift_pressed == 0:	
				self._active_client._send_grid(x, y, value)
	

	def _bank_value(self, value, x, y, is_momentary):
		assert (self._bank_buttons != None)
		assert (value in range(128))
		assert isinstance(is_momentary, type(False))
		#self._script.log_message(str(x) + str(y) + str(value) + ' @ monomod')
		if (self.is_enabled()):
			shift = False
			for index in range(8):
				if self._bank_buttons.get_button(index, 0)._value > 0:
					shift = True
			self._shift_value(int(shift))
			self._select_client(x)
			self._display_bank()
			self.update()
	

	def _key_value(self, value, x, y, is_momentary):
		assert (self._key_buttons != None)
		assert (value in range(128))
		assert isinstance(is_momentary, type(False))
		#self._script.log_message(str(x) + str(y) + str(value) + ' @ monomod')
		if (self.is_enabled()):
			if self._shift_pressed == 0:
				self._active_client._send_key(x, value)	
			else:
				self._active_client._set_channel(x)
				self._display_channel()		
	

	def _change_offset(self, x, y):
		#self._script.log_message('change_offset' + str(x) + str(y))
		self._set_offset(x, y)
		self._send_nav_box()
	

	def _set_offset(self, x, y):
		if (x in range(0, 9)) and (y in range(0, 9)):
			self._x = x
			self._y = y
			self._active_client._send_offset(self._x, self._y)
			self._offsets[self._active_client._number] = [self._x, self._y]
			self.update()
	

	def _update_menu(self):
		if self._menu != None and self._menu !=None:
			if(self._locked > 0):
				self._menu[1].turn_on()
			else:
				self._menu[1].turn_off()
			if(self._alt_pressed > 0):
				self._menu[0].turn_on()
			else:
				self._menu[0].turn_off()
			if(self._x > 0):
				self._menu[3].turn_on()
			else:
				self._menu[3].turn_off()
			if(self._x < 15):
				self._menu[4].turn_on()
			else:
				self._menu[4].turn_off()
			if(self._y > 0):
				self._menu[2].turn_on()
			else:
				self._menu[2].turn_off()
			if(self._y < 15):
				self._menu[5].turn_on()
			else:
				self._menu[5].turn_off()
	

	def _send_nav_box(self):
		if self._shift_pressed == 1:
			for column in range(4):
				for row in range(4):
					if (column * 4 in range(self._x, self._x + 8)) and (row * 4 in range(self._y, self._y + 8)):
						self._grid.get_button(column +2, row+2).send_value(4)
					else:
						self._grid.get_button(column +2, row+2).send_value(3)
	

	def on_enabled_changed(self):
		self.update()
	
	
	def update(self):
		if (self.is_enabled()) and (self._allow_updates==True) and (self._active_client != None):	###added
			if self._shift_pressed == 1:
				self._display_channel()
				self._display_bank()
			else:
				self._update_grid()
			self._update_keys()
			self._update_shift_button()
			self._update_alt_button()
			return None 
		else:
			self._update_requests +=1
	


	def _display_bank(self):
		for index in range(16):
			self._grid.get_button(index, 0).send_value(int(self._active_client._number==index))
		self._update_grid()
		self._active_client._autoselect()
	

	def _display_channel(self):
		for index in range(16):
			self._grid.get_button(index, 1).send_value(int(self._active_client._channel==index)*2)
	


	def _refresh_stored_data(self):
		for index in range(8):
			if not self._client[index].is_connected():
				self._client[index]._create_grid()
				self._client[index]._create_keys()
		self._update_grid()
	
		
	def set_appointed_device(self, device):
		self._script.set_appointed_device(device)
	

	def select_active_client(self):
		self.set_appointed_device(self._active_client.linked_device())
	

	def set_color_map(self, number, map):
		self._color_maps[number] = map
	


	def _set_alt_button(self, alt):
		if self._alt_button != None:
			self._alt_button.remove_value_listener(self._alt_value)
		self._alt_button = alt
		if alt != None:
			assert isinstance(alt, OSCFlashingButtonElement)
			self._alt_button.set_on_off_values(8, 0)
			self._alt_button.add_value_listener(self._alt_value)
	

	def _alt_value(self, value):
		if self._shift_pressed == 0:
			self._alt_pressed = value != 0
			self._active_client._send('alt', int(self._alt_pressed))
			self.update()
	

	def _update_alt_button(self):
		if self._alt_button!=None:
			if self._alt_pressed != 0:
				self._alt_button.send_value(3)
			else:
				self._alt_button.turn_off()
	


	def _set_shift_button(self, shift):
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = shift
		if shift != None:
			assert isinstance(shift, OSCFlashingButtonElement)
			self._shift_button.set_on_off_values(7, 0)
			self._shift_button.add_value_listener(self._shift_value)
	

	def _shift_value(self, value):
		self._shift_pressed = value != 0
		self.update()
	

	def _update_shift_button(self):
		if self._shift_button!=None:
			if self._shift_pressed != 0:
				self._shift_button.send_value(int(self._colors[127]))
			else:
				self._shift_button.send_value(int(self._colors[0]))
	


	def _set_key_buttons(self, buttons):
		#assert (buttons == None) or (isinstance(buttons, list))
		if self._keys!=None:
			for key in self._keys:
				key.remove_value_listener(self._key_value)
		self._keys = buttons
		if self._keys != None and len(buttons) is 8:
			for button in self._keys:
				assert isinstance(button, OSCFlashingButtonElement)
				button.add_value_listener(self._key_value, True)
	

	def _key_value(self, value, sender):
		if self.is_enabled():
			self._active_client._send_key(self._keys.index(sender), int(value!=0))
	

	def _update_keys(self):
		for index in range(8):
			self._send_key(index, self._active_client._key[index])
	
	
	def _send_key(self, index, value):				#to be sent to controller from client
		if self.is_enabled():
			if  self._keys != None and len(self._keys) > index:
				self._keys[index].send_value(int(self._colors[value]))
	


	"""Codec specific methods"""
	def _set_dial_matrix(self, dial_matrix, button_matrix):
		assert isinstance(dial_matrix, (EncoderMatrixElement, type(None)))
		if dial_matrix != self._dial_matrix:
			if self._dial_matrix != None:
				self._dial_matrix.remove_value_listener(self._dial_matrix_value)
			self._dial_matrix = dial_matrix
			if self._dial_matrix != None:
				self._dial_matrix.add_value_listener(self._dial_matrix_value)
		assert isinstance(button_matrix, (ButtonMatrixElement, type(None)))
		if button_matrix != self._dial_button_matrix:
			if self._dial_button_matrix != None:
				self._dial_button_matrix.remove_value_listener(self._dial_button_matrix_value)
			self._dial_button_matrix = button_matrix
			if self._dial_button_matrix != None:
				self._dial_button_matrix.add_value_listener(self._dial_button_matrix_value)
		self.update()
		return None
	

	def _dial_matrix_value(self, value, x, y):
		pass
	

	def _dial_button_matrix_value(self, value, x, y, force):
		pass
	

	def _send_wheel(self, column, row, wheel):		#to be sent to controller from client
		pass
	

	def _update_wheel(self):
		pass
	