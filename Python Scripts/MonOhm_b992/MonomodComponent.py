# Partial --== Decompile ==-- with fixes
import Live
from _Framework.CompoundComponent import CompoundComponent
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from FlashingButtonElement import FlashingButtonElement
#from EncoderMatrixElement import EncoderMatrixElement

INITIAL_SCROLLING_DELAY = 5
INTERVAL_SCROLLING_DELAY = 1

FILTER =	[[0, 0, 0, 0, 0, 0, 0, 0], 
			[0, 0, 0, 0, 0, 0, 0, 0],
			[0, 1, 0, 0, 0, 0, 1, 0],
			[1, 1, 0, 0, 0, 0, 1, 1],
			[1, 1, 0, 0, 0, 0, 1, 1],
			[1, 1, 0, 0, 0, 0, 1, 1],
			[1, 1, 1, 1, 1, 1, 1, 1],
			[0, 0, 0, 0, 0, 0, 0, 0]]

RELATIVE = [-1, 1]			

class MonomodComponent(CompoundComponent):
	__module__ = __name__
	__doc__ = ' Component that encompasses and controls 8 Monomod clients '


	def __init__(self, script):
		ControlSurfaceComponent.__init__(self)
		self._sub_components = []
		self.set_allow_update(False) ###added 
		self._script = script
		self._host_name = 'MonOhm'
		self._dial_matrix = None
		self._grid = None
		self._keys = []
		self._alt_button = None
		self._shift_button = None
		self._lock_button = None
		self._nav_buttons = None
		self._menu = None
		self._client = None  ###added
		self._active_client = None
		self._shift_pressed = 0
		self._alt_pressed = 0
		self._bank_add = 0
		self._chan_add = 0
		self._locked = 0
		self._x = 0
		self._y = 0
		self._client_buttons = []
		self._channel_buttons = []
		self._color_maps = [range(128) for index in range(16)]
		self._colors = self._color_maps[0]
		self._offsets = [[0, 0] for index in range(16)]
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1
		self._scroll_right_ticks_delay = -1
		self._scroll_left_ticks_delay = -1
		self._is_enabled = False
		self._is_connected = False
		self.set_allow_update(True)
		self._register_timer_callback(self._on_timer)
		return None
	

	def disconnect(self):
		self.set_allow_update(False)  ###added
		self._active_client = None
		self._set_shift_button(None)
		self._set_lock_button(None)
		self._set_nav_buttons(None)
		self._set_key_buttons(None)
#		self._set_dial_matrix(None, None)
		self._set_button_matrix(None)
		self._client = []
		self._script = []
		return None 
	

	def connect_to_clients(self, monomod):
		self._client = monomod._client
		self._select_client(0)
		#self._active_client._is_active = True
		#self._script.log_message('connected to clients')
	

	def _select_client(self, number):
		self._active_client = self._client[number]
		self._colors = self._color_maps[number]
		for client in self._client:
			if self in client._active_host:
				client._active_host.remove(self)
		self._active_client._active_host.append(self)
		self._x = self._offsets[number][0]
		self._y = self._offsets[number][1]
		self.update()
	


	def _set_button_matrix(self, grid):
		assert isinstance(grid, (ButtonMatrixElement, type(None)))
		if grid != self._grid:
			if self._grid != None:
				self._grid.remove_value_listener(self._matrix_value)
			self._grid = grid
			if self._grid != None:
				self._grid.add_value_listener(self._matrix_value)
			self.update()
		return None
	

	def _matrix_value(self, value, x, y, is_momentary):	   #to be sent to client from controller
		assert (self._grid != None)
		assert (value in range(128))
		assert isinstance(is_momentary, type(False))
		if (self.is_enabled()):
			if self._shift_pressed == 1:
				if value > 0:
					if y == 0:
						self._select_client(x + (self._bank_add * 8))
						self._display_bank()
					elif y == 1:
						self._active_client._set_channel(x + (self._chan_add * 8))
						self._display_channel()
					elif (x == 0) and (y == 2):
						self._bank_add = abs(self._bank_add - 1)
						self._display_bank()
					elif (x == 7) and (y == 2):
						self._chan_add = abs(self._chan_add - 1)
						self._display_channel()
					elif (x in range(2, 4)) and (y in range(2, 4)):
						self._change_offset(0, 0)
					elif (x in range(4, 6)) and (y in range(2, 4)):
						self._change_offset(8, 0)
					elif (x in range(2, 4)) and (y in range(4, 6)):
						self._change_offset(0, 8)
					elif (x in range(4, 6)) and (y in range(4, 6)):
						self._change_offset(8, 8)
					elif (y == 7):
						if self._alt_pressed > 0:
							if (x == 7):
								self.select_active_client()
						else:
							self._active_client._send_key(x, value)		
			elif self._shift_pressed == 0:	
				if self._locked == 1:
					if y == 7:
						if self._alt_pressed > 0:
							#added from here
							if x == 7:
								self.select_active_client()
							else:
								self._active_client._send_key(x, value)
							#to here
						else:
							self._active_client._send_key(x, value) 
					else:
						self._active_client._send_grid(x + self._x, y + self._y, value)
				else:
					self._active_client._send_grid(x + self._x, y + self._y, value)
	

	def _update_grid(self):
		if self.is_enabled() and self._grid != None:
			for column in range(16):
				for row in range(16):
					self._send_grid(column, row, self._active_client._grid[column][row])
	

	def _send_grid(self, column, row, value):		#to be sent to controller from client
		if self.is_enabled() and self._grid != None:
			if column in range(self._x, self._x + 8):
				if row in range(self._y, self._y + 8):
					if self._shift_pressed == 0:
						if self._locked == 1:
							if (row - self._y) < 7:
								self._grid.get_button(column - self._x, row - self._y).send_value(int(self._colors[value]))
						else:
							self._grid.get_button(column - self._x, row - self._y).send_value(int(self._colors[value]))
					else:
						if FILTER[row-self._y][column-self._x] == 1:
							self._grid.get_button(column-self._x, row-self._y).send_value(int(self._colors[value]))
	


	def _set_alt_button(self, alt):
		if self._alt_button != None:
			self._alt_button.remove_value_listener(self._alt_value)
		self._alt_button = alt
		if alt != None:
			assert isinstance(alt, FlashingButtonElement)
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
				self._alt_button.turn_on()
			else:
				self._alt_button.turn_off()
	


	def _set_shift_button(self, shift):
		if self._shift_button != None:
			self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = shift
		if shift != None:
			assert isinstance(shift, FlashingButtonElement)
			self._shift_button.set_on_off_values(7, 0)
			self._shift_button.add_value_listener(self._shift_value)
	

	def _shift_value(self, value):
		self._shift_pressed = value != 0
		self.update()
	

	def _update_shift_button(self):
		if self._shift_button!=None:
			if self._shift_pressed != 0:
				self._shift_button.turn_on()
			else:
				self._shift_button.turn_off()
	


	def _set_lock_button(self, lock):
		if self._lock_button != None:
			self._lock_button.remove_value_listener(self._lock_value)
		self._lock_button = lock
		if lock != None:
			assert isinstance(lock, FlashingButtonElement)
			self._lock_button.set_on_off_values(11, 0)
			self._lock_button.add_value_listener(self._lock_value)
	

	def _lock_value(self, value):
		if (value > 0) and (self._shift_pressed == 0):
			self._locked = not self._locked
			self.update()
	

	def _update_lock_button(self):
		if self._lock_button!=None:
			if self._locked != 0:
				self._lock_button.turn_on()
			else:
				self._lock_button.turn_off()
	


	def _set_key_buttons(self, buttons):
		assert (buttons == None) or (isinstance(buttons, tuple))
		for key in self._keys:
			key.remove_value_listener(self._key_value)
		self._keys = []
		if buttons != None:
			assert len(buttons) == 8
			for button in buttons:
				assert isinstance(button, FlashingButtonElement)
				self._keys.append(button)
				button.add_value_listener(self._key_value, True)
	

	def _key_value(self, value, sender):
		if self.is_enabled():
			self._active_client._send_key(self._keys.index(sender), int(value!=0))
	

	def _update_keys(self):
		for index in range(8):
			self._send_key(index, self._active_client._key[index])
	

	def _send_key(self, index, value):				#to be sent to controller from client
		if self.is_enabled():
			if (self._shift_pressed > 0) or (self._locked > 0):
				self._grid.get_button(index, 7).send_value(int(self._colors[value]))
			if  self._keys != None and len(self._keys) > index:
				self._keys[index].send_value(int(self._colors[value]))
	

	def _set_nav_buttons(self, buttons):
		if self._nav_buttons != None:
			self._nav_buttons[0].remove_value_listener(self._nav_up_value)
			self._nav_buttons[1].remove_value_listener(self._nav_down_value)
			self._nav_buttons[2].remove_value_listener(self._nav_left_value)
			self._nav_buttons[3].remove_value_listener(self._nav_right_value)
		self._nav_buttons = buttons
		if buttons != None:
			assert len(buttons) == 4
			for button in buttons:
				assert isinstance(button, FlashingButtonElement)
			self._nav_buttons[0].set_on_off_values(8, 2)	
			self._nav_buttons[0].add_value_listener(self._nav_up_value)
			self._nav_buttons[1].set_on_off_values(8, 2)	
			self._nav_buttons[1].add_value_listener(self._nav_down_value)
			self._nav_buttons[2].set_on_off_values(8, 2)	
			self._nav_buttons[2].add_value_listener(self._nav_left_value)
			self._nav_buttons[3].set_on_off_values(8, 2)
			self._nav_buttons[3].add_value_listener(self._nav_right_value)		
	

	def _nav_up_value(self, value):
		if self._shift_pressed == 0:
			if (value > 0):
				self._scroll_up_ticks_delay = INITIAL_SCROLLING_DELAY
				if (not self._is_scrolling()):
					self._set_offset(self._x, self._y - 1)	
			else:
				self._scroll_up_ticks_delay = -1
	

	def _nav_down_value(self, value):
		if self._shift_pressed == 0:
			if (value > 0):
				self._scroll_down_ticks_delay = INITIAL_SCROLLING_DELAY
				if (not self._is_scrolling()):
					self._set_offset(self._x, self._y + 1)	
			else:
				self._scroll_down_ticks_delay = -1
	

	def _nav_left_value(self, value):
		if self._shift_pressed == 0:
			if (value > 0):
				self._scroll_left_ticks_delay = INITIAL_SCROLLING_DELAY
				if (not self._is_scrolling()):
					self._set_offset(self._x - 1, self._y)	
			else:
				self._scroll_left_ticks_delay = -1
	

	def _nav_right_value(self, value):
		if self._shift_pressed == 0:
			if (value > 0):
				self._scroll_right_ticks_delay = INITIAL_SCROLLING_DELAY
				if (not self._is_scrolling()):
					self._set_offset(self._x + 1, self._y)	
			else:
				self._scroll_right_ticks_delay = -1
	

	def _on_timer(self):
		if self.is_enabled():
			scroll_delays = [self._scroll_up_ticks_delay,
							 self._scroll_down_ticks_delay,
							 self._scroll_right_ticks_delay,
							 self._scroll_left_ticks_delay]
			if (scroll_delays.count(-1) < 4):
				x_increment = 0
				y_increment = 0
				if (self._scroll_right_ticks_delay > -1):
					if self._is_scrolling():
						x_increment += 1
						self._scroll_right_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_right_ticks_delay -= 1
				if (self._scroll_left_ticks_delay > -1):
					if self._is_scrolling():
						x_increment -= 1
						self._scroll_left_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_left_ticks_delay -= 1
				if (self._scroll_down_ticks_delay > -1):
					if self._is_scrolling():
						y_increment += 1
						self._scroll_down_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_down_ticks_delay -= 1
				if (self._scroll_up_ticks_delay > -1):
					if self._is_scrolling():
						y_increment -= 1
						self._scroll_up_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_up_ticks_delay -= 1
				new_x_offset = max(0, (self._x + x_increment))
				new_y_offset = max(0, (self._y + y_increment))
				if ((new_x_offset != self._x) or (new_y_offset != self._y)):
					self._set_offset(new_x_offset, new_y_offset)
	

	def _is_scrolling(self):
		return (0 in (self._scroll_up_ticks_delay,
					  self._scroll_down_ticks_delay,
					  self._scroll_right_ticks_delay,
					  self._scroll_left_ticks_delay))
	

	def _update_nav_buttons(self):
		if self._nav_buttons != None:
			if(self._x > 0):
				self._nav_buttons[2].turn_on()
			else:
				self._nav_buttons[2].turn_off()
			if(self._x < 8):
				self._nav_buttons[3].turn_on()
			else:
				self._nav_buttons[3].turn_off()
			if(self._y > 0):
				self._nav_buttons[0].turn_on()
			else:
				self._nav_buttons[0].turn_off()
			if(self._y < 8):
				self._nav_buttons[1].turn_on()
			else:
				self._nav_buttons[1].turn_off() 
	

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
	

	def _send_nav_box(self):
		if self._shift_pressed == 1:
			for column in range(4):
				for row in range(4):
					if (column * 4 in range(self._x, self._x + 8)) and (row * 4 in range(self._y, self._y + 8)):
						self._grid.get_button(column +2, row+2).send_value(4)
					else:
						self._grid.get_button(column +2, row+2).send_value(1)
	


	def on_enabled_changed(self):
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1
		self._scroll_right_ticks_delay = -1
		self._scroll_left_ticks_delay = -1
		self.update()
	

	def update(self):
		if (self.is_enabled()) and (self._allow_updates==True) and (self._active_client != None):	###added
			if self._shift_pressed == 1:
				self._display_channel()
				self._display_bank()
				self._send_nav_box()
			else:
				self._update_grid()
			self._update_keys()
			self._update_nav_buttons()
			self._update_shift_button()
			self._update_lock_button()
			self._update_alt_button()
			return None 
		else:
			self._update_requests +=1
	

	def _display_bank(self):
		self._grid.get_button(0, 2).send_value(self._bank_add * 8)
		for index in range(8):
			self._grid.get_button(index, 0).send_value(int(self._bank_add!=0)*127)
		if(self._active_client._number in range((self._bank_add * 8), (self._bank_add * 8) + 8)):
			self._grid.get_button(self._active_client._number - (self._bank_add * 8), 0).send_value(int(self._bank_add==0)*127)
		self._update_grid()
		self._active_client._autoselect()
	

	def _display_channel(self):
		self._grid.get_button(7, 2).send_value(self._chan_add * 8)
		for index in range(8):
			self._grid.get_button(index, 1).send_value(int(self._chan_add!=0)*127)
		if(self._active_client._channel in range((self._chan_add * 8), (self._chan_add * 8) + 8)):
			self._grid.get_button(self._active_client._channel - (self._chan_add * 8), 1).send_value(int(self._chan_add==0)*127)
	

	def _refresh_stored_data(self):			##currently not used
		for index in range(8):
			if not self._client[index].is_connected():
				self._client[index]._create_grid()
				self._client[index]._create_keys()
		self.update()
	


	def set_appointed_device(self, device):
		if device != None:
			self._script.song().view.select_device(device)
		self._script.set_appointed_device(device)
		#	self._script.set_selected_device(device)
		self._script._device.set_device(device)
		self._script.request_rebuild_midi_map()
		#self._script._device.update()
		#self._script._shift_update()

	def select_active_client(self):
		self.set_appointed_device(self._active_client.linked_device())
	

	def set_color_map(self, number, map):
		self._color_maps[number] = map
	


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
	


	
