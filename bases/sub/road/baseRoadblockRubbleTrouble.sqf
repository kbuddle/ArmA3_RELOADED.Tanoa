/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: roadBlockRubbleTrouble
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
	["Box_CSAT_Equip_F",[8.75,1,0],345,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_NATO_Equip_F",[-2.25,-2.875,0],60,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["I_GMG_01_high_F",[-5.75,6,0],0,true,false,[0,0],0,true,"",""],
	["I_GMG_01_high_F",[5.75,-7,0],180,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_long_green_F",[3.5,-1.25,0],250,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,2,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.875,3.5,0],245,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4,-4,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,-4,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.875,-2,0],325,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4,5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,8,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4,-7,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4,-7,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4,8,0],270,false,false,[0,0],0,false,"",""],
	["Land_Fortress_01_bricks_v1_F",[1.375,-2.875,-0.375],90,false,false,[0,0],0,false,"",""],
	["Land_Fortress_01_bricks_v1_F",[0,-7,-0.375],0,false,false,[0,0],0,false,"",""],
	["Land_Fortress_01_bricks_v1_F",[0,7,-0.375],180,false,false,[0,0],0,false,"",""],
	["Land_Fortress_01_bricks_v1_F",[-1.5,3.625,-0.375],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[10.5,1,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[10.5,1,1.25],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-10.25,-0.625,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[10.5,-2.375,1.25],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-10.25,-0.625,1.125],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[10.5,-2.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[7,-3,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[-7,1.5,0],5.46415e-005,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[7,4,0],2.6467e-005,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[-7,-4,0],180,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[-4.25,3.125,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[4.25,-4.5,0],0,true,false,[0,0],0,true,"",""],
	["O_Quadbike_01_F",[-6.375,-2.89641e-007,0],90,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[6.25,1.125,0],280,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[5.5,-1.25,0],280,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Truck_03_ammo_F",[-0.25,0.24886,0.875],345,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"]
]
