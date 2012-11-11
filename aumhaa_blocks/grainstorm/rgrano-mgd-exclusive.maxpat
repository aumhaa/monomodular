{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 44.0, 60.0, 1440.0, 826.0 ],
		"bgcolor" : [ 0.792157, 0.792157, 0.792157, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 44.0, 60.0, 1440.0, 826.0 ],
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
					"maxclass" : "newobj",
					"text" : "sprintf set %s_lo_trans",
					"patching_rect" : [ 1473.0, 139.0, 128.0, 20.0 ],
					"id" : "obj-241",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 1382.0, 59.0, 67.0, 20.0 ],
					"id" : "obj-242",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 1382.0, 59.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s s",
					"patching_rect" : [ 1383.0, 84.0, 115.5, 20.0 ],
					"id" : "obj-243",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 11.595187,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %s_hi_trans",
					"patching_rect" : [ 1382.0, 115.0, 128.0, 20.0 ],
					"id" : "obj-244",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 1382.0, 30.0, 58.0, 20.0 ],
					"id" : "obj-245",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 1382.0, 30.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 738.0, 942.0, 67.0, 20.0 ],
					"id" : "obj-238",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 738.0, 942.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %smomentary",
					"patching_rect" : [ 738.0, 970.0, 138.0, 20.0 ],
					"id" : "obj-239",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 738.0, 970.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 738.0, 913.0, 58.0, 20.0 ],
					"id" : "obj-240",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 738.0, 913.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 495.0, 1440.0, 67.0, 20.0 ],
					"id" : "obj-225",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 495.0, 1440.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %sfilter",
					"patching_rect" : [ 495.0, 1470.0, 102.0, 20.0 ],
					"id" : "obj-232",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 495.0, 1411.0, 58.0, 20.0 ],
					"id" : "obj-235",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 495.0, 1411.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 494.718384, 1498.843628, 19.0, 20.0 ],
					"id" : "obj-237",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 494.718384, 1498.843628, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 141.0, 1174.0, 67.0, 20.0 ],
					"id" : "obj-222",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 227.0, 1166.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %svolume",
					"patching_rect" : [ 141.0, 1204.0, 117.0, 20.0 ],
					"id" : "obj-223",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 141.0, 1145.0, 58.0, 20.0 ],
					"id" : "obj-224",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 227.0, 1137.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %strigger",
					"patching_rect" : [ 115.0, 886.0, 113.0, 20.0 ],
					"id" : "obj-221",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 11.0, 577.0, 67.0, 20.0 ],
					"id" : "obj-218",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 381.0, 642.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %smomentary",
					"patching_rect" : [ 11.0, 605.0, 138.0, 20.0 ],
					"id" : "obj-219",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 11.0, 548.0, 58.0, 20.0 ],
					"id" : "obj-220",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 381.0, 613.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %s_hi_dur_range",
					"patching_rect" : [ 820.0, 137.0, 155.0, 20.0 ],
					"id" : "obj-212",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %s_lo_dur_range",
					"patching_rect" : [ 773.0, 90.0, 155.0, 20.0 ],
					"id" : "obj-190",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %s_hi_range",
					"patching_rect" : [ 686.0, 117.0, 132.0, 20.0 ],
					"id" : "obj-189",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2_hi_dur_range",
					"patching_rect" : [ 487.605103, 93.95929, 109.0, 20.0 ],
					"id" : "obj-186",
					"fontname" : "Arial",
					"numinlets" : 0,
					"presentation_rect" : [ 584.605103, 134.95929, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2_lo_dur_range",
					"patching_rect" : [ 463.605103, 71.95929, 109.0, 20.0 ],
					"id" : "obj-177",
					"fontname" : "Arial",
					"numinlets" : 0,
					"presentation_rect" : [ 560.605103, 112.95929, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2_hi_range",
					"patching_rect" : [ 396.605103, 97.95929, 85.0, 20.0 ],
					"id" : "obj-138",
					"fontname" : "Arial",
					"numinlets" : 0,
					"presentation_rect" : [ 493.605103, 138.95929, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 595.0, 37.0, 67.0, 20.0 ],
					"id" : "obj-81",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 615.0, 33.0, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s s s s",
					"patching_rect" : [ 596.0, 62.0, 252.5, 20.0 ],
					"id" : "obj-79",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 11.595187,
					"outlettype" : [ "", "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2_lo_range",
					"patching_rect" : [ 374.605103, 73.95929, 85.0, 20.0 ],
					"id" : "obj-78",
					"fontname" : "Arial",
					"numinlets" : 0,
					"presentation_rect" : [ 471.605103, 114.95929, 0.0, 0.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf set %s_lo_range",
					"patching_rect" : [ 595.0, 93.0, 132.0, 20.0 ],
					"id" : "obj-75",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 595.0, 8.0, 58.0, 20.0 ],
					"id" : "obj-64",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "v #2_prefix",
					"patching_rect" : [ 53.0, 103.0, 67.0, 20.0 ],
					"id" : "obj-63",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend ---",
					"patching_rect" : [ 53.0, 50.0, 68.0, 20.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf %s%s",
					"patching_rect" : [ 53.0, 77.0, 78.0, 20.0 ],
					"id" : "obj-46",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess #2",
					"patching_rect" : [ 53.0, 24.0, 76.0, 20.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "bgcolor 1. 1. 1. 0.8",
					"patching_rect" : [ 336.0, 1378.0, 110.0, 18.0 ],
					"id" : "obj-543",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "fx send",
					"patching_rect" : [ 389.0, 23.0, 131.0, 17.0 ],
					"presentation" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"id" : "obj-53",
					"fontname" : "Arial Bold",
					"frgb" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"numinlets" : 1,
					"presentation_rect" : [ 509.0, 49.0, 72.0, 17.0 ],
					"numoutlets" : 0,
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "volume",
					"patching_rect" : [ 418.0, 188.0, 131.0, 17.0 ],
					"presentation" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"id" : "obj-52",
					"fontname" : "Arial Bold",
					"frgb" : [ 0.0, 0.0, 0.0, 0.741176 ],
					"numinlets" : 1,
					"presentation_rect" : [ 509.0, 30.0, 72.0, 17.0 ],
					"numoutlets" : 0,
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "send~ ---gs_aux_R",
					"patching_rect" : [ 614.0, 1463.0, 109.0, 20.0 ],
					"id" : "obj-51",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "send~ ---gs_aux_L",
					"patching_rect" : [ 578.0, 1432.0, 108.0, 20.0 ],
					"id" : "obj-50",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"patching_rect" : [ 571.718384, 1277.843628, 60.0, 18.0 ],
					"presentation" : 1,
					"slidercolor" : [ 0.0, 0.0, 0.180392, 0.784314 ],
					"contdata" : 1,
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"orientation" : 0,
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"ghostbar" : 20,
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.941176, 0.941176, 0.941176, 1.0 ],
					"id" : "obj-47",
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"numinlets" : 1,
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"presentation_rect" : [ 506.718384, 49.843628, 79.72686, 14.670395 ],
					"setminmax" : [ 0.0, 158.0 ],
					"settype" : 0,
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"numoutlets" : 2,
					"thickness" : 1,
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"patching_rect" : [ 593.323608, 1312.802856, 20.0, 99.0 ],
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 118.0,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"id" : "obj-48",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"patching_rect" : [ 571.718384, 1312.802856, 20.0, 99.0 ],
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 67.0,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"id" : "obj-49",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 782.148926, 893.083801, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"rounded" : 4.0,
					"texton" : "C",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-45",
					"fontname" : "Arial Bold",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 43.588444, 61.119904, 20.201328, 16.964804 ],
					"numoutlets" : 3,
					"text" : "C",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"patching_rect" : [ 864.0, 890.0, 70.0, 20.0 ],
					"id" : "obj-12",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 1595.0, 1047.0, 32.5, 18.0 ],
					"id" : "obj-44",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 1559.0, 1049.0, 32.5, 18.0 ],
					"id" : "obj-43",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 1554.0, 995.0, 35.0, 20.0 ],
					"id" : "obj-39",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 1597.0, 1085.0, 33.0, 20.0 ],
					"id" : "obj-38",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 943.0, 919.0, 20.0, 20.0 ],
					"id" : "obj-32",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "append $1",
					"patching_rect" : [ 943.0, 945.0, 65.0, 18.0 ],
					"id" : "obj-34",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#2",
					"patching_rect" : [ 670.0, 995.0, 32.5, 18.0 ],
					"id" : "obj-42",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"patching_rect" : [ 670.0, 1019.0, 32.5, 20.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess",
					"patching_rect" : [ 670.0, 969.0, 60.0, 20.0 ],
					"id" : "obj-40",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 1121.0, 959.0, 72.0, 20.0 ],
					"id" : "obj-36",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 882.0, 921.0, 20.0, 20.0 ],
					"id" : "obj-216",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "loop $1",
					"patching_rect" : [ 882.0, 947.0, 49.0, 18.0 ],
					"id" : "obj-217",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "record~",
					"patching_rect" : [ 1227.323608, 1125.843628, 52.0, 20.0 ],
					"id" : "obj-214",
					"fontname" : "Arial",
					"numinlets" : 3,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"patching_rect" : [ 395.718384, 1480.843628, 72.0, 20.0 ],
					"id" : "obj-213",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive~ ---gs_audio_input",
					"patching_rect" : [ 1166.0, 1030.0, 153.0, 20.0 ],
					"id" : "obj-339",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 630.623596, 1076.119873, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"rounded" : 4.0,
					"ignoreclick" : 1,
					"texton" : "focus",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-236",
					"fontname" : "Arial",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 5.718567, 7.119904, 58.0, 17.0 ],
					"numoutlets" : 3,
					"text" : "focus",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll focus_switch",
					"patching_rect" : [ 630.623596, 922.052307, 101.0, 20.0 ],
					"id" : "obj-330",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 12.0,
					"outlettype" : [ "", "", "", "" ],
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
					"patching_rect" : [ 630.623596, 895.368347, 58.0, 20.0 ],
					"id" : "obj-335",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl mth 1",
					"patching_rect" : [ 630.623596, 1046.0, 58.0, 20.0 ],
					"id" : "obj-329",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 724.718384, 1059.119873, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"rounded" : 4.0,
					"ignoreclick" : 1,
					"texton" : "adsr",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-342",
					"fontname" : "Arial",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 5.718567, 43.276337, 58.0, 17.0 ],
					"numoutlets" : 3,
					"text" : "sustain",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"patching_rect" : [ 724.718384, 1029.843628, 32.5, 20.0 ],
					"id" : "obj-312",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 724.718384, 1001.843567, 19.0, 20.0 ],
					"id" : "obj-313",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"patching_rect" : [ 1346.0, 600.0, 55.0, 20.0 ],
					"id" : "obj-233",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"patching_rect" : [ 1342.0, 569.0, 102.0, 20.0 ],
					"id" : "obj-234",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.meter~",
					"patching_rect" : [ 95.718384, 1580.843628, 101.0, 8.0 ],
					"presentation" : 1,
					"slidercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"coldcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"orientation" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-227",
					"numinlets" : 1,
					"warmcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"presentation_rect" : [ 509.0, 17.178925, 78.0, 8.0 ],
					"numoutlets" : 1,
					"hotcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"outlettype" : [ "list" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.meter~",
					"patching_rect" : [ 77.718384, 1550.843628, 101.0, 8.0 ],
					"presentation" : 1,
					"slidercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"coldcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"orientation" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-228",
					"numinlets" : 1,
					"warmcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"presentation_rect" : [ 509.0, 9.156631, 78.0, 8.0 ],
					"numoutlets" : 1,
					"hotcolor" : [ 0.082353, 0.25098, 0.431373, 1.0 ],
					"outlettype" : [ "list" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 140.718384, 1232.843628, 19.0, 20.0 ],
					"id" : "obj-459",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "biquad~",
					"patching_rect" : [ 468.718384, 1680.843628, 79.0, 20.0 ],
					"id" : "obj-684",
					"fontname" : "Arial",
					"numinlets" : 6,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "biquad~",
					"patching_rect" : [ 381.718414, 1680.843628, 79.0, 20.0 ],
					"id" : "obj-683",
					"fontname" : "Arial",
					"numinlets" : 6,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"patching_rect" : [ 373.718414, 1531.843628, 95.0, 17.0 ],
					"presentation" : 1,
					"items" : [ "lowpass", ",", "highpass", ",", "bandpass", ",", "bandstop", ",", "peaknotch", ",", "lowshelf", ",", "highshelf", ",", "resonant", ",", "allpass" ],
					"align" : 1,
					"rounded" : 0,
					"id" : "obj-680",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 393.276306, 74.0, 111.267944, 17.0 ],
					"numoutlets" : 3,
					"fontsize" : 9.0,
					"outlettype" : [ "int", "", "" ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"patching_rect" : [ 595.718384, 1531.843628, 72.0, 20.0 ],
					"id" : "obj-679",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "filtergraph~",
					"markercolor" : [ 0.509804, 0.509804, 0.509804, 1.0 ],
					"patching_rect" : [ 408.718414, 1562.843628, 165.0, 91.0 ],
					"domain" : [ 0.0, 22050.0 ],
					"presentation" : 1,
					"autoout" : 1,
					"dbdisplay" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.8 ],
					"id" : "obj-627",
					"numdisplay" : 0,
					"fgcolor" : [ 0.0, 0.0, 0.0, 0.15 ],
					"numinlets" : 8,
					"hcurvecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bwidthcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 393.276306, 6.868423, 111.0, 62.935844 ],
					"numoutlets" : 7,
					"hbwidthcolor" : [ 0.0, 0.0, 0.39, 1.0 ],
					"fontsize" : 8.998901,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"nfilters" : 1,
					"setfilter" : [ 0, 1, 0, 0, 0, 321.819885, 1.0, 0.5, 0.0001, 22050.0, 0.0001, 16.0, 0.5, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "plugout~",
					"patching_rect" : [ 394.718414, 1770.843628, 57.0, 20.0 ],
					"id" : "obj-509",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "signal", "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"patching_rect" : [ 140.718384, 1265.843628, 60.0, 18.0 ],
					"presentation" : 1,
					"slidercolor" : [ 0.0, 0.0, 0.180392, 0.784314 ],
					"contdata" : 1,
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"orientation" : 0,
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"ghostbar" : 20,
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"bgcolor" : [ 0.941176, 0.941176, 0.941176, 1.0 ],
					"id" : "obj-331",
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"numinlets" : 1,
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"presentation_rect" : [ 507.189148, 30.881058, 79.72686, 14.670395 ],
					"setminmax" : [ 0.0, 158.0 ],
					"settype" : 0,
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"numoutlets" : 2,
					"thickness" : 1,
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"patching_rect" : [ 162.323608, 1300.802856, 20.0, 99.0 ],
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 118.0,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"id" : "obj-229",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"bordercolor" : [ 0.333333, 0.333333, 0.333333, 0.0 ],
					"patching_rect" : [ 140.718384, 1300.802856, 20.0, 99.0 ],
					"stripecolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"interp" : 67.0,
					"knobcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"id" : "obj-230",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b",
					"patching_rect" : [ 1581.0, 870.0, 32.5, 20.0 ],
					"id" : "obj-325",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 0",
					"patching_rect" : [ 1619.718506, 945.843567, 24.0, 20.0 ],
					"id" : "obj-318",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 1",
					"patching_rect" : [ 1585.718506, 941.843567, 24.0, 20.0 ],
					"id" : "obj-319",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 1000",
					"patching_rect" : [ 1604.718506, 908.843567, 69.0, 20.0 ],
					"id" : "obj-317",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 1531.718628, 1123.119873, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 1.0, 0.0, 0.0, 0.654902 ],
					"rounded" : 4.0,
					"ignoreclick" : 1,
					"texton" : "recording",
					"bgoncolor" : [ 1.0, 0.0, 0.0, 0.682353 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-316",
					"fontname" : "Arial",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 5.718567, 61.119904, 37.412285, 17.0 ],
					"numoutlets" : 3,
					"text" : "record",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route size",
					"patching_rect" : [ 1597.0, 821.0, 104.0, 20.0 ],
					"id" : "obj-314",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"patching_rect" : [ 1597.0, 791.0, 55.0, 20.0 ],
					"id" : "obj-310",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"patching_rect" : [ 1597.0, 759.0, 102.0, 20.0 ],
					"id" : "obj-309",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"patching_rect" : [ 1379.0, 445.0, 53.0, 20.0 ],
					"id" : "obj-226",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 11.595187,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---gs_audio_rec",
					"patching_rect" : [ 1381.0, 405.0, 102.0, 20.0 ],
					"id" : "obj-306",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 500",
					"patching_rect" : [ 1152.718384, 53.843552, 63.0, 20.0 ],
					"id" : "obj-396",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 1151.718384, 20.843567, 60.0, 20.0 ],
					"id" : "obj-395",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 200",
					"patching_rect" : [ 1049.718506, 43.843567, 63.0, 20.0 ],
					"id" : "obj-203",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#2file",
					"patching_rect" : [ 1049.718506, 67.843567, 39.0, 18.0 ],
					"id" : "obj-207",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 1049.718506, 12.843567, 60.0, 20.0 ],
					"id" : "obj-208",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl filter symbol",
					"patching_rect" : [ 1049.718506, 119.843567, 87.0, 20.0 ],
					"id" : "obj-211",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend replace",
					"patching_rect" : [ 1049.718506, 144.843567, 97.0, 20.0 ],
					"id" : "obj-215",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll presets",
					"patching_rect" : [ 1049.718506, 93.843567, 71.0, 20.0 ],
					"id" : "obj-597",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 12.0,
					"outlettype" : [ "", "", "", "" ],
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
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 306.718384, 130.119904, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.14902, 1.0, 0.0, 0.584314 ],
					"rounded" : 4.0,
					"ignoreclick" : 1,
					"texton" : "on",
					"bgoncolor" : [ 0.0, 1.0, 0.05098, 0.72549 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-336",
					"fontname" : "Arial",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 5.718567, 25.276337, 58.0, 17.0 ],
					"numoutlets" : 3,
					"text" : "off",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #2",
					"patching_rect" : [ 306.718384, 53.843567, 55.0, 20.0 ],
					"id" : "obj-282",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---enable",
					"patching_rect" : [ 306.718384, 23.843567, 66.0, 20.0 ],
					"id" : "obj-281",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr ($i1-5000)/100.0",
					"patching_rect" : [ 1513.0, 410.0, 121.0, 20.0 ],
					"id" : "obj-192",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"patching_rect" : [ 1410.0, 483.0, 157.0, 15.0 ],
					"presentation" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-191",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 278.0, 53.0, 39.0, 15.0 ],
					"numoutlets" : 1,
					"fontsize" : 9.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"patching_rect" : [ 1394.148926, 149.083801, 50.0, 17.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.384314, 0.447059, 0.623529, 0.388235 ],
					"rounded" : 4.0,
					"texton" : "Q",
					"bgoncolor" : [ 0.384314, 0.447059, 0.623529, 0.360784 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-345",
					"fontname" : "Arial Bold",
					"textoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"presentation_rect" : [ 345.787079, 51.845139, 20.201328, 13.852707 ],
					"numoutlets" : 3,
					"text" : "Q",
					"textoveroncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontsize" : 9.0,
					"bgovercolor" : [ 1.0, 1.0, 1.0, 0.345098 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"patching_rect" : [ 1464.0, 288.0, 44.0, 20.0 ],
					"id" : "obj-200",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr $i1/100*100",
					"patching_rect" : [ 1489.0, 318.0, 101.0, 20.0 ],
					"id" : "obj-209",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 1489.0, 254.0, 19.0, 20.0 ],
					"id" : "obj-210",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"patching_rect" : [ 1242.0, 148.0, 72.0, 20.0 ],
					"id" : "obj-201",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"patching_rect" : [ 1329.0, 194.0, 35.0, 20.0 ],
					"id" : "obj-202",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"patching_rect" : [ 1329.0, 288.0, 44.0, 20.0 ],
					"id" : "obj-204",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr $i1/100*100",
					"patching_rect" : [ 1354.0, 318.0, 101.0, 20.0 ],
					"id" : "obj-205",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 1354.0, 255.0, 19.0, 20.0 ],
					"id" : "obj-206",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive",
					"patching_rect" : [ 810.605103, 164.95929, 49.0, 20.0 ],
					"id" : "obj-198",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive",
					"patching_rect" : [ 771.605103, 143.95929, 49.0, 20.0 ],
					"id" : "obj-199",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t write",
					"patching_rect" : [ 374.0, 272.0, 37.0, 18.0 ],
					"id" : "obj-197",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "write" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"patching_rect" : [ 348.0, 246.0, 74.0, 18.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.635294, 0.635294, 0.635294, 1.0 ],
					"rounded" : 4.0,
					"bgoncolor" : [ 0.6, 0.792157, 0.858824, 1.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"id" : "obj-196",
					"fontname" : "Arial",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 355.0, 71.0, 35.0, 20.0 ],
					"borderoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numoutlets" : 3,
					"text" : "save",
					"fontsize" : 9.0,
					"bgovercolor" : [ 0.670588, 0.858824, 0.937255, 0.784314 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 600",
					"patching_rect" : [ 390.0, 526.0, 61.0, 20.0 ],
					"id" : "obj-195",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive",
					"patching_rect" : [ 685.605103, 160.95929, 49.0, 20.0 ],
					"id" : "obj-193",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive",
					"patching_rect" : [ 595.605103, 163.95929, 49.0, 20.0 ],
					"id" : "obj-194",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend store",
					"patching_rect" : [ 1445.0, 976.0, 82.0, 20.0 ],
					"id" : "obj-188",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend #2file",
					"patching_rect" : [ 1445.0, 945.0, 84.0, 20.0 ],
					"id" : "obj-187",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "absolutepath",
					"patching_rect" : [ 1445.0, 917.0, 79.0, 20.0 ],
					"id" : "obj-582",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 10",
					"patching_rect" : [ 137.0, 972.0, 49.0, 20.0 ],
					"id" : "obj-185",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 116.0, 921.0, 19.0, 20.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_r",
					"patching_rect" : [ 255.0, 988.0, 90.0, 20.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_s",
					"patching_rect" : [ 254.0, 962.0, 92.0, 20.0 ],
					"id" : "obj-140",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_d",
					"patching_rect" : [ 207.0, 939.0, 93.0, 20.0 ],
					"id" : "obj-146",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---amp_env_a",
					"patching_rect" : [ 187.0, 914.0, 93.0, 20.0 ],
					"id" : "obj-176",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"patching_rect" : [ 174.0, 1084.0, 80.5, 20.0 ],
					"id" : "obj-178",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"patching_rect" : [ 62.0, 1075.0, 80.5, 20.0 ],
					"id" : "obj-179",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "adsr~ 2. 100. 0.9 300.",
					"patching_rect" : [ 146.0, 1020.0, 124.0, 20.0 ],
					"id" : "obj-180",
					"fontname" : "Arial",
					"numinlets" : 5,
					"numoutlets" : 4,
					"fontsize" : 11.595187,
					"outlettype" : [ "signal", "signal", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate~ 2",
					"patching_rect" : [ 250.0, 882.0, 51.0, 20.0 ],
					"id" : "obj-181",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "signal", "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate~ 2",
					"patching_rect" : [ 40.0, 878.0, 51.0, 20.0 ],
					"id" : "obj-182",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "signal", "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"patching_rect" : [ 38.0, 817.0, 100.0, 20.0 ],
					"items" : [ "off", ",", "toggle", ",", "momentary" ],
					"id" : "obj-183",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 12.0,
					"outlettype" : [ "int", "", "" ],
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r",
					"patching_rect" : [ 33.0, 784.0, 19.0, 20.0 ],
					"id" : "obj-184",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1000.",
					"patching_rect" : [ 495.331177, 317.0, 49.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-173",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack",
					"patching_rect" : [ 1018.0, 550.0, 48.0, 20.0 ],
					"id" : "obj-169",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 11.595187,
					"outlettype" : [ "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend size",
					"patching_rect" : [ 1225.0, 767.0, 68.0, 18.0 ],
					"id" : "obj-175",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t f f",
					"patching_rect" : [ 1197.0, 743.0, 46.5, 18.0 ],
					"id" : "obj-174",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "float", "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route size bang",
					"patching_rect" : [ 1197.0, 722.0, 79.0, 18.0 ],
					"id" : "obj-168",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 3,
					"fontsize" : 10.0,
					"outlettype" : [ "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-buffer-length",
					"patching_rect" : [ 1197.0, 789.0, 99.0, 18.0 ],
					"id" : "obj-87",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess #0-sample",
					"patching_rect" : [ 1175.0, 812.0, 122.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-82",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 141.0, 467.0, 29.0, 21.0 ],
					"id" : "obj-72",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 14.249197,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"varname" : "-grains-on-off",
					"bordercolor" : [ 0.501961, 0.360784, 0.262745, 1.0 ],
					"patching_rect" : [ 176.0, 508.0, 78.0, 23.0 ],
					"bgoveroncolor" : [ 1.0, 1.0, 0.776471, 1.0 ],
					"textcolor" : [ 0.141176, 0.05098, 0.05098, 1.0 ],
					"texton" : "grains on",
					"bgoncolor" : [ 1.0, 1.0, 0.776471, 1.0 ],
					"bgcolor" : [ 0.537255, 0.537255, 0.537255, 1.0 ],
					"id" : "obj-67",
					"fontname" : "Arial",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"border" : 1,
					"borderoncolor" : [ 0.792157, 0.568627, 0.411765, 1.0 ],
					"numoutlets" : 3,
					"text" : "grains off",
					"textoveroncolor" : [ 0.537255, 0.537255, 0.537255, 1.0 ],
					"fontface" : 1,
					"fontsize" : 14.0,
					"bgovercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "select range",
					"linecount" : 2,
					"patching_rect" : [ 704.024536, 463.0, 35.0, 28.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-31",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 9.160198
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t replace",
					"patching_rect" : [ 280.0, 289.0, 49.0, 18.0 ],
					"id" : "obj-23",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "replace" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textbutton",
					"bordercolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"patching_rect" : [ 279.0, 268.0, 74.0, 18.0 ],
					"presentation" : 1,
					"bgoveroncolor" : [ 0.635294, 0.635294, 0.635294, 1.0 ],
					"rounded" : 4.0,
					"bgoncolor" : [ 0.6, 0.792157, 0.858824, 1.0 ],
					"bgcolor" : [ 0.94902, 0.94902, 0.94902, 1.0 ],
					"id" : "obj-19",
					"fontname" : "Arial",
					"textoncolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 318.0, 71.0, 35.0, 20.0 ],
					"borderoncolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numoutlets" : 3,
					"text" : "load",
					"fontsize" : 9.0,
					"bgovercolor" : [ 0.670588, 0.858824, 0.937255, 0.784314 ],
					"outlettype" : [ "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p no-selector",
					"patching_rect" : [ 526.331177, 444.0, 81.0, 20.0 ],
					"id" : "obj-164",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
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
									"patching_rect" : [ 49.69342, 20.839478, 260.0, 70.0 ],
									"id" : "obj-82",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 13.914225
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 0 -1 0 0",
									"patching_rect" : [ 49.69342, 96.0, 93.0, 18.0 ],
									"id" : "obj-31",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 10.435669,
									"outlettype" : [ "" ]
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
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 64 64",
					"patching_rect" : [ 1066.331055, 495.0, 75.0, 17.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t 64",
					"patching_rect" : [ 911.331055, 338.0, 30.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 11.595187,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 100 150",
					"patching_rect" : [ 771.331177, 530.0, 85.0, 17.0 ],
					"id" : "obj-88",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 250 750",
					"patching_rect" : [ 615.331177, 359.0, 110.0, 20.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"patching_rect" : [ 165.0, 255.0, 63.0, 42.0 ],
					"id" : "obj-14",
					"fontname" : "Arial",
					"numinlets" : 1,
					"tabs" : [ "play", "stop", "resume" ],
					"numoutlets" : 3,
					"fontsize" : 11.595187,
					"outlettype" : [ "int", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "1.",
					"patching_rect" : [ 156.0, 402.0, 55.0, 18.0 ],
					"id" : "obj-11",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 0.001",
					"patching_rect" : [ 678.331177, 495.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-83",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 0.001",
					"patching_rect" : [ 605.331177, 495.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-84",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scaling trick for rslider ",
					"linecount" : 2,
					"patching_rect" : [ 534.331177, 495.0, 70.0, 29.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "multislider",
					"patching_rect" : [ 494.622559, 375.831848, 95.710342, 20.420671 ],
					"contdata" : 1,
					"orientation" : 0,
					"bgcolor" : [ 0.784314, 0.784314, 0.827451, 1.0 ],
					"id" : "obj-33",
					"numinlets" : 1,
					"setminmax" : [ 0.0, 1000.0 ],
					"settype" : 0,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s b",
					"patching_rect" : [ 294.0, 413.0, 80.0, 18.0 ],
					"id" : "obj-172",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bondo",
					"patching_rect" : [ 691.331177, 554.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-171",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bondo",
					"patching_rect" : [ 614.331177, 553.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-170",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-hi-location",
					"patching_rect" : [ 612.331177, 647.0, 89.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-130",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-location",
					"patching_rect" : [ 612.331177, 625.0, 89.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-131",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1.",
					"patching_rect" : [ 691.331177, 575.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-159",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 1.",
					"patching_rect" : [ 614.331177, 575.0, 50.0, 20.0 ],
					"color" : [ 0.811765, 0.372549, 0.372549, 1.0 ],
					"id" : "obj-158",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #0-buffer-length",
					"patching_rect" : [ 631.331177, 521.0, 116.0, 20.0 ],
					"id" : "obj-157",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 679.331177, 693.0, 61.0, 17.0 ],
					"id" : "obj-20",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 603.331177, 693.0, 61.0, 17.0 ],
					"id" : "obj-21",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p mean-set",
					"patching_rect" : [ 1123.331055, 452.0, 63.0, 18.0 ],
					"id" : "obj-5",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.435669,
					"outlettype" : [ "" ],
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
									"patching_rect" : [ 54.0, 104.0, 72.0, 20.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 11.595187,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr int( ($i1 + $i2) * 0.5)",
									"patching_rect" : [ 54.0, 74.0, 138.0, 20.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 11.595187,
									"outlettype" : [ "" ]
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
									"patching_rect" : [ 54.0, 37.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
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
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 1096.331055, 693.0, 61.0, 17.0 ],
					"id" : "obj-165",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 1019.331055, 693.0, 61.0, 17.0 ],
					"id" : "obj-166",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 934.331055, 706.0, 61.0, 17.0 ],
					"id" : "obj-150",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 894.331055, 686.0, 61.0, 17.0 ],
					"id" : "obj-151",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 16 109",
					"patching_rect" : [ 914.331055, 460.0, 80.0, 17.0 ],
					"id" : "obj-152",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"varname" : "u629010512",
					"text" : "autopattr",
					"patching_rect" : [ 399.331177, 822.0, 56.0, 18.0 ],
					"id" : "obj-147",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 4,
					"fontsize" : 10.435669,
					"outlettype" : [ "", "", "", "" ],
					"restore" : 					{
						"-grains-on-off" : [ 0 ],
						"-grains-time" : [ 20 ],
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
					"patching_rect" : [ 129.0, 520.0, 22.0, 18.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 395.0, 498.0, 50.0, 17.0 ],
					"id" : "obj-2",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"patching_rect" : [ 283.0, 461.0, 167.0, 18.0 ],
					"presentation" : 1,
					"bgcolor2" : [ 0.94902, 0.94902, 0.94902, 0.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"bgcolor" : [ 0.956863, 0.956863, 0.956863, 0.0 ],
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 63.0, 71.0, 256.0, 18.0 ],
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 805.331177, 706.0, 61.0, 17.0 ],
					"id" : "obj-9",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"patching_rect" : [ 775.331177, 686.0, 61.0, 17.0 ],
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mousefilter",
					"patching_rect" : [ 58.0, 700.0, 66.0, 18.0 ],
					"id" : "obj-13",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 20",
					"patching_rect" : [ 217.41304, 562.619995, 68.0, 18.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "voices $1",
					"patching_rect" : [ 58.0, 723.0, 55.0, 16.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 58.0, 676.0, 50.0, 18.0 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route stop resume int float bang play",
					"patching_rect" : [ 97.0, 316.0, 173.0, 18.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 7,
					"fontsize" : 10.0,
					"outlettype" : [ "", "", "", "", "", "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "time between grains",
					"patching_rect" : [ 255.0, 604.0, 115.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "60",
					"patching_rect" : [ 129.0, 629.0, 29.0, 21.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 14.249197,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "midinote $1 $2",
					"patching_rect" : [ 129.0, 725.0, 75.0, 15.0 ],
					"id" : "obj-59",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack",
					"patching_rect" : [ 129.0, 704.0, 99.0, 18.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote 80 400",
					"patching_rect" : [ 129.0, 680.0, 101.0, 18.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"numinlets" : 3,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "float", "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ rgrain-mgd.maxpat 16 args #0",
					"patching_rect" : [ 129.0, 747.0, 216.0, 20.0 ],
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontface" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "signal", "signal" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-buffer-length",
					"patching_rect" : [ 305.0, 382.0, 99.0, 18.0 ],
					"id" : "obj-65",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "info~ #0-sample",
					"patching_rect" : [ 279.0, 361.0, 158.0, 18.0 ],
					"id" : "obj-66",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 8,
					"fontsize" : 10.0,
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p make-grain-envelope",
					"patching_rect" : [ 236.0, 709.0, 114.0, 18.0 ],
					"color" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ],
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
									"patching_rect" : [ 196.0, 31.0, 46.0, 17.0 ],
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"id" : "obj-67",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "peek~ #0-window",
									"patching_rect" : [ 80.0, 324.0, 135.0, 17.0 ],
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"id" : "obj-68",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "buffer~ #0-window 12",
									"patching_rect" : [ 80.0, 346.0, 138.0, 17.0 ],
									"color" : [ 0.156863, 0.8, 0.54902, 1.0 ],
									"id" : "obj-70",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "float", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 512",
									"patching_rect" : [ 147.0, 147.0, 34.0, 17.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 511.",
									"patching_rect" : [ 126.0, 178.0, 38.0, 17.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 2.",
									"patching_rect" : [ 126.0, 201.0, 27.0, 17.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1.",
									"patching_rect" : [ 186.0, 201.0, 23.0, 15.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b",
									"patching_rect" : [ 186.0, 178.0, 23.0, 17.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "split 384 512",
									"patching_rect" : [ 126.0, 124.0, 70.0, 17.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "split 0 128",
									"patching_rect" : [ 78.0, 103.0, 58.0, 17.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 73.0, 40.0, 15.0, 15.0 ],
									"id" : "obj-8",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 2.",
									"patching_rect" : [ 78.0, 201.0, 27.0, 17.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Sqrt for two Overlap",
									"patching_rect" : [ 229.0, 247.0, 127.0, 17.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr 0.5 * (1 + cos((3.14159 + 3.14159*2* $f1)))",
									"patching_rect" : [ 78.0, 225.0, 278.0, 17.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr sqrt($f1)",
									"patching_rect" : [ 151.0, 245.0, 75.0, 17.0 ],
									"id" : "obj-12",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "hanning",
									"patching_rect" : [ 246.0, 207.0, 50.0, 17.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
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
									"patching_rect" : [ 46.0, 33.0, 15.0, 15.0 ],
									"id" : "obj-15",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 511.",
									"patching_rect" : [ 78.0, 178.0, 38.0, 17.0 ],
									"id" : "obj-16",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "Uzi 512",
									"patching_rect" : [ 46.0, 62.0, 43.0, 17.0 ],
									"id" : "obj-17",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 3,
									"fontsize" : 9.160198,
									"outlettype" : [ "bang", "bang", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 1",
									"patching_rect" : [ 78.0, 83.0, 27.0, 17.0 ],
									"id" : "obj-18",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0.",
									"patching_rect" : [ 39.0, 276.0, 49.0, 17.0 ],
									"id" : "obj-19",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
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
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"varname" : "-grains-time",
					"patching_rect" : [ 217.688034, 585.317017, 37.0, 18.0 ],
					"triscale" : 0.9,
					"minimum" : 1,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 10.435669,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 20",
					"patching_rect" : [ 175.606003, 606.992981, 65.0, 18.0 ],
					"id" : "obj-73",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "buffer~ #0-sample #1",
					"patching_rect" : [ 280.0, 315.0, 151.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-74",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"fontsize" : 10.0,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "name #0-sample 1",
					"patching_rect" : [ 354.620911, 435.0, 110.0, 16.0 ],
					"id" : "obj-85",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "center",
					"patching_rect" : [ 911.331055, 320.0, 35.0, 15.0 ],
					"bgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"id" : "obj-89",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "kslider",
					"patching_rect" : [ 962.331055, 398.0, 343.0, 34.0 ],
					"hkeycolor" : [ 0.541176, 0.172549, 0.235294, 1.0 ],
					"offset" : 24,
					"range" : 84,
					"id" : "obj-91",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "linear playback",
					"patching_rect" : [ 121.0, 231.0, 111.0, 22.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-92",
					"fontname" : "Arial",
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 13.914225
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 1036.331055, 254.0, 18.0, 18.0 ],
					"id" : "obj-93",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "no pitch change",
					"patching_rect" : [ 1036.331055, 231.0, 82.0, 16.0 ],
					"bgcolor" : [ 0.858824, 0.858824, 0.858824, 1.0 ],
					"id" : "obj-94",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"patching_rect" : [ 1039.622437, 301.0, 252.0, 16.0 ],
					"size" : 127.0,
					"knobcolor" : [ 0.541176, 0.172549, 0.235294, 1.0 ],
					"orientation" : 1,
					"bgcolor" : [ 0.784314, 0.784314, 0.843137, 1.0 ],
					"id" : "obj-95",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set 1.",
					"patching_rect" : [ 49.0, 339.0, 34.0, 15.0 ],
					"id" : "obj-96",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"patching_rect" : [ 48.0, 316.0, 50.0, 18.0 ],
					"id" : "obj-97",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 10.0,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess set 64",
					"patching_rect" : [ 921.331055, 367.0, 77.0, 17.0 ],
					"id" : "obj-98",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "speed",
					"patching_rect" : [ 202.0, 389.0, 47.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-100",
					"fontname" : "Arial",
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 156.0, 378.0, 20.0, 20.0 ],
					"id" : "obj-101",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"mouseup" : 1,
					"patching_rect" : [ 203.0, 370.0, 48.0, 22.0 ],
					"triscale" : 0.9,
					"minimum" : 0.0,
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"id" : "obj-102",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 13.914225,
					"outlettype" : [ "float", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #0-scrub-location",
					"patching_rect" : [ 507.331177, 346.0, 126.0, 20.0 ],
					"id" : "obj-103",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p linear-playback",
					"linecount" : 2,
					"patching_rect" : [ 97.0, 424.0, 76.0, 29.0 ],
					"color" : [ 0.611765, 0.701961, 1.0, 1.0 ],
					"id" : "obj-104",
					"fontname" : "Arial",
					"numinlets" : 3,
					"numoutlets" : 0,
					"fontsize" : 10.0,
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
									"patching_rect" : [ 71.0, 499.0, 409.0, 28.0 ],
									"id" : "obj-20",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "time to play full sample (0-1000) at chosen speed.",
									"linecount" : 3,
									"patching_rect" : [ 344.0, 298.0, 106.0, 38.0 ],
									"id" : "obj-18",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "start at 0 (beg of sample)",
									"patching_rect" : [ 353.0, 426.0, 112.0, 17.0 ],
									"id" : "obj-14",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Here is the actual length of the sample in milliseconds:",
									"linecount" : 3,
									"patching_rect" : [ 347.0, 206.0, 106.0, 38.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r  #0-buffer-length",
									"patching_rect" : [ 348.0, 247.0, 107.0, 17.0 ],
									"id" : "obj-65",
									"fontname" : "Arial",
									"numinlets" : 0,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "<-- 1000 is used by rslider and pattr to  represent  the total  length of a sample.",
									"linecount" : 6,
									"patching_rect" : [ 352.0, 92.0, 80.0, 70.0 ],
									"id" : "obj-26",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t f 0",
									"patching_rect" : [ 272.0, 46.0, 194.5, 17.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "float", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "f",
									"patching_rect" : [ 200.0, 266.0, 27.0, 17.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b",
									"patching_rect" : [ 159.0, 232.0, 60.0, 17.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 0.",
									"patching_rect" : [ 200.0, 288.0, 33.0, 17.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l b",
									"patching_rect" : [ 272.0, 367.0, 59.0, 17.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "timer",
									"patching_rect" : [ 312.0, 395.0, 42.0, 17.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "float", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 159.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-8",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "(bang, resume) restarts playback"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(bang, resume) restarts playback",
									"linecount" : 4,
									"patching_rect" : [ 174.0, 23.0, 48.0, 49.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "f",
									"patching_rect" : [ 86.0, 438.0, 40.0, 17.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b",
									"patching_rect" : [ 86.0, 61.0, 34.0, 17.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 86.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-12",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "(bang, stop) stop playback"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!/ 1.",
									"patching_rect" : [ 272.0, 69.0, 35.0, 17.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 1000 1000.",
									"patching_rect" : [ 272.0, 335.0, 80.0, 17.0 ],
									"id" : "obj-15",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1000. f",
									"patching_rect" : [ 271.0, 90.0, 80.0, 17.0 ],
									"id" : "obj-16",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "float", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 1.",
									"patching_rect" : [ 333.0, 278.0, 48.5, 17.0 ],
									"id" : "obj-17",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1,
									"fontsize" : 9.160198,
									"outlettype" : [ "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s #0-scrub-location",
									"patching_rect" : [ 272.0, 460.0, 146.0, 17.0 ],
									"id" : "obj-19",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 272.0, 23.0, 15.0, 15.0 ],
									"id" : "obj-21",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : "(float) playback from begiining"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 0 5",
									"patching_rect" : [ 272.0, 433.0, 46.0, 17.0 ],
									"id" : "obj-22",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 2,
									"fontsize" : 9.160198,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(bang, stop) stop playback",
									"linecount" : 2,
									"patching_rect" : [ 14.0, 23.0, 68.0, 28.0 ],
									"id" : "obj-23",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "(float) playback from begiining",
									"patching_rect" : [ 296.0, 23.0, 145.0, 17.0 ],
									"id" : "obj-24",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0,
									"fontsize" : 9.160198
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
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"patching_rect" : [ 1058.331055, 468.0, 36.0, 15.0 ],
					"id" : "obj-107",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"patching_rect" : [ 910.331055, 441.0, 35.0, 15.0 ],
					"id" : "obj-108",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "dial",
					"patching_rect" : [ 910.331055, 395.0, 40.0, 40.0 ],
					"clip" : 0,
					"outlinecolor" : [ 0.882353, 0.882353, 0.882353, 1.0 ],
					"bgcolor" : [ 0.866667, 0.866667, 0.866667, 1.0 ],
					"id" : "obj-109",
					"fgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"needlecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "float" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "64 64",
					"patching_rect" : [ 1036.331055, 279.0, 45.0, 18.0 ],
					"id" : "obj-110",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "transpo",
					"patching_rect" : [ 1045.331055, 201.0, 49.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-111",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-trans",
					"patching_rect" : [ 1032.331055, 625.0, 92.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-112",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-hi-trans",
					"patching_rect" : [ 1032.331055, 647.0, 92.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-113",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1020.331055, 576.0, 41.0, 17.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-114",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1074.331055, 551.0, 41.0, 17.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-115",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 $1",
					"patching_rect" : [ 492.331177, 403.0, 35.0, 15.0 ],
					"id" : "obj-116",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1,
					"fontsize" : 9.160198,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pan",
					"patching_rect" : [ 926.331055, 201.0, 30.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-117",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "duration",
					"patching_rect" : [ 819.331177, 201.0, 52.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-118",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 947.331055, 584.0, 41.0, 17.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-119",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 900.331055, 584.0, 41.0, 17.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-120",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 773.331177, 584.0, 41.0, 17.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-121",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 811.331177, 584.0, 41.0, 17.0 ],
					"cantchange" : 1,
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-122",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 9.160198,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "pan-lo-hi",
					"patching_rect" : [ 893.622437, 556.0, 75.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-123",
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 2,
					"presentation_rect" : [ 324.0, 6.0, 20.0, 60.0 ],
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 690.331177, 600.0, 44.0, 20.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-124",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 613.331177, 598.0, 44.0, 20.0 ],
					"triscale" : 0.9,
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"triangle" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"id" : "obj-125",
					"fontname" : "Arial",
					"numinlets" : 1,
					"htextcolor" : [ 0.870588, 0.870588, 0.870588, 1.0 ],
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-hi-pan",
					"patching_rect" : [ 904.331055, 647.0, 92.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-126",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-pan",
					"patching_rect" : [ 904.331055, 625.0, 92.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-127",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-lo-dur",
					"patching_rect" : [ 784.331177, 625.0, 86.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-128",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #0-hi-dur",
					"patching_rect" : [ 784.331177, 647.0, 86.0, 18.0 ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-129",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "location",
					"patching_rect" : [ 624.331177, 201.0, 53.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-132",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "scrub",
					"patching_rect" : [ 511.024597, 201.0, 40.0, 18.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-133",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ms",
					"patching_rect" : [ 256.0, 585.0, 32.0, 18.0 ],
					"textcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"id" : "obj-134",
					"fontname" : "Arial",
					"frgb" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 1,
					"fontsize" : 10.435669
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "transpo-lo-hi",
					"patching_rect" : [ 1018.622437, 525.0, 95.0, 20.0 ],
					"size" : 10000.0,
					"floatoutput" : 1,
					"presentation" : 1,
					"listmode" : 1,
					"id" : "obj-135",
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 2,
					"presentation_rect" : [ 346.0, 6.0, 20.0, 44.585316 ],
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "duration-lo-hi",
					"patching_rect" : [ 773.622559, 556.0, 61.0, 20.0 ],
					"size" : 400.0,
					"presentation" : 1,
					"id" : "obj-136",
					"fgcolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"numinlets" : 2,
					"presentation_rect" : [ 368.0, 6.0, 20.0, 60.0 ],
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "(bang, float, stop, pause) linear playback (time stretching)",
					"linecount" : 3,
					"patching_rect" : [ 117.0, 249.0, 108.0, 38.0 ],
					"id" : "obj-143",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 9.160198
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "rslider",
					"varname" : "location-lo-hi",
					"bordercolor" : [ 0.623529, 0.584314, 0.556863, 1.0 ],
					"patching_rect" : [ 606.622559, 469.0, 95.19696, 20.090565 ],
					"size" : 1000.0,
					"presentation" : 1,
					"bgcolor" : [ 0.768627, 0.768627, 0.768627, 0.0 ],
					"id" : "obj-8",
					"fgcolor" : [ 0.082353, 0.25098, 0.431373, 0.52549 ],
					"numinlets" : 2,
					"presentation_rect" : [ 67.291382, 6.0, 254.19696, 62.090565 ],
					"numoutlets" : 2,
					"outlettype" : [ "", "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "waveform~",
					"patching_rect" : [ 504.622559, 470.0, 95.0, 20.0 ],
					"presentation" : 1,
					"vticks" : 0,
					"textcolor" : [  ],
					"ticks" : 4,
					"bgcolor" : [ 0.894118, 0.898039, 0.921569, 1.0 ],
					"id" : "obj-86",
					"tickmarkcolor" : [ 0.392157, 0.392157, 0.392157, 1.0 ],
					"grid" : 1.0,
					"numinlets" : 5,
					"buffername" : "#0-sample",
					"waveformcolor" : [ 0.219608, 0.231373, 0.309804, 1.0 ],
					"labelbgcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"presentation_rect" : [ 67.291382, 6.0, 254.0, 62.0 ],
					"numoutlets" : 6,
					"setmode" : 1,
					"selectioncolor" : [ 0.466667, 0.466667, 0.466667, 0.501961 ],
					"labeltextcolor" : [ 0.827451, 0.827451, 0.827451, 1.0 ],
					"fontsize" : 11.595187,
					"labels" : 0,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"ruler" : 0,
					"frozen_box_attributes" : [ "buffername" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Bonus Feature",
					"patching_rect" : [ 1050.331055, 763.0, 81.0, 18.0 ],
					"id" : "obj-162",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "use size message to set buffer~  the desired length, use this outlet to name record~, record a sound (in loop mode?) then granulate live.",
					"linecount" : 6,
					"patching_rect" : [ 1020.331055, 781.0, 151.0, 75.0 ],
					"id" : "obj-137",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "averages the range to find center note",
					"linecount" : 3,
					"patching_rect" : [ 1189.331055, 445.0, 77.0, 41.0 ],
					"textcolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-80",
					"fontname" : "Arial",
					"frgb" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Here are the values that are sent to the poly~. The #0- keeps them local, even inside the poly~.",
					"patching_rect" : [ 692.331177, 663.0, 548.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-142",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...set to a single value...",
					"linecount" : 3,
					"patching_rect" : [ 928.331055, 340.0, 64.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-155",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...or set to a range of values.",
					"linecount" : 4,
					"patching_rect" : [ 928.331055, 483.0, 59.0, 62.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-156",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Pan range can be set to center...",
					"linecount" : 5,
					"patching_rect" : [ 916.331055, 231.0, 57.0, 75.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-154",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "(To make the values compatible with a MIDI pitch wheel, 64 (D#) is used to indicate zero-transposition.",
					"linecount" : 2,
					"patching_rect" : [ 1040.331055, 370.0, 259.0, 29.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-148",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "In that case, the center of the range is displayed on the \"ribbon controller\" and keyboard as a point of reference.",
					"linecount" : 3,
					"patching_rect" : [ 1060.331055, 573.0, 241.0, 41.0 ],
					"textcolor" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"id" : "obj-105",
					"fontname" : "Arial",
					"frgb" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...or you can use the rslider to define a range of transpositions.",
					"linecount" : 3,
					"patching_rect" : [ 1116.331055, 523.0, 163.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-99",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "...you can use the \"ribbon controller\" or a keybord to select a single transpostion value...",
					"linecount" : 3,
					"patching_rect" : [ 1029.331055, 315.0, 270.0, 48.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-28",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "You can reset it.",
					"patching_rect" : [ 1133.331055, 230.0, 103.0, 20.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-27",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Transposition range has several control options:",
					"linecount" : 2,
					"patching_rect" : [ 1087.331055, 259.0, 179.0, 39.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 14.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 606.814209, 616.784973, 641.85498, 64.677979 ],
					"rounded" : 10,
					"bgcolor" : [ 0.74902, 0.576471, 0.466667, 1.0 ],
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
					"patching_rect" : [ 328.0, 287.0, 117.0, 25.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-70",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 16.233263,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "granular DSP engine",
					"patching_rect" : [ 199.0, 535.0, 185.0, 25.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 16.233263,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 68.718384, 1599.843628, 124.0, 110.0 ],
					"presentation" : 1,
					"rounded" : 0,
					"grad2" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-231",
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 507.356628, 6.614716, 80.76503, 20.757032 ],
					"numoutlets" : 0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Replacing the sample sets the buffer~ to the sample's length, displays the sample's name, loads the waveform of the sample into the waveform~ object, and sends the sample's length throughout the patcher.",
					"linecount" : 6,
					"patching_rect" : [ 281.0, 189.0, 194.0, 75.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-167",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "In the poly~, the first arugment (after \"args\") is #0. Inside poly~, in  rgrain.maxpat, #1 is replaced by the number generated by #0 in this top-level patch.",
					"linecount" : 2,
					"patching_rect" : [ 523.331177, 826.0, 482.0, 34.0 ],
					"id" : "obj-7",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Using the argument \"#0\" is a good way to ensure unique send-receive names within an instance of an abstraction,  and it even works when there is an abstraction within an abstraction (as in the poly~ within this rgrano). ",
					"linecount" : 3,
					"patching_rect" : [ 523.331177, 777.0, 453.0, 48.0 ],
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "for each parameter, there are two values: low and high. each rgrain instance chooses randomly between the two values.",
					"linecount" : 13,
					"patching_rect" : [ 786.331177, 241.0, 77.0, 186.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-29",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "< & x",
					"patching_rect" : [ 475.331177, 817.0, 39.0, 21.0 ],
					"textcolor" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"id" : "obj-30",
					"fontname" : "Arial",
					"frgb" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 12.213597,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "granulator",
					"patching_rect" : [ 400.331177, 790.0, 110.0, 28.0 ],
					"textcolor" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"id" : "obj-37",
					"fontname" : "Arial Black",
					"frgb" : [ 0.772549, 0.262745, 0.32549, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontsize" : 14.939242,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "double-click to see one grain voice",
					"patching_rect" : [ 148.0, 769.0, 184.0, 18.0 ],
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-76",
					"fontname" : "Arial",
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 10.435669,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "since changing the number of voices can be a time-consuming process, mousefilter ensures that it is done only after a mouse up.",
					"linecount" : 14,
					"patching_rect" : [ 59.0, 497.0, 64.0, 174.0 ],
					"textcolor" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"id" : "obj-145",
					"fontname" : "Arial",
					"frgb" : [ 0.258824, 0.258824, 0.258824, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 2,
					"fontsize" : 10.435669,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Location range is displayed and controlled by a named and transparent rslider. Underneath the rslider (in presentation mode), a waveform~ object displays the waveform of the sample.",
					"linecount" : 12,
					"patching_rect" : [ 485.331177, 536.0, 127.0, 172.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-161",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Location within the sample is given as a value between 0.0 and 1.0, so you can load samples of various lengths without interrupting the workflow.",
					"linecount" : 4,
					"patching_rect" : [ 491.331177, 249.0, 259.0, 62.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-163",
					"fontname" : "Arial",
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"fontface" : 3,
					"fontsize" : 12.0,
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 479.814209, 190.784973, 267.85498, 584.677979 ],
					"rounded" : 10,
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"id" : "obj-160",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 761.814209, 190.784973, 102.85498, 584.677979 ],
					"rounded" : 10,
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"id" : "obj-77",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 879.814087, 190.784973, 119.85498, 584.677979 ],
					"rounded" : 10,
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"id" : "obj-153",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 1174.0, 687.0, 127.0, 174.0 ],
					"rounded" : 10,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"id" : "obj-144",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 1011.814087, 190.784973, 289.85498, 565.677979 ],
					"rounded" : 10,
					"bgcolor" : [ 0.266667, 0.423529, 0.415686, 1.0 ],
					"id" : "obj-90",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.917647, 0.937255, 0.670588, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 44.0, 228.0, 226.0, 232.0 ],
					"rounded" : 10,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"id" : "obj-141",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 275.0, 185.0, 197.0, 303.0 ],
					"rounded" : 10,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"id" : "obj-139",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"background" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 1013.0, 759.0, 214.0, 102.0 ],
					"rounded" : 10,
					"grad2" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"bgcolor" : [ 0.6, 0.694118, 0.709804, 1.0 ],
					"id" : "obj-149",
					"numinlets" : 1,
					"numoutlets" : 0,
					"grad1" : [ 0.760784, 0.760784, 0.858824, 1.0 ],
					"background" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-226", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-244", 0 ],
					"destination" : [ "obj-206", 0 ],
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
					"source" : [ "obj-241", 0 ],
					"destination" : [ "obj-210", 0 ],
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
					"source" : [ "obj-243", 1 ],
					"destination" : [ "obj-241", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-243", 0 ],
					"destination" : [ "obj-244", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-242", 0 ],
					"destination" : [ "obj-243", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-245", 0 ],
					"destination" : [ "obj-242", 0 ],
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
					"source" : [ "obj-309", 0 ],
					"destination" : [ "obj-310", 0 ],
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
					"source" : [ "obj-335", 0 ],
					"destination" : [ "obj-330", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-239", 0 ],
					"destination" : [ "obj-313", 0 ],
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
					"source" : [ "obj-240", 0 ],
					"destination" : [ "obj-238", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-238", 0 ],
					"destination" : [ "obj-239", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-232", 0 ],
					"destination" : [ "obj-237", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-225", 0 ],
					"destination" : [ "obj-232", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-237", 0 ],
					"destination" : [ "obj-627", 5 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-235", 0 ],
					"destination" : [ "obj-225", 0 ],
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
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-223", 0 ],
					"destination" : [ "obj-459", 0 ],
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
					"source" : [ "obj-222", 0 ],
					"destination" : [ "obj-223", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-224", 0 ],
					"destination" : [ "obj-222", 0 ],
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
					"source" : [ "obj-146", 0 ],
					"destination" : [ "obj-180", 2 ],
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
					"source" : [ "obj-221", 0 ],
					"destination" : [ "obj-4", 0 ],
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
					"source" : [ "obj-218", 0 ],
					"destination" : [ "obj-221", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-219", 0 ],
					"destination" : [ "obj-184", 0 ],
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
					"source" : [ "obj-218", 0 ],
					"destination" : [ "obj-219", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-220", 0 ],
					"destination" : [ "obj-218", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 3 ],
					"destination" : [ "obj-212", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 2 ],
					"destination" : [ "obj-190", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 1 ],
					"destination" : [ "obj-189", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-212", 0 ],
					"destination" : [ "obj-198", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-190", 0 ],
					"destination" : [ "obj-199", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 0 ],
					"destination" : [ "obj-193", 0 ],
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
					"source" : [ "obj-199", 0 ],
					"destination" : [ "obj-136", 0 ],
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
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-79", 0 ],
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
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-194", 0 ],
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
					"source" : [ "obj-281", 0 ],
					"destination" : [ "obj-282", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-54", 0 ],
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
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-126", 0 ],
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
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-129", 0 ],
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
					"source" : [ "obj-157", 0 ],
					"destination" : [ "obj-171", 1 ],
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
					"source" : [ "obj-157", 0 ],
					"destination" : [ "obj-170", 1 ],
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
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
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
					"source" : [ "obj-125", 0 ],
					"destination" : [ "obj-131", 0 ],
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
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-112", 0 ],
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
					"source" : [ "obj-684", 0 ],
					"destination" : [ "obj-509", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-683", 0 ],
					"destination" : [ "obj-509", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
