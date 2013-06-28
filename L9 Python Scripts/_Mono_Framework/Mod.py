# by amounra 0513 : http://www.aumhaa.com

from __future__ import with_statement
import Live
import contextlib

from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ControlElement import ControlElement
from _Framework.CompoundComponent import CompoundComponent # Base class for classes encompasing other components to form complex components
from _Framework.Task import *
from _Framework.SubjectSlot import SubjectEvent
from _Framework.Signal import Signal
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.Util import in_range
from _Framework.Debug import debug_print
from _Framework.Disconnectable import Disconnectable
from _Framework.InputControlElement import InputSignal


def hascontrol(handler, control):
	return control in handler._controls.keys()


def unpack_values(values):
	return [int(i) for i in str(values).split('^')]


class SpecialInputSignal(Signal):


	def __init__(self, sender = None, *a, **k):
		super(SpecialInputSignal, self).__init__(sender=sender, *a, **k)
		self._input_control = sender
	

	@contextlib.contextmanager
	def _listeners_update(self):
		old_count = self.count
		yield
		diff_count = self.count - old_count
		self._input_control._input_signal_listener_count += diff_count
		listener_count = self._input_control._input_signal_listener_count
	

	def connect(self, *a, **k):
		with self._listeners_update():
			super(SpecialInputSignal, self).connect(*a, **k)
	

	def disconnect(self, *a, **k):
		with self._listeners_update():
			super(SpecialInputSignal, self).disconnect(*a, **k)
	

	def disconnect_all(self, *a, **k):
		with self._listeners_update():
			super(SpecialInputSignal, self).disconnect_all(*a, **k)
	


class StoredElement(object):	


	def __init__(self, active_handlers, *a, **attributes):
		self._active_handlers = active_handlers
		self._value = 0
		for name, attribute in attributes.iteritems():
			setattr(self, name, attribute)
	

	def value(self, value):
		self._value = value
		self.update_element()
	

	def update_element(self):
		for handler in self._active_handlers():
			handler.receive_address(self._name, self._value)
	

	def restore(self):
		self.update()
	


class Grid(object):


	def __init__(self, active_handlers, name, width, height):
		self._active_handlers = active_handlers
		self._name = name
		self._cell = [[StoredElement(active_handlers, _name = self._name + '_' + str(x) + '_' + str(y), _x = x, _y = y ) for y in range(height)] for x in range(width)]
	

	def restore(self):
		for column in self._cell:
			for element in column:
				self.update_element(element)
	

	def update_element(self, element):
		for handler in self._active_handlers():
			handler.receive_address(self._name, element._x, element._y, element._value)
	

	def value(self, x, y, value):
		element = self._cell[x][y]
		element._value = value
		self.update_element(element)
	

	def row(self, row, value):
		for column in range(len(self._cell)):
			self.value(column, row, value)
	

	def column(self, column, value):
		for row in range(len(self._cell[column])):
			self.value(column, row, value)
	

	def all(self, value):
		for column in range(len(self.cell)):
			for row in range(len(self.cell[column])):
				self.value(column, row, value)
	

	def mask(self, x, y, value):
		element = self.cell[x][y]
		if value > 0:
			for handler in self._active_handlers():
				handler.receive_address(self.name, element._x, element._y, value)
		else:
			self.update_element(element)
	

	def mask_row(self, row, value):
		for column in range(len(self.cell[row])):
			self.mask(column, row, value)
	

	def mask_column(self, column, value):
		for row in range(len(self.cell)):
			self.mask(column, row, value)
	

	def mask_all(self, value):
		for column in range(len(self.cell)):
			for row in range(len(self.cell[column])):
				self.mask(column, row, value)
	


class Array(object):


	def __init__(self, active_handlers, name, size):
		self._active_handlers = active_handlers
		self._name = name
		self._cell = [StoredElement(self._name + '_' + str(num), _num = num) for num in range(size)]
	

	def restore(self):
		for element in self._cell:
			self.update_element(element)
	

	def update_element(self, element):	
		for handler in self._active_handlers():
			handler.receive_address(self._name, element._num, element._value)
	

	def value(self, num, value):
		element = self._cell[num]
		element._value = value
		self.update_element(element)
	

	def all(self, value):
		for num in range(len(self.cell)):
			self.value(num, value)
	

	def mask(self, num, value):
		control = self.cell[num]
		if value > 0:
			for handler in self._active_handlers():
				handler.receive_address(self.name, element._num, value)
		else:
			self._update_element(element)
	

	def mask_all(self, value):
		for num in range(len(self.cell)):
			self.mask(num, value)
	


class ModHandler(CompoundComponent):


	def __init__(self, script, *a, **k):
		super(ModHandler, self).__init__(*a, **k)
		self._script = script
		self.log_message = script.log_message
		self.modrouter = script.monomodular
		self._active_mod = None
		self._color_maps = [range(128) for index in range(17)]
		self._colors = self._color_maps[0]
		self._is_enabled = False
		self._is_connected = False
		self._receive_methods = {}
		self.modrouter.register_handler(self)
	

	def disconnect(self, *a, **k):
		self._active_mod = None
		super(ModHandler, self).disconnect(*a, **k)
	

	def update(self, *a, **k):
		if self._active_mod:
			self._active_mod.restore()
	

	def select_mod(self, mod):
		self._active_mod = mod
		#self._colors = self._color_maps[number]
		for mod in self.modrouter._mods:
			if self in mod._active_handlers:
				mod._active_handlers.remove(self)
		if not self._active_mod is None:
			self._active_mod._active_handlers.append(self)
			self._active_mod.restore()
		self.update()
	

	def receive_address(self, address_name, *a, **k):
		self.log_message('receive_address ' + str(address_name) + str(a))
		if address_name in self._receive_methods.keys():
			self._receive_methods[address_name](*a, **k)
	

	def _register_addresses(self, client):
		pass  # this should be overridden by the controlsurface instance
	

	def _receive_grid(self, address):
		pass
	



class ModClient(NotifyingControlElement):


	__subject_events__ = (SubjectEvent(name='value', signal=InputSignal, override=True),)
	_input_signal_listener_count = 0

	def __init__(self, parent, device, name, *a, **k):
		super(ModClient, self).__init__(*a, **k)
		self.name = name
		self.device = device
		self._device_parent = None
		self._parent = parent
		self.log_message = parent.log_message
		self._active_handlers = []
		self._addresses = {}
		for handler in self._parent._handlers:
			handler._register_addresses(self)
	

	def addresses(self):
		return self._addresses
	

	def active_handlers(self):
		return self._active_handlers
	

	def receive(self, address_name, method = 'value', values = 0, *a, **k):
		if address_name in self._addresses.keys():
			address = self._addresses[address_name]
			value_list = unpack_values(values)
			self.log_message('address: ' + str(address) + ' value_list: ' + str(value_list))
			try:
				getattr(address, method)(*value_list)
			except:
				self.log_message('receive method exception')
	

	def send(self, control_name, *a):
		self.notify_value(control_name, *a)
	

	def is_active(self):
		return (len(self._active_host) > 0)
	

	def set_enabled(self, val):
		self._enabled = val!=0
	

	def is_connected(self):
		return self._connected
	

	def disconnect(self):
		self._active_handler = []
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		super(ModClient, self).disconnect()
		self._enabled = True
	

	def reset(self):
		pass
	

	def restore(self):
		for address_name, address in self._addresses.iteritems():
			address.restore()
	

	def _connect_to(self, device):
		self._connected = True
		self.device = device
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._device_parent = device.canonical_parent
		if not self._device_parent.devices_has_listener(self._device_listener):
			self._device_parent.add_devices_listener(self._device_listener)
		for handler in self._active_handler:
			handler.update()
	

	def _disconnect_client(self, reconnect = False):
		if self._device_parent != None:
			if self._device_parent.devices_has_listener(self._device_listener):
				self._device_parent.remove_devices_listener(self._device_listener)
		self._connected = False
		self.device = None
		for handler in self._active_handler:
			handler.update()
	

	def _device_listener(self):
		if self.device == None:
			self._disconnect_client()
	

	def linked_device(self):
		return self.device
	

	def script_wants_forwarding(self):
		return True
	


class ModRouter(CompoundComponent):


	def __init__(self, *a, **k):
		super(ModRouter, self).__init__(*a, **k)
		self._host = None
		self._handlers = []
		self._mods = []
		return None
	

	def set_host(self, host):
		assert isinstance(host, ControlSurface)
		self._host = host
		self._host._task_group.add(repeat(self.timer))
		self._host.log_message('host registered: ' + str(host))
		self.log_message = host.log_message
	

	def has_host(self):
		from _Framework.ControlSurface import ControlSurface
		result = False
		if hasattr(self._host, '_task_group'):
			result = self._host._task_group.find(self.timer)
		return result
	

	def register_handler(self, handler):
		if handler not in self._handlers:
			self._handlers.append(handler)
	

	def devices(self):
		return [mod.device for mod in self._mods]
	

	def get_mod(self, device):
		mod = None
		for mod_device in self._mods:
			if mod_device.device == device:
				mod = mod_device
		return mod
	

	def add_mod(self, device):
		self._host.log_message('device: ' + str(device))
		if not device in self.devices():
			with self._host.component_guard():
				#self._host.log_message('its not there...')
				self._mods.append( ModClient(self, device, 'modClient'+str(len(self._mods))) )
		ret = self.get_mod(device)
		#self._host.log_message('sending back: ' + str(ret))
		return ret
	

	def timer(self, *a, **k):
		pass
	

	def update(self):
		pass
	

	def disconnect(self):
		super(ModRouter, self).disconnect()
		del __builtins__['monomodular']
	
