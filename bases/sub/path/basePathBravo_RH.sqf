/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: basePathBravo_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_WoodenShelter_01_F",[0,-8.125,0],179.896,false,false,[0,-0],0,false,"",""],
	["Land_WoodenShelter_01_F",[0.018,7.446,0.00699997],1.00179e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_end_green_F",[0.0391141,-1.09262,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.0754087,2.32672,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.0849635,2.33241,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.46375,2.60346,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.53278,-0.286385,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.53805,-3.2109,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.56802,5.46286,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-3.5782,-6.09703,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.0386051,-4.30916,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.0481601,-4.31486,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.80877,-6.28816,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.81896,5.27173,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.84893,-3.40203,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.8542,-0.477516,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[3.92323,2.41233,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-2.86548,-8.69901,0],43.3915,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-2.94775,8.07155,0],136,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[2.996,7.957,0],224,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.07915,-8.75043,0],315.391,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.53961,-7.2143,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.63315,-7.22286,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.64519,5.91504,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-2.73873,5.90648,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.56942,-0.230956,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.60466,5.51829,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-3.60874,-6.0126,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0,-1.127,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.0324913,-8.4033,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.0347851,7.39923,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.67203,6.04338,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.77483,5.98358,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.77761,-7.08596,0.8],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[2.88041,-7.14577,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.77824,-6.20373,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.78231,5.32716,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.81755,-0.422087,0.8],90,false,false,[0,-0],0,false,"",""],
	["Land_CampingTable_small_F",[0.154107,-3.59306,0],0,true,false,[0,0],0,true,"",""],
	["Land_CampingChair_V2_F",[0.125,-2.625,0],330,true,false,[0,0],0,true,"",""],
	["Land_PCSet_01_case_F",[1,-3.625,0],180,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PCSet_01_keyboard_F",[0.25,-3.375,0.813005],195,true,false,[0,0],0,true,"",""],
	["Land_PCSet_01_mousepad_F",[-0.125,-3.5,0.813005],270,true,false,[0,0],0,true,"",""],
	["Land_PCSet_01_mouse_F",[-0.125,-3.5,0.820271],165,true,false,[0,-0],0,true,"",""],
	["Land_PCSet_01_screen_F",[0.148807,-3.66921,0.813005],180,true,false,[0,0],0,true,"",""],
	["Land_PlasticCase_01_large_F",[-0.5,3.125,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_medium_F",[0.5,1.375,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_small_F",[-0.5,1.375,0],60,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_ShelvesWooden_khaki_F",[0.875,3,0],270,true,false,[0,0],0,true,"",""],
	["Box_O_UAV_06_medical_F",[1.0006,3.00018,0.990174],330,true,false,[0.167855,0.290732],0,true,"",""],
	["Land_Suitcase_F",[3.375,0,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Pallet_MilBoxes_F",[-1.375,-1,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-2.625,7,-2],180,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[2.75,-7.875,-2.5],0,true,false,[0,0],0,true,"",""],
	["Land_IRMaskingCover_02_F",[-0.148005,-0.622496,0],90,false,false,[0,-0],0,false,"",""]
]
