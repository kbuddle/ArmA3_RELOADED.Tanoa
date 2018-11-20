/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: simpleHeliDown
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
	to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomCrateLoadOut;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["CraterLong_small",[0.125,4.875,-0.25],0,false,false,[0,0],0,false,"",""],
	["FlexibleTank_01_forest_F",[-1.5,-2.375,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_forest_F",[-1.5,-1.625,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_forest_F",[-1.5,-0.875,0],0,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_corner_green_F",[4.375,3.875,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.5,3.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[3.25,2.125,0],90.0007,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.625,6,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.5,-1.25,0],300,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.625,-6,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.625,6,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.62501,-6,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[1.75,-3.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.25,-1.875,0],180,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.25,-3.25,0],230,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-7.77405,6.4545,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.75,-8.375,0],35.0003,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.125,3.25,0],50.0004,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.75,8.375,0],215,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-7.68566,8.66421,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.875,-8.375,0],320,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.56434,8.66421,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.25,-5,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.875,8.375,0],140,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.5,-1.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_Bunker_01_blocks_3_F",[0,-9.125,0],180,false,false,[0,0],0,false,"",""],
	["Land_Bunker_01_blocks_3_F",[-0.125,9.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[3.5,-3.375,0],310,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[-6.125,7.375,0],315,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-4.875,-1.75,0],235,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-4.375,-2.625,0],310,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[3.25,7.625,0],35,true,false,[0,0],0,true,"",""],
	["O_Heli_Light_02_dynamicLoadout_F",[0,1.13932,0.997179],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_HMG_01_high_F",[-6.25,7.5,0],1.02453e-005,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[3.5,-3.625,0],90,true,false,[0,0],0,true,"",""],
	["Oil_Spill_F",[0.125,0.625,0],205,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[0.375,0.125,0],10.0003,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[1,0.5,0],35,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[0.625,1.125,0],90,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[-0.375,0.25,0],30.0001,false,false,[0,0],0,false,"",""],
	["RoadCone_L_F",[0,-8.875,1.5],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[0,8.875,1.5],0,true,false,[0,0],0,true,"",""]
]
