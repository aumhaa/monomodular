{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"defrect" : [ 25.0, 69.0, 640.0, 480.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "midi_and_timing2",
					"text" : "midi_and_timing2",
					"outlettype" : [ "", "", "" ],
					"fontsize" : 9.0,
					"numinlets" : 4,
					"id" : "obj-1",
					"fontname" : "Arial",
					"numoutlets" : 3,
					"patching_rect" : [ 24.0, 24.0, 81.0, 17.0 ]
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-1::obj-66" : [ "outport[1]", "outport", 100 ],
			"obj-1::obj-44" : [ "midi_input_menu", "midi_input_menu", 200 ],
			"obj-1::obj-16" : [ "inport", "inport", 200 ],
			"obj-1::obj-83::obj-143" : [ "timing[2]", "timing", 10 ],
			"obj-1::obj-58" : [ "midi_output_menu[1]", "midi_input_menu", 100 ],
			"obj-1::obj-29" : [ "in_channel", "in_channel", 200 ],
			"obj-1::obj-40" : [ "midi_thru", "midi_thru", 200 ],
			"obj-1::obj-28" : [ "beat", "beat note", 200 ],
			"obj-1::obj-187" : [ "timing_master[1]", "timing_master", 200 ],
			"obj-1::obj-80" : [ "swing[2]", "swing", 11 ],
			"obj-1::obj-61" : [ "nomechan[1]", "nomechan", 100 ],
			"obj-1::obj-159" : [ "start", "start note", 200 ]
		}

	}

}
