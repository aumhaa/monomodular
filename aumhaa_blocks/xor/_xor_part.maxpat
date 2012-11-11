{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 250.0, 44.0, 119.0, 197.0 ],
		"bglocked" : 0,
		"defrect" : [ 250.0, 44.0, 119.0, 197.0 ],
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
					"maxclass" : "message",
					"text" : "none",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 375.0, 545.0, 149.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-83",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"outlettype" : [ "bang", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 400.0, 574.0, 140.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-70",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "---",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 400.0, 603.0, 32.5, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-72",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf send %s%ir",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 400.0, 629.0, 140.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-73",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "forward",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 400.0, 682.0, 61.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-74",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b i",
					"outlettype" : [ "bang", "bang", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 208.0, 537.0, 161.0, 20.0 ],
					"numoutlets" : 3,
					"id" : "obj-69",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "---",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 229.0, 566.0, 32.5, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-62",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf send %s%ip",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 229.0, 588.0, 140.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-61",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "forward",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 229.0, 615.0, 61.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-60",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 672.0, 464.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-57",
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
					"patching_rect" : [ 672.0, 432.0, 90.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-56",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear, append $1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 672.0, 496.0, 126.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-54",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 400.0, 240.0, 68.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-39",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 416.0, 304.0, 32.5, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-36",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "del 2",
					"outlettype" : [ "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 400.0, 272.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-19",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 288.0, 64.0, 39.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-14",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #2blink",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 448.0, 352.0, 75.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-6",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 288.0, 240.0, 47.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-52",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 560.0, 208.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-48",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 512.0, 208.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-45",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 576.0, 512.0, 32.5, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-55",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "bgcolor 1 $1 $1 1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 592.0, 560.0, 133.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-53",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b 0.3",
					"outlettype" : [ "bang", "float" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 576.0, 432.0, 61.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-51",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "del 80",
					"outlettype" : [ "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 576.0, 480.0, 54.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-50",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"arrow" : 0,
					"ignoreclick" : 1,
					"presentation_rect" : [ 14.0, 1.0, 69.0, 33.0 ],
					"align" : 1,
					"items" : "#1",
					"fontname" : "Andale Mono",
					"arrowframe" : 0,
					"hltcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"types" : [  ],
					"patching_rect" : [ 624.0, 592.0, 100.0, 33.0 ],
					"presentation" : 1,
					"numoutlets" : 3,
					"id" : "obj-49",
					"rounded" : 0,
					"fontsize" : 24.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "bpatcher",
					"args" : [ "#1", "#2" ],
					"presentation_rect" : [ -4.0, 52.0, 60.0, 79.0 ],
					"numinlets" : 0,
					"patching_rect" : [ 800.0, 338.0, 59.0, 78.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-37",
					"name" : "_xor_midi.maxpat"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"size" : 8.0,
					"outlettype" : [ "" ],
					"ignoreclick" : 1,
					"presentation_rect" : [ 57.0, 53.0, 12.0, 74.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"numinlets" : 1,
					"patching_rect" : [ 512.0, 232.0, 14.0, 73.0 ],
					"presentation" : 1,
					"numoutlets" : 1,
					"id" : "obj-46"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"size" : 8.0,
					"outlettype" : [ "" ],
					"ignoreclick" : 1,
					"presentation_rect" : [ 71.0, 53.0, 12.0, 74.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"numinlets" : 1,
					"patching_rect" : [ 561.0, 234.0, 14.0, 73.0 ],
					"presentation" : 1,
					"numoutlets" : 1,
					"id" : "obj-47"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "del 30",
					"outlettype" : [ "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 128.0, 432.0, 54.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-42",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 178.0, 434.0, 32.5, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-40",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 144.0, 400.0, 47.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-32",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2blink",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 144.0, 368.0, 75.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-29",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel #1",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 128.0, 304.0, 54.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-16",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---update-link",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 32.0, 368.0, 126.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-11",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "getrow 0",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 48.0, 432.0, 68.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-35",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "col #1 $1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 110.0, 617.0, 75.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-30",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---l-link",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 110.0, 650.0, 90.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-28",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr pow(2\\,$i1-1)",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 80.0, 560.0, 140.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-27",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl sub 1",
					"outlettype" : [ "", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 96.0, 528.0, 68.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-26",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set $1",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 16.0, 560.0, 54.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-23",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l 0",
					"outlettype" : [ "bang", "", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 96.0, 496.0, 61.0, 20.0 ],
					"numoutlets" : 3,
					"id" : "obj-20",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "accum",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 3,
					"patching_rect" : [ 48.0, 592.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-18",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 48.0, 400.0, 47.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-17",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"outlettype" : [ "int", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 288.0, 176.0, 47.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-24",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 208.0, 509.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-15",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "< 1",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 288.0, 208.0, 32.5, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-3",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numinlets" : 1,
					"patching_rect" : [ 346.0, 352.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-12"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numinlets" : 1,
					"patching_rect" : [ 306.0, 352.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-8"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"numinlets" : 1,
					"patching_rect" : [ 288.0, 352.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-4"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "r",
					"presentation_rect" : [ -1.0, 32.0, 19.0, 20.0 ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 380.0, 508.0, 19.0, 20.0 ],
					"presentation" : 1,
					"numoutlets" : 0,
					"id" : "obj-139",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p l-len",
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 80.0, 144.0, 61.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-137",
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 649.0, 61.0, 422.0, 702.0 ],
						"bglocked" : 0,
						"defrect" : [ 649.0, 61.0, 422.0, 702.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b 0",
									"outlettype" : [ "bang", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 160.0, 448.0, 47.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-5",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"outlettype" : [ "", "int", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 96.0, 544.0, 54.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-4",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"outlettype" : [ "", "int", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 32.0, 48.0, 54.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-13",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"outlettype" : [ "", "int", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 144.0, 48.0, 54.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-11",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r ---update-len",
									"outlettype" : [ "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 0,
									"patching_rect" : [ 160.0, 416.0, 119.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-7",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 1",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 224.0, 32.5, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-3",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"outlettype" : [ "int", "bang" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 128.0, 176.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-6",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "!- 9",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 352.0, 39.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-50",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i i",
									"outlettype" : [ "bang", "int", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 144.0, 96.0, 61.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-47",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "- 1",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 288.0, 32.5, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-46",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "uzi",
									"outlettype" : [ "bang", "bang", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 256.0, 46.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-43",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "-",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 144.0, 32.5, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-42",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 128.0, 320.0, 32.5, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-41",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "set 0",
									"outlettype" : [ "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 80.0, 352.0, 47.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-27",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i b",
									"outlettype" : [ "bang", "int", "bang" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 32.0, 112.0, 61.0, 20.0 ],
									"numoutlets" : 3,
									"id" : "obj-24",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"outlettype" : [ "int", "bang" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 96.0, 512.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-23",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"outlettype" : [ "int", "bang" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 32.0, 80.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-21",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "accum",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 3,
									"patching_rect" : [ 80.0, 416.0, 47.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-18",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr pow(2\\,$i1-1)",
									"outlettype" : [ "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 128.0, 384.0, 140.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-17",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "col #1 $1",
									"outlettype" : [ "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 96.0, 624.0, 75.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-131",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s ---l-len",
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 96.0, 656.0, 83.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-125",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"patching_rect" : [ 144.0, 0.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-2",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"patching_rect" : [ 32.0, 0.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-1",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-131", 0 ],
									"destination" : [ "obj-125", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-131", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-50", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-50", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 2 ],
									"destination" : [ "obj-27", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 1 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 2 ],
									"destination" : [ "obj-41", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 1 ],
									"destination" : [ "obj-42", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 0 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-43", 2 ],
									"destination" : [ "obj-46", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"globalpatchername" : "",
						"default_fontface" : 0,
						"default_fontname" : "Andale Mono",
						"fontname" : "Andale Mono",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #1",
					"outlettype" : [ "", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 368.0, 48.0, 68.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-127",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #1",
					"outlettype" : [ "", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 128.0, 272.0, 68.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-126",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "!- 8",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 368.0, 80.0, 39.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-124",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---k-len",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 368.0, 16.0, 83.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-123",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"outlettype" : [ "list", "list" ],
					"scale" : 0,
					"rows" : 1,
					"numinlets" : 1,
					"patching_rect" : [ 48.0, 464.0, 130.0, 18.0 ],
					"numoutlets" : 2,
					"id" : "obj-122"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "getrow 0",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 208.0, 432.0, 68.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-121",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl sub 1",
					"outlettype" : [ "", "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 208.0, 487.0, 68.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-119",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 0 inc",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 128.0, 336.0, 68.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-114",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"outlettype" : [ "list", "list" ],
					"scale" : 0,
					"rows" : 1,
					"numinlets" : 1,
					"patching_rect" : [ 208.0, 464.0, 130.0, 18.0 ],
					"numoutlets" : 2,
					"id" : "obj-112"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---k-link",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 128.0, 240.0, 90.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-105",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p r",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 2,
					"patching_rect" : [ 144.0, 80.0, 32.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-91",
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 29.0, 69.0, 507.0, 397.0 ],
						"bglocked" : 0,
						"defrect" : [ 29.0, 69.0, 507.0, 397.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 288.0, 160.0, 32.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-14",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 8",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 240.0, 160.0, 32.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-13",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 160.0, 288.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-12",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 1",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 160.0, 192.0, 32.5, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-10",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 8",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 160.0, 160.0, 68.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-9",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b -1",
									"outlettype" : [ "bang", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 96.0, 192.0, 54.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-8",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b 1",
									"outlettype" : [ "bang", "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 48.0, 192.0, 47.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-7",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "set $1",
									"outlettype" : [ "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 2,
									"patching_rect" : [ 336.0, 192.0, 54.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-6",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"patching_rect" : [ 336.0, 48.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-4",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "accum",
									"outlettype" : [ "int" ],
									"fontname" : "Andale Mono",
									"numinlets" : 3,
									"patching_rect" : [ 96.0, 256.0, 47.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-3",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel none inc dec random max min",
									"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang", "" ],
									"fontname" : "Andale Mono",
									"numinlets" : 1,
									"patching_rect" : [ 32.0, 112.0, 234.0, 20.0 ],
									"numoutlets" : 7,
									"id" : "obj-2",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"patching_rect" : [ 32.0, 48.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-1",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 5 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 4 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 2 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 3 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 1 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"globalpatchername" : "",
						"default_fontface" : 0,
						"default_fontname" : "Andale Mono",
						"fontname" : "Andale Mono",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2r",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 144.0, 16.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-90",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #2t",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 368.0, 352.0, 47.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-82",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t #1 b",
					"outlettype" : [ "", "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 400.0, 480.0, 83.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-81",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 400.0, 448.0, 68.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-80",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"varname" : "num",
					"outlettype" : [ "", "", "float" ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"presentation_rect" : [ 59.0, 36.0, 23.0, 15.0 ],
					"fontname" : "Andale Mono",
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hltcolor" : [ 0.976471, 0.054902, 0.054902, 1.0 ],
					"pictures" : [  ],
					"numinlets" : 1,
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 400.0, 508.0, 35.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 3,
					"id" : "obj-68",
					"fontface" : 0,
					"parameter_enable" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "num",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "num",
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
							"parameter_enum" : [ "1", "2", "3", "4", "5", "6", "7", "8" ],
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.menu",
					"varname" : "type",
					"outlettype" : [ "", "", "float" ],
					"tricolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"presentation_rect" : [ 15.0, 36.0, 43.0, 15.0 ],
					"fontname" : "Andale Mono",
					"activebgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hltcolor" : [ 0.976471, 0.054902, 0.054902, 1.0 ],
					"pictures" : [  ],
					"numinlets" : 1,
					"bordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"focusbordercolor" : [ 0.360784, 0.360784, 0.360784, 1.0 ],
					"patching_rect" : [ 464.0, 512.0, 100.0, 15.0 ],
					"presentation" : 1,
					"numoutlets" : 3,
					"id" : "obj-67",
					"fontface" : 0,
					"parameter_enable" : 1,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_unitstyle" : 10,
							"parameter_mmax" : 1.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_type" : 2,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "type",
							"parameter_modmax" : 127.0,
							"parameter_longname" : "type",
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
							"parameter_enum" : [ "none", "inc", "dec", "random", "max", "min" ],
							"parameter_exponent" : 1.0,
							"parameter_annotation_name" : ""
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "wait one more p, clear f",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 176.0, 183.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-66",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "m",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 192.0, 208.0, 19.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-64",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "n",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 192.0, 80.0, 19.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-63",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"ignoreclick" : 1,
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 208.0, 208.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-59",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b b b 0",
					"outlettype" : [ "bang", "bang", "bang", "bang", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 288.0, 288.0, 90.0, 20.0 ],
					"numoutlets" : 5,
					"id" : "obj-38",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2n",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 208.0, 16.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-34",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 1,
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"maximum" : 8,
					"patching_rect" : [ 208.0, 80.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-33",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "restart, m = n",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 272.0, 150.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-31",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "execute r",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 240.0, 150.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-25",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "then send t and p's to q list",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 208.0, 219.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-21",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "m = n",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 80.0, 150.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-13",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "if m = 0 set f ",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 144.0, 119.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-10",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "receive p's, subtract one from m",
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 624.0, 112.0, 241.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-9",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b -1",
					"outlettype" : [ "bang", "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 1,
					"patching_rect" : [ 288.0, 112.0, 54.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-7",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "accum",
					"outlettype" : [ "int" ],
					"fontname" : "Andale Mono",
					"numinlets" : 3,
					"patching_rect" : [ 288.0, 144.0, 85.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-2",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #2p",
					"outlettype" : [ "" ],
					"fontname" : "Andale Mono",
					"numinlets" : 0,
					"patching_rect" : [ 288.0, 16.0, 47.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-1",
					"fontsize" : 12.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-70", 1 ],
					"destination" : [ "obj-73", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 0 ],
					"destination" : [ "obj-126", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-127", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-137", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 627.5, 505.5, 601.5, 505.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-126", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-137", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-127", 0 ],
					"destination" : [ "obj-124", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-124", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-121", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 1 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-91", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-80", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 1 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 1 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 1 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 2 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 1 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-18", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 1 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 1 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 3 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 2 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-121", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 4 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-14", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 3 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 3 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 1 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 1 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 288.5, 561.0, 238.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 217.5, 611.5, 238.5, 611.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 1 ],
					"destination" : [ "obj-83", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 2 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [ 384.5, 662.0, 409.5, 662.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 2 ],
					"destination" : [ "obj-61", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
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
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ],
		"parameters" : 		{
			"obj-37::obj-5" : [ "note", "note", 0 ],
			"obj-68" : [ "num", "num", 0 ],
			"obj-37::obj-7" : [ "duration", "duration", 0 ],
			"obj-37::obj-12" : [ "velocity", "velocity", 0 ],
			"obj-37::obj-21" : [ "c_mute", "c_mute", 0 ],
			"obj-67" : [ "type", "type", 0 ]
		}

	}

}
