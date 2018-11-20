/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleIntel
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Intel_File1_F",[-1.125,3.875,0.729],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-1.5,-3.75,0.875],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[-1,-3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.75,5.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.875,2.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.75,5.875,0.875],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.625,5.875,0.875],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.875,2.5,0.875],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.75,-0.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.875,-0.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.75,2.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.75,2.5,0.875],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.75,-3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.625,5.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.25,5.125,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,-3.125,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.25,-3.125,0.875],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.125,5.125,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.25,-3.125,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.125,-3.75,0.875],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.875,5.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.875,5.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.125,-3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_Camping_Light_F",[-2.125,3.375,0.728848],0,true,false,[0,0],0,true,"",""],
	["Land_Cargo_House_V4_F",[0,0,0],0,true,false,[0,0],0,true,"",""],
	["Land_DataTerminal_01_F",[-2,1,0.592812],90.0001,true,false,[0,-0],0,true,"",""],
	["Land_DirtPatch_01_6x8_F",[3.625,-1.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[-3.25,-1.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[3.625,3,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[-3.25,3,0],0,false,false,[0,0],0,false,"",""],
	["Land_Laptop_device_F",[-1.75,3.625,0.728848],135,true,false,[0,-0],0,true,"",""],
	["Land_PCSet_01_mouse_F",[-1.375,3.75,0.728848],270,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[4.625,-2.5,0],45,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-4.625,-2.5,0],315,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-0.875,-1,0],0,true,false,[0,0],0,true,"",""],
	["Land_PortableLongRangeRadio_F",[-1.625,3.25,0.728848],315,true,false,[0,0],0,true,"",""],
	["Land_PortableSpeakers_01_F",[-1.5,3.875,0.728848],225,true,false,[0,0],0,true,"",""],
	["Land_SatelliteAntenna_01_F",[3.875,4,0],45,false,true,[0,0],0,false,"",""],
	["Land_SatelliteAntenna_01_F",[-4.125,4,0],315,false,true,[0,0],0,false,"",""],
	["Land_Tablet_02_F",[-2,3,0.728848],90,true,false,[0,-0],0,true,"",""],
	["Land_TTowerSmall_1_F",[2.875,-1,-4],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_TTowerSmall_1_F",[-2.875,-1,-3],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
