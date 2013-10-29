#Embedded file name: /Applications/Ableton Live 9 Beta.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/Mod.py
from __future__ import with_statement
import Live
import contextlib
from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ControlElement import ControlElement
from _Framework.CompoundComponent import CompoundComponent
from _Framework.Task import *
from _Framework.SubjectSlot import SubjectEvent
from _Framework.Signal import Signal
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.Util import in_range
from _Framework.Debug import debug_print
from _Framework.Disconnectable import Disconnectable
from _Framework.InputControlElement import InputSignal
from _Mono_Framework.MonoParamComponent import MonoParamComponent
from _Mono_Framework.ModDevices import *

def hascontrol(handler, control):
    return control in handler._controls.keys()


def unpack_values(values):
    values = [ int(i) for i in str(values).split('^') ]
    if len(values) < 2:
        return values[0]
    else:
        return values


def unpack_items(values):
    to_convert = str(values).split('^')
    converted = []
    for i in to_convert:
        try:
            converted.append(int(i))
        except:
            converted.append(str(i))

    return converted


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


class ElementTranslation(object):

    def __init__(self, name, script):
        self._script = script
        self._name = name
        self._targets = {}
        self._last_received = None

    def set_enabled(self, name, enabled):
        try:
            self._targets[name]['Enabled'] = enabled > 0
            if enabled and self._last_received is not None:
                target = self._targets[name]
                value_list = [ i for i in target['Arguments'] ] + [ j for j in self._last_received ]
                try:
                    getattr(target['Target'], method)(*value_list)
                except:
                    pass

        except:
            pass

    def is_enabled(self, name):
        try:
            return self._targets[name]['Enabled']
        except:
            return False

    def target(self, name):
        try:
            return self._targets[name]['Target']
        except:
            return None

    def add_target(self, name, target, *args, **k):
        self._targets[name] = {'Target': target,
         'Arguments': args,
         'Enabled': True}

    def receive(self, method, *values):
        for entry in self._targets.keys():
            target = self._targets[entry]
            if target['Enabled'] == True:
                value_list = [ i for i in target['Arguments'] ] + [ j for j in values ]
                try:
                    getattr(target['Target'], method)(*value_list)
                except:
                    pass

        self._last_received = values


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
        self.update_element()


class Grid(object):

    def __init__(self, active_handlers, name, width, height):
        self._active_handlers = active_handlers
        self._name = name
        self._width = width
        self._height = height
        self._cell = [ [ StoredElement(active_handlers, _name=self._name + '_' + str(x) + '_' + str(y), _x=x, _y=y) for y in range(height) ] for x in range(width) ]

    def restore(self):
        for column in self._cell:
            for element in column:
                self.update_element(element)

    def update_element(self, element):
        for handler in self._active_handlers():
            handler.receive_address(self._name, element._x, element._y, element._value)

    def value(self, x, y, value, *a):
        element = self._cell[x][y]
        element._value = value
        self.update_element(element)

    def row(self, row, value, *a):
        for column in range(len(self._cell)):
            self.value(column, row, value)

    def column(self, column, value, *a):
        for row in range(len(self._cell[column])):
            self.value(column, row, value)

    def all(self, value, *a):
        for column in range(len(self._cell)):
            for row in range(len(self._cell[column])):
                self.value(column, row, value)

    def batch_row(self, row, *values):
        width = len(self._cell)
        for index in range(len(values)):
            self.value(index % width, row + int(index / width), values[index])

    def batch_column(self, column, *values):
        for row in range(len(self._cell[column])):
            if values[row]:
                self.value(column, row, values[row])

    def batch_all(self, *values):
        for column in range(len(self._cell)):
            for row in range(len(self._cell[column])):
                if values[column + row * self._width]:
                    self.value(column, row, values[column + row * len(self._cell)])

    def mask(self, x, y, value, *a):
        element = self._cell[x][y]
        if value > -1:
            for handler in self._active_handlers():
                handler.receive_address(self._name, element._x, element._y, value)

        else:
            self.update_element(element)

    def mask_row(self, row, value, *a):
        for column in range(len(self._cell[row])):
            self.mask(column, row, value)

    def mask_column(self, column, value, *a):
        for row in range(len(self._cell)):
            self.mask(column, row, value)

    def mask_all(self, value, *a):
        for column in range(len(self._cell)):
            for row in range(len(self._cell[column])):
                self.mask(column, row, value)

    def batch_mask_row(self, row, *values):
        width = len(self._cell)
        for index in range(len(values)):
            self.mask(index % width, row + int(index / width), values[index])

    def batch_mask_column(self, column, *values):
        for row in range(len(self._cell[column])):
            if values[row]:
                self.mask(column, row, values[row])

    def batch_mask_all(self, *values):
        for column in range(len(self._cell)):
            for row in range(len(self._cell[column])):
                if values[column + row * len(self._cell)]:
                    self.mask(column, row, values[column + row * self._width])


class Array(object):

    def __init__(self, active_handlers, name, size):
        self._active_handlers = active_handlers
        self._name = name
        self._cell = [ StoredElement(self._name + '_' + str(num), _num=num) for num in range(size) ]

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
        self._device_component = None
        self._color_maps = [ range(128) for index in range(17) ]
        self._colors = self._color_maps[0]
        self._is_enabled = False
        self._is_connected = False
        self._receive_methods = {}
        self.x_offset = 0
        self.y_offset = 0
        self.navbox_selected = 3
        self.navbox_unselected = 5
        self.modrouter.register_handler(self)

    def disconnect(self, *a, **k):
        self._active_mod = None
        super(ModHandler, self).disconnect(*a, **k)

    def update(self, *a, **k):
        if self._active_mod:
            self._active_mod.restore()

    def select_mod(self, mod):
        self._active_mod = mod
        for mod in self.modrouter._mods:
            if self in mod._active_handlers:
                mod._active_handlers.remove(self)

        if self._active_mod is not None:
            self._active_mod._active_handlers.append(self)
            self._active_mod.restore()
        self.update()

    def receive_address(self, address_name, *a, **k):
        if address_name in self._receive_methods.keys():
            self._receive_methods[address_name](*a, **k)

    def _register_addresses(self, client):
        pass

    def _receive_grid(self, address):
        pass

    def set_device_component(self, device_component):
        self._device_component = device_component

    def update_device(self):
        if self._device_component is not None:
            try:
                self._device_component.update()
            except:
                pass

    def active_mod(self, *a, **k):
        return self._active_mod

    def set_offset(self, x, y):
        self.x_offset = x
        self.y_offset = y
        if self._active_mod and self._active_mod.legacy:
            self._active_mod.send('offset', self.x_offset, self.y_offset)
            self._display_nav_box()

    def _display_nav_box(self):
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
        self._addresses = {'grid': Grid(self.active_handlers, 'grid', 16, 16)}
        self._translations = {}
        self._translation_groups = {}
        self.legacy = False
        for handler in self._parent._handlers:
            handler._register_addresses(self)

        self._param_component = MonoParamComponent(self, MOD_BANK_DICT, MOD_TYPES)

    def addresses(self):
        return self._addresses

    def translations(self):
        return self._translations

    def active_handlers(self):
        return self._active_handlers

    def receive(self, address_name, method = 'value', values = 0, *a, **k):
        if address_name in self._addresses.keys():
            address = self._addresses[address_name]
            value_list = unpack_items(values)
            try:
                getattr(address, method)(*value_list)
            except:
                self.log_message('receive method exception')

    def distribute(self, function_name, values = 0, *a, **k):
        if hasattr(self, function_name):
            value_list = unpack_items(values)
            try:
                getattr(self, function_name)(*value_list)
            except:
                self.log_message('distribute method exception')

    def receive_translation(self, translation_name, method = 'value', *values):
        try:
            self._translations[translation_name].receive(method, *values)
        except:
            self.log_message('receive_translation method exception')

    def send(self, control_name, *a):
        self.notify_value(control_name, *a)

    def is_active(self):
        return len(self._active_host) > 0

    def set_enabled(self, val):
        self._enabled = val != 0

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

    def add_translation(self, name, target, group = None, *args, **k):
        if target in self._addresses.keys():
            if name not in self._translations.keys():
                self._translations[name] = ElementTranslation(name, self)
            self._translations[name].add_target(target, self._addresses[target], *args)
            if group is not None:
                if group not in self._translation_groups.keys():
                    self._translation_groups[group] = []
                self._translation_groups[group].append([name, target])

    def enable_translation(self, name, target, enabled = True):
        if name in self._translations.keys():
            self._translations[name].set_enabled(target, enabled)

    def enable_translation_group(self, group, enabled = True):
        if group in self._translation_groups.keys():
            for pair in self._translation_groups[group]:
                self.enable_translation(pair[0], pair[1], enabled)

    def receive_device(self, command, *args):
        if command in dir(self._param_component):
            getattr(self._param_component, command)(*args)

    def update_device(self):
        for handler in self.active_handlers():
            handler.update_device()

    def set_legacy(self, value):
        self.legacy = value > 0


class ModRouter(CompoundComponent):

    def __init__(self, *a, **k):
        super(ModRouter, self).__init__(*a, **k)
        self._host = None
        self._handlers = []
        self._mods = []

    def set_host(self, host):
        raise isinstance(host, ControlSurface) or AssertionError
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
        return [ mod.device for mod in self._mods ]

    def get_mod(self, device):
        mod = None
        for mod_device in self._mods:
            if mod_device.device == device:
                mod = mod_device

        return mod

    def add_mod(self, device):
        if device not in self.devices():
            with self._host.component_guard():
                self._mods.append(ModClient(self, device, 'modClient' + str(len(self._mods))))
        ret = self.get_mod(device)
        return ret

    def timer(self, *a, **k):
        pass

    def update(self):
        pass

    def disconnect(self):
        super(ModRouter, self).disconnect()
        del __builtins__['monomodular']