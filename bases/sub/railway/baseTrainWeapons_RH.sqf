/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseTrainWeapons_RH
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
	["Box_East_Ammo_F",[3,-10.5,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Ammo_F",[2.25,-10.5,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Wps_F",[-3.125,7.625,0],315,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_BagFence_01_end_green_F",[2.7803,-11.6316,0.687785],177,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-3.22933,9.18708,0.812785],177,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[2.7971,4.29503,0.0627851],352,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-2.92838,4.30695,0.0627851],352,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[2.7971,4.29503,0.812785],352,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-2.92838,4.30695,0.812785],352,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.7452,7.456,0.0627851],273,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.25252,2.72687,1.43779],282,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.80756,3.32957,1.43779],75,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.61405,-10.5052,0.0627851],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.17606,-10.3508,0.687785],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.18723,-10.3662,0.0627851],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.95749,-9.84922,0.812785],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.60287,-10.4899,0.687785],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.95026,-9.88828,0.0627851],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.7452,7.456,0.812785],273,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.53126,-9.91239,0.687785],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.52008,-9.92775,0.0627851],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.40652,7.40475,0.0627851],273,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.33305,7.30362,0.812785],273,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-2.85024,-12.0178,0.0627851],351,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.18351,8.91135,0.0627851],174,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2.80795,-11.457,0.0627851],351,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2.49615,9.17516,0.0627851],174,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.18546,-6.34692,0.0627851],182,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.6212,-6.74899,0.937785],182,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.25893,-6.44804,0.937785],182,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.69467,-6.64786,0.0627851],182,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.08117,-4.10152,1.31279],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.85013,-3.74689,1.31279],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.8344,1.80399,0.0627851],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.08117,-4.10152,0.0627851],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.0969,1.44936,0.0627851],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.85013,-3.74689,0.0627851],90,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-4.125,-0.375,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[3.875,-0.125,0],0,true,false,[0,0],0,true,"",""],
	["Land_Locomotive_01_v1_F",[0.125,4,0.375],360,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Pallet_MilBoxes_F",[0.00105572,-0.363062,0.812785],89,false,false,[0,0],0,false,"",""],
	["Land_Pallet_MilBoxes_F",[0,-3.25,0.875],89,false,false,[0,0],0,false,"",""],
	["Land_RailwayCar_01_passenger_F",[0.0854206,-1.90008,0.5],181,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_HMG_01_high_F",[-3.03682,-11.0682,0.0627851],183,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[2.42016,7.8368,0.0377851],2.99996,true,false,[0,0],0,true,"",""]
]
