/*
	fn_objectsGrabber by soulkobk.
	mission: RunwayKajman_CM
	world: VR
	center position: [0,0,0]
	radius: 100
	array list: [objectClass, objectPosition, objectDirection, objectSimulation, _objectSimpleObject, _objectPitchBank, objectDamage, _objectAllowDamage, objectVarName, objectInit]
*/

[
	["Land_HelipadCircle_F",[-0.0178761,0.0229766,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-0.5,-10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-0.5,10,0.625],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-0.5,10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-4.625,-10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-4.625,10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.5337,5.56233,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-6.875,-7.5,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-7.25,1.5,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[-7.9663,-2.56233,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[3.625,-10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[3.625,10,0],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[6.9087,-5.18733,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[7.625,-1.125,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[7.625,-8,0],225,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[8.375,2.875,0.625],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_line_x6_F",[8.375,2.875,0],280,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_F",[7,-5,0.625],0,true,false,[0,0],0,true,"",""],
	["Land_TyreBarrier_01_F",[7.125,-3.75,0.625],0,true,false,[0,0],0,true,"",""],
	["TyreBarrier_01_black_F",[-1,-10,0.625],0,true,false,[0,0],0,true,"",""],
	["TyreBarrier_01_black_F",[-1.75,-10,0.625],0,true,false,[0,0],0,true,"",""],
	["TyreBarrier_01_black_F",[-2.5,-10,0.625],0,true,false,[0,0],0,true,"",""],
	["TyreBarrier_01_black_F",[-6.5,-5.375,0.625],0,true,false,[0,0],0,true,"",""],
	["TyreBarrier_01_black_F",[-8.25,-3.75,0.625],0,true,false,[0,0],0,true,"",""],
	["Land_AirIntakePlug_03_F",[4.24713,2.58691,0],0,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[-2.38696,-3.07277,0.204089],295,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[-2.70206,-3.73062,0.204089],295,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[-3.08785,-2.6824,0.204089],110,true,false,[0,-0],0,true,"",""],
	["Land_MetalBarrel_F",[-3.32486,-3.3223,0.204089],115,true,false,[0,-0],0,true,"",""],
	["Land_PalletTrolley_01_khaki_F",[-3.5,-3,0],25,true,false,[0,0],0,true,"",""],
	["Land_Pallet_F",[-2.91658,-3.28145,0],295,true,false,[0,0],0,true,"",""],
	["Land_Pallet_MilBoxes_F",[-3.75,2.75,0],145,true,false,[0,-0],0,true,"",""],
	["Land_Pallet_MilBoxes_F",[4,-1.125,0],180,true,false,[0,0],0,true,"",""],
	["Land_PitotTubeCover_01_F",[-0.250303,7.15236,0],150,true,false,[0,-0],0,true,"",""],
	["Land_PitotTubeCover_01_F",[0.448907,6.83329,0],210,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[3.5395,7.59636,0],30,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-5.25,0,0],305,true,false,[0,0],0,true,"",""],
	["Land_RotorCoversBag_01_F",[3.14814,2.61789,0],0,true,false,[0,0],0,true,"",""],
	["Land_RotorCoversBag_01_F",[3.77917,1.8861,0],0,true,false,[0,0],0,true,"",""],
	["Land_ToolTrolley_02_F",[3.3668,4.48257,0],0,true,false,[0,0],0,true,"",""],
	["C_Offroad_01_repair_F",[6.875,6.90575,-0.000293255],25,true,false,[0,0],0,true,"","[_this,true] call RELO_fnc_vehicleDisable;"],
	["O_Heli_Attack_02_dynamicLoadout_F",[0,0.00110745,0],0,true,false,[0,0],0,true,"","_this setVariable ['taskObject',true]; [_this,true] call RELO_fnc_vehicleDisable;"]
]
