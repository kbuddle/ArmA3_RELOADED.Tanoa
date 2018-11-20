/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseTrainDerailedFuel
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
	["Land_Barricade_01_10m_F",[-0.125,-4.75,0.048243],180,false,false,[0,-0],0,false,"",""],
	["Land_Barricade_01_10m_F",[-1.25,7.625,0],315,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[0,-8.25,0.0414047],180,false,false,[0,0],0,false,"",""],
	["Land_Locomotive_01_v1_F",[1.125,5.375,0.25],45,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-4,-2.375,0],225,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[3.875,-2.5,0],135,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-1.125,-6.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[3,8.125,0],180,true,false,[0,0],0,true,"",""],
	["Land_RailwayCar_01_tank_F",[0,2.08005e-007,0.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
