{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 4.0, 44.0, 1276.0, 730.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
		"bglocked" : 0,
		"defrect" : [ 4.0, 44.0, 1276.0, 730.0 ],
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
					"text" : "unpack a b c i",
					"patching_rect" : [ 1560.0, 432.0, 77.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-23",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack a b c i",
					"patching_rect" : [ 1472.0, 432.0, 77.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-16",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---led_row",
					"patching_rect" : [ 3056.0, 264.0, 65.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-91",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 3040.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-71",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 3040.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-87",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/clipchopper/led_row",
					"patching_rect" : [ 3056.0, 216.0, 111.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-119",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s/led_row",
					"patching_rect" : [ 3040.0, 192.0, 99.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-134",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /null/led",
					"patching_rect" : [ 3040.0, 288.0, 91.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-145",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 3040.0, 240.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-147",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LED_row output",
					"patching_rect" : [ 3064.0, 144.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-93",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u269001118",
					"text" : "pattr",
					"patching_rect" : [ 1640.0, 96.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-27",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"initial" : [ "/clipchopper" ]
					}
,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "AppPrefix",
							"parameter_invisible" : 1,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "AppPrefix",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ "/clipchopper" ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u752001122",
					"text" : "pattr",
					"patching_rect" : [ 1152.0, 280.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-8",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"initial" : [ 8080 ]
					}
,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "DestPort",
							"parameter_invisible" : 1,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "DestPort",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 8080 ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u851001126",
					"text" : "pattr",
					"patching_rect" : [ 1024.0, 280.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-2",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"initial" : [ "localhost" ]
					}
,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "HostName",
							"parameter_invisible" : 1,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "HostName",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ "localhost" ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 1688.0, 144.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-64",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---press",
					"patching_rect" : [ 56.0, 264.0, 54.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-182",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 1704.0, 96.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-59",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 1688.0, 96.0, 16.0, 16.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-57",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"presentation_rect" : [ 235.0, 113.0, 16.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"varname" : "AppPrefix",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 1688.0, 120.0, 120.0, 16.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-20",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "", "int", "", "" ],
					"fontsize" : 10.0,
					"presentation_rect" : [ 169.0, 128.0, 92.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 1888.0, 40.0, 55.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-293",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel all",
					"patching_rect" : [ 1944.0, 40.0, 38.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-292",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "2",
					"patching_rect" : [ 1968.0, 64.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-291",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 1944.0, 64.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-289",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"patching_rect" : [ 1944.0, 88.0, 39.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-287",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set cable orientation  of All devices",
					"linecount" : 2,
					"patching_rect" : [ 2472.0, 136.0, 112.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-286",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set prefix of All devices",
					"patching_rect" : [ 2136.0, 144.0, 128.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-282",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2456.0, 136.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-279",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2456.0, 168.0, 50.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-278",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.764706, 0.819608, 0.572549, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2120.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-277",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 2120.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-273",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/cable 0",
					"patching_rect" : [ 2472.0, 216.0, 88.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-272",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/prefix /clipchopper",
					"patching_rect" : [ 2136.0, 216.0, 137.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-270",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /sys/cable %s",
					"patching_rect" : [ 2456.0, 192.0, 109.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-267",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /sys/prefix %s",
					"patching_rect" : [ 2120.0, 192.0, 111.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-263",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 1376.0, 648.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-260",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---led_clear",
					"patching_rect" : [ 1376.0, 672.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-262",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"patching_rect" : [ 1456.0, 648.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-249",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hint" : "Bang when Auto-Focus obtained.",
					"annotation" : "Bang when Auto-Focus obtained.",
					"patching_rect" : [ 1456.0, 672.0, 25.0, 25.0 ],
					"numinlets" : 1,
					"id" : "obj-257",
					"numoutlets" : 0,
					"comment" : "Bang when Auto-Focus obtained."
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---connect_bang",
					"patching_rect" : [ 1488.0, 672.0, 97.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-258",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"patching_rect" : [ 1328.0, 576.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-243",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "== 2",
					"patching_rect" : [ 1328.0, 552.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-247",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---connection_mode",
					"patching_rect" : [ 1328.0, 528.0, 113.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-248",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 0 1",
					"patching_rect" : [ 1448.0, 624.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-237",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 1512.0, 552.0, 25.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-51",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 1560.0, 552.0, 25.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-128",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 1448.0, 528.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-19",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 2",
					"patching_rect" : [ 776.0, 16.0, 65.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-7",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Get Track this device resides on bang if same as selected track",
					"linecount" : 4,
					"patching_rect" : [ 1456.0, 232.0, 96.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-52",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Get Selected Track",
					"patching_rect" : [ 1560.0, 216.0, 104.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-26",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Live Focus",
					"patching_rect" : [ 1456.0, 216.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-15",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i1 == $i2 then 1 else 0",
					"patching_rect" : [ 1560.0, 504.0, 127.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-70",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Monome Display",
					"patching_rect" : [ 568.0, 224.0, 88.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-56",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 27.0, 0.0, 88.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---connect_bang",
					"patching_rect" : [ 1128.0, 240.0, 97.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-32",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---set_device_prefix",
					"patching_rect" : [ 1704.0, 168.0, 113.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-11",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.path",
					"patching_rect" : [ 1456.0, 336.0, 51.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-5",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 2",
					"patching_rect" : [ 1448.0, 576.0, 146.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-47",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 1560.0, 480.0, 32.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-349",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1560.0, 456.0, 50.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-351",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1560.0, 360.0, 58.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-353",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "getpath",
					"patching_rect" : [ 1560.0, 384.0, 47.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-354",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.object",
					"patching_rect" : [ 1560.0, 408.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-355",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1560.0, 288.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-357",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property selected_track",
					"patching_rect" : [ 1560.0, 312.0, 123.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-360",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 1560.0, 336.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-364",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.path",
					"patching_rect" : [ 1560.0, 264.0, 51.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-365",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "goto path live_set view",
					"patching_rect" : [ 1560.0, 240.0, 120.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-366",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 1456.0, 280.0, 55.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-367",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1472.0, 456.0, 50.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-369",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1472.0, 360.0, 58.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-371",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "getpath",
					"patching_rect" : [ 1472.0, 384.0, 47.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-372",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.object",
					"patching_rect" : [ 1472.0, 408.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-373",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "path this_device canonical_parent",
					"linecount" : 2,
					"patching_rect" : [ 1456.0, 304.0, 93.0, 27.0 ],
					"numinlets" : 2,
					"id" : "obj-374",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "active",
					"patching_rect" : [ 1512.0, 504.0, 39.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-54",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "App Prefix",
					"patching_rect" : [ 1752.0, 48.0, 72.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-53",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 170.0, 112.0, 64.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"hint" : "LED messages to be sent to monome.",
					"annotation" : "LED messages to be sent to monome.",
					"patching_rect" : [ 352.0, 264.0, 25.0, 25.0 ],
					"numinlets" : 0,
					"id" : "obj-49",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "LED messages to be sent to monome."
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hint" : "Press messages from monome.",
					"annotation" : "Press messages from monome.",
					"patching_rect" : [ 120.0, 616.0, 24.0, 24.0 ],
					"numinlets" : 1,
					"id" : "obj-46",
					"numoutlets" : 0,
					"comment" : "Press messages from monome."
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Original Auto Focus\nby Stretta\nstretta.blogspot.com",
					"linecount" : 3,
					"patching_rect" : [ 16.0, 160.0, 253.0, 55.0 ],
					"numinlets" : 1,
					"id" : "obj-44",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Original Auto Configuration v.1\nby Loop Party\nwww.loop-party.com",
					"linecount" : 3,
					"patching_rect" : [ 16.0, 88.0, 254.0, 55.0 ],
					"numinlets" : 1,
					"id" : "obj-42",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Monome Handling Myr\nDeveloped by Myralfur\nmyralfur@mothersagainstnoise.com",
					"linecount" : 3,
					"patching_rect" : [ 16.0, 16.0, 255.0, 55.0 ],
					"numinlets" : 1,
					"id" : "obj-18",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---connection_mode",
					"patching_rect" : [ 832.0, 288.0, 114.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-168",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set dest port",
					"patching_rect" : [ 1824.0, 240.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-157",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set host name",
					"patching_rect" : [ 1736.0, 240.0, 80.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-153",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set Local Port and receive press messages",
					"linecount" : 2,
					"patching_rect" : [ 1272.0, 64.0, 150.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-148",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Create OSC Config message",
					"patching_rect" : [ 1688.0, 32.0, 150.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-146",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---connect_bang",
					"patching_rect" : [ 808.0, 504.0, 97.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-139",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---dest_port",
					"patching_rect" : [ 896.0, 408.0, 74.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-135",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---host_name",
					"patching_rect" : [ 808.0, 408.0, 82.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-130",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---dest_port",
					"patching_rect" : [ 1824.0, 264.0, 73.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-124",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---host_name",
					"patching_rect" : [ 1720.0, 264.0, 80.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-127",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---prefix_press",
					"patching_rect" : [ 1368.0, 240.0, 87.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-83",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---prefix_press",
					"patching_rect" : [ 1944.0, 240.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-76",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/clipchopper/press",
					"patching_rect" : [ 1960.0, 216.0, 136.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-48",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Auto Focus",
					"linecount" : 2,
					"patching_rect" : [ 744.0, 104.0, 59.0, 29.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-45",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 168.0, 32.0, 63.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---local_port",
					"patching_rect" : [ 1688.0, 16.0, 75.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-41",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---cable_orientation",
					"patching_rect" : [ 904.0, 480.0, 112.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-40",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---cable_orientation",
					"patching_rect" : [ 2456.0, 16.0, 110.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-38",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---local_port",
					"patching_rect" : [ 1352.0, 192.0, 77.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-37",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---connect_bang",
					"patching_rect" : [ 1272.0, 96.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-36",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---device_id",
					"patching_rect" : [ 1864.0, 16.0, 73.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-35",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---device_id",
					"patching_rect" : [ 824.0, 480.0, 74.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-33",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Find routing apps and get the port and hostname",
					"linecount" : 2,
					"patching_rect" : [ 864.0, 64.0, 155.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-34",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---press",
					"patching_rect" : [ 1272.0, 288.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-28",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js oscroute.js",
					"patching_rect" : [ 1272.0, 264.0, 123.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-24",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---device_prefix",
					"patching_rect" : [ 1768.0, 16.0, 91.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-21",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Create random prefix number and prepend to app prefix",
					"linecount" : 2,
					"patching_rect" : [ 1456.0, 64.0, 152.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-17",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---led_col",
					"patching_rect" : [ 2896.0, 264.0, 62.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-10",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Change this message box to your desired prefix",
					"linecount" : 4,
					"patching_rect" : [ 1552.0, 112.0, 80.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-89",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Known Issues:\n1. If you don't have an audio device selected in Live (ie. there is a 'the audio engine is off' message at the bottom of Live), Auto configuration will not connect. This is some weirdo Live thing.\n2. Prefix is psuedo random (1 in 10000 probability of getting the same number). This is because there is no persistant variable associated with devices that can survive after save/load in Live.",
					"linecount" : 7,
					"patching_rect" : [ 1688.0, 608.0, 388.0, 87.0 ],
					"numinlets" : 1,
					"id" : "obj-110",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---led_clear",
					"patching_rect" : [ 3176.0, 16.0, 71.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-314",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.toggle",
					"annotation" : "monome focus indication",
					"varname" : "AutoFocusState",
					"patching_rect" : [ 1448.0, 600.0, 16.0, 16.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"parameter_enable" : 1,
					"id" : "obj-316",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"presentation_rect" : [ 234.0, 48.0, 15.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "AutoFocusState",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "AutoFocusState",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0 ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"annotation" : "sets monome focus mode. Track = focus when track is selected. Plug-in = focus when click inside plug in windo (not title bar)",
					"varname" : "AutoFocus",
					"patching_rect" : [ 1448.0, 504.0, 56.0, 15.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"pictures" : [  ],
					"parameter_enable" : 1,
					"id" : "obj-317",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"presentation_rect" : [ 170.0, 48.0, 60.508801, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "AutoFocus",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "AutoFocus",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "off", "plugin", "track" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0 ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---led_cropped",
					"patching_rect" : [ 2752.0, 264.0, 87.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-312",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Cable",
					"patching_rect" : [ 904.0, 440.0, 40.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-309",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 232.0, 146.0, 40.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---device_id",
					"patching_rect" : [ 1944.0, 16.0, 73.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-306",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---connect_bang",
					"patching_rect" : [ 2024.0, 16.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-301",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 3176.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-211",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 3176.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-212",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2880.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-213",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 2880.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-214",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2736.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-215",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 2736.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-216",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 1944.0, 144.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-217",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set prefix for button presses",
					"linecount" : 2,
					"patching_rect" : [ 1968.0, 136.0, 81.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-218",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 1944.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-219",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2640.0, 168.0, 50.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-223",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.764706, 0.819608, 0.572549, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"patching_rect" : [ 2584.0, 144.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-225",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2584.0, 120.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-226",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "all",
					"patching_rect" : [ 2584.0, 168.0, 50.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-227",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"patching_rect" : [ 2264.0, 144.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-229",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "all",
					"patching_rect" : [ 2264.0, 168.0, 50.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-230",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 2264.0, 120.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-231",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 2320.0, 168.0, 120.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-232",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"bgcolor" : [ 0.929412, 0.584314, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set cable orientation  of a specific device",
					"linecount" : 2,
					"patching_rect" : [ 2616.0, 120.0, 112.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-238",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/cable all 0",
					"patching_rect" : [ 2600.0, 216.0, 120.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-239",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set prefix of a specific device",
					"patching_rect" : [ 2288.0, 120.0, 152.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-244",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/prefix all /clipchopper",
					"patching_rect" : [ 2280.0, 216.0, 168.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-245",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /sys/prefix %s %s",
					"patching_rect" : [ 2264.0, 192.0, 128.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-246",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/clipchopper/clear",
					"patching_rect" : [ 3192.0, 216.0, 136.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-250",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s/clear",
					"patching_rect" : [ 3176.0, 192.0, 85.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-251",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/clipchopper/led_col",
					"patching_rect" : [ 2896.0, 216.0, 144.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-252",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s/led_col",
					"patching_rect" : [ 2880.0, 192.0, 96.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-253",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/clipchopper/led",
					"patching_rect" : [ 2752.0, 216.0, 128.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-254",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s/led",
					"patching_rect" : [ 2736.0, 192.0, 76.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-255",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---set_device_prefix",
					"patching_rect" : [ 2128.0, 16.0, 111.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-256",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend localhost 8080",
					"patching_rect" : [ 1688.0, 432.0, 124.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-261",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /null/led",
					"patching_rect" : [ 2880.0, 288.0, 91.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-264",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 2880.0, 240.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-265",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LED_col output",
					"patching_rect" : [ 2904.0, 144.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-266",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"annotation" : "sets monome cable orientation",
					"varname" : "CableOrient",
					"patching_rect" : [ 904.0, 456.0, 42.0, 15.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"pictures" : [  ],
					"parameter_enable" : 1,
					"id" : "obj-268",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"presentation_rect" : [ 264.0, 146.0, 46.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "CableOrient",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "CableOrient",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "left", "up", "right", "down" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend /null/led",
					"patching_rect" : [ 2736.0, 288.0, 91.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-274",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 2736.0, 240.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-276",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /sys/cable %s %s",
					"patching_rect" : [ 2584.0, 192.0, 127.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-295",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s/press",
					"patching_rect" : [ 1944.0, 192.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-283",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LED output",
					"patching_rect" : [ 2760.0, 144.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-284",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LED Clear",
					"patching_rect" : [ 3200.0, 144.0, 62.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-285",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u451001154",
					"text" : "pattr",
					"patching_rect" : [ 1296.0, 120.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-94",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0,
					"saved_object_attributes" : 					{
						"parameter_enable" : 1,
						"initial" : [ 8000 ]
					}
,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 3,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "LocalPort",
							"parameter_invisible" : 1,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "LocalPort",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 8000 ]
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 100",
					"patching_rect" : [ 1064.0, 240.0, 56.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-1",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 3 1",
					"patching_rect" : [ 912.0, 216.0, 59.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-3",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 3 1",
					"patching_rect" : [ 832.0, 216.0, 59.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-6",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 848.0, 16.0, 55.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-12",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b b b",
					"patching_rect" : [ 848.0, 40.0, 349.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-14",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "bang", "bang", "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 100",
					"patching_rect" : [ 1688.0, 48.0, 56.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-22",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---device_prefix",
					"patching_rect" : [ 1456.0, 144.0, 93.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-25",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clipchopper",
					"patching_rect" : [ 1536.0, 96.0, 67.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-29",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /%ld%s",
					"patching_rect" : [ 1456.0, 120.0, 77.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-30",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "random 9999",
					"patching_rect" : [ 1456.0, 96.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-31",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "If the oscbonjour object is showing up as a brown type colour then it means that you have not installed the max external files from the address above. The external files go in the /Max/Patches directory.",
					"linecount" : 4,
					"patching_rect" : [ 288.0, 72.0, 290.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-108",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "The oscbonjour external used in this implementation is made by Remy Muller and can be downloaded from here: http://recherche.ircam.fr/equipes/temps-reel/movement/muller/index.php?entry=entry060616-173626",
					"linecount" : 4,
					"patching_rect" : [ 288.0, 16.0, 288.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-39",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8000",
					"patching_rect" : [ 1272.0, 240.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-73",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s b b",
					"patching_rect" : [ 1688.0, 240.0, 40.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-50",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 1272.0, 168.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-58",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "port 8000",
					"patching_rect" : [ 1288.0, 216.0, 93.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-60",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b",
					"patching_rect" : [ 1064.0, 216.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-61",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "/sys/oscconfig <prefix> <local port> <device id> <hostname/IP> ",
					"patching_rect" : [ 1688.0, 456.0, 328.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-69",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Device",
					"patching_rect" : [ 808.0, 440.0, 48.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-90",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 264.0, 112.0, 42.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"varname" : "DeviceID",
					"patching_rect" : [ 808.0, 456.0, 31.0, 15.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"pictures" : [  ],
					"parameter_enable" : 1,
					"id" : "obj-275",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"presentation_rect" : [ 264.0, 128.0, 46.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "DeviceID",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "DeviceID",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "all", "0", "1", "2", "3", "4", "5", "6", "7" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b",
					"patching_rect" : [ 976.0, 120.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-97",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Device ID - is used for future use to support multiple monomes. \n\nFourth argument (hostname/IP) - is for third party registration, or for routing devices that cant get IP addresses from inbound packets. (ie. a router built in Max/MSP). This should remain unused in nearly all cases, when connecting to MonoRoute this field should remain empty (ie. connected to a blank message object).",
					"linecount" : 7,
					"patching_rect" : [ 1688.0, 512.0, 384.0, 87.0 ],
					"numinlets" : 1,
					"id" : "obj-98",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Manual Settings",
					"patching_rect" : [ 1096.0, 216.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-100",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "This is the new oscconfig message that was created to make auto configuration work.",
					"linecount" : 2,
					"patching_rect" : [ 1688.0, 480.0, 328.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-129",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 848.0, 240.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-136",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 928.0, 240.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-138",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend port",
					"patching_rect" : [ 1272.0, 192.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-143",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Host Name",
					"patching_rect" : [ 1080.0, 288.0, 67.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-154",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 234.0, 80.0, 61.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Dest",
					"patching_rect" : [ 1200.0, 288.0, 32.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-156",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 202.0, 80.0, 32.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 808.0, 168.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-158",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 3 1",
					"patching_rect" : [ 896.0, 384.0, 59.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-159",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 3 1",
					"patching_rect" : [ 808.0, 384.0, 59.5, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-160",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 1064.0, 328.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-163",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"patching_rect" : [ 1184.0, 328.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-164",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "port 8080",
					"patching_rect" : [ 1808.0, 288.0, 77.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-165",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "host localhost",
					"patching_rect" : [ 1704.0, 288.0, 89.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-167",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set localhost",
					"patching_rect" : [ 1080.0, 264.0, 72.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-169",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set 8080",
					"patching_rect" : [ 1184.0, 264.0, 50.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-170",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"varname" : "HostName",
					"text" : "localhost",
					"wordwrap" : 0,
					"patching_rect" : [ 1064.0, 304.0, 88.0, 21.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"autoscroll" : 0,
					"id" : "obj-172",
					"fontname" : "Arial Bold",
					"clickmode" : 1,
					"numoutlets" : 4,
					"keymode" : 1,
					"outlettype" : [ "", "int", "", "" ],
					"fontsize" : 10.0,
					"bangmode" : 1,
					"presentation_rect" : [ 234.0, 96.0, 78.0, 16.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "offset 32",
					"patching_rect" : [ 776.0, 40.0, 52.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-174",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend host",
					"patching_rect" : [ 1064.0, 352.0, 74.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-175",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend port",
					"patching_rect" : [ 1184.0, 352.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-176",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "radiogroup",
					"patching_rect" : [ 808.0, 64.0, 19.0, 98.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-177",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"offset" : 32,
					"presentation_rect" : [ 144.0, 0.0, 18.0, 98.0 ],
					"itemtype" : 0,
					"size" : 3,
					"value" : 2,
					"disabled" : [ 0, 0, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"varname" : "DestPort",
					"text" : "8080",
					"wordwrap" : 0,
					"patching_rect" : [ 1184.0, 304.0, 47.0, 21.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-178",
					"fontname" : "Arial Bold",
					"clickmode" : 1,
					"numoutlets" : 4,
					"keymode" : 1,
					"outlettype" : [ "", "int", "", "" ],
					"fontsize" : 10.0,
					"bangmode" : 1,
					"presentation_rect" : [ 202.0, 96.0, 31.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Manual Configuration",
					"linecount" : 3,
					"patching_rect" : [ 744.0, 136.0, 59.0, 41.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-179",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 168.0, 64.0, 112.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Auto Configuration",
					"linecount" : 3,
					"patching_rect" : [ 744.0, 64.0, 59.0, 41.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-180",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 168.0, 0.0, 109.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 1272.0, 120.0, 20.0, 20.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-181",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"presentation_rect" : [ 282.0, 64.0, 17.0, 17.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/oscconfig /7957clipchopper 8000",
					"patching_rect" : [ 1704.0, 216.0, 219.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-183",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"varname" : "LocalPort",
					"text" : "8000",
					"wordwrap" : 0,
					"patching_rect" : [ 1272.0, 144.0, 43.0, 19.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-184",
					"fontname" : "Arial Bold",
					"clickmode" : 1,
					"numoutlets" : 4,
					"keymode" : 1,
					"outlettype" : [ "", "int", "", "" ],
					"fontsize" : 10.0,
					"bangmode" : 1,
					"presentation_rect" : [ 170.0, 96.0, 31.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/7957clipchopper",
					"patching_rect" : [ 1688.0, 72.0, 112.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-185",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"patching_rect" : [ 1824.0, 168.0, 49.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-186",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend host",
					"patching_rect" : [ 832.0, 264.0, 74.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-187",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route host",
					"patching_rect" : [ 848.0, 144.0, 59.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-188",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend port",
					"patching_rect" : [ 912.0, 264.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-189",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route port",
					"patching_rect" : [ 912.0, 144.0, 58.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-191",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Local",
					"patching_rect" : [ 1320.0, 144.0, 40.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-192",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 170.0, 80.0, 40.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set 8000",
					"patching_rect" : [ 1344.0, 120.0, 50.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-259",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf /sys/oscconfig %s %ld %s %s",
					"patching_rect" : [ 1688.0, 192.0, 186.0, 18.0 ],
					"numinlets" : 4,
					"id" : "obj-193",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend resolve",
					"patching_rect" : [ 896.0, 96.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-194",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"patching_rect" : [ 976.0, 144.0, 105.0, 17.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-197",
					"fontname" : "Arial",
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 9.0,
					"presentation_rect" : [ 170.0, 16.0, 132.0, 17.0 ],
					"types" : [  ],
					"items" : "<empty>"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "browse",
					"patching_rect" : [ 848.0, 96.0, 46.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-198",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "oscbonjour",
					"patching_rect" : [ 848.0, 120.0, 65.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-199",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i i",
					"patching_rect" : [ 512.0, 336.0, 56.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-79",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---monomesize_list",
					"patching_rect" : [ 576.0, 336.0, 109.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-68",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "16 16",
					"patching_rect" : [ 632.0, 312.0, 36.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-67",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "8 16",
					"patching_rect" : [ 592.0, 312.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-66",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---monomesize_height",
					"patching_rect" : [ 544.0, 360.0, 125.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-65",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Display correct monome matrix",
					"patching_rect" : [ 512.0, 408.0, 160.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-62",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf script hide monome%spressmatrix",
					"patching_rect" : [ 576.0, 568.0, 211.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-161",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf script hide monome%sledmatrix",
					"patching_rect" : [ 560.0, 592.0, 198.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-92",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_symbol",
					"patching_rect" : [ 512.0, 424.0, 128.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-80",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 672.0, 288.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-63",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf script show monome%spressmatrix",
					"patching_rect" : [ 544.0, 616.0, 216.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-84",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome64ledmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 264.0, 312.0, 72.0, 72.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"invisiblebkgnd" : 1,
					"id" : "obj-9",
					"numoutlets" : 2,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"ignoreclick" : 1,
					"rows" : 8,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome128vledmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 264.0, 392.0, 72.0, 144.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-86",
					"numoutlets" : 2,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"ignoreclick" : 1,
					"rows" : 16,
					"presentation_rect" : [ 1.0, 24.0, 72.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome256ledmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 352.0, 392.0, 144.0, 144.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-13",
					"columns" : 16,
					"numoutlets" : 2,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"ignoreclick" : 1,
					"rows" : 16,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome128hledmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 352.0, 312.0, 144.0, 72.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-78",
					"columns" : 16,
					"numoutlets" : 2,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"ignoreclick" : 1,
					"rows" : 8,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 72.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Monome press",
					"patching_rect" : [ 16.0, 224.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-125",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---matrix_clear",
					"patching_rect" : [ 176.0, 264.0, 86.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-95",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"patching_rect" : [ 176.0, 288.0, 34.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-101",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 16.0, 264.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-102",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_int",
					"patching_rect" : [ 16.0, 240.0, 106.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-103",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 4",
					"patching_rect" : [ 16.0, 288.0, 59.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-106",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 4",
					"patching_rect" : [ 16.0, 592.0, 73.0, 18.0 ],
					"numinlets" : 5,
					"id" : "obj-107",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 16.0, 568.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-112",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_int",
					"patching_rect" : [ 16.0, 544.0, 106.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-113",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---press_cropped",
					"patching_rect" : [ 16.0, 616.0, 101.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-114",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---matrix_clear",
					"patching_rect" : [ 416.0, 264.0, 86.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-85",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"patching_rect" : [ 416.0, 288.0, 34.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-82",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 264.0, 264.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-75",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_int",
					"patching_rect" : [ 264.0, 240.0, 106.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-77",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 4",
					"patching_rect" : [ 264.0, 288.0, 59.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-74",
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 4",
					"patching_rect" : [ 264.0, 592.0, 73.0, 18.0 ],
					"numinlets" : 5,
					"id" : "obj-72",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---led_clear",
					"patching_rect" : [ 672.0, 312.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-81",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 264.0, 568.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-155",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_int",
					"patching_rect" : [ 264.0, 544.0, 106.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-150",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---led_cropped",
					"patching_rect" : [ 264.0, 616.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-149",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---monomesize_width",
					"patching_rect" : [ 512.0, 384.0, 121.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-144",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "16 8",
					"patching_rect" : [ 552.0, 312.0, 32.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-140",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "8 8",
					"patching_rect" : [ 512.0, 312.0, 32.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-141",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 0 1 2 3",
					"patching_rect" : [ 512.0, 288.0, 152.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-142",
					"fontname" : "Arial Bold",
					"numoutlets" : 5,
					"outlettype" : [ "bang", "bang", "bang", "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Monome led",
					"patching_rect" : [ 264.0, 224.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-137",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---monomesize_int",
					"patching_rect" : [ 696.0, 288.0, 107.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-133",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---monomesize_symbol",
					"patching_rect" : [ 528.0, 264.0, 130.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-132",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l l b b b b",
					"patching_rect" : [ 512.0, 448.0, 98.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-131",
					"fontname" : "Arial Bold",
					"numoutlets" : 6,
					"outlettype" : [ "", "", "bang", "bang", "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispatcher",
					"patching_rect" : [ 512.0, 664.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-123",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0,
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "256",
					"patching_rect" : [ 592.0, 544.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-122",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "128v",
					"patching_rect" : [ 608.0, 520.0, 33.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-121",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "128h",
					"patching_rect" : [ 624.0, 496.0, 33.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-120",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf script show monome%sledmatrix",
					"patching_rect" : [ 528.0, 640.0, 203.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-111",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "64",
					"patching_rect" : [ 640.0, 472.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-109",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"varname" : "livemenu_monomesize",
					"patching_rect" : [ 512.0, 240.0, 48.0, 15.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"pictures" : [  ],
					"parameter_enable" : 1,
					"id" : "obj-104",
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"presentation_rect" : [ 194.0, 147.0, 40.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_type" : 2,
							"parameter_initial_enable" : 0,
							"parameter_shortname" : "MonomeSize",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "MonomeSize",
							"parameter_modmin" : 0.0,
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_enum" : [ "64", "128h", "128v", "256" ],
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 127.0,
							"parameter_mmin" : 0.0
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Size",
					"patching_rect" : [ 512.0, 224.0, 32.0, 18.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-96",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0,
					"presentation_rect" : [ 168.0, 146.0, 32.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---led",
					"patching_rect" : [ 304.0, 264.0, 42.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-4",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 592.0, 16.0, 16.0, 16.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-241",
					"numoutlets" : 0,
					"presentation_rect" : [ 0.0, 0.0, 144.0, 168.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 592.0, 40.0, 16.0, 16.0 ],
					"presentation" : 1,
					"numinlets" : 1,
					"id" : "obj-43",
					"numoutlets" : 0,
					"presentation_rect" : [ 162.0, 0.0, 155.0, 168.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome64pressmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 16.0, 312.0, 72.0, 72.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"invisiblebkgnd" : 1,
					"id" : "obj-118",
					"numoutlets" : 2,
					"background" : 1,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"rows" : 8,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome128hpressmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 104.0, 312.0, 144.0, 72.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-116",
					"columns" : 16,
					"numoutlets" : 2,
					"background" : 1,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"rows" : 8,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 72.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome256pressmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 104.0, 392.0, 144.0, 144.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-117",
					"columns" : 16,
					"numoutlets" : 2,
					"background" : 1,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"rows" : 16,
					"presentation_rect" : [ 1.0, 24.0, 144.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"varname" : "monome128vpressmatrix",
					"clickedimage" : 0,
					"horizontalmargin" : 0,
					"patching_rect" : [ 16.0, 392.0, 72.0, 144.0 ],
					"presentation" : 1,
					"cellpict" : "step1.png",
					"numinlets" : 1,
					"scale" : 0,
					"invisiblebkgnd" : 1,
					"id" : "obj-115",
					"numoutlets" : 2,
					"background" : 1,
					"verticalmargin" : 0,
					"bkgndpict" : "MatrixDefaultBkgnd.pct",
					"outlettype" : [ "list", "list" ],
					"horizontalspacing" : 2,
					"rows" : 16,
					"presentation_rect" : [ 1.0, 24.0, 72.0, 144.0 ],
					"inactiveimage" : 0,
					"verticalspacing" : 2,
					"hidden" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 1 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1087.0, 236.0, 1137.5, 236.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-188", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [ 817.5, 165.0, 1073.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-367", 0 ],
					"destination" : [ "obj-366", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1465.5, 300.0, 1556.0, 300.0, 1556.0, 236.0, 1569.5, 236.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 1 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-80", 0 ],
					"destination" : [ "obj-131", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 1 ],
					"destination" : [ "obj-132", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-87", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-145", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-147", 0 ],
					"destination" : [ "obj-145", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-145", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-134", 0 ],
					"destination" : [ "obj-147", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-134", 0 ],
					"destination" : [ "obj-119", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-134", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-264", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-165", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-274", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-264", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-283", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-251", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-263", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-267", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-246", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-295", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-227", 0 ],
					"destination" : [ "obj-295", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-223", 0 ],
					"destination" : [ "obj-295", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-295", 0 ],
					"destination" : [ "obj-239", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-232", 0 ],
					"destination" : [ "obj-246", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-230", 0 ],
					"destination" : [ "obj-246", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-246", 0 ],
					"destination" : [ "obj-245", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-193", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-193", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-193", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-193", 0 ],
					"destination" : [ "obj-183", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-193", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-193", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 1 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-185", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-185", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-74", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-181", 0 ],
					"destination" : [ "obj-184", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 1 ],
					"destination" : [ "obj-167", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 2 ],
					"destination" : [ "obj-165", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-30", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-197", 1 ],
					"destination" : [ "obj-194", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1028.5, 165.0, 1085.0, 165.0, 1085.0, 92.0, 905.5, 92.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-194", 0 ],
					"destination" : [ "obj-199", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-198", 0 ],
					"destination" : [ "obj-199", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 2 ],
					"destination" : [ "obj-97", 0 ],
					"hidden" : 0,
					"midpoints" : [ 903.5, 138.0, 971.0, 138.0, 971.0, 116.0, 985.5, 116.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 2 ],
					"destination" : [ "obj-197", 0 ],
					"hidden" : 0,
					"midpoints" : [ 903.5, 140.0, 985.5, 140.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 0 ],
					"destination" : [ "obj-191", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 0 ],
					"destination" : [ "obj-188", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-314", 0 ],
					"destination" : [ "obj-211", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-217", 0 ],
					"destination" : [ "obj-219", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-215", 0 ],
					"destination" : [ "obj-216", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-213", 0 ],
					"destination" : [ "obj-214", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-211", 0 ],
					"destination" : [ "obj-212", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-197", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-143", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-138", 0 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-158", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-174", 0 ],
					"destination" : [ "obj-177", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-170", 0 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-163", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-163", 0 ],
					"destination" : [ "obj-175", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-178", 0 ],
					"destination" : [ "obj-164", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-164", 0 ],
					"destination" : [ "obj-176", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-143", 0 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-259", 0 ],
					"destination" : [ "obj-184", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 1 ],
					"destination" : [ "obj-184", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-133", 0 ],
					"hidden" : 0,
					"midpoints" : [ 521.5, 284.0, 705.5, 284.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [ 521.5, 284.0, 681.5, 284.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-142", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-111", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 0 ],
					"destination" : [ "obj-111", 0 ],
					"hidden" : 0,
					"midpoints" : [ 521.5, 504.0, 537.5, 504.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [ 553.5, 636.0, 521.0, 636.0, 521.0, 660.0, 521.5, 660.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 1 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"midpoints" : [ 537.400024, 496.0, 553.5, 496.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 613.0, 521.0, 613.0, 521.0, 660.0, 521.5, 660.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-121", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 617.5, 540.0, 569.0, 540.0, 569.0, 594.0, 569.5, 594.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-120", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 633.5, 516.0, 569.0, 516.0, 569.0, 594.0, 569.5, 594.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-109", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 492.0, 569.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 601.5, 565.0, 569.5, 565.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-161", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [ 585.5, 589.0, 521.0, 589.0, 521.0, 660.0, 521.5, 660.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-161", 0 ],
					"hidden" : 0,
					"midpoints" : [ 601.5, 565.0, 585.5, 565.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-121", 0 ],
					"destination" : [ "obj-161", 0 ],
					"hidden" : 0,
					"midpoints" : [ 617.5, 540.0, 585.5, 540.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-120", 0 ],
					"destination" : [ "obj-161", 0 ],
					"hidden" : 0,
					"midpoints" : [ 633.5, 516.0, 585.5, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-109", 0 ],
					"destination" : [ "obj-161", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 492.0, 585.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 1 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-144", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-140", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-141", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-140", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-141", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-142", 3 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-142", 2 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-142", 1 ],
					"destination" : [ "obj-140", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 5 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [ 601.0, 468.0, 649.5, 468.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 4 ],
					"destination" : [ "obj-120", 0 ],
					"hidden" : 0,
					"midpoints" : [ 585.099976, 472.0, 633.5, 472.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 3 ],
					"destination" : [ "obj-121", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.200012, 480.0, 617.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 2 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 553.299988, 487.0, 601.5, 487.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-74", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-155", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-155", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-142", 0 ],
					"destination" : [ "obj-141", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-102", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-102", 0 ],
					"destination" : [ "obj-106", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-72", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 1 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-72", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 2 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 0 ],
					"destination" : [ "obj-72", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 3 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-72", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-118", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 0 ],
					"destination" : [ "obj-118", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-118", 0 ],
					"destination" : [ "obj-107", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-116", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 1 ],
					"destination" : [ "obj-116", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-116", 0 ],
					"destination" : [ "obj-107", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-115", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 2 ],
					"destination" : [ "obj-115", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-115", 0 ],
					"destination" : [ "obj-107", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 3 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 0 ],
					"destination" : [ "obj-107", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-230", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-227", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-268", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-223", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-226", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-184", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-276", 0 ],
					"destination" : [ "obj-274", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-265", 0 ],
					"destination" : [ "obj-264", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-312", 0 ],
					"destination" : [ "obj-274", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-283", 0 ],
					"destination" : [ "obj-48", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-219", 0 ],
					"destination" : [ "obj-283", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-255", 0 ],
					"destination" : [ "obj-276", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-255", 0 ],
					"destination" : [ "obj-254", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-216", 0 ],
					"destination" : [ "obj-255", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-253", 0 ],
					"destination" : [ "obj-265", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-253", 0 ],
					"destination" : [ "obj-252", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-214", 0 ],
					"destination" : [ "obj-253", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-251", 0 ],
					"destination" : [ "obj-250", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-212", 0 ],
					"destination" : [ "obj-251", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 0 ],
					"destination" : [ "obj-230", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 1 ],
					"destination" : [ "obj-232", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-231", 0 ],
					"destination" : [ "obj-229", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-225", 1 ],
					"destination" : [ "obj-223", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-225", 0 ],
					"destination" : [ "obj-227", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-226", 0 ],
					"destination" : [ "obj-225", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-283", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-24", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-127", 0 ],
					"destination" : [ "obj-167", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-124", 0 ],
					"destination" : [ "obj-165", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-181", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-275", 0 ],
					"destination" : [ "obj-139", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-187", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-138", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-191", 0 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-189", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-160", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-160", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-187", 0 ],
					"destination" : [ "obj-160", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-159", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-159", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 0 ],
					"destination" : [ "obj-159", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-174", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-176", 0 ],
					"destination" : [ "obj-159", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-175", 0 ],
					"destination" : [ "obj-160", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-372", 0 ],
					"destination" : [ "obj-373", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-371", 1 ],
					"destination" : [ "obj-373", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-353", 1 ],
					"destination" : [ "obj-355", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-354", 0 ],
					"destination" : [ "obj-355", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-364", 0 ],
					"destination" : [ "obj-353", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-360", 0 ],
					"destination" : [ "obj-364", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-357", 1 ],
					"destination" : [ "obj-364", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-365", 0 ],
					"destination" : [ "obj-357", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-366", 0 ],
					"destination" : [ "obj-365", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 1 ],
					"destination" : [ "obj-371", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-374", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-367", 0 ],
					"destination" : [ "obj-374", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-371", 0 ],
					"destination" : [ "obj-372", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-357", 0 ],
					"destination" : [ "obj-360", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-353", 0 ],
					"destination" : [ "obj-354", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-351", 0 ],
					"destination" : [ "obj-349", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-316", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-349", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-349", 1 ],
					"destination" : [ "obj-70", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-177", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-317", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-128", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-128", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-51", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-47", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-128", 0 ],
					"destination" : [ "obj-47", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 1 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-128", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-248", 0 ],
					"destination" : [ "obj-247", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-249", 0 ],
					"destination" : [ "obj-257", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-237", 1 ],
					"destination" : [ "obj-249", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-260", 0 ],
					"destination" : [ "obj-262", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-237", 0 ],
					"destination" : [ "obj-260", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-316", 0 ],
					"destination" : [ "obj-237", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-243", 0 ],
					"destination" : [ "obj-316", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-243", 1 ],
					"destination" : [ "obj-260", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-247", 0 ],
					"destination" : [ "obj-243", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-263", 0 ],
					"destination" : [ "obj-270", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-267", 0 ],
					"destination" : [ "obj-272", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-273", 0 ],
					"destination" : [ "obj-263", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-277", 0 ],
					"destination" : [ "obj-273", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-278", 0 ],
					"destination" : [ "obj-267", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-279", 0 ],
					"destination" : [ "obj-278", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-292", 0 ],
					"destination" : [ "obj-289", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-292", 1 ],
					"destination" : [ "obj-291", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-289", 0 ],
					"destination" : [ "obj-287", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-291", 0 ],
					"destination" : [ "obj-287", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-293", 0 ],
					"destination" : [ "obj-289", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-292", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-217", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-217", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-277", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-231", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-279", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-226", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-215", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-215", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 0 ],
					"destination" : [ "obj-213", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-287", 1 ],
					"destination" : [ "obj-213", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-278", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-279", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-275", 1 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-273", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-212", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-214", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-216", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-219", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-256", 0 ],
					"destination" : [ "obj-232", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-301", 0 ],
					"destination" : [ "obj-287", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-249", 1 ],
					"destination" : [ "obj-258", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 0 ],
					"destination" : [ "obj-106", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-149", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 1 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-143", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 2 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-198", 0 ],
					"hidden" : 0,
					"midpoints" : [ 967.666687, 61.0, 857.5, 61.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 3 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-373", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 3 ],
					"destination" : [ "obj-369", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-355", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 3 ],
					"destination" : [ "obj-351", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-369", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-101", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ],
		"parameters" : 		{
			"obj-94" : [ "LocalPort", "LocalPort", 0 ],
			"obj-104" : [ "MonomeSize", "MonomeSize", 0 ],
			"obj-27" : [ "AppPrefix", "AppPrefix", 0 ],
			"obj-8" : [ "DestPort", "DestPort", 0 ],
			"obj-275" : [ "DeviceID", "DeviceID", 0 ],
			"obj-2" : [ "HostName", "HostName", 0 ],
			"obj-316" : [ "AutoFocusState", "AutoFocusState", 0 ],
			"obj-317" : [ "AutoFocus", "AutoFocus", 0 ],
			"obj-268" : [ "CableOrient", "CableOrient", 0 ]
		}

	}

}
