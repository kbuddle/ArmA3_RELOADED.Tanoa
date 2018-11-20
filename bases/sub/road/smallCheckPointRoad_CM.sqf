/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: smallCheckPointRoad_CM
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
	["CraterLong",[2.5,2,-0.375],0,false,false,[0,0],0,false,"",""],
	["CraterLong_small",[2.625,-9.375,-0.25],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.12381,6.07532,0],90.2864,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.12884,8.96441,0],90.2864,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[4.63689,11.29,0],124.328,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-1.39943,1.14269,0],302.737,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[6.52408,12.0811,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.84585,0.328532,0],6.17615e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.963987,3.2822,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_Bulldozer_01_abandoned_F",[2.50465,-8.72413,0],161.175,false,false,[0,-0],0,false,"",""],
	["Land_CampingTable_F",[10.8782,3.35576,0.728848],90.056,false,true,[0,-0],0,false,"",""],
	["Land_Cargo_House_V4_F",[7.24709,4.06207,0],90.113,true,false,[0,-0],0,true,"",""],
	["Land_CncBarrier_stripes_F",[-3.20776,4.33656,0],359.65,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[2.52948,-4.27048,0],339.799,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-2.13544,4.3476,0],359.65,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[1.10576,-4.78503,0],339.799,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3,8.625,0],255,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-4.25,11.125,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-4.44986,-3.65721,0],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6,-5.5,0],285,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-4.59115,-1.35439,0],270.095,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.62334,7.3164,0],90.0314,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[4.75,-2,0],75.0314,false,false,[0,0],0,false,"",""],
	["Land_Laptop_02_unfolded_F",[10.75,3,1.625],89.5316,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[3.875,-4.75,0],148.889,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[10.75,8.125,0],112.302,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[-4.75,3.5,0],217.302,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-2.875,-0.5,-0.000645638],336.154,true,false,[-0.337724,-0.764031],0,true,"",""],
	["Land_SatelliteAntenna_01_F",[7.93298,1.84232,3.11765],43.0376,true,false,[0,0],0,true,"",""],
	["Land_SatellitePhone_F",[10.9655,4.0276,1.54185],65.2817,true,false,[0,0],0,true,"",""],
	["Land_WoodenCrate_01_F",[8.258,10.5558,0],235.211,false,true,[0,0],0,false,"",""],
	["Land_WoodenCrate_01_F",[7.75,11.25,0],53.4613,false,true,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[-2.49175,2.21216,0],25.6195,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[6.125,10.25,0],314.153,true,false,[0,0],0,true,"",""],
	["O_LSV_02_armed_F",[-2.125,7.62497,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-2.68455,-2.17923,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-1.125,-2.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_supplyCrate_F",[8.375,5.375,1.5],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["RoadCone_L_F",[-0.141246,-9.43064,0],300,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-0.5,-6.125,0],345,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[1.5,-11.875,0],15,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[4.875,-11,0],345,true,false,[0,0],0,true,"",""]
]
