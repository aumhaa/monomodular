{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 241.0, 320.0, 725.0, 308.0 ],
		"bglocked" : 0,
		"defrect" : [ 241.0, 320.0, 725.0, 308.0 ],
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
					"text" : "t i i",
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 576.0, 88.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-177",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "select 1",
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 576.0, 136.0, 47.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-178",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-2",
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 160.0, 56.0, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-179",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "> -1",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 576.0, 112.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-180",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---playing_slot_index",
					"outlettype" : [ "" ],
					"patching_rect" : [ 576.0, 64.0, 128.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-23",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---go",
					"outlettype" : [ "" ],
					"patching_rect" : [ 32.0, 88.0, 39.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-27",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 296.0, 88.0, 32.5, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-12",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll ---tracks_mode_two/four",
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 192.0, 160.0, 147.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-11",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 16,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0, 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0, 1 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0, 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0, 3 ]
							}
, 							{
								"key" : 4,
								"value" : [ 1, 0 ]
							}
, 							{
								"key" : 5,
								"value" : [ 1, 1 ]
							}
, 							{
								"key" : 6,
								"value" : [ 1, 2 ]
							}
, 							{
								"key" : 7,
								"value" : [ 1, 3 ]
							}
, 							{
								"key" : 8,
								"value" : [ 2, 0 ]
							}
, 							{
								"key" : 9,
								"value" : [ 2, 1 ]
							}
, 							{
								"key" : 10,
								"value" : [ 2, 2 ]
							}
, 							{
								"key" : 11,
								"value" : [ 2, 3 ]
							}
, 							{
								"key" : 12,
								"value" : [ 3, 0 ]
							}
, 							{
								"key" : 13,
								"value" : [ 3, 1 ]
							}
, 							{
								"key" : 14,
								"value" : [ 3, 2 ]
							}
, 							{
								"key" : 15,
								"value" : [ 3, 3 ]
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
					"text" : "unpack",
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 176.0, 208.0, 46.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-119",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 256.0, 88.0, 32.5, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-118",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 216.0, 88.0, 32.5, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-115",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 176.0, 88.0, 32.5, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-113",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route Eight/Sixteen Four/Eight Two/Four One",
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 176.0, 64.0, 224.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-105",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---live_tracks_mode",
					"outlettype" : [ "" ],
					"patching_rect" : [ 176.0, 40.0, 111.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-103",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll ---tracks_mode_one",
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 192.0, 184.0, 126.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-123",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 16,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0, 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0, 1 ]
							}
, 							{
								"key" : 2,
								"value" : [ 0, 2 ]
							}
, 							{
								"key" : 3,
								"value" : [ 0, 3 ]
							}
, 							{
								"key" : 4,
								"value" : [ 0, 4 ]
							}
, 							{
								"key" : 5,
								"value" : [ 0, 5 ]
							}
, 							{
								"key" : 6,
								"value" : [ 0, 6 ]
							}
, 							{
								"key" : 7,
								"value" : [ 0, 7 ]
							}
, 							{
								"key" : 8,
								"value" : [ 0, 8 ]
							}
, 							{
								"key" : 9,
								"value" : [ 0, 9 ]
							}
, 							{
								"key" : 10,
								"value" : [ 0, 10 ]
							}
, 							{
								"key" : 11,
								"value" : [ 0, 11 ]
							}
, 							{
								"key" : 12,
								"value" : [ 0, 12 ]
							}
, 							{
								"key" : 13,
								"value" : [ 0, 13 ]
							}
, 							{
								"key" : 14,
								"value" : [ 0, 14 ]
							}
, 							{
								"key" : 15,
								"value" : [ 0, 15 ]
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
					"text" : "coll ---tracks_mode_eight/sixteen",
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 192.0, 112.0, 169.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-117",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 16,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0, 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 1, 0 ]
							}
, 							{
								"key" : 2,
								"value" : [ 2, 0 ]
							}
, 							{
								"key" : 3,
								"value" : [ 3, 0 ]
							}
, 							{
								"key" : 4,
								"value" : [ 4, 0 ]
							}
, 							{
								"key" : 5,
								"value" : [ 5, 0 ]
							}
, 							{
								"key" : 6,
								"value" : [ 6, 0 ]
							}
, 							{
								"key" : 7,
								"value" : [ 7, 0 ]
							}
, 							{
								"key" : 8,
								"value" : [ 8, 0 ]
							}
, 							{
								"key" : 9,
								"value" : [ 9, 0 ]
							}
, 							{
								"key" : 10,
								"value" : [ 10, 0 ]
							}
, 							{
								"key" : 11,
								"value" : [ 11, 0 ]
							}
, 							{
								"key" : 12,
								"value" : [ 12, 0 ]
							}
, 							{
								"key" : 13,
								"value" : [ 13, 0 ]
							}
, 							{
								"key" : 14,
								"value" : [ 14, 0 ]
							}
, 							{
								"key" : 15,
								"value" : [ 15, 0 ]
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
					"text" : "coll ---tracks_mode_four/eight",
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 192.0, 136.0, 154.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-9",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 4,
					"coll_data" : 					{
						"count" : 16,
						"data" : [ 							{
								"key" : 0,
								"value" : [ 0, 0 ]
							}
, 							{
								"key" : 1,
								"value" : [ 0, 1 ]
							}
, 							{
								"key" : 2,
								"value" : [ 1, 0 ]
							}
, 							{
								"key" : 3,
								"value" : [ 1, 1 ]
							}
, 							{
								"key" : 4,
								"value" : [ 2, 0 ]
							}
, 							{
								"key" : 5,
								"value" : [ 2, 1 ]
							}
, 							{
								"key" : 6,
								"value" : [ 3, 0 ]
							}
, 							{
								"key" : 7,
								"value" : [ 3, 1 ]
							}
, 							{
								"key" : 8,
								"value" : [ 4, 0 ]
							}
, 							{
								"key" : 9,
								"value" : [ 4, 1 ]
							}
, 							{
								"key" : 10,
								"value" : [ 5, 0 ]
							}
, 							{
								"key" : 11,
								"value" : [ 5, 1 ]
							}
, 							{
								"key" : 12,
								"value" : [ 6, 0 ]
							}
, 							{
								"key" : 13,
								"value" : [ 6, 1 ]
							}
, 							{
								"key" : 14,
								"value" : [ 7, 0 ]
							}
, 							{
								"key" : 15,
								"value" : [ 7, 1 ]
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
					"text" : "t i i",
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 464.0, 112.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-19",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 440.0, 160.0, 32.0, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-22",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 480.0, 184.0, 32.0, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-21",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 0 1",
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 464.0, 136.0, 46.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-17",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 368.0, 208.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-5",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 368.0, 136.0, 46.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-6",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bucket",
					"outlettype" : [ "" ],
					"patching_rect" : [ 384.0, 160.0, 43.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-10",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "-",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 368.0, 184.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-13",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---master_scene",
					"outlettype" : [ "" ],
					"patching_rect" : [ 368.0, 112.0, 94.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-14",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 32.0, 112.0, 16.0, 16.0 ],
					"id" : "obj-16",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "deferlow",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 64.0, 52.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-8",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---loadbang",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 16.0, 72.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-4",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set Clip",
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 64.0, 89.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-7",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 40.0, 32.5, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-3",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hint" : "Clip",
					"annotation" : "Clip",
					"patching_rect" : [ 368.0, 264.0, 25.0, 25.0 ],
					"id" : "obj-2",
					"numinlets" : 1,
					"numoutlets" : 0,
					"comment" : "Clip"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "outlet",
					"hint" : "Track",
					"annotation" : "Track",
					"patching_rect" : [ 80.0, 264.0, 25.0, 25.0 ],
					"id" : "obj-1",
					"numinlets" : 1,
					"numoutlets" : 0,
					"comment" : "Track"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 16.0, 40.0, 32.0, 16.0 ],
					"fontsize" : 10.0,
					"id" : "obj-107",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---live_clips_mode",
					"outlettype" : [ "" ],
					"patching_rect" : [ 464.0, 88.0, 104.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-101",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 424.0, 184.0, 32.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-94",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 80.0, 208.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-72",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 80.0, 136.0, 46.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-66",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bucket",
					"outlettype" : [ "" ],
					"patching_rect" : [ 96.0, 160.0, 43.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-65",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "-",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 80.0, 184.0, 32.5, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-63",
					"numinlets" : 2,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---master_track",
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 112.0, 89.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-62",
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"numinlets" : 0,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "switch 2 1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 424.0, 208.0, 75.0, 18.0 ],
					"fontsize" : 10.0,
					"id" : "obj-18",
					"numinlets" : 3,
					"fontname" : "Arial Bold",
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.numbox",
					"varname" : "live.numbox[1]",
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 368.0, 232.0, 36.0, 15.0 ],
					"presentation" : 1,
					"id" : "obj-20",
					"parameter_enable" : 1,
					"numinlets" : 1,
					"presentation_rect" : [ 24.0, 16.0, 24.0, 15.0 ],
					"numoutlets" : 2,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 255.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "live.numbox",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "live.numbox[1]",
							"parameter_modmin" : 0.0
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "live.numbox",
					"varname" : "live.numbox",
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 80.0, 232.0, 36.0, 15.0 ],
					"presentation" : 1,
					"id" : "obj-15",
					"parameter_enable" : 1,
					"numinlets" : 1,
					"presentation_rect" : [ 0.0, 16.0, 24.0, 15.0 ],
					"numoutlets" : 2,
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 0,
							"parameter_modmode" : 0,
							"parameter_info" : "",
							"parameter_order" : 0,
							"parameter_units" : "",
							"parameter_speedlim" : 0,
							"parameter_steps" : 0,
							"parameter_exponent" : 1.0,
							"parameter_unitstyle" : 0,
							"parameter_mmax" : 255.0,
							"parameter_mmin" : 0.0,
							"parameter_initial" : [ 0 ],
							"parameter_type" : 1,
							"parameter_initial_enable" : 1,
							"parameter_shortname" : "live.numbox",
							"parameter_invisible" : 0,
							"parameter_modmax" : 127.0,
							"parameter_annotation_name" : "",
							"parameter_longname" : "live.numbox",
							"parameter_modmin" : 0.0
						}

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Clip #1",
					"patching_rect" : [ 80.0, 88.0, 72.0, 18.0 ],
					"fontsize" : 10.0,
					"presentation" : 1,
					"id" : "obj-168",
					"numinlets" : 1,
					"fontname" : "Arial Bold",
					"presentation_rect" : [ 0.0, 0.0, 48.363556, 18.0 ],
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-179", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 585.5, 180.0, 489.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-18", 1 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 179.0, 461.5, 179.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 473.5, 156.0, 449.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-22", 1 ],
					"hidden" : 0,
					"midpoints" : [ 377.5, 132.0, 462.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-179", 0 ],
					"destination" : [ "obj-21", 1 ],
					"hidden" : 0,
					"midpoints" : [ 585.5, 180.0, 502.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-177", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 1 ],
					"destination" : [ "obj-179", 1 ],
					"hidden" : 0,
					"midpoints" : [ 599.0, 109.0, 622.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-180", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-178", 0 ],
					"destination" : [ "obj-179", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 0 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 41.5, 253.0, 75.0, 253.0, 75.0, 229.0, 89.5, 229.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 41.5, 253.0, 364.0, 253.0, 364.0, 228.0, 377.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [ 305.5, 107.0, 185.0, 107.0, 185.0, 180.0, 201.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-118", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 265.5, 107.0, 185.0, 107.0, 185.0, 156.0, 201.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-115", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 225.5, 107.0, 185.0, 107.0, 185.0, 132.0, 201.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [ 201.5, 132.0, 185.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 0,
					"midpoints" : [ 185.5, 107.0, 201.5, 107.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 3 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 1 ],
					"destination" : [ "obj-115", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 0 ],
					"destination" : [ "obj-113", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 2 ],
					"destination" : [ "obj-118", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 1 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 212.5, 228.0, 377.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 185.5, 229.0, 89.5, 229.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 1 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [ 487.0, 132.0, 433.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-18", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 1 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 487.0, 156.0, 487.0, 156.0, 487.0, 181.0, 489.5, 181.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-5", 1 ],
					"hidden" : 0,
					"midpoints" : [ 377.5, 250.0, 407.0, 250.0, 407.0, 204.0, 391.0, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-13", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-66", 0 ],
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
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-72", 1 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 250.0, 120.0, 250.0, 120.0, 204.0, 103.0, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 229.0, 89.5, 229.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 433.5, 228.0, 377.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [ 201.5, 204.0, 185.5, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [ 201.5, 156.0, 185.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [ 201.5, 180.0, 185.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 377.5, 157.0, 393.5, 157.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 156.0, 105.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-63", 1 ],
					"hidden" : 0,
					"midpoints" : [ 105.5, 180.0, 103.0, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 36.0, 89.5, 36.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ],
		"parameters" : 		{
			"obj-20" : [ "live.numbox[1]", "live.numbox", 0 ],
			"obj-15" : [ "live.numbox", "live.numbox", 0 ]
		}

	}

}
