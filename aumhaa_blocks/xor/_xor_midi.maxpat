{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 29.0, 69.0, 640.0, 480.0 ],
		"bglocked" : 0,
		"defrect" : [ 29.0, 69.0, 640.0, 480.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Andale Mono",
		"gridonopen" : 0,
		"gridsize" : [ 16.0, 16.0 ],
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
					"text" : "== 0",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 240.0, 94.0, 39.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-3",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 240.0, 144.0, 68.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-24",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "m",
					"presentation_rect" : [ 3.0, 2.0, 19.0, 20.0 ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 272.0, 150.0, 20.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-23",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.toggle",
					"varname" : "c_mute",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 19.0, 2.0, 40.0, 21.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"bgoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"activebgoncolor" : [ 0.94902, 0.0, 0.0, 1.0 ],
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 240.0, 62.0, 15.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 1,
					"id" : "obj-21",
					"parameter_enable" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "c_mute",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "c_mute",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 1,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_invisible" : 1,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "d",
					"presentation_rect" : [ 3.0, 56.0, 19.0, 20.0 ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 248.0, 150.0, 20.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-19",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "v",
					"presentation_rect" : [ 3.0, 39.0, 19.0, 20.0 ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 225.0, 150.0, 20.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-18",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "n",
					"presentation_rect" : [ 3.0, 22.0, 19.0, 20.0 ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 200.0, 150.0, 20.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-4",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 2",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 336.0, 64.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-17",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 40",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 336.0, 96.0, 39.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-16",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess #1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 336.0, 16.0, 90.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-11",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack 0 0",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 336.0, 256.0, 147.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-15",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---midi",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 336.0, 304.0, 75.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-14",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 322.0, 178.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-13",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.numbox",
					"varname" : "velocity",
					"outlettype" : [ "", "float" ],
					"activetricolor2" : [ 1.0, 0.380392, 0.0, 0.0 ],
					"tricolor" : [ 0.815686, 0.847059, 0.886275, 0.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"presentation_rect" : [ 19.0, 42.0, 40.0, 15.0 ],
					"fontname" : "Andale Mono",
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 400.0, 128.0, 40.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 2,
					"id" : "obj-12",
					"fontface" : 0,
					"parameter_enable" : 1,
					"activetricolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 127 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "velocity",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "velocity",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 1,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_invisible" : 1,
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.numbox",
					"varname" : "duration",
					"outlettype" : [ "", "float" ],
					"activetricolor2" : [ 1.0, 0.380392, 0.0, 0.0 ],
					"tricolor" : [ 0.815686, 0.847059, 0.886275, 0.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"presentation_rect" : [ 19.0, 59.0, 40.0, 15.0 ],
					"fontname" : "Andale Mono",
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 464.0, 128.0, 40.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 2,
					"id" : "obj-7",
					"fontface" : 0,
					"parameter_enable" : 1,
					"activetricolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 6000.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 250 ],
							"parameter_type" : 0,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "duration",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "duration",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 1,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_invisible" : 1,
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.numbox",
					"varname" : "note",
					"outlettype" : [ "", "float" ],
					"activetricolor2" : [ 1.0, 0.380392, 0.0, 0.0 ],
					"tricolor" : [ 0.815686, 0.847059, 0.886275, 0.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"presentation_rect" : [ 19.0, 25.0, 40.0, 15.0 ],
					"fontname" : "Andale Mono",
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 336.0, 128.0, 40.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 2,
					"id" : "obj-5",
					"fontface" : 0,
					"parameter_enable" : 1,
					"activetricolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 8,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "note",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "note",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 4,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 1,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_invisible" : 1,
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote",
					"outlettype" : [ "float", "float" ],
					"fontname" : "Andale Mono",
					"numinlets" : 3,
					"patching_rect" : [ 336.0, 208.0, 147.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-2",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2t",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 289.0, 39.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-1",
					"fontsize" : 12.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-2", 1 ],
					"destination" : [ "obj-15", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 331.5, 202.5, 345.5, 202.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-13", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-2", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-24", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 170.5, 331.5, 170.5 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-5" : [ "note", "note", 0 ],
			"obj-7" : [ "duration", "duration", 0 ],
			"obj-12" : [ "velocity", "velocity", 0 ],
			"obj-21" : [ "c_mute", "c_mute", 0 ]
		}

	}

}
