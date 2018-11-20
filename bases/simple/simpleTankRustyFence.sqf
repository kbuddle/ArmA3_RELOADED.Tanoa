/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: simpleTankRustyFence
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Tank_rust_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_IndPipe1_ground_F",[-3.5,0,0],270,false,false,[0,0],0,true,"",""],
	["Land_CncBarrier_stripes_F",[-6.875,-2.875,0],45,false,false,[0,0],0,true,"",""],
	["Land_CncBarrier_stripes_F",[5,5,0],45,false,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-6.875,4.75,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[5.125,-2.75,0],0,true,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_long_d_F",[0,2,0],180,false,false,[0,-0],0,true,"",""],
	["Land_PlasticNetFence_01_long_d_F",[4,0,0],90,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_long_F",[0,-2,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_long_F",[0,4,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-4,-1,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-4,-3,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-4,1,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-4,3,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-4,5.125,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[-6,4,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_pole_F",[4,-4,0],0,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_roll_F",[2.875,-2.75,0],330,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_roll_F",[2.875,-3.5,0],350,false,false,[0,0],0,true,"",""],
	["Land_PlasticNetFence_01_short_d_F",[-5.875,2,0],270,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[-4.00002,-4,0],0.000475552,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[-6,6,0],180,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[-8,0,0],90,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[2,6,0],180,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[4,-4,0],0.000475552,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4",[6.00001,2.00001,0],270.001,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4_2",[-2.01869,6.0338,0],180,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4_2",[-8,4,0],90.0003,false,false,[0,-0],0,true,"",""],
	["Land_Wall_Tin_4_2",[0.0186796,-4.0338,0],0.000475552,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_4_2",[6.00001,-1.99999,0],270.001,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_Pole",[-8,-2,0],0,false,false,[0,0],0,true,"",""],
	["Land_Wall_Tin_Pole",[6,4,0],0,false,false,[0,0],0,true,"",""],
	["Banner_01_CSAT_F",[-8.09208,0.70504,0.75],90,false,false,[0,0],0,true,"",""],
	["Banner_01_CSAT_F",[6.05142,2.95891,0.735372],90,false,false,[0,0],0,true,"",""],
	["Land_Sign_MinesDanger_English_F",[-5.875,-1.875,0],45,false,false,[0,0],0,true,"",""],
	["Land_Sign_MinesTall_English_F",[6,6,0],225.001,false,false,[0,0],0,true,"",""],
	["APERSBoundingMine",[-6.00761,-1.99323,0],180,true,false,[-0,0],0,true,"",""],
	["APERSBoundingMine",[4,8,0],180,true,false,[-0,0],0,true,"",""],
	["APERSBoundingMine",[4.125,4.125,0],180,true,false,[-0,0],0,true,"",""],
	["APERSBoundingMine",[8,4,0],180,true,false,[-0,0],0,true,"",""],
	["APERSBoundingMine",[8,8,0],180,true,false,[-0,0],0,true,"",""]
]
