/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: baseBridgeCharlie_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_01_long_green_F",[-0.749277,-2.6499,0],105.795,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.07356,1.45816,0],179.954,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.75044,3.68642,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.77748,0.7403,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.78332,-5.02188,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.78416,-2.12965,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.929137,-1.39768,0],179.849,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.75,2.375,0],164.849,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.84067,4.93053,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.85372,1.99311,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.86743,-0.844656,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.87922,-3.69021,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.75,-2.625,0.75],105.795,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.0498,1.46565,0.8],179.954,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.75791,3.71019,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.78496,0.764064,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.7908,-4.99812,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.79163,-2.10588,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.952882,-1.39014,0.8],179.849,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.77098,2.38842,0.738692],164.849,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.84625,2.01687,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.87174,-3.66645,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_Barricade_01_10m_F",[-0.101665,10.9431,0],240.342,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_10m_F",[0.0103962,-10.446,0],56.7942,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[-2.10648,5.85907,0],182.796,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[2.17386,-5.44673,0],359.247,false,false,[0,0],0,false,"",""],
	["Land_PalletTrolley_01_khaki_F",[2.625,-3.125,0],195,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[0.25,-2.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-2.75,0.625,0],285,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[3,5.75,0],45,false,false,[0,0],0,false,"",""],
	["Land_Sacks_goods_F",[1.625,-5.375,0],315,false,false,[0,0],0,false,"",""],
	["Land_Sacks_heap_F",[1,-4.625,0],120,false,false,[0,-0],0,false,"",""],
	["Land_Sacks_heap_F",[2.5,-4.625,0],225,false,false,[0,0],0,false,"",""],
	["Box_East_AmmoVeh_F",[-2.125,3.25,0],0,true,false,[0,0],0,true,"",""],
	["Box_East_Ammo_F",[0.375,-0.75,0],270,true,false,[0,0],0,true,"",""],
	["Box_East_WpsLaunch_F",[3,0.875,0],270,true,false,[0,0],0,true,"",""],
	["Box_East_Wps_F",[1.875,-0.375,0],330,true,false,[0,0],0,true,"",""],
	["Land_Tablet_02_F",[2.5,-2.5,0.81],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_medium_F",[3,3.375,0],45.0002,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PortableGenerator_01_F",[-3,-0.75,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Pallet_MilBoxes_F",[1.875,-3,0],285,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
