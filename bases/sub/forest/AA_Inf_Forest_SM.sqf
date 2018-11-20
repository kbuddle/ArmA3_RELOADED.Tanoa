/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Forest_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Box_FIA_Ammo_F",[3.84633,-1.68755,0],179.759,true,false,[0,-0],0,true,"",""],
	["CamoNet_BLUFOR_F",[-6.78135,-1.2647,0],269.951,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[-0.21617,-10.7999,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[0.0560472,7.42818,0],178.684,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[5.52651,4.54341,0],271.959,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[5.66322,-8.72368,0],268.391,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-2.43297,-9.38725,0],0.96247,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.20839,6.41499,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.36537,-10.4761,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-0.752791,2.01118,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-0.884382,-6.16655,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-2.31236,5.42134,0],269.114,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.0746,-6.19682,0],270.766,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[6.1703,-2.01811,0],90.93,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[7.80849,-2.10161,0],90.93,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[-4.27769,-6.51616,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[3.24208,0.534133,0],2.20476,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[4.48891,-4.64458,0],180.901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-4.27647,0.284133,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[8.81264,0.546828,0],0.80015,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[9.33461,-4.14409,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_Pallet_F",[6.81833,-4.1946,1.39125],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[7.01796,0.0727072,1.20339],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[7.06824,-2.69567,1.35967],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[7.11563,-1.33082,1.35321],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[8.27092,-1.3824,1.5306],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[8.33018,-4.18893,1.41822],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[8.44381,-2.67453,1.46208],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[8.53375,0.110849,1.20121],0,false,true,[0,0],0,false,"",""],
	["Land_Pod_Heli_Transport_04_ammo_F",[-6.60338,-0.481004,0],180.04,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-0.852381,1.85775,2.43719],130.793,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[-1.12271,-6.22944,2.43661],53.1171,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[9.26685,-4.92785,1.53556],302.476,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[9.55543,0.934838,1.23373],234.961,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[0.195207,7.21675,0],358.015,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-0.421248,-11.0591,0],181.155,true,false,[0,0],0,true,"",""],
	["O_static_AA_F",[7.08166,-1.13363,1.5573],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[7.20627,-3.86491,1.59534],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
