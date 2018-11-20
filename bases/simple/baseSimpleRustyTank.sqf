/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleRustyTank
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Flag_CSAT_F",[0.125,-3.875,-1.375],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.25,-3.5,0.875],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.375,3.5,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.5,-3.375,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.25,-3.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-3.375,3.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[3.5,-3.375,0.875],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.375,3.75,0.875],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.625,3.75,0.875],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.75,-3.75,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.375,3.75,0],0.000287722,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.25,-3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.625,3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0,-3.75,0.875],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[1.125,0.375,0],135,false,false,[0,-0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[-1,0.375,0],315,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[3.625,0.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[2.125,-4.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[-1.875,4.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[2.125,4.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[-1.875,-4.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_empty_F",[0.375,-3,0],180,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_empty_F",[2.125,-3,0],180,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_empty_F",[1.25,-3,0],180,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[-2.25,-3,0],180,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[-0.5,-3,0],180,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[-1.375,-3,0],180,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-2.85636,2.94266,0],315,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[2.875,3,0],45,true,false,[0,0],0,true,"",""],
	["Land_Tank_rust_F",[-0.125,0.25,0],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WoodenCrate_01_stack_x5_F",[-4.125,0.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_WoodenShelter_01_F",[0,-2.375,0.5],180,false,false,[0,0],0,false,"",""]
]
