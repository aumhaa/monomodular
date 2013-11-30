{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 0,
			"revision" : 8
		}
,
		"rect" : [ 288.0, 44.0, 869.0, 160.0 ],
		"bgcolor" : [ 0.219608, 0.235294, 0.243137, 1.0 ],
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
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1001.0, 10.0, 25.0, 17.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"text" : "in 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-160",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 124.0, 541.0, 51.0, 17.0 ],
					"text" : "prepend 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 124.0, 563.0, 100.0, 17.0 ],
					"text" : "prepend select_button"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-162",
					"maxclass" : "newobj",
					"numinlets" : 24,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 124.0, 520.0, 773.5, 17.0 ],
					"text" : "funnel 24"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-136",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 879.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 843.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[23]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-137",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 846.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 735.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[22]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-138",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 813.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 628.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[21]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-139",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 780.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 520.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[20]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-140",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 747.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 412.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[19]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-141",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 714.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 304.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[18]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-142",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 682.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 197.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[17]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-143",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 649.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 107.0, 12.0, 12.0 ],
					"varname" : "select[16]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-144",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 616.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 843.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[15]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-145",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 583.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 735.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[14]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-146",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 550.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 628.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[13]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-147",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 518.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 520.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[12]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-148",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 485.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 412.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[11]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-149",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 452.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 304.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[10]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-150",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 419.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 197.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[9]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-151",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 386.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 54.0, 12.0, 12.0 ],
					"varname" : "select[8]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-152",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 354.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 843.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[7]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-153",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 321.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 735.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[6]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-154",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 288.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 628.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[5]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-155",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 255.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 520.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[4]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-156",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 222.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 412.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[3]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-157",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 190.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 304.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[2]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-158",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 157.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 197.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[1]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"hint" : "",
					"id" : "obj-159",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 124.0, 495.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 88.0, 3.0, 12.0, 12.0 ],
					"varname" : "select[0]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-101",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 877.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 854.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[23]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-102",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 844.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 746.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[22]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-103",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 811.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 639.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[21]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-104",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 779.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 531.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[20]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-105",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 746.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 423.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[19]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-106",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 713.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 315.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[18]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-107",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 680.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 208.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[17]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-108",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 647.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 107.0, 12.0, 12.0 ],
					"varname" : "active[16]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-93",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 614.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 854.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[15]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-94",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 581.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 746.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[14]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-95",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 548.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 639.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[13]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-96",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 516.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 531.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[12]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-97",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 483.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 423.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[11]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-98",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 450.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 315.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[10]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-99",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 417.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 208.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[9]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-100",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 384.0, 389.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 54.0, 12.0, 12.0 ],
					"varname" : "active[8]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-89",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 351.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 854.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[7]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-90",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 319.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 746.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[6]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-91",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 286.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 639.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[5]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-92",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 253.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 531.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[4]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-88",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 220.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 423.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[3]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-87",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 188.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 315.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[2]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-86",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 155.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 208.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[1]"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.913725, 0.913725, 0.913725, 0.0 ],
					"blinkcolor" : [ 0.12549, 0.635294, 0.129412, 1.0 ],
					"fgcolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"id" : "obj-85",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"outlinecolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"patching_rect" : [ 122.0, 390.0, 20.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 99.0, 3.0, 12.0, 12.0 ],
					"varname" : "active[0]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 122.0, 440.0, 51.0, 17.0 ],
					"text" : "prepend 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 122.0, 461.0, 100.0, 17.0 ],
					"text" : "prepend active_button"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 24,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 122.0, 419.0, 773.5, 17.0 ],
					"text" : "funnel 24"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"frozen_object_attributes" : 					{
						"autorestore" : 0,
						"default_active" : 0,
						"default_interp" : [ "linear" ],
						"default_priority" : 0,
						"dirty" : 1,
						"invisible" : 1,
						"thru" : 0
					}
,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 3.0, 23.0, 82.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_initial" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
							"parameter_initial_enable" : 1,
							"parameter_invisible" : 1,
							"parameter_longname" : "assignments",
							"parameter_order" : 10,
							"parameter_shortname" : "assignments",
							"parameter_type" : 3
						}

					}
,
					"saved_object_attributes" : 					{
						"annotation_name" : "",
						"initial" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
						"parameter_enable" : 1
					}
,
					"text" : "pattr assignments",
					"varname" : "assignments"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-75",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title23"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-76",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 837.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 652.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title22"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-77",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 851.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 544.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title21"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-78",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 848.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 436.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title20"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-79",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 845.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 328.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title19"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-80",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 837.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 220.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title18"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-81",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 849.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 112.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title17"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-82",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 846.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 107.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 851.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title15"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-68",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 845.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 652.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title14"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 838.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 544.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title13"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-70",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 849.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 436.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 845.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 328.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title11"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-72",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 847.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 220.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 845.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 112.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title9"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-74",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 844.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 55.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-62",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 846.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 760.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title7"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-63",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 843.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 652.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title6"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 846.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 544.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-66",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 850.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 436.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-61",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 843.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 328.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-60",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 846.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 220.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-59",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 846.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 112.0, 3.0, 105.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 7.0,
					"frgb" : 0.0,
					"id" : "obj-58",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 849.0, 356.0, 28.0, 14.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 3.0, 104.0, 14.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "title0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 111.0, 23.0, 55.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr active",
					"varname" : "active"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 46.0, 376.0, 48.0, 17.0 ],
					"text" : "loadbang"
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
					"patching_rect" : [ 46.0, 419.0, 58.0, 17.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 440.0, 51.0, 17.0 ],
					"text" : "prepend 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 46.0, 398.0, 46.0, 17.0 ],
					"text" : "thispoly~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 27.0, 603.0, 31.0, 17.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}
,
					"text" : "out 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 27.0, 462.0, 89.0, 17.0 ],
					"text" : "prepend dial_return"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 755.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function23",
					"varname" : "function23"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 647.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function22",
					"varname" : "function22"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 539.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function21",
					"varname" : "function21"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 431.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function20",
					"varname" : "function20"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 323.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function19",
					"varname" : "function19"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 215.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function18",
					"varname" : "function18"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 107.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function17",
					"varname" : "function17"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ -1.0, 262.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function16",
					"varname" : "function16"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 756.0, 156.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function15",
					"varname" : "function15"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 648.0, 156.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function14",
					"varname" : "function14"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 540.0, 156.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function13",
					"varname" : "function13"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 432.0, 156.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function12",
					"varname" : "function12"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 324.0, 156.0, 72.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function11",
					"varname" : "function11"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 216.0, 156.0, 73.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function10",
					"varname" : "function10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 110.0, 156.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function9",
					"varname" : "function9"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 2.0, 156.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function8",
					"varname" : "function8"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 758.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function7",
					"varname" : "function7"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 650.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function6",
					"varname" : "function6"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 542.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function5",
					"varname" : "function5"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 434.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function4",
					"varname" : "function4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 326.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function3",
					"varname" : "function3"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 218.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function2",
					"varname" : "function2"
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
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 110.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function1",
					"varname" : "function1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 2.0, 49.0, 68.0, 17.0 ],
					"saved_object_attributes" : 					{
						"initial" : [ 100.0, 0.0, 127.0, "linear" ],
						"parameter_enable" : 0
					}
,
					"text" : "pattr function0",
					"varname" : "function0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 9.0,
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 24,
					"numoutlets" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 27.0, 354.0, 773.5, 17.0 ],
					"text" : "funnel 24"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-31",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 782.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 759.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint23"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-30",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 674.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 651.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint22"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-29",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 566.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint21"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-28",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 458.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 435.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint20"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-27",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 350.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 327.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint19"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-26",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 242.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 219.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint18"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-25",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 134.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint17"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-24",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 26.0, 289.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 107.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint16"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-23",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 783.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 759.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint15"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-22",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 675.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 651.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint14"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-21",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint13"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-20",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 459.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 435.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint12"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-19",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 351.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 327.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint11"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-18",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 219.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint10"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-17",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 135.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint9"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-16",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 27.0, 183.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 55.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint8"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-15",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 783.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 759.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint7"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-14",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 675.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 651.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint6"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-13",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 567.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint5"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-12",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 459.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 435.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint4"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-7",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 351.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 327.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint3"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-6",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 243.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 219.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint2"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-5",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 135.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 111.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint1"
				}

			}
, 			{
				"box" : 				{
					"autosustain" : 1,
					"bgcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"bordercolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"domain" : 100.0,
					"frozen_box_attributes" : [ "range" ],
					"gridstep_y" : 127.0,
					"id" : "obj-3",
					"linecolor" : [ 0.34902, 0.34902, 0.34902, 1.0 ],
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 27.0, 76.0, 107.0, 50.0 ],
					"pointcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 3.0, 107.0, 50.0 ],
					"range" : [ 0.0, 127.0 ],
					"sustaincolor" : [ 0.188235, 0.188235, 0.188235, 1.0 ],
					"textcolor" : [ 0.419608, 0.482353, 0.6, 1.0 ],
					"varname" : "breakpoint0"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 23 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 22 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 21 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 20 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 19 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 18 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 17 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 16 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 468.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 576.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 684.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 792.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 175.0, 36.5, 175.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 175.0, 144.5, 175.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 175.0, 252.5, 175.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 175.0, 360.5, 175.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 175.0, 468.5, 175.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 174.0, 576.5, 174.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 174.0, 684.5, 174.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 174.0, 792.5, 174.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 281.0, 35.5, 281.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 282.0, 143.5, 282.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 280.0, 251.5, 280.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 281.0, 359.5, 281.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 282.0, 467.5, 282.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 282.0, 575.5, 282.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 36.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 282.0, 683.5, 282.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 282.0, 791.5, 282.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 144.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 252.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1010.5, 69.0, 360.5, 69.0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 23 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 22 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 21 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-138", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 20 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 19 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 18 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 17 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 16 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-160", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 133.5, 586.5, 36.5, 586.5 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 16 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 17 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 18 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 19 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 20 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 21 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 22 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 23 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-33", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-39", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-40", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-41", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-42", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-51", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 131.5, 485.5, 36.5, 485.5 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1" : [ "assignments", "assignments", 10 ]
		}
,
		"dependency_cache" : [  ]
	}

}
