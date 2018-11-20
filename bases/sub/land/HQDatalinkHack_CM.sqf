/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: HQDatalinkHack_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Cargo20_military_green_F",[14.0442,3.19962,0],270,true,false,[0,0],0,true,"",""],
	["Land_Cargo_House_V4_F",[12.4782,-6.3262,0],90,true,false,[0,0],0,true,"",""],
	["Land_Cargo_HQ_V4_F",[0,0,4.76837e-007],270,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V4_F",[-15.3087,-4.04565,4.76837e-007],90,true,false,[0,-0],0,true,"",""],
	["B_Slingload_01_Cargo_F",[-3.07802,-11.902,0],270,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_corner_green_F",[-11.6962,6.91823,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[11.7005,9.10344,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-10.1312,7.301,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-12.2756,-10.7525,0],325,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-19.3465,-5.21226,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-19.3546,-5.18698,0.591733],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-19.3559,-2.72373,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-19.364,-2.69846,0.591733],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.57404,-6.45113,0],40.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.73117,-4.65564,0],40.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.90346,-12.4161,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.87268,9.35339,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-18.8062,-7.43995,0],50,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-18.8143,-7.41467,0.591733],50,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-19.005,-0.110322,0],115,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-19.013,-0.0850434,0.591733],115,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.03935,-10.2234,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[7.21783,-10.1598,0],220,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-8.03842,11.0699,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[8.11577,11.0785,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-12.8702,14.6563,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-14.2575,-12.4148,0],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-16.8223,11.0244,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-16.862,2.61423,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-16.9416,-5.88982,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-3.89625,-14.9901,0],1.06722e-005,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-4.40635,14.6412,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[12.6782,14.8621,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[12.9011,-15.0305,0],1.06722e-005,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[16.6491,1.30048,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[16.6752,9.74916,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[18.3231,-6.8313,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[4.49797,-15.0131,0],1.06722e-005,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[6.34095,14.8105,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-6.02193,9.94997,0.825723],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-6.07551,9.95422,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[5.15677,-5.48652,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.59688,9.92288,0.825723],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.65046,9.92713,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.69453,7.83167,0.825723],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.70576,2.23192,0.825723],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.74811,7.83592,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.75934,2.23617,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[14.5482,-10.2216,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.96958,9.90664,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[4.02316,9.90239,0.825723],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.63328,2.21399,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.64062,-3.34654,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.65552,7.80438,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.68686,2.20974,0.825723],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.6942,-3.35079,0.825723],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.7091,7.80013,0.825723],270,false,false,[0,0],0,false,"",""],
	["Land_LampHarbour_F",[-15.2133,13.105,0],135,true,false,[0,-0],0,true,"",""],
	["Land_LampHarbour_F",[-15.2172,-9.17746,0],70,true,false,[0,0],0,true,"",""],
	["Land_LampHarbour_F",[14.9564,13.3327,0],230,true,false,[0,0],0,true,"",""],
	["Land_LampHarbour_F",[16.7249,-9.48235,0],250,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[13.5626,-0.400506,0],15,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[14.6096,-0.724676,0],55,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[14.9948,-2.77246,0],55,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[15.0199,-1.78465,0],20,false,true,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[-10.6445,5.58644,0],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[10.0999,7.95522,0],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[5.76447,-12.42,0],95,true,false,[0,-0],0,true,"",""],
	["MapBoard_Tanoa_F",[-3.64224,6.93282,0.601674],310,true,false,[0,0],0,true,"",""],
	["Land_Laptop_device_F",[-2.92695,2.41494,1.41468],5,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_CampingChair_V2_F",[-1.73251,3.0763,0.601674],0,true,false,[0,0],0,true,"",""],
	["Land_CampingChair_V2_F",[-2.79901,3.01711,0.601674],0,true,false,[0,0],0,true,"",""],
	["Land_CampingTable_F",[-2.18642,2.23423,0.601674],0,true,false,[0,0],0,true,"",""],
	["Land_DataTerminal_01_F",[-5.43479,3.11471,0.722088],60,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Document_01_F",[-2.4969,2.36633,1.41468],150,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_TripodScreen_01_dual_v2_F",[-5.82099,5.96417,0.722087],110,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Metal_rack_Tall_F",[0.0703437,7.20008,0.601674],0,false,true,[0,0],0,false,"",""],
	["Land_Metal_wooden_rack_F",[-1.13644,7.01698,0.601674],0,false,true,[0,0],0,false,"",""],
	["Land_MobilePhone_smart_F",[-2.29136,2.47412,1.41468],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PCSet_01_case_F",[-1.03665,2.39313,0.601674],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PCSet_01_keyboard_F",[-1.63327,2.36543,1.41468],180,true,false,[0,-0],0,true,"",""],
	["Land_PCSet_01_mouse_F",[-2.01213,2.38119,1.41468],0,true,false,[0,0],0,true,"",""],
	["Land_PCSet_01_screen_F",[-1.66609,2.02259,1.41468],180,true,false,[0,-0],0,true,"",""],
	["Land_SatelliteAntenna_01_F",[4.13106,2.23713,5.75552],55,true,false,[0,0],0,true,"",""],
	["Land_SatellitePhone_F",[-2.20419,2.07492,1.41468],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
