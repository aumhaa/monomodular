# by amounra 0513 : http://www.aumhaa.com

from Lemur256 import Lemur256

def create_instance(c_instance):
    """ Creates and returns the LemaurPad script """
    return Lemur256(c_instance)


from _Framework.Capabilities import *

def get_capabilities():
    return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[115], model_name='Lemur256'),
     PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}