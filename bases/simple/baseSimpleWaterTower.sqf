/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleWaterTower
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_CanisterFuel_Red_F",[-0.5,0.25,8.111],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_BagFence_01_corner_green_F",[3.5,-3.375,0.875],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.25,-3.5,0.875],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.5,-3.375,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.375,3.5,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.25,-3.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.375,3.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.375,3.75,0.875],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.75,-3.75,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.25,-3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.375,3.75,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.625,3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.625,3.75,0.875],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0,-3.75,0.875],0,false,false,[0,0],0,false,"",""],
	["Land_Bucket_F",[2.5,-1.625,0],0,false,true,[0,0],0,false,"",""],
	["Land_Camping_Light_F",[-0.75,0.625,8.111],0,true,false,[0,0],0,true,"",""],
	["Land_Crowbar_01_F",[0.25,0.75,8.25],0,false,true,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[0,-0.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[2.875,3,0],45,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.85636,2.94266,0],315,true,false,[0,0],0,true,"",""],
	["Land_WaterTank_F",[3,0,0],90.0001,true,false,[0,-0],0,true,"",""],
	["Land_WaterTower_01_F",[0,0,0],0,true,false,[0,0],0,true,"",""],
	["Land_WoodPile_F",[0.25,0,0],0,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[0.75,0,0],0,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[-0.75,0,0],0,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[-0.25,0,0],0,false,false,[0,0],0,false,"",""],
	["WaterPump_01_forest_F",[-3,0,0],0,true,false,[0,0],0,true,"",""]
]
