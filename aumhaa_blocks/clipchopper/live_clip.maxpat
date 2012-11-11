{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 4.0, 44.0, 1276.0, 730.0 ],
		"bglocked" : 0,
		"defrect" : [ 4.0, 44.0, 1276.0, 730.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
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
					"text" : "t b i",
					"patching_rect" : [ 568.0, 48.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-190",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"presentation_rect" : [ 567.0, 47.0, 0.0, 0.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 384.0, 48.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-189",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe",
					"patching_rect" : [ 584.0, 592.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-402",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 3120.0, 376.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-311",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---press_to_clips",
					"patching_rect" : [ 560.0, 328.0, 97.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-266",
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
					"text" : "Don't mute if two buttons held",
					"linecount" : 2,
					"patching_rect" : [ 2960.0, 104.0, 92.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-316",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Quantized Mute",
					"patching_rect" : [ 3176.0, 304.0, 88.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-312",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Toggle Mute on when press normally",
					"linecount" : 2,
					"patching_rect" : [ 3160.0, 128.0, 113.0, 29.0 ],
					"numinlets" : 1,
					"id" : "obj-307",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Work In Progress",
					"patching_rect" : [ 1472.0, 424.0, 96.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-303",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 2912.0, 280.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-257",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"patching_rect" : [ 3000.0, 352.0, 51.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-346",
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
					"patching_rect" : [ 2936.0, 256.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-345",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2912.0, 256.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-344",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 300",
					"patching_rect" : [ 2936.0, 232.0, 56.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-341",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 0 1",
					"patching_rect" : [ 2912.0, 208.0, 66.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-340",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bucket",
					"patching_rect" : [ 2960.0, 160.0, 43.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-335",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack",
					"patching_rect" : [ 2960.0, 136.0, 48.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-333",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i1 + $i2 == 2 then 0 else 1",
					"patching_rect" : [ 2912.0, 184.0, 144.0, 18.0 ],
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
					"text" : "unpack",
					"patching_rect" : [ 2912.0, 136.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-372",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---press_to_clips",
					"patching_rect" : [ 2912.0, 40.0, 97.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-371",
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
					"text" : "999",
					"patching_rect" : [ 552.0, 96.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-331",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "999",
					"patching_rect" : [ 368.0, 96.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-329",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 2232.0, 496.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-327",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 2256.0, 472.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-326",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2232.0, 472.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-325",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 2232.0, 448.0, 43.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-310",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 2232.0, 520.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-304",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_is_playing",
					"patching_rect" : [ 2232.0, 424.0, 110.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-204",
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
					"text" : "set",
					"patching_rect" : [ 2632.0, 208.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-309",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clear_clip",
					"patching_rect" : [ 2632.0, 184.0, 84.0, 18.0 ],
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
					"text" : "s #1---clear_clip",
					"patching_rect" : [ 352.0, 144.0, 86.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-298",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i1 < $i2 then $i1 else out2 bang",
					"patching_rect" : [ 536.0, 72.0, 172.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-282",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i1 < $i2 then $i1 else out2 bang",
					"patching_rect" : [ 352.0, 72.0, 172.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-247",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---scene_count",
					"patching_rect" : [ 568.0, 24.0, 88.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-245",
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
					"text" : "r ---visible_track_count",
					"patching_rect" : [ 384.0, 24.0, 121.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-128",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 2376.0, 304.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-172",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Gate Mode",
					"patching_rect" : [ 3112.0, 88.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-289",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Play Modes",
					"patching_rect" : [ 3056.0, 16.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-275",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clear_clip",
					"patching_rect" : [ 2272.0, 400.0, 86.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-246",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 2592.0, 184.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-232",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_is_playing",
					"patching_rect" : [ 2592.0, 160.0, 110.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-100",
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
					"text" : "gate",
					"patching_rect" : [ 2536.0, 232.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-318",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl rev",
					"patching_rect" : [ 2912.0, 112.0, 36.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-308",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"patching_rect" : [ 3120.0, 304.0, 48.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-315",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"patching_rect" : [ 3000.0, 256.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-314",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int",
					"patching_rect" : [ 3120.0, 184.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-118",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---press_x",
					"patching_rect" : [ 2792.0, 160.0, 78.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-53",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 3032.0, 328.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-280",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---track_unmute_all",
					"patching_rect" : [ 1832.0, 448.0, 109.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-17",
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
					"text" : "1",
					"patching_rect" : [ 3032.0, 304.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-300",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 3000.0, 304.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-299",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1 0",
					"patching_rect" : [ 3000.0, 280.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-297",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 1784.0, 496.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-294",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 1808.0, 472.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-293",
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
					"patching_rect" : [ 1784.0, 472.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-292",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 1784.0, 448.0, 43.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-279",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---track_mute_set",
					"patching_rect" : [ 1784.0, 424.0, 112.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-277",
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
					"text" : "zl rot -1",
					"patching_rect" : [ 2912.0, 64.0, 46.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-296",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #1",
					"patching_rect" : [ 2912.0, 88.0, 49.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-295",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---play_mode",
					"patching_rect" : [ 3072.0, 64.0, 79.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-270",
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
					"text" : "t i i",
					"patching_rect" : [ 1456.0, 376.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-291",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 1432.0, 424.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-290",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"patching_rect" : [ 1416.0, 352.0, 34.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-288",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "float",
					"patching_rect" : [ 1384.0, 472.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-287",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 3120.0, 136.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-286",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"patching_rect" : [ 3144.0, 112.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-284",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 3120.0, 112.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-285",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 1 1",
					"patching_rect" : [ 3120.0, 256.0, 51.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-283",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 3056.0, 136.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-281",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 3080.0, 112.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-278",
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
					"patching_rect" : [ 3056.0, 112.0, 24.0, 16.0 ],
					"numinlets" : 2,
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
					"text" : "gate 1 0",
					"patching_rect" : [ 3000.0, 376.0, 50.0, 18.0 ],
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
					"text" : "sel Slice",
					"patching_rect" : [ 3056.0, 88.0, 51.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-259",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---play_mode",
					"patching_rect" : [ 3056.0, 40.0, 91.0, 18.0 ],
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
					"text" : "int",
					"patching_rect" : [ 1432.0, 400.0, 42.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-274",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---looping",
					"patching_rect" : [ 1456.0, 352.0, 74.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-273",
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
					"text" : "s #1---looping_set",
					"patching_rect" : [ 1416.0, 616.0, 96.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-272",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1432.0, 520.0, 50.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-271",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_width",
					"patching_rect" : [ 1448.0, 472.0, 119.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-267",
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
					"text" : "expr int($f1 * ($f2 / $f3))",
					"patching_rect" : [ 1416.0, 496.0, 121.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-268",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---loop_length",
					"patching_rect" : [ 1432.0, 448.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-269",
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
					"text" : "r #1---looping_set",
					"patching_rect" : [ 1536.0, 328.0, 94.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-265",
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
					"text" : "set looping $1",
					"patching_rect" : [ 1536.0, 280.0, 78.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-261",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l",
					"patching_rect" : [ 1536.0, 256.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-262",
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
					"patching_rect" : [ 1536.0, 304.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-263",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Looping Set",
					"patching_rect" : [ 1552.0, 232.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-264",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 1104.0, 328.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-258",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---looping",
					"patching_rect" : [ 1088.0, 352.0, 76.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-255",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property looping",
					"patching_rect" : [ 1088.0, 280.0, 90.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-249",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1088.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-250",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 1088.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-252",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Looping",
					"patching_rect" : [ 1104.0, 232.0, 48.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-254",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 1416.0, 592.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-256",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 1416.0, 568.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-253",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---loop_start_set",
					"patching_rect" : [ 2784.0, 184.0, 108.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-251",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_is_playing",
					"patching_rect" : [ 1416.0, 544.0, 110.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-244",
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
					"text" : "r #1---loop_start_set",
					"patching_rect" : [ 1416.0, 328.0, 107.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-243",
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
					"text" : "set loop_start $1",
					"patching_rect" : [ 1416.0, 280.0, 90.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-8",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l",
					"patching_rect" : [ 1416.0, 256.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-62",
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
					"patching_rect" : [ 1416.0, 304.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-184",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Loop Start Set",
					"patching_rect" : [ 1432.0, 232.0, 80.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-187",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"patching_rect" : [ 2520.0, 208.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-188",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2568.0, 208.0, 32.0, 16.0 ],
					"numinlets" : 2,
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
					"text" : "+ 1",
					"patching_rect" : [ 352.0, 544.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-174",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---quant_none",
					"patching_rect" : [ 352.0, 520.0, 84.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-110",
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
					"text" : "switch 2 1",
					"patching_rect" : [ 352.0, 568.0, 58.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-11",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int 0",
					"patching_rect" : [ 2232.0, 328.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-144",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---go_led",
					"patching_rect" : [ 2568.0, 136.0, 71.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-226",
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
					"patching_rect" : [ 2568.0, 184.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-93",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---go_leds",
					"patching_rect" : [ 2648.0, 136.0, 65.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-97",
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
					"text" : "change",
					"patching_rect" : [ 640.0, 520.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-183",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i1 == 1 then 1 else 0",
					"patching_rect" : [ 2376.0, 328.0, 119.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-170",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---master_clock",
					"patching_rect" : [ 2376.0, 280.0, 91.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-173",
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
					"text" : "sel 1",
					"patching_rect" : [ 2120.0, 352.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-230",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #1",
					"patching_rect" : [ 560.0, 376.0, 49.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-240",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl rot -1",
					"patching_rect" : [ 560.0, 352.0, 46.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-239",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set",
					"patching_rect" : [ 3152.0, 376.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-236",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"patching_rect" : [ 3120.0, 352.0, 32.5, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-237",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---master_clock",
					"patching_rect" : [ 3144.0, 328.0, 91.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-231",
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
					"text" : "t i",
					"patching_rect" : [ 3120.0, 328.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-238",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 3152.0, 232.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-235",
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
					"patching_rect" : [ 3120.0, 232.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-234",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 3120.0, 208.0, 51.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-229",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---track_mute_set",
					"patching_rect" : [ 3120.0, 400.0, 113.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-228",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---track_mute_state",
					"patching_rect" : [ 3136.0, 160.0, 121.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-227",
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
					"text" : "t b b",
					"patching_rect" : [ 2560.0, 400.0, 34.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-215",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b",
					"patching_rect" : [ 2520.0, 400.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-201",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---go_led",
					"patching_rect" : [ 2592.0, 440.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-219",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clear_clip",
					"patching_rect" : [ 2576.0, 464.0, 86.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-217",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clear_clip",
					"patching_rect" : [ 2616.0, 488.0, 84.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-216",
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
					"text" : "1",
					"patching_rect" : [ 2544.0, 440.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-213",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2520.0, 440.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-202",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 2520.0, 376.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-199",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---track_mute_state",
					"patching_rect" : [ 2520.0, 352.0, 121.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-198",
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
					"text" : "gate 1 1",
					"patching_rect" : [ 2520.0, 464.0, 48.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-178",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l",
					"patching_rect" : [ 2520.0, 328.0, 21.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-105",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive~ ---master_clock_phase",
					"patching_rect" : [ 384.0, 424.0, 162.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-224",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "signal" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "edge~",
					"patching_rect" : [ 384.0, 448.0, 40.0, 18.0 ],
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
					"maxclass" : "newobj",
					"text" : "* 1.",
					"patching_rect" : [ 352.0, 424.0, 29.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-223",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_width",
					"patching_rect" : [ 352.0, 352.0, 117.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-222",
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
					"text" : "/ 1.",
					"patching_rect" : [ 352.0, 400.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-221",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b f",
					"patching_rect" : [ 352.0, 376.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-220",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---loop_length",
					"patching_rect" : [ 352.0, 328.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-218",
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
					"text" : "Sub-looping",
					"patching_rect" : [ 560.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-214",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---set_live_clip_clipslot",
					"patching_rect" : [ 640.0, 496.0, 138.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-205",
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
					"text" : "r ---quant_value",
					"patching_rect" : [ 592.0, 424.0, 86.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-206",
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
					"text" : "r ---monomesize_width",
					"patching_rect" : [ 608.0, 448.0, 119.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-207",
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
					"text" : "r #1---loop_length",
					"patching_rect" : [ 624.0, 472.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-208",
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
					"text" : "r #1---clip_play_pos",
					"patching_rect" : [ 576.0, 400.0, 104.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-209",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.615686, 0.552941, 0.827451, 1.0 ],
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch",
					"patching_rect" : [ 560.0, 616.0, 99.0, 24.0 ],
					"numinlets" : 3,
					"id" : "obj-210",
					"numoutlets" : 1,
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p subloop",
					"patching_rect" : [ 560.0, 544.0, 99.0, 18.0 ],
					"numinlets" : 6,
					"id" : "obj-211",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.082353, 0.431373, 0.411765, 1.0 ],
					"outlettype" : [ "", "int" ],
					"fontsize" : 10.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 37.0, 62.0, 552.0, 590.0 ],
						"bglocked" : 0,
						"defrect" : [ 37.0, 62.0, 552.0, 590.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
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
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "second message not strictly necessary (could send int straight to expr), but clarifies design.",
									"linecount" : 6,
									"patching_rect" : [ 136.0, 440.0, 112.0, 89.0 ],
									"numinlets" : 1,
									"id" : "obj-26",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 456.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-21",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Clip Is Playing (0 / 1)"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 0.",
									"patching_rect" : [ 280.0, 464.0, 32.5, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-9",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 360.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-6",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Quantization Value"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b",
									"patching_rect" : [ 184.0, 176.0, 34.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-34",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"patching_rect" : [ 184.0, 152.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-33",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack 0 0",
									"patching_rect" : [ 184.0, 128.0, 69.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-32",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t l l",
									"patching_rect" : [ 184.0, 104.0, 49.5, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-31",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0 0",
									"patching_rect" : [ 184.0, 208.0, 50.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-30",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch2",
									"patching_rect" : [ 80.0, 64.0, 43.0, 32.0 ],
									"numinlets" : 2,
									"id" : "obj-29",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "onebang",
									"patching_rect" : [ 280.0, 536.0, 57.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-18",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "But 2",
									"patching_rect" : [ 120.0, 392.0, 37.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-25",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "But 1",
									"patching_rect" : [ 40.0, 376.0, 37.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-24",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"patching_rect" : [ 280.0, 512.0, 36.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-20",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Playback position of loop end in current \"frame\" of loop_length beats.",
									"linecount" : 3,
									"patching_rect" : [ 344.0, 488.0, 150.0, 48.0 ],
									"numinlets" : 1,
									"id" : "obj-19",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : ">= 0.",
									"patching_rect" : [ 280.0, 488.0, 45.0, 20.0 ],
									"numinlets" : 2,
									"id" : "obj-14",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "expr ($f1 * ($f3 / $f2)) + int($f4 / $f3) * $f3",
									"patching_rect" : [ 328.0, 464.0, 199.0, 18.0 ],
									"numinlets" : 4,
									"id" : "obj-118",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 392.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-12",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Monome Width"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 424.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-10",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Clip Length"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 280.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-4",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Clip Playback Position"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1 i",
									"patching_rect" : [ 40.0, 320.0, 33.5, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"fontname" : "Arial",
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 1 1 b i",
									"patching_rect" : [ 80.0, 320.0, 55.5, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-17",
									"fontname" : "Arial",
									"numoutlets" : 4,
									"outlettype" : [ "int", "int", "bang", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t 0 0 0 set set",
									"patching_rect" : [ 104.0, 240.0, 83.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-16",
									"fontname" : "Arial",
									"numoutlets" : 5,
									"outlettype" : [ "int", "int", "int", "set", "set" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch2",
									"patching_rect" : [ 40.0, 280.0, 59.0, 31.0 ],
									"numinlets" : 2,
									"id" : "obj-15",
									"numoutlets" : 2,
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"patching_rect" : [ 104.0, 368.0, 50.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-13",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"patching_rect" : [ 24.0, 352.0, 50.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-11",
									"fontname" : "Arial",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 184.0, 392.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-8",
									"numoutlets" : 0,
									"comment" : "Loop Active (0/1)"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "input: [state, col]",
									"patching_rect" : [ 136.0, 16.0, 122.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-7",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route 1 0",
									"patching_rect" : [ 80.0, 176.0, 66.0, 20.0 ],
									"numinlets" : 1,
									"id" : "obj-5",
									"fontname" : "Arial",
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 24.0, 392.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-2",
									"numoutlets" : 0,
									"comment" : "Looped Button Presses Out"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"annotation" : "",
									"patching_rect" : [ 104.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Button Presses In"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-118", 0 ],
									"destination" : [ "obj-14", 1 ],
									"hidden" : 0,
									"midpoints" : [ 337.5, 484.0, 315.5, 484.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"color" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
									"midpoints" : [ 101.666664, 363.0, 193.5, 363.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 3 ],
									"destination" : [ "obj-13", 1 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 126.0, 355.0, 144.5, 355.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 1 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"color" : [ 0.027451, 0.556863, 0.0, 1.0 ],
									"midpoints" : [ 89.5, 429.0, 272.0, 429.0, 272.0, 53.0, 89.5, 53.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-118", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-118", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-118", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 113.5, 420.0, 337.5, 420.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-118", 3 ],
									"hidden" : 0,
									"midpoints" : [ 289.5, 258.0, 517.5, 258.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"color" : [ 0.027451, 0.556863, 0.0, 1.0 ],
									"midpoints" : [ 113.5, 263.0, 61.0, 263.0, 61.0, 53.0, 89.5, 53.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-29", 1 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"color" : [ 0.047059, 0.913725, 0.913725, 1.0 ],
									"midpoints" : [ 129.5, 267.0, 193.5, 267.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 2 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"color" : [ 0.027451, 0.556863, 0.0, 1.0 ],
									"midpoints" : [ 145.5, 271.0, 49.5, 271.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 3 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 161.5, 315.0, 33.5, 315.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 1 ],
									"destination" : [ "obj-11", 1 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"color" : [ 0.027451, 0.556863, 0.0, 1.0 ],
									"midpoints" : [ 49.5, 343.0, 17.0, 343.0, 17.0, 270.0, 49.5, 270.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 289.5, 557.0, 17.0, 557.0, 17.0, 347.0, 33.5, 347.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 1 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [ 306.5, 532.0, 327.5, 532.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 1 ],
									"destination" : [ "obj-30", 1 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 193.5, 123.0, 193.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-33", 0 ],
									"hidden" : 0,
									"color" : [ 1.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 208.5, 200.0, 113.5, 200.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 369.5, 456.0, 303.0, 456.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 1 ],
									"destination" : [ "obj-31", 0 ],
									"hidden" : 0,
									"midpoints" : [ 113.5, 100.0, 193.5, 100.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 2 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 4 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 177.5, 349.0, 113.5, 349.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 465.5, 236.0, 113.5, 236.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 0 ],
									"destination" : [ "obj-29", 1 ],
									"hidden" : 0,
									"midpoints" : [ 193.5, 227.0, 149.0, 227.0, 149.0, 60.0, 113.5, 60.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Arial Bold",
						"default_fontface" : 0,
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontname" : "Arial Bold",
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_move_play_pos",
					"patching_rect" : [ 584.0, 568.0, 136.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-212",
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
					"text" : "r #1---loop_length",
					"patching_rect" : [ 456.0, 544.0, 95.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-203",
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
					"text" : "% 1.",
					"patching_rect" : [ 440.0, 568.0, 34.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-200",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Loop End",
					"patching_rect" : [ 1208.0, 232.0, 65.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-179",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b f",
					"patching_rect" : [ 1304.0, 328.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-180",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 0.",
					"patching_rect" : [ 1192.0, 360.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-181",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property loop_start",
					"patching_rect" : [ 1304.0, 280.0, 102.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-182",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1304.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-185",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 1304.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-186",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"patching_rect" : [ 1208.0, 384.0, 40.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-192",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property loop_end",
					"patching_rect" : [ 1192.0, 280.0, 98.0, 16.0 ],
					"numinlets" : 2,
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
					"text" : "t b l",
					"patching_rect" : [ 1192.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-194",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 1192.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-195",
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
					"text" : "s #1---loop_length",
					"patching_rect" : [ 1192.0, 408.0, 97.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-196",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Loop Start",
					"patching_rect" : [ 1320.0, 232.0, 65.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-197",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "%",
					"patching_rect" : [ 2520.0, 136.0, 34.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-177",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Track Stop",
					"patching_rect" : [ 2136.0, 232.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-134",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Set Track Mute",
					"patching_rect" : [ 1800.0, 232.0, 80.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-39",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1968.0, 328.0, 40.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-27",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---playing_slot_index",
					"patching_rect" : [ 1952.0, 352.0, 130.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-176",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Playing Slot Index",
					"patching_rect" : [ 1968.0, 232.0, 96.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-143",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 1952.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-123",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property playing_slot_index",
					"patching_rect" : [ 1952.0, 280.0, 144.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-55",
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
					"patching_rect" : [ 1952.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-58",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Live Clip's Track Observers and Functions",
					"patching_rect" : [ 1648.0, 16.0, 216.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-171",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---track_stop",
					"patching_rect" : [ 2120.0, 328.0, 89.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-169",
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
					"text" : "r #1---track_mute_state",
					"patching_rect" : [ 1824.0, 352.0, 121.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-167",
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
					"text" : "t l",
					"patching_rect" : [ 2120.0, 256.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-166",
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
					"patching_rect" : [ 2120.0, 304.0, 60.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-157",
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
					"text" : "call stop_all_clips",
					"patching_rect" : [ 2120.0, 280.0, 96.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-130",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Track Mute",
					"patching_rect" : [ 1664.0, 232.0, 64.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-126",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 1784.0, 352.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-125",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 1648.0, 88.0, 32.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-168",
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
					"patching_rect" : [ 1648.0, 64.0, 31.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-165",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf path live_set visible_tracks %i",
					"patching_rect" : [ 1648.0, 112.0, 188.0, 18.0 ],
					"numinlets" : 1,
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
					"text" : "if $i1 == 0 then 1 else 0",
					"patching_rect" : [ 1784.0, 400.0, 119.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-164",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int",
					"patching_rect" : [ 1784.0, 376.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-163",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---track_mute_state",
					"patching_rect" : [ 1648.0, 352.0, 122.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-160",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 1664.0, 328.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-158",
					"numoutlets" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set mute $1",
					"patching_rect" : [ 1784.0, 280.0, 66.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-150",
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
					"patching_rect" : [ 1784.0, 304.0, 60.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-148",
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
					"text" : "t l",
					"patching_rect" : [ 1784.0, 256.0, 19.0, 18.0 ],
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
					"maxclass" : "newobj",
					"text" : "r #1---track_mute",
					"patching_rect" : [ 1784.0, 328.0, 92.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-145",
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
					"text" : "t b l",
					"patching_rect" : [ 1648.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-141",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property mute",
					"patching_rect" : [ 1648.0, 280.0, 78.0, 16.0 ],
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
					"text" : "live.observer",
					"patching_rect" : [ 1648.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-113",
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
					"text" : "r #1---set_live_clip_track",
					"patching_rect" : [ 1648.0, 40.0, 128.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-81",
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
					"text" : "live.path",
					"patching_rect" : [ 1648.0, 160.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-6",
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
					"text" : "path live_set visible_tracks 0",
					"patching_rect" : [ 1648.0, 136.0, 148.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-80",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.path",
					"patching_rect" : [ 16.0, 160.0, 77.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-116",
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
					"text" : "r #1---clipslot_has_clip",
					"patching_rect" : [ 16.0, 184.0, 119.0, 18.0 ],
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
					"text" : "s #1---clipslot_has_clip",
					"patching_rect" : [ 2248.0, 256.0, 121.0, 18.0 ],
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
					"maxclass" : "newobj",
					"text" : "pack i i i",
					"patching_rect" : [ 2520.0, 608.0, 62.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-68",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack i i i",
					"patching_rect" : [ 2520.0, 560.0, 62.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-42",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "int", "int", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---clear_clips",
					"patching_rect" : [ 2536.0, 488.0, 79.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-37",
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
					"patching_rect" : [ 2536.0, 512.0, 34.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-35",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "#1",
					"patching_rect" : [ 2542.0, 584.0, 24.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-21",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ---led_from_clips",
					"patching_rect" : [ 2520.0, 632.0, 99.0, 18.0 ],
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
					"maxclass" : "comment",
					"text" : "ClipSlot has clip listener",
					"patching_rect" : [ 2232.0, 16.0, 128.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-30",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "get is_playing",
					"patching_rect" : [ 104.0, 376.0, 77.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-79",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "get is_recording",
					"patching_rect" : [ 184.0, 376.0, 88.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-83",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "get is_triggered",
					"patching_rect" : [ 16.0, 376.0, 86.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-88",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 136.0, 544.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-5",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "3",
					"patching_rect" : [ 136.0, 568.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-7",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2272.0, 376.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-41",
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
					"patching_rect" : [ 2232.0, 376.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-18",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 2232.0, 352.0, 59.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-10",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 2312.0, 376.0, 66.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-9",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "matrixctrl",
					"patching_rect" : [ 2520.0, 536.0, 200.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-57",
					"numoutlets" : 2,
					"outlettype" : [ "list", "list" ],
					"columns" : 16,
					"rows" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0 0 $1",
					"patching_rect" : [ 2232.0, 400.0, 38.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-20",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"hint" : "ClipSlot for live_clip to focus on",
					"annotation" : "ClipSlot for live_clip to focus on",
					"patching_rect" : [ 536.0, 16.0, 24.0, 24.0 ],
					"numinlets" : 0,
					"id" : "obj-129",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "ClipSlot for live_clip to focus on"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"hint" : "Track for live_clip to focus on",
					"annotation" : "Track for live_clip to focus on",
					"patching_rect" : [ 352.0, 16.0, 24.0, 24.0 ],
					"numinlets" : 0,
					"id" : "obj-127",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"comment" : "Track for live_clip to focus on"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---set_live_clip_clipslot",
					"patching_rect" : [ 536.0, 120.0, 140.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-142",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---set_live_clip_track",
					"patching_rect" : [ 352.0, 120.0, 129.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-140",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ClipSlot for live_clip to focus on",
					"patching_rect" : [ 168.0, 16.0, 168.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-131",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Track for live_clip to focus on",
					"patching_rect" : [ 16.0, 16.0, 152.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-78",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Fire",
					"patching_rect" : [ 712.0, 256.0, 32.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-60",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Move Playing Position",
					"patching_rect" : [ 376.0, 256.0, 120.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-23",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 2360.0, 352.0, 34.5, 18.0 ],
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
					"maxclass" : "message",
					"text" : "22",
					"patching_rect" : [ 2464.0, 88.0, 32.5, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-153",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 2232.0, 64.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-154",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 2232.0, 88.0, 32.5, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-155",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b i",
					"patching_rect" : [ 2456.0, 64.0, 41.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-156",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---set_live_clip_clipslot",
					"patching_rect" : [ 2368.0, 40.0, 138.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-161",
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
					"text" : "r #1---set_live_clip_track",
					"patching_rect" : [ 2232.0, 40.0, 128.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-162",
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
					"text" : "22",
					"patching_rect" : [ 272.0, 88.0, 32.5, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-152",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"patching_rect" : [ 16.0, 64.0, 32.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-151",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 16.0, 88.0, 32.5, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-149",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b i",
					"patching_rect" : [ 264.0, 64.0, 41.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-146",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "FIrst LED\nOff if clip stopped and has no clip\nFlashing with tempo quant if triggered\nOn if playing and has clip",
					"linecount" : 4,
					"patching_rect" : [ 2288.0, 448.0, 196.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-75",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l",
					"patching_rect" : [ 2232.0, 184.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-124",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property has_clip",
					"patching_rect" : [ 2232.0, 208.0, 94.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-106",
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
					"patching_rect" : [ 2232.0, 232.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-107",
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
					"text" : "sprintf path live_set visible_tracks %i clip_slots %i",
					"patching_rect" : [ 2232.0, 112.0, 251.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-84",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.path",
					"patching_rect" : [ 2232.0, 160.0, 67.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-89",
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
					"text" : "path live_set visible_tracks 0 clip_slots 22",
					"patching_rect" : [ 2232.0, 136.0, 216.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-95",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_is_triggered",
					"patching_rect" : [ 2248.0, 280.0, 118.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-54",
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
					"text" : "r #1---set_live_clip_clipslot",
					"patching_rect" : [ 168.0, 40.0, 138.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-15",
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
					"text" : "r #1---set_live_clip_track",
					"patching_rect" : [ 16.0, 40.0, 128.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-14",
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
					"text" : "s #1---clip_move_play_pos",
					"patching_rect" : [ 2736.0, 232.0, 138.0, 18.0 ],
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
					"text" : "+ 1",
					"patching_rect" : [ 2736.0, 136.0, 26.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-138",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate 2",
					"patching_rect" : [ 2736.0, 160.0, 51.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-135",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clip_fire",
					"patching_rect" : [ 2768.0, 208.0, 78.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-136",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_is_stopped",
					"patching_rect" : [ 2736.0, 40.0, 114.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-137",
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
					"text" : "Clip Call Functions",
					"patching_rect" : [ 376.0, 232.0, 104.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-133",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Clip Playing Status Observer",
					"patching_rect" : [ 32.0, 232.0, 152.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-132",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"patching_rect" : [ 712.0, 352.0, 34.5, 18.0 ],
					"numinlets" : 2,
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
					"text" : "r #1---clip_fire",
					"patching_rect" : [ 728.0, 328.0, 77.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-52",
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
					"text" : "r #1---clip_is_stopped",
					"patching_rect" : [ 712.0, 304.0, 114.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-50",
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
					"text" : "call fire",
					"patching_rect" : [ 712.0, 280.0, 46.0, 16.0 ],
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
					"maxclass" : "newobj",
					"text" : "t l",
					"patching_rect" : [ 352.0, 256.0, 19.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-122",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_play_pos",
					"patching_rect" : [ 440.0, 520.0, 104.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-87",
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
					"patching_rect" : [ 384.0, 472.0, 16.0, 16.0 ],
					"numinlets" : 1,
					"id" : "obj-108",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p quant_round",
					"patching_rect" : [ 352.0, 616.0, 80.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-109",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"color" : [ 0.082353, 0.431373, 0.411765, 1.0 ],
					"outlettype" : [ "float" ],
					"fontsize" : 10.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 583.0, 238.0, 490.0, 229.0 ],
						"bglocked" : 0,
						"defrect" : [ 583.0, 238.0, 490.0, 229.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 8.0, 8.0 ],
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
									"text" : "This patcher rounds the incoming shift distance up or down to the appropriate interval based on the current quantization setting.  \n\nThis in effect transforms an exact timing difference (clip time corresponding to the pressed button minus exact playback position at the time of the button press) into a timing difference that will yield the correct clip jump when the quanitization pulse fires.",
									"linecount" : 10,
									"patching_rect" : [ 208.0, 16.0, 270.0, 144.0 ],
									"numinlets" : 1,
									"id" : "obj-4",
									"fontname" : "Arial",
									"numoutlets" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 1.",
									"patching_rect" : [ 16.0, 144.0, 32.5, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-8",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 16.0, 192.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"id" : "obj-3",
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 152.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-2",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"comment" : "Quantization Interval (Beats)"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 16.0, 16.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"id" : "obj-1",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"comment" : "Playback Shift Amount"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "if $f1 < 0. then -1. else 0.",
									"patching_rect" : [ 16.0, 120.0, 125.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-126",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "+ 0.",
									"patching_rect" : [ 16.0, 168.0, 32.5, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-120",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "* 0.25",
									"patching_rect" : [ 152.0, 120.0, 37.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-114",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"patching_rect" : [ 16.0, 96.0, 50.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-113",
									"fontname" : "Arial Bold",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"patching_rect" : [ 152.0, 96.0, 50.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-111",
									"fontname" : "Arial Bold",
									"numoutlets" : 2,
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"patching_rect" : [ 16.0, 48.0, 50.0, 18.0 ],
									"numinlets" : 1,
									"id" : "obj-91",
									"fontname" : "Arial Bold",
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "/ 0.25",
									"patching_rect" : [ 152.0, 72.0, 36.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-89",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"fontsize" : 10.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "% 0.25",
									"patching_rect" : [ 16.0, 72.0, 42.0, 18.0 ],
									"numinlets" : 2,
									"id" : "obj-83",
									"fontname" : "Arial Bold",
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"fontsize" : 10.0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-91", 0 ],
									"destination" : [ "obj-89", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-91", 0 ],
									"destination" : [ "obj-83", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-91", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-114", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-89", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-83", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-120", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-114", 0 ],
									"destination" : [ "obj-120", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-111", 0 ],
									"destination" : [ "obj-114", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-83", 0 ],
									"destination" : [ "obj-113", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-89", 0 ],
									"destination" : [ "obj-111", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-113", 0 ],
									"destination" : [ "obj-126", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-126", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-120", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"default_fontface" : 0,
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontname" : "Arial",
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---quant_value",
					"patching_rect" : [ 392.0, 592.0, 86.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-111",
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
					"text" : "Quantized shift amount",
					"patching_rect" : [ 408.0, 640.0, 128.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-112",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set",
					"patching_rect" : [ 368.0, 496.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-114",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"patching_rect" : [ 352.0, 640.0, 50.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-115",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"patching_rect" : [ 352.0, 472.0, 32.0, 15.0 ],
					"numinlets" : 2,
					"id" : "obj-117",
					"fontname" : "Arial",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1.",
					"patching_rect" : [ 352.0, 592.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-120",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "call move_playing_pos $1",
					"patching_rect" : [ 352.0, 280.0, 134.0, 16.0 ],
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
					"maxclass" : "newobj",
					"text" : "live.object",
					"patching_rect" : [ 352.0, 304.0, 60.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-85",
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
					"text" : "sprintf path live_set visible_tracks %i clip_slots %i clip",
					"patching_rect" : [ 16.0, 112.0, 275.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-22",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "0 = Stopped\n1 = Triggered\n2 = Playing\n3 = Recording",
					"linecount" : 4,
					"patching_rect" : [ 176.0, 544.0, 80.0, 52.0 ],
					"numinlets" : 1,
					"id" : "obj-104",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 96.0, 544.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-103",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 56.0, 544.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-102",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"patching_rect" : [ 16.0, 544.0, 33.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-101",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clip_playing_status",
					"patching_rect" : [ 16.0, 592.0, 133.0, 18.0 ],
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
					"text" : "2",
					"patching_rect" : [ 96.0, 568.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-69",
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
					"patching_rect" : [ 56.0, 568.0, 32.5, 16.0 ],
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
					"maxclass" : "message",
					"text" : "0",
					"patching_rect" : [ 16.0, 568.0, 32.5, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-64",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 16.0, 328.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"id" : "obj-51",
					"numoutlets" : 1,
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property playing_status",
					"patching_rect" : [ 16.0, 280.0, 124.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-43",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b l l",
					"patching_rect" : [ 16.0, 256.0, 101.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-45",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 16.0, 304.0, 101.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-49",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"color" : [ 0.984314, 0.819608, 0.05098, 1.0 ],
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"patching_rect" : [ 856.0, 328.0, 66.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-33",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"patching_rect" : [ 1000.0, 352.0, 40.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-26",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Clip Play Pos",
					"patching_rect" : [ 856.0, 232.0, 72.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-32",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "bucket",
					"patching_rect" : [ 2568.0, 280.0, 43.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-98",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 0 0",
					"patching_rect" : [ 2568.0, 304.0, 38.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-94",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 0 1",
					"patching_rect" : [ 2520.0, 304.0, 38.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-96",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route #1",
					"patching_rect" : [ 2768.0, 136.0, 49.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-47",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route 1",
					"patching_rect" : [ 2768.0, 112.0, 44.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-46",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl rev",
					"patching_rect" : [ 2768.0, 88.0, 36.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-44",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ---monomesize_width",
					"patching_rect" : [ 2536.0, 64.0, 119.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-99",
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
					"text" : "s #1---clip_is_playing",
					"patching_rect" : [ 112.0, 472.0, 112.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-13",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clip_is_triggered",
					"patching_rect" : [ 16.0, 448.0, 120.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-12",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clip_is_recording",
					"patching_rect" : [ 208.0, 448.0, 123.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-4",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s #1---clip_is_stopped",
					"patching_rect" : [ 32.0, 520.0, 116.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-31",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if ($i1 + $i2 + $i3) == 0 then 1 else 0",
					"patching_rect" : [ 16.0, 496.0, 211.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-34",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route is_playing",
					"patching_rect" : [ 112.0, 424.0, 95.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-61",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route is_triggered",
					"patching_rect" : [ 16.0, 424.0, 96.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-63",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route is_recording",
					"patching_rect" : [ 208.0, 424.0, 98.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-65",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b b b",
					"patching_rect" : [ 16.0, 352.0, 46.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-91",
					"fontname" : "Arial Bold",
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "bang" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.object",
					"patching_rect" : [ 16.0, 400.0, 60.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-92",
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
					"text" : "r ---press_to_clips",
					"patching_rect" : [ 2768.0, 64.0, 97.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-90",
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
					"text" : "Outgoing LED",
					"patching_rect" : [ 2520.0, 16.0, 76.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-59",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "expr int($f1 * ($f2 / $f3))",
					"patching_rect" : [ 2520.0, 112.0, 121.0, 18.0 ],
					"numinlets" : 3,
					"id" : "obj-56",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---loop_length",
					"patching_rect" : [ 2584.0, 88.0, 95.0, 18.0 ],
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
					"text" : "s #1---clip_length",
					"patching_rect" : [ 984.0, 376.0, 93.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-36",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i",
					"patching_rect" : [ 2520.0, 256.0, 18.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-29",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r #1---clip_play_pos",
					"patching_rect" : [ 2520.0, 40.0, 104.0, 18.0 ],
					"numinlets" : 0,
					"id" : "obj-24",
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
					"text" : "s #1---clip_play_pos",
					"patching_rect" : [ 840.0, 352.0, 106.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-19",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"color" : [ 0.403922, 0.109804, 0.701961, 1.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Incoming Press msgs to clips",
					"patching_rect" : [ 2736.0, 16.0, 160.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-40",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Clip length",
					"patching_rect" : [ 1000.0, 232.0, 65.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-86",
					"fontname" : "Arial Bold",
					"numoutlets" : 0,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route length",
					"patching_rect" : [ 984.0, 328.0, 68.0, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-71",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "get length",
					"patching_rect" : [ 984.0, 280.0, 58.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-16",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "property playing_position",
					"patching_rect" : [ 840.0, 280.0, 133.0, 16.0 ],
					"numinlets" : 2,
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
					"text" : "t b l",
					"patching_rect" : [ 840.0, 256.0, 71.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-2",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.observer",
					"patching_rect" : [ 840.0, 304.0, 72.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-1",
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
					"text" : "t b l",
					"patching_rect" : [ 984.0, 256.0, 59.5, 18.0 ],
					"numinlets" : 1,
					"id" : "obj-67",
					"fontname" : "Arial Bold",
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "live.object",
					"patching_rect" : [ 984.0, 304.0, 60.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-70",
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
					"text" : "gate 1 1",
					"patching_rect" : [ 16.0, 208.0, 48.0, 18.0 ],
					"numinlets" : 2,
					"id" : "obj-73",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "path live_set visible_tracks 0 clip_slots 22 clip",
					"patching_rect" : [ 16.0, 136.0, 272.0, 16.0 ],
					"numinlets" : 2,
					"id" : "obj-74",
					"fontname" : "Arial Bold",
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"fontsize" : 10.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-190", 1 ],
					"destination" : [ "obj-282", 1 ],
					"hidden" : 0,
					"midpoints" : [ 591.0, 68.0, 698.5, 68.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-190", 0 ],
					"destination" : [ "obj-282", 0 ],
					"hidden" : 0,
					"midpoints" : [ 577.5, 68.0, 545.5, 68.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-245", 0 ],
					"destination" : [ "obj-190", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 1 ],
					"destination" : [ "obj-247", 1 ],
					"hidden" : 0,
					"midpoints" : [ 407.0, 68.0, 514.5, 68.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 0 ],
					"destination" : [ "obj-247", 0 ],
					"hidden" : 0,
					"midpoints" : [ 393.5, 68.0, 361.5, 68.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-128", 0 ],
					"destination" : [ "obj-189", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-311", 0 ],
					"destination" : [ "obj-228", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-237", 0 ],
					"destination" : [ "obj-311", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-260", 0 ],
					"destination" : [ "obj-228", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3009.5, 396.0, 3129.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-346", 0 ],
					"destination" : [ "obj-260", 1 ],
					"hidden" : 0,
					"midpoints" : [ 3009.5, 372.0, 3040.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-299", 0 ],
					"destination" : [ "obj-280", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3009.5, 324.0, 3041.5, 324.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-280", 0 ],
					"destination" : [ "obj-346", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-300", 0 ],
					"destination" : [ "obj-280", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3041.5, 324.0, 3041.5, 324.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-333", 1 ],
					"destination" : [ "obj-314", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2998.5, 156.0, 3009.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-340", 0 ],
					"destination" : [ "obj-344", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-374", 0 ],
					"destination" : [ "obj-340", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-308", 0 ],
					"destination" : [ "obj-333", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2921.5, 132.0, 2969.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-227", 0 ],
					"destination" : [ "obj-118", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3145.5, 180.0, 3129.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2257.5, 300.0, 2369.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-309", 0 ],
					"destination" : [ "obj-175", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2641.5, 229.0, 2601.0, 229.0, 2601.0, 204.0, 2577.5, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-306", 0 ],
					"destination" : [ "obj-309", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-163", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1833.5, 372.0, 1807.0, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-170", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-173", 0 ],
					"destination" : [ "obj-172", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-232", 0 ],
					"destination" : [ "obj-175", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2601.5, 204.0, 2577.5, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-100", 0 ],
					"destination" : [ "obj-232", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-314", 0 ],
					"destination" : [ "obj-297", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-314", 1 ],
					"destination" : [ "obj-315", 1 ],
					"hidden" : 0,
					"midpoints" : [ 3023.0, 276.0, 3116.0, 276.0, 3116.0, 300.0, 3158.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-285", 0 ],
					"destination" : [ "obj-286", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-284", 0 ],
					"destination" : [ "obj-286", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3153.5, 132.0, 3129.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-118", 0 ],
					"destination" : [ "obj-229", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-56", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2545.5, 84.0, 2580.5, 84.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-56", 2 ],
					"hidden" : 0,
					"midpoints" : [ 2593.5, 109.0, 2631.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-89", 1 ],
					"destination" : [ "obj-124", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2265.5, 181.0, 2241.5, 181.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2281.5, 396.0, 2241.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2321.5, 396.0, 2241.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-213", 0 ],
					"destination" : [ "obj-178", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2553.5, 460.0, 2529.5, 460.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2545.5, 532.0, 2529.5, 532.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-93", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2657.5, 156.0, 2577.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-95", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 133.0, 2438.5, 133.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-156", 0 ],
					"destination" : [ "obj-155", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2465.5, 84.0, 2241.5, 84.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-161", 0 ],
					"destination" : [ "obj-156", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2377.5, 60.0, 2465.5, 60.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 252.0, 2257.5, 252.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2777.5, 156.0, 2801.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-237", 0 ],
					"destination" : [ "obj-236", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3129.5, 372.0, 3161.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-297", 1 ],
					"destination" : [ "obj-300", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3023.0, 301.0, 3041.5, 301.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-297", 0 ],
					"destination" : [ "obj-299", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-294", 0 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1793.5, 516.0, 1780.0, 516.0, 1780.0, 276.0, 1793.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-293", 0 ],
					"destination" : [ "obj-294", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1817.5, 492.0, 1793.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-292", 0 ],
					"destination" : [ "obj-294", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-145", 0 ],
					"destination" : [ "obj-125", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-270", 0 ],
					"destination" : [ "obj-259", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3081.5, 84.0, 3065.5, 84.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-259", 0 ],
					"destination" : [ "obj-276", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-259", 1 ],
					"destination" : [ "obj-278", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3097.5, 109.0, 3089.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-259", 0 ],
					"destination" : [ "obj-285", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3065.5, 109.0, 3129.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-259", 1 ],
					"destination" : [ "obj-284", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3097.5, 109.0, 3153.5, 109.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-268", 0 ],
					"destination" : [ "obj-271", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-267", 0 ],
					"destination" : [ "obj-268", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-269", 0 ],
					"destination" : [ "obj-268", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-262", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 1545.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-265", 0 ],
					"destination" : [ "obj-261", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1545.5, 349.0, 1532.0, 349.0, 1532.0, 276.0, 1545.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-262", 0 ],
					"destination" : [ "obj-263", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-261", 0 ],
					"destination" : [ "obj-263", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-252", 0 ],
					"destination" : [ "obj-255", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-252", 0 ],
					"destination" : [ "obj-258", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-250", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 1097.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-250", 1 ],
					"destination" : [ "obj-252", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-249", 0 ],
					"destination" : [ "obj-252", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-250", 0 ],
					"destination" : [ "obj-249", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-184", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-188", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-188", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-98", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2529.5, 276.0, 2577.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-174", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-174", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-223", 0 ],
					"destination" : [ "obj-11", 2 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 460.0, 344.0, 460.0, 344.0, 564.0, 400.5, 564.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-120", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 1 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-144", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-144", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-183", 0 ],
					"destination" : [ "obj-211", 5 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-205", 0 ],
					"destination" : [ "obj-183", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-170", 0 ],
					"destination" : [ "obj-82", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [ 721.5, 300.0, 361.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-230", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2129.5, 373.0, 2116.0, 373.0, 2116.0, 275.0, 2129.5, 275.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-230", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-240", 0 ],
					"destination" : [ "obj-211", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-239", 0 ],
					"destination" : [ "obj-240", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-216", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2625.5, 508.0, 2545.5, 508.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-202", 0 ],
					"destination" : [ "obj-178", 0 ],
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
					"source" : [ "obj-178", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-177", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-177", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-176", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-168", 0 ],
					"destination" : [ "obj-159", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-165", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-165", 1 ],
					"destination" : [ "obj-168", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-165", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-159", 0 ],
					"destination" : [ "obj-80", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-85", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-34", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-34", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-124", 0 ],
					"destination" : [ "obj-106", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-124", 1 ],
					"destination" : [ "obj-107", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 1 ],
					"destination" : [ "obj-1", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-102", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-102", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-101", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 1 ],
					"destination" : [ "obj-92", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 2 ],
					"destination" : [ "obj-49", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 1 ],
					"destination" : [ "obj-70", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-109", 0 ],
					"destination" : [ "obj-115", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 0,
					"midpoints" : [ 377.5, 516.0, 349.0, 516.0, 349.0, 468.0, 361.5, 468.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-121", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-72", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [ 721.5, 373.0, 708.0, 373.0, 708.0, 277.0, 721.5, 277.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-137", 0 ],
					"destination" : [ "obj-138", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-138", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-135", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-151", 1 ],
					"destination" : [ "obj-149", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-151", 0 ],
					"destination" : [ "obj-149", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-149", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-146", 2 ],
					"destination" : [ "obj-152", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-152", 0 ],
					"destination" : [ "obj-22", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-156", 1 ],
					"destination" : [ "obj-153", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-156", 2 ],
					"destination" : [ "obj-153", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-154", 0 ],
					"destination" : [ "obj-155", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-154", 1 ],
					"destination" : [ "obj-155", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-155", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-153", 0 ],
					"destination" : [ "obj-84", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-151", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-162", 0 ],
					"destination" : [ "obj-154", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 2 ],
					"destination" : [ "obj-68", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-68", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 1 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-9", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-116", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-80", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-141", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-141", 1 ],
					"destination" : [ "obj-113", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-113", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-158", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-160", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-163", 0 ],
					"destination" : [ "obj-164", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-148", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-141", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1681.5, 228.0, 1657.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-130", 0 ],
					"destination" : [ "obj-157", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-164", 0 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1793.5, 420.0, 1780.0, 420.0, 1780.0, 276.0, 1793.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-147", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1681.5, 228.0, 1793.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-166", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1681.5, 228.0, 2129.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-166", 0 ],
					"destination" : [ "obj-157", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-147", 0 ],
					"destination" : [ "obj-148", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 1 ],
					"destination" : [ "obj-58", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 1 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1681.5, 228.0, 1961.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-193", 0 ],
					"destination" : [ "obj-195", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-194", 0 ],
					"destination" : [ "obj-193", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 0 ],
					"destination" : [ "obj-182", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 0 ],
					"destination" : [ "obj-186", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-194", 1 ],
					"destination" : [ "obj-195", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-180", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 1 ],
					"destination" : [ "obj-181", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1327.0, 356.0, 1215.0, 356.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 0 ],
					"destination" : [ "obj-181", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1313.5, 348.0, 1201.5, 348.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-181", 0 ],
					"destination" : [ "obj-192", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-195", 0 ],
					"destination" : [ "obj-181", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-181", 0 ],
					"destination" : [ "obj-196", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 1 ],
					"destination" : [ "obj-186", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-209", 0 ],
					"destination" : [ "obj-211", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-207", 0 ],
					"destination" : [ "obj-211", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-220", 0 ],
					"destination" : [ "obj-221", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-220", 1 ],
					"destination" : [ "obj-221", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-222", 0 ],
					"destination" : [ "obj-220", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-221", 0 ],
					"destination" : [ "obj-223", 1 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 420.0, 372.0, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-225", 0 ],
					"destination" : [ "obj-108", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-218", 0 ],
					"destination" : [ "obj-221", 0 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 348.0, 348.0, 348.0, 348.0, 396.0, 361.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-208", 0 ],
					"destination" : [ "obj-211", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-203", 0 ],
					"destination" : [ "obj-200", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-224", 0 ],
					"destination" : [ "obj-225", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-206", 0 ],
					"destination" : [ "obj-211", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 0 ],
					"destination" : [ "obj-201", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-199", 1 ],
					"destination" : [ "obj-215", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-215", 1 ],
					"destination" : [ "obj-213", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2585.0, 436.0, 2553.5, 436.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-215", 0 ],
					"destination" : [ "obj-219", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2569.5, 428.0, 2601.5, 428.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-201", 1 ],
					"destination" : [ "obj-202", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2543.0, 436.0, 2529.5, 436.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-201", 0 ],
					"destination" : [ "obj-217", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2529.5, 420.0, 2585.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-231", 0 ],
					"destination" : [ "obj-237", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3153.5, 349.0, 3129.5, 349.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 0 ],
					"destination" : [ "obj-234", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-229", 1 ],
					"destination" : [ "obj-235", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-236", 0 ],
					"destination" : [ "obj-237", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3161.5, 396.0, 3116.0, 396.0, 3116.0, 348.0, 3129.5, 348.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 0 ],
					"destination" : [ "obj-178", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2529.5, 348.0, 2516.0, 348.0, 2516.0, 460.0, 2558.5, 460.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-223", 0 ],
					"destination" : [ "obj-117", 1 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 460.0, 374.5, 460.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-225", 0 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 0,
					"midpoints" : [ 393.5, 468.0, 361.5, 468.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-226", 0 ],
					"destination" : [ "obj-93", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-144", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 348.0, 2321.5, 348.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-185", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 1313.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-194", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 1201.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-116", 1 ],
					"destination" : [ "obj-73", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 361.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 993.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 849.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-177", 0 ],
					"destination" : [ "obj-175", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2529.5, 204.0, 2590.5, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-211", 0 ],
					"destination" : [ "obj-210", 2 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 564.0, 649.5, 564.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-184", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 228.0, 1425.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-244", 0 ],
					"destination" : [ "obj-253", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-253", 0 ],
					"destination" : [ "obj-256", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 0 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2577.5, 324.0, 2529.5, 324.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-276", 0 ],
					"destination" : [ "obj-281", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-278", 0 ],
					"destination" : [ "obj-281", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3089.5, 131.0, 3065.5, 131.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-180", 1 ],
					"destination" : [ "obj-287", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1327.0, 356.0, 1407.0, 356.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-243", 0 ],
					"destination" : [ "obj-288", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-288", 1 ],
					"destination" : [ "obj-274", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-274", 0 ],
					"destination" : [ "obj-290", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-273", 0 ],
					"destination" : [ "obj-291", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-291", 0 ],
					"destination" : [ "obj-274", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-248", 0 ],
					"destination" : [ "obj-259", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-281", 0 ],
					"destination" : [ "obj-260", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3065.5, 372.0, 3009.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-293", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1841.5, 469.0, 1817.5, 469.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-286", 0 ],
					"destination" : [ "obj-118", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-286", 1 ],
					"destination" : [ "obj-283", 0 ],
					"hidden" : 0,
					"midpoints" : [ 3143.0, 156.0, 3116.0, 156.0, 3116.0, 251.0, 3129.5, 251.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-238", 0 ],
					"destination" : [ "obj-237", 1 ],
					"hidden" : 0,
					"midpoints" : [ 3129.5, 346.0, 3143.0, 346.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-315", 0 ],
					"destination" : [ "obj-238", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-283", 0 ],
					"destination" : [ "obj-315", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-235", 0 ],
					"destination" : [ "obj-283", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-234", 0 ],
					"destination" : [ "obj-283", 1 ],
					"hidden" : 0,
					"midpoints" : [ 3129.5, 251.0, 3161.5, 251.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-296", 0 ],
					"destination" : [ "obj-295", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-295", 0 ],
					"destination" : [ "obj-308", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-175", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-175", 0 ],
					"destination" : [ "obj-318", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2577.5, 229.0, 2559.0, 229.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-318", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2545.5, 252.0, 2529.5, 252.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-318", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 252.0, 2516.0, 252.0, 2516.0, 228.0, 2545.5, 228.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-146", 0 ],
					"hidden" : 0,
					"midpoints" : [ 177.5, 60.0, 273.5, 60.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-74", 1 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 133.0, 278.5, 133.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 420.0, 217.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 420.0, 121.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 193.5, 396.0, 25.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 113.5, 396.0, 25.5, 396.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 2 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [ 52.5, 372.0, 193.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 1 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.0, 372.0, 113.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-111", 0 ],
					"destination" : [ "obj-109", 1 ],
					"hidden" : 0,
					"midpoints" : [ 401.5, 612.0, 422.5, 612.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 492.0, 377.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 65.5, 588.0, 25.5, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 105.5, 588.0, 25.5, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 145.5, 588.0, 25.5, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-159", 0 ],
					"destination" : [ "obj-80", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1657.5, 132.0, 1786.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-277", 0 ],
					"destination" : [ "obj-279", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-279", 0 ],
					"destination" : [ "obj-292", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-279", 1 ],
					"destination" : [ "obj-293", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-246", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 25.5, 516.0, 41.5, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-146", 1 ],
					"destination" : [ "obj-152", 0 ],
					"hidden" : 0,
					"midpoints" : [ 284.5, 84.0, 281.5, 84.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 0 ],
					"destination" : [ "obj-139", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 1 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 1 ],
					"destination" : [ "obj-251", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2777.5, 180.0, 2793.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-125", 0 ],
					"destination" : [ "obj-163", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 0 ],
					"destination" : [ "obj-11", 1 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 516.0, 381.0, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-120", 0 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-200", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-210", 0 ],
					"destination" : [ "obj-223", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 644.0, 556.0, 644.0, 556.0, 420.0, 361.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-200", 0 ],
					"destination" : [ "obj-120", 1 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 588.0, 375.0, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-115", 0 ],
					"destination" : [ "obj-121", 0 ],
					"hidden" : 0,
					"midpoints" : [ 361.5, 660.0, 340.0, 660.0, 340.0, 276.0, 361.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-127", 0 ],
					"destination" : [ "obj-247", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-247", 0 ],
					"destination" : [ "obj-140", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-247", 1 ],
					"destination" : [ "obj-298", 0 ],
					"hidden" : 0,
					"midpoints" : [ 514.5, 140.0, 361.5, 140.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-129", 0 ],
					"destination" : [ "obj-282", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-282", 0 ],
					"destination" : [ "obj-142", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-282", 1 ],
					"destination" : [ "obj-298", 0 ],
					"hidden" : 0,
					"midpoints" : [ 698.5, 140.0, 361.5, 140.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-204", 0 ],
					"destination" : [ "obj-310", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-325", 0 ],
					"destination" : [ "obj-327", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-326", 0 ],
					"destination" : [ "obj-327", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2265.5, 492.0, 2241.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-310", 0 ],
					"destination" : [ "obj-325", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-310", 1 ],
					"destination" : [ "obj-326", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-327", 0 ],
					"destination" : [ "obj-304", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-304", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 419.0, 2228.0, 419.0, 2228.0, 516.0, 2255.0, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-304", 0 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2241.5, 540.0, 2512.0, 540.0, 2512.0, 324.0, 2529.5, 324.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-247", 1 ],
					"destination" : [ "obj-329", 0 ],
					"hidden" : 0,
					"midpoints" : [ 514.5, 92.0, 377.5, 92.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-329", 0 ],
					"destination" : [ "obj-140", 0 ],
					"hidden" : 0,
					"midpoints" : [ 377.5, 116.0, 361.5, 116.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-282", 1 ],
					"destination" : [ "obj-331", 0 ],
					"hidden" : 0,
					"midpoints" : [ 698.5, 92.0, 561.5, 92.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-331", 0 ],
					"destination" : [ "obj-142", 0 ],
					"hidden" : 0,
					"midpoints" : [ 561.5, 116.0, 545.5, 116.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-146", 0 ],
					"destination" : [ "obj-149", 0 ],
					"hidden" : 0,
					"midpoints" : [ 273.5, 84.0, 25.5, 84.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-371", 0 ],
					"destination" : [ "obj-296", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-340", 1 ],
					"destination" : [ "obj-341", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-308", 0 ],
					"destination" : [ "obj-372", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2921.5, 132.0, 2921.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-335", 0 ],
					"destination" : [ "obj-374", 1 ],
					"hidden" : 0,
					"midpoints" : [ 2969.5, 180.0, 3046.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-372", 1 ],
					"destination" : [ "obj-374", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2948.5, 156.0, 2921.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-333", 1 ],
					"destination" : [ "obj-335", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2998.5, 156.0, 2969.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-344", 0 ],
					"destination" : [ "obj-257", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-345", 0 ],
					"destination" : [ "obj-257", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2945.5, 276.0, 2921.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-257", 0 ],
					"destination" : [ "obj-346", 0 ],
					"hidden" : 0,
					"midpoints" : [ 2921.5, 348.0, 3009.5, 348.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-341", 0 ],
					"destination" : [ "obj-345", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-211", 1 ],
					"destination" : [ "obj-210", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 564.0, 569.5, 564.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-266", 0 ],
					"destination" : [ "obj-239", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-212", 0 ],
					"destination" : [ "obj-402", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-402", 0 ],
					"destination" : [ "obj-210", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
