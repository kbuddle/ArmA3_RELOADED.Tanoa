/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSmallHQ_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
	to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomContainerLoadout;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Cargo_House_V4_F",[16.6324,4.57433,0],359.88,true,false,[0,0],0,true,"",""],
	["Land_Cargo_HQ_V4_F",[0,0,4.76837e-007],37,true,false,[0,0],0,true,"",""],
	["CamoNet_ghex_open_F",[-10.115,-6.1136,0],45.4043,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[14.1642,-5.0417,0],207.534,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[13.8001,2.24041,0],88.6354,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.04111,7.71536,0],88.6354,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-12.9495,-11.6563,0],269.564,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-13.1187,-2.08685,0],204.658,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.6287,-7.34215,0],88.9248,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.46417,3.19488,0],127.41,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.91905,3.05988,0],218.225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-13.0713,-2.10811,0.8],205.779,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-5.87795,3.02809,0.8],219.346,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[5.03942,7.76729,0.8],89.7567,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-12.9486,-11.7083,0.8],270.685,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[14.2105,-5.06532,0.8],208.656,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[13.7984,2.29234,0.8],89.7567,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-7.63013,-7.29021,0.8],90.0461,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[9.49537,3.23642,0.8],128.531,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-10.2165,6.4755,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-0.756258,9.93393,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[10.3501,9.96224,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[4.72757,9.92849,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-6.37874,9.90018,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.92919,-13.8657,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-8.8268,-13.904,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[10.5758,-10.2582,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[21.6222,10.006,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-17.7853,-10.4356,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[20.0659,2.13262,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[22.5101,7.19613,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-14.4493,-13.9377,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[2.27951,-13.8757,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-3.34297,-13.9094,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-12.9599,6.09842,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-20.3259,-9.10607,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[17.5883,-2.94486,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.9997,9.97225,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-17.8816,-4.04256,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.4041,1.03491,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[13.5517,-13.8319,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.1441,-8.00837,0],116.111,false,false,[0,-0],0,false,"",""],
	["Land_Laptop_unfolded_F",[-4,-2,4.5],75.0001,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_unfolded_F",[6,-2,2],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_unfolded_F",[16,8,2],195,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MobilePhone_smart_F",[15,8,2],315,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MobilePhone_smart_F",[5.29289,-1.29289,2],6.83019e-005,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MobilePhone_smart_F",[-3.5,-2.86603,4.5],195,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[15.1222,3.0263,0.844807],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-3.85653,-2.63393,1.44648],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[4.5,-5.5,5],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-11.4311,-4.19993,0.844807],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-4.16072,-1.2395,3.97132],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-0.458556,4.83607,1.44648],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-9.11947,-8.55034,0.844807],206.026,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["MapBoard_Tanoa_F",[4.5,0.5,1],0,true,false,[0,0],0,true,"",""],
	["O_supplyCrate_F",[-2,-7,0],303.232,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_supplyCrate_F",[1,-9,0],303.232,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_supplyCrate_F",[-0.5,-8,0],3.2325,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"]
]
