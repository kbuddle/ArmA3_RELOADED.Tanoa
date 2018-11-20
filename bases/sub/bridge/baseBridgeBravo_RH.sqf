/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: baseBridgeBravo_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_long_green_F",[-0.25,13.25,0],357,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.42472,-9.7086,0],185,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.49895,-13.407,0],173,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.375,10.75,0],9.00002,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-2.73813,13.5172,0],182,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3,-13.5,0],358,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.571203,4.87229,0],81,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.62935,-6.30242,0],98,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.80591,-8.48014,0],80,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.875,5.625,0],98,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2,5.75,0],166,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2.32797,-7.29517,0],185,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2.35621,7.41278,0],351,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2.375,7.375,1.25],351,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.12185,-9.22256,0],351,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.375,-10.5,1.25],351,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.38656,-10.5009,0],351,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.625,7.5,0],191,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-2.80504,-1.14264,0],268,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[2.5,-0.625,0],89,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-1.5,3.75,0.503365],157.204,false,false,[-28.0243,12.6091],0,false,"",""],
	["Land_Plank_01_4m_F",[2.875,-7.125,0.508543],178.845,false,false,[29.995,-0.666571],0,false,"",""],
	["Land_PlasticNetFence_01_pole_F",[-3.875,5.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_PlasticNetFence_01_pole_F",[3.625,-3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_PlasticNetFence_01_short_d_F",[-3.75,3.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_PlasticNetFence_01_short_F",[3.625,-5.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[2.375,3,0],45,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-1.5,-6,0],0,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[1.75,6.125,0],180,true,false,[0,0],0,true,"",""],
	["O_supplyCrate_F",[-1.25,-0.5,0],84,true,false,[0,0],0,true,"",""],
	["Box_East_Ammo_F",[-1.375,-2,0],48,true,false,[0,0],0,true,"",""],
	["Box_East_Ammo_F",[-1.5,-3,0],348,true,false,[0,0],0,true,"",""],
	["Land_MetalCase_01_large_F",[-1.25,1.125,0],25,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_medium_F",[-2.25,-8.75,0],85,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_small_F",[-2.125,4.375,0],55,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[2.24086,-0.374609,1.4768],264.625,true,false,[-15.3992,2.16777],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_02_unfolded_F",[2.24156,-0.775997,1.3529],101.483,true,false,[1.47948,12.1183],0,true,"","this setVariable ['taskObject',true];"]
]
