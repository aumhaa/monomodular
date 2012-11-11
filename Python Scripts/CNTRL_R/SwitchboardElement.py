# emacs-mode: -*- python-*-
import Live
import time
from _Framework.NotifyingControlElement import NotifyingControlElement
class SwitchboardElement(NotifyingControlElement):
	__module__ = __name__
	__doc__ = ' Class that connects and disconnects monomodular clients'

	def __init__(self, host, clients):
		NotifyingControlElement.__init__(self)
		self._host = host
		self._devices = []
		self.client_0 = clients[0]
		self.client_1 = clients[1]
		self.client_2 = clients[2]
		self.client_3 = clients[3]
		self._client = clients
	


	def disconnect(self):
		for client in self._client:
			client = None
		self._client = []
		NotifyingControlElement.disconnect(self)
	

	def _send(self, args1 = None, args2 = None, args3 = None, args4 = None):
		#self._host.log_message('switchboard send' + str(self._host._in_build_midi_map) + str(self._host._enabled) + str(args1) + str(args2) + str(args3) + str(args4))
		for entry in self._value_notifications:
			callback = entry['Callback']
			try:
				callback(args1, args2, args3, args4)
			except:
				self._host.log_message('failed callback ' + str(callback) + ' removing')
				self.remove_value_listener(callback)
	

	def reset(self):
		pass
	

	def reset_callbacks(self):
		for entry in self._value_notifications:
			callback = entry['Callback']
			self.remove_value_listener(callback)
		self._value_notifications = []
		

	def request_connection(self, device, version, inLive = 0):
		#self._host.log_message('request_connection ' + str(device))
		if version == self._host._version_check:
			client_num = 4	
			for client in self._client:
				if client.device == device:
					client._disconnect_client()
			for client in self._client: 
				if client._connected is False:
					client._connect_to(device)
					client_num = client._number
					break
		else:
			client_num = self._host._version_check
		return client_num
	

	def force_connection(self, device, client_number, version):
		#self._host.log_message('force ' + str(device) + ' ' + str(client_number) + ' build ' + str(self._host._in_build_midi_map))
		if version == self._host._version_check:
			for client in self._client:
				if client.device == device:
					client._disconnect_client()
			self._client[client_number]._disconnect_client(True)
			self._client[client_number]._connect_to(device)
		else:
			client_number = self._host._version_check
		return client_number
	

	def set_client_enabled(self, client_num, enabled):
		self._client[client_num].set_enabled(enabled)
	

# local variables:
# tab-width: 4
