#Embedded file name: /Applications/Ableton Live 9 Beta.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/MonoDeviceComponent.py
import Live
from _Tools.re import *
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from Live8DeviceComponent import Live8DeviceComponent as DeviceComponent
from _Generic.Devices import *

class MonoDeviceComponent(DeviceComponent):
    """ Class representing a device linked to a Monomodular client, to be redirected by it from Max """

    def __init__(self, parent, bank_dict = {}, mod_types = {}, *a, **k):
        super(MonoDeviceComponent, self).__init__(*a, **k)
        self._MOD_BANK_DICT = bank_dict
        self._MOD_TYPES = mod_types
        self._type = None
        self._device_parent = None
        self._parent = parent
        self._chain = 0
        self._device_chain = 0
        self._number_params = 12
        self._params = []
        self._custom_parameter = []
        self._nodevice = NoDevice()

    def disconnect(self):
        if self._device_parent != None:
            if self._device_parent != None:
                if self._device_parent.canonical_parent != None:
                    if self._device_parent.canonical_parent.devices_has_listener(self._parent_device_changed):
                        self._device_parent.canonical_parent.remove_devices_listener(self._parent_device_changed)
        if self._device != None:
            if self._device.canonical_parent != None:
                if self._device.canonical_parent != None:
                    if self._device.canonical_parent.devices_has_listener(self._device_changed):
                        self._device.canonical_parent.remove_devices_listener(self._device_changed)
        self._type = None
        self._device_parent = None
        self._device_chain = None
        super(MonoDeviceComponent, self).disconnect()

    def disconnect_client(self):
        self.set_device(None)
        self._custom_parameter = []
        self._device_parent = None
        self._device_chain = 0
        self._set_type(None)

    def set_device_defs(self, bank_dict = {}, mod_types = {}):
        self._MOD_BANK_DICT = bank_dict
        self._MOD_TYPES = mod_types
        self.update()

    def _set_type(self, mod_device_type):
        if mod_device_type == None:
            self._device_banks = DEVICE_DICT
            self._device_best_banks = DEVICE_BOB_DICT
            self._device_bank_names = BANK_NAME_DICT
            self._set_device_parent(None)
            self.set_enabled(False)
        elif mod_device_type in self._MOD_TYPES.keys():
            self.set_enabled(True)
            self._type = mod_device_type
            self._device_banks = self._MOD_TYPES[self._type]
            self._device_best_banks = self._MOD_TYPES[self._type]
            self._device_bank_names = self._MOD_BANK_DICT
            self._set_device_parent(self._device_parent)

    def _set_device_parent(self, mod_device_parent, single = None):
        if self._device_parent != None:
            if self._device_parent.canonical_parent != None:
                if self._device_parent.canonical_parent.devices_has_listener(self._parent_device_changed):
                    self._device_parent.canonical_parent.remove_devices_listener(self._parent_device_changed)
        if isinstance(mod_device_parent, Live.Device.Device):
            if mod_device_parent.can_have_chains and single is None:
                self._device_parent = mod_device_parent
                if self._device_parent.canonical_parent != None:
                    if not self._device_parent.canonical_parent.devices_has_listener(self._parent_device_changed):
                        self._device_parent.canonical_parent.add_devices_listener(self._parent_device_changed)
                self._select_parent_chain(self._device_chain)
            else:
                self._device_parent = mod_device_parent
                self.set_device(self._device_parent, True)
        elif 'NoDevice' in self._device_banks.keys():
            self._device_parent = self._nodevice
            self._device_chain = 0
            self.set_device(self._device_parent, True)
        else:
            self._device_parent = None
            self._device_chain = 0
            self.set_device(self._device_parent, True)

    def _select_parent_chain(self, chain, force = False):
        self._device_chain = chain
        if self._device_parent != None:
            if isinstance(self._device_parent, Live.Device.Device):
                if self._device_parent.can_have_chains:
                    if len(self._device_parent.chains) > chain:
                        if len(self._device_parent.chains[chain].devices) > 0:
                            self.set_device(self._device_parent.chains[chain].devices[0], force)
                    elif 'NoDevice' in self._device_banks.keys():
                        self.set_device(self._nodevice, True)
                    else:
                        self.set_device(None)
                        if self.is_enabled():
                            for host in self._parent._active_host:
                                for control in host._parameter_controls:
                                    control.reset()

    def _parent_device_changed(self):
        self._set_device_parent(None)
        self._parent._send('lcd', 'parent', 'check')

    def _device_changed(self):
        self.set_device(None)
        self._parent._send('lcd', 'device', 'check')

    def _number_of_parameter_banks(self):
        return self.number_of_parameter_banks(self._device)

    def get_parameter_by_name(self, device, name):
        """ Find the given device's parameter that belongs to the given name """
        result = None
        for i in device.parameters:
            if i.original_name == name:
                result = i
                break

        if result == None:
            if name == 'Mod_Chain_Pan':
                if device.canonical_parent.mixer_device.panning != None:
                    result = device.canonical_parent.mixer_device.panning
            elif name == 'Mod_Chain_Vol':
                if device.canonical_parent.mixer_device.panning != None:
                    result = device.canonical_parent.mixer_device.volume
            elif match('ModDevice_', name) and self._parent.device != None:
                name = name.replace('ModDevice_', '')
                for i in self._parent.device.parameters:
                    if i.name == name:
                        result = i
                        break

            elif match('CustomParameter_', name):
                index = int(name.replace('CustomParameter_', ''))
                if len(self._custom_parameter) > index:
                    if isinstance(self._custom_parameter[index], Live.DeviceParameter.DeviceParameter):
                        result = self._custom_parameter[index]
        return result

    def _turn_on_filter(self, param):
        param.value = 1
        param.value = 0
        self.update()

    def _recheck_FF(self, device):
        if get_parameter_by_name(device, 'Filter Freq') != None:
            self.update()

    def _assign_parameters(self, host):
        if not self.is_enabled():
            raise AssertionError
            raise self._device != None or AssertionError
            if not host._parameter_controls != None:
                raise AssertionError
                if host.is_enabled():
                    for control in host._parameter_controls:
                        control.clear_send_cache()

                    self._bank_name = 'Bank ' + str(self._bank_index + 1)
                    if not (self._device.class_name in self._device_banks.keys() and self._device.class_name in self._device_best_banks.keys()):
                        raise AssertionError
                        banks = self._device_banks[self._device.class_name]
                        if '_alt_device_banks' in dir(host):
                            if self._type in host._alt_device_banks.keys():
                                if self._device.class_name in host._alt_device_banks[self._type].keys():
                                    banks = host._alt_device_banks[self._type][self._device.class_name]
                        bank = None
                        if len(banks) > self._bank_index:
                            bank = banks[self._bank_index]
                            self._bank_name[self._bank_index] = self._is_banking_enabled() and self._device.class_name in self._device_bank_names.keys() and self._device_bank_names[self._device.class_name]
                for index in range(len(host._parameter_controls)):
                    parameter = None
                    if bank != None and index in range(len(bank)):
                        parameter = self.get_parameter_by_name(self._device, bank[index])
                    if parameter != None:
                        host._parameter_controls[index].connect_to(parameter)
                    else:
                        host._parameter_controls[index].release_parameter()

            else:
                parameters = self._device_parameters_to_map(host)
                num_controls = len(host._parameter_controls)
                index = self._bank_index * num_controls
                for control in host._parameter_controls:
                    if index < len(parameters):
                        control.connect_to(parameters[index])
                    else:
                        control.release_parameter()
                    index += 1

    def _assign_params(self, *a):
        self._bank_name = self._device != None and len(self._params) is not 0 and 'ModBank ' + str(self._bank_index + 1)
        if self._device.class_name in self._device_banks.keys():
            if not self._device.class_name in self._device_best_banks.keys():
                raise AssertionError
                banks = self._device_banks[self._device.class_name]
                bank = None
                if len(banks) > self._bank_index:
                    bank = banks[self._bank_index]
                    if self._is_banking_enabled():
                        if self._device.class_name in self._device_bank_names.keys():
                            self._bank_name[self._bank_index] = self._device_bank_names[self._device.class_name]
                for index in range(len(self._params)):
                    parameter = None
                    if bank != None and index in range(len(bank)):
                        parameter = self.get_parameter_by_name(self._device, bank[index])
                    if parameter != None:
                        self._params[index]._parameter = self._connect_param(self._params[index], parameter)
                    else:
                        self._params[index]._parameter = self._connect_param(self._params[index], None)

            else:
                parameters = self._device.parameters[1:]
                num_controls = len(self._params)
                index = self._bank_index * num_controls
                for param in self._params:
                    if index < len(parameters):
                        self._params[index]._parameter = self._connect_param(self._params[index], parameters[index])
                    else:
                        self._params[index]._parameter = self._connect_param(self._params[index], None)
                    index += 1

        else:
            index = 0
            for param in self._params:
                self._params[index]._parameter = self._connect_param(self._params[index], None)
                index += 1

        for param in self._params:
            param._value_change()

    def _connect_param(self, holder, parameter):
        self._mapped_to_midi_velocity = False
        if holder._parameter != None:
            if holder._parameter.value_has_listener(holder._value_change):
                holder._parameter.remove_value_listener(holder._value_change)
        if parameter != None:
            assignment = parameter
            if str(parameter.name) == str('Track Volume'):
                if parameter.canonical_parent.canonical_parent.has_audio_output is False:
                    if len(parameter.canonical_parent.canonical_parent.devices) > 0:
                        if str(parameter.canonical_parent.canonical_parent.devices[0].class_name) == str('MidiVelocity'):
                            assignment = parameter.canonical_parent.canonical_parent.devices[0].parameters[6]
                            self._mapped_to_midi_velocity = True
            assignment.add_value_listener(holder._value_change)
            return assignment
        else:
            return

    def _on_device_name_changed(self):
        if self._device != None:
            self._parent._send('lcd', 'device_name', 'lcd_name', str(self.generate_strip_string(str(self._device.name))))
        else:
            self._parent._send('lcd', 'device_name', 'lcd_name', ' ')

    def _params_value_change(self, sender, control_name, feedback = True):
        pn = ' '
        pv = ' '
        val = 0
        if sender != None:
            pn = str(self.generate_strip_string(str(sender.name)))
            if sender.is_enabled:
                try:
                    value = str(sender)
                except:
                    value = ' '

                pv = str(self.generate_strip_string(value))
            else:
                pv = '-bound-'
            val = (sender.value - sender.min) / (sender.max - sender.min) * 127
        self._parent._send('lcd', control_name, 'lcd_name', pn)
        self._parent._send('lcd', control_name, 'lcd_value', pv)
        if feedback == True:
            self._parent._send('lcd', control_name, 'encoder_value', val)

    def generate_strip_string(self, display_string):
        NUM_CHARS_PER_DISPLAY_STRIP = 12
        if not display_string:
            return ' ' * NUM_CHARS_PER_DISPLAY_STRIP
        if len(display_string.strip()) > NUM_CHARS_PER_DISPLAY_STRIP - 1 and display_string.endswith('dB') and display_string.find('.') != -1:
            display_string = display_string[:-2]
        if len(display_string) > NUM_CHARS_PER_DISPLAY_STRIP - 1:
            for um in [' ',
             'i',
             'o',
             'u',
             'e',
             'a']:
                while len(display_string) > NUM_CHARS_PER_DISPLAY_STRIP - 1 and display_string.rfind(um, 1) != -1:
                    um_pos = display_string.rfind(um, 1)
                    display_string = display_string[:um_pos] + display_string[um_pos + 1:]

        else:
            display_string = display_string.center(NUM_CHARS_PER_DISPLAY_STRIP - 1)
        ret = u''
        for i in range(NUM_CHARS_PER_DISPLAY_STRIP - 1):
            if ord(display_string[i]) > 127 or ord(display_string[i]) < 0:
                ret += ' '
            else:
                ret += display_string[i]

        ret += ' '
        ret = ret.replace(' ', '_')
        raise len(ret) == NUM_CHARS_PER_DISPLAY_STRIP or AssertionError
        return ret

    def set_device(self, device, force = False):
        if not (device == None or isinstance(device, Live.Device.Device) or isinstance(device, NoDevice)):
            raise AssertionError
            if self._device != None:
                if self._device.canonical_parent != None:
                    if self._device.canonical_parent.devices_has_listener(self._device_changed):
                        self._device.canonical_parent.remove_devices_listener(self._device_changed)
            if not self._locked_to_device and device != self._device or force == True:
                if self._device != None:
                    self._device.remove_name_listener(self._on_device_name_changed)
                    self._device.remove_parameters_listener(self._on_parameters_changed)
                    parameter = self._on_off_parameter()
                    if parameter != None:
                        parameter.remove_value_listener(self._on_on_off_changed)
                    for host in self._parent._active_host:
                        if host._parameter_controls != None:
                            for control in host._parameter_controls:
                                control.release_parameter()

                self._device = device
                if self._device != None:
                    if self._device.canonical_parent != None:
                        if not self._device.canonical_parent.devices_has_listener(self._device_changed):
                            self._device.canonical_parent.add_devices_listener(self._device_changed)
                    self._bank_index = 0
                    self._device.add_name_listener(self._on_device_name_changed)
                    self._device.add_parameters_listener(self._on_parameters_changed)
                    parameter = self._on_off_parameter()
                    parameter != None and parameter.add_value_listener(self._on_on_off_changed)
            for key in self._device_bank_registry.keys():
                if key == self._device:
                    self._bank_index = self._device_bank_registry.get(key, 0)
                    del self._device_bank_registry[key]
                    break

            self._bank_name = '<No Bank>'
            self._on_device_name_changed()
            self.update()

    def _post(self, msg):
        pass

    def update(self):
        if self.is_enabled():
            if self._device != None:
                self._device_bank_registry[self._device] = self._bank_index
                for host in self._parent._active_host:
                    if host.is_enabled() and len(host._parameter_controls) > 0:
                        old_bank_name = self._bank_name
                        self._assign_parameters(host)
                        if self._bank_name != old_bank_name:
                            self._show_msg_callback(self._device.name + ' Bank: ' + self._bank_name)

            else:
                for host in self._parent._active_host:
                    if host._parameter_controls != None:
                        for control in host._parameter_controls:
                            control.release_parameter()

        self._update_params()
        self._assign_params()
        if self.is_enabled():
            for host in self._parent._active_host:
                if host.is_enabled():
                    if len(host._parameter_controls) > 0:
                        host._script.request_rebuild_midi_map()
                    if hasattr(host, '_device_component'):
                        if host._device_component != None:
                            self._parent._host.schedule_message(1, host._device_component.update)

    def _update_params(self):
        count = self._number_params
        used_host = None
        if self._number_params > 0:
            count = self._number_params
        else:
            for host in self._parent._host._hosts:
                if len(host._parameter_controls) > count:
                    count = len(host._parameter_controls)
                    used_host = host

        if count != len(self._params):
            if self._number_params > 0:
                self._params = [ ParamHolder(self, None, index) for index in range(self._number_params) ]
            else:
                self._params = used_host != None and [ ParamHolder(self, None, index) for index in range(len(used_host._parameter_controls)) ]
                for param in self._params:
                    self._connect_param(param, None)

                self._params = []

    def _device_parameters_to_map(self):
        raise self.is_enabled() or AssertionError
        raise self._device != None or AssertionError
        raise host._parameter_controls != None or AssertionError
        return self._device.parameters[1:]

    def set_number_params(self, number, args2 = None, args3 = None, args4 = None):
        self._number_params = number
        self.update()

    def set_number_custom(self, number, args2 = None, args3 = None, args4 = None):
        self._custom_parameter = [ None for index in range(number) ]

    def set_custom_parameter(self, number, parameter, args3 = None, args4 = None):
        if number < len(self._custom_parameter):
            if isinstance(parameter, Live.DeviceParameter.DeviceParameter) or parameter is None:
                self._custom_parameter[number] = parameter
                self.update()

    def set_mod_device_type(self, mod_device_type, args2 = None, args3 = None, args4 = None):
        for host in self._parent._active_host:
            host.on_enabled_changed()

        self._set_type(mod_device_type)

    def set_mod_device(self, mod_device, args2 = None, args3 = None, args4 = None):
        self.set_device(mod_device, True)
        for host in self._parent._active_host:
            host.update()

    def set_mod_device_parent(self, mod_device_parent, single = None, args3 = None, args4 = None):
        self._set_device_parent(mod_device_parent, single)
        for host in self._parent._active_host:
            host.update()

    def set_mod_device_chain(self, chain, args2 = None, args3 = None, args4 = None):
        self._select_parent_chain(chain, True)
        for host in self._parent._active_host:
            host.update()

    def set_parameter_value(self, num, val, args2 = None, args3 = None, args4 = None):
        if self._device != None:
            if num < len(self._params):
                self._params[num]._change_value(val)

    def set_custom_parameter_value(self, num, value, args2 = None, args3 = None, args4 = None):
        if num < len(self._custom_parameter):
            parameter = self._custom_parameter[num]
            if parameter != None:
                newval = float(float(float(value) / 127) * float(parameter.max - parameter.min)) + parameter.min
                parameter.value = newval

    def set_device_bank(self, bank_index, args2 = None, args3 = None, args4 = None):
        if self.is_enabled():
            if self._device != None:
                if self._number_of_parameter_banks() > bank_index:
                    self._bank_name = ''
                    self._bank_index = bank_index
                    self.update()

    def number_of_parameter_banks(self, device):
        """ Determine the amount of parameter banks the given device has """
        result = 0
        if device != None:
            result = 1
            if device.class_name in self._device_banks.keys():
                device_bank = self._device_banks[device.class_name]
                result = len(device_bank)
            elif len(self._params > 0):
                param_count = len(list(device.parameters))
                result = param_count / len(self._params)
                if not param_count % len(self._params) == 0:
                    result += 1
        return result

    def on_enabled_changed(self):
        self.update()


class ParamHolder(object):
    """ Simple class to hold the owner of a Device.parameter and forward its value when receiving updates from Live, or update its value from a mod """

    def __init__(self, parent, control, index):
        self._control = control
        self._control_name = 'Encoder_' + str(index)
        self._parent = parent
        self._parameter = None
        self._feedback = True

    def _value_change(self):
        control_name = self._control_name
        self._parent._params_value_change(self._parameter, control_name, self._feedback)
        self._feedback = True

    def _change_value(self, value):
        if self._parameter != None:
            if self._parameter.is_enabled:
                self._feedback = False
                newval = float(float(float(value) / 127) * float(self._parameter.max - self._parameter.min)) + self._parameter.min
                self._parameter.value = newval


class NoDevice(object):
    """Dummy Device with no parameters and custom class_name that is used when no device is selected, but parameter assignment is still necessary"""

    def __init__(self):
        self.class_name = 'NoDevice'
        self.parameters = []
        self.canonical_parent = None
        self.can_have_chains = False
        self.name = 'NoDevice'

    def add_name_listener(self, callback = None):
        pass

    def remove_name_listener(self, callback = None):
        pass

    def name_has_listener(self, callback = None):
        return False

    def add_parameters_listener(self, callback = None):
        pass

    def remove_parameters_listener(self, callback = None):
        pass

    def parameters_has_listener(self, callback = None):
        return False

    def store_chosen_bank(self, callback = None):
        pass