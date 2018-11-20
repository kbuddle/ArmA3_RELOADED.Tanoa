/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_IntelLaptop_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_long_green_F",[4.57608,-2.0918,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.62939,6.65468,0.477944],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.30355,0.687924,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.10586,6.64091,0.477944],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.31948,0.716087,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.08993,6.61274,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.56575,3.3777,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.32304,3.52995,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.5837,0.392936,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.26785,-1.85242,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.56777,0.421099,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.28378,-1.82425,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.33897,3.55811,0.477944],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.64532,6.62651,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.59201,-2.11996,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.58168,3.34953,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.92678,-4.16694,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.66122,5.974,0.477944],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.64528,5.94584,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.91815,5.9626,0.477944],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.54586,-4.04667,0],40,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.93409,5.93444,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[1.9347,-4.75696,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[1.91877,-4.7288,0.477944],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-1.66497,-4.62547,0.477944],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-1.64903,-4.65363,0],0,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[0.824136,4.27697,0.728848],0,true,false,[0,0],0,true,"",""],
	["Land_Cargo_House_V4_F",[0,0.75,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[2.25,-0.75,0],180,true,false,[0,0],0,true,"",""],
	["Land_Laptop_02_unfolded_F",[1.25,4.25,1.625],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Pallet_MilBoxes_F",[-1.625,-0.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_SatelliteAntenna_01_F",[1.625,1.5,3.118],50,false,false,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[-2.875,-3.125,0],215,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[2.75,-3.5,0],140,true,false,[0,-0],0,true,"",""]
]
