/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleRustyTankTwo
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_end_green_F",[-6.25,-1.375,0.75],75,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-6.125,1.75,0.75],285,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-2,-2.75,0.75],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[1.625,-2.75,0.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.25,2.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.125,2.875,0.75],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.25,-2.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.25,-2.75,0.75],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.5,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.125,2.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.5,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.5,0,0.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.5,0,0.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,-2.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,2.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.5,0,1.5],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.5,0,1.5],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.125,-2.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,-2.125,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.625,2.25,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,2.25,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.5,0.125,0.75],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.5,0.125,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.625,-2.125,0],45.0002,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[6,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,-2.125,0.75],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,2.25,0.75],225,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[3.125,-0.25,0],45,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[-2.125,-0.125,0],0,false,false,[0,0],0,false,"",""],
	["Land_IRMaskingCover_01_F",[0,-0.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[0,-6.25,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[0,6.25,0],0,true,false,[0,0],0,true,"",""],
	["Land_Tank_rust_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]"],
	["Land_Wired_Fence_4m_F",[8.125,2,0],270,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_4m_F",[-8,-2,0],270,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_4m_F",[8.125,-2,0],270,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_4m_F",[-8,2,0],270,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[4,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[-4,4,0],0,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[-4,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[4,4,0],0,false,false,[0,0],0,false,"",""]
]
