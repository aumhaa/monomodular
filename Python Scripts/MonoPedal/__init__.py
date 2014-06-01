# by amounra 0114 : http://www.aumhaa.com

from MonoPedal import MonoPedal

def create_instance(c_instance):
    """ Creates and returns the MonoPedal script """
    return MonoPedal(c_instance)


from _Framework.Capabilities import *

def get_capabilities():
    return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[115], model_name='aumhaa MonoPedal'),
     PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}