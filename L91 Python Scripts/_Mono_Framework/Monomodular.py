#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/Monomodular.py
from __future__ import with_statement
import Live
import time
import math
import sys
import Live.String
from _Tools import types
from _Framework.ButtonElement import ButtonElement
from _Framework.ButtonMatrixElement import ButtonMatrixElement
from _Framework.ChannelStripComponent import ChannelStripComponent
from _Framework.CompoundComponent import CompoundComponent
from _Framework.ControlElement import ControlElement
from _Framework.ControlSurface import ControlSurface
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.DeviceComponent import DeviceComponent
from _Framework.EncoderElement import EncoderElement
from _Framework.InputControlElement import *
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.NotifyingControlElement import NotifyingControlElement
from _Framework.TransportComponent import TransportComponent
from SwitchboardElement import SwitchboardElement
from MonoClient import MonoClient
from LiveUtils import *
from ModDevices import *
from MonoLinkClient import MonoLinkClient
from MonoLink_Map import MONOLINK_ENABLE

class Monomodular(ControlSurface):
    __module__ = __name__
    __doc__ = ' Monomodular control script '

    def __init__(self, *a, **k):
        super(Monomodular, self).__init__(*a, **k)
        with self.component_guard():
            self._version_check = 'b995'
            self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Monomodular ' + str(self._version_check) + ' log opened >>>>>>>>>>>>>>>>>>>>>>>>>')
            self._hosts = []
            self._client = [ None for index in range(16) ]
            self._setup_monomod()
            self._setup_switchboard()
            self._monolink_is_enabled = self._setup_monolink(MONOLINK_ENABLE)
            self._setup_device()

    def _setup_monomod(self):
        for index in range(16):
            self._client[index] = MonoClient(self, index)
            self._client[index].name = 'Client_' + str(index)
            self._client[index]._device_component.set_device_defs(MOD_BANK_DICT, MOD_TYPES)

        self._active_client = self._client[0]
        self._active_client._is_active = True

    def _setup_switchboard(self):
        self._switchboard = SwitchboardElement(self, self._client)
        self._switchboard.name = 'Switchboard'

    def _setup_monolink(self, enabled = False):
        if enabled:
            self._client.append(MonoLinkClient(self, 16))
            self._client[16].name = 'MonoLinkClient'
        return enabled

    def _setup_device(self):
        self._device = DeviceComponent()
        self._device.name = 'Device_Component'
        self.set_device_component(self._device)

    def update_display(self):
        super(Monomodular, self).update_display()
        if self._monolink_is_enabled:
            self._client[16].call_network_functions()

    def disconnect(self):
        """clean things up on disconnect"""
        self.log_message('<<<<<<<<<<<<<<<<<<<<<<<<< Monomodular ' + str(self._version_check) + ' log closed >>>>>>>>>>>>>>>>>>>>>>>>>')
        super(Monomodular, self).disconnect()
        self._hosts = []

    def connect_script_instances(self, instanciated_scripts):
        hosts = []
        for s in instanciated_scripts:
            if '_monomod_version' in dir(s):
                if s._monomod_version == self._version_check:
                    for host in s.hosts:
                        hosts.append(host)
                        host.connect_to_clients(self)

                    self.log_message('found monomod version ' + str(s._monomod_version) + ' in script ' + str(s._host_name))
                else:
                    self.log_message('version mismatch: Monomod version ' + str(self._version_check) + ' vs. Host version ' + str(s._monomod_version))

        self._hosts = hosts

    def display_message(self, message):
        self.show_message(message)

    def send_midi(self, Type, num, val):
        Type = min(192, max(Type, 144))
        num = min(127, max(num, 0))
        val = min(127, max(val, 0))
        self.log_message('send_midi' + str(Type) + str(num) + str(val))
        self._send_midi(tuple([Type, num, val]))