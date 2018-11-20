/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostGreenShot
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
	["I_GMG_01_high_F",[-2.5,8.5,0],0,true,false,[0,0],0,true,"",""],
	["I_GMG_01_high_F",[2.5,-9,0],180,true,false,[0,-0],0,true,"",""],
	["I_HMG_01_high_F",[8.5,-2,0],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-8.5,2,0],90,true,false,[0,-0],0,true,"",""],
	["IG_supplyCrate_F",[8.5,-7.5,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["IG_supplyCrate_F",[-8.5,7.5,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_Cargo_Patrol_V1_F",[8.5,8,4.76837e-007],180,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V1_F",[-8.5,-8,4.76837e-007],1.36604e-005,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_01_big_4_green_F",[12.148,8.499,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-11.852,8.499,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[11.852,-8.499,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-12.148,-8.499,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-5,-8.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[5,8,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[8.5,11,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[5,-8.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-5,8.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-8.5,-11,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[12,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-8.5,11,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-12,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[8.5,-11,0],0,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[4.5,-5.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[-4.5,5.5,0],180,true,false,[0,0],0,true,"",""],
	["Land_StoneWall_01_s_d_F",[5,-0.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_StoneWall_01_s_d_F",[-5,-0.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_StoneWall_01_s_d_F",[0,0,0],180,false,false,[0,0],0,false,"",""],
	["Land_StoneWall_01_s_d_F",[0,11,0],0,false,false,[0,0],0,false,"",""],
	["Land_StoneWall_01_s_d_F",[-0.0946038,-11.253,1.43051e-005],0,false,false,[0,0],0,false,"",""],
	["O_MRAP_02_F",[-0.5,-5.00175,-4.76837e-007],355,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-9.5,-2.5,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[7.5,3.5,0],225,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-9,-0.5,0],110,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Truck_02_Ammo_F",[0.5,6,0],15,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["RoadCone_L_F",[-3,-12.5,0],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[3,12.5,0],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-3,12.5,0],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[3,-12.5,0],0,true,false,[0,0],0,true,"",""]
]
