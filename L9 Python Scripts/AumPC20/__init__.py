from _Framework.Capabilities import *

from AumPC20 import AumPC20


def create_instance(c_instance):
	""" Creates and returns the AumPC40 script """
	return AumPC20(c_instance)


def get_capabilities():
	return {CONTROLLER_ID_KEY: controller_id(vendor_id=2536, product_ids=[123], model_name='Akai APC20'),
	 PORTS_KEY: [inport(props=[NOTES_CC, SCRIPT, REMOTE]), outport(props=[SCRIPT, REMOTE])]}