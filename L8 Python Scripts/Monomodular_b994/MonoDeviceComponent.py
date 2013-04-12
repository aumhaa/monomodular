# --== Decompile ==--

import Live
from _Tools.re import *
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.DeviceComponent import DeviceComponent
from _Generic.Devices import *
from ModDevices import *



class MonoDeviceComponent(DeviceComponent):
	
	__doc__ = ' Class representing a device linked to a Monomodular client, to be redirected by it from Max '
	def __init__(self, parent, host, cs):
		DeviceComponent.__init__(self)
		self._type = None
		self._device_parent = None
		self._host = host
		self._parent = parent
		self._chain = 0
		self._cs = cs
		self._device_chain = 0
		self._params = []
		self._cntrl_offset = 0
	


	def disconnect(self):
		self._type = None
		self._device_parent = None
		self._device_chain = None
		DeviceComponent.disconnect(self)
	

	def disconnect_client(self):
		self.set_device(None)
		self._device_parent = None
		self._device_chain = 0
		self._set_type(None)

	

	def _set_type(self, mod_device_type):
		if mod_device_type in MOD_TYPES.keys():
			self.set_enabled(True)
			#self._cs.log_message('set_type ' + str(mod_device_type) + ' ' + str(self.is_enabled()))
			self._type = mod_device_type
			self._cntrl_offset = MOD_CNTRL_OFFSETS[self._type]
			self._device_banks = MOD_TYPES[self._type]
			self._device_best_banks = MOD_TYPES[self._type]
			self._device_bank_names = MOD_BANK_DICT[self._type]
			if(self._device_parent != None):
				self._select_parent_chain(self._device_chain, True)
		elif mod_device_type == None:
			self._cntrl_offset = 0
			self._device_banks = DEVICE_DICT
			self._device_best_banks = DEVICE_BOB_DICT
			self._device_bank_names = BANK_NAME_DICT
			self.set_device(None)
			self.set_enabled(False)
	

	def _set_device_parent(self, mod_device_parent):
		#self._cs.log_message('_set_device_parent ' + str(mod_device_parent))
		if isinstance(mod_device_parent, Live.Device.Device):
			if mod_device_parent.can_have_chains:
				self._device_parent = mod_device_parent
			else:
				self._device_parent = None
				self.set_device(mod_device_parent, True)
			#self._select_parent_chain(self._device_chain)
	

	def _select_parent_chain(self, chain, force = False):
		#self._cs.log_message('_select_parent_chain ' + str(chain) + ' ' + str(self.is_enabled()))
		self._chain = chain
		if self._device_parent != None:
			if isinstance(self._device_parent, Live.Device.Device):
				if self._device_parent.can_have_chains:
					if len(self._device_parent.chains) > chain:
						if len(self._device_parent.chains[chain].devices) > 0:
							self.set_device(self._device_parent.chains[chain].devices[0], force)
							#self._cs.log_message('_select_parent_chain successful' + str(self._device_parent.chains[chain].devices[0].name))
					elif 'NoDevice' in self._device_banks.keys():
						self.set_device(self._device)
					else:
						self.set_device(None)
						if self.is_enabled():
							for control in self._parameter_controls:
								control.reset()
	

	def _number_of_parameter_banks(self):
		return self.number_of_parameter_banks(self._device) #added
	

	def get_parameter_by_name(self, device, name):
		""" Find the given device's parameter that belongs to the given name """
		#self._cs.log_message('get param ' + str(name))
		result = None
		for i in device.parameters:
			if (i.original_name == name):
				result = i
				break
		if result == None:
			if name == 'Mod_Chain_Pan':
				if device.canonical_parent.mixer_device.panning != None:
					result = device.canonical_parent.mixer_device.panning
			elif name == 'Mod_Chain_Vol':
				if device.canonical_parent.mixer_device.panning != None:
					result = device.canonical_parent.mixer_device.volume
			elif(match('ModDevice_', name) and self._parent.device != None):
				name = name.replace('ModDevice_', '')
				for i in self._parent.device.parameters:
					if (i.name == name):
						result = i
						break	
			elif name == 'Filter Freq':
				for i in device.parameters:
					if i.original_name == 'F On':
						if i.value < 1:
							self._cs.schedule_message(1, self._turn_on_filter, i)
							break	
		return result
	

	def _turn_on_filter(self, param):
		param.value = 1
		param.value = 0
		self.update()
	

	def number_of_parameter_banks(self, device):
		""" Determine the amount of parameter banks the given device has """
		result = 0
		if (device != None):
			result = 1
			if (device.class_name in self._device_banks.keys()):
				device_bank = self._device_banks[device.class_name]
				result = len(device_bank)
			else:
				param_count = len(list(device.parameters))
				result = (param_count / len(self._parameter_controls))
				if (not ((param_count % len(self._parameter_controls)) == 0)):
					result += 1
		return result
	

	def set_parameter_controls(self, controls):
		self._params = [ParamHolder(self, controls[index]) for index in range(len(controls))]
		DeviceComponent.set_parameter_controls(self, controls)
	

	def _assign_parameters(self):
		#self._cs.log_message('assign_parameters')
		assert self.is_enabled()
		assert (self._device != None)
		assert (self._parameter_controls != None)
		if(self._host.is_enabled()):
			for control in self._parameter_controls:
				control.clear_send_cache()
			self._bank_name = ('Bank ' + str(self._bank_index + 1)) #added
			if (self._device.class_name in self._device_banks.keys()): #modified
				assert (self._device.class_name in self._device_best_banks.keys())
				banks = self._device_banks[self._device.class_name]
				bank = None
				#if (not self._is_banking_enabled()):
				#	 banks = self._device_best_banks[self._device.class_name]
				#	 self._bank_name = 'Best of Parameters' #added
				if (len(banks) > self._bank_index):
					bank = banks[self._bank_index]
					if self._is_banking_enabled(): #added
						if self._device.class_name in self._device_bank_names.keys(): #added
							self._bank_name[self._bank_index] = self._device_bank_names[self._device.class_name] #added *recheck
				#assert (bank == None)	# or (len(bank) >= len(self._parameter_controls)))
				for index in range(len(self._parameter_controls)):
					parameter = None
					if (bank != None) and (index in range(len(bank))):
						parameter = self.get_parameter_by_name(self._device, bank[index])
					if (parameter != None):
						self._parameter_controls[index].connect_to(parameter)
					else:
						self._parameter_controls[index].release_parameter()
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
	

	def _assign_params(self):
		assert (self._parameter_controls != None)
		if self._device != None:
			self._bank_name = ('Bank ' + str(self._bank_index + 1)) #added
			if (self._device.class_name in self._device_banks.keys()): #modified
				assert (self._device.class_name in self._device_best_banks.keys())
				banks = self._device_banks[self._device.class_name]
				bank = None
				if (len(banks) > self._bank_index):
					bank = banks[self._bank_index]
					if self._is_banking_enabled(): #added
						if self._device.class_name in self._device_bank_names.keys(): #added
							self._bank_name[self._bank_index] = self._device_bank_names[self._device.class_name] #added *recheck
				for index in range(len(self._parameter_controls)):
					parameter = None
					if (bank != None) and (index in range(len(bank))):
						parameter = self.get_parameter_by_name(self._device, bank[index])
					if (parameter != None):
						self._params[index]._parameter=self._connect_param(self._params[index], parameter)
					else:
						self._params[index]._parameter=self._connect_param(self._params[index], None)
			else:
				parameters = self._device_parameters_to_map()
				num_controls = len(self._parameter_controls)
				index = (self._bank_index * num_controls)
				for control in self._parameter_controls:
					if (index < len(parameters)):
						self._params[index]._parameter=self._connect_param(self._params[index], parameters[index])
					else:
						self._params[index]._parameter=self._connect_param(self._params[index], None)
					index += 1
		else:
			index = 0
			for control in self._parameter_controls:
				self._params[index]._parameter = self._connect_param(self._params[index], None)
				index += 1
		for param in self._params:
			self._params_value_change(param._parameter, param._control)
	

	def _connect_param(self, holder, parameter):
		#self._cs.log_message('connecting ') # + str(holder._parameter) + ' ' + str(parameter))
		self._mapped_to_midi_velocity = False
		if (holder._parameter!= None):
			if holder._parameter.value_has_listener(holder._value_change):
				holder._parameter.remove_value_listener(holder._value_change)
				#self._cs.log_message('removing ' + str(holder._parameter.name))
		if parameter != None:
			assignment = parameter
			if(str(parameter.name) == str('Track Volume')):		#checks to see if parameter is track volume
				if(parameter.canonical_parent.canonical_parent.has_audio_output is False):		#checks to see if track has audio output
					if(len(parameter.canonical_parent.canonical_parent.devices) > 0):
						if(str(parameter.canonical_parent.canonical_parent.devices[0].class_name)==str('MidiVelocity')):	#if not, looks for velicty as first plugin
							assignment = parameter.canonical_parent.canonical_parent.devices[0].parameters[6]				#if found, assigns fader to its 'outhi' parameter
							self._mapped_to_midi_velocity = True
			assignment.add_value_listener(holder._value_change)
			#self._cs.log_message('adding ' + str(assignment.name))
			return assignment
		else:
			
			return None
	

	def _on_device_name_changed(self):
		if (self._device != None):
			self._parent._send('lcd', 'device_name', 'lcd_name', str(self.generate_strip_string(str(self._device.name))))
		else:
			self._parent._send('lcd', 'device_name', 'lcd_name', ' ')
	

	def _params_value_change(self, sender, control):
		#self._cs.log_message('params change ' + str(sender))
		pn = ' '
		pv = ' '
		val = 0
		if(sender != None):
			pn = str(self.generate_strip_string(str(sender.name)))
			if sender.is_enabled:
				try: 
					value = str(sender)
				except:
					value = ' '
				pv = str(self.generate_strip_string(value))
			else:
				pv = '-bound-'
			val = ((sender.value - sender.min) / (sender.max - sender.min))  * 127
		self._parent._send('lcd', control.name, 'lcd_name', pn)
		self._parent._send('lcd', control.name, 'lcd_value', pv)
		self._parent._send('lcd', control.name, 'encoder_value', val)
	

	def generate_strip_string(self, display_string):
		NUM_CHARS_PER_DISPLAY_STRIP = 12
		if (not display_string):
			return (' ' * NUM_CHARS_PER_DISPLAY_STRIP)
		if ((len(display_string.strip()) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.endswith('dB') and (display_string.find('.') != -1))):
			display_string = display_string[:-2]
		if (len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			for um in [' ',
			 'i',
			 'o',
			 'u',
			 'e',
			 'a']:
				while ((len(display_string) > (NUM_CHARS_PER_DISPLAY_STRIP - 1)) and (display_string.rfind(um, 1) != -1)):
					um_pos = display_string.rfind(um, 1)
					display_string = (display_string[:um_pos] + display_string[(um_pos + 1):])
		else:
			display_string = display_string.center((NUM_CHARS_PER_DISPLAY_STRIP - 1))
		ret = u''
		for i in range((NUM_CHARS_PER_DISPLAY_STRIP - 1)):
			if ((ord(display_string[i]) > 127) or (ord(display_string[i]) < 0)):
				ret += ' '
			else:
				ret += display_string[i]

		ret += ' '
		ret = ret.replace(' ', '_')
		assert (len(ret) == NUM_CHARS_PER_DISPLAY_STRIP)
		return ret
	

	def set_device(self, device, force = False):
		assert ((device == None) or isinstance(device, Live.Device.Device))
		if ((not self._locked_to_device) and (device != self._device)) or force==True:
			if (self._device != None):
				self._device.remove_name_listener(self._on_device_name_changed)
				self._device.remove_parameters_listener(self._on_parameters_changed)
				parameter = self._on_off_parameter()
				if (parameter != None):
					parameter.remove_value_listener(self._on_on_off_changed)
				if (self._parameter_controls != None):
					for control in self._parameter_controls:
						control.release_parameter()
			self._device = device
			if (self._device != None):
				self._bank_index = 0
				self._device.add_name_listener(self._on_device_name_changed)
				self._device.add_parameters_listener(self._on_parameters_changed)
				parameter = self._on_off_parameter()
				if (parameter != None):
					parameter.add_value_listener(self._on_on_off_changed)
			for key in self._device_bank_registry.keys():
				if (key == self._device):
					self._bank_index = self._device_bank_registry.get(key, 0)
					del self._device_bank_registry[key]
					break
			self._bank_name = '<No Bank>' #added
			self._on_device_name_changed()
			self.update() 
	

	def update(self):
		DeviceComponent.update(self)
		if (self._parameter_controls != None):
			self._assign_params()
		if self.is_enabled():
			self._cs.request_rebuild_midi_map()
	

	def set_mod_device_type(self, mod_device_type, args2=None, args3=None):
		#self._cs.log_message('set type ' + str(mod_device_type))
		for host in self._parent._active_host:
			host.on_enabled_changed()
		self._cs.schedule_message(5, self._set_type, mod_device_type)
	

	def set_mod_device_parent(self, mod_device_parent, args2=None, args3=None):
		#self._cs.log_message('set parent ' + str(mod_device_parent))
		self._set_device_parent(mod_device_parent)
		for host in self._parent._active_host:
			host.update()
	

	def set_mod_device_chain(self, chain, args2=None, args3=None):
		#self._cs.log_message('set_chain ' + str(chain))
		self._select_parent_chain(chain)
		for host in self._parent._active_host:
			host.update()
	

	def set_parameter_value(self, num, val, args3 = None):
		#self._cs.log_message('set_pval ' + str(num) + ' ' + str(val))
		#if self._device_component.is_enabled():
		#	self._device_component._parameter_controls[num].set_value(val)
		if self._device != None:
			if num < len(self._params):
				self._params[num]._change_value(val)
	

	def set_device_bank(self, bank_index, args2=None, args3=None):
		#self._cs.log_message('set bank ' + str(bank_index))
		if self.is_enabled():
			if (self._device != None):
				if (self._number_of_parameter_banks() > bank_index):
					self._bank_name = ''
					self._bank_index = bank_index
					self.update()
	
 
	def on_enabled_changed(self):
		self.update()
	

 

class ParamHolder(object):
	
	__doc__ = ' Simple class to hold the owner of a Device.parameter and forward its value when receiving updates from Live, or update its value from a mod '
	def __init__(self, parent, control):
		self._control = control
		self._parent = parent
		self._parameter = None	


	def _value_change(self):
		self._parent._params_value_change(self._parameter, self._control)
	

	def _change_value(self, value):
		if(self._parameter != None):
			if(self._parameter.is_enabled):
				newval = float(float(float(value)/127) * float(self._parameter.max - self._parameter.min)) + self._parameter.min
				#self._parent._cs.log_message('newval ' + str(newval))
				self._parameter.value = newval
	
	