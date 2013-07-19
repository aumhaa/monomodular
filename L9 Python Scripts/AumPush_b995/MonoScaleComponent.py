"""
MonoScaleComponent.py

Created by amounra on 2013-07-18.
Copyright (c) 2013 __aumhaa__. All rights reserved.
"""
from _Framework.ControlSurfaceComponent import ControlSurfaceComponent
from _Framework.ModeSelectorComponent import ModeSelectorComponent
from _Framework.SubjectSlot import subject_slot, subject_slot_group

_NOTENAMES = ['C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab', 'A', 'Bb', 'B']
NOTENAMES = [(_NOTENAMES[index%12] + ' ' + str(int(index/12))) for index in range(128)]
SCALENAMES = None
SCALEABBREVS = None

from Map import *

CHANNELS = ['Ch. 2', 'Ch. 3', 'Ch. 4', 'Ch. 5', 'Ch. 6', 'Ch. 7', 'Ch. 8', 'Ch. 9', 'Ch. 10', 'Ch. 11', 'Ch. 12', 'Ch. 13', 'Ch. 14', 'Ch. 15', 'Ch. 16']
MODES = ['chromatic', 'drumpad', 'scale', 'user']

DEFAULT_MIDI_ASSIGNMENTS = {'mode':'chromatic', 'offset':36, 'vertoffset':12, 'scale':'Chromatic', 'drumoffset':0, 'split':False}

if SCALENAMES is None:
	SCALENAMES = [scale for scale in sorted(SCALES.iterkeys())]

if SCALEABBREVS is None:
	SCALEABBREVS = []


class SplitModeSelector(ModeSelectorComponent):


	def __init__(self, callback):
		super(SplitModeSelector, self).__init__()
		self._report_mode = callback
		self._modes_buttons = []
		self._set_protected_mode_index(0)
	

	def number_of_modes(self):
		return 2
	

	def _mode_value(self, value, sender):
		if self._is_enabled:
			super(SplitModeSelector, self)._mode_value(value, sender)
			self._report_mode(self._mode_index)
	

	def _toggle_value(self, value):
		if self._is_enabled:
			super(SplitModeSelector, self)._toggle_value(value)
			self._report_mode(self._mode_index)
	

	def update(self):
		if self._is_enabled:
			if len(self._modes_buttons) > 0:
				for index in range(len(self._modes_buttons)):
					if self._mode_index == index:
						self._modes_buttons[index].turn_on(True)
					else:
						self._modes_buttons[index].turn_off(True)
			if not self._mode_toggle is None:
				if self._mode_index > 0:
					self._mode_toggle.turn_on(True)
				else:
					self._mode_toggle.turn_off(True)
	


class ScaleModeComponent(ModeSelectorComponent):
	__module__ = __name__
	__doc__ = ' Class for switching between modes, handle several functions with few controls '


	def __init__(self, script):
		super(ScaleModeComponent, self).__init__()
		self._script = script
		self._set_protected_mode_index(0)
	

	def set_mode_buttons(self, buttons):
		for button in self._modes_buttons:
			button.remove_value_listener(self._mode_value)
		self._modes_buttons = []
		if (buttons != None):
			for button in buttons:
				assert isinstance(button, MonoButtonElement)
				identify_sender = True
				button.add_value_listener(self._mode_value, identify_sender)
				self._modes_buttons.append(button)
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	

	def set_mode_toggle(self, button):
		assert ((button == None) or isinstance(button, MonoButtonElement))
		if (self._mode_toggle != None):
			self._mode_toggle.remove_value_listener(self._toggle_value)
		self._mode_toggle = button
		if (self._mode_toggle != None):
			self._mode_toggle.add_value_listener(self._toggle_value)
	

	def number_of_modes(self):
		return 8
	

	def update(self):
		if self.is_enabled():
			scales = SCALES.keys()
			self._script._offsets['scale'] = scales[self._mode_index%len(scales)]
			for index in range(len(self._modes_buttons)):
				if (index == self._mode_index):
					self._modes_buttons[index].turn_on()
				else:
					self._modes_buttons[index].turn_off()
	


class ScrollingOffsetComponent(ControlSurfaceComponent):
	__module__ = __name__
	__doc__ = ' Class for handling held buttons for continued value changes '


	def __init__(self, callback):
		super(ScrollingOffsetComponent, self).__init__()
		self._report_change = callback
		self._maximum = 127
		self._minimum = 0
		self._shifted = False
		self._shifted_value = 11
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1	
		self._scroll_up_button = None
		self._scroll_down_button = None
		self._shift_button = None
		self._shift_is_momentary = True
		self._register_timer_callback(self._on_timer)
	

	def disconnect(self):
		if (self._scroll_up_button != None):
			self._scroll_up_button.remove_value_listener(self._scroll_up_value)
			self._scroll_up_button = None
		if (self._scroll_down_button != None):
			self._scroll_down_button.remove_value_listener(self._scroll_down_value)
			self._scroll_down_button = None
	

	def on_enabled_changed(self):
		self._scroll_up_ticks_delay = -1
		self._scroll_down_ticks_delay = -1
		self.update()
	

	def set_offset_change_buttons(self, up_button, down_button):
		assert ((up_button == None) or isinstance(up_button, ButtonElement))
		assert ((down_button == None) or isinstance(down_button, ButtonElement))
		do_update = False
		if (up_button is not self._scroll_up_button):
			do_update = True
			if (self._scroll_up_button != None):
				self._scroll_up_button.remove_value_listener(self._scroll_up_value)
			self._scroll_up_button = up_button
			if (self._scroll_up_button != None):
				self._scroll_up_button.add_value_listener(self._scroll_up_value)
		if (down_button is not self._scroll_down_button):
			do_update = True
			if (self._scroll_down_button != None):
				self._scroll_down_button.remove_value_listener(self._scroll_down_value)
			self._scroll_down_button = down_button
			if (self._scroll_down_button != None):
				self._scroll_down_button.add_value_listener(self._scroll_down_value)
		if do_update:
			self.update()
	

	def _scroll_up_value(self, value):
		assert (value in range(128))
		assert (self._scroll_up_button != None)
		if self.is_enabled():
			button_is_momentary = self._scroll_up_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_up_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_up_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self._offset = max(self._minimum, min(self._maximum, self._offset + (1 + (self._shifted * self._shifted_value))))
				self.update()
				self._report_change(self._offset)
	

	def _scroll_down_value(self, value):
		assert (value in range(128))
		assert (self._scroll_down_button != None)
		if self.is_enabled():
			button_is_momentary = self._scroll_down_button.is_momentary()
			if button_is_momentary:
				if (value != 0):
					self._scroll_down_ticks_delay = INITIAL_SCROLLING_DELAY
				else:
					self._scroll_down_ticks_delay = -1
			if ((not self._is_scrolling()) and ((value is not 0) or (not button_is_momentary))):
				self._offset = max(self._minimum, min(self._maximum, self._offset - (1 + (self._shifted * self._shifted_value))))
				self.update()
				self._report_change(self._offset)
	

	def set_shift_button(self, shift_button):
		if self._shift_button != None:
			if self._shift_button.value_has_listener(self._shift_value):
				self._shift_button.remove_value_listener(self._shift_value)
		self._shift_button = shift_button
		if self._shift_button != None:
			self._shift_button.add_value_listener(self._shift_value)
			self.update()
	

	def _shift_value(self, value):
		if self._shift_is_momentary:
			self._shifted = (value > 0)
			self.update()
		else:
			if value > 0:
				self._shifted = not self._shifted
				self.update()
		
	

	def _on_timer(self):
		if self.is_enabled():
			scroll_delays = [self._scroll_up_ticks_delay,
							 self._scroll_down_ticks_delay]
			if (scroll_delays.count(-1) < 2):
				offset_increment = 0
				if (self._scroll_down_ticks_delay > -1):
					if self._is_scrolling():
						offset_increment -= 1
						self._scroll_down_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_down_ticks_delay -= 1
				if (self._scroll_up_ticks_delay > -1):
					if self._is_scrolling():
						offset_increment += 1
						self._scroll_up_ticks_delay = INTERVAL_SCROLLING_DELAY
					self._scroll_up_ticks_delay -= 1
				new_offset = max(self._minimum, min(self._maximum, self._offset + offset_increment))
				if new_offset != self._offset:
					self._offset =  new_offset
					self.update()
					self._report_change(self._offset)
	

	def _is_scrolling(self):
		return (0 in (self._scroll_up_ticks_delay,
					  self._scroll_down_ticks_delay))
	

	def update(self):
		if (self._scroll_down_button != None):
			if (self._offset > self._minimum):
				self._scroll_down_button.turn_on(True)
			else:
				self._scroll_down_button.turn_off(True)
		if (self._scroll_up_button != None):
			if (self._offset < self._maximum):
				self._scroll_up_button.turn_on(True)
			else:
				self._scroll_up_button.turn_off(True)	
		if (self._shift_button != None):
			if (self._shifted):
				self._shift_button.turn_on(True)
			else:
				self._shift_button.turn_off(True)
	

	def deassign_all(self):
		self.set_offset_change_buttons(None, None)
		self.set_shift_button(None)
		self.on_enabled_changed()
	


class MonoScaleComponent(ControlSurfaceComponent):


	def __init__(self, script):
		super(MonoScaleComponent, self).__init__()
		self._script = script

		self._offsets = [{'offset':DEFAULT_OFFSET, 'vertoffset':DEFAULT_VERTOFFSET, 'drumoffset':DEFAULT_DRUMOFFSET, 'scale':DEFAULT_SCALE, 'split':DEFAULT_SPLIT} for index in range(16)]

		self._split_mode_selector = SplitModeSelector(self._split_mode_value)

		self._vertical_offset_component = ScrollingOffsetComponent(self._vertical_offset_value)

		self._offset_component = ScrollingOffsetComponent(self._offset_value)
		self._offset_component._shifted_value = 11
		self._shift_is_momentary = OFFSET_SHIFT_IS_MOMENTARY

		self._scale_offset_component = ScrollingOffsetComponent(self._scale_offset_value)
		self._scale_offset_component._minimum = 0
		self._scale_offset_component._maximum = len(SCALES.keys())-1
	

	def set_button_matrix(self, matrix):
		self._matrix_value.subject = matrix
		if matrix:
			self._assign_midi_layer()
		else:
			pass
	

	@subject_slot('value')
	def _matrix_value(self, value, x, y, *a, **k):
		self._script.log_message('monoscale grid in: ' + str(x) + ' ' + str(y) + ' ' + str(value))
	

	def set_shift_button(self, shift_button):
		self._shift_value.subject = shift_button
	

	@subject_slot('value')
	def _shift_value(self, value):
		self._script.log_message('monoscale shift in: ' + str(value))
	

	def set_alt_button(self, alt_button):
		self._alt_value.subject = alt_button
	

	@subject_slot('value')
	def _alt_value(self, value):
		self._script.log_message('monoscale alt in: ' + str(value))
	

	def update(self):
		pass
	

	def _is_mod(self, device):
		mod_device = None
		if isinstance(device, Live.Device.Device):
			if device.can_have_chains and not device.can_have_drum_pads and len(device.view.selected_chain.devices)>0:
				device = device.view.selected_chain.devices[0]
		if not device is None:
			if self._script._monomodular and self._script.monomodular._mods:
				for mod in self._script.monomodular._mods:
					if mod.device == device:
						mod_device = mod
						break
		return mod_device
	

	def _assign_mod(self):
		mod = self._is_mod(self._device._device)
		if not mod is None:
			#self._send_midi(MIDIBUTTONMODE)
			self._script.modhandler._assign_base_grid(self._base_grid)
			self._script.modhandler._assign_base_grid_CC(self._base_grid_CC)
			if self.shift_pressed():
				self.modhandler._assign_keys(self._keys)
			else:
				self.modhandler._assign_keys(self._keys_display)
				if self._layer == 2:
					self.modhandler._fader_color_override = True
		self.modhandler.select_mod(mod)
		return not mod is None
	

	def _detect_instrument_type(self, track):
		scale = DEFAULT_AUTO_SCALE
		#for device in self._get_devices(track):
		if self._assign_mod():
			scale = 'Mod'
		else:
			for device in track.devices:
				if isinstance(device, Live.Device.Device):
					#self.log_message('device: ' + str(device.class_name))
					if device.class_name == 'DrumGroupDevice':
						scale = 'DrumPad'
						break
		return scale
	

	def _offset_value(self, offset):
		#self.log_message('root offset: ' + str(self._offset_component._offset) + ' ' + str(offset))
		#if not self.pad_held():
		cur_track = self._script._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				scale = self._offsets[cur_chan]['scale']
				if scale is 'Auto':
					scale = self._detect_instrument_type(cur_track)
				if scale is 'DrumPad':
					old_offset = self._offsets[cur_chan]['drumoffset']
					self._offsets[cur_chan]['drumoffset'] = offset
					self._script.show_message('New drum root is ' + str(self._offsets[cur_chan]['drumoffset']))
					#newval = list(str(offset))
					#if len(newval)==2:
					#	self._display_chars(newval[0], newval[1])
					#elif len(newval)==1:
					#	self._display_chars('-', newval[0])
				else:
					self._offsets[cur_chan]['offset'] = offset
					self._script.show_message('New root is Note# ' + str(self._offsets[cur_chan]['offset']) + ', ' + str(NOTENAMES[self._offsets[cur_chan]['offset']]))
					#newval = list(str(offset))
					#if len(newval)>=2:
					#	self._display_chars(newval[0], newval[1])
					#elif len(newval)==1:
					#	self._display_chars('-', newval[0])
				#self._assign_notes_per_scale(cur_chan)
				self._assign_midi_layer()
	

	def _vertical_offset_value(self, offset):
		#self.log_message('vertical offset: ' + str(self._vertical_offset_component._offset) + ' ' + str(offset))
		#if not self.pad_held():
		cur_track = self._script._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				#self._assign_notes_per_scale(cur_chan)
				self._offsets[cur_chan]['vertoffset'] = offset
				self._script.show_message('New vertical offset is ' + str(self._offsets[cur_chan]['vertoffset']))
				#newval = list(str(offset))
				#if len(newval)>=2:
				#	self._display_chars(newval[0], newval[1])
				#elif len(newval)==1:
				#	self._display_chars('-', newval[0])
				self._assign_midi_layer()
	

	def _scale_offset_value(self, offset):
		#self.log_message('scale offset ================= ' + str(offset))
		#if not self.pad_held():
		cur_track = self._script._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				self._offsets[cur_chan]['scale'] = SCALENAMES[offset]
				self._script.show_message('New scale is ' + str(self._offsets[cur_chan]['scale']))
				#if str(SCALENAMES[offset]) in SCALEABBREVS.keys():
				#	newval = list(str(SCALEABBREVS[str(SCALENAMES[offset])]))		#sorry :/
				#else:
				#	newval = list(str(SCALENAMES[offset]))
				#if len(newval)>=2:
				#	self._display_chars(newval[0], newval[1])
				if len(SCALES[self._offsets[cur_chan]['scale']])>8:
					self._offsets[cur_chan]['vert_offset'] = 8
				#self._assign_notes_per_scale(cur_chan)
				self._assign_midi_layer()
	

	def _split_mode_value(self, mode):
		#self.log_message('split mode value' + str(mode))
		#if not self.pad_held():
		#if self.shift_pressed():
			#if self.select_pressed():
		cur_track = self._scrip._mixer._selected_strip._track
		if cur_track.has_midi_input:
			cur_chan = cur_track.current_input_sub_routing
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				self._offsets[cur_chan]['split'] = bool(mode)  #not self._offsets[cur_chan]['split'] 
				#self.log_message('split is ' + str(self._offsets[cur_chan]['split'] ))	
	

	def _assign_midi_layer(self):
		cur_track = self._script.song().view.selected_track
		is_midi = False
		if cur_track.has_midi_input:
			matrix = self._matrix_value.subject
			is_midi = True
			cur_chan = cur_track.current_input_sub_routing
			self._script.log_message('cur_chan ' + str(cur_chan) + str(type(cur_chan)) + str(len(cur_chan)))
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				offset, vertoffset, scale, split = self._offsets[cur_chan]['offset'], self._offsets[cur_chan]['vertoffset'], self._offsets[cur_chan]['scale'], self._offsets[cur_chan]['split']
				if scale is 'Auto':
					scale = self._detect_instrument_type(cur_track)
					self._script.log_message('auto found: ' + str(scale))
				if scale is 'Session':
					is_midi = False
				elif scale is 'Mod':
					is_midi = True
				elif scale in SPLIT_SCALES or split:
					#self._send_midi(SPLITBUTTONMODE)
					scale_len = len(SCALES[scale])
					for row in range(4):
						for column in range(4):
							button = matrix.get_button(column, row)
							if scale is 'DrumPad':
								button.set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
								button.scale_color = DRUMCOLORS[0]
								button.send(button.scale_color)
								self._offset_component._shifted_value = 3
							else:
								note_pos = column + (abs(3-row)*int(vertoffset))
								note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
								button.set_identifier(note%127)
								button.scale_color = KEYCOLORS[(note%12 in WHITEKEYS) + (((note_pos%scale_len)==0)*2)]
								button.send(button.scale_color)
								self._offset_component._shifted_value = 11
							button.set_enabled(False)
							button.set_channel(cur_chan)
							#self._selected_session.deassign_all()
							#self._selected_scene[column+(row*4)].clip_slot(0).set_launch_button(self._pad[column + 4 + (row*8)])
					#self._selected_session.set_scene_bank_buttons(self._button[5], self._button[4])
					#self.set_highlighting_session_component(self._selected_session)
					#self._selected_session._do_show_highlight()
				else:
					#self._send_midi(MIDIBUTTONMODE)
					scale_len = len(SCALES[scale])
					for row in range(4):
						for column in range(8):
							button = matrix.get_button(column, row)
							if scale is 'DrumPad':
								button.set_identifier((DRUMNOTES[column + (row*8)] + (self._offsets[cur_chan]['drumoffset']*4))%127)
								button.scale_color = DRUMCOLORS[column<4]
								button.send(button.scale_color)
								self._offset_component._shifted_value = 3
							else:
								note_pos = column + (abs(3-row)*vertoffset)
								note =	offset + SCALES[scale][note_pos%scale_len] + (12*int(note_pos/scale_len))
								button.set_identifier(note%127)
								button.scale_color = KEYCOLORS[(note%12 in WHITEKEYS) + (((note_pos%scale_len)==0)*2)]
								button.send(button.scale_color)
								self._offset_component._shifted_value = 11
							button.set_enabled(False)
							button.set_channel(cur_chan)
					#self._session.set_scene_bank_buttons(self._button[5], self._button[4])
					#self._session.set_track_bank_buttons(self._button[6], self._button[7])
				#if self.pad_held():
				#	for index in range(len(self._last_pad_stream)):
				#		self._stream_pads[index].press_flash(self._last_pad_stream[index])
			else:
				is_midi = False
		return is_midi	
	

	def _assign_midi_shift_layer(self):
		cur_track = self._script._mixer._selected_strip._track
		is_midi = False
		if cur_track.has_midi_input:
			#self._send_midi(LIVEBUTTONMODE)
			#if AUTO_ARM_SELECTED:
			#	if not cur_track.arm:
			#		self.schedule_message(1, self._arm_current_track, cur_track)
			is_midi = True
			cur_chan = cur_track.current_input_sub_routing
			if cur_chan in CHANNELS:
				cur_chan = (CHANNELS.index(cur_chan))+1
				scale = self._offsets[cur_chan]['scale']
				if scale is 'Auto':
					scale = self._detect_instrument_type(cur_track)
					#self.log_message('auto found: ' + str(scale))
				if scale is 'Session':
					is_midi = False
				elif scale is 'Mod':
					is_midi = True
				else:
					"""for button in self._touchpad[0:1]:
						button.set_on_off_values(SPLITMODE, 0)
					for button in self._touchpad[1:2]:
						button.set_on_off_values(OVERDUB, 0)
					self._transport.set_overdub_button(self._touchpad[1])
					self._split_mode_selector._mode_index = int(self._offsets[cur_chan]['split'])
					self._split_mode_selector.set_enabled(True)
					if not self._offsets[cur_chan]['scale'] is 'DrumPad':
						for button in self._touchpad[2:4]:
							button.set_on_off_values(VERTOFFSET, 0)
						self._vertical_offset_component._offset = self._offsets[cur_chan]['vertoffset']		
						self._vertical_offset_component.set_offset_change_buttons(self._touchpad[3], self._touchpad[2])
					for button in self._touchpad[4:6]:
						button.set_on_off_values(SCALEOFFSET, 0)
					self._scale_offset_component._offset = SCALENAMES.index(self._offsets[cur_chan]['scale'])
					self._scale_offset_component.set_offset_change_buttons(self._touchpad[5], self._touchpad[4])
					for button in self._touchpad[6:8]:
						button.set_on_off_values(OFFSET, 0)
					if scale is 'Auto':
						scale = self._detect_instrument_type(cur_track)
					if scale is 'DrumPad':
						self._offset_component._offset = self._offsets[cur_chan]['drumoffset']
					else:
						self._offset_component._offset = self._offsets[cur_chan]['offset']		
					self._offset_component.set_offset_change_buttons(self._touchpad[7], self._touchpad[6])"""
					is_midi = True
		return is_midi
	






