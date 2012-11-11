{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 0.0, 44.0, 948.0, 662.0 ],
		"bgcolor" : [ 0.792157, 0.792157, 0.792157, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 0.0, 44.0, 948.0, 662.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 11.595187,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 1500,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "grab looper",
					"fontsize" : 11.595187,
					"presentation_rect" : [ 71.0, 69.0, 70.0, 20.0 ],
					"patching_rect" : [ 126.0, 56.0, 68.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-221",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "abs",
					"outlettype" : [ "int" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 308.0, 1730.0, 29.0, 20.0 ],
					"id" : "obj-220",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1.",
					"outlettype" : [ "float" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 308.0, 1702.0, 32.5, 20.0 ],
					"id" : "obj-219",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~ 1.",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 455.0, 1722.0, 35.0, 20.0 ],
					"id" : "obj-218",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~ 1.",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 385.0, 1723.0, 35.0, 20.0 ],
					"id" : "obj-212",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---mute",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 308.0, 1675.0, 55.0, 20.0 ],
					"id" : "obj-190",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "select 0 1 2 3",
					"outlettype" : [ "bang", "bang", "bang", "bang", "" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 42.0, 32.0, 97.0, 17.0 ],
					"id" : "obj-189",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_buffer_copy",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 42.0, 6.0, 78.0, 17.0 ],
					"id" : "obj-186",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 186.0, 186.0, 20.0, 20.0 ],
					"id" : "obj-63",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 41.0, 134.0, 28.0, 17.0 ],
					"id" : "obj-54",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 1000",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 186.0, 162.0, 61.0, 20.0 ],
					"id" : "obj-18",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 #0-sample",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 50.0, 162.0, 65.0, 15.0 ],
					"id" : "obj-177",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl slice 1",
					"outlettype" : [ "", "" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 41.0, 109.0, 45.0, 17.0 ],
					"id" : "obj-138",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "funnel 4",
					"outlettype" : [ "list" ],
					"fontsize" : 9.0,
					"patching_rect" : [ 42.0, 83.0, 78.0, 17.0 ],
					"id" : "obj-81",
					"numinlets" : 4,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.button",
					"varname" : "buffergrab[3]",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"presentation_rect" : [ 125.0, 71.0, 15.0, 15.0 ],
					"patching_rect" : [ 101.0, 57.0, 15.0, 15.0 ],
					"presentation" : 1,
					"bordercolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"parameter_enable" : 1,
					"id" : "obj-79",
					"numinlets" : 1,
					"activebgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"numoutlets" : 1,
					"activebgoncolor" : [ 0.94902, 0.0, 0.0, 1.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "buffergrab",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "buffergrab[3]",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 0,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_invisible" : 1,
							"parameter_unitstyle" : 10,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.button",
					"varname" : "buffergrab[2]",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"presentation_rect" : [ 106.0, 71.0, 15.0, 15.0 ],
					"patching_rect" : [ 81.0, 57.0, 15.0, 15.0 ],
					"presentation" : 1,
					"bordercolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"parameter_enable" : 1,
					"id" : "obj-78",
					"numinlets" : 1,
					"activebgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"numoutlets" : 1,
					"activebgoncolor" : [ 0.94902, 0.0, 0.0, 1.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "buffergrab",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "buffergrab[2]",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 0,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_invisible" : 1,
							"parameter_unitstyle" : 10,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.button",
					"varname" : "buffergrab[1]",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"presentation_rect" : [ 87.0, 71.0, 15.0, 15.0 ],
					"patching_rect" : [ 62.0, 57.0, 15.0, 15.0 ],
					"presentation" : 1,
					"bordercolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"parameter_enable" : 1,
					"id" : "obj-75",
					"numinlets" : 1,
					"activebgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"numoutlets" : 1,
					"activebgoncolor" : [ 0.94902, 0.0, 0.0, 1.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "buffergrab",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "buffergrab[1]",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 0,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_invisible" : 1,
							"parameter_unitstyle" : 10,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.button",
					"varname" : "buffergrab[0]",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"presentation_rect" : [ 68.0, 71.0, 15.0, 15.0 ],
					"patching_rect" : [ 42.0, 57.0, 15.0, 15.0 ],
					"presentation" : 1,
					"bordercolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"parameter_enable" : 1,
					"id" : "obj-64",
					"numinlets" : 1,
					"activebgcolor" : [ 0.498039, 0.52549, 0.576471, 0.0 ],
					"numoutlets" : 1,
					"activebgoncolor" : [ 0.94902, 0.0, 0.0, 1.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "buffergrab[0]",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "buffergrab[0]",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_units" : "",
							"parameter_order" : 0,
							"parameter_defer" : 0,
							"parameter_speedlim" : 1.0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_invisible" : 1,
							"parameter_unitstyle" : 10,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---buffer_info",
					"fontsize" : 9.0,
					"patching_rect" : [ 50.0, 186.0, 69.0, 17.0 ],
					"id" : "obj-46",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "bgcolor 1. 1. 1. 0.8",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 336.0, 1378.0, 110.0, 18.0 ],
					"id" : "obj-543",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "fx send",
					"fontsize" : 9.0,
					"frgb" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"patching_rect" : [ 420.0, 128.0, 131.0, 17.0 ],
					"textcolor" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"id" : "obj-53",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "volume",
					"fontsize" : 9.0,
					"presentation_rect" : [ 235.0, 68.0, 72.0, 17.0 ],
					"frgb" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"patching_rect" : [ 420.0, 148.0, 131.0, 17.0 ],
					"presentation" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"id" : "obj-52",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "send~ ---gs_aux_R",
					"fontsize" : 11.595187,
					"patching_rect" : [ 614.0, 1463.0, 109.0, 20.0 ],
					"id" : "obj-51",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "send~ ---gs_aux_L",
					"fontsize" : 11.595187,
					"patching_rect" : [ 578.0, 1435.0, 108.0, 20.0 ],
					"id" : "obj-50",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"outlettype" : [ "", "" ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"bgcolor" : [ 0.941176, 0.941176, 0.941176, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"setminmax" : [ 0.0, 158.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"thickness" : 1,
					"patching_rect" : [ 571.718384, 1277.843628, 60.0, 18.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"contdata" : 1,
					"ghostbar" : 20,
					"slidercolor" : [ 0.0, 0.0, 0.180392, 0.784314 ],
					"settype" : 0,
					"id" : "obj-47",
					"numinlets" : 1,
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"orientation" : 0,
					"numoutlets" : 2,
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"outlettype" : [ "signal", "int" ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 118.0,
					"patching_rect" : [ 593.323608, 1312.802856, 20.0, 99.0 ],
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"id" : "obj-48",
					"numinlets" : 2,
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"numoutlets" : 2,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"outlettype" : [ "signal", "int" ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 67.0,
					"patching_rect" : [ 571.718384, 1312.802856, 20.0, 99.0 ],
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"id" : "obj-49",
					"numinlets" : 2,
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"numoutlets" : 2,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 43.588444, 61.119904, 20.201328, 16.964804 ],
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 782.148926, 893.083801, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"id" : "obj-45",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"text" : "C",
					"texton" : "C",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 864.0, 890.0, 70.0, 20.0 ],
					"id" : "obj-12",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1595.0, 1047.0, 32.5, 18.0 ],
					"id" : "obj-44",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1559.0, 1049.0, 32.5, 18.0 ],
					"id" : "obj-43",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1554.0, 995.0, 35.0, 20.0 ],
					"id" : "obj-39",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1597.0, 1085.0, 33.0, 20.0 ],
					"id" : "obj-38",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 943.0, 919.0, 20.0, 20.0 ],
					"id" : "obj-32",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "append $1",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 943.0, 945.0, 65.0, 18.0 ],
					"id" : "obj-34",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#2",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 670.0, 995.0, 32.5, 18.0 ],
					"id" : "obj-42",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 670.0, 1019.0, 32.5, 20.0 ],
					"id" : "obj-41",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 670.0, 969.0, 60.0, 20.0 ],
					"id" : "obj-40",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1121.0, 959.0, 72.0, 20.0 ],
					"id" : "obj-36",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 882.0, 921.0, 20.0, 20.0 ],
					"id" : "obj-216",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "loop $1",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 882.0, 947.0, 49.0, 18.0 ],
					"id" : "obj-217",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "record~",
					"outlettype" : [ "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1227.323608, 1125.843628, 52.0, 20.0 ],
					"id" : "obj-214",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 395.718384, 1480.843628, 72.0, 20.0 ],
					"id" : "obj-213",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive~ ---gs_audio_input",
					"outlettype" : [ "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1166.0, 1030.0, 153.0, 20.0 ],
					"id" : "obj-339",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 5.718567, 7.119904, 58.0, 17.0 ],
					"ignoreclick" : 1,
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 630.623596, 1076.119873, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"id" : "obj-236",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "#2",
					"texton" : "#2",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll focus_switch",
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 630.623596, 922.052307, 101.0, 20.0 ],
					"id" : "obj-330",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 4,
						"data" : [ 							{
								"key" : 1,
								"value" : [ 1, 0, 0, 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0, 1, 0, 0 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0, 0, 1, 0 ]
							}
, 							{
								"key" : 4,
								"value" : [ 0, 0, 0, 1 ]
							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"embed" : 1
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---focus",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 630.623596, 895.368347, 58.0, 20.0 ],
					"id" : "obj-335",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl mth 1",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 630.623596, 1046.0, 58.0, 20.0 ],
					"id" : "obj-329",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 5.718567, 43.276337, 58.0, 17.0 ],
					"ignoreclick" : 1,
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 724.718384, 1059.119873, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"id" : "obj-342",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "sustain",
					"texton" : "adsr",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 724.718384, 1029.843628, 32.5, 20.0 ],
					"id" : "obj-312",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3momentary",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 724.718384, 1001.843567, 91.0, 20.0 ],
					"id" : "obj-313",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1346.0, 600.0, 55.0, 20.0 ],
					"id" : "obj-233",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1342.0, 569.0, 102.0, 20.0 ],
					"id" : "obj-234",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.meter~",
					"outlettype" : [ "list" ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 147.0, 78.178925, 78.0, 8.0 ],
					"warmcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"patching_rect" : [ 95.718384, 1580.843628, 101.0, 8.0 ],
					"hotcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"presentation" : 1,
					"slidercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-227",
					"numinlets" : 1,
					"coldcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"orientation" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.meter~",
					"outlettype" : [ "list" ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 147.0, 71.156631, 78.0, 8.0 ],
					"warmcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"patching_rect" : [ 77.718384, 1550.843628, 101.0, 8.0 ],
					"hotcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"presentation" : 1,
					"slidercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-228",
					"numinlets" : 1,
					"coldcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"orientation" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_volume",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 140.718384, 1232.843628, 77.0, 20.0 ],
					"id" : "obj-459",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_filter",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 503.718384, 1531.843628, 61.0, 20.0 ],
					"id" : "obj-377",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "biquad~",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 468.718384, 1680.843628, 79.0, 20.0 ],
					"id" : "obj-684",
					"numinlets" : 6,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "biquad~",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 381.718414, 1680.843628, 79.0, 20.0 ],
					"id" : "obj-683",
					"numinlets" : 6,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"align" : 1,
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 9.0,
					"presentation_rect" : [ 393.276306, 74.0, 111.267944, 17.0 ],
					"items" : [ "lowpass", ",", "highpass", ",", "bandpass", ",", "bandstop", ",", "peaknotch", ",", "lowshelf", ",", "highshelf", ",", "resonant", ",", "allpass" ],
					"types" : [  ],
					"patching_rect" : [ 373.718414, 1531.843628, 95.0, 17.0 ],
					"presentation" : 1,
					"rounded" : 0,
					"id" : "obj-680",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 595.718384, 1531.843628, 72.0, 20.0 ],
					"id" : "obj-679",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "filtergraph~",
					"dbdisplay" : 0,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"fontsize" : 8.998901,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.8 ],
					"presentation_rect" : [ 393.276306, 6.868423, 111.0, 62.935844 ],
					"hcurvecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bwidthcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hbwidthcolor" : [ 0.0, 0.0, 0.39, 1.0 ],
					"patching_rect" : [ 408.718414, 1562.843628, 165.0, 91.0 ],
					"numdisplay" : 0,
					"presentation" : 1,
					"markercolor" : [ 0.509804, 0.509804, 0.509804, 1.0 ],
					"id" : "obj-627",
					"numinlets" : 8,
					"domain" : [ 0.0, 22050.0 ],
					"autoout" : 1,
					"fgcolor" : [ 0.0, 0.0, 0.0, 0.15 ],
					"numoutlets" : 7,
					"nfilters" : 1,
					"setfilter" : [ 0, 1, 0, 0, 0, 321.819885, 1.0, 0.5, 0.0001, 22050.0, 0.0001, 16.0, 0.5, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "plugout~",
					"outlettype" : [ "signal", "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 394.718414, 1770.843628, 57.0, 20.0 ],
					"id" : "obj-509",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"outlettype" : [ "", "" ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"bgcolor" : [ 0.941176, 0.941176, 0.941176, 1.0 ],
					"presentation_rect" : [ 233.189148, 68.881058, 79.72686, 19.670395 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"setminmax" : [ 0.0, 158.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"thickness" : 1,
					"patching_rect" : [ 140.718384, 1265.843628, 60.0, 18.0 ],
					"presentation" : 1,
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"contdata" : 1,
					"ghostbar" : 20,
					"slidercolor" : [ 0.0, 0.0, 0.180392, 0.784314 ],
					"settype" : 0,
					"id" : "obj-331",
					"numinlets" : 1,
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"orientation" : 0,
					"numoutlets" : 2,
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"outlettype" : [ "signal", "int" ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 118.0,
					"patching_rect" : [ 162.323608, 1300.802856, 20.0, 99.0 ],
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"id" : "obj-229",
					"numinlets" : 2,
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"numoutlets" : 2,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"outlettype" : [ "signal", "int" ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 67.0,
					"patching_rect" : [ 140.718384, 1300.802856, 20.0, 99.0 ],
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"id" : "obj-230",
					"numinlets" : 2,
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"numoutlets" : 2,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b",
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1581.0, 870.0, 32.5, 20.0 ],
					"id" : "obj-325",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 0",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1619.718506, 945.843567, 24.0, 20.0 ],
					"id" : "obj-318",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 1",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1585.718506, 941.843567, 24.0, 20.0 ],
					"id" : "obj-319",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 1000",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1604.718506, 908.843567, 69.0, 20.0 ],
					"id" : "obj-317",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 5.718567, 61.119904, 37.412285, 17.0 ],
					"ignoreclick" : 1,
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 1531.718628, 1123.119873, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 1.0, 0.0, 0.0, 0.654902 ],
					"id" : "obj-316",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "record",
					"texton" : "recording",
					"bgoncolor" : [ 1.0, 0.0, 0.0, 0.682353 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route size",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1597.0, 821.0, 104.0, 20.0 ],
					"id" : "obj-314",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1597.0, 791.0, 55.0, 20.0 ],
					"id" : "obj-310",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1597.0, 760.0, 102.0, 20.0 ],
					"id" : "obj-309",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"outlettype" : [ "", "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1379.0, 445.0, 53.0, 20.0 ],
					"id" : "obj-226",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1381.0, 405.0, 102.0, 20.0 ],
					"id" : "obj-306",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 500",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1152.718384, 53.843552, 63.0, 20.0 ],
					"id" : "obj-396",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1151.718384, 20.843567, 60.0, 20.0 ],
					"id" : "obj-395",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 200",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 43.843567, 63.0, 20.0 ],
					"id" : "obj-203",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#2file",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 67.843567, 39.0, 18.0 ],
					"id" : "obj-207",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 12.843567, 60.0, 20.0 ],
					"id" : "obj-208",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl filter symbol",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 119.843567, 87.0, 20.0 ],
					"id" : "obj-211",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend replace",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 144.843567, 97.0, 20.0 ],
					"id" : "obj-215",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll presets",
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1049.718506, 93.843567, 71.0, 20.0 ],
					"id" : "obj-597",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 36,
						"data" : [ 							{
								"key" : "1file",
								"value" : [ "Ablation:/Users/matthew/Documents/THINGS/2011 max development/grainstorm/grainstorm 161/woman_in_the_shoe.wav" ]
							}
, 							{
								"key" : "2file",
								"value" : [ "Ablation:/Users/matthew/Documents/THINGS/2011 max development/grainstorm/grainstorm 161/woman_in_the_shoe.wav" ]
							}
, 							{
								"key" : "3file",
								"value" : [ "Ablation:/Users/matthew/Documents/THINGS/2011 max development/grainstorm/grainstorm 161/woman_in_the_shoe.wav" ]
							}
, 							{
								"key" : "4file",
								"value" : [ "Ablation:/Users/matthew/Documents/THINGS/2011 max development/grainstorm/grainstorm 161/woman_in_the_shoe.wav" ]
							}
, 							{
								"key" : 0,
								"value" : [ 3688, 53, 33, 0, 400, 3, 749, 471 ]
							}
, 							{
								"key" : 1,
								"value" : [ 265, 45, 5, 0, 260, 105, 795, 831 ]
							}
, 							{
								"key" : 2,
								"value" : [ 3450, 53, 33, 0, 400, 3, 749, 471 ]
							}
, 							{
								"key" : 3,
								"value" : [ 2651, 53, 33, 0, 400, 3, 749, 471 ]
							}
, 							{
								"key" : 4,
								"value" : [ 2471, 53, -1111, 0, 400, 3, 749, 471 ]
							}
, 							{
								"key" : 5,
								"value" : [ 4257, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 6,
								"value" : [ 4419, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 7,
								"value" : [ 4535, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 8,
								"value" : [ 5071, 22, 52, 0, 345, 19, 709, 671 ]
							}
, 							{
								"key" : 9,
								"value" : [ 5959, 22, 52, 0, 345, 19, 751, 718 ]
							}
, 							{
								"key" : 10,
								"value" : [ 6046, 22, 52, 0, 345, 19, 751, 718 ]
							}
, 							{
								"key" : 11,
								"value" : [ 6046, 22, 243, 0, 345, 19, 751, 718 ]
							}
, 							{
								"key" : 12,
								"value" : [ 5929, 22, 4, 0, 345, 19, 751, 718 ]
							}
, 							{
								"key" : 13,
								"value" : [ 2667, 1, 4, 0, 230, 242, 542, 1000 ]
							}
, 							{
								"key" : 14,
								"value" : [ 5253, 22, -285, 0, 345, 19, 751, 718 ]
							}
, 							{
								"key" : 15,
								"value" : [ 3561, 95, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 16,
								"value" : [ 128, 31, 77, 0, 355, 20, 699, 624 ]
							}
, 							{
								"key" : 17,
								"value" : [ 762, 231, -2313, 0, 381, 20, 806, 803 ]
							}
, 							{
								"key" : 18,
								"value" : [ 762, 231, -1848, 0, 382, 20, 806, 803 ]
							}
, 							{
								"key" : 19,
								"value" : [ 762, 231, -2046, 0, 382, 20, 806, 803 ]
							}
, 							{
								"key" : 20,
								"value" : [ 662, 7, -2046, 0, 382, 20, 721, 803 ]
							}
, 							{
								"key" : 21,
								"value" : [ 662, 7, -2297, 0, 382, 20, 721, 803 ]
							}
, 							{
								"key" : 22,
								"value" : [ 382, 7, -1113, 0, 382, 20, 721, 803 ]
							}
, 							{
								"key" : 23,
								"value" : [ 4028, 95, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 24,
								"value" : [ 4144, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 25,
								"value" : [ 4257, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 26,
								"value" : [ 4419, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 27,
								"value" : [ 4535, 58, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 28,
								"value" : [ 3561, 95, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 29,
								"value" : [ 3662, 95, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 30,
								"value" : [ 3840, 95, 1, 0, 213, 125, 695, 776 ]
							}
, 							{
								"key" : 31,
								"value" : [ 4028, 95, 1, 0, 213, 125, 695, 776 ]
							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"embed" : 1
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 5.718567, 25.276337, 58.0, 17.0 ],
					"ignoreclick" : 1,
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 306.718384, 130.119904, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.14902, 1.0, 0.0, 0.584314 ],
					"id" : "obj-336",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "off",
					"texton" : "on",
					"bgoncolor" : [ 0.0, 1.0, 0.05098, 0.72549 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 306.718384, 53.843567, 55.0, 20.0 ],
					"id" : "obj-282",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---enable",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 306.718384, 23.843567, 66.0, 20.0 ],
					"id" : "obj-281",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr ($i1-5000)/100.0",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1513.0, 410.0, 121.0, 20.0 ],
					"id" : "obj-192",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 278.0, 53.0, 39.0, 15.0 ],
					"patching_rect" : [ 1410.0, 483.0, 157.0, 15.0 ],
					"presentation" : 1,
					"id" : "obj-191",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 345.787079, 51.845139, 20.201328, 13.852707 ],
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"patching_rect" : [ 1394.148926, 149.083801, 50.0, 17.0 ],
					"mode" : 1,
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"id" : "obj-345",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"text" : "Q",
					"texton" : "Q",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1464.0, 288.0, 44.0, 20.0 ],
					"id" : "obj-200",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr $i1/100*100",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1489.0, 318.0, 101.0, 20.0 ],
					"id" : "obj-209",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2_hi_trans",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1489.0, 255.0, 81.0, 20.0 ],
					"id" : "obj-210",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1242.0, 148.0, 72.0, 20.0 ],
					"id" : "obj-201",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1329.0, 194.0, 35.0, 20.0 ],
					"id" : "obj-202",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1329.0, 288.0, 44.0, 20.0 ],
					"id" : "obj-204",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr $i1/100*100",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1354.0, 318.0, 101.0, 20.0 ],
					"id" : "obj-205",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_lo_trans",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1354.0, 255.0, 81.0, 20.0 ],
					"id" : "obj-206",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_hi_dur_range",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 810.605103, 163.95929, 109.0, 20.0 ],
					"id" : "obj-198",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_lo_dur_range",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 771.605103, 143.95929, 109.0, 20.0 ],
					"id" : "obj-199",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t write",
					"outlettype" : [ "write" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 405.0, 273.0, 37.0, 18.0 ],
					"id" : "obj-197",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"presentation_rect" : [ 355.0, 71.0, 35.0, 20.0 ],
					"borderoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 0.670588, 0.858824, 0.937255, 0.784314 ],
					"patching_rect" : [ 405.0, 251.0, 74.0, 18.0 ],
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.635294, 0.635294, 0.635294, 1.0 ],
					"id" : "obj-196",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "save",
					"bgoncolor" : [ 0.6, 0.792157, 0.858824, 1.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 600",
					"outlettype" : [ "bang" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 390.0, 526.0, 61.0, 20.0 ],
					"id" : "obj-195",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_hi_range",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 685.605103, 158.95929, 85.0, 20.0 ],
					"id" : "obj-193",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3_lo_range",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 594.141052, 163.95929, 85.0, 20.0 ],
					"id" : "obj-194",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend store",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1445.0, 976.0, 82.0, 20.0 ],
					"id" : "obj-188",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend #2file",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1445.0, 945.0, 84.0, 20.0 ],
					"id" : "obj-187",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "absolutepath",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1445.0, 917.0, 79.0, 20.0 ],
					"id" : "obj-582",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 10",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 137.0, 972.0, 49.0, 20.0 ],
					"id" : "obj-185",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3trigger",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 116.0, 921.0, 65.0, 20.0 ],
					"id" : "obj-4",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_r",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 280.888672, 992.39209, 90.0, 20.0 ],
					"id" : "obj-56",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_s",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 269.672913, 961.53595, 92.0, 20.0 ],
					"id" : "obj-140",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_d",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 207.0, 939.0, 93.0, 20.0 ],
					"id" : "obj-146",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_a",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 192.856155, 912.53595, 93.0, 20.0 ],
					"id" : "obj-176",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 174.0, 1084.0, 80.5, 20.0 ],
					"id" : "obj-178",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 62.0, 1075.0, 80.5, 20.0 ],
					"id" : "obj-179",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "adsr~ 2. 100. 0.9 300.",
					"outlettype" : [ "signal", "signal", "", "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 146.0, 1020.0, 124.0, 20.0 ],
					"id" : "obj-180",
					"numinlets" : 5,
					"fontname" : "Arial",
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate~ 2",
					"outlettype" : [ "signal", "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 250.0, 882.0, 51.0, 20.0 ],
					"id" : "obj-181",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate~ 2",
					"outlettype" : [ "signal", "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 40.0, 878.0, 51.0, 20.0 ],
					"id" : "obj-182",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 12.0,
					"items" : [ "off", ",", "toggle", ",", "momentary" ],
					"types" : [  ],
					"patching_rect" : [ 38.0, 817.0, 100.0, 20.0 ],
					"id" : "obj-183",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #3momentary",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 34.0, 784.0, 91.0, 20.0 ],
					"id" : "obj-184",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1000.",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 495.331177, 317.0, 49.0, 20.0 ],
					"id" : "obj-173",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack",
					"outlettype" : [ "int", "int" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1018.0, 550.0, 48.0, 20.0 ],
					"id" : "obj-169",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend size",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 1225.0, 767.0, 68.0, 18.0 ],
					"id" : "obj-175",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t f f",
					"outlettype" : [ "float", "float" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 1197.0, 743.0, 46.5, 18.0 ],
					"id" : "obj-174",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route size bang",
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 1197.0, 722.0, 79.0, 18.0 ],
					"id" : "obj-168",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-buffer-length",
					"fontsize" : 10.0,
					"patching_rect" : [ 1197.0, 789.0, 99.0, 18.0 ],
					"id" : "obj-87",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess #0-sample",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 1175.0, 812.0, 122.0, 18.0 ],
					"id" : "obj-82",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"fontsize" : 14.249197,
					"patching_rect" : [ 141.0, 467.0, 29.0, 21.0 ],
					"id" : "obj-72",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"varname" : "-grains-on-off",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"fontface" : 1,
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 14.0,
					"bgcolor" : [ 0.537255, 0.537255, 0.537255, 1.0 ],
					"borderoncolor" : [ 0.792157, 0.568627, 0.411765, 1.0 ],
					"textoveroncolor" : [ 0.537255, 0.537255, 0.537255, 1.0 ],
					"bgovercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 176.0, 508.0, 78.0, 23.0 ],
					"mode" : 1,
					"border" : 1,
					"bordercolor" : [ 0.501961, 0.360784, 0.262745, 1.0 ],
					"textcolor" : [ 0.141176, 0.05098, 0.05098, 1.0 ],
					"bgoveroncolor" : [ 1.0, 1.0, 0.776471, 1.0 ],
					"id" : "obj-67",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "grains off",
					"texton" : "grains on",
					"bgoncolor" : [ 1.0, 1.0, 0.776471, 1.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "select range",
					"linecount" : 2,
					"fontsize" : 9.160198,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 704.024536, 463.0, 35.0, 28.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-31",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t replace",
					"outlettype" : [ "replace" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 280.0, 289.0, 49.0, 18.0 ],
					"id" : "obj-23",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"outlettype" : [ "", "", "int" ],
					"fontsize" : 9.0,
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"presentation_rect" : [ 318.0, 71.0, 35.0, 20.0 ],
					"borderoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgovercolor" : [ 0.670588, 0.858824, 0.937255, 0.784314 ],
					"patching_rect" : [ 279.0, 268.0, 74.0, 18.0 ],
					"presentation" : 1,
					"border" : 1,
					"bordercolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"rounded" : 4.0,
					"bgoveroncolor" : [ 0.635294, 0.635294, 0.635294, 1.0 ],
					"id" : "obj-19",
					"numinlets" : 1,
					"fontname" : "Arial",
					"text" : "load",
					"bgoncolor" : [ 0.6, 0.792157, 0.858824, 1.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p no-selector",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 526.331177, 444.0, 81.0, 20.0 ],
					"id" : "obj-164",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 47.0, 404.0, 202.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 47.0, 404.0, 202.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 49.69342, 134.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Since we are not using  waveform~'s selection feature, we make its selection invisible by setting its  selection to the range to be from  0 to 0",
									"linecount" : 4,
									"fontsize" : 13.914225,
									"patching_rect" : [ 49.69342, 20.839478, 260.0, 70.0 ],
									"id" : "obj-82",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 0 -1 0 0",
									"outlettype" : [ "" ],
									"fontsize" : 10.435669,
									"patching_rect" : [ 49.69342, 96.0, 93.0, 18.0 ],
									"id" : "obj-31",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-31", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 64 64",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 1066.331055, 495.0, 75.0, 17.0 ],
					"id" : "obj-24",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 64",
					"outlettype" : [ "int" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 911.331055, 338.0, 30.0, 20.0 ],
					"id" : "obj-22",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 100 150",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 771.331177, 530.0, 85.0, 17.0 ],
					"id" : "obj-88",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 250 750",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 615.331177, 359.0, 110.0, 20.0 ],
					"id" : "obj-58",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"tabs" : [ "play", "stop", "resume" ],
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 165.0, 255.0, 63.0, 42.0 ],
					"id" : "obj-14",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "1.",
					"outlettype" : [ "float" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 156.0, 402.0, 55.0, 18.0 ],
					"id" : "obj-11",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 0.001",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 678.331177, 495.0, 50.0, 20.0 ],
					"id" : "obj-83",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 0.001",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 605.331177, 495.0, 50.0, 20.0 ],
					"id" : "obj-84",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scaling trick for rslider ",
					"linecount" : 2,
					"fontface" : 3,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 534.331177, 495.0, 70.0, 29.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-25",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"outlettype" : [ "", "" ],
					"bgcolor" : [ 0.784314, 0.784314, 0.827451, 1.0 ],
					"setminmax" : [ 0.0, 1000.0 ],
					"patching_rect" : [ 494.622559, 375.831848, 95.710342, 20.420671 ],
					"contdata" : 1,
					"settype" : 0,
					"id" : "obj-33",
					"numinlets" : 1,
					"orientation" : 0,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s b",
					"outlettype" : [ "", "bang" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 294.0, 413.0, 80.0, 18.0 ],
					"id" : "obj-172",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bondo",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 691.331177, 554.0, 50.0, 20.0 ],
					"id" : "obj-171",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bondo",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 614.331177, 553.0, 50.0, 20.0 ],
					"id" : "obj-170",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s  #0-hi-location",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 610.867126, 648.46405, 84.0, 18.0 ],
					"id" : "obj-130",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s  #0-lo-location",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 612.331177, 625.0, 84.0, 18.0 ],
					"id" : "obj-131",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1.",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 691.331177, 575.0, 50.0, 20.0 ],
					"id" : "obj-159",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1.",
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 614.331177, 575.0, 50.0, 20.0 ],
					"id" : "obj-158",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r  #0-buffer-length",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 631.331177, 521.0, 106.0, 20.0 ],
					"id" : "obj-157",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 679.331177, 693.0, 61.0, 17.0 ],
					"id" : "obj-20",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 603.331177, 693.0, 61.0, 17.0 ],
					"id" : "obj-21",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p mean-set",
					"outlettype" : [ "" ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 1123.331055, 452.0, 63.0, 18.0 ],
					"id" : "obj-5",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 543.0, 403.0, 301.0, 268.0 ],
						"bglocked" : 0,
						"defrect" : [ 543.0, 403.0, 301.0, 268.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend set",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"patching_rect" : [ 54.0, 104.0, 72.0, 20.0 ],
									"id" : "obj-8",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr int( ($i1 + $i2) * 0.5)",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"patching_rect" : [ 54.0, 74.0, 138.0, 20.0 ],
									"id" : "obj-5",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 53.0, 134.0, 25.0, 25.0 ],
									"id" : "obj-2",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.0, 37.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 1096.331055, 693.0, 61.0, 17.0 ],
					"id" : "obj-165",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 1019.331055, 693.0, 61.0, 17.0 ],
					"id" : "obj-166",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 934.331055, 706.0, 61.0, 17.0 ],
					"id" : "obj-150",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 894.331055, 686.0, 61.0, 17.0 ],
					"id" : "obj-151",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 16 109",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 914.331055, 460.0, 80.0, 17.0 ],
					"id" : "obj-152",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u220000947",
					"text" : "autopattr",
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 399.331177, 822.0, 56.0, 18.0 ],
					"id" : "obj-147",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 4,
					"restore" : 					{
						"-grains-on-off" : [ 0 ],
						"-grains-time" : [ 20 ],
						"buffergrab[0]" : [ 0.0 ],
						"buffergrab[1]" : [ 0.0 ],
						"buffergrab[2]" : [ 0.0 ],
						"buffergrab[3]" : [ 0.0 ],
						"duration-lo-hi" : [ 131, 262 ],
						"location-lo-hi" : [ 267, 267 ],
						"pan-lo-hi" : [ 46, 82 ],
						"transpo-lo-hi" : [ 3181.0, 3181.0 ]
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b",
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 129.0, 520.0, 22.0, 18.0 ],
					"id" : "obj-1",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 395.0, 498.0, 50.0, 17.0 ],
					"id" : "obj-2",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"bgcolor" : [ 0.956863, 0.956863, 0.956863, 0.0 ],
					"patching_rect" : [ 283.0, 461.0, 167.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-3",
					"numinlets" : 2,
					"fontname" : "Arial",
					"bgcolor2" : [ 0.94902, 0.94902, 0.94902, 0.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 805.331177, 706.0, 61.0, 17.0 ],
					"id" : "obj-9",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 775.331177, 686.0, 61.0, 17.0 ],
					"id" : "obj-10",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mousefilter",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 58.0, 700.0, 66.0, 18.0 ],
					"id" : "obj-13",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 20",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 217.41304, 562.619995, 68.0, 18.0 ],
					"id" : "obj-15",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "voices $1",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 58.0, 723.0, 55.0, 16.0 ],
					"id" : "obj-16",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"outlettype" : [ "int" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 58.0, 676.0, 50.0, 18.0 ],
					"id" : "obj-17",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route stop resume int float bang play",
					"outlettype" : [ "", "", "", "", "", "", "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 97.0, 316.0, 173.0, 18.0 ],
					"id" : "obj-35",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 7
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "time between grains",
					"fontface" : 1,
					"fontsize" : 10.435669,
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 255.0, 604.0, 115.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-55",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "60",
					"outlettype" : [ "" ],
					"fontsize" : 14.249197,
					"patching_rect" : [ 129.0, 629.0, 29.0, 21.0 ],
					"id" : "obj-57",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "midinote $1 $2",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 129.0, 725.0, 75.0, 15.0 ],
					"id" : "obj-59",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 129.0, 704.0, 99.0, 18.0 ],
					"id" : "obj-60",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote 80 400",
					"outlettype" : [ "float", "float" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 129.0, 680.0, 101.0, 18.0 ],
					"id" : "obj-61",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ rgrain-mgd.maxpat 16 args #0",
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"fontface" : 1,
					"outlettype" : [ "signal", "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 129.0, 747.0, 216.0, 20.0 ],
					"id" : "obj-62",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-buffer-length",
					"fontsize" : 10.0,
					"patching_rect" : [ 305.0, 382.0, 99.0, 18.0 ],
					"id" : "obj-65",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "info~ #0-sample",
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 279.0, 361.0, 158.0, 18.0 ],
					"id" : "obj-66",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 8
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p make-grain-envelope",
					"color" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 236.0, 709.0, 114.0, 18.0 ],
					"id" : "obj-69",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 97.0, 71.0, 404.0, 434.0 ],
						"bglocked" : 1,
						"defrect" : [ 97.0, 71.0, 404.0, 434.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"outlettype" : [ "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 196.0, 31.0, 46.0, 17.0 ],
									"id" : "obj-67",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "peek~ #0-window",
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 80.0, 324.0, 135.0, 17.0 ],
									"id" : "obj-68",
									"numinlets" : 3,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "buffer~ #0-window 12",
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"outlettype" : [ "float", "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 80.0, 346.0, 138.0, 17.0 ],
									"id" : "obj-70",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 512",
									"outlettype" : [ "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 147.0, 147.0, 34.0, 17.0 ],
									"id" : "obj-1",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 511.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 126.0, 178.0, 38.0, 17.0 ],
									"id" : "obj-2",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 2.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 126.0, 201.0, 27.0, 17.0 ],
									"id" : "obj-3",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1.",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 186.0, 201.0, 23.0, 15.0 ],
									"id" : "obj-4",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b",
									"outlettype" : [ "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 186.0, 178.0, 23.0, 17.0 ],
									"id" : "obj-5",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "split 384 512",
									"outlettype" : [ "int", "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 126.0, 124.0, 70.0, 17.0 ],
									"id" : "obj-6",
									"numinlets" : 3,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "split 0 128",
									"outlettype" : [ "int", "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 78.0, 103.0, 58.0, 17.0 ],
									"id" : "obj-7",
									"numinlets" : 3,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 73.0, 40.0, 15.0, 15.0 ],
									"id" : "obj-8",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 2.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 78.0, 201.0, 27.0, 17.0 ],
									"id" : "obj-9",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Sqrt for two Overlap",
									"fontsize" : 9.160198,
									"patching_rect" : [ 229.0, 247.0, 127.0, 17.0 ],
									"id" : "obj-10",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr 0.5 * (1 + cos((3.14159 + 3.14159*2* $f1)))",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 78.0, 225.0, 278.0, 17.0 ],
									"id" : "obj-11",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr sqrt($f1)",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 151.0, 245.0, 75.0, 17.0 ],
									"id" : "obj-12",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "hanning",
									"fontsize" : 9.160198,
									"patching_rect" : [ 246.0, 207.0, 50.0, 17.0 ],
									"id" : "obj-13",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 39.0, 303.0, 15.0, 15.0 ],
									"id" : "obj-14",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"patching_rect" : [ 46.0, 33.0, 15.0, 15.0 ],
									"id" : "obj-15",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 511.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 78.0, 178.0, 38.0, 17.0 ],
									"id" : "obj-16",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "Uzi 512",
									"outlettype" : [ "bang", "bang", "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 46.0, 62.0, 43.0, 17.0 ],
									"id" : "obj-17",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 3
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 1",
									"outlettype" : [ "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 78.0, 83.0, 27.0, 17.0 ],
									"id" : "obj-18",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0.",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 39.0, 276.0, 49.0, 17.0 ],
									"id" : "obj-19",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-19", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-19", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-19", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 2 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-19", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-19", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-19", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"varname" : "-grains-time",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.435669,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"minimum" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 217.688034, 585.317017, 37.0, 18.0 ],
					"id" : "obj-71",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 20",
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 175.606003, 606.992981, 65.0, 18.0 ],
					"id" : "obj-73",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "buffer~ #0-sample #1",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 280.0, 315.0, 151.0, 18.0 ],
					"id" : "obj-74",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "name #0-sample 1",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 354.620911, 435.0, 110.0, 16.0 ],
					"id" : "obj-85",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "center",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"patching_rect" : [ 911.331055, 320.0, 35.0, 15.0 ],
					"id" : "obj-89",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "kslider",
					"outlettype" : [ "int", "int" ],
					"offset" : 24,
					"range" : 84,
					"patching_rect" : [ 962.331055, 398.0, 343.0, 34.0 ],
					"id" : "obj-91",
					"numinlets" : 2,
					"hkeycolor" : [ 0.541176, 0.172549, 0.235294, 1.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "linear playback",
					"fontface" : 1,
					"fontsize" : 13.914225,
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 121.0, 231.0, 111.0, 22.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-92",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1036.331055, 254.0, 18.0, 18.0 ],
					"id" : "obj-93",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "no pitch change",
					"outlettype" : [ "" ],
					"fontsize" : 10.0,
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"patching_rect" : [ 1036.331055, 231.0, 82.0, 16.0 ],
					"id" : "obj-94",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"size" : 127.0,
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.784314, 0.784314, 0.843137, 1.0 ],
					"patching_rect" : [ 1039.622437, 301.0, 252.0, 16.0 ],
					"id" : "obj-95",
					"numinlets" : 1,
					"orientation" : 1,
					"numoutlets" : 1,
					"knobcolor" : [ 0.541176, 0.172549, 0.235294, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set 1.",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 49.0, 339.0, 34.0, 15.0 ],
					"id" : "obj-96",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0,
					"patching_rect" : [ 48.0, 316.0, 50.0, 18.0 ],
					"id" : "obj-97",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess set 64",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 921.331055, 367.0, 77.0, 17.0 ],
					"id" : "obj-98",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "speed",
					"fontface" : 1,
					"fontsize" : 10.435669,
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 202.0, 389.0, 47.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-100",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 156.0, 378.0, 20.0, 20.0 ],
					"id" : "obj-101",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"mouseup" : 1,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 13.914225,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"minimum" : 0.0,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 203.0, 370.0, 48.0, 22.0 ],
					"id" : "obj-102",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #0-scrub-location",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 507.331177, 346.0, 110.0, 20.0 ],
					"id" : "obj-103",
					"numinlets" : 0,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p linear-playback",
					"linecount" : 2,
					"color" : [ 0.611765, 0.701961, 1.0, 1.0 ],
					"fontsize" : 10.0,
					"patching_rect" : [ 97.0, 424.0, 76.0, 29.0 ],
					"id" : "obj-104",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 358.0, 228.0, 579.0, 582.0 ],
						"bglocked" : 1,
						"defrect" : [ 358.0, 228.0, 579.0, 582.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "This section of the patch generates an automatic scan through the sample. By choosing a speed  greater than 1, then sample playback can be sped up without necessarily changing the pitch.",
									"linecount" : 2,
									"fontsize" : 9.160198,
									"patching_rect" : [ 71.0, 499.0, 409.0, 28.0 ],
									"id" : "obj-20",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "time to play full sample (0-1000) at chosen speed.",
									"linecount" : 3,
									"fontsize" : 9.160198,
									"patching_rect" : [ 344.0, 298.0, 106.0, 38.0 ],
									"id" : "obj-18",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "start at 0 (beg of sample)",
									"fontsize" : 9.160198,
									"patching_rect" : [ 353.0, 426.0, 112.0, 17.0 ],
									"id" : "obj-14",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Here is the actual length of the sample in milliseconds:",
									"linecount" : 3,
									"fontsize" : 9.160198,
									"patching_rect" : [ 347.0, 206.0, 106.0, 38.0 ],
									"id" : "obj-1",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r  #0-buffer-length",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 348.0, 247.0, 107.0, 17.0 ],
									"id" : "obj-65",
									"numinlets" : 0,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "<-- 1000 is used by rslider and pattr to  represent  the total  length of a sample.",
									"linecount" : 6,
									"fontsize" : 9.160198,
									"patching_rect" : [ 352.0, 92.0, 80.0, 70.0 ],
									"id" : "obj-26",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t f 0",
									"outlettype" : [ "float", "int" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 46.0, 194.5, 17.0 ],
									"id" : "obj-2",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "f",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 200.0, 266.0, 27.0, 17.0 ],
									"id" : "obj-3",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 159.0, 232.0, 60.0, 17.0 ],
									"id" : "obj-4",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 0.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 200.0, 288.0, 33.0, 17.0 ],
									"id" : "obj-5",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l b",
									"outlettype" : [ "", "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 367.0, 59.0, 17.0 ],
									"id" : "obj-6",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "timer",
									"outlettype" : [ "float", "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 312.0, 395.0, 42.0, 17.0 ],
									"id" : "obj-7",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"patching_rect" : [ 159.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-8",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : "(bang, resume) restarts playback"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(bang, resume) restarts playback",
									"linecount" : 4,
									"fontsize" : 9.160198,
									"patching_rect" : [ 174.0, 23.0, 48.0, 49.0 ],
									"id" : "obj-9",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "f",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 86.0, 438.0, 40.0, 17.0 ],
									"id" : "obj-10",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 86.0, 61.0, 34.0, 17.0 ],
									"id" : "obj-11",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"patching_rect" : [ 86.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-12",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : "(bang, stop) stop playback"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!/ 1.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 69.0, 35.0, 17.0 ],
									"id" : "obj-13",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 1000 1000.",
									"outlettype" : [ "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 335.0, 80.0, 17.0 ],
									"id" : "obj-15",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1000. f",
									"outlettype" : [ "float", "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 271.0, 90.0, 80.0, 17.0 ],
									"id" : "obj-16",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 1.",
									"outlettype" : [ "float" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 333.0, 278.0, 48.5, 17.0 ],
									"id" : "obj-17",
									"numinlets" : 2,
									"fontname" : "Arial",
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s #0-scrub-location",
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 460.0, 146.0, 17.0 ],
									"id" : "obj-19",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "float" ],
									"patching_rect" : [ 272.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-21",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : "(float) playback from begiining"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 0 5",
									"outlettype" : [ "", "" ],
									"fontsize" : 9.160198,
									"patching_rect" : [ 272.0, 433.0, 46.0, 17.0 ],
									"id" : "obj-22",
									"numinlets" : 3,
									"fontname" : "Arial",
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(bang, stop) stop playback",
									"linecount" : 2,
									"fontsize" : 9.160198,
									"patching_rect" : [ 14.0, 23.0, 68.0, 28.0 ],
									"id" : "obj-23",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(float) playback from begiining",
									"fontsize" : 9.160198,
									"patching_rect" : [ 296.0, 23.0, 145.0, 17.0 ],
									"id" : "obj-24",
									"numinlets" : 1,
									"fontname" : "Arial",
									"numoutlets" : 0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-10", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-19", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [ 457.0, 427.0, 281.5, 427.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 168.5, 325.0, 281.5, 325.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 1 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-65", 0 ],
									"destination" : [ "obj-17", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 1 ],
									"destination" : [ "obj-7", 1 ],
									"hidden" : 0,
									"midpoints" : [ 110.5, 389.0, 344.5, 389.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 10.0,
						"default_fontsize" : 10.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 1058.331055, 468.0, 36.0, 15.0 ],
					"id" : "obj-107",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 910.331055, 441.0, 35.0, 15.0 ],
					"id" : "obj-108",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "dial",
					"outlinecolor" : [ 0.882353, 0.882353, 0.882353, 1.0 ],
					"outlettype" : [ "float" ],
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"clip" : 0,
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 910.331055, 395.0, 40.0, 40.0 ],
					"id" : "obj-109",
					"numinlets" : 1,
					"fgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "64 64",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 1036.331055, 279.0, 45.0, 18.0 ],
					"id" : "obj-110",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "transpo",
					"fontface" : 1,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1045.331055, 201.0, 49.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-111",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-trans",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 1032.331055, 625.0, 68.0, 18.0 ],
					"id" : "obj-112",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-hi-trans",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 1032.331055, 647.0, 92.0, 18.0 ],
					"id" : "obj-113",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 1020.331055, 576.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-114",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 1074.331055, 551.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-115",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"outlettype" : [ "" ],
					"fontsize" : 9.160198,
					"patching_rect" : [ 492.331177, 403.0, 35.0, 15.0 ],
					"id" : "obj-116",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pan",
					"fontface" : 1,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 926.331055, 201.0, 30.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-117",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "duration",
					"fontface" : 1,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 819.331177, 201.0, 52.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-118",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 947.331055, 584.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-119",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 900.331055, 584.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-120",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 773.331177, 584.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-121",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 9.160198,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 811.331177, 584.0, 41.0, 17.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-122",
					"numinlets" : 1,
					"fontname" : "Arial",
					"cantchange" : 1,
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "pan-lo-hi",
					"outlettype" : [ "", "" ],
					"presentation_rect" : [ 324.0, 6.0, 20.0, 60.0 ],
					"patching_rect" : [ 893.622437, 556.0, 75.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-123",
					"numinlets" : 2,
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 690.331177, 600.0, 44.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-124",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"ignoreclick" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"patching_rect" : [ 613.331177, 598.0, 44.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-125",
					"numinlets" : 1,
					"fontname" : "Arial",
					"triangle" : 0,
					"numoutlets" : 2,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s  #0-hi-pan",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 904.331055, 647.0, 66.0, 18.0 ],
					"id" : "obj-126",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-pan",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 904.331055, 625.0, 63.0, 18.0 ],
					"id" : "obj-127",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s  #0-lo-dur",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 784.331177, 626.46405, 63.0, 18.0 ],
					"id" : "obj-128",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s  #0-hi-dur",
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"fontsize" : 10.435669,
					"patching_rect" : [ 784.331177, 647.0, 63.0, 18.0 ],
					"id" : "obj-129",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "location",
					"fontface" : 1,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 624.331177, 201.0, 53.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-132",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scrub",
					"fontface" : 1,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 511.024597, 201.0, 40.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-133",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ms",
					"fontface" : 1,
					"fontsize" : 10.435669,
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 256.0, 585.0, 32.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-134",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "transpo-lo-hi",
					"size" : 10000.0,
					"floatoutput" : 1,
					"outlettype" : [ "", "" ],
					"presentation_rect" : [ 346.0, 6.0, 20.0, 44.585316 ],
					"listmode" : 1,
					"patching_rect" : [ 1018.622437, 525.0, 95.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-135",
					"numinlets" : 2,
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "duration-lo-hi",
					"size" : 400.0,
					"outlettype" : [ "", "" ],
					"presentation_rect" : [ 368.0, 6.0, 20.0, 60.0 ],
					"patching_rect" : [ 773.622559, 556.0, 61.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-136",
					"numinlets" : 2,
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "(bang, float, stop, pause) linear playback (time stretching)",
					"linecount" : 3,
					"fontsize" : 9.160198,
					"patching_rect" : [ 117.0, 249.0, 108.0, 38.0 ],
					"id" : "obj-143",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "location-lo-hi",
					"size" : 1000.0,
					"outlettype" : [ "", "" ],
					"bgcolor" : [ 0.768627, 0.768627, 0.768627, 0.0 ],
					"presentation_rect" : [ 67.291382, 6.0, 254.19696, 62.090565 ],
					"patching_rect" : [ 606.622559, 469.0, 95.19696, 20.090565 ],
					"presentation" : 1,
					"bordercolor" : [ 0.623529, 0.584314, 0.556863, 1.0 ],
					"id" : "obj-8",
					"numinlets" : 2,
					"fgcolor" : [ 0.082353, 0.25098, 0.431373, 0.52549 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "waveform~",
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"fontsize" : 11.595187,
					"bgcolor" : [ 0.894118, 0.898039, 0.921569, 1.0 ],
					"tickmarkcolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"presentation_rect" : [ 67.291382, 6.0, 254.0, 62.0 ],
					"waveformcolor" : [ 0.219608, 0.231373, 0.309804, 1.0 ],
					"buffername" : "#0-sample",
					"labelbgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"labels" : 0,
					"patching_rect" : [ 504.622559, 470.0, 95.0, 20.0 ],
					"setmode" : 1,
					"selectioncolor" : [ 0.466667, 0.466667, 0.466667, 0.501961 ],
					"labeltextcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"presentation" : 1,
					"textcolor" : [  ],
					"id" : "obj-86",
					"numinlets" : 5,
					"ruler" : 0,
					"ticks" : 4,
					"grid" : 1.0,
					"numoutlets" : 6,
					"vticks" : 0,
					"frozen_box_attributes" : [ "buffername" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Bonus Feature",
					"fontface" : 3,
					"fontsize" : 10.0,
					"patching_rect" : [ 1050.331055, 763.0, 81.0, 18.0 ],
					"id" : "obj-162",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "use size message to set buffer~  the desired length, use this outlet to name record~, record a sound (in loop mode?) then granulate live.",
					"linecount" : 6,
					"fontface" : 3,
					"fontsize" : 10.0,
					"patching_rect" : [ 1020.331055, 781.0, 151.0, 75.0 ],
					"id" : "obj-137",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "averages the range to find center note",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 10.0,
					"frgb" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"patching_rect" : [ 1189.331055, 445.0, 77.0, 41.0 ],
					"textcolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-80",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Here are the values that are sent to the poly~. The #0- keeps them local, even inside the poly~.",
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 692.331177, 663.0, 548.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-142",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...set to a single value...",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 928.331055, 340.0, 64.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-155",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...or set to a range of values.",
					"linecount" : 4,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 928.331055, 483.0, 59.0, 62.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-156",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Pan range can be set to center...",
					"linecount" : 5,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 916.331055, 231.0, 57.0, 75.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-154",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "(To make the values compatible with a MIDI pitch wheel, 64 (D#) is used to indicate zero-transposition.",
					"linecount" : 2,
					"fontface" : 3,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1040.331055, 370.0, 259.0, 29.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-148",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "In that case, the center of the range is displayed on the \"ribbon controller\" and keyboard as a point of reference.",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 10.0,
					"frgb" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"patching_rect" : [ 1060.331055, 573.0, 241.0, 41.0 ],
					"textcolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-105",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...or you can use the rslider to define a range of transpositions.",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1116.331055, 523.0, 163.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-99",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...you can use the \"ribbon controller\" or a keybord to select a single transpostion value...",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1029.331055, 315.0, 270.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-28",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "You can reset it.",
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1133.331055, 230.0, 103.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-27",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Transposition range has several control options:",
					"linecount" : 2,
					"fontface" : 3,
					"fontsize" : 14.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1087.331055, 259.0, 179.0, 39.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-26",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.74902, 0.576471, 0.466667, 1.0 ],
					"patching_rect" : [ 606.814209, 616.784973, 641.85498, 64.677979 ],
					"rounded" : 10,
					"id" : "obj-106",
					"numinlets" : 1,
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "sample select",
					"fontface" : 3,
					"fontsize" : 16.233263,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 328.0, 287.0, 117.0, 25.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-70",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "granular DSP engine",
					"fontface" : 3,
					"fontsize" : 16.233263,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 199.0, 535.0, 185.0, 25.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-68",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 145.356628, 68.614716, 80.76503, 20.757032 ],
					"patching_rect" : [ 68.718384, 1599.843628, 124.0, 110.0 ],
					"presentation" : 1,
					"border" : 1,
					"rounded" : 0,
					"id" : "obj-231",
					"numinlets" : 1,
					"grad2" : [ 1.0, 1.0, 1.0, 0.0 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Replacing the sample sets the buffer~ to the sample's length, displays the sample's name, loads the waveform of the sample into the waveform~ object, and sends the sample's length throughout the patcher.",
					"linecount" : 6,
					"fontface" : 3,
					"fontsize" : 10.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 281.0, 189.0, 194.0, 75.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-167",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "In the poly~, the first arugment (after \"args\") is #0. Inside poly~, in  rgrain.maxpat, #1 is replaced by the number generated by #0 in this top-level patch.",
					"linecount" : 2,
					"fontface" : 3,
					"fontsize" : 12.0,
					"patching_rect" : [ 523.331177, 826.0, 482.0, 34.0 ],
					"id" : "obj-7",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Using the argument \"#0\" is a good way to ensure unique send-receive names within an instance of an abstraction,  and it even works when there is an abstraction within an abstraction (as in the poly~ within this rgrano). ",
					"linecount" : 3,
					"fontface" : 3,
					"fontsize" : 12.0,
					"patching_rect" : [ 523.331177, 777.0, 453.0, 48.0 ],
					"id" : "obj-6",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "for each parameter, there are two values: low and high. each rgrain instance chooses randomly between the two values.",
					"linecount" : 13,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 786.331177, 241.0, 77.0, 186.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-29",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "< & x",
					"fontsize" : 12.213597,
					"frgb" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"patching_rect" : [ 475.331177, 817.0, 39.0, 21.0 ],
					"textcolor" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"id" : "obj-30",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "granulator",
					"fontsize" : 14.939242,
					"frgb" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"patching_rect" : [ 400.331177, 790.0, 110.0, 28.0 ],
					"textcolor" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"id" : "obj-37",
					"numinlets" : 1,
					"fontname" : "Arial Black",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "double-click to see one grain voice",
					"fontface" : 3,
					"fontsize" : 10.435669,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 148.0, 769.0, 184.0, 18.0 ],
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-76",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "since changing the number of voices can be a time-consuming process, mousefilter ensures that it is done only after a mouse up.",
					"linecount" : 14,
					"fontface" : 2,
					"fontsize" : 10.435669,
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"patching_rect" : [ 59.0, 497.0, 64.0, 174.0 ],
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-145",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Location range is displayed and controlled by a named and transparent rslider. Underneath the rslider (in presentation mode), a waveform~ object displays the waveform of the sample.",
					"linecount" : 12,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 485.331177, 536.0, 127.0, 172.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-161",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Location within the sample is given as a value between 0.0 and 1.0, so you can load samples of various lengths without interrupting the workflow.",
					"linecount" : 4,
					"fontface" : 3,
					"fontsize" : 12.0,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 491.331177, 249.0, 259.0, 62.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-163",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"patching_rect" : [ 479.814209, 190.784973, 267.85498, 584.677979 ],
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"rounded" : 10,
					"id" : "obj-160",
					"numinlets" : 1,
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"patching_rect" : [ 761.814209, 190.784973, 102.85498, 584.677979 ],
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"rounded" : 10,
					"id" : "obj-77",
					"numinlets" : 1,
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"patching_rect" : [ 879.814087, 190.784973, 119.85498, 584.677979 ],
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"rounded" : 10,
					"id" : "obj-153",
					"numinlets" : 1,
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"patching_rect" : [ 1174.0, 687.0, 127.0, 174.0 ],
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"rounded" : 10,
					"id" : "obj-144",
					"numinlets" : 1,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"patching_rect" : [ 1011.814087, 190.784973, 289.85498, 565.677979 ],
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"rounded" : 10,
					"id" : "obj-90",
					"numinlets" : 1,
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"patching_rect" : [ 44.0, 228.0, 226.0, 232.0 ],
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"rounded" : 10,
					"id" : "obj-141",
					"numinlets" : 1,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"patching_rect" : [ 275.0, 185.0, 197.0, 303.0 ],
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"rounded" : 10,
					"id" : "obj-139",
					"numinlets" : 1,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"patching_rect" : [ 1013.0, 759.0, 214.0, 102.0 ],
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"rounded" : 10,
					"id" : "obj-149",
					"numinlets" : 1,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-189", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 3 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 2 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 1 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 50.5, 156.5, 195.5, 156.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 1 ],
					"destination" : [ "obj-177", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-138", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-81", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-81", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-81", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-120", 0 ],
					"destination" : [ "obj-127", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-459", 0 ],
					"destination" : [ "obj-331", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-198", 0 ],
					"destination" : [ "obj-136", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-193", 0 ],
					"destination" : [ "obj-8", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-313", 0 ],
					"destination" : [ "obj-312", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-377", 0 ],
					"destination" : [ "obj-627", 5 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-206", 0 ],
					"destination" : [ "obj-204", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 0 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-194", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-185", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-180", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-140", 0 ],
					"destination" : [ "obj-180", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-176", 0 ],
					"destination" : [ "obj-180", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-146", 0 ],
					"destination" : [ "obj-180", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-281", 0 ],
					"destination" : [ "obj-282", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-157", 0 ],
					"destination" : [ "obj-171", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-157", 0 ],
					"destination" : [ "obj-170", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-124", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-125", 0 ],
					"destination" : [ "obj-131", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-121", 0 ],
					"destination" : [ "obj-128", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-129", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-126", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-226", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-234", 0 ],
					"destination" : [ "obj-233", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-339", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-309", 0 ],
					"destination" : [ "obj-310", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-230", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-216", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-319", 0 ],
					"destination" : [ "obj-316", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-329", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-329", 0 ],
					"destination" : [ "obj-236", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-330", 0 ],
					"destination" : [ "obj-329", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-217", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-216", 0 ],
					"destination" : [ "obj-217", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-213", 0 ],
					"destination" : [ "obj-680", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-205", 0 ],
					"destination" : [ "obj-192", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-204", 0 ],
					"destination" : [ "obj-192", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-192", 0 ],
					"destination" : [ "obj-191", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-197", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-196", 0 ],
					"destination" : [ "obj-197", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-187", 0 ],
					"destination" : [ "obj-188", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 0 ],
					"destination" : [ "obj-180", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-181", 1 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 1 ],
					"destination" : [ "obj-179", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-182", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 1 ],
					"destination" : [ "obj-181", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-183", 0 ],
					"destination" : [ "obj-182", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-183", 0 ],
					"destination" : [ "obj-181", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 0 ],
					"destination" : [ "obj-178", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 0 ],
					"destination" : [ "obj-179", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 67.5, 742.0, 138.5, 742.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-173", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-152", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 1 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-151", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-120", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 1 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 1 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 0 ],
					"destination" : [ "obj-121", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 1 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-171", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-170", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-116", 0 ],
					"hidden" : 0,
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 1 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-159", 0 ],
					"destination" : [ "obj-124", 0 ],
					"hidden" : 0,
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-125", 0 ],
					"hidden" : 0,
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-171", 0 ],
					"destination" : [ "obj-159", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-171", 1 ],
					"destination" : [ "obj-159", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-170", 0 ],
					"destination" : [ "obj-158", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-170", 1 ],
					"destination" : [ "obj-158", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-102", 0 ],
					"hidden" : 0,
					"midpoints" : [ 58.5, 363.0, 212.5, 363.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 1 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [ 421.5, 357.0, 288.5, 357.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-109", 0 ],
					"destination" : [ "obj-108", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 6 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-108", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"color" : [ 0.87451, 0.25098, 0.717647, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 0 ],
					"destination" : [ "obj-93", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-110", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 7 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"midpoints" : [ 427.5, 391.660278, 414.0, 391.660278, 414.0, 405.0, 303.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-104", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-102", 0 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 1 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-73", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 3 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 2 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 4 ],
					"destination" : [ "obj-101", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.166672, 347.0, 165.5, 347.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 1 ],
					"destination" : [ "obj-104", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-104", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 5 ],
					"destination" : [ "obj-101", 0 ],
					"hidden" : 0,
					"midpoints" : [ 234.833328, 350.0, 165.5, 350.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-89", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 0 ],
					"destination" : [ "obj-166", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 1 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-116", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 603.331177, 437.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-164", 0 ],
					"destination" : [ "obj-86", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [ 364.120911, 449.0, 475.0, 449.0, 475.0, 464.0, 514.122559, 464.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [ 303.5, 456.0, 440.5, 456.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-174", 1 ],
					"destination" : [ "obj-175", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-175", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 1,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-174", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-168", 0 ],
					"destination" : [ "obj-174", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-168", 1 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 1 ],
					"destination" : [ "obj-115", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1056.5, 573.0, 1070.165527, 573.0, 1070.165527, 547.0, 1083.831055, 547.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 1 ],
					"destination" : [ "obj-113", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 1 ],
					"destination" : [ "obj-165", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-195", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-195", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-582", 0 ],
					"destination" : [ "obj-187", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 7 ],
					"destination" : [ "obj-582", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-202", 0 ],
					"destination" : [ "obj-200", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-200", 1 ],
					"destination" : [ "obj-209", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-202", 0 ],
					"destination" : [ "obj-204", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-201", 0 ],
					"destination" : [ "obj-202", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-204", 1 ],
					"destination" : [ "obj-205", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-205", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-204", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-209", 0 ],
					"destination" : [ "obj-135", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-200", 0 ],
					"destination" : [ "obj-135", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-345", 0 ],
					"destination" : [ "obj-202", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-336", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-211", 0 ],
					"destination" : [ "obj-215", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-203", 0 ],
					"destination" : [ "obj-207", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-208", 0 ],
					"destination" : [ "obj-203", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-597", 0 ],
					"destination" : [ "obj-211", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-207", 0 ],
					"destination" : [ "obj-597", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-215", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-395", 0 ],
					"destination" : [ "obj-396", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-396", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-226", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-314", 0 ],
					"destination" : [ "obj-317", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-317", 0 ],
					"destination" : [ "obj-318", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-325", 0 ],
					"destination" : [ "obj-319", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-325", 0 ],
					"destination" : [ "obj-317", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-314", 0 ],
					"destination" : [ "obj-325", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-310", 0 ],
					"destination" : [ "obj-314", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-331", 0 ],
					"destination" : [ "obj-229", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-331", 0 ],
					"destination" : [ "obj-230", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-679", 0 ],
					"destination" : [ "obj-627", 6 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-679", 0 ],
					"destination" : [ "obj-627", 7 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-680", 1 ],
					"destination" : [ "obj-627", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-627", 0 ],
					"destination" : [ "obj-683", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-627", 0 ],
					"destination" : [ "obj-684", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 0 ],
					"destination" : [ "obj-684", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-230", 0 ],
					"destination" : [ "obj-683", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-230", 0 ],
					"destination" : [ "obj-228", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 0 ],
					"destination" : [ "obj-227", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-178", 0 ],
					"destination" : [ "obj-229", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-181", 0 ],
					"destination" : [ "obj-229", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 0 ],
					"destination" : [ "obj-230", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-179", 0 ],
					"destination" : [ "obj-230", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-233", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-312", 0 ],
					"destination" : [ "obj-342", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-282", 0 ],
					"destination" : [ "obj-336", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 1 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-216", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-316", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-318", 0 ],
					"destination" : [ "obj-38", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-316", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-216", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-543", 0 ],
					"destination" : [ "obj-627", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-210", 0 ],
					"destination" : [ "obj-200", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-184", 0 ],
					"destination" : [ "obj-183", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-335", 0 ],
					"destination" : [ "obj-330", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-138", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-683", 0 ],
					"destination" : [ "obj-212", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-684", 0 ],
					"destination" : [ "obj-218", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-218", 0 ],
					"destination" : [ "obj-509", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-212", 0 ],
					"destination" : [ "obj-509", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-190", 0 ],
					"destination" : [ "obj-219", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-219", 0 ],
					"destination" : [ "obj-220", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-220", 0 ],
					"destination" : [ "obj-212", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-220", 0 ],
					"destination" : [ "obj-218", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ],
		"parameters" : 		{
			"obj-75" : [ "buffergrab[1]", "buffergrab", 0 ],
			"obj-78" : [ "buffergrab[2]", "buffergrab", 0 ],
			"obj-79" : [ "buffergrab[3]", "buffergrab", 0 ],
			"obj-64" : [ "buffergrab[0]", "buffergrab[0]", 0 ]
		}

	}

}
