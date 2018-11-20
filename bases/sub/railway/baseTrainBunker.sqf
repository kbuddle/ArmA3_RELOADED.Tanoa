/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseTrainBunker
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
	["Land_BagBunker_01_small_green_F",[-0.124993,7,0.0409999],180,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[0,-7,0.0409999],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[2.375,-6,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-2.49999,6,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[2.25001,6.125,0],0.000311627,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-2.375,-6.125,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[2.875,5.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[2.375,3,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.62501,1.37499,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,-4.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.75,4.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.75,1.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,-1.5,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.375,-3,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.75,-5,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-2.75,0,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[2.625,0,0],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[1.875,-4.75,0],145,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-1.875,4.75,0],315,true,false,[0,0],0,true,"",""],
	["Land_RailwayCar_01_tank_F",[0,1.125,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_HMG_01_high_F",[0.25,6.875,0.0881333],0.000389748,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-0.25,-6.875,0.0961905],180,true,false,[0,0],0,true,"",""],
	["O_supplyCrate_F",[0,-2.625,0.5],180,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"]
]
