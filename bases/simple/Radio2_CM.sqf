/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: Radio2_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["APERSMine",[-4.75,-4,0],180,true,false,[-0,0],0,true,"",""],
	["APERSMine",[-4.75,4,0],180,true,false,[-0,0],0,true,"",""],
	["APERSMine",[-4.75,0,0],180,true,false,[-0,0],0,true,"",""],
	["APERSMine",[-2.875,1,0],180,true,false,[-0,0],0,true,"",""],
	["APERSMine",[-2.875,-1,0],180,true,false,[-0,0],0,true,"",""],
	["Land_BagFence_01_long_green_F",[-6,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.00575,-2.86882,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.98777,2.89671,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[0,1.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-0.115803,-6.61386,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[6.87258,4.04682,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-3.96125,6.86899,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-1.5,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[3.76118,6.85073,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-3.88638,-6.58685,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[1.5,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[0,-1.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[6.92587,-3.83134,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[3.70725,-6.64959,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[6.95117,0.0942969,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-0.0289228,6.84302,0],0,false,false,[0,0],0,false,"",""],
	["Land_Communication_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_DirtPatch_01_4x4_F",[0,0,0],45,false,false,[0,0],0,false,"",""],
	["Land_LampHarbour_F",[3.10815,3.21533,0],225,true,false,[0,0],0,true,"",""],
	["Land_LampHarbour_F",[-3.26685,-3.28467,0],45.0001,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-0.0417101,3.47297,0],180,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WiredFence_F",[-0.0841997,-3.44254,0],0,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[3.375,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFenceD_F",[-3.61342,0.0790219,0],90,false,false,[0,0],0,false,"",""],
	["Land_Sign_MinesDanger_English_F",[-2,0,0],90,false,false,[0,0],0,false,"",""]
]
