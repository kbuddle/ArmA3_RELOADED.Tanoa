/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: supplyCacheForest_CM
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
	["B_CargoNet_01_ammo_F",[-5.21574,0.136224,0.0115538],345,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["B_CargoNet_01_ammo_F",[-4.2119,2.13529,0],25,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["B_CargoNet_01_ammo_F",[-2.846,4.25348,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_Syndicate_Ammo_F",[-0.0647474,5.28726,-0.068274],340,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_Syndicate_Ammo_F",[0.839065,5.68566,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_Syndicate_Ammo_F",[0.301061,4.72924,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_Syndicate_Ammo_F",[1.21251,4.8928,0],40,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_Syndicate_WpsLaunch_F",[-1.00407,4.66509,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["CamoNet_ghex_big_F",[0.00029506,0.00416441,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[13.0859,-4.84586,0],65,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-1.56804,-10.3541,0],345,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[4.81464,-9.20894,0],155,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.68198,4.78344,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.44332,7.35854,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.90629,2.21241,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.59145,9.23991,0],180,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[11.6724,-5.93047,0],335,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[12.3788,-2.87956,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.45767,9.20986,0],180,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[11.1151,-0.322561,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.08274,-7.17593,0],335,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.265012,9.25873,0],180,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.47555,-8.41224,0],335,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.08209,9.27874,0],180,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-9.97867,-1.18783,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-9.9988,1.70727,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.79194,-7.26206,0],30,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.36241,-8.65018,0],30,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-9.95238,5.83059,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-9.54622,7.76882,0],120,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-9.74291,-5.59102,0],65,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.13832,-10.1645,0],25,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.71483,9.23338,0],195,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-7.772,8.9044,0],165,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-9.94997,-3.45346,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-10.0013,3.76526,0],90,false,false,[0,0],0,false,"",""],
	["Land_Campfire_F",[1.80038,-2.58002,0],0,true,false,[0,0],0,true,"",""],
	["Land_CampingChair_V2_F",[1.12129,-4.24208,0],200,false,true,[0,0],0,false,"",""],
	["Land_CampingChair_V2_F",[2.7975,-4.0148,0],155,false,true,[0,-0],0,false,"",""],
	["Land_CampingChair_V2_F",[1.74647,-0.883861,0],10,false,true,[0,0],0,false,"",""],
	["Land_CampingChair_V2_F",[3.24075,-1.44522,0],45,false,true,[0,0],0,false,"",""],
	["Land_Garbage_square3_F",[3.68079,1.68052,0],0,false,false,[0,0],0,false,"",""],
	["Land_Garbage_square5_F",[2.82155,-2.50051,0],180,false,false,[0,-0],0,false,"",""],
	["Land_PortableLight_single_F",[3.875,5.5,0],50,true,false,[0,0],0,true,"",""],
	["Land_TentA_F",[6.13516,-0.219061,0],65,false,false,[0,0],0,false,"",""],
	["Land_TentDome_F",[6.35133,-2.95384,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[5.95695,-4.93286,0],105,false,false,[0,-0],0,false,"",""],
	["O_T_LSV_02_unarmed_F",[-3.86,-4.76903,0],150,true,false,[0,-0],0,true,"","[this,true] call RELO_fnc_vehicleDisable; [this] call RELO_fnc_randomContainerLoadout;"]
]
