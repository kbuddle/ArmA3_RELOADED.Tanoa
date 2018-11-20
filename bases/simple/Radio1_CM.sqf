/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: Radio1_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_end_green_F",[4.75,-5.375,0.75],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[4.75,-0.875,0.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[4.75,-1.625,0.75],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.75,-3.625,0.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.25,2.75,0],60.0003,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.75,-1.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.75,-4.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.125,-2.375,0],75.0003,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.0703,-4.26218,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.875,3.625,0],30,false,false,[0,0],0,false,"",""],
	["Land_Communication_F",[-0.75,0.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_HBarrier_01_line_1_green_F",[-2.26929,4.9958,0],160,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[1.34424,5.26603,0],190,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.37838,4.47873,0],150,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.60056,4.38992,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-2.88162,0.0367078,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-1.08415,5.28709,0],170,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[2.52029,4.95092,0],200,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-1.05181,-6.26402,0],10,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.30813,-5.38791,0],30,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-2.75,1.25,0],100,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[0.138233,5.38063,0],180,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-2.22786,-5.94891,0],20,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[0.154197,-6.37863,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[1.37658,-6.28509,0],350,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[2.56171,-5.99379,0],340,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.67081,-5.47672,0],330,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-2.77506,-1.18235,0],80,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[3.25,3.875,0],305,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[-3,-4.875,0],125,true,false,[0,-0],0,true,"",""],
	["Land_Razorwire_F",[8,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-7,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_TBox_F",[2.75,-0.25,0],0,true,false,[0,0],0,true,"",""]
]
