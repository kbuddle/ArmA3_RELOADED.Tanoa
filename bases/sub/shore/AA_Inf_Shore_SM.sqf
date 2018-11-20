/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Shore_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Tower_F",[9.86021,0.789063,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-2.26894,4.01074,0.189942],89.5558,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-2.30166,-3.80029,0.265499],89.5558,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[1.13853,-3.95508,0],89.5558,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[1.38804,3.96484,0],89.5558,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-1.5248,1.72852,0],38.0849,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-1.5917,6.35889,0],132.656,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-1.6498,-1.48975,0],133.267,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-1.76675,-5.97168,0],51.5343,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[0.418557,-1.44922,0],220.378,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[0.720071,1.88867,0],313.922,false,false,[0,0],0,false,"",""],
	["Land_Breakwater_01_F",[-8.371,-3.31,-2],90,false,false,[0,-0],0,false,"",""],
	["Land_Breakwater_01_F",[-8.391,5.424,-2],90,false,false,[0,-0],0,false,"",""],
	["Land_CncShelter_F",[10.8341,14.71,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[11.4708,-12.231,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierTower_F",[5.5897,11.0737,0],175.616,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierTower_F",[6.07432,-9.33496,0],355.593,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.913718,-8.43799,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.913718,10.668,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[12.2716,5.33154,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall6_F",[12.3983,-3.0835,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall_corridor_F",[10.8294,12.1997,0],272.574,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corridor_F",[11.4696,-9.95996,0],272.574,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[12.3433,8.62552,1.23585],215.391,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[12.7063,-6.4997,1.23018],328.937,true,false,[0,0],0,true,"",""],
	["Land_SandbagBarricade_01_half_F",[0.445657,0.171875,0],88.2424,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[2.13023,8.19434,0],307.782,false,false,[0,0],0,false,"",""],
	["O_static_AA_F",[-0.526267,4.15771,0],181.896,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[-0.644187,-3.93604,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
