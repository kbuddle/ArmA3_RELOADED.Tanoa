/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: RepairHunter_CM
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
	["APERSTripMine",[-5.375,-2.25,0],50.0003,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[7.25001,7.5,0],45.0003,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[5.00001,0.749998,0],55.0003,true,false,[-0,0],0,true,"",""],
	["B_Slingload_01_Repair_F",[8.25,1.625,0],180,true,false,[0,0],0,true,"",""],
	["B_T_MRAP_01_F",[-0.375,1.37343,-4.76837e-007],205,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable; [this] call RELO_fnc_randomContainerLoadout;"],
	["FlexibleTank_01_sand_F",[5.12501,-4.87501,0],180,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[4.25001,-4.87501,0],180,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[3.37501,-4.87501,0],180,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_end_green_F",[3.375,7.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.83156,1.14113,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.98686,0.680808,0.75],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.9038,3.98144,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.86964,4.05079,0.664423],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,0.624996,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.875,-1.75,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.84278,-0.199718,0.664423],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.23687,0.68081,0.75],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.25001,0.624999,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.21194,-1.15966,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.75,7.50001,0],0.000311627,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.28417,1.68065,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.25001,1.75,0.625],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.22315,-2.50051,0.625],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.25538,-4.05079,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[7.07277,5.70606,0.673491],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.95608,8.17579,0.729891],205,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.60302,-3.47413,0.037086],55.0007,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.625,-3.5,0.75],55.0007,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.02541,8.17042,0],205,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[7.09864,5.68408,0],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[4.71826,7.98487,0],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[4.69239,8.00684,0.712914],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[6.22216,3.93309,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.84179,6.23388,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-1.85203,-4.35061,0.037086],0.000420483,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[-4.87501,4.75,0],345,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-5.125,7.875,0],90.0003,true,false,[0,-0],0,true,"",""],
	["Land_LampShabby_F",[6.50196,-2.46876,0],270,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.125,6.5,0],325,true,false,[0,0],0,true,"",""],
	["Land_ScrapHeap_1_F",[-4.875,4.875,0],300,false,false,[0,0],0,false,"",""],
	["Land_W_sharpStone_01",[3.12501,-7.12501,0],180,false,false,[0,0],0,false,"",""],
	["Land_W_sharpStone_02",[0.875003,-5.75001,0],180,false,false,[0,0],0,false,"",""],
	["Land_W_sharpStone_03",[4.75001,-6.37502,0],180,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[-1.125,3,0],180,false,false,[0,0],0,false,"",""],
	["Oil_Spill_F",[-0.749999,0.124997,0],125,false,false,[0,-0],0,false,"",""],
	["RoadCone_L_F",[-0.124999,9.50001,0],180,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[1.87501,9.50001,0],180,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[1.875,-9.00001,0],180,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-0.125,-8.12502,0],180,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[3.875,-9.50001,0],180,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-2.125,-7.00001,0],180,true,false,[0,0],0,true,"",""]
]
