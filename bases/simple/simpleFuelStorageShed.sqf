/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: simpleFuelStorageShed
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Shed_05_F",[-0.5,-0.25,0],120.001,true,false,[0,-0],0,true,"",""],
	["Land_HBarrier_1_F",[0.875,3.875,0],300,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-3.75,2.125,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[0.75,3.875,1.25315],300.172,false,false,[-3.42839,-3.69108],0,false,"",""],
	["Land_HBarrier_1_F",[-2.875,-3.5,0],300,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-3,3.5,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-3.875,2.125,1.37826],209.907,false,false,[-2.88161,4.32787],0,false,"",""],
	["Land_HBarrier_1_F",[-3,-3.5,1.37815],300.172,false,false,[-3.42839,-3.69108],0,false,"",""],
	["Land_HBarrier_1_F",[-3.125,3.5,1.37826],209.907,false,false,[-2.88161,4.32787],0,false,"",""],
	["Land_HBarrier_1_F",[5.92785,-2.45076,0],150.001,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-2.99145,-5.67547,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[3.75855,5.44953,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[1.00855,-6.67547,0],250,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-6.36646,2.44953,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[3.75855,5.44953,1.25],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[4.81506,-4.94372,0],200,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[3.63355,-5.92547,0],200,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[5.875,-3.875,0],275,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-4.74146,5.19953,0],165,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-6.99146,-1.67547,0],240,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[2.50855,-6.80047,0],325,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-4.74146,5.19953,1.25],165,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-6.99146,-1.67547,1.25],240,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[7.00854,4.44953,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[7.00854,4.44953,1.25],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[8.69715,1.32576,0],275,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[8.75,2.75,0],150.001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_8m_F",[3.88355,1.69953,0.999291],0,false,false,[25,0],0,false,"",""],
	["Land_Plank_01_4m_F",[1.625,3.75,2.74982],34.9282,true,false,[-11.1073,-2.62843],0,true,"",""],
	["Land_LampShabby_F",[-7.875,0.25,0],85,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[7.75,3.875,0],260,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-0.741455,7.69953,-0.0726337],2.19329e-005,false,false,[-6.96158,-2.37767],0,false,"",""],
	["FlexibleTank_01_sand_F",[-0.74916,0.729222,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_sand_F",[-0.625,-1.375,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-0.25,2,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_sand_F",[-1.75,-1,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-1.5,1.375,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-2.649,-0.241139,0.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
