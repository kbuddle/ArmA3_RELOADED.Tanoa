/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostMedical
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
	["Land_Research_house_V1_F",[7.25,-6.25,0],180,true,false,[0,0],0,true,"",""],
	["Land_Research_HQ_F",[1.25,2.875,0],180,true,false,[0,-0],0,true,"",""],
	["B_Slingload_01_Medevac_F",[-6.125,-8.125,0],270,true,false,[0,0],0,true,"",""],
	["Land_CncShelter_F",[11,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-11.25,0,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall1_F",[-0.75,-11.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncWall1_F",[0.5,11.25,0],180,false,false,[0,0],0,false,"",""],
	["Land_CncWall1_F",[-0.75,11.25,0],180,false,false,[0,0],0,false,"",""],
	["Land_CncWall1_F",[0.5,-11.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-9.25,11.25,0],180,false,false,[0,-0],0,false,"",""],
	["Land_CncWall4_F",[11.25,9,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[9,-11.25,0],360,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-9.25,-11.25,0],360,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[9,11.25,0],180,false,false,[0,-0],0,false,"",""],
	["Land_CncWall4_F",[-11.5,9,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-11.5,-9,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[11.25,-9,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[14,2.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[3.75,11.25,0],180,false,false,[0,-0],0,false,"",""],
	["Land_CncWall4_F",[3.75,-11.25,0],360,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-14,-2.5,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[14,-2.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-11.5,-3.75,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-14,2.75,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-11.5,3.75,0],90,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[11.25,-3.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[11.25,3.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_CncWall4_F",[-4,11.25,0],180,false,false,[0,-0],0,false,"",""],
	["Land_CncWall4_F",[-4,-11.25,0],360,false,false,[0,0],0,false,"",""],
	["Land_ConcreteKerb_03_BW_long_F",[-10.25,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_ConcreteKerb_03_BW_long_F",[10,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[-7,-2.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[3.25,-9,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[6.375,7.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[-7,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[3.25,-6.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[-7,7,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_2m_F",[6.375,-0.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[-3.375,9,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[10,3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[10,-3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[-10.25,-3.75,0],180,false,false,[0,0],0,false,"",""],
	["Land_Hedge_01_s_4m_F",[-10.25,4.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_MetalCase_01_large_F",[1.625,-9.5,0],60,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_AAF_Uniforms_F",[5.875,2.125,1.875],180,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_NATO_Equip_F",[7.5,-9.25,1.625],90,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_O_UAV_06_F",[-3.37499,-9.99982,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_O_UAV_06_medical_F",[-10.375,10.0002,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[-5.12499,-2.62482,1.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[4.87501,-5.37482,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[9.12501,-9.37482,1.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[6.08403,9.53203,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[-1.87499,-2.37482,1.625],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[-3.37499,4.37518,5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[4.62501,-0.624825,1.875],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[-4.87499,-2.75711,4.99975],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_O_UAV_06_medical_F",[6.12501,2.00018,4.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["I_HMG_01_high_F",[-0.125,-7.375,0],0,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-9,8.875,0],180,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[8.375,8.125,0],180,true,false,[0,0],0,true,"",""],
	["MedicalGarbage_01_1x1_v1_F",[-3.625,-6.375,0],0,false,false,[0,0],0,false,"",""],
	["MedicalGarbage_01_3x3_v1_F",[-3.27572,-5.01775,0],45,false,false,[0,0],0,false,"",""],
	["MedicalGarbage_01_3x3_v2_F",[-2.375,-7.125,0],315,false,false,[0,0],0,false,"",""],
	["MedicalGarbage_01_5x5_v1_F",[-6.125,-5.375,0],75,false,false,[0,0],0,false,"",""],
	["MedicalGarbage_01_5x5_v1_F",[-8.375,-5,0],0,false,false,[0,0],0,false,"",""]
]
