# 2012 amounra

#from _Framework.NotifyingControlElement import NotifyingControlElement

from __future__ import with_statement
import Live
import sys
import modRemixNet as RemixNet
import modOSC
import LiveUtils

from MonoLink_Map import *
from modZeroconf import *
import modsocket as socket


import contextlib
from _Framework.SubjectSlot import SubjectEvent
from _Framework.Signal import Signal
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.Util import in_range
from _Framework.Debug import debug_print
from _Framework.Disconnectable import Disconnectable
#from _Framework_old.ButtonElement import ButtonElement
#from _Framework_old.ButtonMatrixElement import ButtonMatrixElement
#default_wheel = []
#default_wheel._value = 0
#default_wheel._mode = 0
#default_wheel._white = 0
#default_wheel._green = 0
#default_wheel._custom = [[1, 2]]

wheel_parameter = {0: 'value', 1: 'mode', 2:'green', 3:'white', 4:'custom'}
LOGO = [[0, 1, 1],	[0, 2, 1], [0, 3, 1], [0, 4, 1], 
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
		[23, 0, 1], [23, 3, 1],	 [23, 4, 1], 
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


MODES = ['SerialOSC', 'MonomeSerial']
MSG = ['/grid/key', '/press']
QUADS = [[0, 0], [8, 0], [0, 8], [8, 8]]


class InputSignal(Signal):
	"""
	Special signal type that makes sure that interaction with input
	works properly. Special input control elements that define
	value-dependent properties should use this kind of signal.
	"""

	def __init__(self, sender = None, *a, **k):
		super(InputSignal, self).__init__(sender=sender, *a, **k)
		self._input_control = sender

	@contextlib.contextmanager
	def _listeners_update(self):
		old_count = self.count
		yield
		diff_count = self.count - old_count
		self._input_control._input_signal_listener_count += diff_count
		listener_count = self._input_control._input_signal_listener_count
		#if diff_count > 0 and listener_count == diff_count or diff_count < 0 and listener_count == 0:
		#	self._input_control._request_rebuild()

	def connect(self, *a, **k):
		with self._listeners_update():
			super(InputSignal, self).connect(*a, **k)

	def disconnect(self, *a, **k):
		with self._listeners_update():
			super(InputSignal, self).disconnect(*a, **k)

	def disconnect_all(self, *a, **k):
		with self._listeners_update():
			super(InputSignal, self).disconnect_all(*a, **k)
	


class MonoLinkClient(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class representing a 2-dimensional set of buttons capable of holding data in an array '


	__subject_events__ = (SubjectEvent(name='value', signal=InputSignal, override=True),)
	_input_signal_listener_count = 0

	def __init__(self, script, number, *a, **k):
		#NotifyingControlElement.__init__(self)
		super(MonoLinkClient, self).__init__(script, number, *a, **k)
		self._host = script
		
		#monolink specific 
		self._prefix = '/MonoLink'
		self.basicAPI = False
		self.conf = None
		self._inPrt = int(PRESETS[0][2][0])
		self._outPrt = int(PRESETS[0][2][1])
		self._inst = 0
		
		try:	
			self.conf = Zeroconf(self)
		except:
			self._host.log_message('Could not create Bonjour Registerer...something must be blocking this port or address') 
		
		self._is_monolink = True
		self._format = 0
		self.oscServer = None
		self._setup_oscServer()
		
				
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
		self._create_grid()
		self._create_keys()
		self._create_wheels()
	

	def _setup_oscServer(self):
		if not self.oscServer is None:
			self.oscServer.shutdown()	
		self.basicAPI = False
		self.oscServer = RemixNet.OSCServer('localhost', self._outPrt, 'localhost', self._inPrt)
		self._inPrt = int(self.oscServer.srcPort)	##doing this in case the port wasn't available and had to be advanced by the oscServer
		self.oscServer.sendOSC('/MonoLink', 'startup')
	


	def is_active(self):
		return (len(self._active_host) > 0)
	

	def set_enabled(self, val):
		self._enabled = val!=0
	

	def is_connected(self):
		return self._connected
	

	def _banner(self):
		pass
	

	def disconnect(self):
		#self._disconnect_client()
		self._active_host = []
		self._value_notifications = []
		self._enabled = False
		if not self.oscServer is None:
			self.oscServer.shutdown()
		self.oscServer = None
		self.unregister()
	

	def reset(self):
		pass
	

	def _connect_to(self, device=None):
		#self._host.log_message('client ' + str(self._number) + ' connect_to'  + str(device.name))
		self._connected = True
		#self.device = device
		#if self._device_parent != None:
		#	if self._device_parent.devices_has_listener(self._device_listener):
		#		self._device_parent.remove_devices_listener(self._device_listener)
		#self._device_parent = device.canonical_parent
		#if not self._device_parent.devices_has_listener(self._device_listener):
		#	self._device_parent.add_devices_listener(self._device_listener)
		self._host._refresh_stored_data()
	

	def _disconnect_client(self):
		#self._host.log_message('disconnect' + str(self._number))
		self._create_grid()
		self._create_keys()
		self._swing = 0
		self._report_offset = False
		#if self._device_parent != None:
		#	if self._device_parent.devices_has_listener(self._device_listener):
		#		self._device_parent.remove_devices_listener(self._device_listener)
		self._connected = False
		#self._host._switchboard.remove_from_sandbox(self.device)
		self._device = None
		self._value_notifications = []
		for host in self._active_host:
			host.update()
	

	def _device_listener(self):
		#if self.device == None:
		#	self._disconnect_client()
		pass
	


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
		#self._offset = [x, y]
		#if(self._report_offset is True):
		#	self._send('offset', x, y)	
		pass
	

	def _send_key(self, index, value):
		#self._send('key', index, value)
		pass
	

	def _send_grid(self, column, row, value):
		#self._host.log_message('_send' + str(self._prefix) + '/grid/key' + str(column)+' '+str(row)+' '+str(value))
		self._send(MSG[self._format], [column, row, value])
	

	def _send(self, addr = None, val = None):
		#self._host.log_message('_send' + str(addr) + str(val))
		if (self._enabled is True) and (self.oscServer != None):
			#self._host.log_message('really _send' + str(self._prefix) + str(addr) + ' ' + str(val))
			self.oscServer.sendOSC(str(self._prefix)+addr, val)
	


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
		self._swing = swing
		self._send('swing', swing)
	

	def receive_autoselect_enabled(self, val):
		#self._autoselect_enabled = val
		pass
	

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
		#self._host.log_message(str(client) + str(func) + str(arguments))
		if(client in range(16)) and (func != None):
			self._host._client[client]._send('hotline', func, arguments)
		elif(client == 'all') and (func != None):
			for client in self._host._client:
				client._send('hotline', func, arguments)
	

	def autoselect_enabled(self):
		return self._autoselect_enabled > 0
	

	def report_swing(self, swing):
		self._send('report_swing', swing)
	

	def _set_channel(self, channel):
		self._send('channel', channel)
		if channel != self._channel:
			self._channel = channel
			self._prefix = PRESETS[self._channel][0]
			self._change_modes(PRESETS[self._channel][1])
			self._change_ports(PRESETS[self._channel][2])
			self._display_info(self._inPrt, self._outPrt)
	

	def _autoselect(self):
		if self.autoselect_enabled():
			if self.device != None:
				for host in self._active_host:
					host.set_appointed_device(self.device)
	

	def linked_device(self):
		return self.device
	

	def set_report_offset(self, val):
		self._report_offset = (val == 1)
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
	

	def receive_channel(self, channel):
		if channel in range(16):
			self._channel = channel

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
	

	#MonoLinkComponent specific calls 

	def call_network_functions(self):
		#self._host.log_message('call_net_func')		  
		if self.basicAPI is False:
			#self._host.log_message('basicAPI is False')		
			try:
				doc = self._host.song()
			except:
				return
			try:
				#self._host.log_message('trying to assign callbacks')
				self.basicAPI = self._assign_sys_callbacks()
				# Commented for stability
				#doc.add_current_song_time_listener(self.oscServer.processIncomingUDP)
				self.oscServer.sendOSC('/MonoLink', ['basicAPI:', int(self.basicAPI)])
				self.register()
				self._assign_callbacks(self._prefix)
				self.set_enabled(1)
			except:
				return
		if self.is_active() and self.oscServer:
			try:
				self.oscServer.processIncomingUDP()
			except:
				pass
	

	def _conf_info(self):
		desc = {'type':'_monome-osc._udp','domain':'local'}
		return ServiceInfo("_monome-osc._udp.local.", "monolink "+str(self._inst)+"._monome-osc._udp.local.", socket.inet_aton("127.0.0.1"), self._inPrt, 0, 0, desc, "localhost")
	
	

	def register(self):
		if self.conf:
			#self._host.log_message('registering service info for port ' + str(self._inPrt))
			try:
				self.conf.registerService([self._conf_info(), 0], 20)
			except:
				self._host.log_message('cannot register current service info')
	

	def unregister(self):
		if self.conf:
			#self._host.log_message('unregistering service for port ' + str(self._inPrt))
			try:
				self.conf.unregisterService([self._conf_info(), 0])
			except:
				self._host.log_message('cannot unregister current service info')
			self._inst += 1
	

	def _assign_sys_callbacks(self):
		#self._host.log_message('assign_sys_callbacks')
		if self.oscServer:
			#self._host.log_message('deleting sys callbacks')
			self.oscServer.resetCallbacks()
		else:
			return False
		if self._format is 0:
			self.oscServer.addCallback(self.sysEchoCB, "/echo")
			self.oscServer.addCallback(self.sysInfoCB, "/sys/info")
			self.oscServer.addCallback(self.sysPortCB, "/sys/port")
			self.oscServer.addCallback(self.sysHostCB, "/sys/host")
			self.oscServer.addCallback(self.sysIdCB, "/sys/id")
			self.oscServer.addCallback(self.sysPrefixCB, "/sys/prefix")
			self._assign_callbacks(self._prefix)
			#self._host.log_message('serialosc sys callbacks assigned, returning true')
			return True
		elif self._format is 1:
			self.oscServer.addCallback(self.sysEchoCB, "/echo")
			self.oscServer.addCallback(self.sysOffsetCB, "/sys/offset")
			self.oscServer.addCallback(self.sysPrefixCB, "/sys/prefix")
			self.oscServer.addCallback(self.sysReportCB, "/sys/report")
			#self._host.log_message('monomeserial sys callbacks assigned, returning true')
			self._assign_callbacks(self._prefix)
			return True
		else:
			return False
	

	def sysEchoCB(self, msg=None):
		self.oscServer.sendOSC("/MonoLink/echo", msg)
	

	def sysInfoCB(self, msg=None):
		self._host.log_message('infoCB' + str(self._outPrt) + str(self._prefix))
		self._host.schedule_message(30, self._info_return)
	

	def _info_return(self):
		if(self.oscServer):
			if self._format is 0:
				self._host.log_message('info return serialosc')
				self.oscServer.sendOSC("/sys/port", self._outPrt)
				self.oscServer.sendOSC("/sys/prefix", self._prefix)
				self.oscServer.sendOSC("/sys/id", self._number)
			elif self._format is 1:
				self._host.log_message('info return monomeserial')
				self.oscServer.sendOSC("/sys/devices", 1)
				self.oscServer.sendOSC("/sys/prefix", [0, self._prefix])
				self.oscServer.sendOSC("/sys/type", [0, 256])
				self.oscServer.sendOSC("/sys/cable", [0, 'up'])
				self.oscServer.sendOSC("/sys/offset", [0, 0, 0])
		self._host.log_message('info return completed')
	

	def sysPortCB(self, msg=None):
		self._host.log_message('sysPortCB' + str(msg))
		if msg[2] != None:
			self._host.log_message('old outport ' + str(self._outPrt))
			if	self._outPrt != int(msg[2]):
				self._outPrt = int(msg[2])
				self.oscServer.set_outPort(self._outPrt)
				self._host.log_message('changed')
	

	def sysHostCB(self, msg=None):
		self._host.log_message('sysHostCB' + str(msg))
	

	def sysIdCB(self, msg=None):
		self._host.log_message('sysIdCB' + str(msg))
	

	def sysPrefixCB(self, msg=None):
		self._host.log_message('sysPrefix' + str(msg))
		self._prefix = str(msg[2])
		self._assign_callbacks(msg[2])
		self._host.schedule_message(30, self._info_return)
	

	def sysOffsetCB(self, msg=None):
		pass
	

	def sysReportCB(self, msg=None):
		pass
	

	def _assign_callbacks(self, prefix):
		#self._host.log_message('assigning callbacks for prefix')
		if self._prefix != prefix:
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/set'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/all'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/map'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/row'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/col'))
			self.oscServer.removeCallback(str(self._prefix+'/led'))
			self.oscServer.removeCallback(str(self._prefix+'/clear'))
			self.oscServer.removeCallback(str(self._prefix+'/frame'))
			self.oscServer.removeCallback(str(self._prefix+'/led_row'))
			self.oscServer.removeCallback(str(self._prefix+'/led_col'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/intensity'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/level/set'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/level/all'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/level/map'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/level/row'))
			self.oscServer.removeCallback(str(self._prefix+'/grid/led/level/col'))
			#self._host.log_message('prefixed callbacks deleted')
		if prefix != None:
			self._prefix = prefix
			if self._format is 0:
				self.oscServer.addCallback(self.ledSet, str(self._prefix+'/grid/led/set'))
				self.oscServer.addCallback(self.ledAll, str(self._prefix+'/grid/led/all'))
				self.oscServer.addCallback(self.ledMap, str(self._prefix+'/grid/led/map'))
				self.oscServer.addCallback(self.ledRow, str(self._prefix+'/grid/led/row'))
				self.oscServer.addCallback(self.ledCol, str(self._prefix+'/grid/led/col'))
				self.oscServer.addCallback(self.ledIntensity, str(self._prefix+'/grid/led/intensity'))
				self.oscServer.addCallback(self.ledLvlSet, str(self._prefix+'/grid/led/level/set'))
				self.oscServer.addCallback(self.ledLvlAll, str(self._prefix+'/grid/led/level/all'))
				self.oscServer.addCallback(self.ledLvlMap, str(self._prefix+'/grid/led/level/map'))
				self.oscServer.addCallback(self.ledLvlRow, str(self._prefix+'/grid/led/level/row'))
				self.oscServer.addCallback(self.ledLvlCol, str(self._prefix+'/grid/led/level/col'))
			elif self._format is 1:
				self.oscServer.addCallback(self.ledSet, str(self._prefix+'/led'))
				self.oscServer.addCallback(self.ledClear, str(self._prefix+'/clear'))
				self.oscServer.addCallback(self.ledMap, str(self._prefix+'/frame'))
				self.oscServer.addCallback(self.led_row, str(self._prefix+'/led_row'))
				self.oscServer.addCallback(self.led_col, str(self._prefix+'/led_col'))
		#self._host.log_message('prefixed callbacks assigned')
	

	def ledSet(self, msg=None):
		#self._script.log_message('_ledSet' + str(msg[2]) + str(msg[3]) + str(msg[4]))
		self.receive_grid(msg[2], msg[3], msg[4])
	

	def ledAll(self, msg=None):
		self.receive_grid_all(msg[2])
	

	def ledRow(self, msg=None):
		if len(msg) > 3:
			xOff = int(msg[2])
			if xOff%8 is 0:
				yOff = int(msg[3])
				rows = msg[4:]
				for quad in range(len(rows)):
					rowOut = self.int2bin(rows[quad])
					for cell in range(8):
						#self._host.log_message(str(xOff+index+QUADS[quad][0]) + str(yOff+cell+QUADS[quad][1]) + str(rowOut[index]))
						self.receive_grid(xOff+QUADS[quad][0], yOff+cell+QUADS[quad][1], rowOut[cell])
	

	def ledCol(self, msg=None):
		if len(msg) > 3:
			yOff = int(msg[3])
			if yOff%8 is 0:
				xOff = int(msg[2])
				cols = msg[4:]
				for quad in range(len(cols)):
					colOut = self.int2bin(cols[quad])
					for cell in range(8):
						#self._host.log_message(str(xOff+index+QUADS[quad][0]) + str(yOff+cell+QUADS[quad][1]) + str(rowOut[index]))
						self.receive_grid(xOff+cell+QUADS[quad][0], yOff+QUADS[quad][1], colOut[cell])
	

	def ledMap(self, msg=None):
		xOff = int(msg[2])
		yOff = int(msg[3])
		map = msg[4:]
		if len(map) is 8:
			for row in range(8):
				rowOut = self.int2bin(row)
				for cell in range(8):
					self.receive_grid(x_Off+cell, yOff+row, rowOut[cell])
	

	def ledIntensity(self, msg=None):
		pass
	

	def ledLvlSet(self, msg=None):
		pass
	

	def ledLvlAll(self, msg=None):
		pass
	

	def ledLvlMap(self, msg=None):
		pass
	

	def ledLvlRow(self, msg=None):
		pass
	

	def ledLvlCol(self, msg=None):
		pass
	

	def ledClear(self, msg=None):
		self.receive_grid_all(0)
	

	def led_col(self, msg=None):
		if len(msg) > 2:
			xOff = int(msg[2])
			cols = msg[3:]
			for quad in range(len(cols)):
				colOut = self.int2bin(cols[quad])
				for cell in range(8):
					self.receive_grid(xOff+QUADS[quad][0], cell+QUADS[quad][1], colOut[cell])

	

	def led_row(self, msg=None):
		if len(msg) > 2:
			yOff = int(msg[2])
			rows = msg[3:]
			for quad in range(len(rows)):
				rowOut = self.int2bin(rows[quad])
				for cell in range(8):
					self.receive_grid(cell+QUADS[quad][0], yOff+QUADS[quad][1], rowOut[cell])

	

	def _display_info(self, inPrt, outPrt):
		self._host.show_message('Preset: ' + str(PRESETS[self._channel][3]) + ' In: ' + str(inPrt) + ' Out: ' + str(outPrt) + ' Format: ' + str(MODES[self._format]) + ' Pre: ' + str(self._prefix))
	

	def _change_ports(self, ports):
		self._host.log_message('ports ' + str(ports))
		inPrt = self._inPrt
		outPrt = self._outPrt
		if len(ports[0]) > 0:
			str_inPrt = ''.join(ports[0]).strip('\'')
			inPrt = str_inPrt
		inPrt = int(inPrt)
		if len(ports[1]) > 0:
			str_outPrt = ''.join(ports[1]).strip('\'')
			outPrt = str_outPrt
		outPrt = int(outPrt)
		if inPrt in range(0,65535) and outPrt in range(0,65535):
			if not (self._outPrt == outPrt):
				self._outPrt = outPrt
				PRESETS[self._channel][2][1] = str(self._outPrt)
			if not (self._inPrt == inPrt):
				self._inPrt = inPrt
				self.unregister()
				PRESETS[self._channel][2][0] = str(self._inPrt)
				self._host.schedule_message(15, self._setup_oscServer)
			else:
				self.oscServer.set_outPort(self._outPrt)
	

	def _change_modes(self, value):
		self._format = value
		self._assign_sys_callbacks()
	

	def int2bin(self, n):
		return [((n >> y) & 1) for y in range(8)]
	


#self.device = self._host.song().view.selected_track.view.selected_device
# local variables:
# tab-width: 4
