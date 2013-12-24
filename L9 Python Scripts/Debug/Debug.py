# by amounra 0613 : http://www.aumhaa.com
import Live

import os, __builtin__, __main__, _ast, _codecs, _functools, _md5, _random, _sha, _sha256, _sha512, _socket, _sre, _ssl, _struct, _symtable, _types, _weakref, binascii, cStringIO, collections, datetime, errno, exceptions, fcntl, gc, imp, itertools, marshal, math, operator, posix, pwd, select, signal, sys, thread, time, unicodedata, xxsubtype, zipimport, zlib

modules = [__builtin__, __main__, _ast, _codecs, _functools, _md5, _random, _sha, _sha256, _sha512, _socket, _sre, _ssl, _struct, _symtable, _types, _weakref, binascii, cStringIO, collections, datetime, errno, exceptions, fcntl, gc, imp, itertools, marshal, math, operator, posix, pwd, select, signal, sys, thread, time, unicodedata, xxsubtype, zipimport, zlib]

DIRS_TO_REBUILD = ['Debug', 'AumPC20_b995_9', 'AumPC40_b995_9', 'AumPush_b995', 'AumTroll_b995_9', 'AumTroll_b995_9_G', 'Base_9_LE', 'BlockMod_b995_9', 'Codec_b995_9', 'Codex', 'LaunchMod_b995_9', 'Lemur256_b995_9', 'LemurPad_b995_9', 'Livid_Alias8', 'Livid_Base', 'Livid_Block', 'Livid_CNTRLR', 'Livid_CodeGriid', 'Livid_CodeRemoteScriptLinked', 'Livid_Ohm64', 'Livid_OhmModes', 'MonOhm_b995_9', 'Monomodular_b995_9']

MODS_TO_REBUILD = ['Debug', 'AumPC20', 'AumPC40', 'AumPush', 'AumTroll', 'AumTroll_G', 'Base', 'BlockMod', 'Codec', 'LaunchMod', 'Lemur256', 'LemurPad', 'Alias8', 'Block', 'CNTRLR', 'CodeGriid', 'Ohm64', 'MonOhm', 'Monomodular']

from _Framework.ControlSurface import ControlSurface 
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
class Debug(ControlSurface):


	def __init__(self, *a, **k):
		super(Debug, self).__init__(*a, **k)
		#self._log_version_data()
		#self._log_sys_modules()
		#self._log_dirs()
		self.log_message('_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_ DEBUG ON _^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_')
		self._scripts = []

	

	def _log_dirs(self):
		self.log_message(str())
		self.log_message(str(sys.path))
		#self.log_message(str(__file__) + ' working dir: ' + str(os.listdir(sys.path[5])))
	

	def _reimport_loaded_modules(self):
		self.log_message('reimporting loaded modules.')
		for module in sys.modules.keys():
			self.log_message('preexisting: ' + str(module))
			if module is 'Livid_Base':
				newBase = Livid_Base
				sys.modules[module] = newBase
				self.log_message('replaced Livid_Base with new version!')
	

	def _log_version_data(self):
		self.log_message('modules: ' + str(sys.builtin_module_names))
		self.log_message('version: ' + str(sys.version))
		self.log_message('sys.path: ' + str(sys.path))
	

	def _log_sys_modules(self):	
		pairs = ((v, k) for (v, k) in sys.modules.iteritems())
		for module in sorted(pairs):
			self.log_message('---' + str(module))
		#for item in dir(gc):
		#	self.log_message(str(item))
		#looks_at = gc.get_referrers(self)
		#for item in looks_at:
		#	self.log_message(str(item))
	

	def disconnect(self):
		super(Debug, self).disconnect()
		self._clean_sys()
	

	def _clean_sys(self):
		for key, value in sys.modules.items():
			if value == None:
				del sys.modules[key]
		for path in sys.path:
			if 'MIDI Remote Scripts' in path:
				name_list = os.listdir(path)
				for name in name_list:
					if name[0] != '_' or '_Mono_Framework' == name[:15]:
						for key in sys.modules.keys():
							if name == key[:len(name)]:
								del sys.modules[key]
								#self.log_message('deleting key---' + str(key))
						"""if sys.modules.has_key(name):
							del sys.modules[name]
							self.log_message('deleting key---' + str(name))"""
		#self._log_sys_modules()
	

	def _log_builtins(self):
		for module in dir(module):
			self.log_message('---   %s' %(item))
	

	def _log_C_modules(self):
		for item in modules:
			self.log_message('Module Name:   %s' %(item.__name__))
			self.log_message('---   %s' %(item.__doc__))
	

	def _reimport(self):
		if self.rollbackImporter:
			self.rollbackImporter.uninstall()
		self.rollbackImporter = RollbackImporter()
	

	def connect_script_instances(self, instanciated_scripts):
		self._scripts = instanciated_scripts
		for script in self._scripts:
			script._debug = True
	


class ModuleRemover(ControlSurfaceComponent):


	def __init__(self, *a, **k):
		"Creates an instance of the ModuleRemover for the module that will be removed"
		super(ModuleRemover, self).__init__(*a, **k)
	

	def _remove_old_modules(self):
		for key, value in sys.modules.items():
			if value == None:
				del sys.modules[key]
		if sys.modules.has_key(self.__name__):
			self.log_message('deleting key---' + str(__name__))
			del sys.modules[__name__]
	

	def disconnect(self):
		super(ModuleRemover, self).disconnect()
		self._remove_old_modules()
	


class RollbackImporter:


	def __init__(self):
		"Creates an instance and installs as the global importer"
		self.previousModules = sys.modules.copy()
		self.realImport = __builtin__.__import__
		__builtin__.__import__ = self._import
		self.newModules = {}
	

	def _import(self, name, globals=None, locals=None, fromlist=[]):
		result = apply(self.realImport, (name, globals, locals, fromlist))
		self.newModules[name] = 1
		return result
	

	def uninstall(self):
		for modname in self.newModules.keys():
			if not self.previousModules.has_key(modname):
				# Force reload when modname next imported
				del(sys.modules[modname])
		__builtin__.__import__ = self.realImport
	



