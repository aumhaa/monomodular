#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/_Mono_Framework/ResetSendsComponent.py
import Live
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ButtonElement import ButtonElement
from _Mono_Framework.MonoButtonElement import MonoButtonElement

class ResetSendsComponent(ControlSurfaceComponent):
    """ Special Component to reset all track sends to zero for the first four returns """
    __module__ = __name__

    def __init__(self, script, *a, **k):
        super(ResetSendsComponent, self).__init__(*a, **k)
        self._script = script
        self._buttons = [None,
         None,
         None,
         None]

    def disconnect(self):
        if self._buttons != None:
            for button in self._buttons:
                if button != None:
                    button.remove_value_listener(self.reset_send)

        self._buttons = []

    def on_enabled_changed(self):
        self.update()

    def set_buttons(self, buttons):
        raise isinstance(buttons, tuple) or AssertionError
        raise len(buttons) is 4 or AssertionError
        for button in buttons:
            raise isinstance(button, ButtonElement) or button == None or AssertionError

        for button in self._buttons:
            if button != None:
                button.remove_value_listener(self.reset_send)

        self._buttons = []
        for button in buttons:
            if button != None:
                button.add_value_listener(self.reset_send, identify_sender=True)
            self._buttons.append(button)

    def update(self):
        pass

    def reset_send(self, value, sender):
        raise self._buttons != None or AssertionError
        raise isinstance(value, int) or AssertionError
        tracks = self.tracks_to_use()
        returns = self.returns_to_use()
        if value is not 0 or not sender.is_momentary():
            for index in range(4):
                if index < len(returns):
                    if sender is self._buttons[index]:
                        for track in tracks:
                            track.mixer_device.sends[index].value = 0

                        for track in returns:
                            track.mixer_device.sends[index].value = 0

    def tracks_to_use(self):
        return self.song().tracks

    def returns_to_use(self):
        return self.song().return_tracks