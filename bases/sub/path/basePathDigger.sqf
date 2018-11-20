/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: basePathDigger
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_corner_green_F",[-2.5,-3.625,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[5.25,4.125,0.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[5.25,4.125,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-1.25,4.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-1.5,-3.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.125,6.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.125,4.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.5,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.5,3,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.875,4.375,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,-0.75,0.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,-0.75,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,-3.75,0.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,-3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,2.125,0.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.625,2.125,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.5,-2,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[1,-3.25,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[6.625,-2.75,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.875,4.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.125,4.375,0.426136],0,false,false,[0,-30],0,false,"",""],
	["Land_BagFence_01_short_green_F",[5,-3.75,1.5],0,false,false,[0,0],0,false,"",""],
	["Land_Cargo_Patrol_V4_F",[4.375,0,4.76837e-007],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[7.25,3,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[-0.75,2.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[0.125,-4.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_FlowerPot_01_F",[-1.25,3.75,0],0,false,true,[0,0],0,false,"",""],
	["Land_FlowerPot_01_F",[-1.75,3.625,0],0,false,true,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[-3.125,3.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[-3.75,3,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[3.125,-4,0],270,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[3.75,-2.375,0],180,false,false,[0,0],0,false,"",""],
	["Land_Pipes_large_F",[-1.69859,-4.90858,0],0,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[5.125,-2.875,0],135,true,false,[0,-0],0,true,"",""],
	["Land_TrenchFrame_01_F",[-3.125,4.875,1],180,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[-5.125,2.625,1],90,false,false,[0,-0],0,false,"",""],
	["Land_TrenchFrame_01_F",[0.125,-7.625,1.25],1.36604e-005,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[6.375,-4.25,1.125],1.36604e-005,false,false,[0,0],0,false,"",""],
	["Land_WheelCart_F",[-2.875,1.625,0],45,false,true,[0,0],0,false,"",""],
	["Land_WoodenBox_F",[4.26146,2.87665,0],0,false,true,[0,0],0,false,"",""],
	["Land_WoodenBox_F",[4.26146,3.25165,0.5],330,false,true,[0,0],0,false,"",""],
	["Land_WoodenBox_F",[4.26146,3.62665,0],0,false,true,[0,0],0,false,"",""],
	["Land_Laptop_02_unfolded_F",[2.75,-2.875,0],135,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_medium_F",[-1.625,2.75,0],15,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_large_F",[2.625,-1.5,5.25],285,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_medium_F",[4.75,1.125,0],60,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_small_F",[6.375,1.5,5.375],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PressureWasher_01_F",[-4.375,-2.875,0],120,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"]
]
