/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: Radio3_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Communication_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_CratesWooden_F",[3.5,4,-0.0340738],275.001,false,false,[0,0],0,false,"",""],
	["Land_CratesWooden_F",[-3.625,-4.125,-0.0340738],95.0006,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2.125,2.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.125,-2.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[0.625,5.375,0],155,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.12498,1.50001,-0.0340738],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-0.625,-5.5,0],335,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.39918,2.76463,-0.0340738],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.52413,-2.88961,-0.0340738],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.39311,2.75312,1],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.51807,-2.87811,1],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[7.00002,-1.62499,-0.0340738],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.48176,-6.19347,-0.0340738],335,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.25,7.875,0],220.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.60672,6.0685,-0.0340738],155,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-3.32898,-7.94249,-0.0340738],40.0003,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[7.37502,-5,-0.0340738],330,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-5.37499,-3.99999,-0.0340738],85.0003,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-7.49999,4.87502,-0.0340738],150,true,false,[0,-0],0,true,"",""],
	["Land_LampShabby_F",[5.25003,3.87502,-0.0340738],265.001,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-9.125,0,-0.0340738],270,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[9.00005,-0.124981,-0.0340738],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[-0.874973,11,-0.0340738],0.000748759,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.750014,-11.125,-0.0340738],180,false,false,[0,0],0,false,"",""],
	["Land_Sign_MinesDanger_English_F",[-2.375,4.25,0],180,false,false,[0,0],0,false,"",""],
	["Land_Sign_MinesDanger_English_F",[2.41509,-4.44065,0],0.000721439,false,false,[0,0],0,false,"",""]
]
