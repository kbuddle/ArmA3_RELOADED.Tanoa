/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleFencedOffKajman
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["APERSTripMine",[4.625,-13.75,0],270,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[9.875,-4.5,0],180,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[-6.375,-9.5,0],8.69712e-005,true,false,[-0,0],0,true,"",""],
	["APERSTripMine",[8,2.125,0],90,true,false,[-0,-0],0,true,"",""],
	["Dirthump_2_F",[0.125,0.75,-2.125],90,false,false,[0,-0],0,false,"",""],
	["Flag_CSAT_F",[-5.5,10.375,0.125],0,false,false,[0,0],0,false,"",""],
	["FlexibleTank_01_sand_F",[-3,10.25,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[7.5,-4.875,0],0,true,false,[0,0],0,true,"",""],
	["FlexibleTank_01_sand_F",[7.5,-4,0],0,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_round_green_F",[-1.125,-7.125,0],45.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[1.125,-7.125,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-1.125,7.125,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[1.125,7.125,0],225,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-1.875,8,0],45.0001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-5.625,10,0],15.0001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-7,-11,0],15.0001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.5,-12,0],15.0001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[11.25,-13.375,0],315,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[13.5,-4.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[6,-9.25,0],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[6.25,8.75,0],45,false,false,[0,0],0,false,"",""],
	["Land_Net_Fence_4m_F",[-6.625,10.625,0],315,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_4m_F",[-6.625,-14.125,0],45,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_4m_F",[12.125,10.625,0],225,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_4m_F",[-4.625,-9.375,0],45,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_4m_F",[12.125,-14.125,0],135,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_4m_F",[-4.625,9.375,0],315,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-6,4,0],90,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-8,5.25,0],90,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-6,-4,0],90,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_8m_F",[8,-4,0],90,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_8m_F",[0.75,-10.75,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[6.75,12,0],180,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[0.75,10.75,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[6.75001,-15.5,0],180,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[13.5,-8.75,0],270,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[13.5,-2.75,0],270,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-8,-8.75,0],90,false,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-1.25,12,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[-1.25,-15.5,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_8m_F",[13.5,5.25,0],270,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_Gate_F",[-8,-1.75,0],90,true,false,[0,-0],0,true,"",""],
	["Land_Net_Fence_pole_F",[-6,8,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_Fence_pole_F",[8,8,0],0,false,false,[0,0],0,true,"",""],
	["Land_Net_FenceD_8m_F",[8.125,4,0],90.0001,false,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-5,7.625,4.76837e-007],15,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[4.75,-5,0],90,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[9.125,6.75,0],315,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[9.5,9.875,0],225,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[1.625,-11.75,0],105,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[9.25,-7.375,0],210,true,false,[0,0],0,true,"",""],
	["Land_TrenchFrame_01_F",[3.875,-1.875,1],270,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[3.875,-5.625,1],270,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[3.875,1.875,1],270,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[3.875,5.625,1],270,false,false,[0,0],0,false,"",""],
	["O_CargoNet_01_ammo_F",[5,3,0],0,true,false,[0,0],0,true,"",""],
	["O_Heli_Attack_02_dynamicLoadout_F",[0,0.00110751,1.19384],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["RoadCone_L_F",[-4,-4,0],75,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-4,4,0],105,true,false,[0,-0],0,true,"",""],
	["RoadCone_L_F",[-4,0,0],90,true,false,[0,-0],0,true,"",""],
	["RoadCone_L_F",[-4,-8,0],45,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-4,8,0],135,true,false,[0,-0],0,true,"",""]
]
