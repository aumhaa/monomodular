# --== Decompile ==--

import Live
from _Generic.Devices import *
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.DeviceComponent import DeviceComponent
	
class CodecDeviceComponent(DeviceComponent):
	
	__doc__ = ' Class representing a device in Live '
	def __init__(self, script):
		DeviceComponent.__init__(self)
		self._script = script

#	def on_selected_track_changed(self):
#		self._script._update_selected_device()

	def _assign_parameters(self):
		assert self.is_enabled()
		assert (self._device != None)
		assert (self._parameter_controls != None)
		self._bank_name = ('Bank ' + str(self._bank_index + 1)) #added
		if (self._device.class_name in self._device_banks.keys()): #modified
			assert (self._device.class_name in self._device_best_banks.keys())
			banks = self._device_banks[self._device.class_name]
			for row in range(4):
				bank = None
				#if (not self._is_banking_enabled()):
				#	banks = self._device_best_banks[self._device.class_name]
				#	self._bank_name = 'Best of Parameters' #added
				if (len(banks) > row):
					bank = banks[row]
					if self._is_banking_enabled(): #added
						if self._device.class_name in self._device_bank_names.keys(): #added
							self._bank_name[row] = self._device_bank_names[self._device.class_name] #added *recheck
				#assert ((bank == None) or (len(bank) >= len(self._parameter_controls)))
				#self._script.log_message('device bank' + str(self._bank_name))
				for index in range(8):
					parameter = None
					if (bank != None):
						parameter = get_parameter_by_name(self._device, bank[index])
					if (parameter != None):
						self._parameter_controls[index + (row*8)].connect_to(parameter)
					else:
						self._parameter_controls[index  + (row*8)].release_parameter()
						self._parameter_controls[index + (row*8)].send_value(0, True);
		else:
			parameters = self._device_parameters_to_map()
			num_controls = len(self._parameter_controls)
			index = (self._bank_index * num_controls)
			for control in self._parameter_controls:
				if (index < len(parameters)):
					control.connect_to(parameters[index])
				else:
					control.release_parameter()
				index += 1