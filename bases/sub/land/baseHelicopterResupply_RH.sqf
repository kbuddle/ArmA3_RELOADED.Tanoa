/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseHelicopterResupply_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_small_green_F",[-6.875,13.25,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[7.05457,-12.6251,0],358,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[6.55457,-0.25015,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[2.42957,3.99985,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-3.32043,3.99985,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-6.32043,-0.12515,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-5.94543,-10.7501,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.320434,3.99985,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-6.32043,2.74985,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-6.32043,-3.12515,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[6.55457,2.62485,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-6.32043,-3.25015,0.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[6.55457,-3.00015,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-5.94543,-10.7501,0.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-5.82043,-7.62515,0],51,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[6.30457,-9.00015,0],304,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[9.92957,8.74985,0],237,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[10.25,6.625,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[-9.625,12.75,0],296,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-8.82043,-2.25015,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[10.25,6.625,0.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[-10.375,11.25,0],296,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-10.1954,-6.62515,1.25],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-7.07043,8.37485,0],296,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-5.19543,3.99985,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-7.19543,2.99985,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-7.07043,8.37485,0.75],296,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[6.55457,-5.12515,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Cargo_House_V4_F",[1.375,9,0],0,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_01_line_1_green_F",[-8.03496,7.19522,0],114,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[9.875,-11.75,0],89,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-8.03496,7.19522,1.25],114,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[9.875,-11.75,1.25],89,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-9.32043,-13.5001,1],1,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-10.3204,5.74985,1],114,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-10.3204,5.74985,0],114,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-9.32043,-13.5001,0],1,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3,14.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.875,14.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-2.07043,-13.8751,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[2.30457,-13.8751,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-2.07043,-13.8751,1],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[2.30457,-13.8751,1],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.25,14.625,1],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[8.875,12.25,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.875,14.625,1],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.25,14.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[8.75,12.375,1],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3,14.625,1],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[9.55457,-5.37515,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-9.94543,-8.62515,0],272,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-9.82043,-0.62515,0],272,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[9.42957,1.62485,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HelipadCircle_F",[0.055,-2.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[6.55457,-6.87515,0],268,false,false,[0,0],0,false,"",""],
	["Land_SatelliteAntenna_01_F",[2.412,10.389,3.118],0,true,false,[0,0],0,true,"",""],
	["Land_SatellitePhone_F",[-0.498709,12.2487,1.62499],289,true,false,[0,0],0,true,"",""],
	["Land_TableDesk_F",[-0.625,12.125,0.75],91,true,false,[0,-0],0,true,"",""],
	["O_Heli_Light_02_dynamicLoadout_F",[0.055,-2.61068,-0.00282145],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_HMG_01_high_F",[6.75,-13.125,0],180,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-6.80457,14.2501,0],0,true,false,[0,0],0,true,"",""]
]
