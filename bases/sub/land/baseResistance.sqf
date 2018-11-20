/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostSoulResistance
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
	to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomContainerLoadout;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Tower_F",[7.125,6.375,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Tower_F",[-7.413,-6.841,0],0,false,false,[0,0],0,false,"",""],
	["CamoNet_BLUFOR_open_F",[0,-0.625,0.875],90,false,false,[0,-0],0,false,"",""],
	["FlexibleTank_01_forest_F",[1.5,5,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_forest_F",[2.25,5,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_forest_F",[0.75,5,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[-11.125,-11.375,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[-11.125,-2.75,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[0.5,-12,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[3,9.125,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[8.25,-0.375,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[3,9.875,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[0.5,-12.875,0],0,true,false,[0,0],0,true,"",""],
	["Land_BagFence_Corner_F",[-9.125,-4.375,2.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Corner_F",[5.712,3.784,2.75],179.326,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Corner_F",[-6,-4.25,2.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Corner_F",[8.837,3.909,2.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[7,-8,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[2.76177,10.9438,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.5,-12.75,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-3.73823,12.4438,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[11.75,-2.5,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-11.9882,2.19383,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[9.67477,-0.465172,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[7.212,3.534,2.75],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-11.8632,6.81883,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[11.625,-7.125,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-7.5,-4,2.75],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-7.23823,7.69383,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-9.913,0.159004,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[1.375,-12.75,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-3,-11.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-1.61323,12.4438,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[0,-11.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-0.238232,10.9438,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-9.73823,7.94383,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-13.3632,4.44383,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[13.125,-4.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[9.5,-8.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[6.375,-10.625,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-6.61323,10.3188,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[-7.86323,6.94383,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[5.33723,5.15917,2.75],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-5.625,-5.625,2.75],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[-8.288,-1.466,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[7.625,-7.25,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[8.04977,1.15983,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[4.25,-11.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-4.48823,10.9438,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-3.36323,3.81883,2],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[3.125,-4.125,2],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.113232,7.06883,2],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[6.75,-1,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-7,0.625,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.125,-7.375,2],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[3.125,-4.125,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_Big_F",[-0.125,-7.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-3.36323,3.81883,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-0.113232,7.06883,0],180,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-2.98823,0.568832,0],90,true,false,[0,-0],0,true,"",""],
	["Land_LampShabby_F",[2.75,-0.875,0],270,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[3.38677,6.94383,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-3.625,-7.25,0],0,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[7.212,7.784,2.75],44.2588,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-9.87188,5.36751,0],314.326,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-7.5,-8.25,2.75],224.259,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[9.63365,-5.67368,0],134.326,true,false,[0,-0],0,true,"",""],
	["B_CargoNet_01_ammo_F",[-0.875,4.5,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_WpsSpecial_F",[7.07523,4.21517,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_WpsSpecial_F",[-7.375,-4.75,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PortableGenerator_01_F",[0.75,-4.375,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_SatelliteAntenna_01_F",[6.75,4.75,3.5],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_SatellitePhone_F",[6.625,5.875,3.875],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-0.125,-4.25,0],315,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[0.625,4.125,0],315,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-6.88258,1.98009,1.51242],0,true,false,[-0.335135,16.3406],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[8.16002,8.29269,0],45,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_TripodScreen_01_dual_v2_F",[0,-5.375,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
