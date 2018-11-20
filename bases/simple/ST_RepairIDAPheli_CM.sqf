/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_RepairIDAPheli_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["C_IDAP_Heli_Transport_02_F",[0,-0.00506514,-3.33786e-006],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["C_Offroad_01_repair_F",[5.284,10.5707,-0.000293255],55,true,false,[0,0],0,true,"","[this,true] call RELO_fnc_vehicleDisable;"],
	["Land_FoodSacks_01_cargo_brown_idap_F",[2.0211,-8.454,0],30,false,true,[0,0],0,false,"",""],
	["Land_FoodSacks_01_cargo_white_idap_F",[3.81816,-5.93562,0],340,false,true,[0,0],0,false,"",""],
	["Land_HelipadRescue_F",[-0.316,2.377,0],0,false,false,[0,0],0.504233,false,"",""],
	["Land_PaperBox_01_small_stacked_F",[-2.58842,-6.20816,0],35,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[4.07948,-8.25511,0],145,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[7.25905,7.03795,0],70,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.46883,-1.18648,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.46883,2.81352,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[5.77858,3.09314,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[5.7608,1.11629,0.659323],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[5.77858,7.09314,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.48661,0.836673,0.659323],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[5.81555,5.01965,0.650291],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.46883,6.81352,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.43186,4.74003,0.650291],90,false,false,[0,-0],0,false,"",""],
	["Land_TyreBarrier_01_line_x6_F",[5.77858,-0.906859,0],90,false,false,[0,-0],0,false,"",""]
]
