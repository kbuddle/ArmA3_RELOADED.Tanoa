/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: simpleTankGreenWalls
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Tank_rust_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_LampShabby_F",[-3,-2.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[3,2.5,0],180,true,false,[0,0],0,true,"",""],
	["Land_Mil_WallBig_4m_battered_F",[-4,-3.5,0],0.000297967,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[-4,3.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[-8.75,-3.625,0],65.0003,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[-8.75,3.625,0],115,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[-9.5,0,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[0,3.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[1.90735e-006,-3.5,0],0.000297967,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[4,-3.5,0],0.000297967,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[4,3.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[7.875,-6.125,0],160,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[8.25,0,0],90.0003,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[9,-3.625,0],65.0003,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_battered_F",[9,3.625,0],115,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_center_F",[3.75,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_center_F",[7.625,6,0],10,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_left_F",[-6.375,5.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_right_F",[-3.875,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_right_F",[-6.125,-5.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_debris_F",[-6.875,0.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.875,8.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[2,-6.625,0],0,false,false,[0,0],0,false,"",""]
]
