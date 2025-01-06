{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 34.0, 87.0, 1575.0, 959.0 ],
		"openinpresentation" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"fontsize" : 10.0,
					"id" : "obj-248",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 940.0, 665.587314039468765, 121.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 187.25, 847.5, 90.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_alert"
						}

					}
,
					"text" : "数据开关在右下角",
					"textcolor" : [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-247",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 979.662715956568718, 370.000000715255737, 76.0, 25.0 ],
					"text" : "r 喜好度开关"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-237",
					"int" : 1,
					"maxclass" : "gswitch2",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 979.662715956568718, 397.000000715255737, 39.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-218",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1113.762717708945274, 832.800012409687042, 43.0, 22.0 ],
					"text" : "print rr"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 1.0, 0.349019607843137, 0.372549019607843, 1.0 ],
					"id" : "obj-210",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 357.600005328655243, 1296.499999701976776, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 844.285625219345093, 316.0, 81.754176467657089, 20.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_record"
						}
,
						"textoncolor" : 						{
							"expression" : "themecolor.live_arranger_grid_tiles"
						}

					}
,
					"text" : "使用说明",
					"textoncolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-206",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 8.00000011920929, 1296.499999701976776, 449.606323063373566, 35.0 ],
					"text" : ";\rmax launchbrowser https://github.com/8rian6/BrainLinkPro4MaxMSP"
				}

			}
, 			{
				"box" : 				{
					"code" : "// Set the number of inlets and outlets\ninlets = 3; // x, y, z axes\noutlets = 3; // x, y, z outputs\n\n// Initialize arrays to store the last angle values\nlet lastValues = [null, null, null];\n\n// Handle float messages (though in this case, input is integers)\nfunction msg_float(val) {\n    process_value(val);\n}\n\n// Handle integer messages\nfunction msg_int(val) {\n    process_value(val);\n}\n\n// Core processing function\nfunction process_value(val) {\n    // Determine which axis we're processing (x, y, or z)\n    let axis = inlet;\n\n    // If it's not the first value, normalize it\n    if (lastValues[axis] !== null) {\n        val = normalize_to_nearest(lastValues[axis], val);\n    }\n\n    // Store the current value as the last value for this axis\n    lastValues[axis] = val;\n\n    // Output the processed value to the corresponding outlet\n    outlet(axis, val);\n}\n\n// Normalization function to find the nearest equivalent angle\nfunction normalize_to_nearest(previous, current) {\n    // Calculate the difference\n    let diff = current - previous;\n\n    // Adjust to ensure the angle is as close as possible\n    if (diff > 180) {\n        current -= 360;\n    } else if (diff < -180) {\n        current += 360;\n    }\n\n    return current;\n}",
					"filename" : "none",
					"fontface" : 0,
					"fontname" : "<Monospaced>",
					"fontsize" : 12.0,
					"id" : "obj-173",
					"maxclass" : "v8.codebox",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 852.261921837925911, 76.25, 194.5, 20.75 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-168",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 857.762713894248009, 1089.600016236305237, 59.333335101604462, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 298.0, 829.5, 76.984128177165985, 20.0 ],
					"text" : "RMSSD:"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-169",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 933.762715026736259, 1088.000016212463379, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 388.5, 828.5, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 933.762715026736259, 848.800012648105621, 24.0, 22.0 ],
					"text" : "r rr"
				}

			}
, 			{
				"box" : 				{
					"code" : "// Set inlets and outlets\ninlets = 2; // Inlet 0: RR values, Inlet 1: Reset/Control\noutlets = 3; // Outlet 0: RMSSD, Outlet 1: HR, Outlet 2: SDNN\n\n// Initialize variables\nlet rr_values = [];\nlet max_window_size = 300; // Max RR intervals for calculation\nlet min_rr = 600; // Minimum valid RR interval\nlet max_rr = 1200; // Maximum valid RR interval\n\n// Function to handle incoming RR intervals\nfunction list() {\n    for (let i = 0; i < arguments.length; i++) {\n        let rr = arguments[i];\n\n        // Filter abnormal RR values\n        if (rr < min_rr || rr > max_rr) {\n            post(\"Filtered RR value: \" + rr + \"\\n\");\n            continue; // Skip invalid values\n        }\n\n        // Add valid RR interval to the sliding window\n        rr_values.push(rr);\n\n        // Remove oldest value if window size exceeds limit\n        if (rr_values.length > max_window_size) {\n            rr_values.shift();\n        }\n    }\n\n    // Perform calculations if sufficient data exists\n    if (rr_values.length > 1) {\n        calculate_rmssd();\n        calculate_hr();\n        calculate_sdnn();\n    }\n}\n\n// Function to handle control inputs\nfunction anything() {\n    if (inlet === 1) {\n        // Reset RR values\n        rr_values = [];\n        post(\"RR values reset.\\n\");\n    }\n}\n\n// Function to calculate RMSSD\nfunction calculate_rmssd() {\n    let sum_of_squares = 0;\n\n    for (let i = 1; i < rr_values.length; i++) {\n        let diff = rr_values[i] - rr_values[i - 1];\n        sum_of_squares += diff * diff;\n    }\n\n    let rmssd = Math.sqrt(sum_of_squares / (rr_values.length - 1));\n    outlet(0, rmssd); // Output RMSSD\n}\n\n// Function to calculate HR\nfunction calculate_hr() {\n    let latest_rr = rr_values[rr_values.length - 1];\n    let hr = Math.round(60000 / latest_rr); // Convert RR interval to BPM\n    outlet(1, hr); // Output HR\n}\n\n// Function to calculate SDNN\nfunction calculate_sdnn() {\n    let mean_rr = rr_values.reduce((a, b) => a + b) / rr_values.length;\n    let variance = rr_values.reduce((sum, rr) => sum + Math.pow(rr - mean_rr, 2), 0) / rr_values.length;\n    let sdnn = Math.sqrt(variance);\n    outlet(2, sdnn); // Output SDNN\n}",
					"filename" : "none",
					"fontface" : 0,
					"fontname" : "<Monospaced>",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "v8.codebox",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 934.562715038657188, 886.400013208389282, 340.0, 200.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"id" : "obj-246",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 996.162715956568718, 768.000011444091797, 83.333334624767303, 21.206349194049835 ],
					"presentation" : 1,
					"presentation_rect" : [ 454.5, 804.396825402975082, 83.333334624767303, 21.206349194049835 ],
					"saved_attribute_attributes" : 					{
						"textoncolor" : 						{
							"expression" : "themecolor.live_play"
						}

					}
,
					"text" : "重置HRV数据",
					"textoncolor" : [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-245",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 996.162715956568718, 790.400011777877808, 43.0, 22.0 ],
					"text" : "zlclear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-241",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 857.762713894248009, 816.800012171268463, 76.984128177165985, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 298.0, 805.0, 76.984128177165985, 20.0 ],
					"text" : "SDDN:"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-238",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 933.762715026736259, 816.800012171268463, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 388.5, 804.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
					"id" : "obj-231",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 933.762715026736259, 720.800010740756989, 24.0, 22.0 ],
					"text" : "r rr"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-226",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 933.762715026736259, 766.400011420249939, 43.0, 22.0 ],
					"text" : "zl.sum"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-221",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 933.762715026736259, 744.800011098384857, 81.0, 22.0 ],
					"text" : "zl.stream 300"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-220",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 933.762715026736259, 792.000011801719666, 39.0, 22.0 ],
					"text" : "/ 300."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-201",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1114.562717720866203, 1169.600017428398132, 78.0, 25.0 ],
					"text" : "s 喜好度开关"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-199",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 965.162713453173637, 524.587314039468765, 76.0, 25.0 ],
					"text" : "r 喜好度开关"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-198",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 965.162713453173637, 550.587314039468765, 34.0, 22.0 ],
					"text" : "sel 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-197",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 905.162713453173637, 550.587314039468765, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-190",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 905.162713453173637, 576.587314039468765, 70.0, 25.0 ],
					"text" : "set 未开启"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-158",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1027.761921837925911, 28.5, 22.0, 22.0 ],
					"text" : "r z"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 940.011921837925911, 28.5, 22.0, 22.0 ],
					"text" : "r y"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 853.011921837925911, 28.5, 22.0, 22.0 ],
					"text" : "r x"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-138",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1174.761921837925911, 237.0, 150.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 559.64999932050705, 378.156593406593402, 91.200001358985901, 23.0 ],
					"text" : "三轴陀螺仪"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 10.0,
					"id" : "obj-129",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1174.761921837925911, 273.0, 127.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 641.0, 379.656593406593402, 147.0, 20.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_alert"
						}

					}
,
					"text" : "数据开关在右下角↘",
					"textcolor" : [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-213",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.800000071525574, 1262.89999920129776, 452.755929529666901, 34.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 128.800001919269562, 890.0, 434.0, 34.0 ],
					"text" : "👇For additional information, documentation, or troubleshooting, please visit:👇\n https://github.com/8rian6/BrainLinkPro4MaxMsp"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-192",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1183.5, 657.587314039468765, 99.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 578.85000067949295, 843.550000488758087, 95.0, 23.0 ],
					"text" : "更多传感器"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-176",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 567.400009214878082, 1291.299999535083771, 151.0, 25.0 ],
					"text" : "prepend set 当前硬件版本:"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 15.0,
					"id" : "obj-175",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 567.400009214878082, 1322.5, 184.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 693.0, 912.800012230873108, 234.0, 27.0 ],
					"text" : "当前硬件版本: 4.201",
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-171",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1030.562716469168663, 1098.400016367435455, 198.400002956390381, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 291.0, 847.5, 182.5, 23.0 ],
					"text" : "HRV（需累计300次心跳数据）"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-160",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 844.162713453173637, 664.087314039468765, 150.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.916655004024506, 846.0, 74.0, 23.0 ],
					"text" : "喜好度"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-156",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 834.162713453173637, 435.087314039468765, 40.0, 24.0 ],
					"text" : "set 💔"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 878.162713453173637, 525.587314039468765, 82.0, 22.0 ],
					"text" : "set ❤ ❤ ❤ ❤"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-152",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 867.162713453173637, 505.587314039468765, 67.0, 22.0 ],
					"text" : "set ❤ ❤ ❤"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-142",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 856.162713453173637, 481.587314039468765, 56.0, 22.0 ],
					"text" : "set ❤ ❤"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 30.0,
					"id" : "obj-140",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 845.0, 615.587314039468765, 216.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.0, 782.0, 142.5, 48.0 ],
					"saved_attribute_attributes" : 					{
						"textcolor" : 						{
							"expression" : "themecolor.live_value_bar2"
						}

					}
,
					"text" : "未开启",
					"textcolor" : [ 0.972549, 0.462745, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 845.162713453173637, 457.587314039468765, 39.0, 22.0 ],
					"text" : "set ❤"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 6,
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "" ],
					"patching_rect" : [ 834.162713453173637, 409.587314039468765, 74.0, 22.0 ],
					"text" : "sel 0 1 2 3 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 84.200008928775787, 265.800001502037048, 69.800000309944153, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 153.833337336778641, 266.00000923871994, 64.0, 23.0 ],
					"text" : "信号质量"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.600009918212891, 460.200004398822784, 69.200004935264587, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 153.833337336778641, 372.000011086463928, 58.0, 23.0 ],
					"text" : "电池续航"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-161",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 883.362714275717735, 1320.800019681453705, 432.700007617473602, 23.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 705.0, 873.800012230873108, 222.0, 37.0 ],
					"text" : "*为了兼顾功耗与表现，确保使用体验，存在不能同时开启所有/部分功能的逻辑",
					"textjustification" : 2
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-159",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1242.0, 584.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 664.25, 782.25, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-157",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 748.666688978672028, 343.500011801719666, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 290.000008642673492, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-155",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 748.666688978672028, 448.166681051254272, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 353.000010520219803, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 744.666688859462738, 243.000001907348633, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 233.000006943941116, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-150",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1235.5, 444.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 664.25, 812.25, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-214",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1003.362716063857079, 1245.600018560886383, 35.0, 22.0 ],
					"text" : "set 0"
				}

			}
, 			{
				"box" : 				{
					"align" : 2,
					"id" : "obj-189",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1190.562718853354454, 1248.00001859664917, 115.5, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 776.25, 846.0, 115.5, 20.0 ],
					"text" : "陀螺仪（未开启）",
					"textjustification" : 2,
					"texton" : "陀螺仪（已开启）"
				}

			}
, 			{
				"box" : 				{
					"align" : 2,
					"id" : "obj-185",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1190.562718853354454, 1224.80001825094223, 115.5, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 776.25, 824.0, 115.5, 20.0 ],
					"text" : "Raw值（未开启）",
					"textjustification" : 2,
					"texton" : "Raw值（已开启）"
				}

			}
, 			{
				"box" : 				{
					"align" : 2,
					"id" : "obj-183",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1190.562718853354454, 1203.200017929077148, 115.5, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 776.25, 802.0, 115.5, 20.0 ],
					"text" : "咬牙（未开启）",
					"textjustification" : 2,
					"texton" : "咬牙（已开启）"
				}

			}
, 			{
				"box" : 				{
					"align" : 2,
					"id" : "obj-182",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1190.562718853354454, 1180.800017595291138, 115.5, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 776.25, 779.0, 115.5, 20.0 ],
					"text" : "喜好度（未开启）",
					"textjustification" : 2,
					"texton" : "喜好度（已开启）"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-180",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1012.162716194987297, 1196.000017821788788, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-181",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1012.162716194987297, 1172.000017464160919, 34.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-179",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1077.762717172503471, 1196.000017821788788, 29.5, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-177",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1077.762717172503471, 1172.000017464160919, 34.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-162",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 950.562715277075768, 1245.600018560886383, 50.0, 22.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1022.562716349959373, 1276.800019025802612, 157.0, 22.0 ],
					"text" : "sprintf \\\"B01:%d%d%d%d\\;\\\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1022.562716349959373, 1300.000019371509552, 140.0, 22.0 ],
					"text" : "udpsend localhost 11124"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 709.333354473114014, 408.166679859161377, 79.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 329.000009804964066, 79.0, 22.0 ],
					"text" : "OSC-route /z"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-124",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 709.333354473114014, 384.16667914390564, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 709.333354473114014, 448.166681051254272, 24.0, 22.0 ],
					"text" : "s z"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 710.666687846183777, 303.50001060962677, 79.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 266.000007927417755, 79.0, 22.0 ],
					"text" : "OSC-route /y"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 710.666687846183777, 279.500009894371033, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 710.666687846183777, 343.500011801719666, 24.0, 22.0 ],
					"text" : "s y"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 710.666687846183777, 203.000000715255737, 79.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 758.333355933427811, 213.000006347894669, 79.0, 22.0 ],
					"text" : "OSC-route /x"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 710.666687846183777, 179.0, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 710.666687846183777, 243.000001907348633, 24.0, 22.0 ],
					"text" : "s x"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 566.600009202957153, 1268.89999920129776, 128.0, 22.0 ],
					"text" : "OSC-route /hwVersion"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 566.600009202957153, 1245.69999885559082, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1183.5, 404.0, 99.0, 22.0 ],
					"text" : "OSC-route /temp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1183.5, 380.0, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1184.0, 544.0, 99.0, 22.0 ],
					"text" : "OSC-route /grind"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1184.0, 520.0, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1148.162718221545219, 792.000011801719666, 50.0, 22.0 ],
					"text" : "980"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-114",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1082.562717244029045, 752.000011205673218, 105.0, 22.0 ],
					"text" : "OSC-route /hrvMs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1082.562717244029045, 728.000010848045349, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.0, 0.980392156862745, 0.63921568627451, 1.0 ],
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1082.562717244029045, 792.000011801719666, 35.0, 22.0 ],
					"saved_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_play"
						}

					}
,
					"saved_newobj_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_play"
						}

					}
,
					"text" : "s rr"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1272.962720081210136, 788.80001175403595, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 388.5, 779.5, 50.0, 22.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1212.162719175219536, 748.000011146068573, 125.0, 22.0 ],
					"text" : "OSC-route /heartRate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1212.162719175219536, 722.400010764598846, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 834.162713453173637, 370.000000715255737, 103.0, 22.0 ],
					"text" : "OSC-route /fvrate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 834.162713453173637, 346.0, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 618.400009214878082, 737.600010991096497, 135.0, 22.0 ],
					"text" : "OSC-route /midGamma"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 618.400009214878082, 713.600010633468628, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 618.400009214878082, 973.600014507770538, 133.0, 22.0 ],
					"text" : "OSC-route /lowGamma"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 618.400009214878082, 949.60001415014267, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 420.80000627040863, 737.600010991096497, 107.0, 22.0 ],
					"text" : "OSC-route /hiBeta"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.80000627040863, 713.600010633468628, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 420.80000627040863, 973.600014507770538, 107.0, 22.0 ],
					"text" : "OSC-route /loBeta"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.80000627040863, 949.60001415014267, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 222.40000331401825, 737.600010991096497, 126.0, 22.0 ],
					"text" : "OSC-route /highAlpha"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 222.40000331401825, 713.600010633468628, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 222.40000331401825, 970.400014460086823, 121.0, 22.0 ],
					"text" : "OSC-route /lowAlpha"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 222.40000331401825, 946.400014102458954, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 23.20000034570694, 970.400014460086823, 99.0, 22.0 ],
					"text" : "OSC-route /theta"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 23.20000034570694, 946.400014102458954, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 24.000000357627869, 737.600010991096497, 99.0, 22.0 ],
					"text" : "OSC-route /delta"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 24.000000357627869, 713.600010633468628, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 406.600013732910156, 546.012715429067612, 121.399994134902954, 35.0 ],
					"text" : "OSC-route /meditation"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 406.600013732910156, 522.012715071439743, 95.799993753433228, 35.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 26.600008070468903, 546.012715429067612, 112.599994003772736, 35.0 ],
					"text" : "OSC-route /attention"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 26.600008070468903, 522.012715071439743, 95.799993753433228, 35.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 117.800009429454803, 403.400003552436829, 120.0, 22.0 ],
					"text" : "OSC-route /battery%"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 117.800009429454803, 379.40000319480896, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 80.200008869171143, 326.600002408027649, 141.0, 22.0 ],
					"text" : "OSC-route /signalQuality"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.200008869171143, 302.60000205039978, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-205",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 576.200016260147095, 554.012715548276901, 43.799992978572845, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 14.400000214576721, 80.000001192092896, 710.500011801719666, 74.0 ],
					"presentation" : 1,
					"presentation_linecount" : 5,
					"presentation_rect" : [ 134.25, 97.0, 666.0, 74.0 ],
					"text" : "a real-time visualization tool designed for the Macrotellect BrainLink Pro Brain-Computer Interface (BCI) sensor. It receives and displays multiple types of brainwave data, including Alpha, Beta, and Gamma waves, as well as feedback from gravity sensors. When connected with a custom app, the patch captures real-time data from BrainLink Pro, organizing it into key metrics such as battery life, signal quality, eye blinks, attention&meditation. This patch is ideal for testing and demonstrating sensor indicators, supporting brainwave research and interactive multimedia projects."
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 48.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 14.400000214576721, 12.000000178813934, 710.500011801719666, 60.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.25, 35.0, 663.0, 60.0 ],
					"text" : "BrainLink Pro for MaxMSP"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1027.761921837925911, 99.0, 29.5, 22.0 ],
					"text" : "* 1"
				}

			}
, 			{
				"box" : 				{
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"contdata" : 1,
					"hint" : "Lithium Battery: 3.7V 300mAh\n\t•\tStandby Time: 6 hours\n\t•\tContinuous Use: Approximately 4 hours\n\t•\tCharging: 5VDC / 500mA–1000mA\n\t•\tCharging Time: 1 hour\n\t•\tLow Battery Self-Detection: Vibration alert",
					"id" : "obj-240",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.800009429454803, 453.800004303455353, 29.0, 47.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.333337336778641, 310.00000923871994, 29.0, 62.0 ],
					"setminmax" : [ 0.0, 100.0 ],
					"setstyle" : 1,
					"slidercolor" : [ 0.13327893614769, 0.992504596710205, 0.999038994312286, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-236",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 940.5, 99.0, 29.5, 22.0 ],
					"text" : "* -1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-234",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 1027.761921837925911, 145.0, 40.0, 22.0 ],
					"text" : "line"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-235",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1027.761921837925911, 124.0, 71.0, 22.0 ],
					"text" : "pack 0. 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-232",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 940.5, 145.0, 40.0, 22.0 ],
					"text" : "line"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-233",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 940.5, 124.0, 71.0, 22.0 ],
					"text" : "pack 0. 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-229",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 852.761921837925911, 145.0, 40.0, 22.0 ],
					"text" : "line"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-228",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 852.761921837925911, 124.0, 71.0, 22.0 ],
					"text" : "pack 0. 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-212",
					"maxclass" : "textbutton",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 865.761921837925911, 275.0, 167.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 564.333350151777267, 356.00001060962677, 167.0, 20.0 ],
					"text" : "3D追踪预览",
					"textcolor" : [ 0.850980392156863, 0.709803921568627, 0.709803921568627, 1.0 ],
					"texton" : "3D追踪预览...",
					"textoncolor" : [ 0.0, 0.886274509803922, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-208",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 852.761921837925911, 99.0, 29.5, 22.0 ],
					"text" : "* 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-200",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.761921837925911, 179.0, 48.0, 22.0 ],
					"text" : "pak f f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-196",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.800009429454803, 428.200003921985626, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-184",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.761921837925911, 203.0, 105.0, 22.0 ],
					"text" : "prepend rotatexyz"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-186",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 860.761921837925911, 228.0, 209.0, 22.0 ],
					"text" : "jit.gl.model duckWorld @file duck.dae"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-187",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 1148.761921837925911, 48.0, 187.333337038755417, 156.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 554.333349853754044, 199.000005930662155, 187.333337038755417, 156.0 ],
					"sync" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-188",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_gl_texture", "bang", "" ],
					"patching_rect" : [ 865.761921837925911, 298.0, 366.0, 22.0 ],
					"text" : "jit.world duckWorld @floating 0 @position 0 0 -2 @output_texture 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-151",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 603.0, 396.416663199663162, 51.333334863185883, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 454.333346873521805, 372.000011086463928, 48.333285719156265, 23.0 ],
					"text" : "灵敏度"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-12"
					}
,
					"patching_rect" : [ 617.600009202957153, 787.200011730194092, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-148",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-14"
					}
,
					"patching_rect" : [ 420.000006258487701, 788.80001175403595, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-16"
					}
,
					"patching_rect" : [ 221.600003302097321, 787.200011730194092, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-18"
					}
,
					"patching_rect" : [ 24.000000357627869, 787.200011730194092, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-20"
					}
,
					"patching_rect" : [ 24.000000357627869, 1021.600015223026276, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-144",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-22"
					}
,
					"patching_rect" : [ 221.600003302097321, 1021.600015223026276, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-24"
					}
,
					"patching_rect" : [ 420.000006258487701, 1024.000015258789062, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 603.0, 261.416663199663162, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 291.0, 311.416663199663162, 110.0, 22.0 ],
					"text" : "scale 50 80 0. 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 106.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 358.0, 613.0, 54.0, 22.0 ],
									"text" : "$1 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 358.0, 639.0, 40.0, 22.0 ],
									"text" : "line"
								}

							}
, 							{
								"box" : 								{
									"comment" : "down rate (smaller sharper)",
									"id" : "obj-9",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 773.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "up rate (smaller sharper)",
									"id" : "obj-8",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 715.0, 506.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 258.666655999999989, 588.0, 62.0, 22.0 ],
									"text" : "slide 1. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 699.666625999999951, 214.333327999999995, 92.0, 22.0 ],
									"text" : "loadmess 4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 216.666655999999989, 224.0, 72.0, 22.0 ],
									"text" : "loadmess 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 553.0, 119.0, 22.0 ],
									"text" : "scale 0 4096 0. 127."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 734.0, 63.0, 24.0, 24.0 ],
									"svg" : ""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 704.0, 105.0, 71.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 672.0, 141.0, 88.0, 22.0 ],
									"text" : "random 10000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 157.166655999999989, 266.0, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 54.25, 485.0, 93.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 54.25, 206.333327999999995, 92.5, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 54.25, 272.333312999999976, 92.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 54.25, 156.333344000000011, 92.5, 22.0 ],
									"text" : "< 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.25, 310.0, 62.5, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 148.166655999999989, 389.110869999999977, 42.0, 22.0 ],
									"text" : "* 1.01"
								}

							}
, 							{
								"box" : 								{
									"comment" : "max",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 258.666655999999989, 645.610840000000053, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 589.0, 272.333312999999976, 24.0, 24.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 432.583344000000011, 449.110869999999977, 95.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 258.666655999999989, 60.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 432.583344000000011, 214.333327999999995, 106.833336000000003, 22.0 ],
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 432.583344000000011, 280.333312999999976, 106.833336000000003, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 432.583344000000011, 164.333344000000011, 106.833336000000003, 22.0 ],
									"text" : "> 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 489.416687000000024, 343.0, 50.0, 22.0 ],
									"text" : "4096"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 554.666687000000024, 396.110869999999977, 42.0, 22.0 ],
									"text" : "* 0.99"
								}

							}
, 							{
								"box" : 								{
									"comment" : "Input Wave Date ",
									"id" : "obj-62",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 258.666655999999989, 24.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"disabled" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"order" : 0,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 1,
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 1 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-31", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-31", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"order" : 1,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 3,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 0 ],
									"order" : 4,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"order" : 2,
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 0,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 2 ],
									"order" : 1,
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 1 ],
									"order" : 0,
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-46", 0 ],
									"source" : [ "obj-49", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 2,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 1 ],
									"order" : 0,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 1 ],
									"order" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 1,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 0,
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-49", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-51", 1 ],
									"order" : 1,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"order" : 0,
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 1 ],
									"order" : 1,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 1 ],
									"order" : 0,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"order" : 2,
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-73", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 1 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 2 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ],
						"originid" : "pat-26"
					}
,
					"patching_rect" : [ 617.600009202957153, 1021.600015223026276, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p dynamicDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1027.761921837925911, 52.25, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 940.011921837925911, 52.25, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 852.261921837925911, 52.25, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 291.0, 265.416663199663162, 25.0, 22.0 ],
					"text" : "iter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 8,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 10.400000154972076, 1177.600017547607422, 108.0, 22.0 ],
					"text" : "pak 0 0 0 0 0 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 603.0, 307.416663199663162, 29.5, 22.0 ],
					"text" : "10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-99",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 603.0, 287.416663199663162, 58.000005781650543, 18.000000596046448 ],
					"presentation" : 1,
					"presentation_rect" : [ 452.33334681391716, 352.00001049041748, 51.132990906582791, 18.0 ],
					"text" : "Default"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 544.0, 235.416663199663162, 118.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 419.333345830440521, 207.000006169080734, 118.0, 22.0 ],
					"text" : "OSC-route /eyeBlink"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 544.0, 261.416663199663162, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 544.0, 325.416663199663162, 34.0, 22.0 ],
					"text" : "sel 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 544.0, 297.416663199663162, 29.5, 22.0 ],
					"text" : ">="
				}

			}
, 			{
				"box" : 				{
					"cantchange" : 1,
					"id" : "obj-77",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 603.0, 370.416663199663162, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "dial",
					"min" : 10.0,
					"mode" : 3,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 603.0, 331.416663199663162, 40.0, 40.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 458.333346992731094, 310.00000923871994, 40.0, 40.0 ],
					"size" : 90.0
				}

			}
, 			{
				"box" : 				{
					"hint" : "",
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 291.0, 245.416663199663162, 158.0, 22.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 254.333340913057327, 202.000006020069122, 151.0, 35.0 ],
					"text" : "OSC-route /sensorDataRaw"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.972549019607843, 0.462745098039216, 0.501960784313725, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1212.162719175219536, 786.400011718273163, 42.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 298.4000044465065, 778.0, 76.584123730659485, 25.0 ],
					"saved_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_display_handle_two"
						}

					}
,
					"saved_newobj_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_display_handle_two"
						}

					}
,
					"text" : "s 心率"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.972549, 0.462745, 0.501961, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1183.5, 442.0, 42.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 578.85000067949295, 810.75, 72.0, 25.0 ],
					"saved_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_value_bar2"
						}

					}
,
					"saved_newobj_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_value_bar2"
						}

					}
,
					"text" : "s 额温"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.250980392156863, 0.203921568627451, 0.937254901960784, 1.0 ],
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1184.0, 584.0, 45.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 578.85000067949295, 779.549999535083771, 72.0, 25.0 ],
					"saved_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_midi_assignment"
						}

					}
,
					"saved_newobj_attribute_attributes" : 					{
						"color" : 						{
							"expression" : "themecolor.live_midi_assignment"
						}

					}
,
					"text" : "s 咬牙"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 544.0, 211.416663199663162, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 291.0, 221.416663199663162, 102.0, 22.0 ],
					"text" : "udpreceive 11123"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.094973266124725, 0.094973266124725, 0.094973266124725, 1.0 ],
					"id" : "obj-298",
					"maxclass" : "led",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offcolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
					"oncolor" : [ 0.960784, 0.827451, 0.156863, 1.0 ],
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 544.0, 353.416663199663162, 54.732697000000002, 54.732697000000002 ],
					"presentation" : 1,
					"presentation_rect" : [ 451.333346784114838, 236.000007033348083, 54.732697000000002, 54.732697000000002 ]
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-85",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 544.0, 430.416663199663162, 66.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 451.333346784114838, 289.333341956138611, 63.0, 23.0 ],
					"text" : "眨眼触发"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 291.0, 287.416663199663162, 154.0, 22.0 ],
					"text" : "scale -32768 32767 0. 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 539.0, 572.412715822458267, 127.0, 22.0 ],
					"text" : "scale 0 100 0. 127."
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.094973266124725, 0.094973266124725, 0.094973266124725, 1.0 ],
					"id" : "obj-11",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 291.0, 333.416663199663162, 244.0, 127.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 254.333340913057327, 239.000007122755051, 183.0, 154.0 ],
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 2,
					"slidercolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.200007975101471, 326.600002408027649, 31.0, 22.0 ],
					"text" : "200"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 20.200007975101471, 304.200002074241638, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"attr" : "slidercolor",
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 114.600009381771088, 225.000000894069672, 119.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 533.0, 394.0, 640.0, 480.0 ],
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 480.666626000000008, 220.5, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 445.916626000000008, 220.5, 29.5, 22.0 ],
									"text" : "1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 282.0, 113.0, 85.0, 22.0 ],
									"text" : "loadmess 100"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 206.0, 113.0, 89.0, 22.0 ],
									"text" : "loadmess 200."
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 99.666656000000003, 334.576294000000019, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 512.166625999999951, 136.0, 112.0, 22.0 ],
									"text" : "scale 0 100 0. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 390.166655999999989, 136.0, 112.0, 22.0 ],
									"text" : "scale 100 200 1. 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 390.166655999999989, 78.0, 141.0, 35.0 ],
									"text" : "if $i1 >100 then $i1 else out2 $i1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 119.666656000000003, 288.0, 40.0, 35.0 ],
									"text" : "1. 0. 0"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-40",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 390.166655999999989, 220.5, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-36",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 512.166625999999951, 220.5, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 390.166655999999989, 320.0, 140.999968999999993, 22.0 ],
									"text" : "pack 0. 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 78.666656000000003, 201.0, 51.0, 22.0 ],
									"text" : "$2 $1 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 112.0, 22.0 ],
									"text" : "scale 0 200 127. 0."
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-63",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 214.083327999999995, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-73",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 58.333328000000002, 334.576294000000019, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"order" : 1,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 1 ],
									"order" : 0,
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 1 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 1 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"order" : 0,
									"source" : [ "obj-53", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"order" : 1,
									"source" : [ "obj-53", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"order" : 1,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 0,
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-57", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"order" : 0,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 1,
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-53", 0 ],
									"order" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"order" : 1,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-73", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"originid" : "pat-28",
						"styles" : [ 							{
								"name" : "AudioStatus_Menu",
								"default" : 								{
									"bgfillcolor" : 									{
										"angle" : 270.0,
										"autogradient" : 0,
										"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
										"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
										"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
										"proportion" : 0.39,
										"type" : "color"
									}

								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjBlue-1",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
, 							{
								"name" : "newobjBlueNew",
								"default" : 								{
									"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
								}
,
								"parentstyle" : "newobjBlue",
								"multi" : 0
							}
, 							{
								"name" : "newobjYellow-1",
								"default" : 								{
									"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
									"fontsize" : [ 12.059008 ]
								}
,
								"parentstyle" : "",
								"multi" : 0
							}
 ]
					}
,
					"patching_rect" : [ 45.800008356571198, 201.800000548362732, 89.0, 22.0 ],
					"saved_object_attributes" : 					{
						"globalpatchername" : ""
					}
,
					"text" : "p ColorDisplay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.000012695789337, 552.412715524435043, 47.79999303817749, 35.0 ],
					"text" : "$1 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 730.600018560886383, 548.412715464830399, 47.79999303817749, 35.0 ],
					"text" : "$1 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 337.000012695789337, 576.412715882062912, 33.399992823600769, 22.0 ],
					"text" : "line"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 730.600018560886383, 572.412715822458267, 33.399992823600769, 22.0 ],
					"text" : "line"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 406.600013732910156, 694.012717634439468, 273.399996399879456, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 503.756097316741943, 280.0, 20.0 ],
					"text" : "Meditation"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 26.600008070468903, 694.012717634439468, 299.799996793270111, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.916655004024506, 503.756097316741943, 305.999969000000021, 20.0 ],
					"text" : "Attention"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 221.600003302097321, 763.200011372566223, 85.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 24.000000357627869, 763.200011372566223, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 420.000006258487701, 763.200011372566223, 92.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 617.600009202957153, 763.200011372566223, 86.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 617.600009202957153, 997.600014865398407, 86.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 420.000006258487701, 997.600014865398407, 92.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 221.600003302097321, 997.600014865398407, 85.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 24.000000357627869, 997.600014865398407, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 151.0, 564.412715703248978, 124.0, 22.0 ],
					"text" : "scale 0 100 0. 127."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 406.600013732910156, 572.412715822458267, 43.799992978572845, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 26.600008070468903, 572.412715822458267, 43.799992978572845, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-56",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 406.600013732910156, 600.800008952617645, 404.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 409.756097316741943, 394.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_freeze_color"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.262745098039216, 0.568627450980392, 0.901960784313726, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"hint" : "",
					"id" : "obj-55",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 26.600008070468903, 600.800008952617645, 369.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.5, 410.0, 394.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_key_assignment"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 1.0, 0.392156862745098, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.000000357627869, 908.800013542175293, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.25, 628.0, 150.0, 20.0 ],
					"text" : "Δ"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-43",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 24.000000357627869, 812.800012111663818, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.25, 532.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.792779207229614, 0.800495266914368, 0.817696988582611, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 24.000000357627869, 1144.000017046928406, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.25, 748.0, 150.0, 20.0 ],
					"text" : "θ"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-46",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 24.000000357627869, 1048.000015616416931, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.25, 652.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_lcd_control_fg"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.600003302097321, 1144.000017046928406, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 332.25, 748.0, 150.0, 20.0 ],
					"text" : "Low α"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-50",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 221.600003302097321, 1048.000015616416931, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 332.25, 652.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_arc"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.594473705410263, 0.720560630419913, 0.928309050695498, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 221.600003302097321, 908.800013542175293, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 332.25, 628.0, 150.0, 20.0 ],
					"text" : "\bHigh α"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 221.600003302097321, 812.800012111663818, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 332.25, 532.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_midi_assignment"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.250980392156863, 0.203921568627451, 0.937254901960784, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 420.000006258487701, 1144.000017046928406, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 748.0, 150.0, 20.0 ],
					"text" : "Low β"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-21",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 420.000006258487701, 1048.000015616416931, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 652.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_value_bar2"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.972549, 0.462745, 0.501961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 420.000006258487701, 908.800013542175293, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 628.0, 150.0, 20.0 ],
					"text" : "High β"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-25",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 420.000006258487701, 812.800012111663818, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 530.25, 532.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_alert"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 617.600009202957153, 1144.000017046928406, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 728.25, 748.0, 150.0, 20.0 ],
					"text" : "Low γ"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 617.600009202957153, 1048.000015616416931, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 728.25, 652.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_inactive_automation"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.668252052034861, 0.37753979111903, 0.316055506131883, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 617.600009202957153, 908.800013542175293, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 728.25, 628.0, 150.0, 20.0 ],
					"text" : "Mid γ"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 20.200007975101471, 384.200003266334534, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"compatibility" : 1,
					"id" : "obj-23",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 617.600009202957153, 812.800012111663818, 196.0, 92.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 728.25, 532.0, 196.0, 92.0 ],
					"saved_attribute_attributes" : 					{
						"bgcolor" : 						{
							"expression" : "themecolor.live_meter_bg"
						}
,
						"slidercolor" : 						{
							"expression" : "themecolor.live_scale_awareness"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 3,
					"slidercolor" : [ 0.745098, 0.596078, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"candicane2" : [ 0.145098, 0.203922, 0.356863, 1.0 ],
					"candicane3" : [ 0.290196, 0.411765, 0.713726, 1.0 ],
					"candicane4" : [ 0.439216, 0.619608, 0.070588, 1.0 ],
					"candicane5" : [ 0.584314, 0.827451, 0.431373, 1.0 ],
					"candicane6" : [ 0.733333, 0.035294, 0.788235, 1.0 ],
					"candicane7" : [ 0.878431, 0.243137, 0.145098, 1.0 ],
					"candicane8" : [ 0.027451, 0.447059, 0.501961, 1.0 ],
					"contdata" : 1,
					"hint" : "",
					"id" : "obj-2",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 45.800008356571198, 237.000001072883606, 29.0, 62.0 ],
					"peakcolor" : [ 0.498039, 0.498039, 0.498039, 1.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 168.333337336778641, 202.00000923871994, 29.0, 62.0 ],
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 1,
					"slidercolor" : [ 1.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.180392156862745, 0.180392156862745, 0.180392156862745, 0.0 ],
					"id" : "obj-113",
					"ignoreclick" : 1,
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 23.20000034570694, 1202.0, 542.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.0, 35.0, 791.0, 905.0 ],
					"saved_attribute_attributes" : 					{
						"slidercolor" : 						{
							"expression" : "themecolor.live_surface_frame_focus"
						}

					}
,
					"setminmax" : [ 0.0, 127.0 ],
					"setstyle" : 2,
					"size" : 8,
					"slidercolor" : [ 0.431372549019608, 0.431372549019608, 0.431372549019608, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"data" : [ 21476, "png", "IBkSG0fBZn....PCIgDQRA..BfM..DvHHX.....BtYmP....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cu1khhDCF.NEhbSP9++yDQQ.Ap8C8FlXYwMEsU62myYN61c6E.YlNDRkPD.............................................................................................................................................................vfT+1a......7rjmmqkecRRBh8Ad5b9s2.......fuIt+1a......rlLyZMKNN9Uuo.+QgaSB....7UfCrdr.oaZZnsa2h3efmJThH....vGqgxV8PbcwMuGd9vUvA....eDxxxzNN+javttNJMMUc4xEMmQ51119e9XTJEh+AdpvkwA....eThhhnMa1ntb4htooo+6WWWSAAA+haY.7CDfM....7VIKKSSDQxrQysWOOOu9uOm45ymOqCCCUgggpKWtnmpLPzZsFYwFdlP.1....vuNyZoNHHfbbb5ClVq0ZhH5vgCjmm2MOesVq655n4ThHDQjrzR.XsgE4H....7qx1BUz000Zvx62u+pZnNOOW655RcccDQ+Ta1H6zvuMbBH....7RHWjhbIeb5zIcTTzhdcLCf9zoS5ff.ZylM8eeNi2CAsqO3YBYvF....d4pppzDQztc6TkkkK54p0ZMWm1DQ8YuVZprXi10G.....vGsrrLsDGfMQ+TOzKk74SzOYw1Lq0UUUi9Z7p12g+dvsFA....dJlpuTyYYdt8uZSccczlMaTUUUZtls4R+HKKS655RSU9IndsgmAThH....vpaIAMKqc5kvwwgxxxz000D2OrcccoSmNos0oQ.3UAEfD....b2Ne97M8rZY60aLb+nVVO0KgsE6XTTDEEEQMMMTQQwjuFbOz9dd+AXHH.a....3g7HSOwppJccc8CuMb5zoqFvLtttjqqKUWWasuYKeb.r1vUrA....yF2p8bbbnttNxyyaz.XmBWdGKsU8QzsYv11BWrttlpqqo333Y+5.viBW1F....LKbIXHCHkKQjGw8r.GI51QddYYo0roOUF1wnSGVaXQNB....i5zoS51119.oW6VbWPPPellWadddnLPfWNDfM....rXx9PssA8xbIKuj6IS1mNcpe63YDfN.2CDfM...veDWtb4tx77tc6TNNNWUmzdddqdlrum.r4x+HKKCslO3sABvF...3KjsIVH2qnuGJkRMTlpu2ZndMecRSSUORFrwjcDVSH.a...fuLlAKtFiF7ymOqsEf8iDztDOEFU+u497jaSoooJkRoJKK6+Y7e.3UBAXC...7g674y5ppJ84ym0mOeVe3vAqOtGYfpDFFprsXA4102ixwwg1tc6h29r8b3LY633PEEE8e8TY39dKgF.LgkUK...vGHsVq655HNasrwlhhZsVWWWS9992DTpbPsX6mSzOYDtoo4pEl38z+pMYKi0GNbf1ue+hedD8uENo7me4xEqYfGfmAjAa...fOLl8dZNvXN35wpkYaYgtppRGEEM4PigesOd7X+2iKoigxZ9XFqbPLeerYnxdg2GkGmJJJlrbVP.3vZAAXC...7gxwwoOfXOOu9.fGJH4ttNxwwgxxxzmNcRe5zIcddtlqSYN.zgBbUoTp555GZwHd73Q53wiSN8DSRRT2y6SVVlVVhHbP1AAAS1OrQWHAVKnDQ....9vwANJyjsolllqpW411VM+3JKKoiGOR62uuOH7gDEEYMSuSEL78LoDmS.1sss5Ma1z+Zmllpxyy0kkk8WrgLHa.dEPFrA...9vDFF12oLl6TJz7wYFjLWuySkEay.v4fWSRRTEEEyZaYHlKxvvvvIa8dNNNV2VcccIWW29E43byNMZWevZ.AXC...7GgL3w5559ZflCptnnf788USUazCQVlIRyo+Te5zIcSSyMA3dOkIhLXeNP6kPNkJA3df.rA...9CZ2tc8APykNwTKBv77bqYJlneBdm6k0LNK41xdbVVl9xkK8+Q93kla.1lAlyCdFGGmEGfM.OJDfM...vGjppJcUUk9d6+z1BRd61s8YwNKKq+maFzZRRhhH5pVCnqqa+iKJJ5p5btnnfNb3.000cSmOwyyqO6x7e3.wkYP9QVPkcccS1YTrAK1Q3QgKoC...3CxRB9iWXibP0ikIWdAPlkkM5TeToTJyRnfKmDsVq49Wcccce.4bmJoppRy8X6w1VjW3vb5G1Sge8lav5q0zoD96BYvF...3MWddtlyb8bd7bVi4fXSRRTtttTPP.EGGeUloMynMOtwaZZn4tnE0ZstssUqTJEmAaOOu9EsnsVtmsutttlpqquJK3ooo28zmzwwgNb3vMCimo355RsssnNrg6FBvF...3MGmI34j85xxRx00sOnx11VsVq0lsnt11VMWNHWtb4lrVyYz1V1rskI3xxRpppRK2Fqqq6KMDtWaO1qAOUHMWTj2a2IgKQjnnnEWpIxV+G.KEBvF...3CvbWnddddztc6T61sSMVOs1wwghiiIhnAyv6RFC5ddd2TS3xZxNMM8prXaN8Gk6elknw8VG1cccn2WC+JP.1....u4xxxzyMHyttt9x9Xprvd73Qpqqav.oaZZrF781saUKoievkPxbZWecccW0gSdDORu4F8Ca3Qf.rA...dysj1LGWq0SgCPNNNl3NRhsxDYnxRwLKyMMMS1USlpNrGaa8dW3gcccypObCvZBAXC...7laokHgqqKc97YcVVlVVFFlulQQQTSSyUAGq0ZM+b4ZztssUatXHMC3kCB9dZcfluNl1samZpEp3Xuuns6AuZn.9A...dyYt3AmKNnzgxnMmYWtiiXVGz7OOJJhrMYGub4hV9bTJkR983tBhbQFJecNc5j1V4oLzTjbnG+PO2683Fiayg28K.7mExfM...vaNeeeq077TBCCUgggpgJQBtzPbccuICv7fegaed1z000Ot04.a45ytqqi788UbcPqTJUQQwUCQlgxL8Psiv4jIaYYt7HCoF.dDXPy....7AXylMp6cg20zzXsLI555nvvv9Lz1111OtymSla4gFissUh9YwYJyL9tc6T1ljjlFJqymOedVYjlGnMOZ.1XDqC2KblC...vG.4HLetpppzbew1FyrVyAFyCHl4HOOW6551WJHx.ySSSUZsVWVV1OkG4d5MKLLTYqTNzZsVVtG4442zKuGxiVG3.7nv8NA...3Cv8jMUOOOZ+98WM3YjFJf0kT2wAAATPP.EEEQtttTUUU+hijGxLSEX7PYZVNMESRRFrTWrsMQz5LrXP65CtGH.a...fO.OR4N333PAAA2Dj8PKlvkfyVLeA.bP8mNcRalI4862O6W2555alfi999pktMy0Gt4jjbIVRF8AfHDfM...vGgwVrhykYP5qQ1YGp+T655RNNNCNkHYsssZaYm2yyibccsVZLC05AY1BBunnXxskgLz1A.CAAXC...7gXMVzclYwcnN1wbsa2NYiDoe7m644QAAACtfEyyy0mNcZzIToiiyhx5My1ENjjjL3PyYNvBdDVBDfM...vGhGoLQ31lmYFm877n11VcVV1MCSFh9oNpWRltMCh0balqqZN.7oXKazoooKtzV3Ei48ZtKvR.HBAXC...7wXpRiXH0008K3OakzAmoXyfiyyy0q8XF2wwgNe9rlKgjwL168T0SsYIcjjjr3dItLy7qwBlD96.2uC...fOD2aFXkANGDDPMMM27ZoTJkY4hvKNx5559xtvVFkkYGdpsQYu2dpLiGGGa86ykVRcc8fkfhYokjkkMZ4nvViE9I.HC1....eHlZRFd3vgAWHeZsVe5zI8PAWSzsCNlc61c0BqbnfO4.wCBBVzEAz00M3hjbL61sSc3vgAyhMOgIkeuzzzAWjnMMM8Yqdn2y77bqkPC.....vGtppJsI4OmqY5kZp22wZUcmNc5gdulZadn22777Uc+XNuOnk8AyAxfM...vGDtLGj0G7y38wrFlcbbFL3zc61s35aVJLLbzLye5zIquu1xV9TsSu4LDcxyy6GVNYYYZYopftIBLGH.a...fOHa2t8oDTsY1eM6TGEEEiFb4RBv1VllumESo464ZrfLyyy0wwwz986IsVqCBBvnWGVLTH+....e3jKNQOOuQW7eSYrf24Vr2PcTCN3z4PFvtuuu5xkKC1F8JKK6WXjlNe9rV1B8V5Eev0UcRRhhneJgjoxRcSSyhFm7veO39b....7A574y2rfE4fpezfrYWtbQKCjrrrjhhhnrrLsYFtyxxzKsWQyaeba6aHikA4vvPUUUk1bAZZhCjtqq6pryO2KHPBkIBLEb0W....efNe9rlngG.Jkkk20vQ43wi8YycozZstqqaVCDGacyjw7nkECWVJxWGYF2655nMa1nZaaQ67CdXnFrA...9.444MZFpu2o938jQW1gCGniGONqG6yL3ZyE5Hm85wZIfNNN8Ou0d35.+8f.rA...9.433LXPz+VKJuoFg4GOdbQaakkkKJ3ZtWUGGGeUP17EhX68V16vSSSUa1rQYajxaZNsDP3uKTDQ....eYV6.rub4hlWThAAACtHGI5m.+KKKo55ZxwwoOi3xROoppROV12Ob3vjAqKwSoQY12kSxQ9BQLeOkOGYf7mOedVkIhYMpC.CYvF...3KiqqKwiR7070rqqi555FruTKkllp3x.oqq6p551V4gH6q2iEbsbhJlkk0ObYrEvN+yjAAKGXLQQQ8O111Vcddt9zoSZOOu6tDa.fHDfM...vGoCGNL5OmCh8dBxVq0ZdQTxhhhnttNprrbzZ+NIIou7JBCCUblrYYYYZNC3KYX4HK+CtDP38w4DPr46g4imWblnmWCqAThH....eolaG8XNuNDccMVyspu77bsYWGQ90lsOO90Xrfp4LTaRVBHNNN8YUOHHfZZZtoyoLTvx76srig355R000TPP.xdM7vPcCA...7gZrA6RWWGc73QJJJ5t5ay0008AGyiHcYoVv0ormm2p1x5VxvpYNshPdaS95Z66cuP65CrAYvF...3C0XYZkKCCN33kRVFH1VHegggJyxH4dXls5kDv6Rxzrqqaeu2Vq0ZkRo3LsiNBBr1P.1....eg3fHWyWSacMittt658xVm+XolyjpTq0ZdTq+LBjVq0ZL5zASnHi....9Ekkkoaaauq.+1samh6gy1n0Z81samrmNO1yW90MMMW88BCCUkkkiN.WrIKKqewJ9JHGhLD8y9gL66SsfQAXoP.1....+h3gaxy502bpF9H3NRhLH6c61olpTMxyy0xsizzTE2x+dEbcco33XpqqiNb3P+BirssUWUUoumZT270G.Ib6L....dA3.4bbbtZgwkmmq877toaarjW2gJUBYoKb4xk6JPxttt954tppRSzOATVTTbU2BoppRatOv0WcRRRe4YvAoOmx63YnttlJKK66lIxOWtWxiQ.PDxfM...vSAODTNe9rlChlChybgG555R4445ppJ8bFhKy0ZjYUGGm9LV666q788Ux.taaa0b8TaJIIoO61xKpXMG.NKkuu+UCxl55Z53wi28qWSSCUTTrJaav2Cb0V....OIx9rrINfSNCzGOdjhiiuZjhOWikcZ46C26nuGxWGeeekVq0bq.jGPKdddTXX3Ua67jQb61sJdAARzuWYULzhwbnE.4T8Rb906zoS5c61g3p.hHzEQ....ta1BJSF.2bFzKboRvAodOAdtc6V0Tk.huuu5daYeRddd862lkEgs112tc6TbltI52sdk4OaFpanX6yphhBJHHXxsaLbZ.Ib1....vcXnLdJ6HHSEzkLfTtOMalA34ZnN4wZzZ5jKFQkRoFpDOr8845v9cJ.Tyfqyyy0NNN2bLjWLja2tcv8YItF0A384rc...f2XZCi8X4tlwXAUp0ZcPP.UVV1WdEOR1cG64xAxeuA4Z97Fq0.ZFjYRRxKsigLlgpuc49Gmk6ttNpnnnOX7oN1EFFpt2EpJ78AAXC...L.sVqaaamLfZSwwwTPPvnKdtllFpttl777n55ZpttlbbbnppJsVq0lS3vwjkkoe1AvJOFjllpTJ0MCtEt86YZNkJybn9eiEf+XFpFo2samRFLsRoTGOdjbccI9ye9BgLo0ZcUUklWjp20FF70AAXC...XPFT8RCLbIOdGGm9rAykm.WS1QQQK58crLXyAFtlsRtgt.fvvvap06fffG98SVhFKsLZZZZlLC5lAemllpBBB5+7br8AOOOJNNlbbbF73B72BVji...7mlYVX4LI+n3xE3zoSZaAK6551WNBYYYZy.3VRvvS0Gmku+1x778fCnuppRWVVRNNN8c+DyfY2rYiZrNpxbbuYsl660D8yEELUGZIOOWaKi6MMMidb17Bjf+1PFrA...DVq.j3xEXpwYNQ+jsTtDD555VbehdNuGZsVmkkoejI6nstPhiiCse+dJNNltb4hdnNUxi16q2ue+Uess1sGWBIxuWSSC433PQQQTbbLw8lb9maVW1IIIpzzTksw39XiD9sa2pl6hgD99gLXC..uo3EI2P8WXXYpppz000jqqKEFF9vYTcJdddTaaqdtYDWNYAumf7CCCUmOe9lLgyjYKewu3+Oa6GtttTYYI4551mU6g50zOaZsVWTTPJkp+yWYYdv777nrrLs7Xt4BT7vgC8k8AQ+qKuLj11VcYYIxfMPDgLXC..uExyyuYQswYcyLycv8iGzJYYY5WwnslCvyyy6pRbXr.0555F8mO062Z7XFRWWWeI0Hufuff.poogNd73fAWeu6Siw16EeAFbljss+533PbFp4KLv7BOLCL200suzWrM4FKKKmU+xF9a.mE...+h3fp4eYuVq000088eWoKWtnqqqGrSH.+iLijYYYZNSj+10IKWaukkkjsRPfn+URCWtbQWTTPxw58Td18ZZYciSz00ycPP.UTTXcHtr1FKK77mwgggiVq47EXwmKXdgr7f4QFvbTTzfcDE42Sq05eqr3CuGvG9..vKvPcV.YPVl+h6hhh9EmVSSSefWnW6dqwlnhYYYZYvSxNpAOtusEvzZ0Z4XbFU41xGGXmLPrppJM+YMmYUGGmaFLJCYro4XWWWePk4445gBveNZZZ52ljG6ksavgtPvGozbl6BzTtuNz6Geb2rrZLCLVVxN7Oy1wuiGOdUFrkGif+dPFrA.fWfoxVIG.f7Wt211p45.U9Kp4dxKpI6en0ZMGPJSVNBoooJYP1bvsZsVe73QJNNt+wKeMV6fqcbb5eu4WaNnaNimxKdpppRy0e+bsc61Aqs70b+w00kNe9r17bPWW2Iu.vG4BWla2OooooeMLLz6EewLb4svOVY1myyysVO7III2bblK+H.HB0fM..r535oV9mgdrkkkTccc+ufWZylMJaAHvKTurrLsbrb+Wf4zTjC3ZIA1vA30zzPwwwzgCGto9fu2VBmMMMMjuuuhakcRNNN8k6fYvi999JNn70ns5IMUqpaNpqquoTMj6OCY61spCGN7Tmri7EwL14E7ioqqiJKKu5b.YmPYnZG276y24A16vjqD98f.rA.fUDWuul+YHIIIpw5xDIII8seMNXZNXMYGN3ufkL.O3LQxOmzzTEG7STTT+hTSdrm+uqcogvA4wseuttt9uWccces+d73wa1GaZZVb8hO03Ym++ssP8VhgBdcNKJ2zzT0XS4x0Bmg84r.K4VjH+4ykKWz7EhUWWeSoi366q5555aMfooopsa2xeIFa5+wg6kA..rhRSSWb6eiWDa7zCToTJYKDiyfYWWW+Bey00kJJJ56quEEEe8K9wkjkZYqUiIynnsfVkelwOVyR34dwA1xYKme+CBBtIvs1119NbBmgUdQONmZ5csFjLSIJJh3yUMCp1VauSx1f0YswWXqRoTCMBycbbdnoa4ynyn.eG96j5C..3EYylMJkRMqLzICDhCh674yZWWWpppRmmmq49uKWJI62umBBBtZ57EDD7P823OAKMHWtSrTUU0ObUjAYKCB2rVZ41p2TSHw4PVtIbK6StM111dUo9TWW2e2JBCC6GbIqcIGra2N0ilE677bcZZ5MC2EtF2G54wGieU3rMa5Q2FJKK6GTM+EKYKXXH.a..3IQVdGioss8poqGunqH5mf+3ZEstt9pV2mYvh62umjSntuMSEnKe684ic7wLWWWJMMU466q1rYihKA.9mMTvdqU.f7qCufEMCpk2urcQ.DsrxbXNVyraGGGO3E1MTap6Udgfbc5mkkosc76QakdoooJ9hg4R1pppRKC5dnIaI7cCAXC..OQgggJyE+jzPkf.WZ.D8uIkG2mgkOFSbIQXN9m+F355RGNbXvet73Ae2CpqqI4cRHOOWKq05iGO1Og9LCrcoYttrrjJKKIkRorko7llFxbgNxedYVdJlaKJkRIuiESYt027ZUq4KInYYqm7UYnxQYMtXC4EASzOWPUTTDc5zIcPP.Vri+Qg.rA.fmrsa2Z81Sypqqojjj9GCmgUNn.kR02MIjAYMTqXqssUO0sn+Szby1nrk8kjjnFZPsra2NkbwOZVlHkkkzwiGGMPPkPXXnZrVmnmmGEDDb0cnPhqi4gtyGicwEllJv4mcVjG6N2rc6VE2ZDeEKzQhF9tQLmf7m5hUkuFb47PzOWHgstCD72.9TG..dA788uoNUI5eY+hnepcadAsEDDz2yjqppzgggp4zZ03fz4eo92VMgNUvJbln4.rs04Q3.h3eVccs0NpAeLWVCzbKciyT88teL0B1LIIQYFXGewSy40et0W8ZzK04KLPdA.Ss.F4xkYMxtq7hbV5ycpR3RdGOFhuuuR1UZLgdi8eSH.a..3ERoTJa+RXsVqqppr9KyaZZtp1pGJqabfkxRN4aK6YSs+355dUIVLzDZjnqyp4986sVlHD8SvpJkRsYyF0lMalLS0D8uKVZL19bTdWGLCLSdWNdTxr5ul8764h6w662u+gBxdoAUe73wqd+3tvykKWz1xp+b6W3bG7w77M9NNg5v9umuq+kW..3C.mMa9WzWVVRGNbnuyUvA5wKJuc61o777nKWtn4ZFdt9Fq+ywts9bsqyGi3tHxoSmzb1H4.v888Usss8sKNyfy+sYKi0KczaOmRfHLLbVKF2kZnViGQ+ThJ1JMmG0PAby8kZOOO53wi2joYWWWJNNlZaa0xs6KWtzWtUSUVMbobYCxh8eOH.a..3WxlMaTbMZxA2w+heydyKuPIssP2LyVKG3B2V+VaZs9WqcjIW7mCY+9880PMQ+aQmIaKe7wWa8.YtMK9naqSkEaa2Ii0VQQwrNG3YbmNlJvzmUPm19riuy.999p862aslr4+9nmmm0N5xb5a2XQMBLDfM..7KZ61sJtG8xsgOWW2qVXUYYYW04KFqaWnTp9oImuu+pOM43.UlyHw9YQdgHl3fI4frjGq3eVSSSeOKNKKS+akcwgBpkOFO0hicJ7h3z192yZAvZagXte+dJKKSKKyozzT0RVzlqgymOqyxxzicLk+6hb.3xOiFqsMd9749Le+sUVVv8A2yB..3MPRRhhGMylj0TssfkVirsZCGDVWWGsYyF06vBlLLLbvoxGQWe7ILLrehFxY+mKMDh9YAfZdGAV6rJyG2r84JmsywBHqqqizZs93wi8Yuet0Er70v16wbmLjygrltkS1QNXV937PSoxWANCzCsNGXxRLRd7YrKJILLTMUOnmmRqKc6F9LgKyB..dSv2N+tttqF64b4MHCdrtttu6Ir1aG7v4f+ZyROgYNdreU788UbI0LDsVeUFS4L+yks.ufRMufkW8s2epfK4ZxmCFOJJZw24fgdOL2WWqxIJMMseg71zzPEEEjqqK455dU2ZIII4gmjj1XqywvFpLOjGKF5NGnTJ0XKVwotPI3uEDfM..7lHMMUIGXED8S1.655tpzO3x+XMeu0BC8yWy2u0vbx7oLvFYqRjqQayE2Wbb7JuUde3i2ooo8stwjjD0lMa5Wvqy404xkK5gV.ixieO54SlmevG2888UIII8m2100cU4OwYi+dWjkluuSUBHCwyy6pETpsiGSUNQiUBI1p0e36FJQD..3MBG.nrLHVqaiuogJcAl4suuqqiNb3vUYt9271dKGnLLt9rkiB8555q52yJkRc97YssxS3YsuLzD6bNLedKo2Uym6L0m0xsy6slzkmKLTvl15807ywLXY42m6I71z11p4AVyibWU3t1BGLbUUkVFn8XAPSj8icxymP4g72BxfM..7FhWfhqclpI5mIS2X0wLyLfrff.qcwjeiE6H2GksUhAbYIvYidnxBv7tEv067yYK9ZKoVu2tcqpoo4lssop4WIaAW655d0q4y5B4jBCCUxxeRR197LCLcrrRy8S60njkLmlmR000TWW2fsePYYac3vADP8ebH.a..3KUaaql+Sddd+vzPlQTaip5gF3JD89TKobo.vAOykX.WJEbc.yaulAEwGCjYb7YsX61rYihG.PLOOO5vgCyNPaaSlytttYOYGe0A6wYANKKavxNhkkkoqppzAAA8YIdrxU5Uwww4pyaRSSUa1rYvK5UdgCxE8I72DBvF..9RwAQxAh533PoooJ9VYOzhWbrN6v6z.ynqqqOC1xrTKC5jCXy7166551W1FuBxrvxY4bpfvjAXJGJK7cLX2tcp4Vauys1jGZxWtzKrJKKSaVNQCw00k777rdt0uUqfjn+cgQ.bOP.1..vW.4hTrss8pNnA2wM3rUKG417ziTZrZM0V.X+VcSD9hGjKfN96e5zI8PkFRaaql6nHkkk2D73qbrVOU.b71Rccc+ESLUs.aSZZp0N1gYlssMbbZZZV7hPbIYvcrKxw00kNe9r9d1mA32DBvF..9PMTm+vww4l5N1yyquSIHylouuuJNNlNdb7zTWq...H.jDQAQ0n0gDx6JN3XYfbx.0LqUbyANC+XCBBrN1rel3VH3oSmlbgGx+7jjDkiiCoTJkqq6hyr6PO90tLLjudyMH6o5LGuxdksIz8Of6EBvF..9vvSgvk973xDY+988Ytk67CcccOTKp6UWur15jF1pmbliiCo0ZM215jAb+aD7lrdiMIGw871sVq6yhKuXDmyBUU99MTGWYr9FMuMX6BQli4zq1mJC1uZuCCTI3yGBvF..dio0ZsYW+fWrU2auClnqaWZmNcR+tz+mWByIZ3T6C7D5iq2WNfQaANtjNzw8hqCbSdddV+9bajqppRy0R+bYVu4MMMzwiGoxxxImLjKMH2kD3OQSmkXactlmEkRM65ZGfwfSh..f2XZsV2zzP000jY6Mat813oTVVRdddTcc8fszt43vgC+ZcOANnNyrBOV4EvK1ygdLOiNug4mYC02ok0StItlnW5HSmnqOeZrwtts6HwbWzh26wseitFhrrnPm+.VS3jI..3MvkKWrNk33rT1zzbUYQb974AWDe+l9M68uUUUydwvM1fKg8JBvdt3EoJGDHGn7b6c0lW.B2JFGqOqaKf2hhhIyn78bbKKKS+pVrrn+TCuBnDQ..feYYYY5gpuUtWMy0hK+8QWU3V999iNPRj+L93GW21bqnS9XdFYT0VW5XN3Vr3899xCsH98lKUlkXNK1v55Zh665K40doWzwbpGbdek+uX3u.uRH.a..3Eyr9dmS8zx0aM211F5wuj5x8Y32ruESzOAvNTsoyAwYFblRoTxEU36pSmNc0w16YA.Zt+sjKhnqqiBCCGcQKxSGymccS644021Bs84MWK0x+KJAD3U588eIA..9hz11p41ylsNfgMcccTSSi0flk2Ze4OWN7U9M7a0SrkBCCG8BVjKhPtFj888UuyAWSzOK1ONH60rkJN2frMa0gD8SvsxQbNaoGKSRRr1mtGC+dXNULQVpg2AXDEA..u.bv.1BtNOOWy0XqYmvPFHsYcpVVVRAAA8k1fiiSeGxv1hmiyz26XsaulxyysVO6r555aB.boc9hGwlMaT2a4mzzzPYYYZtOfysYw47bGprMr87G5NQjmmq4EDKmQa9w+JKaIDDM7t689x0A.fOTyoWUyCaj33XqY7y76wAMxkXRXXnhmHgxd.siii0rdy8B46oFfe2wY1MKKazE+osw98PAG9LK2l68yfzzTUZZpRVOzUUU5ymOqmp0BJOeRIL22aOOOJNN9pKnStcY1GxW5EQLmrde73QDbM7Q.AXC..OAooop5559gDBGrlLnCGGGZ2tc8i4ay.LLCjX2tcJNq0b4lHmHgR1BjjHpeAS9sIHHne.gL19G28LlS8K+aLjSlKGGm98SWWWJHHXx6Lwtc6TyM.0zzTkRotInYhn96ZhssISKoehO04kJkRcOslP.9M788uxB..uIlJ.MY4evYkTxVF.Mm.gx13mr9q2sa2U0gL2AEtmLWtT+F8y3Ma1n1rYihGBO1dLb19MW.doooOzP642f7yVGGm95Odp6ZxZDfZQQA433b0hK774yZaKrwkjodeeeksEf5y97U.dFP.1..vShL.a4++PY0KIIwZFCkjYojyhYccc+jILHHnOCk9998Am7p6fB+1cSjgVDflKNOI9hS3KV4Y5daWe7cDw7h2ZZZnCGNr52chgd8hhhHWW2955dnrmuz8Q9hNQP0vmNDfM..7Drz9.7PLyFrr29tc6V0lMaTtttjuuuJLLbQi4YN.lhhhul5xlu3Ea2Q.GGGZ61spCGNzWK5ZsV211p4EsGQ+q6sPzzYD9QbuAYSD0uXVkeMuvGe1hhhnMa1n7775yH9Pc.j6IfeDXM7M.AXC..OAxfe3QSMe6uGqVYs0txjAYWTTPkkkjLP5kDTsMyY.h7IHOOWGDDP4445rrrAmXhoooJ4DPjKsD9yrlll9iGMMMq1EKsVFp154t6wZd2CFZTsa9y30R.GbLet9yteXCv6p22UvA..7AKLLTo0ZsbjbK69B1ZuZmNcROTvtUUUZeeekqq6pt36dVAW+p6G1xtGRbbbeVPMGM4sssZ9BRjcgCeeeE+4jYlg+sGdOlbbbFbQFte+9UMCvgggpymOeUmYw00ktb4xfsGPkRo3AhDQzhZkf.7s3yOkE..vaJyfJjKFMh9IXuKWtnqppzYYY5nnn9IgmIN3uc61cU1WeTbmLYsd89svSCSYWx3zoS2jEaYcWy07tmmG011pKJJtpd14.qeGO9XKn+WQsiybccGs2gKuHEDbM7WDBvF..dRr0ekkYBjaWblAEI+5mYWTHKKSyKFP43BmH6ie5k5U2MQBCCupMtwskNIyLqyABxCoGFu.R+MmJliQdWQX79xq53trK3X5vgC8ctlWw1B.uavI9..e0LC13U9K7Oc5j0VWFQ+qbQbcc62lzZs9vgCzyriev0maZZZ+zDje+qpp5uf.aSBx6wyd+YNF6bfKWtz2QNjGG3.raZZHOOum54MlkwxZXs2d4xDQVRQH3Y.FFpAa.fuRxfE+sLV.p1BR4YEvhbQuwYvkGO6NNN80fr747NOjUdTmNcRyk8AWRHRkkkTTTTev0eKcXkGAW227wFDbM.i668eAE.3OG4BXiCZhm7g+FFKH0mYlcM6hD1VvgwwwzwiGo3339EsF+yjsotlllGpSP7pWrirrrLcZZpxVG0v7ykhhhq1GMuvrgVTpqkMa1nVirX+rC5soo4srdzA3cDBvF.3izkKWzkkkWUGyxrwxYeTxbJw8rc73waBv7YGDTVVldrfZ4EuGe7Rlc1llFprrjhiiWzHE+cz986Gr85444QZsVe73QJJJp+7B9bJaWP16ZFaKJJdIA8NV8VC....eAzZs1rCFb97YsVq07fFossUq0Z8oSm3gemtppRe5zo2pdZ7iJKKSKyRKueycnjgv+L4wGsVqyyyu5qI5eGauWupo5XVVlVFTM+4ss8S4wg77bcUUU+2S9+KON7LwetMGeamCCv2nOyTS..7mSddtNJJpu1k877tp1gkCFDdQpweMQ+qTQ9FxDGGvZPPPeMBe5zIcSSS+hSTlcZN6qxEzm4+kneNVIydaccMkmmq4d588t89pJSjzzTE21C4Vh3Xk2h4hcj++4ACTbbb+iUV21uZuqYOG.XXH.a.fOBAAA2zencbbn77bcRRhhCbVFDIWhFuhwG8yjsL.ue+dpqqiNb3.se+99.I4Q9ssRjY61sWMzPJKKIYWCwrVjcbbHWW2QG.Nua1tcqR1EPXSssKKyHh9YBDJ+5fffmZP1l0g86Z6AD.XdP.1..eD3.mjAMZafqHCjxL.yttNqcLi2U7B0inqyBLWqzAAAz9866WrhbWdvLiwxVyGOYI4VPmqqa++U159HhtJS3000OzhEUqecSyONvXa8XbIdQwxkUhr9q2rYyUmu4337zG62O5HuG.38w6e5H..f+2TsKsrrLsr82wYtly9M+m111WVcAeutb4hNNNlppptYQKxiKcd+im7f7WaNk+3ID44ym0wwwVylK+83AOCQ+jMbNSpb4m7Ifuf.dexbHxXhuiGxRPhneVXen7L..tG3e3..3ihrDGH515SkKQD4vaQVxDbFbeGBbxVP9xf73rLaVtCDYutpI5mrvxYd174vAH6551WNH72qqqi7886aqcbInHyp5i1aweUCcFdQ.xCFE4ejYglyzM2MQLOdwWrAWq6Dg5gF.XdPIh.eMNe9rl+EnblNwsb86frTILo0+zt03QjMGTJWJHEEEjmmm0E02uMyLSykpwRFrIlsYOyEpHSFX34ym6mvjlGO3iy7cC3xkK5sa29PKxwWY8amkko46XgrjOjWvE+X4sI4hYjufFh94yGtcExdkk5B.vmKThHvGsymOqOe97MsrMaYuC9bIGDJ19bMHHfxxxzbmzfyf6kKWt5q4meWWm0rG+LwsSO4eLeLxgiCu8J21sw22Wc73QhnqC1V8+rUVG7iiyp6wiGIkRcUPzoooJ9BSje+oJSDt7LjdkkVRZZphKqE9hULOtL1ym6S3lKPRNPaLUGA.li2mT4.vBz11pssnqpqq6KA.32wyXQDta2NE2GiOd7X+BXi4551msQYFqaZZ56hH74JbvdNNNurVu1TC+ESlcvBajYRkydOQW2t4H55EB54ym0bYxvGSrMp1kiQcS7ErLDtNvs82AeUSTSYo0vAEe5zIcPP.wWLhjrdskStRkRoZaa0xAtirF0A.fgfT7Aej1rYiJLLTY1Jq777Pv0uPbViI5eCijmUF93fyFJ3NaYNU9XkY0jyr4qLfuk1p.sEbq4wVdn5Hsc6VUSSyMSwPsV2W5DgggpvvvAW.eQQQVONOmLQycaCNSvD8ufseU2Uoc61o3KPPdmKLuvL1P8Dbtryja2+Vi9c.fOKH.a3i1T+B+11125NEw2.NnuvvPEQ+7YxZOs4jcGDdvpXtMTVVR61sSkllp3Qnt7V5adgWbv0uhyQRRRTKI3RaizcdAGVTTPGNbfJJJFbzuuc6VEWFLsss511VcYYIUWWOqEo2lMaT61sSI6m3GOdj1tcqJLLTMVVb4iq1JSKyxM4UQVlM1tnJYK8iW3mbmGQdgB..vbg.rg2J7XZtssUalANalJnETG1qippJMOJmke+zzTkr7DTJkhCncsK8BNHGaknfYOJlCVpttt+tcX1yr4dA8634HxovHGDsLHu33398W4EHH+6LbPia1rQwGCVZo6vARGEEcUYnLmiYNNN+pCKEeeekrCrHu.Ka2MgllF53wi8G2kmavmuw009KXyG...X8b9749.4FJyhbV4zZstppROkW89v2Ht9mmywS9yj0NyvYYYZ4q8TeVOz16u04HWtbYxyUkjk+A+83rQ+J194EPLiu3W9mmkkM51eaaqVddiV+u+95yX60l64emPtO+p1NA.9979k5F3OA4BwpppRe4xEcVVlNLLTMUspJ6R.yodqwunbY3rUK+LZ2tcC1QJLIq4007XOW5GD8S8TaqiNn0Z8kKWtpqxveu0Z63dszLkOTu911qiYWzYMDFFpjaCbqrieulp90MqcYdgD9J6BGK4XNetJWa5HS0..OBDfM7RvYD5xkKZyAiAuB849uaSSyUkZfMIII2r.Gg62oSm5yXJ212pqquI.YailbSb2633wiqdGWfOGINNlJJJFr1X4K7R1Z0z5qqKbYqpy1hEbsw0O8RHO9OzE3nTpEW5GOBWWW5zoS5oBd000sOX0iGO1W67up.rksAwotP7hhBqcWD..3dg.rgmNYcgxcvAIdJ6w3fn1tcqZrLy8p5.D+EXVuzoooJtSLXl82ppJsY.oUUU577bcddt9vgCKdXorDxWWauG74W7BejneBvRV61x9bL2UMdJarFdzNbisNfwq9Nz333PAAA2L.Vjr88qqqotttYcQZqsgtPLNS061s6p0R...7nP.1vpwrlFOe9rNKKSyYabH61sSMT2PXrLyYqTRF504UjgxOcNNNDWiu7EEsYyFkqqaeYiPz+tiCxKbh+dIIIpzzTE2B7dFsLQ4f.YrVYWYYY+BYj+Z97CYoJ7JKE.tzVVBYsrOmV22ZxLq4xigyobg3+M.Yeo9USt3XI5mOCPIf..7rg.rgmlfff9dF6TYda2tcJyffkcTDau91BrfGzHv0lyh1hCX0wwghiio11VcUUU+vLorrjtb4hlqkV43kluyDxRMgnmyD7yruFahC.TlE8lll9NuAOkD4f9ZaaGbxJ9L11WZPlNNN8ApZ6m+rK4B93D+Gtk2EGGO39hrk3YqsJRzOkkzyb6NMMUoTJUccMsc6V01sa6yV8y78E..HBSxQ3NszaK8PYxTq+2zny7WVmjjnLqWaIYaYi0zz7qNA49jsc61qNdyAClmmeyjY7zoSZy1hG+434ym0baQy00kZaa0a1rY0BpQdg.1ve9KCvV150jS.Tde8UM7PdjL3xkNk4emXrop3ZPdQJD8SFf4xonsscxZwl+rZpIS4yBBnF.32.xfMrH15ExqEGGGqi4Ya2J277bqAsse+dhGGx+UGNDi0BxlSVr4aedQQwUYyV933tJBm42gJMGGGGZMCtlneBvS1WiMK6BdeXylM889ZdRJd73QqWX1qx8Ffo7BDe00vLm8WtN0kW.6RVXflSyR9huVwMU..3sABvFlDWWtyoyAbOtmaULmAMyZojCp11HQ9uP65SqmdTkOVPMxVq2tc6565EC8Zte+dx00su7QpppzCUR.qkzzz9IInqqKEEEcSfqxOq45COLLTIGA3lW.1qnKRDFFN35MXJ7EKY6BZViysyyy0mNcpuTTr82K4+dEWm9tttS1ANjCzmnnn92mmQ84C..uKP.1vU3fjjCEC4ub7Yfec4LywAQbOuVxLjYqsl8sEjssLUeuAJJOlyAWMVmUHOOWWTTPQQQWUhEbvtbP1+VGy48AYFz4sMkR0WStbc59pB36QuH0333mxEvDDDPQQQTbbLc97YcPP.wsUS44Fx5zm6zLSsOEDDPAAA8ONdsRr12cC..3cABvFtBmcumcccNDYsxxY5ZNOONPId6VFztLH6O8NGfLPGtEFJylYSSyf0a9RBJSdwTGOdz54CIII8sxOh9WW6fWDgOyrXOU.ckkkWU6s7m6C0Wt888U1562OCOR.1bvr1N19nKRS9BN3ZTW1wU3fts87RRRTl6SlaebusWoTJtSyfZiF.3aFBv9OJa0oKGbwuwstka4a999phhBJNNlBBBnttt6pNMk+BdYlJWwM4eE1VLdS0WnYbsJOT.dooopiGO12FyjulSMcMI5eYV0bADRzqKK1bcVOz4vbmkP983958qZgv9HYsk+rSdrk+LiWDjiQ1ZEs80DcaoyvYrl6dHRbP21dN..veY3eE7OlymO+zVjhOBYKeSFDQRRhZylMp4FjsiiCc3vgW53X9UgCFhypOGjUPPPelYGZg+000QQQQStvOskMR98Qq05ppp9RHhGrL7fBhWXgxLZKe+WSIIIJyRgQoT8KDOtVxsE.oz4ym0xtNxqJK1OBtlx4A2Bewnig+rx008l5S2b+MIIQwGKkAxOTG5gn4EPM21Mm7AB..eAP.1+QvAkEFF91Ohwk0IK+81rYihCryrSiH466qRSSU+FSKt6wRxNeRRhprrjhhhnKWtnKKK6CbUF3CO0BkASyYgbN2cB4BcT9bI5mfP41uWbb7UsDOFGXs4.JYswGO32G9bb4EqI++4GykKWzmOeV211p655nCGNzGr5qxiNB4ki.d9q4Oy3dls7bqjjDksfvSSSUS8YSWWWeqMzLP5555YUZJ7EK+MbWj..f4.AX+ExVPa7fbwr+EOWux.P788uYwIRz+p+zeq5C+Y3dKW.tGOyA+XJMMUMzwQhFujM3fn3Z71bB7Ie+788uJHWFmYU9w+rVfrxtxgqq6Ms4Qhtce000seeZ2tcpzzTEOzT3ysF6h3VCOZIT366qj667E5TUUokC3og1O3OaI5mOerko+SmNoMGJOl1ueeeWB4uZawD..rAAX+kgqIRYPEYYY5ymOqsUCky0q3WdZl0Ts95o3H+K5+TyBls9R8TLC7QdwEAAATYY4U0FKGr6izIV3WKOOu9.1jCellllq5TIIIIpsa2pxyy0sss5c61o3EhGWNCOS61sSc3vg9LqaCedDmEWy+d.egN7fn4ULcDWCxgoCuHS40a.Ol6YxE.K+YKQ+bwXxtECWNIxsStc7Y6tewA5aKS3000XxpB.7mDBv9CVUUktsssezTySPOa+xaNKS26BXjGwzuJxtIBy22+i4VLaaAjJCZapZC9zoS511VsYINvA.RzOKdSNvHtrP3EFJQ+K3KyxEgMT1MkYU21EkEDDPwwwTYY4UcVB9buppJcccceP376MWC2iseeuRSSUiET7wiGupTFrc9Leb5UrHeej.r4K9jKIF4XI2jRoT7w7vvPUYYY+9s4z4TJJJ5lRBINN15Evz11pMCRm466q3gRzB2MA.fOZH.6OXbPyAAAD2up4fCj+BMNnKya0+R8JJQDNXfsa2pNd73Ga1pI55r9adrapikxgmhLvvMa1nLuc7EEE80jKQ+arkua2t9xDQNbU3m6XYVdrZDl2tBCCUgggJygPjmmWesvuz866UVVldr9+MWhJxy+MCHkOt1008qzIclC4myAAAj4P8ooooevPI+dL9yrttNZnK1gm3hxZ7l+91NmQdLk6u0eKcsG..3dg.r+hLTPAb.VOZPCwwwzwiGeJAIw+BYYV0FaHm7tfWrb7HjWVBHlAdHw+r77bMOtwG58X+988c+EdJ9Iq2XytEBmE4rrL8oSmzxfhlaMryaebVomp8+IC7SFXEeQeOyRLJKKSO09E29.M6vLbPl7c+4QJipkf61IKkb6qoo4lxYg+4x8gtttataE7igOuiKuGh9oja3ikl+aF1NOP9481saQ+sF..HDf8aq4TqtikwN94WUU02F0VClY05QwY75SEeazsETl76wsUM4OiKSDdghw2xetCgX99PzOWjirtXaaa073JmuiFD8uEhn4s42b6brrXJYd9irNu4AGhsywj6yOq5w1Vug1j78V1Wu877n77bsmmGUTTzu89Jx9psIM5RvASOznWmO+x1ee8vgCjqqKse+dJOOWaabyyWXkbaju6HJkRY1uzA..3e9dZGCeItb4xUYbjCx11uHyr9bswVaT6Q8HAX2zzPeJsPu4nrrbxdPLQTeo7vL6pFxwJdQQg0OujmCz111Wu8laCxREw1D1iy5YTTzruqFlONaA0lllpxxxzZsVyaqgggJdHtL2iU2Keee0PWTpqqaeske5zoqFpLwwwjRot44VUUoGqNkWCOZsXOV26PtNFr89X9yKKKoSmNo877nsa2p31XHeGvL+2fPlpA.fggLX+lYn.gkKpokZMqmz6MPcNqWeSAWyY+8dW7mx6FfrDGjcFBIyNpB+X555t5t.vAyGEEcUIDv0f+Pu9Rb.WlauxeNQ+bgBblryyy6CbkaIjmOeVyA.9JlThC8Yg771c610OPb5555CbTIL0hPcsrF2Mng962bq5iGVSxeFO0NqqqIdQHx0lsqqKkmmqqqqosa2pBCCQ8TC..KDBv9MwT0gKmwQy9W6RrzGuM7BmaNOVd598s9Km41B28lERYszJCvdn1MGG7HG7GuPzrUe8xWKyrM655RAAAi9YSXX3MSzww1OM6hDx152qzRt.vw5A4up5+mu3i0nDtl50vrbfbbbtoVv4gASRRh5dqSb...P.1uMRSSUiEb.Wuixfa888Gs0jYxyyaz51dI3eYtYP6xr.9MksZS7ECI67D2CNCyxrJOT2dwLC2QQQTWWG466q1tcqZpKlYoe1L2fikum999piGO1uM566qRRRVz4oKURRhJIIQkmmqcbbtZgLJq2ZaZZZnppJqiTcy1P3y.+YpbpbtTlKnwwHKClOgEQL..7oBAX+FYn.Z555F7WFtYyFkRoTyM6zxaI98Pq057779a6OGzdYY4etE7zwiG6Cv9dy.ommWeW1PV6z1lNhbVpkYVbpL1VWWe22EgGM6yb+ZVd9BQiOEIeTNNNTbb7UG6F5yFtirzzzPQQQ2LxumyZb3Qwk1yZ7dY6ByzZs9YeQB...bKDf8ajgBnw1TM7dnTJUZZZe8lduuNlkjvewamLWRDbP1lA5N2rZK6cz1BT2rCqvmGvYksoogtb4h9xkKWUhQ1Z6guBmNcpe33vCyEdActV28joX10T32ey.M4ZTlOlatvS2rYi5Y2OrMaghq0qkj7ua9W6hfA.feKH.62HSs3yFJSbbaFaJqUlCCBB56Auv0sNO1T8N5gXNZqsQFzHOpz4VtFQqWPT7cGYrGC2t93ud2tcJyEb4b681qI4EVLTcNy0ZLeQm197Zr5zdMrlS4voNF+puXK..3uLDf8ajgZmVrg9Ej2S2Y3d6HILtzF9qar5KdIAUx0gMWKt7moi0d03gJi42+UZp2SNS9kkkTbbbemSYnwz9ihKIF46ummW+6eddt09KOOgLub4xj8e9mIy9F98RVu8qw1E...KCBv9MhRoTiMhpGpDQl6sVl+E1YYY5WQKS6UartvxyTWWGc3vgqxP5Ruc+xImHWWvCk4WNHLYYnzzz7Tx15bOlJCJ0LSw71HWq9EEEOktKRRRxUqEAkR02IT3sAtKYb4xkaJ4J4Hk+Qu.zkHOOWKq+d1ROFgQTN..79.AX+lYreo5P+r4Vaqbc6lllN6EE4mpWY.RqY4OL1TWjEDDPcccjmmWeut9Y0wVlJHO49trSbXN91kS7xm83Hm2NNc5jV1utk1tcqprr7pKLPNUDMe7OSIII8SzQ4wkwJCKY85yAUiA+B..79.AX+l4dBVKMMczLeK+Evsss5KWtnCCC6qUVaKttmQ4FnMbOuFiM.P3ECJQ+DD5q3V8yAxuFcABtjaBBB5qq5glTeb8Q6337Tqs1oBD1rWde5zI8986uZPzv6WQQQ88fahdNcSDta6z11p41XHyLfZy.Rks8R4w7SmNYsM9sljARyu274.Dcca7iayhbqY7YtcA..v8AAX+lw1DzaNRSSsVKv000VGvDxa8u4TAbs61CCEP8RBvhmTfwwwC1QURRRTEEEjVq6yb4yNHa9XmL6mOByAzxTulO6.rlallkWP.QWm8UtFr4d98ypVw4yKhhhrdgI1Vy.MMMW0cQ3sY4w8c61od1Yzl21pqq6OGfOupnnfZZZ5KAjm5FB...v2LdwVszr9N1iMKK6puOufuZaa0UUUZsVqqppzbVtmigpK7Y8jGY+IOOWy+IKKS211dyy07BGH5mVwl709ULxqkaay831XGO4OKt2icqM4wTS19Lf2O3y23sU97M4q2Z74issKt0EZ6Xo417P6Cbf2uhE9HeL4UMh1A..345016rfYStfqjzZsdrrXwOOaOFN6hUUUZee+9d7qLKkxgp+hkqB..LwfIQTPTcRcc8jcJDGGGpssUeu0Tqb+QFbgrjKL6VFxs011Vsbw8EFFpzZslK+kjjDUUUkttt9oM451rYihC.aMpG6W83EeJb1fssuYq7UTJkJKKq+bB4BLrssUKyf889YxTA75551e9aYY4UcZGyyoMynNW1OAAATVVlV14SdV05Ned6uQmfA..f0260uIG5cuc4iwpKyjjD0gCGHOOORq0Z9V1Sz0KvKWW2EMcBWi.B4ATB+m495Om2aeeeUTTzSq0vwkay8TZOllSOi1rUz8r466qrcblC7zVFfSSSUx8CNn0hhh6tDQVZ164.oG5BUkes7bic61o3xjJMMU466q1rYipqqavN4yZPNHn...3yFBv9MzyJPPhtN6cb2nfyVsDu.wLmjfOK61sazEp4XLCVRoTpfffqpsVdfr7Lbu0M+R8aMcFIZ39wM2+t0Zs9zoSWMMIkKXPWWWJOOew2oCt7Ldj.am5ycac0DYm8fUVV9zG7L...7c.AX+Fptt15hai6OxqE91cyCiCyEF1TC9l0VZZpRoT2DXyRjkkoqppzNNNTPPPe1U4WSaYa8QwYcdM6s3b.6uh.2uWlAtFEEQ62umNc5jtppRy2EDN.VWWWJJJp+NTTWWe0EGwKj0SmNo4.14e1ir.RmZgUtc6VqYn2rbPP1kA..XtP.1ugLynlLykOZMfJaOeD8ufH3wztYeX92nlPum.r0ZslGfNlWjPVVllGi3OqoOI+dtVGuBBBHkRoBCCeK5Y4CURJ62u+ltNC2x9HhnwZEj7igyNM2IR3KTQF.+i741P2ggW4BEE..f+VP.1ugbbb5qk5GsVayxxt511e974atM8bKTyLi0gggujgWgYfN2S.kb8q5662uMykuPbbLc3vg9feW6.qjGi3EH5RCz11imy1tuu+ud+N11DcjCX1L3233XpnnnOiux95rjrkDd4xEM2J73yA877Vsx5IJJxZ4NwmKnTJEB3F..f0BBv9MzZ1oBRSSUAAAzkKWzmNcRyCwDh9WvECUesbax6UTlBxfaFpmduDGNb3pwOdZZphqe1mQV4kAEJ+ZowxL+Pkhyu03e2jssOWWWprr7l8q55ZhuiAoooJtLQFqDZ36fxypN442CSCctPUUk0VPH...vbf.r+CfWfe7X0tnnnOKwZsVGGGeS1B2rYiJIIQwSeuWskTlHccc2jUZy.BkYpjm3iqYGgv22+lwcsLS72S8yyYe+cvXiscOOOxbApJ6tHSE3Lmw+wdbls7u6gsxLwwwou8PxcIjKWtn4V7GeANn+TC..vRf.r+CfybHWG2oooVWTWRUUUZtqO7aDf8RJKBGGmY0153r3KedOqLDaqLWV5hf7UuHSuWdddTPPPecNyYitqqqu8KNVMpatOJmpnkkk8utx53V1hIeTlq6.GGGJIIQoTJkmm2Ssq9...v2o2+e6M7Pxxxzbl6jYrcp.2dWxdpRol0h7aN0OKmEeyu2ZY61s8aqbGYgCB7Ys3JeU1samxrTgZZZnxxR53wijmm2U8Q8sa2pBCCUb+UmG02CcdmsKjyr6r355NZuslszVKI+YD+7LWGBa2tU8rFRQ...7cBAX+kSl0TNPB4T1aHuSYNctkVQaaa+nldtAD8r1O4.rWiW+2kEeG2QSjedvcdlllFh6fKx6l.GjM+ykOOaL+r1008ptTh74MVYqrD7ERxYs9U062A..3606STTvpKOOWKybJm0u20roNTfjKYhRJyr4bJgffffUK.V4waGGm9E52Z3cbwN533P61sSsa2t9EkJOPY3GSVVllCt174NjiGORGNbfJKKuIq2xIO5b1FmSm3w7m+J5bN...7cC+hjubWtbQyAc1000OI5xyy0QQQuUYplng62xx8iovkxvRxj4ZzF7Nc5j1rDTVK+1soOl4mC74Tb4G433b0BdLNNl3xDYIWXGm8eY+zlmtn1NmsnnvZa8Sdbqss8p6bSQQABlF..fmh2qnqfU21saUxr9o+ebfO2qW8vOY61s2TCvljaSdddTQQg0tag7+xzZs9Q6TDuaWrxyfYKjzwwgpppzccc82ogzzTE2Cr4fqcccm8chfe77wS4yS1AbjjseRIy6NgR.AWC..vyx2eDAvpG3G2cGdFFqbMBCCGLfHtConTJEm4ZyxRPoTJNPPa8t4333GpTLBCCm7h.9VHqKZNywlYnNMMUc3vAxyyqu7clJHa93GGDcSSCsc61qFdPC0t8lBe2a....d1P.1e4VR.ib.nSgCV5corEH55.yUJkZylMJaATwYf0b+j2edz5S+YMZyWyd18ix7tBXh6w3b6sSNYKGKP3llFxyy6pGeSSS+9tbgTNlhhBpnnXV0eM...vy.Bv9K1kKWzyMfQNnk4ba7k2dcY.Lb.MOZWXXrrXuzW+gJIDy8SNvuvvP063D76cp7S3oC5X3KBiqyetuUO1Eev0cs7NOH+bZ61sC1+1MK8CT9G...7a5842ZCqtoFO0xRkv00sOSgKICr1xP9yN3FY+kVZn.yOd7H0000OnY3.0FJa8OZYdXqqW7MIKKy5BN019J+3jKz1gDDDbUeCuqqihiiohhh9yy1tcqZ61s8ASe73wE22qA...d1P.1ewFKXFkRojK.Rhl23n9cHfwzzT0lMarVJFZsVe97YMQDc97YMeQFbGofmdi15fJb.5oooJ4DebojGGe0KFzWgzzTqG6GKK67hVbptrB+ZTVVR7EAw2EFyIwIQ+z6pQ1pA..3cCBv9K1bJq.y.l4.m3fCM+4l00L2sHHhd4iT5gxzbPP.c9749VxliiCIqI6wlPk444Ob2DgwsTt0ZgO9tLvYXScwV7Ourrbx511j4PoIMMUIWri....uyvur5K1TAjIqe5ppJcYYYecyJ+YmNcRyc.BaA3TUU0Wq27yandBMG39XktB2oO788m77yg5O1GNbnu0swWzPXXnZpiIblSI5mxT3dWjb76iY+btoo4tGO6bI8LV2T4Uar9SNuuZqWTOmiCXAJB..vmJjA6uTKsDG788UoooJaA8ra2NEG7MW9ElO2CGNPccc88S5c61o3dV7bFu0RbP3yIisikEUNned7d211pmpdcCBBtZfkXa+cJx5R2008pRE4dCtlngq87eKCUK1LdeW94XYYYeet1jxvyYqF...3469+s8vaMaYHVoTJsVqs0GnYbViOe9rtqqqOPnoZMeoooJdTgGEE0WmyD8SPvGOdjbbbl0z7aIcLCt0tYhGS4xLHe73wYM9x4Ln644snoAIiOVHKEkGIvZFO7bdmTVVN5wHyfo2samhunE49BJ8C...9lfeo1WJtDMJJJ5WjexfiOe9r1yyazguQddtlCdhCRcn.r4.JkixZy+e460XYml6CxbsSOm8WsVqsMFsaZZnxxx9EW2Ra2c7P0oqqiRRRl8eewL.6gFw22i2or6N0mib.3cccz1saUYYYZYc6C...7MBkHxWpc61o3rTyYJjWDhsssZNnay.jjCzjjjD01saUEEEyt7DjcABYFJMWnei8Z433r3L0pTpa5rEbmRIIIQwYxdoZZZnnnnQWXj1HeuJJJniGO900QQxxxzCcmPLKKHd.+ffqA..3u.Df8WpSmNocbbnc61o3Lu533bU20fI69GNNNjYWzfCJZtAn1zzzW60bfVQQQWUOyS0YM1ue+Uii64xVf6Ox3OmK+jhhhEMME45Vmne12SSSU9998eu2oZo9dkllp3KdvDetxtc6P8TC..veNH.6uT7skmCVVNk7LIqQ1hhBqYqcNADxshMWWWxyy6l5cV9dOmZwNNNdQKxvvvv995sLnt333Y89MlnnnE2t8F6BR36J.asZkeuZlYjVtHEma48....7sAAX+EhyRsL.u4LBzyyy6ytsY1ZCCCUikQ4jjDksZudnfLmS.6a1rQ8nsjN49zZXI8hZ466oSmtZHoH6vIDsrEA4Rxj9qPRRB57G....BH.6uLYYYWsvD4rQOUfpbfixmqYvjKsDQF68QVtDqItlwWSxRcgn6qjS3EYI2Wt4VA3ilYc....38CBv9KyPiwZhlt6SvScPYfumOeVmkkokAtOEaCQDt02wYR+xkKS95UUUcWYpUls9tttEOEAm50ctWnAuv93maTTDIa8gRKIK6qYF4A...f0G9M0egLyLrVq0UUU5oF9LbepVls1ff.JJJhbccmrk4kjjnNd7HEEEQgggJywt91saUtttjVq0NNNSVlH2a1c45B9zoS8sDtGYQExcPkzzTUWWG444s3rXKybssx0wLn4ugEAI...veUH.6uP1xLruuuR159rgWjflOlkTJCb83xumbv0bIpnTJ0gCGHY2mXrfIOe9rNOOWeOkkgiiC011pihhdnr9xWnPVVllCvdtYyWl8b9Xn7XorqhrjId48lce....34CAX+kgmlhCYp5Sd61sJymO2OoumsG4BULOOWyA7RzOAQNUugNHHfBBBl0DXzTXXnZMJmh3339.gcbbnCGNzOwKuGbfzlATyWXyb543n1sA...deg.r+xLTlU0ZsNOOWOmtUQXXnx1faYIL6k1bf+xL1ljjnJKKmLastttOTISv6y269iRoTIIIJt91WxvRwVoeH+d1Zcg716P6y7jkD....dOg.r+xLVPjwwwjqq6rCP6d6zG7XBmambbse6440WO2KMCr2yPmgneBNlyL7R2Wr054dj1Fnsx.wb+hKQGy1rXQQQ+msys7T....feGH.6uLSE70PKxNhr2imum.JkilbsVqMW3jD8uNxwbyF7iLhsaZZHkRoRSSGsFzMe7266mjLHYNn4CGNPGOdjJJJ5+7RV5NCkQe4ce.cRD...f2W32R+kYNAd455dUKyislCJDY.0tttTPP.c73w9rvJmVjJkZzgXCQ+LbUzZsdIS1QVXXnhyl91saUJk5lLyKm.g2a8laCOxzks3u8622Wa4lkriLS0RlYzlnkMza....fWGDf8WjoZCeLNqo1JSjppp6picXx22+prE644cyHKeoAHVVVd2kngYKFjyR8qXBDJ2l49LtqqKwspP93D+4gs6BgsRpA0gM...v6IDf8ePJkR466eyhXjKmi862uJii64jIXtM7MUosHa0eqgjjjW9X8laweD8uZkWFbcSSyf0lts6LwT8kb....32ABv9KRPPvjKjOyr0Nziuqq6g60xlcRjgdebccsNcCk9zq4XtM7433bUFpMyd8X6mccc88O7mcV2A.....9e5YferWtbYzedaaqdNAIOj777Q2Nju9KY69SDuOjkkoaaa0xi8mOeV2111+y3iKeC62....+E8YmVP3Jys1o4f5FpFd4Wm555mZKgywwouTMTJk5uPMEue+dptttu2dWWWe0hMsoog1rYihmHlHS0.....7KpppZNIBdV3Wy4tvIGxTYw111+X6GOx1xuorrra1W3NixZrnRA...f2GSOV+fOBYYYiNhzuWO6rJq0ZMmkV43G+SNXZarUa0NNNTQQwC0iuA...f2OnDQ9R7LBtlnWS213xkK2LV0GJvdyG6mhjjDEOLYJJJ5aQf61sCAWC...7kA+x8uDOiL9tV0+Kusw8+YyNFRccMUWWSNNNztc6Tsss5w5lFntjA...f2YHC1eIlp87cOdz1zG6vgCDQ+qMyYxyyiBBBnnnnGtluA....32FBv9KQXX3p2ENVqWONazQQQjqqq0KFfypcTTzGeOuF....9aCQx7knppZzxp3drVudIIIpiGOtZulqUl0A....3Y.AX+EHOO+ozAQVyWSNa3xwE985YsfNA....XMf.r+B7rFFLOiESHWhH000VqG6k574yHa1....vaEzGr+BTVVRwwwq9qqrGUuV777tpeWe4xEsYWEYtaa000O89zM.....KEZ2YeAt2fTmi0N.6rrLsbvpvcMjnnn690DssO....3cBJQjOb444OsfqeFs9Oh9I6y7.iYMJuErnGA...f2IH.6ObcccTSSyS40NLLb0yLLm85ttt9.iezKP.K5Q....3cBBv9CWZZpZ61spGIH6xxxWVsLmkk0msYWWWxwwAAHC....eUP.1eI1tc6cOnYZZZtpidn9eq01lMdddXfx.....ekvhC6KRaa6cMrYd0KRPsV+TpYZrXGA...f2AHEheQVRYhnDdhaRVwS0w0F2QR.....32DBv9KxTAX2zzPMMMesY58Y0MU.....XIP.1+AvYpd61spsa29qGbcRRh5YjEaTS2....v6.jxuuPeqYndJHC1....v6.DQxWjc618mLvZ.....dmf.xfeM4445333U+08uZF7A...f2CnnUA.....fUDBvF......VQnFrguFGNb32dS......TC1vuqGcpNh5sF....d2ffSfecKMHaNS0ooo37W......vTddtdJ+1ai.....LWXQNBusNb3P+Tn72daA....f4BKxQ3sxgCGPoe................................................................................................................................................................................................................7d5+.S6zC.3yttFO.....IUjSD4pPfIH" ],
					"embed" : 1,
					"forceaspect" : 1,
					"hint" : "github.com/8rian6",
					"id" : "obj-87",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 619.200015783309937, 27.777778208255768, 100.0, 39.972527472527474 ],
					"pic" : "Macintosh HD:/Users/mac/Music/PersonalWorks/DJ/封面图/不ruàn榴 斜.PNG",
					"presentation" : 1,
					"presentation_rect" : [ 790.0, 338.0, 158.0, 63.156593406593409 ]
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.807843137254902, 0.807843137254902, 0.807843137254902, 0.247058823529412 ],
					"bordercolor" : [ 0.427450980392157, 0.517647058823529, 0.658823529411765, 1.0 ],
					"hint" : "Gravity Data\nProvides angular data from the integrated module, including rotational angle information for the X, Y, and Z axes. After device initialization, all three values are set to 0 by default. The update frequency is approximately 3 times per second. Gravity data cannot be obtained simultaneously with certain other data types, such as HRV or grind.",
					"id" : "obj-224",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 696.666685149073601, 161.333338141441345, 130.000005394220352, 334.000009953975677 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_output_curve_color"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.0 ],
					"border" : 2,
					"bordercolor" : [ 0.85, 0.85, 0.85, 1.0 ],
					"hint" : "Attention\nRepresents focus and attention. The value range is 0–100, with higher values indicating greater concentration. Typically, data is received once per second. During transmission, data loss may occur, and any missing data for that second will not be displayed.\n\nMeditation\nRepresents relaxation and meditation levels. The value range is 0–100, with higher values indicating a deeper state of relaxation or primary meditation. Like attention, data is typically updated every second, and missing data will not be displayed if transmission errors occur.",
					"id" : "obj-216",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 8.200007796287537, 518.400007724761963, 809.400004386901855, 193.200002908706665 ],
					"presentation" : 1,
					"presentation_rect" : [ 130.00000387430191, 402.666678667068481, 796.754172593355179, 121.199993908405304 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_arranger_grid_tiles"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.0 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.933333333333333, 1.0, 1.0 ],
					"hint" : "Power Spectrum (Delta/Theta/LowAlpha/HighAlpha/LowBeta/HighBeta/LowGamma/HighGamma):\n\nThese values represent the power spectrum of the eight widely recognized EEG frequency bands.\n\nThe eight EEG frequency bands are:\n\t•\tDelta (0.5–2.75Hz)\n\t•\tTheta (3.5–6.75Hz)\n\t•\tLow Alpha (7.5–9.25Hz)\n\t•\tHigh Alpha (10–11.75Hz)\n\t•\tLow Beta (13–16.75Hz)\n\t•\tHigh Beta (18–29.75Hz)\n\t•\tLow Gamma (31–39.75Hz)\n\t•\tMid Gamma (41–49.75Hz)\n\nThe value range is from 0 to +∞. These data points are primarily used to generate real-time EEG power spectrum charts. By analyzing these charts along with descriptions of EEG frequency bands, you can assess changes in brain activity.\n\nSince the raw data values are usually large, the following processing methods are often applied for better analysis:\n\t1.\tDivide the data for a specific frequency band within a given second by the sum of all frequency band data for that second. The resulting percentage represents the power spectrum energy ratio for that specific frequency band, making it easier to compare with similarly processed ratios from other bands.\n\t2.\tApply a logarithmic transformation to the energy values for display, allowing for easier observation of fluctuations and changes with smaller numerical values.\n\nThe power spectrum represents the physical expression of brainwaves in the frequency domain, which differs from traditional interpretations of the relationship between brainwaves and mental states. A notable characteristic is that, under almost all conditions, low-frequency brainwaves tend to exhibit much higher power than high-frequency brainwaves. This is a normal phenomenon and does not indicate inaccurate data from the device. However, this characteristic means that further processing of the data is required, and methods for such processing need to be explored independently through additional resources.",
					"id" : "obj-215",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 4.800000071525574, 715.200010657310486, 813.200027465820312, 520.000007748603821 ],
					"presentation" : 1,
					"presentation_rect" : [ 128.625, 525.333348989486694, 798.041694283485413, 247.333340704441071 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_display_line_two"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.01 ],
					"border" : 2,
					"bordercolor" : [ 1.0, 0.490196078431373, 0.262745098039216, 1.0 ],
					"hint" : "To balance power consumption and performance while ensuring user experience, there are logical restrictions preventing all or certain features from being activated simultaneously.",
					"id" : "obj-193",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 828.162713453173637, 1153.600017189979553, 514.634945705533028, 203.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 732.800010919570923, 774.400011539459229, 194.400002896785736, 98.400001466274261 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_alert"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.01 ],
					"border" : 2,
					"bordercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
					"hint" : "Grind\nThis refers to the electromyographic signals produced by facial muscles during grinding or clenching actions. While such signals are considered interference for EEG measurements, their distinctive characteristics make them suitable for use as control signals for certain functions. When the wearer clenches their molars, data values are output: 0, 1, or 2, representing no grinding action, a short grind, and a long grind, respectively.\n\nTemperature\nThis data is provided by the temperature sensor integrated into the forehead band. It cannot be obtained simultaneously with favorability and gravity data.",
					"id" : "obj-191",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1137.0, 346.0, 205.634945705533028, 346.412716239690781 ],
					"presentation" : 1,
					"presentation_rect" : [ 556.0, 773.5, 175.0, 99.5 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_lcd_control_fg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.01 ],
					"border" : 2,
					"bordercolor" : [ 0.0, 0.854901960784314, 0.282352941176471, 1.0 ],
					"hint" : "Heart Rate\nData provided by the PPG sensor integrated into the cortical headband. For a healthy person at rest, the heart rate typically falls between 60 and 100 beats per minute. Heart rate data cannot be obtained simultaneously with Favorability or Gravity data.\n\nSDNN (Standard Deviation of NN intervals)\n\nSDNN measures the overall variability of heartbeats by calculating the standard deviation of all NN (normal-to-normal) intervals in a given time window. It reflects the combined influence of both sympathetic and parasympathetic nervous system activity on heart rate variability. Higher SDNN values indicate better autonomic balance and adaptability, while lower values may suggest stress or fatigue.\n\n\nRMSSD (Root Mean Square of Successive Differences)\n\nRMSSD represents the short-term variability in heart rate by calculating the square root of the mean squared differences between successive NN intervals. It is primarily associated with parasympathetic (rest-and-digest) nervous system activity. A higher RMSSD value generally reflects a relaxed state or good cardiovascular health, while a lower value may indicate stress or reduced recovery.",
					"id" : "obj-170",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 828.162713453173637, 704.00001049041748, 514.634933367371559, 445.600005269050598 ],
					"presentation" : 1,
					"presentation_rect" : [ 287.0, 774.0, 267.5, 99.0 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_macro_assignment"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.235, 0.235, 0.235, 0.01 ],
					"border" : 2,
					"bordercolor" : [ 0.745098, 0.596078, 1.0, 1.0 ],
					"hint" : "Favorite\nReflects the level of preference or affection for the object in front of you. The value ranges from 0 to 4, where 0 indicates neutrality with no preference, and 4 indicates a high level of preference. Calibration of brainwave baseline values is required for 5-10 seconds before use. During the 5-10 seconds after properly wearing the BrainLink Pro, maintain a stable wearing position to avoid interference from muscle electrical signals. Simultaneously, keep a neutral emotional state, avoiding being overly focused or relaxed. A stable baseline calibration will improve the accuracy of preference measurements. Preference data cannot be obtained simultaneously with temperature, heart rate, and gravity data.",
					"id" : "obj-164",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 829.0, 345.0, 262.698416769504547, 346.825402200222015 ],
					"presentation" : 1,
					"presentation_rect" : [ 129.0, 774.5, 155.25, 98.5 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bordercolor" : 						{
							"expression" : "themecolor.live_scale_awareness"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.807843137254902, 0.807843137254902, 0.807843137254902, 0.247058823529412 ],
					"bordercolor" : [ 0.427450980392157, 0.517647058823529, 0.658823529411765, 1.0 ],
					"hint" : "Gravity Data\nProvides angular data from the integrated module, including rotational angle information for the X, Y, and Z axes. After device initialization, all three values are set to 0 by default. The update frequency is approximately 3 times per second. Gravity data cannot be obtained simultaneously with certain other data types, such as HRV or grind.",
					"id" : "obj-135",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 826.761921837925911, 8.0, 515.873023867607117, 328.571433663368225 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.333349525928497, 186.000005543231964, 302.0, 215.0 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_output_curve_color"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.668252052034861, 0.37753979111903, 0.316055506131883, 1.0 ],
					"bordercolor" : [ 0.427450980392157, 0.517647058823529, 0.658823529411765, 1.0 ],
					"hint" : "RawData\nRaw brainwave data used to plot raw brainwave graphs, with a value range of (-32768, 32767). The data rate is 512 samples per second. During transmission, any lost packets will be discarded and not displayed. To restore the raw EEG signal in volts (V), you can use the formula: raw × (1.8 / 4096) / 2000. The resulting unit is volts (V).\n\nBlink\nDetect oscillations in waveforms caused by blinking from the raw data. Higher sensitivity increases the likelihood of false triggers, so it is recommended to adjust the sensitivity based on individual conditions. Note that frequent and forceful blinking may lead to a decrease in signal quality.",
					"id" : "obj-134",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 284.0, 211.416663199663162, 401.033337652683258, 254.666673600673676 ],
					"presentation" : 1,
					"presentation_rect" : [ 234.33334031701088, 186.000005543231964, 307.0, 215.000000596046448 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_inactive_automation"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"background" : 1,
					"bgcolor" : [ 0.737254901960784, 0.737254901960784, 0.737254901960784, 0.329411764705882 ],
					"bordercolor" : [ 0.427450980392157, 0.517647058823529, 0.658823529411765, 1.0 ],
					"hint" : "Signal quality\nThe value range is 0–200. A higher value indicates more interference, while a value of 0 indicates proper wear, allowing stable acquisition of EEG signals. If the value exceeds 10, the device needs to be re-worn or the wearing environment needs to be adjusted. Under normal circumstances, one data point is transmitted per second. During transmission, data loss may occur, and any lost data for that second will not be displayed.\n\nLithium Battery: 3.7V 300mAh\n\t•\tStandby Time: 6 hours\n\t•\tContinuous Use: Approximately 4 hours\n\t•\tCharging: 5VDC / 500mA–1000mA\n\t•\tCharging Time: 1 hour\n\t•\tLow Battery Self-Detection: Vibration alert",
					"id" : "obj-128",
					"ignoreclick" : 0,
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 8.00000011920929, 164.800002455711365, 256.800003826618195, 345.600005149841309 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.333337336778641, 185.000005513429642, 97.0, 216.0 ],
					"proportion" : 0.39,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_input_curve_color"
						}

					}

				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 300.5, 289.016657680273056, 300.5, 289.016657680273056 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"midpoints" : [ 89.700008869171143, 325.533341407775879, 89.700008869171143, 325.533341407775879 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-237", 1 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"midpoints" : [ 612.5, 332.070954923881573, 612.5, 332.070954923881573 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"midpoints" : [ 843.662713453173637, 371.266682922840118, 843.662713453173637, 371.266682922840118 ],
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 1 ],
					"order" : 0,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 1,
					"source" : [ "obj-105", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-105", 0 ],
					"midpoints" : [ 1221.662719175219536, 746.430164873600006, 1221.662719175219536, 746.430164873600006 ],
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"order" : 1,
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"order" : 0,
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 553.5, 235.570954029811844, 553.5, 235.570954029811844 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"midpoints" : [ 300.5, 244.016657680273056, 300.5, 244.016657680273056 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 19.900000154972076, 1196.999984890222549, 32.70000034570694, 1196.999984890222549 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 1 ],
					"order" : 0,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"order" : 2,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"order" : 1,
					"source" : [ "obj-114", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-114", 0 ],
					"midpoints" : [ 1092.062717244029045, 752.390486061573029, 1092.062717244029045, 752.390486061573029 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"midpoints" : [ 720.166687846183777, 304.133367300033569, 720.166687846183777, 304.133367300033569 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"hidden" : 1,
					"midpoints" : [ 29.700007975101471, 299.382297263015062, 30.400043725967407, 299.382297263015062, 30.400043725967407, 197.533339381217957, 55.300008356571198, 197.533339381217957 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"order" : 1,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-155", 0 ],
					"order" : 0,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"order" : 0,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"order" : 1,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 1193.5, 544.334941744804382, 1193.5, 544.334941744804382 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-120", 0 ],
					"midpoints" : [ 718.833354473114014, 408.800036549568176, 718.833354473114014, 408.800036549568176 ],
					"source" : [ "obj-124", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"order" : 0,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"order" : 1,
					"source" : [ "obj-125", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"midpoints" : [ 1193.0, 403.171447575092316, 1193.0, 403.171447575092316 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"hidden" : 1,
					"midpoints" : [ 740.100018560886383, 571.27938112616539, 740.100018560886383, 571.27938112616539 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"midpoints" : [ 576.100009202957153, 1268.70003753900528, 576.100009202957153, 1268.70003753900528 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"midpoints" : [ 346.500012695789337, 577.27938112616539, 346.500012695789337, 577.27938112616539 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"source" : [ "obj-141", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 4 ],
					"midpoints" : [ 429.500006258487701, 1046.266647040843964, 414.066666543483734, 1046.266647040843964, 414.066666543483734, 1034.266647040843964, 324.066666543483734, 1034.266647040843964, 324.066666543483734, 1043.266647040843964, 9.066666543483734, 1043.266647040843964, 9.066666543483734, 1169.266647040843964, 70.757143012114938, 1169.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"midpoints" : [ 429.500006258487701, 1046.133322775363922, 429.500006258487701, 1046.133322775363922 ],
					"order" : 0,
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 2 ],
					"midpoints" : [ 231.100003302097321, 1043.266647040843964, 9.066666543483734, 1043.266647040843964, 9.066666543483734, 1169.266647040843964, 45.328571583543507, 1169.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"midpoints" : [ 231.100003302097321, 1046.133322775363922, 231.100003302097321, 1046.133322775363922 ],
					"order" : 0,
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 1 ],
					"midpoints" : [ 33.500000357627869, 1043.266647040843964, 9.066666543483734, 1043.266647040843964, 9.066666543483734, 1172.266647040843964, 32.614285869257792, 1172.266647040843964 ],
					"order" : 0,
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"midpoints" : [ 33.500000357627869, 1046.133322775363922, 33.500000357627869, 1046.133322775363922 ],
					"order" : 1,
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"midpoints" : [ 33.500000357627869, 809.266647040843964, 9.066666543483734, 809.266647040843964, 9.066666543483734, 1172.266647040843964, 19.900000154972076, 1172.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"midpoints" : [ 33.500000357627869, 811.33332222700119, 33.500000357627869, 811.33332222700119 ],
					"order" : 0,
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 3 ],
					"midpoints" : [ 231.100003302097321, 809.266647040843964, 9.066666543483734, 809.266647040843964, 9.066666543483734, 1169.266647040843964, 58.042857297829222, 1169.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"midpoints" : [ 231.100003302097321, 811.33332222700119, 231.100003302097321, 811.33332222700119 ],
					"order" : 0,
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 5 ],
					"midpoints" : [ 429.500006258487701, 812.266647040843964, 414.066666543483734, 812.266647040843964, 414.066666543483734, 797.266647040843964, 324.066666543483734, 797.266647040843964, 324.066666543483734, 809.266647040843964, 9.066666543483734, 809.266647040843964, 9.066666543483734, 1169.266647040843964, 83.471428726400646, 1169.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"midpoints" : [ 429.500006258487701, 811.33332222700119, 429.500006258487701, 811.33332222700119 ],
					"order" : 0,
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 7 ],
					"midpoints" : [ 627.100009202957153, 809.266647040843964, 732.066666543483734, 809.266647040843964, 732.066666543483734, 797.266647040843964, 813.066666543483734, 797.266647040843964, 813.066666543483734, 1175.266647040843964, 120.066666543483734, 1175.266647040843964, 120.066666543483734, 1172.266647040843964, 108.900000154972076, 1172.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 627.100009202957153, 811.33332222700119, 627.100009202957153, 811.33332222700119 ],
					"order" : 0,
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-162", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"hidden" : 1,
					"midpoints" : [ 124.100009381771088, 248.533339381217957, 84.400043725967407, 248.533339381217957, 84.400043725967407, 230.533339381217957, 55.300008356571198, 230.533339381217957 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 0 ],
					"source" : [ "obj-173", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-236", 0 ],
					"source" : [ "obj-173", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-173", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"order" : 0,
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"order" : 1,
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 3 ],
					"order" : 0,
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 2 ],
					"order" : 1,
					"source" : [ "obj-179", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"source" : [ "obj-181", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-180", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"order" : 2,
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 1 ],
					"order" : 3,
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"order" : 1,
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-201", 0 ],
					"order" : 0,
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 1 ],
					"order" : 0,
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-162", 0 ],
					"order" : 1,
					"source" : [ "obj-183", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"midpoints" : [ 870.261921837925911, 228.711073994636536, 870.261921837925911, 228.711073994636536 ],
					"source" : [ "obj-184", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 2 ],
					"order" : 0,
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"order" : 1,
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"midpoints" : [ 875.261921837925911, 334.377728700637817, 852.07936330139637, 334.377728700637817, 852.07936330139637, 262.377728700637817, 1134.07936330139637, 262.377728700637817, 1134.07936330139637, 43.377728700637817, 1158.261921837925911, 43.377728700637817 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 3 ],
					"order" : 0,
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"order" : 1,
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 0 ],
					"midpoints" : [ 127.300009429454803, 451.200017750263214, 127.300009429454803, 451.200017750263214 ],
					"source" : [ "obj-196", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-198", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"midpoints" : [ 870.261921837925911, 201.711073994636536, 870.261921837925911, 201.711073994636536 ],
					"source" : [ "obj-200", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-228", 0 ],
					"midpoints" : [ 862.261921837925911, 123.711073994636536, 862.261921837925911, 123.711073994636536 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"source" : [ "obj-210", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"midpoints" : [ 875.261921837925911, 297.711073994636536, 875.261921837925911, 297.711073994636536 ],
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"order" : 1,
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-189", 0 ],
					"order" : 0,
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 0 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-221", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"source" : [ "obj-226", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-229", 0 ],
					"midpoints" : [ 862.261921837925911, 147.711073994636536, 862.261921837925911, 147.711073994636536 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 2 ],
					"midpoints" : [ 862.261921837925911, 174.711073994636536, 899.261921837925911, 174.711073994636536 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"source" : [ "obj-231", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 1 ],
					"midpoints" : [ 950.0, 177.711073994636536, 908.079395741224289, 177.711073994636536, 908.079395741224289, 174.711073994636536, 884.761921837925911, 174.711073994636536 ],
					"source" : [ "obj-232", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-232", 0 ],
					"midpoints" : [ 950.0, 147.711073994636536, 950.0, 147.711073994636536 ],
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"midpoints" : [ 1037.261921837925911, 177.711073994636536, 908.079395741224289, 177.711073994636536, 908.079395741224289, 174.711073994636536, 870.261921837925911, 174.711073994636536 ],
					"source" : [ "obj-234", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-234", 0 ],
					"midpoints" : [ 1037.261921837925911, 147.711073994636536, 1037.261921837925911, 147.711073994636536 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"midpoints" : [ 950.0, 123.711073994636536, 950.0, 123.711073994636536 ],
					"source" : [ "obj-236", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-237", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 1 ],
					"midpoints" : [ 1005.662715956568718, 873.200002312660217, 1265.062715038657188, 873.200002312660217 ],
					"order" : 0,
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-221", 0 ],
					"order" : 2,
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"order" : 1,
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-237", 0 ],
					"source" : [ "obj-247", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"hidden" : 1,
					"midpoints" : [ 29.700007975101471, 327.13334184885025, 29.700007975101471, 327.13334184885025 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"hidden" : 1,
					"midpoints" : [ 29.700007975101471, 348.13334184885025, 29.700007975101471, 348.13334184885025 ],
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"midpoints" : [ 127.300009429454803, 402.133351802825928, 127.300009429454803, 402.133351802825928 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-153", 0 ],
					"order" : 0,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"order" : 1,
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"midpoints" : [ 300.5, 268.016657680273056, 300.5, 268.016657680273056 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"midpoints" : [ 720.166687846183777, 203.633355498313904, 720.166687846183777, 203.633355498313904 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"midpoints" : [ 36.100008070468903, 545.612730354070663, 36.100008070468903, 545.612730354070663 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"midpoints" : [ 416.100013732910156, 545.612730354070663, 416.100013732910156, 545.612730354070663 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"midpoints" : [ 33.500000357627869, 737.066673815250397, 33.500000357627869, 737.066673815250397 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"midpoints" : [ 612.5, 374.070954923881573, 612.5, 374.070954923881573 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 6 ],
					"midpoints" : [ 627.100009202957153, 1043.266647040843964, 732.066666543483734, 1043.266647040843964, 732.066666543483734, 1034.266647040843964, 813.066666543483734, 1034.266647040843964, 813.066666543483734, 1175.266647040843964, 120.066666543483734, 1175.266647040843964, 120.066666543483734, 1172.266647040843964, 96.185714440686368, 1172.266647040843964 ],
					"order" : 1,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"midpoints" : [ 627.100009202957153, 1046.133322775363922, 627.100009202957153, 1046.133322775363922 ],
					"order" : 0,
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 0.0, 0.541667, 0.001445, 0.45 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 1,
					"midpoints" : [ 36.100008070468903, 595.27938112616539, 80.40003114938736, 595.27938112616539, 80.40003114938736, 577.27938112616539, 128.40003114938736, 577.27938112616539, 128.40003114938736, 559.27938112616539, 160.5, 559.27938112616539 ],
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"hidden" : 1,
					"midpoints" : [ 416.100013732910156, 595.27938112616539, 461.40003114938736, 595.27938112616539, 461.40003114938736, 577.27938112616539, 518.40003114938736, 577.27938112616539, 518.40003114938736, 568.27938112616539, 548.5, 568.27938112616539 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"hidden" : 1,
					"midpoints" : [ 160.5, 586.27938112616539, 140.40003114938736, 586.27938112616539, 140.40003114938736, 547.27938112616539, 346.500012695789337, 547.27938112616539 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"hidden" : 1,
					"midpoints" : [ 548.5, 595.27938112616539, 527.40003114938736, 595.27938112616539, 527.40003114938736, 544.27938112616539, 740.100018560886383, 544.27938112616539 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"midpoints" : [ 32.70000034570694, 969.866677284240723, 32.70000034570694, 969.866677284240723 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"midpoints" : [ 33.500000357627869, 1022.133322775363922, 33.500000357627869, 1022.133322775363922 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"midpoints" : [ 231.90000331401825, 969.866677284240723, 231.90000331401825, 969.866677284240723 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"midpoints" : [ 231.100003302097321, 1022.133322775363922, 231.100003302097321, 1022.133322775363922 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"hidden" : 1,
					"midpoints" : [ 740.100018560886383, 597.0, 416.100013732910156, 597.0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"midpoints" : [ 429.500006258487701, 1022.133322775363922, 429.500006258487701, 1022.133322775363922 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 300.5, 334.016657680273056, 300.5, 334.016657680273056 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"midpoints" : [ 627.100009202957153, 1022.133322775363922, 627.100009202957153, 1022.133322775363922 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"midpoints" : [ 231.90000331401825, 736.666673481464386, 231.90000331401825, 736.666673481464386 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"hidden" : 1,
					"midpoints" : [ 627.100009202957153, 787.33332222700119, 627.100009202957153, 787.33332222700119 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-148", 0 ],
					"midpoints" : [ 429.500006258487701, 787.33332222700119, 429.500006258487701, 787.33332222700119 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 1 ],
					"midpoints" : [ 612.5, 394.749981790781021, 599.999991834163666, 394.749981790781021, 599.999991834163666, 340.749981790781021, 587.999991834163666, 340.749981790781021, 587.999991834163666, 295.749981790781021, 572.999991834163666, 295.749981790781021, 572.999991834163666, 292.749981790781021, 564.0, 292.749981790781021 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"midpoints" : [ 430.30000627040863, 973.066677331924438, 430.30000627040863, 973.066677331924438 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"midpoints" : [ 33.500000357627869, 787.33332222700119, 33.500000357627869, 787.33332222700119 ],
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"midpoints" : [ 300.5, 310.016657680273056, 300.5, 310.016657680273056 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"midpoints" : [ 231.100003302097321, 787.33332222700119, 231.100003302097321, 787.33332222700119 ],
					"source" : [ "obj-81", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"midpoints" : [ 430.30000627040863, 736.666673481464386, 430.30000627040863, 736.666673481464386 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"hidden" : 1,
					"midpoints" : [ 125.300008356571198, 224.533339381217957, 124.100009381771088, 224.533339381217957 ],
					"source" : [ "obj-83", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"hidden" : 1,
					"midpoints" : [ 55.300008356571198, 224.533339381217957, 55.300008356571198, 224.533339381217957 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"midpoints" : [ 627.900009214878082, 973.066677331924438, 627.900009214878082, 973.066677331924438 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-89", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"source" : [ "obj-89", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-89", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"source" : [ "obj-89", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"hidden" : 1,
					"midpoints" : [ 346.500012695789337, 600.0, 333.0, 600.0, 333.0, 585.0, 285.0, 585.0, 285.0, 549.0, 138.0, 549.0, 138.0, 594.0, 36.100008070468903, 594.0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"midpoints" : [ 553.5, 319.570954029811844, 553.5, 319.570954029811844 ],
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-298", 0 ],
					"midpoints" : [ 553.5, 349.570954029811844, 553.5, 349.570954029811844 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 1 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"midpoints" : [ 553.5, 286.570954029811844, 553.5, 286.570954029811844 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"midpoints" : [ 553.5, 259.570954029811844, 553.5, 259.570954029811844 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 2 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"midpoints" : [ 627.900009214878082, 736.666673481464386, 627.900009214878082, 736.666673481464386 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"originid" : "pat-6",
		"dependency_cache" : [ 			{
				"name" : "OSC-route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "不ruàn榴 斜.PNG",
				"bootpath" : "~/Music/PersonalWorks/DJ/封面图",
				"patcherrelativepath" : "../../../DJ/封面图",
				"type" : "PNG",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"boxgroups" : [ 			{
				"boxes" : [ "obj-134", "obj-109", "obj-33", "obj-1", "obj-8", "obj-71", "obj-11", "obj-298", "obj-108", "obj-90", "obj-91", "obj-95", "obj-96", "obj-53", "obj-77", "obj-99", "obj-101", "obj-92", "obj-151", "obj-85" ]
			}
 ],
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"angle" : 270.0,
						"autogradient" : 0,
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"proportion" : 0.39,
						"type" : "color"
					}

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
				"name" : "newobjBlueNew",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "newobjBlue",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
