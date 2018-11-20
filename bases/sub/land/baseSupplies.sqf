/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostSoulSupplies
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
	["Land_Cargo_House_V3_F",[-4.25,6.25,4.76837e-007],0,true,false,[0,0],0,true,"",""],
	["Land_Cargo_HQ_V3_F",[2.375,-3.5,4.76837e-007],0,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V3_F",[2.5,7.5,4.76837e-007],180,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_3_F",[-9,0.125,1.35619],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-7.75,-11.25,1.34859],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[11.875,4.375,1.125],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-7.875,11.25,1.34733],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[11.875,-11.25,1.30799],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-9.125,5.625,1.30799],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[6.25,11.375,1.35619],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-8.375,-2.75,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[9,5,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[10.5,-11.875,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-10.5,0.75,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.875,12,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[12.5,-8.375,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-6.5,12,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[6.875,8.5,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-6.375,-11.875,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-10.5,5,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-8.375,-8.375,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.75,-11.875,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-8.5,8.5,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[4.75,12,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[12.5,-2.75,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[12.5,2.875,4.76837e-007],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[4.875,-11.875,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Box_FIA_Support_F",[1.125,-1.625,1.625],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_IND_Grenades_F",[-0.875,-2.75,4.375],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_IND_Support_F",[-0.875,-5.25,4.375],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_IND_WpsLaunch_F",[5.75,1.875,1.375],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_IND_WpsSpecial_F",[8.125,1.875,1.375],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_Laptop_F",[-6,9.375,1.625],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[-2.75,9.25,1.5],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[8.5,-0.625,1.75],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[5.375,-7.125,4.25],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[0.125,9.375,1],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[2.375,-5.625,4.625],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Laptop_F",[4,8.5,5.25],240,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["I_HMG_01_high_F",[-0.375,-0.125,3.375],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[8.25,-2.875,3.75],90,true,false,[0,-0],0,true,"",""],
	["I_HMG_01_high_F",[-0.375,-7.375,3.5],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-5,-8.12944,-0.00438261],0,true,false,[0,0],0,true,"",""],
	["Land_Tablet_02_F",[0.5,9,5],111.026,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[8.25,1.875,3.125],111.026,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[5.625,-7.875,4.875],111.026,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"]
]
