/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseForestAlpha_RH
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
	["Box_FIA_Ammo_F",[-0.125,-4.375,0.875],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_FIA_Wps_F",[-0.375,1,1.25],315,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_Cargo_House_V1_F",[-5.85585,-3.01312,0],270.048,true,false,[0,0],0,true,"",""],
	["Land_Cargo_House_V1_F",[6.09479,3.81192,0],89.9607,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V1_F",[0.362012,10.5132,4.76837e-007],180.939,true,false,[0,0],0,true,"",""],
	["Land_GarbageBarrel_01_F",[9.5,-4.5,0],166.334,false,true,[0,-0],0,false,"",""],
	["Land_HBarrier_1_F",[9.07997,15.9856,0],139.949,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_1_F",[-15.3135,5.27755,0],357.757,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[15.6844,-4.81835,0],175.672,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_1_F",[15.4251,-9.24614,0],226.901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-15.1893,-8.14974,0],320.654,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[15.3005,4.99387,0],175.672,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_1_F",[-8.72171,-15.6933,0],320.654,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-11.3489,9.08324,0],45.0398,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[8.38578,-15.8629,0],226.901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[15.5516,8.88567,0],139.949,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_1_F",[4.34752,16.4575,0],89.209,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-8.25754,11.7387,0],50.4517,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-5.30531,16.2959,0],89.209,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-14.8135,-4.17378,0],357.757,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-1.97501,2.68824,0],135.937,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-0.140909,-7.04373,0],1.09033,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-0.329689,-14.2864,0],1.09033,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[5.05607,-4.50568,0],88.5191,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-12.298,12.9856,0],307.719,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[11.512,-0.243709,0],90.0605,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-5.86288,-11.3548,0],180.845,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[11.5596,-5.85238,0],269.834,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[5.14566,-11.5074,0],180.845,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-11.4627,0.63508,0],90.19,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[11.4738,5.33823,0],90.19,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[9.79865,9.93646,0],49.1904,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[0.315083,11.9092,0],180.845,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-11.5069,6.17744,0],89.5888,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[9.6914,-9.8454,0],138.18,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-11.5156,-4.97626,0],270.435,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[5.82802,11.8786,0],180.845,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-9.84711,-9.58163,0],229.436,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-5.24254,11.9364,0],358.934,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-3,1.875,0],225,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[3,-11.25,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-3.75,-11.125,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-11.375,9.375,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-1,3.625,0],45,true,false,[0,0],0,true,"",""],
	["Land_MetalCase_01_large_F",[7.88857,8.2806,0.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[-8.84427,-4.4323,1.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[1.16679,11.678,5.36519],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[-8.7838,-7.27657,0.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[-9.30272,2.73591,0.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[9,2.875,1.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[6.5,-4.5,0.75],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PaperBox_closed_F",[-9.07078,5.14508,0],314.299,false,false,[0,0],0,false,"",""],
	["Land_PaperBox_closed_F",[-7.5,4,0],71.929,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[8.7801,-8.8389,0],138.95,true,false,[0,-0],0,true,"",""],
	["Land_Razorwire_F",[-12.1601,-11.927,0],228.843,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-15.1138,0.600311,0],267.695,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-0.605169,16.3042,0],179.51,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[11.9604,-12.4755,0],316.862,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[15.3138,0.137683,0],267.695,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[12.1299,12.4042,0],228.735,false,false,[0,0],0,false,"",""],
	["Land_SatellitePhone_F",[9.34459,5.8432,1.57366],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_SatellitePhone_F",[-9.25819,-1.53176,1.57366],277.854,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-1.75,9.25,5.625],60,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-1.8272,2.3682,1.50849],0,true,false,[11.6847,5.47525],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[5.38386,-5.71757,1.50725],0,true,false,[11.6847,5.47525],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-0.978171,-6.89104,1.51482],0,true,false,[11.6847,5.47525],0,true,"","this setVariable ['taskObject',true];"],
	["Land_ToiletBox_F",[9,-3,0],90.7077,true,false,[0,-0],0,true,"",""],
	["Land_ToiletBox_F",[9,-1.5,0],90.7052,true,false,[0,-0],0,true,"",""],
	["Land_TTowerSmall_2_F",[5.66998,1.06618,0],1.09033,true,false,[0,0],0,true,"",""],
	["OfficeTable_01_old_F",[9.3949,5.80928,0.728848],12.4963,true,false,[0,0],0,true,"",""],
	["OfficeTable_01_old_F",[-9.23866,-1.5955,0.728848],269.441,true,false,[0,0],0,true,"",""]
]
