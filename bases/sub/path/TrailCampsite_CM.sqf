/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: TrailCampsite_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Campfire_burning_F",[3,-1,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[2.5,4.75,0.625],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[4.75,4.75,0.625],0.000721439,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[5.375,4.75,0.625],0.000721439,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[5.5,-6.75,0.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,-2.5,0.375],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,-2.5,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,-5.375,0.375],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,-5.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,0.375,0.375],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,0.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,3.125,0.375],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.375,3.125,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.625,-6.75,0.625],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[3.625,-6.75,0],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[3.625,-6.75,1.25],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[3.625,4.75,0],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[3.625,4.75,1.25],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[5.375,4.75,0],177.929,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[5.625,-6.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[8.875,-0.875,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[8.875,-3.75,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[8.875,2,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[7.96356,4.37956,0],211.016,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[8,4.375,0.5],216.016,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[8.25,-6,0.5],310,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[8.25,-6,0],310,false,false,[0,0],0,false,"",""],
	["Land_Garbage_square3_F",[2.25,3.75,0],345,false,false,[0,0],0,false,"",""],
	["Land_Garbage_square5_F",[2,-3.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-0.75,-6,-3],90,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-0.75,3.625,-3],90,true,false,[0,0],0,true,"",""],
	["Land_TentA_F",[6,-3.75,0],107.543,false,false,[0,-0],0,false,"",""],
	["Land_TentA_F",[6.25,-1.125,0],87.5434,false,false,[0,0],0,false,"",""],
	["Land_TentDome_F",[6.25,2.125,0],320.124,false,false,[0,0],0,false,"",""],
	["Land_WoodenCounter_01_F",[5.25,-6.125,0],1.06722e-005,false,true,[0,0],0,false,"",""],
	["Land_WoodenLog_F",[2.5,1.125,0],20,false,true,[0,0],0,false,"",""],
	["Land_WoodenLog_F",[3.125,-3.25,0],0,false,true,[0,0],0,false,"",""],
	["Land_WoodenLog_F",[4,0.5,0],350,false,true,[0,0],0,false,"",""],
	["Land_WoodenLog_F",[4.32287,-2.25172,0.013504],110,false,true,[0,-0],0,false,"",""],
	["Land_WoodPile_F",[5.25,-6.125,0.96],90,false,false,[0,0],0,false,"",""],
	["BloodPool_01_Large_New_F",[1.5,4.875,0],320,false,false,[0,0],0,false,"",""],
	["BloodPool_01_Large_New_F",[4.625,-1.125,0],0,false,false,[0,0],0,false,"",""],
	["BloodPool_01_Medium_New_F",[3.5,2.5,0],80,false,false,[0,0],0,false,"",""],
	["BloodPool_01_Medium_New_F",[4.9161,1.42684,0],200,false,false,[0,0],0,false,"",""],
	["BloodSplatter_01_Large_New_F",[4.375,-3.75,0],8.53774e-007,false,false,[0,0],0,false,"",""],
	["BloodSpray_01_New_F",[2.125,3.875,0],0,false,false,[0,0],0,false,"",""],
	["BloodTrail_01_New_F",[3.375,2.625,0],315,false,false,[0,0],0,false,"",""],
	["B_Kitbag_cbr",[3.75,2.25,0],340,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["B_Kitbag_cbr",[4.375,-3.25,0.0120001],340,true,false,[0.0554333,0.210778],0,true,"","this setVariable ['taskObject',true];"],
	["B_Kitbag_cbr",[4.625,-0.625,0.0120001],340.001,true,false,[0.269198,0.555459],0,true,"","this setVariable ['taskObject',true];"]
]
