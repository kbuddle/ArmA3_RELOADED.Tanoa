/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: BridgeIntelSecure_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_small_green_F",[0.936802,-0.892002,0],270,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_round_green_F",[-0.625,-3.375,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,-0.25,0.625],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,-0.25,0],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,-2.125,0],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,2.25,0.625],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,2.25,0],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,4.125,0.625],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.625,4.125,0],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.125,1.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.5,-4.875,0.625],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.5,-4.875,0],0.000122943,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[-0.375,7.5,0],5.20802e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[0.125,-9.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-2.098,-6.94,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-2.25,7.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[2,-9.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[2.015,5.013,0],180,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[1.8192,-0.890765,0],90,true,false,[0,0],0,true,"",""],
	["Land_CzechHedgehog_01_F",[-1.75,-11.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[1.625,9.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[2,-11,0],0,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[-1.75,7,0],1.53679e-005,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[-3.71445,4.98205,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[-3.73892,0.982628,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[-3.761,-3.029,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[-3.78035,-7.03168,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[0,-13.875,0],360,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[0,11.875,0],1.53679e-005,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[1.625,-9,0],1.53679e-005,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[1.625,-9,0],1.53679e-005,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[3.61362,-7.06297,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[3.63903,-3.04256,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[3.65522,0.997092,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_ConcreteWall_F",[3.67013,5.03077,0],90,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-2.75,6,0],315,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[2.5,-7.875,0],135,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-1.375,6.25,0],180,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[1.125,-8.125,0],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-2.75,-5.5,0],180,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[2.5,3.625,0],0,true,false,[0,0],0,true,"",""],
	["Box_East_Ammo_F",[0.625,-1.5,0],15,true,false,[0,0],0,true,"",""],
	["Box_East_Ammo_F",[2.5,1.875,0],270,true,false,[0,0],0,true,"",""],
	["Land_Tablet_02_F",[1.75,-0.625,0.875],250,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_forest_F",[-2.125,3.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-3,0.5,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-3,1.375,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-3,3.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[-3.00233,-1.22549,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["FlexibleTank_01_forest_F",[2.75,-4,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
