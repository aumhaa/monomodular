#Embedded file name: /Applications/Ableton Live 9.05 Suite.app/Contents/App-Resources/MIDI Remote Scripts/AumPush_b995/__init__.py
from AumPush import AumPush
from _Framework.Capabilities import controller_id, inport, outport, CONTROLLER_ID_KEY, PORTS_KEY, NOTES_CC, SCRIPT, SYNC, FIRMWARE_KEY, AUTO_LOAD_KEY

def get_capabilities():
    return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[21], model_name='Ableton Push'),
     PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT]),
                 inport(props=[]),
                 outport(props=[NOTES_CC, SYNC, SCRIPT]),
                 outport(props=[])],
     FIRMWARE_KEY: 'push_updater',
     AUTO_LOAD_KEY: True}


def create_instance(c_instance):
    """ Creates and returns the L9C script """
    return AumPush(c_instance)