/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_RustyTankShed_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["APERSTripMine",[-2,-4.75,0],270,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[4,-4.625,0],270,true,false,[-0,0],0,true,"",""],
	["Land_BagFence_01_corner_green_F",[3.74847,1.45894,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.78864,1.4919,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.46209,1.38284,0.825722],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.42192,1.41579,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[3.09486,1.73977,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[3.13503,1.77272,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.45517,1.79473,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.84852,-2.00259,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.40539,1.79937,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.80835,-2.03554,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.49533,1.76177,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.35999,-2.04741,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.36523,1.76642,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.40016,-2.08036,0.825722],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.64519,-0.692621,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.09002,-0.389534,0.825722],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.68535,-0.725578,0.825722],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.13019,-0.356577,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-1.73383,-7.61807,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-1.73415,-7.59752,1.1368],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[1.62158,-7.67386,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[1.62126,-7.65331,1.1368],0,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-2.75,-7.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[3.875,-7.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[1.85543,-2.66022,0],0,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[-2.56523,-2.61198,0],0,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[-1.68669,-2.60128,0],0,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.875,-2.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[2.84078,-2.62585,0],0,false,false,[0,0],0,false,"",""],
	["Land_Shed_06_F",[0.481411,-2.35124,0],0,false,false,[0,0],0,false,"",""],
	["Land_Sign_Mines_F",[5,-7.625,0],315,false,false,[0,0],0,false,"",""],
	["Land_Sign_Mines_F",[-4,-7.625,0],45.0007,false,false,[0,0],0,false,"",""],
	["Land_Tank_rust_F",[0.125,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
