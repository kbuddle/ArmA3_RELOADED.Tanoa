/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Forest_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_small_green_F",[-1.3357,9.01575,0],178.684,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[-1.60791,-9.21228,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[4.13476,6.13099,0],271.959,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[4.27148,-7.1361,0],268.391,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[5.50244,-0.422726,0],268.391,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.82471,-7.79968,0],0.96247,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.81665,8.00257,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.97363,-8.88855,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-0.280031,-4.59167,0],270.249,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-2.12647,3.37268,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-2.27442,-4.57019,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-4.05835,7.05579,0],271.968,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[-5.71973,-4.91296,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[1.85034,2.12171,0],2.20476,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[3.09717,-3.057,0],180.901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-5.66236,1.84827,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[7.4209,2.1344,0],0.80015,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[7.94287,-2.55651,0],90.9813,false,false,[0,-0],0,false,"",""],
	["Land_Pod_Heli_Transport_04_ammo_F",[-8.19654,0.767216,0],180.04,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-0.247579,2.32793,1.25038],176.078,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[1.04713,-3.43399,1.2454],0,true,false,[0,0],0,true,"",""],
	["CamoNet_BLUFOR_F",[-8.1731,0.32288,0],269.951,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[6.45703,-0.079464,0],268.696,false,true,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[6.38257,-0.521847,0.813005],264.54,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-1.19654,8.80433,0],358.015,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-1.81299,-9.47155,0],181.155,true,false,[0,0],0,true,"",""],
	["Box_FIA_Ammo_F",[1.94482,0.478153,0],179.759,true,false,[0,-0],0,true,"",""],
	["B_SAM_System_02_F",[5.605,-0.287,2.005],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
