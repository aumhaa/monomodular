{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 25.0, 69.0, 539.0, 549.0 ],
		"bglocked" : 0,
		"defrect" : [ 25.0, 69.0, 539.0, 549.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 11.0,
					"frgb" : [ 0.741176, 0.741176, 0.741176, 1.0 ],
					"id" : "obj-32",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 133.0, 38.5, 156.0, 32.0 ],
					"text" : "send jzml & jzlib to the Lemur + configure IP & port",
					"textcolor" : [ 0.741176, 0.741176, 0.741176, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-20",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 229.0, 288.5, 150.0, 64.0 ],
					"text" : "set OSC target on Lemur\n\nwhen <ip> is omitted, LemurLoader chooses the best matching local IP"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 228.0, 372.5, 69.0, 16.0 ],
					"text" : "target 0 7999"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 228.0, 350.5, 114.0, 16.0 ],
					"text" : "target 0 10.0.0.75 7999"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 239.0, 238.5, 209.0, 18.0 ],
					"text" : "load JZLIB module into specified destination"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-12",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 43.0, 234.5, 189.0, 27.0 ],
					"text" : "import /Users/axel/Desktop/silly.jzlib InterfaceA/Container12/SubContainerC"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 218.0, 174.5, 170.0, 18.0 ],
					"text" : "load JZLIB module in current project"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 46.0, 175.5, 164.0, 16.0 ],
					"text" : "import /Users/axel/Desktop/Int.jzlib"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-21",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 345.0, 443.5, 150.0, 41.0 ],
					"text" : "when host is set to \"auto\", JZML is sent to the first Lemur found on the network"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 343.0, 492.5, 87.0, 16.0 ],
					"text" : "load Aerobic.jzml"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "bang" ],
					"patching_rect" : [ 343.0, 515.5, 124.0, 18.0 ],
					"text" : "LemurLoader @host auto"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-17",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 317.0, 108.5, 189.0, 41.0 ],
					"text" : "Attributes : \n@host - Lemur's IP or \"auto\"\n@port - Lemur's port (default is 8002)"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-15",
					"linecount" : 7,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 457.5, 125.0, 87.0 ],
					"text" : "list of Lemurs on network\n\nformat is as follows : \nscan start\nscan <ip> <port>\n...\nscan done"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-13",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 44.0, 295.5, 150.0, 29.0 ],
					"text" : "request list of Lemurs on the network"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-11",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 177.0, 457.5, 129.0, 18.0 ],
					"text" : "bang when JZML is sent"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 35.0, 97.5, 261.0, 18.0 ],
					"text" : "load JZML project from absolute path, or Max file paths"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-6",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 42.0, 327.5, 32.5, 16.0 ],
					"text" : "scan"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 21.0, 436.5, 30.0, 18.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 177.0, 435.5, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-5",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 207.0, 120.5, 87.0, 16.0 ],
					"text" : "load Aerobic.jzml"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-3",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 21.0, 120.5, 177.0, 16.0 ],
					"text" : "load /Users/axel/Desktop/Aliases.jzml"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 10.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "bang" ],
					"patching_rect" : [ 21.0, 408.5, 175.0, 18.0 ],
					"text" : "LemurLoader @host 10.0.0.9"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 3,
					"fontname" : "Arial",
					"fontsize" : 20.871338,
					"frgb" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 133.0, 13.0, 144.0, 30.0 ],
					"text" : "LemurLoader",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"varname" : "autohelp_top_title"
				}

			}
, 			{
				"box" : 				{
					"data" : [ 6554, "", "IBkSG0fBZn....PCIgDQRA..BXA...vQHX....vVJ3.p....DLmPIQEBHf.B7g.YHB..YDURDEDU3wY6cuFaaUe9G.+6uy43awNNNIjzbsg.4RSBc.+aRuDZknAXkotwJfZg18lMsMI1zpz+gVJUaiogpXuZScntIQ0TGaZhtWrWPGHzjZEkIVgRafweAsoIgBTRhcZZZt3De+3y42+W3ZSRpShS74hcxyGozjZe742w9jX+b9c44gw4JbNW.w4.BLf2+hW.W9R8BH...Hq.HIl3m4.fk3GS88j+b5t8YScV+78d+2O9etu6Cuxq7JfOusiyAXKzNYQHrD2OG.c0UWnt5pa4uyy.y90lk59ekW4UVQ6+zISeoZE7RpgZ9O+VtGuKzqOoyJ40B890O9h7KPLj8u9n2VNu9mN4ZOelO9sdBtRduobAK06Opt.uu6ruozcNNO8kiaSxmarE3+mqPUUEBBBK4sYjps1ZQGczAJpnhRcaLNWgCHf24bmC+z+2eJ9xq8E55AwS8TOE9i+w+H9O+m+Cd7G+w001Z9dsW60vN1wNLz1b9lZpoPCMzfodLPHDBgnUJnfBvK7Bu.9deuuG.tUfr+qSeZ7D6YO5dPEs1Zq3EewWD.I9.VilYGTA.vm7IehYeHPHDBgnYBEJD5t6twu9W+qA.fTjHgQ2O6yBlN2Getc6F+s+1eCd73A..81au5daNa0VasFVasXtzktjg97lPHDBwH7xu7Ki8rm8.g24ceeL5nip6M3QNxQly7avnux8pqtZCs8VHSO8zl8g.gPHDhlSQQAm7jmDRCdsqo6WA8t10tvANvAlysMzPCYnW49F23FMr1Zw7tu66R8XAgPHjUk750KDz6Ohysa23XG6X21sekqbEctkmqbkgBwqWul8g.gPHDhtPUUERLFSWuB5ibjijZdUjjQ2aE.4N8XwvCOL0iEDBgPV0RWW7qacqaE6e+6+1t8u7K+R8rYSK8J+UrbbtycNy9PfPHDBQWIA.c6Jn6t6tS6s+du26Y3W0dtvPg32uep2JHDBgrpEiwRDXgdXu6cuX6ae6o89FZngzqlMs15V2pg1dKjKe4Ka1GBDBgPPFdA0YaJkcEfaVMrFR2liEG5PGZAuOidNVL6TMpY5xW9xF5y6VasUzau8ZXsGgPH4xR94cy9qEB+V4wcNGPvfRt2bN.Gpfy4I9JOL.CFiAoju3ok16d26hNzCF8JB4dtm6wPauEhe+9Mz16QezGEs0Va3e7O9GFZ6RHDRtFFiAAAAHJJBqVsBKVr.QQwTAWHHH.U0DU0pTAUHCnJCv3..LvzwokXx.JhykgrRLHqJCUtBziOiVuoKCExO7G9CWv6apolxvSRTs1ZqFZ6sPtvEtfg1ds1Zq3oe5mlBrfPHD.HJJhBJn.3wiG31sa3vgCHIIAAAgTAXv4bDOdbvTYHd.NhGjCdL.QXALcrmKTAGwUigPwBhYhNIlQdZDIdHnxUy654BMenP1xV1xhtzNM5gC..X8qe8FZ6kNlwRr0iGOn1ZqE6ZW6Bm9zm1PaaBgPxkjrmJ73wCpqt5P0UWMJt3hgUqVAiwfnnHDDD.mygrrLB4OLBecEnbSAXU1ArxrAAln9bvw4PgqfvwChwCMJFNvWBd.NT3wgLhAUNG4Ky6BcYxa9TO0Ssn2+ktzkz5lbIkKjCKFbvAM717AdfG..IFZJJvBBgrVmEKVPQEUDpt5pwF1vFPokVJDESDrfMa1fCGNfff.jkkw3dmDyXKFfnM3TtXXkYChvBDzgKPjCNhqJioiNMFdlOGQUhA+QlDAjmFx2ZKxmnoK2zBKrP7zO8SunayLyLigdk60TSMFVasXL5dpY1Ou28t2Mps1ZwvCOrg09DBgjqHYORHIIA61sCOd7fRKsT3wiGDMZTHKKCKVrfBKrP3xkKv4bXGEf.AkgRPavUjRgClSXAVzk2GmCNjUhA+Vm.QUBfgrVDrJlnGRXLAvx2BrPKGJjG8QezkbaN+4O+Zx.KL5Lt47eduqcsK7m+y+YCq8IDBIWQxOma1AWHIIgXwhgadyah.AB.GNb.UUUXylMX2tc3xgSvrqBUaNPAwKDEHTHjfEvzgBgAmyQbwnPVMNrK4D1jrAQAIHHbqUuhAspTzBZ9Pg7C9A+fkbaVqVqLL5bXQas01b9+6ae6iBrfPHDj3CxUUUQnPgv3iONt90uNra2N3bNb3vAJojRfnf.jDEPbAQHJHBAAQHBQ8oGKXbnxkRzNLQHvD.X4a8SwWQyFJjZpolLZYc50q20jYexqbkqXp8Xw8bO2CMbHDBYMoYm2JDDRrjQSFbQrXwP3vgQ73wQjHQfrrLTUUgJD.X5WlodgH.F.CPPXVG24Y8Xglsnb2xV1xRtMu268dZUyk2YlYlwPauzEj2W+q+0MziABgPxUwXLXwhE3xkKTZokhxKubTRIk.mNcBKVr.N3PApfqplHyUgDIrJUlN7E3fyRzFJLNxCScEyglMTH6ZW6ZI2FiNAQkqvLBnJcInLZdVPHj0xR1KE.IBrvoSmnrxJCNc5DNc5DUTQEvsa2PTTDxwCiXxwgpJfEUYv3QfMFGPUeN1hoDAxpwfhRLnxiCU072nKjXPal7lc1YmK41zau8Z3cqjOe9Lz1KcLihOV5BrnyN6bM4vPQHj01lexuJTnPHb3vvgCGvkKWvgCGnfBJ.VsZM0PiL43Shf9iC0.VgbTUXWvIDgDXLsO6ax4pPQUFSFYRLSroQj3ggBOdhicA.lZ906aKoEigTKszRFUONLq.K762uoVuPL54WwhMrTacqa0vy.nDBgjKHYPEiM1XvkKWHTnPPRRBLFCACFDSN4joxiESMleD55JPYRQ3LhaX4VIHK8ZUgnppfPxAfu.CB+wl.xpQ.GpPqt3eihlspPxzpGpYshPN+4OeFsTX0Ku+6+9FZ6Uc0Uuf2GEXAgPVKJYF0zue+XvAGDgCGFtb4JUfEyNsdKKKi3gUPzIUgpeFDhHAIlEH.FXB5wp0HwPzDUIJlJ1jX7PihfxAghZdZsBQKhFJSqEG80WelRjWm9zm1zBrvue+3hW7hF5y6Eq.v0ZqslWE8KgPHZk3wii.AB.UUUL0TSAa1rMm.JRRUUEhPDJg3HdLNThplJCcpGU5TUvSjVuUUfrRDDNdXDUIDTYJIVYJ4YqJDMoGKxjjPkYjJuS5Lm4Ll1vgXFE.rE67QtRkdkPHDiTxItYjHQPrXwRUoSS61BNXpBPUkCFO4Gqqu4UBFRLWKT4pPgqj2VYSAznUERlLwMM5JZ5rMyLyfSbhSfm8YeVCusMiUgwhEXQtRlHkPHDiFmyghhxbVYHoeCA.CoV1mFU+EbqlEbNOuqhlNaYcBxppppJi1tKbgKXpcA+e4u7Wv2+6+8Mzds3nG8nXjQFwveduTA50RKsf95qOC5ngPHjbSKZOBvS6Op63.4cC+w7k0AVrXim+rYz0Ji4KPf.3m8y9Y3O8m9SFR6c4KeY7W+q+UC+47F1vFVxsonhJhlmEDBgPzbIx7lrrKVrBKrvLZ6xEpQHu0a8V3Dm3D5d632uezc2caJC+SljATaokVLfiDBgPHKGyN0iuXesz6Gy8KorsOdxzUDxEu3EytFRi7hu3KB2tci8t28pK6e+98i8u+8aZC0v1111Vxswsa2FvQBgPHjERxpspnnXp5WxxkppJTUUAioBvTgn1m6tV1rZkk8kM8L4wZFYdxEygO7gA.z7fK762ONvAN.5u+9MsmuYROVjsmyIDBgrxIHH.III31saTXgEBGNbrrBtfy4fy4HRjHHTnPfymFETPDX2N6VEuLc7feITUUBZaYSegzau8ZDMyxxgO7gwEtvEvy+7OulLgNO+4OONzgNjolBwenG5gxnmKKVBzhPHDh9yoSmn1ZqEM0TSn7xKG1rYCbNOitnONmiXwhgabia.e97AU0OCUV4Mv5Vm.rY23qHqy15WehDettePXzoz5L0oN0ovEu3EwAO3AWw8dwvCOLdoW5kvq8ZuF.L2SnOxi7HYz1USM0jSd9fPxWHJJBa1rAKVrXHsWznQQrXw.G.bK1ffEqfmCzs2403.HtBfbTviKanMsnnHb3vAps1ZQ6s2Ntq65tfCGNlSQRagxwFIEJTHbsqcMboKcInnLA1PKig69tjPgtM2UThKWRYel2LS59Fud8ly9AYiLxH3m+y+43O7G9C3IexmDOwS7DYTtd3Lm4L3zm9z3Tm5T.vbCnHoLsrnSCEBgrxwXLTbwEiFZnATYkUtje.P1JVrX3ZW6Z3K9hu.QEj.pqQHcGUAAKFRGNupkJ.39m.xCN.Ttwn.JwMr1VPP.VsZEtc6FUVYkn1ZqENc5DQhDAQhDAbNG1rYC1rYKUJGe9ld5oQznQwHiLBhEyJpnBAT65EQwECXbYdiamf.CRfoS0.1Y4JW4J5dajs74yGN1wNFN1wNFppppP0UW8sUCT762OtxUtB5omdLoixE1d1ydL0BsFgrVAiwPokVJdvG7AQGczAb3vgt1d986Gm4LmAiM1XPQxAv8sCTv8sUvJzEfR9aRTxTIBvUTgxU6C3rQgxD2zPCrH4E2IJJBKVr.61sCQQwTAJDJTH3wiGTd4kihJpHXwhkaK3BqVsBIIIHIIANWBVrvfMa.VrvL04XAfFk4MWJ4BK0zkCe97Ae97kSF.wB4IexmzrODHj0LrYyFJu7xwce22Mb5zotl5kmXhIPYkUFrZ0JDkrATV4Prl5gf6h.OKSW.qcw.WNNPf.f4nPvXBlZdtLYFAc5omFCLv.X3gGFEUTQnwFaD0UWcnrxJKUvGYvdClYOV..HwwsW.VzZlQ1mbsjN5niLtByBjHEmSmOHjUljWsYxZMQ5FZwLcR3kIR1FIZa.tf.fUIvEXvr+.j7YLIQvDDPhWF0+OGbNscZxIEJJJHRjHXzQGEW5RWBpppvqWuns1ZCM2bynxJqDtc6FRRRolBBI+dt16mq68XgQWxvWK5fG7fKqsOeXnoHj7AImncy+1BGNLBGNLra2NJnfBVw4o.fzj1o4b.t9OD1q5w4Fat5NCnpphnQihwGebLwDSj56SLwDnkVZA0We8nzRKE1rYyrOTWTRLjcQ6rTO1b4It4pAK2dq.fl7lDR1Xox.hpppXjQFAexm7IvkKWn0VaEqacqCRRY20wkrMyw9rvUAXfIvLzj+vh89ubNGwiGGACFDACFDyLyLXxImDSLwDHb3vnolZBqacqKU.mo5MKC4HOyHktZQ+xwvCO7hd+974i9PLczO4m7SVQON5bBgrxjbXPVHbNGSLwD3ce22ESM0TXyadynyN6Dqe8qGEVXgqn+1a4lRmIYH1rtPKSdnPl+8onnf3wiiImbxakcMYvsa2njRJAd73YNOVi93eoj0CExRkPnntcW+zUWcsr6sBfbmzqNgrZkhhBlZpovG+weLFYjQv0u90Qmc1I13F2Hti63Nz8knJY0CKVr.a1rA61sC61sm1UHRtlrt5ltTAVP8Xg9vsa23W7K9Eq3GOcNgPVYl8e6rTychvgCiqcsqgomdZL3fCBud8hN5nCTe80C61sur96PFikWWJsyUwXF+U7mtQJX1+tDiwfUqVgSmNwcbG2AZngFPas0FZqs1PkUVIb3vABGNbps8qvPtvDGQ26wh96u+rsIHowO5G8iVwol6O3C9.M9ngPHKDUUUL93iiO5i9HbyadSL7vCisu8siVZoETZokR8dAYNDDDfc61QIkTBJu7xQyM2LZqs1PCMz.pt5pga2tmyJEJWTVWDx.RTKPRWUNs2d6Mm9Ie9p1auc7c+te2UziklLsDR1Y1K2zLcaARz6Ee9m+4XxImDd85Eae6aGs2d6X8qe8vlMaK5eWl59XTeVnsRrjcMi4nP598HIIITXgEhZpoFHIIgFZnAzZqsh5qudTRIkba4xhuZYHma8aERZQml3ymuzFXwLyLiFr2Iyla2twwN1wVwO9kZx1RHD8S73wwXiMF5omdvniNJFZngv1291QSM0DJojRnduXMpjAXTPAEfpqtZX0pU3wiGTe80ippppEL6alqRSxiEW7hWDO7C+v21smOk4JyW7RuzKkUota5bBgX9BFLH9rO6yvTSMEFYjQv1111vl1zlP0UW8xdtWPxekrnionnjp1gzXiMh67NuS31sa31saTPAEjJfyjqNjjO1Y+E32J0bvM2e2gA.IfrOCwsPyiBpa20VG4HGAaYKaIq1G80Wez4DBIKjoCebxqBcg1VYYYL5nihfACBe97gQGcTryctSzbyMCqVst.sKxoVVgqFXVK2zj4qhvgCifACBUUUv4bTXgEB.bqZ.BGgBEJs+NTnPgPnPgfrrLhESAgCyQv.bHHXtCMhUqZTOVrPSFvkZhcRxbO1i8X3IdhmHq2OzD2jPxcv4bDHP.LzPCgAFX.zVasg5qu9zFXAY0CEEkTYXyO+y+bHKKC61s+U89.V5UbTjHQvPCMDFYjQP73ggqBATTUQAEH.lIVCYJtDNjXPUSht4sdq2BOzC8Py419vO7CoqNVC7XO1igeyu42j06m95qODHP.5bBgjExjdrHSSnUVrXAEUTQnolZBaYKaA0UWcoMcMSIGK8iYrbSA.hFMJFbvAAmyQ+82OrXwxskMMWrhaW73wwzSOMFe7wghxjXxIY3peJGVrpXpKK4FaDPJ0KpYoO3C9f4DXAMLHZiu025aoIAU..b1ydV5bBgjkxzB+zRELfCGNPkUVIZu81Qmc1IZqs1PokVJrXwxssel69SCdRPRfk3eLigXJZzn3F23Fvue+vpUqK62aly4HVrXPVVFbdTL5MDfUK.YQYoQSv4.RPiJ2um8rmEO2y8bo9+4akJ8bQZYPE.I5UIBgXtDEEga2tQSM0D15V2J1111Fty67NQAET.E3+ZDbNGxxxPUUEQhDIq1OInBDhmSDz4jSxgDzndrXjQFA80WeXCaXC.fljfYqm4YdF7i+w+XMa+40qW7oe5mRmSHjrzxYHIl+1Z2tcTYkUh6+9ue7.OvCf1ZqMTd4kujEnrT8VAnRktVJYQ3zrp0Foq53txka76EbNCRZYkS+e9O+moBrXjQFQy1uqk3xkKzc2ciG+webMc+R8VAgXdDEEgSmNQCMz.1111F1xV1Btq65tfKWtxpRpNgjKRJSyfbYh29se6TCGR+82O8GLKSUTQE32+6+8oBNSKcxSdR57AgnAxzIuIPh4igMa1PkUVI13F2H5ryNw8du2KV25V2sMWJxj1Erj+ML82xZiDyuBAFy7mbBqhnccWA.t90uNN6YOK5pqtnZDxxzt28twy8bOGb61sluu6qu9v0u90078KgPVXRRRvkKWnlZpAaaaaCadyaFMzPCvsa2TP9jU0x5pa5785u9qit5pqELodPlqJpnB7BuvKfMu4Mqaswq9puJctfPzHYRsBwpUqnxJqDd73AczQGXSaZSXcqacq37SwrmG.zeJq0Lu4XwpQLFS6VtoI8Nuy6fScpSY3eP1u5W8qva7FuA9nO5iLz1ckxoSm367c9N3.G3.5RuTjjOe9va9luIEXAgnQVpgBQPP.kUVYXG6XGnvBKD0UWcn3hKVS5kB1sVdjDMBKY4nGTfEZDFiosCERR+te2uSO1sKp8rm8f8rm8fd5oG7xu7KmSGfw27a9Mwy7LOCppppz8150e8WW2aCBg7UDDDP4kWN73wCrZ0ZdUwihPzBRo5FHMjQOLHM1Xio94N5nCzQGcfd5oGb7ie7bl.Lb5zIdvG7AMr.J..ld5owIO4Io2TiPzPyOgUkt62pUqZVZ4d9YwyDcaulrqWa6VKeWyJyatZltziEFsJqrxa61RFfgOe9vq9puJdi23MPvfAM7isFarQr+8ueryctSccHORmSdxSZJOmIj0BTTTP73wmS8cPuZmj46.N.3pp.xJ.Jb.AyqlPj2KlB3L88b2ZUZ9j2zLrXKOypppJzc2cit6ta71u8ai+8+9eiO7C+PccURzXiMhcu6cit5pKCq2IlOe97g+9e+um2etkPx0vXLDMZT30qWLv.Cjp3QoWlYlYvXiMFhGON.hBL10A+ZC.3xI3f9PwUJVTUv8cMfHA.iyodrPinaywBiVSM0TFsc6bm6D6bm6D.IxyF80We3+9e+uXfAF.e5m9oqn11oSmnolZBs2d6nolZBaZSaxv6Yhz43G+3TuUPH5.NmiwFaLbtycNze+8CQQQcs8hEKF74yGlYlYfhPXv++dODa3qBHrp3suMMLtJP.+.iLD3ppznKogVU7altb4ZY+XZt4lQyM2L91e6ucpaymOevqWuHPf.XfAFHsONmNchlatY.jX3VxE0SO8f27MeSy9vfPVUJYoN+JW4JFV95QUUEJJJfin.C1ODFZkcgPj4hCN3JJfoR87iVRZ0Po3Uq9.9ppppTCcQxd1HezQO5Qy6OmRH45TTTfhhhg1lrDML3vXa2UyXy8eHYIQQQHXVyA.sREUTgYeHjS43G+3q3g0gPHDBIaTQEU.o1aOwbBXlYlwrOdVQR2JBYsp96uebhSbBp2JHDBgXJ9FeiuAjrYyFN7geN7K+kOuYe7rhzd6sa1GB4Dld5owgNzgnfJHDBgXJ1291G9ZesuVhIu4i7HOLTTTwu829ay654BZnPR3nG8nTgFiPHDhgSPP.6ae6CG7fGD..LNW4VSGVADOdbzau8hqd0qZhGhKO6XG6.kUVYl8ggo5pW8p3i+3O1rOLHDBgrFSEUTAZokVPwEWbpa6+GovAEBVW6kYH.....IUjSD4pPfIH" ],
					"embed" : 1,
					"id" : "obj-22",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.5, 2.0, 534.0, 71.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 52.5, 268.0, 30.5, 268.0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 237.5, 396.5, 30.5, 396.5 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 237.5, 370.5, 30.5, 370.5 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [  ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 216.5, 145.0, 30.5, 145.0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 51.5, 360.5, 30.5, 360.5 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 55.5, 203.5, 30.5, 203.5 ],
					"source" : [ "obj-8", 0 ]
				}

			}
 ]
	}

}
