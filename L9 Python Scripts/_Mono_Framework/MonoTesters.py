# by amounra 0413 : http://www.aumhaa.com

"""This is a collection of subclasses used to override MonoFramework elements during testing....they basically just remove 
the arguments from the specialty Mono Subclasses and pass the class over to the original Super that it was subclassing"""



from _Framework.ButtonElement import ButtonElement

MonoButtonElement(ButtonElement):

	def __init__(self, is_momentary, msg_type, channel, identifier, name, cs, *a, **k):
		super(MonoButtonElement, self).__init__(is_momentary, msg_type, channel, identifier, *a, **k)
		#self.set_color_map(tuple([1, 1, 1, 1, 1, 1, 1]))
		self._script = cs
		self.name = name
	