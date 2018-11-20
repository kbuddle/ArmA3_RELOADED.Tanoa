/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: simpleFuelDestroyTwo
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Cargo_House_V4_F",[0,0,0],0,true,false,[0,0],0,true,"",""],
	["Land_BambooFence_01_s_4m_F",[-3.875,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[-3.875,6,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[-5.875,4,0],270,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[3.875,6,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[0,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[-5.875,-2,0],270,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[0,6,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_4m_F",[3.875,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_d_F",[6.875,6,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_d_F",[-5.875,7,0],270,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_d_F",[6.875,-4,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_d_F",[-5.875,-5,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BambooFence_01_s_pole_F",[6,0,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_pole_F",[6,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_pole_F",[6,-2,0],0,false,false,[0,0],0,false,"",""],
	["Land_BambooFence_01_s_pole_F",[6,4,0],0,false,false,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[3.875,2.375,0],195,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[3.625,2.125,0],180,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[3.75,1.75,0],345,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[3.75,1.25,0],285,false,true,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[0.625,-2.5,0],60,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[-3.625,-0.25,0],270,true,false,[0,0],0,true,"",""],
	["Land_Pallets_F",[4.5,0.25,0],45,false,false,[0,0],0,false,"",""],
	["Land_PalletTrolley_01_khaki_F",[5,1.875,0],195,false,true,[0,0],0,false,"",""],
	["FlexibleTank_01_forest_F",[0.5,3.625,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[0.5,2.75,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-0.5,2.75,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-1.5,2.75,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[1.5,2.75,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-0.5,3.625,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[1.5,3.625,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-1.5,3.625,1],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_sand_F",[-6.5,-3.875,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_sand_F",[-6.5,-2.875,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Sacks_heap_F",[4.25,3.375,0],0,false,false,[0,0],0,false,"",""]
]
