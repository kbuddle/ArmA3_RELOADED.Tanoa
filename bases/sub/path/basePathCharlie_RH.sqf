/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: basePathCharlie_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Campfire_burning_F",[-2,-0.25,0.125],278,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_long_green_F",[2.625,2.75,0],268,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.75,-3.25,0],273,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.125,-7.125,0],18,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.125,7.25,0.75],167,true,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.125,7.25,0],167,true,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2,5.5,0.75],230,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2,5.5,0],230,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2.125,-5.75,0],309,true,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[1.5,-0.25,0],269,true,false,[0,0],0,false,"",""],
	["Land_TentA_F",[-2.375,4.625,0],338,true,false,[0,0],0,false,"",""],
	["Land_TentA_F",[-2.5,-4.625,0],218,true,false,[0,0],0,false,"",""],
	["Land_TentA_F",[-5,-1.25,0],258,true,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[-4.375,1.125,0],258.001,true,true,[0,0],0,false,"",""],
	["Land_CampingTable_small_F",[-4.375,2.75,0],12,true,true,[0,0],0,false,"",""],
	["Land_CampingChair_V2_F",[-3.375,0.875,0],69,true,true,[0,0],0,false,"",""],
	["Land_CampingChair_V2_F",[-3.75,1.75,0],86,true,true,[0,0],0,false,"",""],
	["Land_CampingChair_V2_F",[-4.25,3.875,0],2.00001,true,true,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-3,-6.375,-4],21,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-3,6.625,-2],161,true,false,[0,-0],0,true,"",""],
	["Land_Wired_Fence_4m_F",[-4.90075,5.84091,0.00479269],321,true,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_4m_F",[-5.25,-5,0],238,true,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[-6.375,0.625,0],270,true,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[-5.25,-3.375,0],145,true,false,[0,-0],0,false,"",""],
	["Land_Laptop_device_F",[-4.25,0.625,0.875],66,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[0.875,-0.25,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_medium_F",[-4,-3.125,0],331,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_small_F",[1.70691,5.0289,0],327,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MobilePhone_smart_F",[-4.25,1,0.875],89,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PCSet_01_case_F",[-4.25,2.875,0],203,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PCSet_01_keyboard_F",[-4.24839,2.92026,0.813005],207.001,true,true,[0,0],0,false,"",""],
	["Land_PCSet_01_screen_F",[-4.375,2.625,0.875],205.001,true,true,[0,0],0,false,"",""],
	["Land_FlatTV_01_F",[-4.5,1.5,0.875],267.001,true,true,[0,0],0,false,"",""],
	["Land_HDMICable_01_F",[-4.25,1.5,0.875],0,true,true,[0,0],0,false,"",""],
	["Land_PortableGenerator_01_F",[-5.625,1.25,0],85,true,true,[0,0],0,false,"",""],
	["O_CargoNet_01_ammo_F",[1.25,-4.375,0],278,false,true,[0,0],0,false,"",""]
]
