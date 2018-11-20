/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseTrainSeize
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
	["Box_CSAT_Uniforms_F",[4.63249,0.787667,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_CSAT_Uniforms_F",[-4.55792,-0.7985,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_Barricade_01_4m_F",[-7.25009,3.62598,0],285,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[7.24991,-3.62402,0],105,false,false,[0,-0],0,false,"",""],
	["Land_Barricade_01_4m_F",[2.87491,8.00098,0],45,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[-2.87509,-7.99902,0],225,false,false,[0,0],0,false,"",""],
	["Land_ConcreteKerb_03_BY_long_F",[-8.61816e-005,10.876,0.148336],0,false,false,[0,0],0,false,"",""],
	["Land_ConcreteKerb_03_BY_long_F",[-8.61816e-005,-10.874,0.0872388],180,false,false,[0,0],0,false,"",""],
	["Land_Locomotive_01_v1_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PortableLight_single_F",[2.375,-0.75,0],180,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.5,0.875,0],0,true,false,[0,0],0,true,"",""],
	["Land_SandbagBarricade_01_F",[-2.37509,2.00098,0],180,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[2.37491,-1.99902,0],360,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[5.87491,-0.999023,0],90,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[-4.62509,-2.49902,0],180,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[4.62491,2.50098,0],360,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[-5.87509,1.00098,0],270,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[2.24991,-6.12402,0],90,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[-2.25009,-6.12402,0],270,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[2.24991,6.12598,0],90,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[-2.25009,6.12598,0],270,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[-6.00009,-2.99902,0],270,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_F",[5.99991,3.00098,0],90,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[1.62491,-7.99902,0],150,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-1.75009,-7.87402,0],225,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[3.19554,-5.41952,0],180,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-4.75009,-6.49902,0],180,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[4.74991,6.50098,0],0,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-1.62509,8.00098,0],330,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[1.74991,7.87598,0],45,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-5.67058,3.12337,0],285,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[5.67041,-3.12142,0],105,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-3.19571,5.42147,0],0,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-4.87509,4.62598,0],315,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[4.87491,-4.62402,0],135,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[5.99991,1.00098,0],90,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-8.61816e-005,-8.49902,0],180,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-8.61816e-005,8.50098,0],0,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-6.00009,-0.999023,0],270,false,false,[0,0],0,false,"",""],
	["Land_Track_01_bumper_F",[-8.61816e-005,11.126,0.140794],180,false,false,[0,0],0,false,"",""],
	["Land_Track_01_bumper_F",[-8.61816e-005,-11.124,0.237239],0,false,false,[0,0],0,false,"",""],
	["Land_WoodenShelter_01_F",[-8.61816e-005,6.75098,0],0,false,false,[0,0],0,false,"",""],
	["Land_WoodenShelter_01_F",[-8.61816e-005,-6.74902,0],180,false,false,[0,0],0,false,"",""]
]
