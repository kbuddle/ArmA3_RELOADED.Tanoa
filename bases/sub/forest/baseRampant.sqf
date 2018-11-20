/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostSoulRampant
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
	["Land_Cargo_Patrol_V2_F",[-0.25,-6.125,0.000378132],0,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V2_F",[-0.25,6.125,0.000378132],180,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_3_F",[-7,-2.5,0.000378609],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[6.625,2.25,0.000377655],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-8.875,0.875,0.000342369],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[6.375,6.625,1.25038],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-6.875,6.625,1.25038],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[8.625,-1.125,0.000377655],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-6.875,-6.75,1.25038],45,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[6.5,-6.75,1.25038],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[5.5,-2,0.000377178],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.125,7.625,0.000378609],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.25,2,0.000379562],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-5.875,2,0.000377655],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-5.75,7.625,0.000378132],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[7.5,-5.625,0.000379086],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[5.375,-7.75,0.000378609],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-7.875,5.5,0.000377655],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-5.875,-7.75,0.000378609],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.25,-7.75,0.000378609],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-7.875,-5.75,0.000377655],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[5.5,7.625,0.000377655],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.125,-2,0.000377655],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[11,0,0.000377655],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-11.375,-0.125,0.000377655],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[7.5,5.625,0.000378609],270,false,false,[0,0],0,false,"",""],
	["Box_FIA_Wps_F",[-5,4.801,0],90,false,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_FIA_Wps_F",[4.75,-5,0],270,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_AirConditioner_01_F",[1.25,7.25,5],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_02_F",[12.25,10.375,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_03_F",[-10.125,4.25,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_03_F",[-9.75,-6.625,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_03_F",[-5.5,-5.625,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_03_F",[5.875,4.5,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_04_F",[10.5,-6.75,0],45,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_LampShabby_F",[3,-2,0.000377655],270,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-3.375,2,0.000377655],90,true,false,[0,-0],0,true,"",""]
]
