# emacs-mode: -*- python-*-
from _Framework.NotifyingControlElement import NotifyingControlElement
#from _Framework.ButtonElement import ButtonElement
#from _Framework.ButtonMatrixElement import ButtonMatrixElement
class SwitchboardElement(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class that connects and disconnects monomodular clients'

	def __init__(self, host, clients):
		#ButtonMatrixElement.__init__(self)
		NotifyingControlElement.__init__(self)
		self._host = host
		self.client_0 = clients[0]
		self.client_1 = clients[1]
		self.client_2 = clients[2]
		self.client_3 = clients[3]
		self._client = clients
		self._last_ping = 0
		self._sandbox = []
		self._edit = False
		#self._host._register_timer_callback(self._ping)

	def disconnect(self):
		#self._host._unregister_timer_callback(self._ping)
		#self._host.log_message('switchboard disconnect')
		for client in self._client:
			client = None
		self._client = []
		#self._send('ping', 'disconnect')
		NotifyingControlElement.disconnect(self)


	def send_swing(self, client, val):
		#self._host._script.log_message('send_swing' + ' ' + str(client) + ' ' + str(val))
		self._host._client[client].receive_swing(val)

	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
#		self._button_value(args1, args2, args3, args4)
		for entry in self._value_notifications:
			callback = entry['Callback']
			callback(args1, args2, args3, args4)


	def reset(self):
		pass


	def request_connection(self, device, version):
		#self._host._script.log_message('request_connection ' + str(device))
		if version == self._host._version_check:
			client_num = 4
			for client in self._client: 
				if client._connected is False:
					client._connect_to(device)
					client_num = client._number
					break
		else:
			client_num = self._host._version_check
		return client_num
	

	def force_connection(self, device, client_number, version):
		if version == self._host._version_check:
			if len(self._sandbox)==0:
				#self._host.log_message('force ' + str(device) + ' ' + str(client_number) + ' build ' + str(self._host._in_build_midi_map))
				for client in self._client:
					if client.device == device:
						client._disconnect_client()
				self._client[client_number]._connect_to(device)
				self._send('ping', 'check_connection', client_number)
			else:
				for pair in self._sandbox:
					present = False
					if (pair['Live_Device'] == device):
						client_number = pair['Live']
						self.disconnect_client(pair['Max_Device'])
						client_number = pair['Live']
						present = True
					if present == False:
						client_number = 4
		else:
			client_number = self._host._version_check
		#self._host.log_message('request_connection return ' + str(client_number) + ' ' + str(device))
		return client_number
	

	def request_sandbox_connection(self, device, original_number, version):
		#self._host.log_message('sandbox ' + str(device) + ' ' + str(original_number))
		if version == self._host._version_check:
			client_number = original_number
			present = False
			for pair in self._sandbox:
				if (pair['Max_Device'] == device):
					client_number = pair['Live']
					break
			if client_number < 4:
				live_device = self._client[original_number].device
				self._client[original_number]._disconnect_client()
				self._client[client_number]._connect_to(device)
				self._sandbox.append({'Live':original_number, 'Live_Device':live_device, 'Max':client_number, 'Max_Device':device, 'Edit':True})
		else:
			client_number = self._host._version_check
		#self._host.log_message('request_sandbox_connection return ' + str(client_number) + ' ' + str(device))
		return client_number
	

	def remove_from_sandbox(self, device):
		present = False
		for pair in self._sandbox:
			if pair['Max_Device'] == device:
				self._sandbox.remove(pair)
	

	def connections(self):
		for index in range(4):
			ping = ('ping', 'connection', index, client[index].device)
			return ping
			

	def disconnect_client(self, device):
		for client in self._client:
			if client.device == device:
				client._disconnect_client()


	def _ping(self):
		self._last_ping = (self._last_ping + 1)%20
		if(self._last_ping == 0):
			self._send('ping', 'clock')
	

	def reset_switchboard_callbacks(self, callback):
		self._host.log_message('reset_clients_callbacks' + str(callback))
		for callback in self._value_notifications:	
			self._host.log_message('removing' + str(callback))
			for notification in self._host._switchboard._value_notifications:
				self._host.log_message('from' + str(notification))
				if (notification['Callback'] == callback):
					self._host._switchboard._value_notifications.remove(notification)
					self._host.log_message('removing' + str(notification))
		self._value_notifications = []
	

	def set_client_enabled(self, client_num, enabled):
		self._client[client_num].set_enabled(enabled)
	

#	def _button_value(self, args1 = None, args2 = None, args3 = None, args4 = None):
#		for entry in self._value_notifications:
#			callback = entry['Callback']
#			self._host.log_message(str('args') + str(args1) + str(args2) + str(args3) + str(args4) + str(callback))
#			callback(args1, args2, args3, args4)


# local variables:
# tab-width: 4
