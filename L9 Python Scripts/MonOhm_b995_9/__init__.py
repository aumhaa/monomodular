# by amounra 0413 : http://www.aumhaa.com

from MonOhm import MonOhm

def create_instance(c_instance):
    """ Creates and returns the MonOhmod script """
    return MonOhm(c_instance)


from _Framework.Capabilities import *

def get_capabilities():
    return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[115], model_name='Livid Instruments Ohm'),
     PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}