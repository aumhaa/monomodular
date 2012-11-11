{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 1016.0, 511.0, 134.0, 187.0 ],
		"bglocked" : 0,
		"defrect" : [ 1016.0, 511.0, 134.0, 187.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial Bold",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
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
					"text" : "r #1---play_mode_set",
					"numoutlets" : 1,
					"fontname" : "Arial Bold",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 112.0, 111.0, 18.0 ],
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"id" : "obj-220",
					"fontsize" : 10.0,
					"numinlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---loadbang",
					"numoutlets" : 1,
					"fontname" : "Arial Bold",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 16.0, 72.0, 18.0 ],
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"id" : "obj-4",
					"fontsize" : 10.0,
					"numinlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set Clip",
					"numoutlets" : 1,
					"fontname" : "Arial Bold",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 64.0, 89.0, 18.0 ],
					"id" : "obj-7",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"numoutlets" : 1,
					"fontname" : "Arial Bold",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 40.0, 32.5, 16.0 ],
					"id" : "obj-3",
					"fontsize" : 10.0,
					"numinlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Clip #1",
					"numoutlets" : 0,
					"presentation_rect" : [ 0.0, 0.0, 48.363556, 18.0 ],
					"fontname" : "Arial Bold",
					"patching_rect" : [ 16.0, 88.0, 72.0, 18.0 ],
					"presentation" : 1,
					"id" : "obj-168",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.text",
					"varname" : "live.text[4]",
					"numoutlets" : 2,
					"presentation_rect" : [ 0.0, 16.0, 48.0, 16.0 ],
					"activebgcolor" : [ 0.811765, 0.372549, 0.172549, 1.0 ],
					"outlettype" : [ "", "" ],
					"text" : "None",
					"texton" : "Slice",
					"automation" : "None",
					"patching_rect" : [ 16.0, 136.0, 40.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-375",
					"parameter_enable" : 1,
					"automationon" : "Slice",
					"numinlets" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "None", "Slice" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "live.text[4]",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "live.text[4]",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---play_mode",
					"numoutlets" : 0,
					"fontname" : "Arial Bold",
					"patching_rect" : [ 16.0, 160.0, 92.0, 18.0 ],
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"id" : "obj-385",
					"fontsize" : 10.0,
					"numinlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-220", 0 ],
					"destination" : [ "obj-375", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-375", 1 ],
					"destination" : [ "obj-385", 0 ],
					"hidden" : 0,
					"midpoints" : [ 46.5, 156.0, 25.5, 156.0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-375" : [ "live.text[4]", "live.text[4]", 0 ]
		}

	}

}
