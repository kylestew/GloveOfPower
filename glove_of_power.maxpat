{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 2,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 1175.0, 433.0, 629.0, 255.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"comment" : "Button 4",
					"id" : "obj-40",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1016.0, 860.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1016.0, 835.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "scale~ 0. 1. 0. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1016.0, 808.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1016.0, 513.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 209.5, 0.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1016.0, 539.0, 23.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 209.5, 27.0, 23.0, 20.0 ],
					"style" : "",
					"text" : "X",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1528.0, 687.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "scale 0. 1023. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"comment" : "Pressure Pad - CV~",
					"id" : "obj-53",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1528.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-54",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1528.0, 513.0, 20.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 211.0, 49.0, 20.0, 58.0 ],
					"size" : 1023.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1507.0, 334.0, 74.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 7.778774, 35.0, 20.0 ],
					"style" : "",
					"text" : "batt"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1453.800049, 333.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 6.778774, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.0, 40.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "loadmess port 4298"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.0, 74.0, 153.0, 22.0 ],
					"style" : "",
					"text" : "udpreceive 127.0.0.1 4298"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 938.0, 775.5, 99.0, 22.0 ],
					"style" : "",
					"text" : "scale~ 0. 1. 0. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 938.0, 748.5, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 867.0, 718.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "scale~ 0. 1. 0. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 867.0, 691.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 796.0, 660.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "scale~ 0. 1. 0. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 796.0, 633.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 725.0, 601.0, 99.0, 22.0 ],
					"style" : "",
					"text" : "scale~ 0. 1. 0. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 725.0, 574.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-35",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 617.5, 661.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-34",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 500.0, 661.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-28",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 351.0, 400.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-27",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 571.0, 400.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-25",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 453.0, 400.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"data" : [ 16457, "png", "IBkSG0fBZn....PCIgDQRA..AbH..DPeHX....v6WPZ.....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6ceGdTUl9FG+6Y5oi.gtzQQZRwFBADTQPZBHHJBnXus1K+rvJn6phtt3t1WPPAAqTDEvBRQTDQPDPADoD.oWROYZmyu+HjH3Df.jYlTt+bc4kIybly4YBIy879ddNuigkkkEhHhHGFaQ6BPDQjReT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBGQ6BPjRBl68S4V5+yw5NtaYC31m5awUWG8q9hbrn+BQJevU0nUWPaHFuEw8Y4icu5egcDDH15PshSCXVjiGCsjcKkuYxA9lmgQ7nyk8S0oOuv349O+jz7oJxwg9aDobs713T4QG4bY+3fVb6ig+lBFDoXQ+chTtk4AVLu3C757KAfJ2smjm9pZHti1EkHkQnvAo7o71Du+iMRly9.ilb87bOPmnJ521EoXS+4hT9i4A46F6CvqtF+P7cjG6YFFMMFincUIRYJJbPJmwKa9Cebd7Oau.mNC9YeL5V0US4IxIJENHkiXxAWxX49e4Uge7v4d+iga9riGMlAQNwovAobCua4i3IdrOk8BTiq3eveuO0AmQ6hRjxnT3fTtfYZeOuz8+e4m8CdZ28x+5tNORR+1sHmzzEAmTNfO1vqMDFwT1E.DWMNcpD4gWeAIXH+5sSZv0NVdgAc5ZTEhbLnyTmTNfEA7FnvuK6csMx9Xr0wlo+veIIRYbZjChHhDBMqrhHhDBENHk540avncIHRENJbPJ06oe5EEsKAQpvQgCRoZ4la.doW56YEqXmQ6RQjJTT3fTp1blyFHyL8wG7A+RztTDoBEENHkp8QezudD+eQjHCENHkZkatA3S+zeC.13FOnlZIQhfT3fTpUASoTAzTKIRjiBGjRs9qSkjlZIQhbT3fTpzgOkREXia7fr7kqoVRjHAENHkJ8WmRoB7genlZIQhDT3fTpzQaJjzTKIRjgBGjRcJpoTp.ZpkDIxPgCRoNGsoTp.ZpkDI7SgCRoNGuoNRSsjHgeJbPJU4XMkREPSsjHgeJbPJU43MkREPSsjHgWJbPJUo3NkQZpkDI7RgCRoFEmoTp.ZpkDI7RgCRoFE2oTp.ZpkDI7QgCRoFmnSUjlZIQBeT3fTpvIxTJU.M0RhD9nvAoTgSzoTp.ZpkDI7PgCRoBmrSQjlZIQBOT3fD0katAXVy5DaJkJflZIQBOT3fD0Mm4rAxJqS7oTp.ZpkDojmBGjntS0oFRSsjHk7Lrrrrh1EgTw129saiby0+oz9nyct93zoduNhTRQgCRYBUtxOWgecyZVxr3EOhnX0HR4eNh1EfHEGG7f4U3WmQFdihUhHULnwgKhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgCGKloyRdpdQJojBojx0x31PdG2Gh2MLdFZJoPJojBWyarVN9OBQDozGENbrXKIN+63A4hhGfT4selOhsbr9.Kyep7wO6ayV.3zGBOwvZJdhD0oHhTBSgCGG1pbJ72tuKjX.XCiiw7I+AAJxsL.+wm7b7l+lEPc3Zd7gSSiwHRVphHRIFENbbYij658wcettABxpesWjubOACYqBt6OmW30VMAApyU+3bcmULnnAQjxpT3Pwg8pyk8.2AmsC.u+.uzKsHNf4gc+l6mEL1+C+nWfZOXdrqqYnAMHhTVlBGJlbTqdwCcqmE1.xdQuHu1xxf7yGLI8u+U3EWbN.0jA83WOMO1CKYvLK98u5s3ou6gwUboobnStcJboWwv49e9OfksmCcRLBrcl5vx+9tsYuWLOhitWV6Xuh7er8YLrl+xY41buylaKkTHkt9.rvzsBe+PPDoBCENTr4j51uGgarw.jFy8Eda90bsvJ6Uy3egujL.pwfdBFQyi8OmNo.6lu3IGBW+nl.e9J1LGzY0nN0sNTsDrQd6eS7Cex+k6a3ih4sOSvQ0476bsAfeaAqmrN7Wi2+tXYKa+4+0Gbkr7ce3mUbKx7WlGqGvVy6FsLAMjEQjScJb3DgqFxfdzqi5Cvt9.dwYrQV+6+7L88BTiqjmXDsf3J70lM4fK9eyyO+C.1ZBC4EmNe0r+Xl56NU93Y+ULy+6MPqbAj0B4sl81vONo1c3BIY.e+xhXyG1nCLSa0r3sVv2sMVxuj9gMxhbX8yaM3Gnocq0TI8unhHk.zKkbBxcSFBO50TG.XCu18v8LgTApNC3wuQZYbG96ZOG9sE7qjGP0GzCy0etUEmEdeNoxsdvba8nx.vtW2twOf65eQbdIAjwOw2tceGZasHy0s.9cfJcV0Aa.abw+N4VvtJuMw7WYN.MlKocUQ+CpHRIB8ZImv7PSG1+GWY0ArRmrApV+eBtoVE2eo6jhmy+I+DV3WOWd6a9LvcH6GCbmX9WED9yK.V.3oQz01FKvtXoKeOGpkYyiMun0heRh1Ov9PiAx6W9NR0a96Eea8aXYoATutx4kr8vzy4hGSSKrrfYO6MPSZx+kJUomim+4+tnZMch3tu64Rcq6XoAM3knKc4cnW8583ttq4v3G+OwpV0tIqr7c72IhTNgincATVjQbsjgcqmMe7n9Yrr0Ft8quUD2QYp9s4LNh06932WwuxF1xV4O9i+fsskMwFV+ZYaEbxiMK3DLDKm4kd13Z9KgMunUS5CpNTk.amuakY.tZOcpMskjpF7a6YE7S6I.M6zsXmK86X2.0rSWH0xYQWCgallVbu26myG7A+B6ZWYgggAVVVzvFdZLwItRdvG7BiNE1InW+0+Q74K+1TdKaIsi51YyF3vgchIFGjXhtoxUNVpRUhgpV0XnV0JApacqDWy0zRpd0iKRU5hThSgCmTLvUbtwFPP6dHNmGkjgfGfk8NOKO2DVB69uzDQwUmVPaqxFXEax6QreSn4WBMy1RXk+1BY8Y2CN+L9IV5t.ZVm3Lq7oSrsJNduuZq7cqMCt5Z4iUrfTARlNlRcHRmM3yWP9se6.LvA9Art0sOLLx+mCIjfaxHi7H0TSiILg9EgqpSdtcauvvgiESy7et6yWPROcursskwQb+1rYvHG47Y0q91n90uRgqxUjvJENDtXkKqcb2E22j2JPbzzKtOzk10TZTCZ.Mrg0kji0jM+VCigsoseDOLaUp0bImIrx0tFVzlygltqEwV.N812BpjsXvYJME6e0xYCK52I6yIMl2uCToymKpAgNwUgK4kWP5YOeW9oeZmbvCl+YNOoj7P5omGFFP7w6jVzhj4+8+5MMqYIGwpqSUsss0jEtvTC41ML.Kq7++P9e8whc61Hqr7w11VFJbPJyRgCgIVYtblvGrU.6zp6eB7RWQM+K+v1OYrq7eGmVG9q1XqxzttzPXsahU78af08Ga.SpLs8bpANwfDZVJzPVNa3W9N90UrCVqID24bIznHzh3zd1S1z91Od1zlNHwFqqBeAyLxHOtxqr4Lkozeb5rr4ox5rNqjCIbnfoHygCaDHfIUpRdnO84L4ge3Nxl1zAXqaMc191yjcsqrX26NK1+9yAOdbPe6aSoicrtQomIhbpSgCgIAyX6rae.TcN6VV0P9AsUlqlYujCENXF7vZMUGT8yuSTmWcSr8E9YL6bxA7zV5P8y+U+sWkylKnlvF14h38mZF3CObdc6LH1v7yGSSKlzjVE22884bvClG1rYPN43CmNsSia7owK+xWNcsqMHLWEgWsoM0Hja6q+5gwq7J+He9m+6jYldI6r8yjm7pX9yeKL6YOD5UuNinPkJR3WYy2hWY.NpT8nNd.XG7kexOQZE9p+V3cW+.S3QeLlcAmyS+4h+C6Rh1Ys6.WXx.acNrv8Az3NQShsv6jyu0IBrWV1u4Eb1JtrlEeXccbxxBt1qcZbC2vLIqr7hkkEwEmKF1vZM97837q+5cTlOX.fy4bp0Q78d73fK3BpCe3GdkLkozeZRSpL98GjXhwAaaaoSG6334ke4eHJUshDdovgvk3aK2vvZJ1.10zte5a+FN21ccGbSWaeoaC79YBqtlbYCnM4uZul11IsC+7f5t9z4y+Omq55cgM+vt317PCR4rJ7jOaqYg2qJZ+9MIkTlHu26sFb61A97YRMqY77hu3kwa+18MrcbiFZbiq7Q78W3Ed53wS9i4qW85LXcq6t35u91PN43mDRvEomtWF4HWHidzKJZTthDVovgvF2zvgLVF+iNHtfFdZX+.ah0rxUwVxIYtfAb+7xez33QGZO4LrA7GKhkryCeg.2CMpqsk7aDxpP6ZW0Orokxf3OyNQiNz2clWZq4zBS+qX5o6i129wy28coRLw3jbxwOspU0fUrhaga7FaS34fFEkXhtI1X+yd95htn5eD2uMava8V8g4Lmghe+lDSLN3fGLGF8nWHm24MNxKuhdwbWjxhLrrNd8dgTQzN2YVz91Od111RC2tcPt4Ffd0qyjYMqAGUpGCiQU3W2xVVMV0ptsvxw4rO6WmMu4CRt4FfYO6qgK8RaTQtcolZZz7l+Z32e9szpggAsoMUme7GukBOI8hTVlF4fDBSSKtvKb7jZpogc61wq2fLjgzpnVvPjz.GXyHyL8QSZRU3htni94Qod0qRr3Ee83vQ9+IjMavO+y6lW7EWRjpTEIrRgCRHRM0LH0TSCGNrge+A41tsykIO4xNWLamJd7GuSr10dGr7keyG2Vxs0stF7MeyHn5UONBFzBCCCdjG4qXdyaKQlhUjvHENHGgsu8L3Rtj2FKKvkKGjbxwxK+x8HZWVQTMsoUkXho30k2sss0f0rlam5UuJQvflXylACcnSKLWghD9ovA4Hz8tOY1zlNHwGuKxMWe7O9GWbztjJ0qpUMVlzj5GVVfe+AYm6LSV1x1QztrD4ThBGjBYZZwV1R9m.5rxxG+6+8kwMcSsMZWVkIjRJ0kpV07uXTb3vF8u+ueTthD4TiBGjB4ymIABXha21nJUIVt669Bh1kTYJSZR8GKKHP.S10txJZWNhbJQgCRg5V2lDd8FDCCa3wSz8yFhxh5d2aDFF4u.8ELnI6ae4DsKIQNoovAoPqd06lXi0AomddLnA0hnc4TlTRI4A61y+Oq5d2e2nb0HxIOENHExxBb5zAIkjGdwWraQ6xoLoG9gSg.ALwgC676+9Ah1kiHmzT3fTnfAMwzzDWtzTJcx5QdjKjXi0INcZC610kJsT1kBGjBYYk+mxYACpUTkSV4+yOSra2nvoWRjxhzu8JExueS74K.G3.4vG9g+ZztbJS5Rtj29PmTeCb6Vi.SJ6RgCRgpacSD+9MwiG6bO2ybi1kSYRqbk6h3hyIYjgW5SeNync4HxIMENHEZVy5Z.x+5cXG6HS91ucaQ4JprG+9MwoS6jTRt4UdkKOZWNhbRSgCRgZZSqBUqZwgkkENcZmAO3ONZWRkobMWyGSVY4ifAMIlXbEsKGQNknvA4HL0oNfBWif191SmsrkzN9OHga5llEScpqg3hyIYloONuyq1Q6RRjSIJbPNBcsqMfS6zhAa1LvgCabdm233.GHuncYUp268d+Bd73fry1OWvETGl9zupncIIxoDENHgXLi4Rwzzh.ALYu6Ma5SeduncIUpkoIbIWxjIqr7dnk4b6rvEd8XS+kkTFm9UXID23M1FpScRpvueoKca7cemN4zEkN24IvBVvlvgCa3yW.ZW6pEtbo+rRJ6S+VrTjl+7GFwFqKrYyf.ALoicbBz3F+e0hI2g3ymIcriuEKdwaEmNsSvfVb9m+oyhW7Hh1klHkHT3fTjZbiqLSaZCFKKHgDbgCGFrwMd.N6y90wq2fQ6xKpZCa3fzxV9p7se61H1XchWuA3xu7FyRVxHzzIIkaneUVNptrKqA7RuTOvkKm32uIFFvt1UVTu58uYQKJ0nc4EU7u9WKgN1wwyu8a6mXi0I4la.5cuaJe5mdMQ6RSjRTJbPNltq65bYe66AXXCq0jPBtwzzhCdv7nqc8cnm8bJjUV9h1kXXWAmb9d1yoxnG8BYO6Iab61A97Ej67NOel4LUmIIk+nvAoX4se69xscamCUu5wiOeAI1Xcvrm8Fn4M+0XdyayQ6xKrYFyXcT+5+R318Syrm8uQVY4Ea1LHgDbyzl1f3+7etrncIJRXggkkkVBNkhsUtxcy0ccSme9m2MIjfKxLy7G4PhI5l5TmD48e+ARKZQxk3GWCiQU3W2xVVMV0ptsR7iQA75MHolZ5bi23mvhW7VwxxBa1LH93cQFY3kVzhpw29s2.IlntJnkxuzHGjSHst0UmUtxak+u+uTHmb7igAXylAACZxu9q6ky8beSt9qelDHfYztTOoXZZwC9feActySfu4aRk3hyI.Edh4u5qtEr5UeaJXPJ2SibPNospUsGtlq4iYKaIMxN67GAgKW1wmu76lopTkXI4jikIMo9w4bN05T5XENF4Pf.lDHfI4la.F9vmAKaY+A6ZWYU386zoM762jV1xpyG+wWEMoIm1o7wTjxJT3fThX9yeKbG2wrYsqcu31sC75M.wGuKxJKeXXXfkkE0rlwyEewMjwMt9bB+YcPIQ3foY9+ptMaF7Fuwx4YdlEy91W1jc19A.mNsie+AIojbS5o6kpTkX34e9tw0e8s9D9XIRYcJbPJwXZB28cOGlyb1.olZ5EN0RwDiCxM2.XXj+zy.fGONnpUMNt8a+b3+6+qiG288IZ3PvfVX2tA+wejIuvK7c7K+xd4K+xMRkqbrbfC7mWHeETa1saifAMwlMCpUsRf1295vTm5UpOpOkJrT3fD1r3EuUt26ctrksjNG3.4foI3vgMBDvD2tseDWLcEbxsSLQ2jQFdIwDcSRI4lQNxNyMdisMjvge9muMLLf0u9CvHFwLXyaNM14Nyrv28eA6e61MJLnHXPKRHA2jYldIoj7P5omG1rA1sai5UuSigO7Vwi+3cJZ7iJQJ0QgCRDgkE7vO7WxLlw5YKa4fE9YsbAS8zeMbHt3bV3z8TTJ39sYy.SSqBCEJ3bdTP3fGONHu7BT3iylMCrYyfZVy3owMtJL0o1epd0iOR7i.QJSQgCRTQ5o6kq+5mI+7OuK111RmpTkXY+6OGpRUhi8u+rIXPSLMov4++upfvgXhwI4la9gH1sai3i2E4jiOhOd2jUVdIgDbSvflzpVUcNmyoVbW204SCZPkhzOcEoLGENHkJsicjICe3yfMtwCv12dF32+e1ZrFFPxIGGG7f4RhI5gZW6D3we7Nw.GXyhhUrHkunvAoLgH4EAmHhtH3DQDoHnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjP3HZW.hHRQw+VlHCanimseL1FGwkL06rNG5xULDFTmpGwXTv8XxdlwMw.9W+FzhmfO4U6FmVg2mE4smsPlIUeR1sQQuiOlBxt93ajAN1eGZ0n3Se4tRRmL6lR4zHGDQJyJP16kM9iygw83WK27K+ijt4w4ADb+7CS7g4ZFxyvRyvJhTikUoQNHhTJWcX3u4qxUUmC+kqLInubIssuJl63eQd2eJa1xGLZds1OEd3yIdLvf3Z9UxMOhcgQsZRginvJyUvDF+RXuzznxyjxRT3fHRob1wcbwSBI37ub6IQkpRM3Vd1Zg+gca7A69fL2I88bys8Rnx1LHtlzCFZShJEb4BZZkDQJSyH1yjd1iZC.A23xX69hxET4DZjChHkwYmDpdh.+AjaFjmID5IjtSr0+Y+4NmalG5wrNdt92YdNRlAMtoxccltOzsaR1aZQ7wu2z3y+90xVOXdfijndsJE58vFA8ucIyQN9EK7uukyT+eSfYrnUwNx1Bi3pCsoqWIi3ltBN6Sydj6GCkvT3fHRYbAHssdf7+xDqNITjudrcRpocj1um0yJVwlvKNodsosTyXqNMNgBl.E+7GyYzb6+yEP96s3n50o1DXu+AothOkWdEeMK8ddSd1ATm+b2t8Yxibs+DqOG.mwSBdxhLyd6rhYMVVwOrYdw2593bSrr4DzT1rpEQjCwL8kyGLmcC.w1hKfS2cQsUNo9C3Q44F00R9mFhFwfehwvy+rOH8nV4OV.+o9gLx+4B3.XP8uhQwT9x4vGM02iYL2YxKc8s.WjCK6k9GLq+HvetaOvOw5isybW+mow7l2bX1ew73CelAPcAX2yjW+K2CACmO4CiT3fHRobAI2LRmzRKs+7+N39Y2aa8rr49VLxa8gYtoAPcX.CsMD+I0wHW902ap7a.1Zw8xXtmtxo64Ps3jiJSaG9H41aJf0ZYFKbm7mwCmNW2KLRFTaRFWF.FtnFc7l3dtj3.fs7ioRdmJO0ihzzJIhTJ21YR2V+XRGysIVZ6c9zLrlTjCa33y21Xw+PZ.1n0WYWnF+0olxd04xep2l1RUoNUKN1+zOzsW6KltTWW+kM1CmdKpE7Ua.eokNdsf3JCdQxovAQjxnrQLUotblsME5w.FHcq4m1I+Knk2N421G.UilV2XIzWK2FwTiFRC.3vmnnS6zoRgbPMvgmCciACfkETD6vR8T3fHRob0ia9cm.Cst+0qygRNl9xlbMAvMI39DX11s4fxt8izwlNmChHU3Y3LFxexg7RVdOdqAGULnvAQjJ7L7TcZTU.Xer9cjKgtpKYRZK9evsbK2M+8ItFxpBvxxjBGDQp3vv1gdQOSBb3CPvc8nSsKAf.7ySawr2+5fGLO.+vGMO90ecE7q44FmkAOGBmnT3fHREFFNhkXb.vN3GW0NIWu4gOS.hiVMzqlFC3eE+Kdr2XIra+G5AELcVyTeZdgk6Gr2Rtl9z.NI6IpxTzIjVDohCW0hVUaXoolEKbzClEhG5z+Zl7ONuXwY8GL+ymXybGO0Wx5lxCwU99UhZWmDw+d1J6IW.pLc8QGI8tVNXeQ6mGQ.ZjChHUb3rtLv+98xk13DOT2kZmr2aVGp4TcRM61iyjlvHYnco4TC2Yvej5VYOApLMp8ChG9MmD+8tUiJLuiZCKKqJ.mZEorNCiQU3W2xVVMV0ptsnX0HR4eZjChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgPgChHhDBENHhHRHT3fHhHgnhxBLnHRYPe+1+dF3GNP1YV6D6F1wlgMbZyINr4ft23tyTFvTh1kX4VJbPDoTko7KSg63ytCRK2zJ71rYXCNrO807FvKScMSkOY8eBNc3jVUsVwWNruDW1bEEp3xmT3fHRoBs90aMolVpjl2zvtM6Ed6Ns6D+A8iGGdvgMGjWf7Hm.4P7thGG1bf+f9YQotHR3el.w5HVZZ0ZJK75VnBJNEoy4fHRT251+5XM6cMjSfbx+FNzmxLNs4jpFaUYNW6bH8GIc1+Csex9QylAzrAPhtRDCCCx1W1jf6DvsC23yzGe+19dZ1qzLxvWFQumPkCnQNHhD07Ma8an6St6ji+CEJXCLvf5lTcY1W6rooUooE4i6iF3GU3Weeew8wG9KeHY5KSxzelDuq3YiGXiz9w0dV5MtTh2U7QhmJk6nQNHhDUr6r1MceRcGuA7hAFXCaXZZxi0oGiMc2a5nFL7W8hc6EYa261HsGNMF5YOTx1W1DiiX3W26uRUe9pxvmwvCyOSJeRgChHQb6Km8Q6Ge6Iuf4gggAVXQCpbCXtW6b4o5xScRueemq3c3ZZ00PtAxkDbm.1rYi24meGd4k8xkfUeECZZkDQhn7Y5itNotxVRaK3woGBZFjWo2uB2dau8Rj8+j62jwocmLkUOE7EvGI3NAtm4dOTi3qAW4YckkHGiJBzHGDQhXLwjNL9Nvp20pIQOIRt9ykGKkGqDKXn.SnOSfscOai5kT8HSuYhS6NYPevfXr+vXKQONkmovAQjHltO4tyOtiejDcmHomW5bWm2cwH67HCKGqpEW03s56aQsSr1jm+7Hd2wyyrnmIrbrJORgChHQLKYqKgXbFCY3MCtxlek7e5w+Ird75ZC5JyZvyBaF1vWPermr2CS5mmTX8XVdgBGDQhHt728xIK+YgcC6jf6D3CuxOLhbbaSMaCMtxMFuA7hK6t3V+rakksikEQN1kkovAQjvtmZQOEyeyyG6F1IKeYwkzvKIhd7m4UOSRN1jweP+jWf7Xne7PinG+xhT3fHRX2qt7WEeA8gokIsp5shoMnoEQO9MsJMkObfeHVXgkkE+9A+8H5wurHENHhDVkkurXWYrKLwD.VxMtjnRcz452YpRrUAWNbQPqfLjoMjnRcTVgBGDQBaLsLoySry.PrNik5jTcHVGwF0pmt1vth2.dII2IwTW8T4s+42NpUKk1ovAQjvlG3Kd.9oc8SDuq3IG+4vcc92UTsd9fA7Azpp2JR2a53vlCdxE9jQ05ozLENHhDVDvL.u6ZdWrgMxxWVzqynW7fs+Ai1kEew09E.feS+r0z1ZTtZJ8RgChHgE9s7ydxZODzJHFFFLsqJxdRnOZpd7UmjiIYb4vElVlbmy9Ni1kToRJbPDIr3Je+7WGih2U7b5Id53zlynbE8m5P85Pgq6Rexu8IQ6xoTIENHhDVrzsuTb6vMY4KKFTyFTztbNBe7U8w.Pldyjcl4NixUSoSZUYUDoDmuf9X+4tef7+7e9461yGkqnijMrQipbiXeYuOZaMaaztbJURgChHk3rvBW1cgAF3wgmnc4Tj9nA9QLy0OSF9YqOLfJJJbPDoD2G7Ke.9B5i3bGGtc3NZWNU64FPT..vGzmDQAQEoVWiVSqqQqi1kQoV5bNHhThajKH+kg6r8lMmU0Nqnb0HmLT3fHRItsk91vtM6XXXv62+2OZWNQLu9O957tq9cICuYDsKkSYZZkDQJwUv4YHFGwP0iu5Q4pIx4a152vTV8TviCObYM5xXfMefz6yn2jn6Di1k1ILENHhThKaeYC.dC3MJWIQG4EHOl45mIyb8yrLaPgBGDQJQYgEtsm+IgtzZmJEIUVMnPgChHk3LLLx++ayHJWIktTVJnPgChHknLvf7BjGP9K9dRQqzdPgBGDQJwkfqD.zzJUbUZLnPgChHk3xxWV.4uLZHmXJsDTnvAQjRbVXA.AsBFkqjx1Jpfh657uKt3Fbwg8isBGjR819RNxOygW8dVMFiRmnyxBBXFP+aUIfZFeMY.Ma.LvlMP5Xc6XD4XpvAoTKy.AXgiZTr3m8YAd7nc4HRD0eMPvlQjcAsnLe3PfsOUFwU+pr4iy14NoZSCaw4S2Fz0Reaaxbp8wNheRchCmqc7aCGWvX3Se91SbGyaWNQs+0udl1PGJ6XYKC.ZHaBraisUaS7m7AixUmHgGQ6.gCWY9vghKuo+Gr1ucZr1u8yYI2+33Yuh5bJFPHgEVV7iuwavWb+2O9yImBu4gw6fgaOLutWI1dyiEngQuZTNt1RZaAH+q2g5kT8htESDzdxdOEdx3KtJMEHb3JGENTKF1aOYtoFF5K4a4Oc15xmMi6EdUVvtyleXrOKy8BdI5cMrGEpS4nI6cual4HFAaX1yNj66zuvKj9MoIwHanBEJKnfyyfCCGrw+1FixUSjyPl1PXJqdJG2sqzZfvgqbT3vQmgyjndWvUyHGqC1807eXsA+Yl1h1MW9fpEJdnzg0MiYvrt4alb16dOha2lSmbQ+8+Nc7QdDLrq+0prhB97hVWmC+oxBABGtJDgCEvYM6.WRC9Or1MA67W2E9nVDSztnpfyWlYxbu26keZ7iOj6qpMsoz+IOYpY6ZWTnxjSEdb3gflAIKeYwZ1yZnEUqEQ6RJpnrVfvgqBU3.lAv6gZ6Z6NsyQ1fclj0F9JlxjmNyao+J6HaSvYRT2l2dtrqZXLnNb53QcjWIps8ceGSeXCiCtw+xzNXXv4d62NW5XFCNiM1nSwImRpQB0fMr+M..2vrtAV5MrznbEE4TVNP3vUgJbHuee17YoBfMZP6pMtJ3NrxiMMsQxearKgzAf3H4ZmDl6eGr0UNW9eqbtLmdMZdo6uKTsJT+DK7vzueV3nGMK9YeVLCbjq8NwWyZReG+3ow8nGQopSJI7+58+itLwtfKGtJLjnhfm4heFpSh0oLafvgqr+yfiGSej0d2DKaVuD2687t7G.TkdxH5XUNzSdKxdUuJO3XWBoiCZxfdZl5WNGl1689LiOetLgGtaTCfs+oijGdJaBsX.bpY+qe8L9NzAVzS+zgDLzz90OtsUsJELTNPmqWmIFmwfcC6XPEmgbW2jpaDNXHH+wGLBRIkTHkA8l769KpswOa7+cUjRJoP2G4RIKqh2dtbz6CdG7NCuq7NGuMqxcj64ecWzl3OzuvZtOVvaNS1CPrc7I3EtiNSkK3easEGMtW+e7uyaGLjWZM76Sd7rrq3ooCQ+ELwxdrr3Ge8Wmu3AdfinEUAvUBIPOdoWhVe8WeTp3jvgb7m++NmafbwDSrUA38hF4YmZ14qfl+xOO+xN+B9hMecz3yv0QtI91Lyct6.HQR4JZIwWLypqf7uVdndm6kw09.+a9f2+ex.ZTLE9dYrx7W4q9ESfJQWu5K7OCFJjCp8kcsbgd.xc47k+ddQzJu7fr10tXJ8pW7Y29sGRvvo2gNvstxUpfgxgpd7UGG1bfkkE23mbiQ6xobKaI2A5eqsCra9p4tQ9qe16k2F9L9x8.T4tPeZVw+b3UNJbnlLz25KYAKXArfELe95ublLw+wMPGSFf7XO4TYZUGaC07ubVkCr+emcFDf5PaNc2E4d1H15SqqE.Yy11ZFXFdehTtx5lwL30ZUqB4ZWvlSmz0m9o45W3B4zz0tP4Rcuwcm.lAHQWIxWtouLZWNkeYqxbdC3bwEvdm2rYCGw6eMWV+m90refjujdwYbBzYwkiBGLvvtcra2N1s6.mdpLMpSWGO8a7jz0jfb+koxCc2uNqLyi7k1M8lc9mGAawP7tNJi2xvCIdnbC+45WgCEC9xLS9ja7F486W+B4ZWnpMsobiKYIjxi8X5ZWnbrI12IB.Y3KC1d5a+D9JGVJtLHo11eZeL.GXgL6e6vRGxds7IKLMfZR2u7FQQ+1eKZkiBGJZ1StK7.ipujL.o9d73i863fG1qtaycb420Rl4RV9NJmoFybIsC8yaOI3t7+OzNEssu6630aSaB8ZWvvfy8NtCt4kubcsKTAQ0huZEdBoG3GNvnb0T9kQBsh9kRB.GjE8oqibA.KxZMyfuMSf51Str5dhsfAUA304rQBs4l4Q5YkAfz+hmkWdooW3692QUZL0zN.ameZa+0YqKeV4rE94c.P7b50N9JB+P6jhoe+L+m3IXhctygbsKDeMqIC4y9Lt7W9k00tPEH22EbeXgEI5NQV4tVYD6394a7yo4uZywXTFG0+6hemKl+82+uiX0T3Ubz7qnKTYfzW7r3WyFvJCV4LVBYCzn9bwT6SvEStJFuNmsD4btkGftFO.oyW77iiUkc9iRvHglwkzba.ow7e+umCDxbFEfcNuov26EvSq3hZnVN.JJpEUkhxC2gGlXbDCdC3kcm0tYgotvHxwcZqcZ3Kvwtwy2SN6gEu0EGQpmHAOmQe3RpFPleKy5WxFyLVIybo4AbVz2NWyS3VSshQ3.fsS6B4Nu6yK+4bauyfmaxqm7.vVU4ht47m1orWzn4QdiukcUvzKYlKa4K9Wb+u3pIHP8FzMv4lTEmd1tXwxhe70dMdi111BWdsKfqDRf99VuEW0zlFwV0pFkJPIZqtUpt3MnWrYXia3StgHxw7la2MSSpZSNlayZ18Z3G2wOFQpmHB2Mjd1iZAjMe+r+E10O+YrB+fsVcEzwpchet8pvDN.1I4K4d4VZd9Ok29jGCezV7CXPbs514Etm1SR3m0NkGgAdo8lAcsCgq7x6FC8o9T1NPxW7ixXtty.Mtg+jZQUo3Xp8ep.4+QF5lNvlvavhd5aKI0tZ1Nl80LaNvCe.lyPlCi5hFEcpdcpb9EjmSN8t0apOP1+3mvr+zeFe3j11uKfpbR7J8UfBG.bTG56Cc8z..XCL9m+SYGA.L7PCGvyv69+dTt5NeVTCOYxNScqrmfUl5et8ga+YlLu6H6A0Re.PTH0hpRwUapYanRdpDts6FKrnquSWiXG6SyyoQ2ab24w5ziwtxbWE9Yac4UNqcWouMAH8Exaujb.2mK86bOsSpWn2vxxp78OsjRT9xLSl68bO7Su0aEx8U0y5rn+SZRpSjjPbWy4t3k+gWlDbm.Y5MSFbKGbginHRHm.4PROSRX2lc7F3OG4RcSptj58jZDqNB+LYOe5cvU9bqAKfXunmmOdzWPw9ph9vUwZjCxojBaQ0+ZvPAsn5O9iJXPJR+2d7eoy0qyjo2LIdWwy6s52iw7siIhbrCXEfTdqTHfY.b6v8Qr1GYZUd6pVxFUs88iy1F.IRJ8q3ubYD5dRjiiBZQ0IzoNUzsn5rmsZQU435KG1WRKpVKHKeYQ7thmm8ae1HxwsOSsOrhctBh2Y7jQdYPk7ToBuu.lANFOxxlBl0ty+Z4pxcg91rS9OE6U3fbLs+0udF+Edgrnm9owJXvi39Nq92+7aQ0t28nT0Ikk3zlSl2vlG1Mri2fd4f4dP5yT6SX67.32zO22WbeLmMLGpjmJQV9yhA07Aw4Vqysvso7W3fO1xb9DREnF8nublmBcPiBGjhlkEK6Ue07aQ0e7Ha2O2IlH88sdKFzG+wpEUkSHUKtpQ8pT8veP+3vlC9rM7YzoI1ILKgWTZ7Y5i98d8iwtjwRBtRfzxKM5R86Bu+U99z3J23B2tflAOF6kxJ7yASMU9icsM9kO++xnmxt.iyhA2mFhqi+C9npbzR1sTRIqcsK9ja3FBoSjf7aQ098Nui5DI4j1Ju0URGFeGXM6YMDqqXYwotX51j5FewP+hRjk0aeA8wY9xmIolVpX2lcxxeVbVIeVL2gNW.n4Uq4EtsArJOLxg73WF6v3+6G+y.15Mz6idVqSs0sLMxA4HrtYLCdsV1xhtEU+G+C0hpxorDbk.q51VE86r5GY6KaRxSRLuMMOh+eFOCaFC6jd+FzJHe9l9bp0KVK1RZaACCCBXFf1Vy1xhttEgKa4+9nacMZcgOlxGSqjapUqOKhC.O0hy6ZGC+6QzzS4qIK0JqBfZQUI5nOuWeXVqeVjn6DIfY.xweNbUs3p38Fv6cBservhEl5B4Jl5UPFdy.KrHdWwiMa1H8GN8iXa2et6mpNl7mNTON7PtOVtkXOeJOQibPTKpJQMexf+DFbKFL9C5mb7mCI3IAd+079jzykDC5iFTwZeL+sLep9yWc5xD6BY3MCbYO+QHjnmD4pawUGx1WkXpBWPsu.ba2MmesO+RzmOkmnQNTAloe+rvQOZ9lm4YBoSjhul0j99Vuk5DIIhvmoO5zD5DKc6Kk3cEOlVlji+bHVmwhK6tvxxBKrvWPeDuq34f4cPLMMKrSmLLL.KvocmXfAyZHyhKsAW5Q83sgCrAl8FlMCrYCjZkPshTOMKSQgCUPs+0udl10dsgzIRP9snZudi2PchjDQ42zO8cp8kEs0EU34hnf0BIKKKBRPx1a1X2lcrv5HBGbZyI9M8S0huZLo9MI5VC6Vz7oR4BJbnhFKKV1q8Z7kO3CFxhkm6DSjtO1wpEKOIp6J+vqjue6eOXk+4SvBK1S16gj7jDGLmChKGtv.iBaE0jiKYlR+mBct9cNJW4kenvgJPTKpJkksmr2C+iu4ePmpWmX.m0.h1kS4dJbnBh0MiYvrtoahb129Nha2lSmbQO4SRGe3GVedNKhTHcQvULrgO6yX5CaXj6AN.XyF1c3.Ca1vvtcb51M06htHFzG+wQ6xrHoVTUD4jgF4PQvLP.V5XGKK7odJ7kc142IOFFfkUHgCXZh+byEmwFK1b4hp2hVvvm27vlqSkKb8RFa669Nl9PGJGbSa5HuCCCN2a+1oaO+yiiXhI5TbhHkpovgCmkEK9YdFV7XFCdSOcr4zIVllXYZhgMaXELHNiIFr6xEF1sSf7xC+4jCtSLQLrYif97g+bxAGtcS0acqYXe0Wgq3iOh+zvzueVvnFEK9Ye1hrEUuhILAZzkcYQ75RDorCENbHy+QeT9gW+0IuCdPr6zIVVVXFLHFFFXykKhuZUiqZFyfZ1l1bDOtO7ptJ11hWLAxKOx8.G.2Ij.lll3O6ro5srkLhu66hnAD6acqioOzgVzsn5.F.850ec0hphHGWJb.3SuoahkOtwgMmNgCEJXylMRt4Mmg9EeAwU8pWr1Oe98bOrpoLExYu6E2Ij.dyLSb3xE0uKcggL24FdeRnVTUDoDTE9vgMOu4wj5V2vtKWDHu7vvgCpdyaNC8q9pS52g8meu2Ke+XGKtSLQLCD.+4jC0uKcgg+0ecIb0mur10tXliXD76yYNgbemdG5.8eRShJ0fFDVN1hHkOUgMbHPd4wReoWhk9RuDYtychqDR.S+94g129vYbm7e5IUf4b22M+7Dl.dyLSbmXh3Mqrn9ctyk3ADqa5SmYcy2bQ1hpcYTihN7POjZQUQjSXUHCGrBFjULtwwW+3ON4ru8gcWtvLP.5vC8PbwOyyThdrlZu5E+1rmM1c5DLMIw5Wet4ksL7ToJc7evGCpEUEQBmpPFN7Ge+2yT5cuIm8uebEWbfkEW+27MTi+xIatjxj5V2XqKZQDzmOvlMpT8qO+se+2Oo2epEUEQB2pvsjc+GKYILwt1Ux8fGDaNbfgc6b6qd0gsfA.F5W7Ezzq3JvxxBCKKRaSahzSM0S38ioe+70O9iyD5TmBIXH9ZVSt14LGt7W9kUvfHxorJTibvxzjmuZUibOvAvvv.2IlHCdFyf504Hyh00yjPBDHu7vLP.pRiZDi36+9h8I8VsnpHRjTEpQNj0t2c9ACjePwk+xubDKX.ft9zOMVllX2sa1+F2Hue+6+w+AYYwxd0Wk2rcsKjfA2IlH88sdKFzG8QJXPDoDUEl0Vof4lKStacCrrvQLwPLm1oQKGxPhn0v4e22MdyHCl+HGIN83gcUDiB3voVTUDIZob2HG17W+0L269tC4cYO4dzC1yZVCtSLQ7mWdz4QMpnR80om3IHlJUIvlM7katLyq65JxsacSe57ZsrkgDLXyoSt3+4+jqegKTAChHgMk6NmCiopUkXpbkAfaZoKEOm1ogYf.7BUqZDvqW7mSNz968doau3KF0pwob4WNaXNyAWwGO9yNa54q9pzta8VATKpJhT5P4tQNXytcNvF1.GXCafYcnWvcEu4aRtG7fXYYg63iOpFL.v07oeJI2rlgurxB6tbwhe1mEH+VT80acqCMXvvfy8NtCtkkubELHhDQTtKbnNm+4W3W+qe3GxVl+7YAO4ShggAAxMWpVqZUTr5NDa135V3BAf.d8R5acq70O5ipVTUDoTixcSqz5l9zOht.pxMtwbfC6BN6A2ydH1jSNZTZgXLUspjWZoExxpcANqAL.58a7FDSUpRDtxDQpnqb2HGpWm5T9ev7bHEDL3Jt3nR0stkZBFvxhp2pVUjACtSLQ56Dl.C5i9HELHhDUTtKbHlpTERn10Nja2W1YSc5PGXmKe4grH0Eok0N2IuaO6IaY9yOj6qtcribqqbkz5iRWLIhHQBk6lVI.l9PGJqZxS93tcU+rOa58a9lT6y67h.UU9NZqhp.jPMpA2612tVEUEQh5J2MxA.NqhyUdLf+bxge48e+vb0jOeYlIybDif2u+8uHCFrY2N4kYlJXPDoTgxkgCG94cvoGO4ecObXmGhBTklzDZyHFQXud1129s75st0rxILgi7NLL37ty6DOIkDtRHAbmPBg8ZQDQJNJWFNDSUpBUqEs..7enOam4vl8r52ktvfm4L4pm0rH4l27vVcT3pnZm67QsEU6w+8+RdYjA4kd5j6AOXXqVDQjSDkaWakZzkdoXEH.6a8qO+E6NWtnECdvbA2y8DVWdtKv9V25XZW60xNW9xC49BoEUOTvkoe+g85RDQJNJWNxA.Z4PFBYricPCujKgTdzGk6YKagq3se6vevfkEK6UdEdy10tPBFNZsnZrUoJ3HlXvxzju6Edgva8IhHECkK6VoBDzqWLrYCaNcFQNdYsycxLuganHWEUqaG6H86cdmhbwxaBctyr0EsHr61MIU6ZycswMFIJWQD4npbc3PjzQqEUs4zIcYTihN7POzQsSj7kYl7LIlX9auCG7DZ5kDQhxJ2dNGhT7kYlLm69tCsSj3PqhpSdxTy111i49vUBIfyXiE.b3wSXoNEQjSDJb3Tv191ukoOrgERmHggAm2cbGboiYLm3KVdEQK2JhHQZJb3jfoe+rfQMJV7y9rgr1HEeMqIWwDl.M5xtrSn8o+bxA.B5yWIVcJhHmrT3vIn8s10xzF5PKxVTsYW4URud8W+jZwxygKW4++0xxsHRo.Jbn3xxhk8puJe4C8PE9t7Kf6DSjt+RuzozhkmM2ty++enPBQDIZRgCECYsycxLGwH32m6bC49paG6H8aRShJU+5exe.rrvWlYB.AxM2S98iHhTBQgCGGqcZSiO8VtkhtEUG8noCO3CdpuX4YXfsCsOrenQPHhHQSJb3nvaFYvbum6oHaQ0jaVyneSZRG2VTs35aGyXvLXPbmPB3L93KQ1mhHxoBENTDBKsn5wvR+2+avv.uYlI0sicrDa+JhHmrzUH8gwzueVvS9jr3m64J5VTchSjF0stUhebG0gcsM7+kYl3RidPDIJSib3PBWsnZwgmjRB.bDarJXPDoTAENDlaQ0imMOu4QdYjA1c5DMDNQjRKpPGND1aQ0hgO6VuUvxhf97Q0ZYKCqGKQDo3pBa3PDoEUKFReqaEaNchYf.zuINwv9wSDQJNpvENDIaQ0hC6wDC1AbFSLj7g9nMUDQh1pPENDoaQ0imsrvEh2zSGLLHPd4EwNthHxwSYhvgfd8RP+9Oo6jmnUKpd77I2vMT3WWkF23H9wWDQNZJSDN742+8Sf7xi9LtwcB+Xilsn5wjoIomZpX2oSBFH.Ww67NQ9ZPDQNJJ0GNrtoOcV1q7J.vY16dyY129V7dfGpEU+hG7ACYwrychIRO9O+GN6gO7R5xs3UZllLoK8RwLP.7jTRDabwEQOOGhHxwisncAbrj1V1BybDinvu+Stoahr10tNtOtr14NYx8nGL667NCIXntojB25O+yQsfA.9hG3AXKKbgX2iGxK8z4L6cuiZ0hHhTTJ0FNDzmO9nAOXxKszJ71xYu6M+4o+Xrher1O9i40ZUqXie9meD2tcWt3helmgqa9yOresKbLYYwpe22E.BlWdTuN0I54q+5Qu5QDQJBkZCG95G6w3OV5RC412vrmM+XQ7hodyHCl4HFAevUdkgbsKjbyZF2vRVBc7QdjHx0tvwxu9QeDYum8fUvfXXXvv9xuLpVOhHRQoT4Bu2F9rOioz6deTGgfyXika4m9IpxYbF.42hpSanCkz17lOxMzvfy6NuStzm64JU7wu4NV1x385aeIyctSr6xEwV4Jy8sycFsKKQDIDk5BGxX6am2nMsIj28+eUsN2ykqeAKfE9zOMe6XFSHsnZB0pVz2ILgnRKpVT7kUV7pMu4j911F1c4Brr3F9tuiZ1t1EsKMQDIDkpBGrBFjI1ktvV+luoXs8wWyZRVEw67Np1hpEASe93+1zlRFaaa.fcOdXHyblTut10nbkIhHEsRUsx57+6+8hcv.PHctTztEUKJl97w36XGyeJuLLvc7wyE9fOnBFDQJUqTyHG1zW8UL4t28PldniGaNchoe+T2TRg98NuSzsSj9K7kQF7FsssbfMtQ7ToJQdokFm8vGNWgVf8DQJkqTQ2Jk0t1ESenC8DNX.xeownVmy4bJ0hpK+MeSdkl1TdtJWYdmtzEvz7jZ+b3xXaai+24cdbvMuYLrYi7RKMZ2sbKJXPDoLgnd3fUvfL8gNzh0E21QyN9wej0OqYcR+3Ww3FGVACRPe9XyKXA71W7EeRuuxYe6iW+rOaFaCZ.6a8qGGtciC2to0CaXzKc8LHhTFQTObXwO6yxl9pu5Td+Lqa9lOoCX5vC8PDzue7mc13oRUhsrfEv+Lt33cu7KuXOJhb1yd30O6ylWnF0fcupUgMGNvYbwg+7xiK39tO56a+1mT0lHhDMDUOmCa8a9FlXW5xI0zI8W4viG5xnGMW3C9fmz6iOn+8m0N8oi6DR.KSS7kc13viGb3xEU8rNKF5W8UGwJC6NW9x486W+HicrCvxBKSSb3wC1c5DuYlIwUspQGejGgK3du2S4mehHRjTTKbHm8sOdi1zFxX6a+jdejPspEMom8jynm8jFdoWJNiM1S455iu5qlMN6YStYjAtSLQvv.Ke9vWt4hgc6XytcB52+QbA5YXyV92mSmDHmbHtjSlK3u82niO9ieJWOhHRzPzIbvxhoz6dyF9rO6D6wYXPsZW63L5Uu3L5UuxekL0vHrThyb3CmMNu4Qv7xib1+9wcBIPP+9wxz7HBGJnaobmTR3J1XoiO7Cy4c22cXolDQjHknR3v287OOe4C8PEqs0YbwQCujKI+.gd1Shul0LLWcgZgiZTr723MHfWuXELHA75EyCMUXwVkpvUL9wSit7KOhWWhHR3RDOb3OV5RYBcpSDzmui51jT8pGmQO6ImQu6M0+htHb3wSDrBEQDIhdERmWZowGM3AGRvfgMaT6y+74L6cuoI8rmT8V0pHYYIhHxeQDMbXliXDj1V1B.3NojnQcqabF8pWzjdzChM4jijkhHhHGCQrvgk8JuB6Y0qlK3dtGNid0KpaJoj+pSpHhHk5DwNmCos4MSkZPChDGJQDQNEUpYg2SDQjROJVKeF48aiiqMkTHkTRggOwMxQd5jCxt9r6mKMkTHkTFJia84EVJTQDQhbJVgCdNiqk+90k+TBsoI7rLss5uv6KvNlE+y+0OPdXvYbyihgdlpsSEQjx5JlK7ddnIC4I35aHf453MGymwNC.3e6Lim9k3m7C1awcxeevMD2gypUDQjHhh+pxpmlvPdhafFB3+meEdw4sC1xzeZd4UG.b0Vt2mn+TWmguBUDQjHmSvSHsW13DuEttwuQvYxTI+6kzHFZ+iNYdldTMrG9pSQDQhfNA+7bvMM5ZFI2TS.7uWRCH9N+H7vWlBFDQjxSNw+v9wUso8WXcJ7aqViqOID0+HCRDQjRRmvurt2M9d7Oe6+7yfgMM9QyT2n2RzhRDQjnqSrvAu+NS8oFG+NPRW5iwicoIArQF2nmJ+txGDQjxMNABGxiMLkmhwuQf36BO3c1M51c9fz43.1z34od2Mft72DQjxGJ1gC4sg2km5s1DPrzg6+uQJU1F1pbJb226EfGfMMgQy6tAEOHhHkGT7BGx62XxiZhrY.2m6cy81kpdnGnMR9Rtetq13DXKLwQMY9MkOHhHk4ULBGxi0OoQyamJfyyl67A5FU+v6aU60fd7f2JMyFPpuMidRqWSujHhTFmVUVEQDID5JTPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDIDJbPDQjPnvAQDQBgBGDQDID++.8gfO0QZLGDC.....IUjSD4pPfIH" ],
					"embed" : 1,
					"forceaspect" : 1,
					"id" : "obj-18",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 387.0, 203.0, 100.0, 97.442451 ],
					"pic" : "/Users/kylestewart/Desktop/main-qimg-1c6b0ecacab9c7ba93762882626889a1.png",
					"presentation" : 1,
					"presentation_rect" : [ 241.0, 6.778774, 100.0, 97.442451 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 337.0, 333.0, 253.0, 22.0 ],
					"style" : "",
					"text" : "unpack f f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1397.0, 687.0, 116.0, 22.0 ],
					"style" : "",
					"text" : "scale 0. 1023. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"comment" : "Photo Resistor - CV~",
					"id" : "obj-160",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1397.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-159",
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1397.0, 513.0, 20.0, 140.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 182.0, 49.0, 20.0, 58.0 ],
					"size" : 1023.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1266.0, 513.0, 119.0, 22.0 ],
					"style" : "",
					"text" : "scale 0 1023 0. 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1266.0, 687.0, 109.0, 22.0 ],
					"style" : "",
					"text" : "scale 0. 127. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1135.0, 687.0, 109.0, 22.0 ],
					"style" : "",
					"text" : "scale 0. 127. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1135.0, 513.0, 119.0, 22.0 ],
					"style" : "",
					"text" : "scale 0 1023 0. 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-144",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 1135.0, 430.0, 543.0, 22.0 ],
					"style" : "",
					"text" : "OSC-route /0 /1 /2 /3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 938.0, 513.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 180.5, 0.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 867.0, 513.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.833328, 0.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 796.0, 513.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.166664, 0.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 725.0, 513.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 0.0, 24.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 725.0, 430.0, 374.0, 22.0 ],
					"style" : "",
					"text" : "OSC-route /0 /1 /2 /3 /4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 337.0, 128.0, 1204.0, 22.0 ],
					"style" : "",
					"text" : "OSC-route /imu /digital /analog /battery"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 571.0, 661.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 571.0, 619.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "scale -1. 1. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 453.0, 661.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 453.0, 619.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "scale -1. 1. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 337.0, 661.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.0, 619.0, 100.0, 22.0 ],
					"style" : "",
					"text" : "scale -1. 1. -5. 5."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1266.0, 725.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 1135.0, 725.0, 33.0, 22.0 ],
					"style" : "",
					"text" : "sig~"
				}

			}
, 			{
				"box" : 				{
					"comment" : "Pot 2 - CV~",
					"id" : "obj-81",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1266.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "Pot 1 - CV~",
					"id" : "obj-80",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1135.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "Button 3",
					"id" : "obj-79",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 938.0, 860.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "Button 2",
					"id" : "obj-78",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 867.0, 860.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "Button 1",
					"id" : "obj-77",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 796.0, 860.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "Button 0",
					"id" : "obj-76",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 860.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "z - CV~",
					"id" : "obj-75",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 571.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "y - CV~",
					"id" : "obj-74",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 453.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"comment" : "x - CV~",
					"id" : "obj-73",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 337.0, 770.5, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1282.0, 606.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.5, 91.0, 40.0, 20.0 ],
					"style" : "",
					"text" : "POT2"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-71",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1282.0, 564.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.5, 49.0, 40.0, 40.0 ],
					"size" : 127.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1158.0, 606.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 91.0, 40.0, 20.0 ],
					"style" : "",
					"text" : "POT1"
				}

			}
, 			{
				"box" : 				{
					"floatoutput" : 1,
					"id" : "obj-63",
					"maxclass" : "dial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1158.0, 564.0, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 49.0, 40.0, 40.0 ],
					"size" : 127.0,
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 938.0, 539.0, 23.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 180.5, 27.0, 23.0, 20.0 ],
					"style" : "",
					"text" : "B3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 867.0, 539.0, 23.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 151.333328, 27.0, 23.0, 20.0 ],
					"style" : "",
					"text" : "B2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 796.0, 539.0, 23.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 122.166664, 27.0, 23.0, 20.0 ],
					"style" : "",
					"text" : "B1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 539.0, 23.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 93.0, 27.0, 23.0, 20.0 ],
					"style" : "",
					"text" : "B0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 621.0, 514.0, 43.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 85.0, 35.0, 20.0 ],
					"style" : "",
					"text" : "roll"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-8",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 571.0, 513.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 84.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 571.0, 430.0, 107.0, 22.0 ],
					"style" : "",
					"text" : "scale -90 90 -1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 503.0, 514.0, 50.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 61.0, 35.0, 20.0 ],
					"style" : "",
					"text" : "pitch"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-5",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 453.0, 513.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 60.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 453.0, 430.0, 107.0, 22.0 ],
					"style" : "",
					"text" : "scale -90 90 -1. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 387.0, 514.0, 42.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 50.0, 37.0, 35.0, 20.0 ],
					"style" : "",
					"text" : "yaw"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-17",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 337.0, 513.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 36.0, 50.0, 22.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.0, 430.0, 103.0, 22.0 ],
					"style" : "",
					"text" : "scale 0 192 -1. 1."
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 28.0, 702.0, 128.0, 128.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 347.0, 111.0 ],
					"proportion" : 0.39,
					"style" : ""
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-13", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-13", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-13", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-13", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-133", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-133", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-141", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-133", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-133", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-144", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 1,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"order" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "OSC-route.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "buttonBlue",
				"default" : 				{
					"bgcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "buttonPurple",
				"default" : 				{
					"bgcolor" : [ 0.372549, 0.196078, 0.486275, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "default_style",
				"newobj" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ]
				}
,
				"button" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"color" : [ 0.960784, 0.827451, 0.156863, 1.0 ]
				}
,
				"toggle" : 				{
					"bgcolor" : [ 0.636487, 0.648652, 0.683149, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 1
			}
, 			{
				"name" : "default_style-1",
				"newobj" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ]
				}
,
				"button" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"color" : [ 0.960784, 0.827451, 0.156863, 1.0 ]
				}
,
				"toggle" : 				{
					"bgcolor" : [ 0.636487, 0.648652, 0.683149, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "master_style",
				"newobj" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ]
				}
,
				"attrui" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ]
				}
,
				"message" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"umenu" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"ezadc~" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"elementcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"function" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"ezdac~" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"elementcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"button" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"color" : [ 1.0, 0.95051, 0.0, 1.0 ]
				}
,
				"toggle" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"multislider" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"slider" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.461105, 0.492646, 0.591878, 1.0 ]
				}
,
				"kslider" : 				{
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"gain~" : 				{
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 1.0, 0.861448, 0.16921, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 1
			}
, 			{
				"name" : "master_style-1",
				"newobj" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"accentcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ]
				}
,
				"attrui" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ]
				}
,
				"message" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0.0
					}

				}
,
				"umenu" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
						"color2" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"ezadc~" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"elementcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"function" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"ezdac~" : 				{
					"bgcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"elementcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"button" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"elementcolor" : [ 0.786675, 0.801885, 0.845022, 1.0 ],
					"color" : [ 1.0, 0.95051, 0.0, 1.0 ]
				}
,
				"toggle" : 				{
					"bgcolor" : [ 0.682032, 0.698052, 0.748716, 1.0 ],
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"multislider" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ]
				}
,
				"slider" : 				{
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 0.461105, 0.492646, 0.591878, 1.0 ]
				}
,
				"kslider" : 				{
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"gain~" : 				{
					"elementcolor" : [ 0.65098, 0.666667, 0.662745, 1.0 ],
					"color" : [ 1.0, 0.861448, 0.16921, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "messageGreen-1",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.165741, 0.364658, 0.14032, 0.74 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "messagegold",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.764706, 0.592157, 0.101961, 0.74 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "minimal",
				"default" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patchlinecolor" : [ 0.65, 0.65, 0.65, 0.9 ],
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.65098, 0.65098, 0.65098, 1.0 ],
						"color1" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.99,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.878431, 0.878431, 0.858824, 1.0 ],
					"accentcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"elementcolor" : [ 0.32549, 0.345098, 0.372549, 0.44 ],
					"color" : [ 0.345098, 0.513725, 0.572549, 0.78 ],
					"selectioncolor" : [ 0.862745, 0.741176, 0.137255, 0.7 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "multisliderBlue&Yellow",
				"default" : 				{
					"bgcolor" : [ 0.317647, 0.654902, 0.976471, 0.79 ],
					"color" : [ 0.960784, 0.867826, 0.084811, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-2",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-3",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-4",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-5",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-1",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-2",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-3",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBrown-4",
				"default" : 				{
					"accentcolor" : [ 0.654902, 0.572549, 0.376471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjCyan-1",
				"default" : 				{
					"accentcolor" : [ 0.029546, 0.773327, 0.821113, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-2",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-3",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-4",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-5",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjMagenta-1",
				"default" : 				{
					"accentcolor" : [ 0.840663, 0.060168, 0.769195, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-2",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-3",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-4",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-5",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-6",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberB-1",
				"default" : 				{
					"accentcolor" : [ 0.011765, 0.396078, 0.752941, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberG-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-1",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-2",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-3",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-4",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberGold-5",
				"default" : 				{
					"accentcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "numberR-1",
				"default" : 				{
					"accentcolor" : [ 0.784314, 0.145098, 0.023529, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "panelViolet",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.372549, 0.196078, 0.486275, 0.2 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "rsliderGold",
				"default" : 				{
					"bgcolor" : [ 0.764706, 0.592157, 0.101961, 1.0 ],
					"color" : [ 0.646639, 0.821777, 0.854593, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "texteditGold",
				"default" : 				{
					"textcolor_inverse" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.764706, 0.592157, 0.101961, 0.68 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
