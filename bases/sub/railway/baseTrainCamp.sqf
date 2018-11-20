/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseTrainCamp
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
	["Land_BagFence_01_long_green_F",[2.625,-5.375,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.5,6.75,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.75,1.125,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.75,5.5,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,2.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,-2.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.75,-5.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.125,8.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.625,5.25,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2,-7.625,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.875,7.875,0],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-3.25,-2.625,0],230,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.875,-1.375,0],35,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-2,-7.75,0],40,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[1.875,7.75,0],220,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-5.75,3.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Camping_Light_F",[-1.5,4.875,0],0,true,false,[0,0],0,true,"",""],
	["Land_Camping_Light_F",[-1.99404,-5.99107,9.53674e-007],0,true,false,[-4.323,2.89709],0,true,"",""],
	["Land_CampingChair_V2_F",[1.875,-4,0],135,false,true,[0,-0],0,false,"",""],
	["Land_CampingChair_V2_F",[1,-4.375,0],210,false,true,[0,0],0,false,"",""],
	["Land_CampingTable_F",[1.625,-2.25,0],90,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_01_line_1_green_F",[0,8.25,0.0414023],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[0,-8.25,0.170615],90,false,false,[0,0],0,false,"",""],
	["Land_IRMaskingCover_01_F",[-1,0.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_RailwayCar_01_passenger_F",[5.625,6.75,0],340,false,true,[0,0],0,false,"",""],
	["Land_RailwayCar_01_sugarcane_empty_F",[4,-4.625,0],340,false,true,[0,0],0,false,"",""],
	["Land_RailwayCar_01_sugarcane_empty_F",[6.5,-5.25,0],350,false,true,[0,0],0,false,"",""],
	["Land_RailwayCar_01_tank_F",[-3.337,2.314,0.0289998],351.973,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Razorwire_F",[0,-9.75,0.0414052],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-7,3.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0,9.875,0.0414019],0,false,false,[0,0],0,false,"",""],
	["Land_Track_01_30deg_F",[-2.54765,0.465283,0.036068],330,false,false,[0,0],0,false,"",""],
	["Land_Track_01_3m_F",[5.75,-1.375,0.25],230,false,false,[0,0],0,false,"",""],
	["Land_Track_01_3m_F",[5.75,-1.375,0.625],200,false,false,[0,0],0,false,"",""],
	["Land_Track_01_3m_F",[5.75,-1.375,0],220,false,false,[0,0],0,false,"",""],
	["Land_Track_01_bumper_F",[-3.63845,6.05709,0.0361533],0,false,false,[0,0],0,false,"",""],
	["Land_Track_01_switch_F",[-5.25,-5.625,0],180,false,false,[0,0],0,false,"",""],
	["Land_Track_01_turnout_left_F",[-0.625,-5.625,0.0302863],0,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[-1.5,2.25,0],0,false,false,[0,0],0,false,"",""],
	["O_supplyCrate_F",[-5.125,-4.5,0],180,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_supplyCrate_F",[1.75,3.75,0],90,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"]
]
