{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 784.0, 938.0, 805.0, 175.0 ],
		"bgcolor" : [ 0.309804, 0.309804, 0.309804, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 831.0, 277.5, 35.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "16.", "8.", "4.", "2.", "1." ],
							"parameter_initial" : [ 2 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_shortname" : "timebase",
							"parameter_longname" : "timebase",
							"parameter_linknames" : 1,
							"parameter_order" : 25,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "timebase"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-120",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 457.0, 71.0, 15.0 ],
					"text" : "storagewindow"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-116",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 239.75, 578.0, 57.0, 15.0 ],
					"text" : "init_storage"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-114",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 860.0, 80.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 16,
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 16.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 1 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "BaseTime",
							"parameter_modmax" : 16.0,
							"parameter_longname" : "BaseTime",
							"parameter_modmin" : 1.0,
							"parameter_linknames" : 1,
							"parameter_units" : "note",
							"parameter_order" : 56,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "BaseTime"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 25.0, 69.0, 354.0, 373.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 238.5, 191.0, 101.0, 20.0 ],
									"text" : "send ---timebase"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 311.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-114",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 198.0, 83.5, 30.0, 17.0 ],
									"text" : "* 4."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "float" ],
									"patching_rect" : [ 50.0, 170.0, 169.0, 17.0 ],
									"text" : "unpack 0. 0."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-116",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 145.0, 167.0, 17.0 ],
									"text" : "pak 1. 1."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-118",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 220.0, 66.0, 17.0 ],
									"text" : "append ticks"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-120",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 50.0, 191.0, 170.0, 17.0 ],
									"text" : "* 1."
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"id" : "obj-121",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 96.5, 65.0, 17.0 ],
									"text" : "loadmess 1n"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"frozen_object_attributes" : 									{
										"listen" : 0
									}
,
									"id" : "obj-122",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 120.5, 121.0, 17.0 ],
									"text" : "translate notevalues ticks"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 9.0,
									"frozen_object_attributes" : 									{
										"lock" : 1
									}
,
									"id" : "obj-124",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 50.0, 245.916687, 96.0, 17.0 ],
									"text" : "phasor~ 1n @lock 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-125",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 198.0, 40.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-116", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 207.5, 118.208344, 248.0, 118.208344 ],
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-120", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-115", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-120", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-115", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-115", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-116", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-124", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-118", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-120", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-122", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-121", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-116", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-122", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-124", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-125", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 839.0, 302.0, 46.0, 17.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p phasor"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 621.25, 302.0, 57.0, 17.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 425.5, 326.0, 42.0, 17.0 ],
					"text" : "s ---ppq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 425.5, 302.0, 46.0, 17.0 ],
					"text" : "change",
					"varname" : "transport_change"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 162.0, 559.0, 68.0, 17.0 ],
					"text" : "prepend alt_in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 162.0, 537.0, 39.0, 18.0 ],
					"text" : "r ---alt",
					"varname" : "pipe[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "live.tab",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 690.25, 246.5, 60.5, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 165.0, 130.0, 356.0, 11.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "live.tab[1]",
							"parameter_longname" : "polyselector",
							"parameter_linknames" : 1,
							"parameter_order" : 2000
						}

					}
,
					"varname" : "polyselector"
				}

			}
, 			{
				"box" : 				{
					"args" : [ "Hex" ],
					"clickthrough" : 1,
					"embed" : 1,
					"id" : "obj-112",
					"lockeddragscroll" : 1,
					"maxclass" : "bpatcher",
					"name" : "mod_b995.maxpat",
					"numinlets" : 5,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 734.0, 1237.0, 226.0, 23.0 ],
						"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-6",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 384.0, 184.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-10",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 292.0, 184.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-9",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 199.0, 184.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-8",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 106.5, 184.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-7",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.0, 184.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 384.0, 78.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 331.0, 78.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 278.0, 77.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 225.0, 78.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 173.0, 78.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 14.0, 72.0, 123.0, 17.0 ],
									"text" : "funnel 3"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 118.0, 12.0, 46.0, 17.0 ],
									"text" : "freebang"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-154",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "int", "int" ],
									"patching_rect" : [ 14.0, 10.0, 71.0, 17.0 ],
									"text" : "live.thisdevice"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-158",
									"maxclass" : "newobj",
									"numinlets" : 8,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 14.0, 150.0, 389.0, 17.0 ],
									"saved_object_attributes" : 									{
										"filename" : "mod_b995.js",
										"parameter_enable" : 0
									}
,
									"text" : "js mod_b995.js #1 --- #2 #3 #4 #5 #6 #7 #8 #9",
									"varname" : "js"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.819608, 0.819608, 0.819608, 0.0 ],
									"background" : 1,
									"bordercolor" : [ 0.219608, 0.235294, 0.243137, 1.0 ],
									"focusbordercolor" : [ 0.219608, 0.235294, 0.243137, 1.0 ],
									"fontface" : 0,
									"fontsize" : 20.0,
									"hltcolor" : [ 0.858824, 0.6, 0.0, 0.0 ],
									"id" : "obj-151",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 120.0, 112.0, 38.0, 26.0 ],
									"pictures" : [ "Block1.png", "Block2.png", "Block3.png", "Block4.png", "Block5.png", "Block6.png", "Block7.png", "Block8.png", "Block1A.png", "Block2A.png", "Block3A.png", "Block4A.png", "Block5A.png", "Block6A.png", "Block7A.png", "Block8A.png", "Block0.png" ],
									"presentation" : 1,
									"presentation_rect" : [ -1.0, -1.0, 41.0, 26.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_enum" : [ "Block1", "Block2", "Block3", "Block4", "Block5", "Block6", "Block7", "Block8", "Block1A", "Block2A", "Block3A", "Block4A", "Block5A", "Block6A", "Block7A", "Block8A", "Block0" ],
											"parameter_initial" : [ 16 ],
											"parameter_type" : 2,
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_shortname" : "client",
											"parameter_longname" : "client",
											"parameter_linknames" : 1,
											"parameter_defer" : 1
										}

									}
,
									"textcolor" : [ 0.219608, 0.235294, 0.243137, 1.0 ],
									"tricolor" : [ 0.34902, 0.34902, 0.34902, 0.0 ],
									"usepicture" : 1,
									"varname" : "client"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-151", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-154", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-154", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-158", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 4 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 5 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 6 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 7 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 223.0, 526.0, 226.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 5.0, 29.0, 26.0 ],
					"prototypename" : "mod"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1011.5, 526.0, 65.0, 18.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-108",
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1011.5, 481.0, 25.0, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-109",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 927.5, 80.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_exponent" : 4.0,
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 10000.0,
							"parameter_mmin" : 5.0,
							"parameter_initial" : [ 480 ],
							"parameter_type" : 0,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "GlobSpeed",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "GlobSpeed",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_modmode" : 4,
							"parameter_units" : "ticks",
							"parameter_order" : 56,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "GlobSpeed"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-106",
					"linecount" : 4,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 933.5, 277.5, 114.0, 49.0 ],
					"text" : "window flags zoom, window flags nofloat, window flags grow, window exec"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 211.0, 356.0, 231.0, 52.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 15.0, 110.0, 119.0, 18.0 ],
									"text" : "prepend detect_device"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-108",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 39.0, 182.0, 109.0, 18.0 ],
									"text" : "prepend set_devices"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 132.0, 15.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 132.0, 56.0, 69.0, 20.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Select a DrumRack in Live, then press this button.  Hex will lock it's device controls to that DrumRack.",
									"id" : "obj-18",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 15.0, 15.0, 100.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 15.0, 10.0, 203.0, 32.0 ],
									"rounded" : 0.0,
									"text" : "Capture Currently Selected Instrument",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 39.0, 285.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frozen_object_attributes" : 									{
										"invisible" : 1
									}
,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 39.0, 149.0, 79.0, 20.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_initial" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "devices",
											"parameter_order" : 1999,
											"parameter_shortname" : "devices",
											"parameter_type" : 3
										}

									}
,
									"saved_object_attributes" : 									{
										"annotation_name" : "",
										"initial" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
										"parameter_enable" : 1
									}
,
									"text" : "pattr devices",
									"varname" : "devices"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-108", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 24.5, 259.5, 48.5, 259.5 ],
									"source" : [ "obj-5", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 949.0, 526.0, 56.0, 18.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p devices",
					"varname" : "devices"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-104",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 995.0, 80.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "I", "II", "III", "IV", "V", "VI", "VII" ],
							"parameter_unitstyle" : 9,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 1,
							"parameter_shortname" : "PolyOffset",
							"parameter_longname" : "PolyOffset",
							"parameter_linknames" : 1,
							"parameter_units" : "steps",
							"parameter_order" : 22,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "PolyOffset"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-103",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1062.5, 80.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "I", "II", "III", "IV", "V", "VI", "VII" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_shortname" : "Mode",
							"parameter_longname" : "Mode",
							"parameter_linknames" : 1,
							"parameter_units" : "''",
							"parameter_order" : 21,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Mode"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-107",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 590.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 143.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "Plug", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 16.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_shortname" : "Channel",
							"parameter_longname" : "Channel",
							"parameter_linknames" : 1,
							"parameter_units" : "''",
							"parameter_order" : 23,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Channel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 391.0, 48.0, 18.0 ],
					"text" : "gate 1 0",
					"varname" : "rotgate"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 331.0, 360.0, 114.0, 18.0 ],
					"text" : "prepend rotate_wheel"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 567.0, 659.0, 82.0, 18.0 ],
					"text" : "prepend speed"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 16,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 567.0, 640.0, 393.5, 18.0 ],
					"text" : "funnel 16"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-92",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 941.5, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 732.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed16",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed16",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 55,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed16"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Random velocity value for all notes",
					"id" : "obj-94",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 916.5, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 668.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed15",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed15",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 54
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed15"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Part's swing value",
					"id" : "obj-95",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 891.5, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 604.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed14",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed14",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 53,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed14"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Timing interval for repeat button",
					"id" : "obj-96",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 866.5, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed13",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed13",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 52,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed13"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "",
					"id" : "obj-97",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 841.5, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 731.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed12",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed12",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 51,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed12"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-23",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 817.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 669.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed11",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed11",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 50,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed11"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Random velocity value for all notes",
					"id" : "obj-74",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 792.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 605.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed10",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed10",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 49
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed10"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Part's swing value",
					"id" : "obj-78",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 767.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed9",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed9",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 48,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed9"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "Timing interval for repeat button",
					"id" : "obj-79",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 742.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 732.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed8",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed8",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 47,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed8"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "",
					"id" : "obj-85",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 717.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 668.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed7",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed7",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 46,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed7"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"hint" : "",
					"id" : "obj-86",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 692.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 604.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed6",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed6",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 45
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed6"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"id" : "obj-87",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 667.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed5",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed5",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 44,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed5"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"id" : "obj-88",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 642.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 731.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed4",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed4",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 43,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed4"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"id" : "obj-89",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 617.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 669.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed3",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed3",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 42,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed3"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"id" : "obj-90",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 592.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 605.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed2",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed2",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 41
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed2"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hidden" : 1,
					"id" : "obj-91",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 567.0, 603.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_steps" : 128,
							"parameter_enum" : [ "1/64", "1/63", "1/62", "1/61", "1/60", "1/59", "1/58", "1/57", "1/56", "1/55", "1/54", "1/53", "1/52", "1/51", "1/50", "1/49", "1/48", "1/47", "1/46", "1/45", "1/44", "1/43", "1/42", "1/41", "1/40", "1/39", "1/38", "1/37", "1/36", "1/35", "1/34", "1/33", "1/32", "1/31", "1/30", "1/29", "1/28", "1/27", "1/26", "1/25", "1/24", "1/23", "1/22", "1/21", "1/20", "1/19", "1/18", "1/17", "1/16", "1/15", "1/14", "1/13", "1/12", "1/11", "1/10", "1/9", "1/8", "1/7", "1/6", "1/5", "1/4", "1/3", "1/2", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64" ],
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 128.0,
							"parameter_mmin" : 1.0,
							"parameter_initial" : [ 4 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "Speed1",
							"parameter_modmax" : 10000.0,
							"parameter_longname" : "Speed1",
							"parameter_modmin" : 5.0,
							"parameter_linknames" : 1,
							"parameter_units" : "div",
							"parameter_order" : 40,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Speed1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-73",
					"linecount" : 7,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 949.0, 360.0, 95.0, 83.0 ],
					"text" : "window flags nozoom, window flags float, window flags nogrow, window flags nomenu, window exec"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 949.0, 334.0, 56.0, 18.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-78",
									"maxclass" : "number",
									"maximum" : 16,
									"minimum" : 1,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 97.0, 100.0, 50.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-74",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 95.0, 132.0, 100.0, 16.0 ],
									"text" : "copy 1 $1, store $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-73",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 43.0, 16.0 ],
									"text" : "store 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-79",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 67.5, 208.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-78", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 892.0, 236.0, 67.0, 18.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p preset init"
				}

			}
, 			{
				"box" : 				{
					"bgoncolor" : [ 0.0, 0.776471, 0.117647, 1.0 ],
					"bgoveroncolor" : [ 0.0, 0.776471, 0.007843, 1.0 ],
					"border" : 1,
					"fontname" : "Arial Bold",
					"fontsize" : 8.0,
					"hint" : "Allow playback of note automation arriving at Hex's MIDI input (such as is generated by rec).",
					"id" : "obj-77",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 941.0, 160.0, 32.007812, 17.199219 ],
					"presentation" : 1,
					"presentation_rect" : [ 396.0, 19.0, 27.007812, 9.199219 ],
					"rounded" : 0.0,
					"text" : "play",
					"texton" : "play",
					"varname" : "play"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 223.0, 673.0, 90.5, 18.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 73.0, 640.0, 104.0, 18.0 ],
					"text" : "prepend set_device"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"frozen_object_attributes" : 					{
						"invisible" : 1
					}
,
					"id" : "obj-62",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 73.0, 616.0, 67.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "device",
							"parameter_order" : 1000,
							"parameter_shortname" : "device",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"initial" : [ 0 ],
						"parameter_enable" : 1
					}
,
					"text" : "pattr device",
					"varname" : "device"
				}

			}
, 			{
				"box" : 				{
					"bgoncolor" : [ 0.819608, 0.007843, 0.007843, 1.0 ],
					"bgoveroncolor" : [ 0.819608, 0.007843, 0.007843, 1.0 ],
					"border" : 1,
					"fontname" : "Arial Bold",
					"fontsize" : 8.0,
					"hint" : "Record automation of performed sequence to a clip in the current track",
					"id" : "obj-28",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 890.0, 160.0, 27.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 396.0, 8.0, 27.0, 9.0 ],
					"rounded" : 0.0,
					"text" : "rec",
					"texton" : "rec",
					"varname" : "record"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 223.0, 652.0, 50.0, 17.0 ],
					"text" : "r ---restart"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 223.0, 696.0, 65.0, 18.0 ],
					"text" : "loadmess 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 223.0, 720.0, 71.0, 17.0 ],
					"text" : "v ---aggression"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 295.0, 697.0, 190.0, 18.0 ],
					"text" : "loadmess 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 295.0, 720.0, 69.0, 17.0 ],
					"text" : "v ---resonance"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 841.5, 474.0, 50.0, 18.0 ],
					"text" : "pcontrol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-49",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 841.5, 455.0, 34.0, 16.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 152.0, 62.0, 404.0, 557.0 ],
						"bgcolor" : [ 0.2, 0.2, 0.2, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 20.0, 20.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 304.0, 464.0, 111.0, 17.0 ],
									"text" : "prepend behavegraph_in"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-111",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 270.5, 523.5, 104.5, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 126.0, 103.0, 109.0, 20.0 ],
									"text" : "Poly Output Port",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-103",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 288.5, 616.0, 78.0, 17.0 ],
									"text" : "prepend midiport"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"frozen_object_attributes" : 									{
										"invisible" : 1
									}
,
									"id" : "obj-104",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 270.5, 568.5, 59.0, 17.0 ],
									"restore" : [ "Off" ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "outport[2]",
											"parameter_order" : 100,
											"parameter_shortname" : "outport",
											"parameter_type" : 3
										}

									}
,
									"saved_object_attributes" : 									{
										"annotation_name" : "",
										"parameter_enable" : 1
									}
,
									"text" : "pattr outport",
									"varname" : "outport[2]"
								}

							}
, 							{
								"box" : 								{
									"arrow" : 0,
									"arrowframe" : 0,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"framecolor" : [ 0.298039, 0.298039, 0.298039, 1.0 ],
									"id" : "obj-105",
									"items" : [ "Off", ",", "IAC Driver IAC Bus 1", ",", "Cntrl_r Controls", ",", "Cntrl_r Port 2", ",", "block Controls", ",", "block Port 2", ",", "to Max 1", ",", "to Max 2" ],
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 247.5, 593.5, 100.0, 18.0 ],
									"pattrmode" : 1,
									"presentation" : 1,
									"presentation_rect" : [ 240.0, 103.0, 119.0, 18.0 ],
									"rounded" : 0,
									"varname" : "lh_output_port"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Helvetica",
									"fontsize" : 10.0,
									"id" : "obj-102",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.5, 568.5, 56.0, 16.0 ],
									"text" : "lh_midiout"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-21",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.5, 523.5, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-110",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 31.0, 616.0, 55.0, 17.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-108",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 469.0, 483.0, 89.0, 17.0 ],
									"text" : "prepend settingsgui"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-109",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 469.0, 458.0, 428.5, 17.0 ],
									"text" : "funnel 6 11"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create rulebends for all currently selected presets.",
									"id" : "obj-107",
									"maxclass" : "textbutton",
									"mode" : 1,
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 551.0, 431.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 40.0, 149.0, 51.0, 13.0 ],
									"rounded" : 0.0,
									"text" : "Global",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"texton" : "Global",
									"varname" : "settings10[2]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create rulebends for all currently selected presets.",
									"id" : "obj-106",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 469.0, 431.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 307.0, 149.0, 51.0, 13.0 ],
									"rounded" : 0.0,
									"text" : "All",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"texton" : "All",
									"varname" : "settings10[1]"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomize the rules used by all the behavior patterns.",
									"id" : "obj-16",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 633.0, 431.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 304.0, 242.0, 67.0, 18.0 ],
									"rounded" : 0.0,
									"text" : "Randomize",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings12"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "Each rule can be applied to any step of a behavior sequence to the left.",
									"id" : "obj-101",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 350.0, 172.0, 42.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 316.0, 270.0, 42.0, 20.0 ],
									"text" : "Rules",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create behaviors for all currently selected presets.",
									"id" : "obj-33",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 715.0, 317.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 236.0, 169.0, 61.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Behaviors",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings9"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-99",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 469.0, 391.0, 89.0, 17.0 ],
									"text" : "prepend settingsgui"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-100",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 469.0, 347.0, 429.5, 17.0 ],
									"text" : "funnel 6 5"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "This will zero out the all patterns on the currently selected presets.",
									"id" : "obj-98",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 880.0, 315.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 12.0, 204.0, 380.0, 22.0 ],
									"rounded" : 0.0,
									"text" : "Initialize Preset",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings11"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create rulebends for all currently selected presets.",
									"id" : "obj-96",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 797.0, 316.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 303.0, 169.0, 61.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Rulebends",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings10"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create durations for all currently selected presets.",
									"id" : "obj-95",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 633.0, 317.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 169.0, 169.0, 61.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Durations",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings8"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create velocities for all currently selected presets.",
									"id" : "obj-94",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 551.0, 317.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 102.0, 169.0, 61.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Velocities",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings7"
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Randomly create steps for all currently selected presets.",
									"id" : "obj-93",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 469.0, 317.0, 63.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 35.0, 169.0, 61.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Patterns",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ],
									"varname" : "settings6"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"frgb" : 0.0,
									"id" : "obj-31",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 615.0, 276.0, 102.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 147.0, 144.0, 102.0, 24.0 ],
									"text" : "Randomize",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 1,
									"bordercolor" : [ 0.6, 0.6, 0.6, 1.0 ],
									"id" : "obj-24",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 459.0, 311.0, 491.0, 66.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 12.0, 142.0, 380.0, 55.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 11.0,
									"hint" : "This is the amount of steps transposed when pressing the step transpose encoder buttons.",
									"id" : "obj-5",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 880.0, 188.0, 38.0, 16.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 240.0, 80.0, 119.0, 16.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_unitstyle" : 7,
											"parameter_mmax" : 96.0,
											"parameter_mmin" : 1.0,
											"parameter_type" : 1,
											"parameter_invisible" : 1,
											"parameter_shortname" : "transposesteps",
											"parameter_longname" : "setting4[1]",
											"parameter_linknames" : 1,
											"parameter_order" : 1006
										}

									}
,
									"varname" : "setting4[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-23",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 848.0, 128.0, 66.0, 33.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 136.0, 78.0, 99.0, 20.0 ],
									"text" : "Tranpose Steps",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"bgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"bgovercolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"border" : 1,
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 10.0,
									"hint" : "Select a DrumRack in Live, then press this button.  Hex will lock it's device controls to that DrumRack.",
									"id" : "obj-18",
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 728.0, 185.0, 100.0, 20.0 ],
									"rounded" : 0.0,
									"text" : "Capture Currently Selected Instrument",
									"textcolor" : [ 0.007843, 0.007843, 0.007843, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-97",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 6,
											"minor" : 0,
											"revision" : 8
										}
,
										"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 9.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 0,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 0,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"boxanimatetime" : 200,
										"imprint" : 0,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-95",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 113.0, 100.0, 20.0, 20.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-94",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 154.0, 204.0, 32.5, 17.0 ],
													"text" : "% 8"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-93",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 94.0, 268.0, 52.0, 17.0 ],
													"text" : "pack 0 0 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-24",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 155.0, 228.0, 32.5, 17.0 ],
													"text" : "+ 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-23",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 98.0, 207.0, 32.5, 17.0 ],
													"text" : "/ 8"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 50.0, 207.0, 32.5, 17.0 ],
													"text" : "% 8"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 9.0,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "int" ],
													"patching_rect" : [ 68.0, 125.0, 46.0, 17.0 ],
													"text" : "uzi 56"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-96",
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 94.0, 345.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-93", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-18", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-93", 1 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-23", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-93", 2 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-24", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-23", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-5", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-96", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-93", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-24", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-94", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"disabled" : 0,
													"hidden" : 0,
													"source" : [ "obj-95", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 204.0, 464.0, 62.0, 17.0 ],
									"saved_object_attributes" : 									{
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"default_fontsize" : 9.0,
										"description" : "",
										"digest" : "",
										"fontface" : 0,
										"fontname" : "Arial",
										"fontsize" : 9.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p init_ruledef"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-91",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 417.0, 510.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-90",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 481.0, 231.0, 89.0, 17.0 ],
									"text" : "prepend settingsgui"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-89",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 60.0, 74.0, 17.0 ],
									"text" : "prepend remote"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-88",
									"maxclass" : "newobj",
									"numinlets" : 5,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 481.0, 211.0, 418.0, 17.0 ],
									"text" : "funnel 5"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 48,
									"numoutlets" : 1,
									"outlettype" : [ "list" ],
									"patching_rect" : [ 40.0, 40.0, 958.5, 17.0 ],
									"text" : "funnel 48"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 81.0, 475.0, 32.5, 17.0 ],
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 119.0, 475.0, 32.5, 17.0 ],
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 81.0, 497.0, 95.0, 17.0 ],
									"text" : "sprintf nsub %i %i %i"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "int", "int" ],
									"patching_rect" : [ 81.0, 451.0, 95.0, 17.0 ],
									"text" : "unpack 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"coll_data" : 									{
										"count" : 8,
										"data" : [ 											{
												"key" : 0,
												"value" : [ 1, 1, 1, 1, 1, 1, 1, 1 ]
											}
, 											{
												"key" : 1,
												"value" : [ 1, 1, 1, 1, 1, 1, 1, 1 ]
											}
, 											{
												"key" : 2,
												"value" : [ 2, 2, 2, 2, 2, 2, 2, 2 ]
											}
, 											{
												"key" : 3,
												"value" : [ 3, 3, 3, 3, 3, 3, 3, 3 ]
											}
, 											{
												"key" : 4,
												"value" : [ 4, 4, 4, 4, 4, 4, 4, 4 ]
											}
, 											{
												"key" : 5,
												"value" : [ 5, 5, 5, 5, 5, 5, 5, 5 ]
											}
, 											{
												"key" : 6,
												"value" : [ 6, 6, 6, 6, 6, 6, 6, 6 ]
											}
, 											{
												"key" : 7,
												"value" : [ 7, 7, 7, 7, 7, 7, 7, 7 ]
											}
 ]
									}
,
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 81.0, 517.0, 59.5, 17.0 ],
									"saved_object_attributes" : 									{
										"embed" : 1
									}
,
									"text" : "coll ---rules"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"frozen_object_attributes" : 									{
										"invisible" : 1
									}
,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 43.0, 142.0, 63.0, 17.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_initial" : [ 0, 0, 1, 0, 1, 1, 0, 2, 1, 0, 3, 1, 0, 4, 1, 0, 5, 1, 0, 6, 1, 0, 7, 1, 1, 0, 2, 1, 1, 2, 1, 2, 2, 1, 3, 2, 1, 4, 2, 1, 5, 2, 1, 6, 2, 1, 7, 2, 2, 0, 3, 2, 1, 3, 2, 2, 3, 2, 3, 3, 2, 4, 3, 2, 5, 3, 2, 6, 3, 2, 7, 3, 3, 0, 4, 3, 1, 4, 3, 2, 4, 3, 3, 4, 3, 4, 4, 3, 5, 4, 3, 6, 4, 3, 7, 4, 4, 0, 5, 4, 1, 5, 4, 2, 5, 4, 3, 5, 4, 4, 5, 4, 5, 5, 4, 6, 5, 4, 7, 5, 5, 0, 6, 5, 1, 6, 5, 2, 6, 5, 3, 6, 5, 4, 6, 5, 5, 6, 5, 6, 6, 5, 7, 6, 6, 0, 7, 6, 1, 7, 6, 2, 7, 6, 3, 7, 6, 4, 7, 6, 5, 7, 6, 6, 7, 6, 7, 7 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "ruledefs",
											"parameter_order" : 1020,
											"parameter_shortname" : "ruledefs",
											"parameter_type" : 3
										}

									}
,
									"saved_object_attributes" : 									{
										"annotation_name" : "",
										"initial" : [ 0, 0, 1, 0, 1, 1, 0, 2, 1, 0, 3, 1, 0, 4, 1, 0, 5, 1, 0, 6, 1, 0, 7, 1, 1, 0, 2, 1, 1, 2, 1, 2, 2, 1, 3, 2, 1, 4, 2, 1, 5, 2, 1, 6, 2, 1, 7, 2, 2, 0, 3, 2, 1, 3, 2, 2, 3, 2, 3, 3, 2, 4, 3, 2, 5, 3, 2, 6, 3, 2, 7, 3, 3, 0, 4, 3, 1, 4, 3, 2, 4, 3, 3, 4, 3, 4, 4, 3, 5, 4, 3, 6, 4, 3, 7, 4, 4, 0, 5, 4, 1, 5, 4, 2, 5, 4, 3, 5, 4, 4, 5, 4, 5, 5, 4, 6, 5, 4, 7, 5, 5, 0, 6, 5, 1, 6, 5, 2, 6, 5, 3, 6, 5, 4, 6, 5, 5, 6, 5, 6, 6, 5, 7, 6, 6, 0, 7, 6, 1, 7, 6, 2, 7, 6, 3, 7, 6, 4, 7, 6, 5, 7, 6, 6, 7, 6, 7, 7 ],
										"parameter_enable" : 1
									}
,
									"text" : "pattr ruledefs",
									"varname" : "ruledefs"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 11.0,
									"hint" : "This box should correspond to the assigned not of the first instrument in the DrumRack you are controlling.",
									"id" : "obj-36",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 681.0, 191.0, 38.0, 16.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 240.0, 58.0, 119.0, 16.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_unitstyle" : 8,
											"parameter_mmax" : 96.0,
											"parameter_type" : 1,
											"parameter_invisible" : 1,
											"parameter_shortname" : "live.numbox",
											"parameter_longname" : "setting3[1]",
											"parameter_linknames" : 1,
											"parameter_order" : 1007
										}

									}
,
									"varname" : "setting3[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-35",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 681.0, 131.0, 52.0, 47.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 111.0, 56.0, 123.0, 20.0 ],
									"text" : "Global Chain Offset",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"hint" : "This determines whether a timing change happens instantaneously or not.",
									"id" : "obj-29",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 581.0, 191.0, 81.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 240.0, 36.0, 118.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_enum" : [ "at beginning of bar", "immediately" ],
											"parameter_unitstyle" : 0,
											"parameter_initial" : [ 0 ],
											"parameter_type" : 2,
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_shortname" : "keymode",
											"parameter_longname" : "setting2[1]",
											"parameter_linknames" : 1,
											"parameter_order" : 1005,
											"parameter_defer" : 1
										}

									}
,
									"varname" : "setting2[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-26",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 581.0, 131.0, 81.0, 47.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 85.0, 34.0, 148.0, 20.0 ],
									"text" : "Timing changes happen",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-25",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 461.0, 131.0, 114.0, 47.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 32.0, 12.0, 202.0, 20.0 ],
									"text" : "Select + Hold temporarily reveals",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.8, 0.8, 0.8, 1.0 ],
									"hint" : "This setting determines what happens when holding down a sequence select button for a moment.",
									"id" : "obj-45",
									"maxclass" : "live.menu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 481.0, 191.0, 88.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 240.0, 15.0, 118.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_enum" : [ "mute", "length", "behavior", "single preset", "global preset", "polyrec", "polyplay" ],
											"parameter_unitstyle" : 0,
											"parameter_initial" : [ 3 ],
											"parameter_type" : 2,
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_shortname" : "keymode",
											"parameter_longname" : "setting1[1]",
											"parameter_linknames" : 1,
											"parameter_order" : 1004,
											"parameter_defer" : 1
										}

									}
,
									"varname" : "setting1[1]"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 16.0,
									"frgb" : 0.0,
									"hint" : "Create a sequence of rules for each behavior type. ",
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 149.0, 103.0, 102.0, 24.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 126.0, 238.0, 102.0, 24.0 ],
									"text" : "BEHAVIORS",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 13.0,
									"frgb" : 0.0,
									"id" : "obj-20",
									"linecount" : 15,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 198.0, 27.0, 225.0 ],
									"presentation" : 1,
									"presentation_linecount" : 15,
									"presentation_rect" : [ 36.0, 298.0, 27.0, 225.0 ],
									"text" : "1  \n\n2  \n\n3  \n\n4 \n\n5 \n\n6  \n\n7 \n\n8 ",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"id" : "obj-17",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 36.0, 171.0, 42.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 27.0, 271.0, 42.0, 20.0 ],
									"text" : "Bar #",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "The selected step will trigger an action in Plinko, if present in the same project.",
									"id" : "obj-15",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 334.0, 409.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 325.0, 509.0, 66.0, 20.0 ],
									"text" : "Plink",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "The selected step will be triggered and repeated, its tempo and repetitions determined by rulebend.",
									"id" : "obj-14",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 335.0, 379.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 326.0, 479.0, 66.0, 20.0 ],
									"text" : "Repeat",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "The selected step will be triggered with a delay corresponding to the rulebend amount.",
									"id" : "obj-13",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 335.0, 349.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 326.0, 449.0, 66.0, 20.0 ],
									"text" : "Delay",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "The selected step will be triggered, and block any other steps that aren't also set to dominate.  The length of domination is determined by rulebend.",
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 334.0, 319.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 325.0, 419.0, 66.0, 20.0 ],
									"text" : "Dominate",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "The selected step will be triggered if other steps with the same rulebend are triggered on the same step.",
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 334.0, 290.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 325.0, 390.0, 66.0, 20.0 ],
									"text" : "Sympathy",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "Selected step will randomly play, based on the weighting supplied by its corresponding rulebend",
									"id" : "obj-10",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 335.0, 260.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 326.0, 360.0, 66.0, 20.0 ],
									"text" : "Random",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "Selected step will be played",
									"id" : "obj-9",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 335.0, 230.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 326.0, 330.0, 66.0, 20.0 ],
									"text" : "Trigger ",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontface" : 1,
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"frgb" : 0.0,
									"hint" : "Selected step will be ignored",
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 335.0, 200.0, 66.0, 20.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 326.0, 300.0, 66.0, 20.0 ],
									"text" : "No action",
									"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 304.0, 194.0, 29.0, 240.0 ],
									"pic" : "rgb_horizontal.png",
									"presentation" : 1,
									"presentation_rect" : [ 295.0, 294.0, 29.0, 240.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 82.0, 165.0, 211.0, 30.0 ],
									"pic" : "RGB_button_abc.png",
									"presentation" : 1,
									"presentation_rect" : [ 73.0, 265.0, 211.0, 30.0 ],
									"xoffset" : -270.0
								}

							}
, 							{
								"box" : 								{
									"autosize" : 1,
									"cellpict" : "rgb_only.png",
									"clickedimage" : 0,
									"columns" : 7,
									"hint" : "Click on each square to change its rule assignment.",
									"horizontalmargin" : 0,
									"id" : "obj-4",
									"inactiveimage" : 0,
									"invisiblebkgnd" : 1,
									"maxclass" : "matrixctrl",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "list", "list" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 81.0, 199.0, 210.0, 240.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 73.0, 294.0, 210.0, 240.0 ],
									"range" : 8,
									"rows" : 8,
									"varname" : "rulemap",
									"verticalmargin" : 0
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 31.0, 579.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 1,
									"bordercolor" : [ 0.6, 0.6, 0.6, 1.0 ],
									"id" : "obj-19",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 133.0, 382.0, 315.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 11.0, 233.0, 382.0, 315.0 ]
								}

							}
, 							{
								"box" : 								{
									"border" : 1,
									"bordercolor" : [ 0.6, 0.6, 0.6, 1.0 ],
									"id" : "obj-86",
									"maxclass" : "panel",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 441.0, 111.0, 478.0, 148.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 12.0, 4.0, 380.0, 130.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 74.5, 164.5, 90.5, 164.5 ],
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-99", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-100", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 226.0, 590.5, 257.0, 590.5 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 298.0, 642.0, 382.0, 642.0, 382.0, 558.5, 226.0, 558.5 ],
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 300.0, 590.75, 257.0, 590.75 ],
									"source" : [ "obj-104", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-103", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-105", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-107", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 478.5, 508.0, 426.5, 508.0 ],
									"source" : [ "obj-108", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-108", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-109", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 737.5, 207.5, 789.75, 207.5 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-110", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-102", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 3 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-89", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 313.5, 495.0, 426.5, 495.0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 90.5, 451.0, 313.5, 451.0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 4 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-90", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 49.5, 83.0, 426.5, 83.0 ],
									"source" : [ "obj-89", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 490.5, 263.0, 426.5, 263.0 ],
									"source" : [ "obj-90", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-93", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-94", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 4 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-96", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-100", 5 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-98", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 478.5, 414.5, 426.5, 414.5 ],
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 841.5, 526.0, 65.0, 18.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p settings",
					"varname" : "settings"
				}

			}
, 			{
				"box" : 				{
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"border" : 1,
					"fontname" : "Arial Bold",
					"fontsize" : 9.0,
					"hint" : "Open settings menu.",
					"id" : "obj-36",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 841.5, 433.0, 43.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 221.0, 8.0, 48.0, 20.0 ],
					"rounded" : 0.0,
					"text" : "settings",
					"varname" : "advsettings"
				}

			}
, 			{
				"box" : 				{
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"border" : 1,
					"fontname" : "Arial Bold",
					"fontsize" : 9.0,
					"hint" : "Read presets from file",
					"id" : "obj-39",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 201.0, 454.0, 43.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 274.0, 8.0, 31.0, 20.0 ],
					"rounded" : 0.0,
					"text" : "read"
				}

			}
, 			{
				"box" : 				{
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgoveroncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"border" : 1,
					"fontname" : "Arial Bold",
					"fontsize" : 9.0,
					"hint" : "Write current presets to file",
					"id" : "obj-32",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 152.0, 454.0, 43.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 310.0, 8.0, 31.0, 20.0 ],
					"rounded" : 0.0,
					"text" : "write"
				}

			}
, 			{
				"box" : 				{
					"activebgoncolor" : [ 1.0, 0.988235, 0.988235, 1.0 ],
					"automation" : "lock",
					"automationon" : "lock",
					"fontsize" : 9.0,
					"hint" : "Prevent overwriting presets when switching voices or changing presets",
					"id" : "obj-27",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 788.0, 163.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 346.0, 8.0, 44.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "lock", "lock" ],
							"parameter_mmax" : 1.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "lock",
							"parameter_longname" : "lockgui",
							"parameter_linknames" : 1,
							"parameter_order" : 109,
							"parameter_defer" : 1
						}

					}
,
					"text" : "unlocked",
					"texton" : "locked",
					"varname" : "lockgui"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Main MIDI velocity scaler for all voices",
					"id" : "obj-8",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 632.25, 360.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 119.0, 5.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_initial" : [ 127 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "moddial",
							"parameter_longname" : "moddial",
							"parameter_linknames" : 1,
							"parameter_modmode" : 4,
							"parameter_units" : "steps",
							"parameter_order" : 39,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "moddial"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 239.0, 364.0, 525.0, 400.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-19",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 7,
									"outlettype" : [ "", "", "", "int", "int", "int", "int" ],
									"patching_rect" : [ 384.0, 255.0, 100.0, 17.0 ],
									"text" : "midiparse"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-114",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 384.0, 230.0, 43.0, 17.0 ],
									"text" : "gate 1 0",
									"varname" : "recgate"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-115",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 384.0, 282.0, 106.0, 17.0 ],
									"text" : "prepend receive_record"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-18",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 150.0, 338.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 150.0, 203.0, 38.0, 17.0 ],
									"text" : "zl rot 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 126.0, 124.0, 32.5, 17.0 ],
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 183.0, 101.0, 33.0, 17.0 ],
									"text" : "+ 143"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patching_rect" : [ 126.0, 77.0, 76.0, 17.0 ],
									"text" : "t i i"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 183.0, 52.0, 17.0 ],
									"text" : "pack 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 126.0, 101.0, 32.5, 17.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 126.0, 157.0, 43.0, 17.0 ],
									"text" : "gate 2 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 33.0, 77.0, 49.0, 17.0 ],
									"text" : "clip 0 127"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 77.0, 49.0, 17.0 ],
									"text" : "clip 0 127"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-10",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 44.0, 338.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 244.0, 261.0, 125.0, 17.0 ],
									"text" : "prepend receive_automation"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 8,
									"outlettype" : [ "", "", "", "int", "int", "int", "int", "int" ],
									"patching_rect" : [ 244.0, 183.0, 183.0, 37.0 ],
									"text" : "midiselect @note 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 244.0, 157.0, 34.0, 17.0 ],
									"text" : "midiin"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 56.0, 117.5, 17.0 ],
									"text" : "scale 0 127 0 127"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 33.0, 101.0, 66.0, 17.0 ],
									"text" : "pack 0 0"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 159.0, 4.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 33.0, 3.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-67",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "int", "int" ],
									"patching_rect" : [ 33.0, 34.0, 112.0, 18.0 ],
									"text" : "unpack 0 0 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-53",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 33.0, 242.0, 47.0, 18.0 ],
									"text" : "midiout"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 7,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 33.0, 183.0, 100.0, 18.0 ],
									"text" : "midiformat"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 393.5, 306.0, 53.5, 306.0 ],
									"source" : [ "obj-115", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 2 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 159.5, 323.5, 159.5, 323.5 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-115", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 7 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 417.5, 223.0, 42.5, 223.0 ],
									"source" : [ "obj-3", 7 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 4 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 42.5, 149.0, 159.5, 149.0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-67", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-67", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 253.5, 306.5, 53.5, 306.5 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 585.25, 393.0, 66.0, 18.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p midiout",
					"varname" : "midiout"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 326.5, 578.0, 51.0, 18.0 ],
					"text" : "pipe 350",
					"varname" : "pipe"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Change the direction of the sequence",
					"id" : "obj-31",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 737.0, 162.0, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 325.0, 112.0, 45.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "fwd", "bkwd", "updn" ],
							"parameter_type" : 2,
							"parameter_shortname" : "direction",
							"parameter_longname" : "directiongui",
							"parameter_linknames" : 1,
							"parameter_order" : 38
						}

					}
,
					"varname" : "directiongui"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 477.0, 382.0, 50.0, 18.0 ],
					"text" : "clip 0 15"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-221",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 25.0, 69.0, 86.0, 129.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-5",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 42.0, 84.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 16.0, 61.0, 45.0, 17.0 ],
									"text" : "zl ecils 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 16.0, 5.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 16.0, 37.0, 58.0, 17.0 ],
									"text" : "thresh 1000"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 686.0, 158.0, 43.0, 17.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p thresh"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 97.0, 372.0, 100.0, 18.0 ],
					"text" : "prepend padgui_in"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.34902, 0.34902, 0.34902, 0.0 ],
					"activebgoncolor" : [ 0.819608, 0.721569, 0.007843, 0.0 ],
					"bgcolor" : [ 0.34902, 0.34902, 0.34902, 0.0 ],
					"bgoncolor" : [ 0.568627, 0.568627, 0.568627, 0.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 0.0 ],
					"button" : 1,
					"focusbordercolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"fontsize" : 20.0,
					"id" : "obj-81",
					"maxclass" : "live.tab",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 97.0, 237.0, 132.0, 129.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 14.0, 30.0, 132.0, 132.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "padgui",
							"parameter_longname" : "padtrig",
							"parameter_linknames" : 1,
							"parameter_order" : 1010
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"textoncolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"varname" : "padtrig"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.34902, 0.34902, 0.34902, 0.0 ],
					"activebgoncolor" : [ 0.819608, 0.721569, 0.007843, 0.0 ],
					"bgcolor" : [ 0.34902, 0.34902, 0.34902, 0.0 ],
					"bgoncolor" : [ 0.568627, 0.568627, 0.568627, 0.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 0.0 ],
					"button" : 1,
					"focusbordercolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"id" : "obj-80",
					"maxclass" : "live.tab",
					"multiline" : 0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 118.0, 393.0, 186.0, 28.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 164.0, 130.0, 356.0, 33.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "keygui",
							"parameter_longname" : "keytrig",
							"parameter_linknames" : 1,
							"parameter_order" : 1011,
							"parameter_defer" : 1
						}

					}
,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"textoncolor" : [ 0.0, 0.0, 0.0, 0.0 ],
					"varname" : "keytrig"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 118.0, 426.0, 99.0, 18.0 ],
					"text" : "prepend keygui_in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 24.0,
					"frgb" : 0.0,
					"hint" : "amounra @ www.aumhaa.com",
					"id" : "obj-75",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.5, 676.0, 52.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 166.5, 2.0, 57.0, 33.0 ],
					"text" : "hex",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activebgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hint" : "Currently controlled device.  Press here to redetect a new Instrument",
					"id" : "obj-71",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 839.0, 130.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 428.0, 7.0, 91.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "device_name",
							"parameter_longname" : "device_name",
							"parameter_linknames" : 1,
							"parameter_order" : 433
						}

					}
,
					"text" : "Detect Instrument",
					"textcolor" : [ 0.65098, 0.65098, 0.65098, 1.0 ],
					"varname" : "device_name"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Change the currently viewed sequence data type",
					"id" : "obj-68",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 461.0, 534.0, 59.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 166.0, 112.0, 72.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "Active", "Velocity", "Duration", "Behavior", "Pitch" ],
							"parameter_unitstyle" : 0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "editmode",
							"parameter_longname" : "stepmodegui",
							"parameter_linknames" : 1,
							"parameter_order" : 35
						}

					}
,
					"varname" : "stepmodegui"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Global transposition",
					"id" : "obj-64",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 686.0, 137.0, 44.330078, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 379.0, 112.0, 36.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 8,
							"parameter_mmax" : 96.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "transpose",
							"parameter_longname" : "transposegui",
							"parameter_linknames" : 1,
							"parameter_order" : 32,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "transposegui"
				}

			}
, 			{
				"box" : 				{
					"bkgndpict" : "",
					"cellpict" : "RGB_button_abc.png",
					"clickedimage" : 0,
					"columns" : 16,
					"hint" : "",
					"horizontalmargin" : 0,
					"horizontalspacing" : 3,
					"id" : "obj-46",
					"inactiveimage" : 0,
					"maxclass" : "matrixctrl",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 118.0, 391.0, 187.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 166.0, 131.0, 355.0, 33.0 ],
					"range" : 16,
					"rows" : 1,
					"varname" : "keygui",
					"verticalmargin" : 0,
					"verticalspacing" : 3
				}

			}
, 			{
				"box" : 				{
					"hint" : "Function assignment of upper keys",
					"id" : "obj-45",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 635.0, 163.0, 38.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 425.0, 112.0, 95.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "mute", "length", "behavior", "single preset", "global preset", "polyrec", "polyplay", "accent" ],
							"parameter_unitstyle" : 0,
							"parameter_initial" : [ 0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "keymode",
							"parameter_longname" : "keymodegui",
							"parameter_linknames" : 1,
							"parameter_order" : 34,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "keymodegui"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Function assignment of the pads",
					"id" : "obj-44",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 584.0, 162.0, 42.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 8.0, 62.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "select", "add", "mute", "preset", "global", "freewheel" ],
							"parameter_unitstyle" : 0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "padmode",
							"parameter_longname" : "padmodegui",
							"parameter_linknames" : 1,
							"parameter_order" : 33,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "padmodegui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "key",
					"automationon" : "key",
					"fontsize" : 9.0,
					"hint" : "Advance the function assignment of the upper keys",
					"id" : "obj-40",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 126.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 630.0, 147.0, 28.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "key", "key" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "mode_advance",
							"parameter_longname" : "keymodeadv",
							"parameter_linknames" : 1,
							"parameter_order" : 105
						}

					}
,
					"text" : "key",
					"texton" : "Mode>",
					"varname" : "keymodeadv"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 477.0, 433.0, 32.5, 18.0 ],
					"text" : "+ 1"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Type of note for part's speed quantization",
					"id" : "obj-25",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 330.0, 160.0, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 287.0, 112.0, 27.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "-", "dot", "trip" ],
							"parameter_type" : 2,
							"parameter_shortname" : "notetype",
							"parameter_longname" : "notetypegui",
							"parameter_linknames" : 1,
							"parameter_order" : 37
						}

					}
,
					"varname" : "notetypegui"
				}

			}
, 			{
				"box" : 				{
					"hint" : "Part's speed quantization",
					"id" : "obj-9",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 279.0, 160.0, 41.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 250.0, 112.0, 38.0, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "1n", "2n", "4n", "8n", "16n", "32n", "64n", "128n", "-" ],
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_shortname" : "notevalue",
							"parameter_longname" : "notevaluesgui",
							"parameter_linknames" : 1,
							"parameter_order" : 36,
							"parameter_defer" : 1
						}

					}
,
					"varname" : "notevaluesgui"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 75.0, 206.0, 104.0, 18.0 ],
					"text" : "prepend guibuttons"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 18,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 75.0, 182.0, 884.5, 18.0 ],
					"text" : "funnel 18"
				}

			}
, 			{
				"box" : 				{
					"automation" : "pad",
					"automationon" : "pad",
					"fontsize" : 9.0,
					"hint" : "Repeat the selected part when a note is triggered",
					"id" : "obj-33",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 75.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 568.0, 147.0, 28.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "pad", "pad" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "repeat_enable",
							"parameter_longname" : "repeatgui",
							"parameter_linknames" : 1,
							"parameter_order" : 104
						}

					}
,
					"text" : "pad",
					"texton" : "pad",
					"varname" : "repeatgui"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Length of rotation zone",
					"id" : "obj-19",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 793.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 733.0, 143.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 9,
							"parameter_mmax" : 16.0,
							"parameter_mmin" : 2.0,
							"parameter_type" : 1,
							"parameter_shortname" : "RotSize",
							"parameter_longname" : "RotSize",
							"parameter_linknames" : 1,
							"parameter_units" : "steps",
							"parameter_order" : 24,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "RotSize"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Random velocity value for all notes",
					"id" : "obj-20",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 725.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 667.0, 143.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 5,
							"parameter_mmax" : 100.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Random",
							"parameter_longname" : "Random",
							"parameter_linknames" : 1,
							"parameter_order" : 20,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Random"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Part's swing value",
					"id" : "obj-22",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 658.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 143.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 5,
							"parameter_mmax" : 40.0,
							"parameter_mmin" : -40.0,
							"parameter_type" : 1,
							"parameter_shortname" : "Groove",
							"parameter_longname" : "Groove",
							"parameter_linknames" : 1,
							"parameter_order" : 19,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Groove"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "Timing interval for repeat button",
					"id" : "obj-24",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 935.0, 28.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "1n", "1nt", "2n", "2nt", "4n", "4nt", "8n", "8nt", "16n", "16nt", "32n", "32nt", "64n", "64nt" ],
							"parameter_unitstyle" : 0,
							"parameter_type" : 2,
							"parameter_shortname" : "Repeat",
							"parameter_longname" : "Repeat",
							"parameter_linknames" : 1,
							"parameter_order" : 18,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Repeat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 135.0, 92.0, 18.0 ],
					"text" : "prepend encoder"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 16,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 50.0, 110.0, 1031.5, 18.0 ],
					"text" : "funnel 16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 25.0, 69.0, 175.0, 302.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 52.0, 88.0, 32.5, 17.0 ],
									"text" : "- 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 95.0, 137.0, 32.5, 15.0 ],
									"text" : "$1 -1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 53.0, 111.0, 32.5, 15.0 ],
									"text" : "$1 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 53.0, 190.0, 69.0, 17.0 ],
									"text" : "prepend vblink"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 94.0, 110.0, 45.0, 17.0 ],
									"text" : "pipe 100"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 9.0,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"patching_rect" : [ 53.0, 66.0, 44.0, 17.0 ],
									"text" : "unpack"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 52.0, 237.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 53.0, 21.0, 25.0, 25.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-7", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 710.5, 393.0, 48.0, 18.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p vblink"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 711.0, 549.0, 76.0, 18.0 ],
					"text" : "prepend blink"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-61",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 711.0, 302.0, 48.0, 16.0 ],
					"text" : "open $1"
				}

			}
, 			{
				"box" : 				{
					"coll_data" : 					{
						"count" : 8,
						"data" : [ 							{
								"key" : 0,
								"value" : [ "128n", "notevalues" ]
							}
, 							{
								"key" : 1,
								"value" : [ "64n", "notevalues" ]
							}
, 							{
								"key" : 2,
								"value" : [ "32n", "notevalues" ]
							}
, 							{
								"key" : 3,
								"value" : [ "16n", "notevalues" ]
							}
, 							{
								"key" : 4,
								"value" : [ "8n", "notevalues" ]
							}
, 							{
								"key" : 5,
								"value" : [ "4n", "notevalues" ]
							}
, 							{
								"key" : 6,
								"value" : [ "2n", "notevalues" ]
							}
, 							{
								"key" : 7,
								"value" : [ "1n", "notevalues" ]
							}
 ]
					}
,
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 892.0, 213.0, 65.0, 17.0 ],
					"saved_object_attributes" : 					{
						"embed" : 1
					}
,
					"text" : "coll ---durvals"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 430.0, 659.0, 112.0, 18.0 ],
					"text" : "prepend update_poly"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 361.0, 635.0, 88.0, 18.0 ],
					"text" : "zl compare"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 477.0, 360.0, 54.0, 18.0 ],
					"text" : "spray 1 1",
					"varname" : "selected_filter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"id" : "obj-70",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 461.0, 557.0, 53.0, 17.0 ],
					"text" : "mode $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 6,
							"minor" : 0,
							"revision" : 8
						}
,
						"rect" : [ 1148.0, 44.0, 229.0, 176.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 9.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-4",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 165.0, 114.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-2",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 112.0, 112.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 58.0, 112.0, 25.0, 25.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "int", "int" ],
									"patching_rect" : [ 58.0, 85.0, 126.0, 18.0 ],
									"text" : "change 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-30",
									"maxclass" : "number~",
									"mode" : 2,
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "signal", "float" ],
									"patching_rect" : [ 21.0, 63.0, 56.0, 18.0 ],
									"sig" : 0.0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 20.0, 38.0, 51.0, 18.0 ],
									"text" : "change~"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial Bold",
									"fontsize" : 10.0,
									"frozen_object_attributes" : 									{
										"lock" : 1
									}
,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 20.0, 15.0, 105.0, 18.0 ],
									"text" : "phasor~ 4n @lock 1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-30", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-32", 2 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 409.0, 217.0, 58.0, 17.0 ],
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"default_fontsize" : 9.0,
						"description" : "",
						"digest" : "",
						"fontface" : 0,
						"fontname" : "Arial",
						"fontsize" : 9.0,
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p start_stop"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 550.0, 282.0, 21.0, 17.0 ],
					"text" : "t 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 550.0, 262.0, 47.0, 17.0 ],
					"text" : "select 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 302.0, 52.0, 17.0 ],
					"text" : "s ---restart"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 550.0, 241.0, 46.0, 17.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 477.25, 302.0, 51.0, 17.0 ],
					"text" : "change -1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 9,
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"patching_rect" : [ 409.0, 264.0, 110.0, 17.0 ],
					"text" : "transport"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 409.0, 241.0, 95.0, 17.0 ],
					"text" : "metro 5 @autostart 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 532.0, 559.0, 88.0, 18.0 ],
					"text" : "prepend step_in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 532.0, 531.0, 182.5, 18.0 ],
					"text" : "funnel 4"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.886275, 0.901961, 0.568627, 1.0 ],
					"fontname" : "Arial Bold",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 223.0, 607.0, 226.0, 20.0 ],
					"saved_object_attributes" : 					{
						"filename" : "hex_mod_b995e.js",
						"parameter_enable" : 0
					}
,
					"text" : "js hex_mod_b995e.js ---"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.580392, 0.792157, 0.368627, 1.0 ],
					"fontname" : "Arial Bold",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 142.0, 481.0, 108.0, 18.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 								{
									"pattrstorage" : 									{
										"name" : "storage",
										"slots" : 										{
											"1" : 											{
												"id" : 1,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"2" : 											{
												"id" : 2,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"3" : 											{
												"id" : 3,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"4" : 											{
												"id" : 4,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"5" : 											{
												"id" : 5,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"6" : 											{
												"id" : 6,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"7" : 											{
												"id" : 7,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"8" : 											{
												"id" : 8,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"9" : 											{
												"id" : 9,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"10" : 											{
												"id" : 10,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"11" : 											{
												"id" : 11,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"12" : 											{
												"id" : 12,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"13" : 											{
												"id" : 13,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"14" : 											{
												"id" : 14,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"15" : 											{
												"id" : 15,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}
,
											"16" : 											{
												"id" : 16,
												"data" : 												{
													"poly.1::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.1::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::swingpattr" : [ 0.5 ],
													"poly.1::stepspattr" : [ 15 ],
													"poly.1::directionpattr" : [ 0 ],
													"poly.1::notetypepattr" : [ 0 ],
													"poly.1::notevaluepattr" : [ 2 ],
													"poly.1::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.1::randompattr" : [ 0 ],
													"poly.1::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::nudgepattr" : [ 0 ],
													"poly.1::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::active" : [ 1 ],
													"poly.1::quantize" : [ 1 ],
													"poly.1::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.1::basetimepattr" : [ 1 ],
													"poly.1::timedivisorpattr" : [ 4 ],
													"poly.2::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.2::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::swingpattr" : [ 0.5 ],
													"poly.2::stepspattr" : [ 15 ],
													"poly.2::directionpattr" : [ 0 ],
													"poly.2::notetypepattr" : [ 0 ],
													"poly.2::notevaluepattr" : [ 2 ],
													"poly.2::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.2::randompattr" : [ 0 ],
													"poly.2::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::nudgepattr" : [ 0 ],
													"poly.2::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::active" : [ 1 ],
													"poly.2::quantize" : [ 1 ],
													"poly.2::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.2::basetimepattr" : [ 1 ],
													"poly.2::timedivisorpattr" : [ 4 ],
													"poly.3::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.3::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::swingpattr" : [ 0.5 ],
													"poly.3::stepspattr" : [ 15 ],
													"poly.3::directionpattr" : [ 0 ],
													"poly.3::notetypepattr" : [ 0 ],
													"poly.3::notevaluepattr" : [ 2 ],
													"poly.3::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.3::randompattr" : [ 0 ],
													"poly.3::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::nudgepattr" : [ 0 ],
													"poly.3::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::active" : [ 1 ],
													"poly.3::quantize" : [ 1 ],
													"poly.3::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.3::basetimepattr" : [ 1 ],
													"poly.3::timedivisorpattr" : [ 4 ],
													"poly.4::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.4::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::swingpattr" : [ 0.5 ],
													"poly.4::stepspattr" : [ 15 ],
													"poly.4::directionpattr" : [ 0 ],
													"poly.4::notetypepattr" : [ 0 ],
													"poly.4::notevaluepattr" : [ 2 ],
													"poly.4::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.4::randompattr" : [ 0 ],
													"poly.4::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::nudgepattr" : [ 0 ],
													"poly.4::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::active" : [ 1 ],
													"poly.4::quantize" : [ 1 ],
													"poly.4::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.4::basetimepattr" : [ 1 ],
													"poly.4::timedivisorpattr" : [ 4 ],
													"poly.5::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.5::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::swingpattr" : [ 0.5 ],
													"poly.5::stepspattr" : [ 15 ],
													"poly.5::directionpattr" : [ 0 ],
													"poly.5::notetypepattr" : [ 0 ],
													"poly.5::notevaluepattr" : [ 2 ],
													"poly.5::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.5::randompattr" : [ 0 ],
													"poly.5::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::nudgepattr" : [ 0 ],
													"poly.5::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::active" : [ 1 ],
													"poly.5::quantize" : [ 1 ],
													"poly.5::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.5::basetimepattr" : [ 1 ],
													"poly.5::timedivisorpattr" : [ 4 ],
													"poly.6::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.6::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::swingpattr" : [ 0.5 ],
													"poly.6::stepspattr" : [ 15 ],
													"poly.6::directionpattr" : [ 0 ],
													"poly.6::notetypepattr" : [ 0 ],
													"poly.6::notevaluepattr" : [ 2 ],
													"poly.6::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.6::randompattr" : [ 0 ],
													"poly.6::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::nudgepattr" : [ 0 ],
													"poly.6::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::active" : [ 1 ],
													"poly.6::quantize" : [ 1 ],
													"poly.6::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.6::basetimepattr" : [ 1 ],
													"poly.6::timedivisorpattr" : [ 4 ],
													"poly.7::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.7::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::swingpattr" : [ 0.5 ],
													"poly.7::stepspattr" : [ 15 ],
													"poly.7::directionpattr" : [ 0 ],
													"poly.7::notetypepattr" : [ 0 ],
													"poly.7::notevaluepattr" : [ 2 ],
													"poly.7::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.7::randompattr" : [ 0 ],
													"poly.7::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::nudgepattr" : [ 0 ],
													"poly.7::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::active" : [ 1 ],
													"poly.7::quantize" : [ 1 ],
													"poly.7::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.7::basetimepattr" : [ 1 ],
													"poly.7::timedivisorpattr" : [ 4 ],
													"poly.8::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.8::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::swingpattr" : [ 0.5 ],
													"poly.8::stepspattr" : [ 15 ],
													"poly.8::directionpattr" : [ 0 ],
													"poly.8::notetypepattr" : [ 0 ],
													"poly.8::notevaluepattr" : [ 2 ],
													"poly.8::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.8::randompattr" : [ 0 ],
													"poly.8::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::nudgepattr" : [ 0 ],
													"poly.8::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::active" : [ 1 ],
													"poly.8::quantize" : [ 1 ],
													"poly.8::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.8::basetimepattr" : [ 1 ],
													"poly.8::timedivisorpattr" : [ 4 ],
													"poly.9::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.9::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::swingpattr" : [ 0.5 ],
													"poly.9::stepspattr" : [ 15 ],
													"poly.9::directionpattr" : [ 0 ],
													"poly.9::notetypepattr" : [ 0 ],
													"poly.9::notevaluepattr" : [ 2 ],
													"poly.9::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.9::randompattr" : [ 0 ],
													"poly.9::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::nudgepattr" : [ 0 ],
													"poly.9::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::active" : [ 1 ],
													"poly.9::quantize" : [ 1 ],
													"poly.9::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.9::basetimepattr" : [ 1 ],
													"poly.9::timedivisorpattr" : [ 4 ],
													"poly.10::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.10::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::swingpattr" : [ 0.5 ],
													"poly.10::stepspattr" : [ 15 ],
													"poly.10::directionpattr" : [ 0 ],
													"poly.10::notetypepattr" : [ 0 ],
													"poly.10::notevaluepattr" : [ 2 ],
													"poly.10::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.10::randompattr" : [ 0 ],
													"poly.10::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::nudgepattr" : [ 0 ],
													"poly.10::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::active" : [ 1 ],
													"poly.10::quantize" : [ 1 ],
													"poly.10::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.10::basetimepattr" : [ 1 ],
													"poly.10::timedivisorpattr" : [ 4 ],
													"poly.11::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.11::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::swingpattr" : [ 0.5 ],
													"poly.11::stepspattr" : [ 15 ],
													"poly.11::directionpattr" : [ 0 ],
													"poly.11::notetypepattr" : [ 0 ],
													"poly.11::notevaluepattr" : [ 2 ],
													"poly.11::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.11::randompattr" : [ 0 ],
													"poly.11::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::nudgepattr" : [ 0 ],
													"poly.11::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::active" : [ 1 ],
													"poly.11::quantize" : [ 1 ],
													"poly.11::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.11::basetimepattr" : [ 1 ],
													"poly.11::timedivisorpattr" : [ 4 ],
													"poly.12::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.12::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::swingpattr" : [ 0.5 ],
													"poly.12::stepspattr" : [ 15 ],
													"poly.12::directionpattr" : [ 0 ],
													"poly.12::notetypepattr" : [ 0 ],
													"poly.12::notevaluepattr" : [ 2 ],
													"poly.12::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.12::randompattr" : [ 0 ],
													"poly.12::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::nudgepattr" : [ 0 ],
													"poly.12::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::active" : [ 1 ],
													"poly.12::quantize" : [ 1 ],
													"poly.12::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.12::basetimepattr" : [ 1 ],
													"poly.12::timedivisorpattr" : [ 4 ],
													"poly.13::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.13::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::swingpattr" : [ 0.5 ],
													"poly.13::stepspattr" : [ 15 ],
													"poly.13::directionpattr" : [ 0 ],
													"poly.13::notetypepattr" : [ 0 ],
													"poly.13::notevaluepattr" : [ 2 ],
													"poly.13::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.13::randompattr" : [ 0 ],
													"poly.13::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::nudgepattr" : [ 0 ],
													"poly.13::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::active" : [ 1 ],
													"poly.13::quantize" : [ 1 ],
													"poly.13::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.13::basetimepattr" : [ 1 ],
													"poly.13::timedivisorpattr" : [ 4 ],
													"poly.14::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.14::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::swingpattr" : [ 0.5 ],
													"poly.14::stepspattr" : [ 15 ],
													"poly.14::directionpattr" : [ 0 ],
													"poly.14::notetypepattr" : [ 0 ],
													"poly.14::notevaluepattr" : [ 2 ],
													"poly.14::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.14::randompattr" : [ 0 ],
													"poly.14::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::nudgepattr" : [ 0 ],
													"poly.14::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::active" : [ 1 ],
													"poly.14::quantize" : [ 1 ],
													"poly.14::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.14::basetimepattr" : [ 1 ],
													"poly.14::timedivisorpattr" : [ 4 ],
													"poly.15::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.15::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::swingpattr" : [ 0.5 ],
													"poly.15::stepspattr" : [ 15 ],
													"poly.15::directionpattr" : [ 0 ],
													"poly.15::notetypepattr" : [ 0 ],
													"poly.15::notevaluepattr" : [ 2 ],
													"poly.15::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.15::randompattr" : [ 0 ],
													"poly.15::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::nudgepattr" : [ 0 ],
													"poly.15::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::active" : [ 1 ],
													"poly.15::quantize" : [ 1 ],
													"poly.15::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.15::basetimepattr" : [ 1 ],
													"poly.15::timedivisorpattr" : [ 4 ],
													"poly.16::velocity" : [ 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100 ],
													"poly.16::pattern" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::swingpattr" : [ 0.5 ],
													"poly.16::stepspattr" : [ 15 ],
													"poly.16::directionpattr" : [ 0 ],
													"poly.16::notetypepattr" : [ 0 ],
													"poly.16::notevaluepattr" : [ 2 ],
													"poly.16::duration" : [ 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2 ],
													"poly.16::randompattr" : [ 0 ],
													"poly.16::behavior" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::nudgepattr" : [ 0 ],
													"poly.16::rulebends" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::active" : [ 1 ],
													"poly.16::quantize" : [ 1 ],
													"poly.16::note" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
													"poly.16::basetimepattr" : [ 1 ],
													"poly.16::timedivisorpattr" : [ 4 ]
												}

											}

										}

									}

								}
 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_linknames" : 1,
							"parameter_longname" : "storage",
							"parameter_order" : 500,
							"parameter_shortname" : "storage",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"client_rect" : [ 162, 106, 978, 788 ],
						"parameter_enable" : 1,
						"paraminitmode" : 1,
						"storage_rect" : [ 910, 44, 1920, 686 ]
					}
,
					"text" : "pattrstorage storage",
					"varname" : "storage"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.345098, 0.560784, 0.741176, 1.0 ],
					"color" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"fontname" : "Arial Bold",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 477.0, 334.0, 452.0, 20.0 ],
					"text" : "poly~ steppr_wheel_b995e 16",
					"varname" : "poly"
				}

			}
, 			{
				"box" : 				{
					"autoscroll" : 0,
					"extra1_max" : 1,
					"extra2_max" : 15,
					"extra_thickness" : 1.0,
					"fontname" : "Arial Bold",
					"id" : "obj-1",
					"maxclass" : "live.step",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 477.0, 457.0, 238.0, 66.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 167.0, 34.0, 353.0, 74.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 1, 16, 0, 1, 12, 0, 16, 59.0, 80.0, 0, 0, 60, 100, 2, 1, 0, 63, 100, 2, 0, 0, 67, 100, 2, 0, 0, 74, 100, 2, 0, 0, 70, 100, 2, 0, 0, 67, 100, 2, 0, 0, 60, 100, 2, 0, 0, 70, 100, 2, 0, 0, 67, 100, 2, 0, 0, 79, 100, 2, 0, 0, 60, 100, 2, 0, 0, 70, 100, 2, 0, 0, 60, 100, 2, 1, 0, 63, 100, 2, 0, 0, 70, 100, 2, 0, 0, 62, 100, 2, 0, 0 ],
							"parameter_type" : 3,
							"parameter_invisible" : 2,
							"parameter_shortname" : "step",
							"parameter_longname" : "step",
							"parameter_linknames" : 1,
							"parameter_order" : 1001
						}

					}
,
					"stepcolor" : [ 0.180392, 0.345098, 1.0, 1.0 ],
					"stepcolor2" : [ 0.231373, 1.0, 1.0, 1.0 ],
					"unitruler" : 0,
					"varname" : "step"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-333",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 789.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 128.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd48",
							"parameter_longname" : "lcd48[2]",
							"parameter_order" : 432
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp12"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-334",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 789.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 113.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd47",
							"parameter_longname" : "lcd47[2]",
							"parameter_order" : 431
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "pn12"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-335",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 722.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 128.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd46",
							"parameter_longname" : "lcd46[2]",
							"parameter_order" : 430
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp11"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-336",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 722.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 113.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd45",
							"parameter_longname" : "lcd45[2]",
							"parameter_order" : 429
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "pn11"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-337",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 655.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 128.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd44",
							"parameter_longname" : "lcd44[2]",
							"parameter_order" : 428
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp10"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-338",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 655.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 113.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd43",
							"parameter_longname" : "lcd43[4]",
							"parameter_order" : 427
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "pn10"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-339",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 588.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 128.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd42",
							"parameter_longname" : "lcd42[4]",
							"parameter_order" : 426
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp9"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-340",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 588.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 113.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd41",
							"parameter_longname" : "lcd41[4]",
							"parameter_order" : 425
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "pn9"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-110",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 518.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 59.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd38",
							"parameter_longname" : "lcd38[2]",
							"parameter_order" : 424
						}

					}
,
					"text" : "channel",
					"varname" : "pn8"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-117",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 453.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 59.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd37",
							"parameter_longname" : "lcd37[2]",
							"parameter_order" : 423
						}

					}
,
					"text" : "selected",
					"varname" : "pn7"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-222",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 387.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 59.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd36",
							"parameter_longname" : "lcd36[1]",
							"parameter_order" : 422
						}

					}
,
					"text" : "currently",
					"varname" : "pn6"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-223",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 320.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 59.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd35",
							"parameter_longname" : "lcd35[1]",
							"parameter_order" : 421
						}

					}
,
					"text" : "the",
					"varname" : "pn5"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-286",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 254.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 6.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd34",
							"parameter_longname" : "lcd34[2]",
							"parameter_order" : 420
						}

					}
,
					"text" : "for",
					"varname" : "pn4"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-292",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 184.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 6.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd33",
							"parameter_longname" : "lcd33[2]",
							"parameter_order" : 419
						}

					}
,
					"text" : "assignment",
					"varname" : "pn3"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-296",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 117.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 6.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd32",
							"parameter_longname" : "lcd32[1]",
							"parameter_order" : 418
						}

					}
,
					"text" : "device",
					"varname" : "pn2"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-321",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 50.0, 28.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 6.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd31",
							"parameter_longname" : "lcd31[1]",
							"parameter_order" : 417
						}

					}
,
					"text" : "missing",
					"varname" : "pn1"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-323",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 519.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 74.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd48",
							"parameter_longname" : "lcd48[1]",
							"parameter_order" : 432
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp8"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-324",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 454.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 74.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd47",
							"parameter_longname" : "lcd47[1]",
							"parameter_order" : 431
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp7"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-325",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 386.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 74.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd46",
							"parameter_longname" : "lcd46[1]",
							"parameter_order" : 430
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp6"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-326",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 320.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 74.0, 61.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd45",
							"parameter_longname" : "lcd45[1]",
							"parameter_order" : 429
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp5"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-327",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 255.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 729.0, 21.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd44",
							"parameter_longname" : "lcd44[1]",
							"parameter_order" : 428
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp4"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-328",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 183.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 666.0, 21.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd43",
							"parameter_longname" : "lcd43[3]",
							"parameter_order" : 427
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp3"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-329",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 117.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 603.0, 21.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd42",
							"parameter_longname" : "lcd42[3]",
							"parameter_order" : 426
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp2"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.0, 0.0, 0.0, 0.639216 ],
					"activetextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"activetextoncolor" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
					"id" : "obj-330",
					"ignoreclick" : 1,
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 50.0, 52.0, 63.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.0, 21.0, 62.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_invisible" : 2,
							"parameter_shortname" : "lcd41",
							"parameter_longname" : "lcd41[3]",
							"parameter_order" : 425
						}

					}
,
					"text" : " ",
					"textcolor" : [ 1.0, 0.641304, 0.25, 1.0 ],
					"varname" : "mp1"
				}

			}
, 			{
				"box" : 				{
					"automation" : "time down",
					"automationon" : "time up",
					"fontsize" : 9.0,
					"hint" : "Decrease the speed of the sequence",
					"id" : "obj-200",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 380.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 570.0, 93.0, 26.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "time down", "time up" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "ocatve_down",
							"parameter_longname" : "timedngui",
							"parameter_linknames" : 1,
							"parameter_order" : 100
						}

					}
,
					"text" : "time-",
					"varname" : "timedngui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "time up",
					"automationon" : "time up",
					"fontsize" : 9.0,
					"hint" : "Increase the speed of the sequence",
					"id" : "obj-202",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 431.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 630.0, 93.0, 26.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "time up", "time up" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "octave_up",
							"parameter_longname" : "timeupgui",
							"parameter_linknames" : 1,
							"parameter_order" : 101
						}

					}
,
					"text" : "time+",
					"varname" : "timeupgui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "pitch down",
					"automationon" : "pitch down",
					"fontsize" : 9.0,
					"hint" : "Shift the global note offset one step down",
					"id" : "obj-204",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 482.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 697.0, 93.0, 26.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "pitch down", "pitch down" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "pitch_down",
							"parameter_longname" : "pitchdngui",
							"parameter_linknames" : 1,
							"parameter_order" : 102
						}

					}
,
					"text" : "-1st",
					"varname" : "pitchdngui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "pitch up",
					"automationon" : "pitch up",
					"fontsize" : 9.0,
					"hint" : "Shift the global note offset one step up",
					"id" : "obj-206",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 533.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.0, 93.0, 26.0, 13.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "pitch up", "pitch up" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "pitch_up",
							"parameter_longname" : "pitchupgui",
							"parameter_linknames" : 1,
							"parameter_order" : 103
						}

					}
,
					"text" : "+1st",
					"varname" : "pitchupgui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "rotate right",
					"automationon" : "rotate right",
					"fontsize" : 9.0,
					"hint" : "Shift the sequence 1/16th to the right",
					"id" : "obj-210",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 227.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.0, 147.0, 25.0, 12.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "rotate right", "rotate right" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "rotright",
							"parameter_longname" : "rotrightgui",
							"parameter_linknames" : 1,
							"parameter_order" : 106
						}

					}
,
					"text" : "R>",
					"texton" : "R>",
					"varname" : "rotrightgui"
				}

			}
, 			{
				"box" : 				{
					"automation" : "rotate left",
					"automationon" : "rotate left",
					"fontsize" : 9.0,
					"hint" : "Shift the sequence 1/16th to the left",
					"id" : "obj-211",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 177.0, 160.0, 35.0, 15.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 697.0, 147.0, 25.0, 12.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_enum" : [ "rotate left", "rotate left" ],
							"parameter_mmax" : 1.0,
							"parameter_type" : 2,
							"parameter_shortname" : "rotleft",
							"parameter_longname" : "rotleftgui",
							"parameter_linknames" : 1,
							"parameter_order" : 107
						}

					}
,
					"text" : "<L",
					"texton" : "<L",
					"varname" : "rotleftgui"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "",
					"id" : "obj-155",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 523.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 732.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_7",
							"parameter_longname" : "Encoder_7",
							"parameter_linknames" : 1,
							"parameter_order" : 17,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_7"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"hint" : "",
					"id" : "obj-163",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 455.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 668.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_6",
							"parameter_longname" : "Encoder_6",
							"parameter_linknames" : 1,
							"parameter_order" : 16,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_6"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-168",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 388.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 604.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_5",
							"parameter_longname" : "Encoder_5",
							"parameter_linknames" : 1,
							"parameter_order" : 15,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_5"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-172",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 320.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 541.0, 89.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_4",
							"parameter_longname" : "Encoder_4",
							"parameter_linknames" : 1,
							"parameter_order" : 14,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_4"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-176",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 253.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 731.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_3",
							"parameter_longname" : "Encoder_3",
							"parameter_linknames" : 1,
							"parameter_order" : 13,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_3"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-180",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 185.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 669.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_2",
							"parameter_longname" : "Encoder_2",
							"parameter_linknames" : 1,
							"parameter_order" : 12,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_2"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-184",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 118.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 605.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_1",
							"parameter_longname" : "Encoder_1",
							"parameter_linknames" : 1,
							"parameter_order" : 11,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_1"
				}

			}
, 			{
				"box" : 				{
					"activedialcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"appearance" : 1,
					"id" : "obj-188",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 50.0, 80.0, 25.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 35.0, 25.0, 23.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 0,
							"parameter_type" : 0,
							"parameter_shortname" : "Encoder_0",
							"parameter_longname" : "Encoder_0",
							"parameter_linknames" : 1,
							"parameter_order" : 10,
							"parameter_defer" : 1
						}

					}
,
					"showname" : 0,
					"shownumber" : 0,
					"varname" : "Encoder_0"
				}

			}
, 			{
				"box" : 				{
					"autosize" : 1,
					"bkgndpict" : "",
					"cellpict" : "RGB_button_abc.png",
					"clickedimage" : 0,
					"columns" : 4,
					"hint" : "",
					"horizontalmargin" : 0,
					"horizontalspacing" : 3,
					"id" : "obj-123",
					"inactiveimage" : 0,
					"maxclass" : "matrixctrl",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "list" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 98.0, 236.0, 132.0, 132.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 32.0, 132.0, 132.0 ],
					"range" : 16,
					"varname" : "padgui",
					"verticalmargin" : 0,
					"verticalspacing" : 3
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-100",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 869.0, 676.0, 13.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 164.5, 5.0, 14.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-101",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 883.0, 676.0, 32.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 178.5, 5.0, 24.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-102",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 916.0, 676.0, 24.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 202.5, 5.0, 14.0, 27.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-30",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 784.5, 676.0, 13.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.0, 1.0, 144.0, 168.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-29",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 798.5, 676.0, 32.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 159.0, 1.0, 367.0, 168.0 ]
				}

			}
, 			{
				"box" : 				{
					"background" : 1,
					"bgcolor" : [ 0.482353, 0.482353, 0.482353, 1.0 ],
					"border" : 2,
					"id" : "obj-26",
					"maxclass" : "panel",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 831.5, 676.0, 24.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 533.0, 1.0, 263.0, 168.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 958.5, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 943.0, 519.0, 958.5, 519.0 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 943.0, 505.75, 851.0, 505.75 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 387.75, 562.5, 439.5, 562.5 ],
					"source" : [ "obj-112", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 336.0, 562.5, 439.5, 562.5 ],
					"source" : [ "obj-112", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 630.75, 328.5, 486.5, 328.5 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-115", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 486.5, 414.0, 486.5, 414.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 486.5, 430.0, 720.5, 430.0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 541.5, 589.5, 439.5, 589.5 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 498.125, 290.0, 531.0, 290.0, 531.0, 233.0, 559.5, 233.0 ],
					"source" : [ "obj-16", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 59.5, 601.0, 159.0, 601.0, 159.0, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-206", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 720.0, 589.5, 439.5, 589.5 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-211", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 16 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 919.5, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-3", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 811.25, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-3", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 486.5, 357.0, 340.5, 357.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 173.5, 476.5, 151.5, 476.5 ],
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 84.5, 232.0, 84.0, 232.0, 84.0, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 851.0, 589.0, 556.0, 589.0, 556.0, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 222.5, 476.5, 151.5, 476.5 ],
					"source" : [ "obj-39", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 171.5, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 641.75, 419.0, 897.0, 419.0 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 594.75, 430.0, 720.0, 430.0, 720.0, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-56", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 439.5, 680.0, 545.0, 680.0, 545.0, 600.0, 439.5, 600.0 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 151.5, 601.5, 439.5, 601.5 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 720.5, 329.0, 486.5, 329.0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 82.5, 670.0, 59.0, 670.0, 59.0, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-67", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 232.5, 689.5, 232.5, 689.5 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 720.5, 589.5, 439.5, 589.5 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"destination" : [ "obj-112", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 232.5, 634.0, 207.5, 634.0, 207.5, 518.0, 232.5, 518.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 470.5, 589.0, 439.5, 589.0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 848.5, 156.0, 848.176453, 156.0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 958.5, 505.5, 851.0, 505.5 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 127.5, 487.0, 127.0, 487.0, 127.0, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 17 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 106.5, 601.0, 232.5, 601.0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 576.5, 689.0, 556.25, 689.0, 556.25, 594.0, 439.5, 594.0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 384.0, 369.5, 384.0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 340.5, 416.0, 439.5, 416.0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-3.5::obj-116" : [ "note[4]", "note", 140 ],
			"obj-3.13::obj-116" : [ "note[12]", "note", 140 ],
			"obj-8" : [ "moddial", "moddial", 39 ],
			"obj-3.13::obj-81" : [ "channelpattr[12]", "channelpattr", 60 ],
			"obj-22" : [ "Groove", "Groove", 19 ],
			"obj-188" : [ "Encoder_0", "Encoder_0", 10 ],
			"obj-3.10::obj-81" : [ "channelpattr[9]", "channelpattr", 60 ],
			"obj-86" : [ "Speed6", "Speed6", 45 ],
			"obj-3.15::obj-121" : [ "polyenable[14]", "polyenable", 200 ],
			"obj-200" : [ "timedngui", "ocatve_down", 100 ],
			"obj-3.4::obj-121" : [ "polyenable[3]", "polyenable", 200 ],
			"obj-3.12::obj-121" : [ "polyenable[11]", "polyenable", 200 ],
			"obj-3.3::obj-115" : [ "modepattr[2]", "modepattr", 120 ],
			"obj-3.4::obj-81" : [ "channelpattr[3]", "channelpattr", 60 ],
			"obj-338" : [ "lcd43[4]", "lcd43", 427 ],
			"obj-3.9::obj-115" : [ "modepattr[8]", "modepattr", 120 ],
			"obj-91" : [ "Speed1", "Speed1", 40 ],
			"obj-3.6::obj-121" : [ "polyenable[5]", "polyenable", 200 ],
			"obj-3.9::obj-121" : [ "polyenable[8]", "polyenable", 200 ],
			"obj-163" : [ "Encoder_6", "Encoder_6", 16 ],
			"obj-3.16::obj-81" : [ "channelpattr[15]", "channelpattr", 60 ],
			"obj-9" : [ "notevaluesgui", "notevalue", 36 ],
			"obj-97" : [ "Speed12", "Speed12", 51 ],
			"obj-112::obj-151" : [ "client", "client", 0 ],
			"obj-38::obj-29" : [ "setting2[1]", "keymode", 1005 ],
			"obj-222" : [ "lcd36[1]", "lcd36", 422 ],
			"obj-3.13::obj-129" : [ "polyoffsetpattr[12]", "polyoffsetpattr", 260 ],
			"obj-334" : [ "lcd47[2]", "lcd47", 431 ],
			"obj-184" : [ "Encoder_1", "Encoder_1", 11 ],
			"obj-68" : [ "stepmodegui", "editmode", 35 ],
			"obj-3.10::obj-129" : [ "polyoffsetpattr[9]", "polyoffsetpattr", 260 ],
			"obj-85" : [ "Speed7", "Speed7", 46 ],
			"obj-38::obj-5" : [ "setting4[1]", "transposesteps", 1006 ],
			"obj-3.7::obj-121" : [ "polyenable[6]", "polyenable", 200 ],
			"obj-3.10::obj-116" : [ "note[9]", "note", 140 ],
			"obj-3.15::obj-116" : [ "note[14]", "note", 140 ],
			"obj-1" : [ "step", "step", 1001 ],
			"obj-292" : [ "lcd33[2]", "lcd33", 419 ],
			"obj-3.4::obj-116" : [ "note[3]", "note", 140 ],
			"obj-210" : [ "rotrightgui", "rotright", 106 ],
			"obj-3.4::obj-115" : [ "modepattr[3]", "modepattr", 120 ],
			"obj-62" : [ "device", "device", 1000 ],
			"obj-90" : [ "Speed2", "Speed2", 41 ],
			"obj-3.6::obj-115" : [ "modepattr[5]", "modepattr", 120 ],
			"obj-3.9::obj-129" : [ "polyoffsetpattr[8]", "polyoffsetpattr", 260 ],
			"obj-6" : [ "storage", "storage", 500 ],
			"obj-339" : [ "lcd42[4]", "lcd42", 426 ],
			"obj-204" : [ "pitchdngui", "pitch_down", 102 ],
			"obj-94" : [ "Speed15", "Speed15", 54 ],
			"obj-40" : [ "keymodeadv", "mode_advance", 105 ],
			"obj-38::obj-104" : [ "outport[2]", "outport", 100 ],
			"obj-3.6::obj-116" : [ "note[5]", "note", 140 ],
			"obj-155" : [ "Encoder_7", "Encoder_7", 17 ],
			"obj-323" : [ "lcd48[1]", "lcd48", 432 ],
			"obj-95" : [ "Speed14", "Speed14", 53 ],
			"obj-3.1::obj-116" : [ "note", "note", 140 ],
			"obj-3.11::obj-129" : [ "polyoffsetpattr[10]", "polyoffsetpattr", 260 ],
			"obj-96" : [ "Speed13", "Speed13", 52 ],
			"obj-324" : [ "lcd47[1]", "lcd47", 431 ],
			"obj-3.2::obj-129" : [ "polyoffsetpattr[1]", "polyoffsetpattr", 260 ],
			"obj-3.11::obj-81" : [ "channelpattr[10]", "channelpattr", 60 ],
			"obj-66" : [ "polyselector", "live.tab[1]", 2000 ],
			"obj-325" : [ "lcd46[1]", "lcd46", 430 ],
			"obj-3.1::obj-129" : [ "polyoffsetpattr", "polyoffsetpattr", 260 ],
			"obj-3.2::obj-115" : [ "modepattr[1]", "modepattr", 120 ],
			"obj-3.13::obj-121" : [ "polyenable[12]", "polyenable", 200 ],
			"obj-3.16::obj-115" : [ "modepattr[15]", "modepattr", 120 ],
			"obj-107" : [ "Channel", "Channel", 23 ],
			"obj-326" : [ "lcd45[1]", "lcd45", 429 ],
			"obj-327" : [ "lcd44[1]", "lcd44", 428 ],
			"obj-180" : [ "Encoder_2", "Encoder_2", 12 ],
			"obj-3.5::obj-81" : [ "channelpattr[4]", "channelpattr", 60 ],
			"obj-79" : [ "Speed8", "Speed8", 47 ],
			"obj-328" : [ "lcd43[3]", "lcd43", 427 ],
			"obj-3.7::obj-116" : [ "note[6]", "note", 140 ],
			"obj-3.10::obj-115" : [ "modepattr[9]", "modepattr", 120 ],
			"obj-335" : [ "lcd46[2]", "lcd46", 430 ],
			"obj-329" : [ "lcd42[3]", "lcd42", 426 ],
			"obj-3.10::obj-121" : [ "polyenable[9]", "polyenable", 200 ],
			"obj-3.15::obj-129" : [ "polyoffsetpattr[14]", "polyoffsetpattr", 260 ],
			"obj-330" : [ "lcd41[3]", "lcd41", 425 ],
			"obj-115" : [ "timebase", "timebase", 25 ],
			"obj-3.12::obj-129" : [ "polyoffsetpattr[11]", "polyoffsetpattr", 260 ],
			"obj-89" : [ "Speed3", "Speed3", 42 ],
			"obj-3.3::obj-129" : [ "polyoffsetpattr[2]", "polyoffsetpattr", 260 ],
			"obj-3.14::obj-129" : [ "polyoffsetpattr[13]", "polyoffsetpattr", 260 ],
			"obj-340" : [ "lcd41[4]", "lcd41", 425 ],
			"obj-3.8::obj-129" : [ "polyoffsetpattr[7]", "polyoffsetpattr", 260 ],
			"obj-3.11::obj-116" : [ "note[10]", "note", 140 ],
			"obj-103" : [ "Mode", "Mode", 21 ],
			"obj-3.8::obj-81" : [ "channelpattr[7]", "channelpattr", 60 ],
			"obj-3.11::obj-121" : [ "polyenable[10]", "polyenable", 200 ],
			"obj-3.16::obj-129" : [ "polyoffsetpattr[15]", "polyoffsetpattr", 260 ],
			"obj-3.2::obj-121" : [ "polyenable[1]", "polyenable", 200 ],
			"obj-176" : [ "Encoder_3", "Encoder_3", 13 ],
			"obj-33" : [ "repeatgui", "repeat_enable", 104 ],
			"obj-38::obj-45" : [ "setting1[1]", "keymode", 1004 ],
			"obj-3.5::obj-115" : [ "modepattr[4]", "modepattr", 120 ],
			"obj-78" : [ "Speed9", "Speed9", 48 ],
			"obj-19" : [ "RotSize", "RotSize", 24 ],
			"obj-3.5::obj-121" : [ "polyenable[4]", "polyenable", 200 ],
			"obj-3.13::obj-115" : [ "modepattr[12]", "modepattr", 120 ],
			"obj-223" : [ "lcd35[1]", "lcd35", 421 ],
			"obj-3.7::obj-81" : [ "channelpattr[6]", "channelpattr", 60 ],
			"obj-114" : [ "BaseTime", "BaseTime", 56 ],
			"obj-64" : [ "transposegui", "transpose", 32 ],
			"obj-3.7::obj-129" : [ "polyoffsetpattr[6]", "polyoffsetpattr", 260 ],
			"obj-3.15::obj-81" : [ "channelpattr[14]", "channelpattr", 60 ],
			"obj-206" : [ "pitchupgui", "pitch_up", 103 ],
			"obj-336" : [ "lcd45[2]", "lcd45", 429 ],
			"obj-3.1::obj-115" : [ "modepattr", "modepattr", 120 ],
			"obj-3.12::obj-116" : [ "note[11]", "note", 140 ],
			"obj-88" : [ "Speed4", "Speed4", 43 ],
			"obj-45" : [ "keymodegui", "keymode", 34 ],
			"obj-3.3::obj-121" : [ "polyenable[2]", "polyenable", 200 ],
			"obj-3.12::obj-81" : [ "channelpattr[11]", "channelpattr", 60 ],
			"obj-296" : [ "lcd32[1]", "lcd32", 418 ],
			"obj-81" : [ "padtrig", "padgui", 1010 ],
			"obj-105::obj-1" : [ "devices", "devices", 1999 ],
			"obj-3.3::obj-81" : [ "channelpattr[2]", "channelpattr", 60 ],
			"obj-80" : [ "keytrig", "keygui", 1011 ],
			"obj-3.6::obj-81" : [ "channelpattr[5]", "channelpattr", 60 ],
			"obj-3.14::obj-121" : [ "polyenable[13]", "polyenable", 200 ],
			"obj-3.6::obj-129" : [ "polyoffsetpattr[5]", "polyoffsetpattr", 260 ],
			"obj-3.14::obj-116" : [ "note[13]", "note", 140 ],
			"obj-104" : [ "PolyOffset", "PolyOffset", 22 ],
			"obj-25" : [ "notetypegui", "notetype", 37 ],
			"obj-3.8::obj-115" : [ "modepattr[7]", "modepattr", 120 ],
			"obj-110" : [ "lcd38[2]", "lcd38", 424 ],
			"obj-3.2::obj-81" : [ "channelpattr[1]", "channelpattr", 60 ],
			"obj-3.8::obj-121" : [ "polyenable[7]", "polyenable", 200 ],
			"obj-3.16::obj-121" : [ "polyenable[15]", "polyenable", 200 ],
			"obj-172" : [ "Encoder_4", "Encoder_4", 14 ],
			"obj-3.2::obj-116" : [ "note[1]", "note", 140 ],
			"obj-27" : [ "lockgui", "lock", 109 ],
			"obj-20" : [ "Random", "Random", 20 ],
			"obj-74" : [ "Speed10", "Speed10", 49 ],
			"obj-3.5::obj-129" : [ "polyoffsetpattr[4]", "polyoffsetpattr", 260 ],
			"obj-92" : [ "Speed16", "Speed16", 55 ],
			"obj-3.7::obj-115" : [ "modepattr[6]", "modepattr", 120 ],
			"obj-3.15::obj-115" : [ "modepattr[14]", "modepattr", 120 ],
			"obj-286" : [ "lcd34[2]", "lcd34", 420 ],
			"obj-24" : [ "Repeat", "Repeat", 18 ],
			"obj-87" : [ "Speed5", "Speed5", 44 ],
			"obj-3.1::obj-81" : [ "channelpattr", "channelpattr", 60 ],
			"obj-3.12::obj-115" : [ "modepattr[11]", "modepattr", 120 ],
			"obj-337" : [ "lcd44[2]", "lcd44", 428 ],
			"obj-3.3::obj-116" : [ "note[2]", "note", 140 ],
			"obj-3.4::obj-129" : [ "polyoffsetpattr[3]", "polyoffsetpattr", 260 ],
			"obj-109" : [ "GlobSpeed", "GlobSpeed", 56 ],
			"obj-202" : [ "timeupgui", "octave_up", 101 ],
			"obj-44" : [ "padmodegui", "padmode", 33 ],
			"obj-3.9::obj-116" : [ "note[8]", "note", 140 ],
			"obj-211" : [ "rotleftgui", "rotleft", 107 ],
			"obj-321" : [ "lcd31[1]", "lcd31", 417 ],
			"obj-3.9::obj-81" : [ "channelpattr[8]", "channelpattr", 60 ],
			"obj-3.14::obj-81" : [ "channelpattr[13]", "channelpattr", 60 ],
			"obj-38::obj-1" : [ "ruledefs", "ruledefs", 1020 ],
			"obj-3.14::obj-115" : [ "modepattr[13]", "modepattr", 120 ],
			"obj-31" : [ "directiongui", "direction", 38 ],
			"obj-38::obj-36" : [ "setting3[1]", "live.numbox", 1007 ],
			"obj-3.1::obj-121" : [ "polyenable", "polyenable", 200 ],
			"obj-3.11::obj-115" : [ "modepattr[10]", "modepattr", 120 ],
			"obj-3.16::obj-116" : [ "note[15]", "note", 140 ],
			"obj-168" : [ "Encoder_5", "Encoder_5", 15 ],
			"obj-3.8::obj-116" : [ "note[7]", "note", 140 ],
			"obj-117" : [ "lcd37[2]", "lcd37", 423 ],
			"obj-23" : [ "Speed11", "Speed11", 50 ],
			"obj-71" : [ "device_name", "device_name", 433 ],
			"obj-333" : [ "lcd48[2]", "lcd48", 432 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "RGB_button_abc.png",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "fold",
				"implicit" : 1
			}
, 			{
				"name" : "steppr_wheel_b995e.maxpat",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "polyplay.maxpat",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fractorder.js",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "sig_accum.gendsp",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "hex_mod_b995e.js",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "rgb_only.png",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "rgb_horizontal.png",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "PNG ",
				"implicit" : 1
			}
, 			{
				"name" : "mod_b995.maxpat",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig",
				"patcherrelativepath" : "",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "mod_b995.js",
				"bootpath" : "/Applications/Max6/patches/aumhaa_blocks_orig/js",
				"patcherrelativepath" : "../aumhaa_blocks_orig/js",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "lh_midiout.mxo",
				"type" : "iLaX"
			}
 ]
	}

}
