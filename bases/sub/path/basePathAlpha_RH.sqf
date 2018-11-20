/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: basePathAlpha_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Ammobox_rounds_F",[-4.625,-1,0],313.198,false,true,[0,0],0,false,"",""],
	["Land_Ammobox_rounds_F",[-4.71603,-1.38444,0],356.762,false,true,[0,0],0,false,"",""],
	["Land_Axe_fire_F",[-4.65021,0.524985,0],282.261,false,true,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.33077,-5.30109,0],287.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.33121,-8.47546,0],261.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.36408,-2.13277,0],270.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.3856,0.737179,0],270.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.39062,3.67959,0],266.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[3.40321,6.56682,0],278.66,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-1.72596,11.9446,0],138.288,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-2.31962,-12.1187,0],47.7429,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[0.00797185,-12.3164,0],320.151,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[0.606298,11.823,0],225.88,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-2.57065,10.0798,0.0113297],96.5636,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[-2.77126,-10.1166,0],275.356,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[0.912087,-10.48,0],278.427,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[1.12253,9.83706,0],93.4925,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-0.944482,3.97777,0],179.023,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_hole_F",[-1.05359,-6.51675,0],0,false,false,[0,0],0,false,"",""],
	["Land_Sleeping_bag_brown_F",[-0.75,-4.5,0],341.539,false,false,[0,0],0,false,"",""],
	["Land_Sleeping_bag_brown_F",[-1.397,1.359,0],200.572,false,false,[0,0],0,false,"",""],
	["Land_Sleeping_bag_brown_F",[-2.694,-4.812,0],17.1543,false,false,[0,0],0,false,"",""],
	["Land_Sleeping_bag_F",[-3.08783,0.857452,0],146.746,false,false,[0,-0],0,false,"",""],
	["Land_Sleeping_bag_F",[-4.41275,-3.36502,0],51.7302,false,false,[0,0],0,false,"",""],
	["Land_Sleeping_bag_F",[0.166,-0.15,0],253.795,false,false,[0,0],0,false,"",""],
	["Land_WoodenBox_F",[-0.575911,7.27717,0],178.405,false,true,[0,-0],0,false,"",""],
	["Land_WoodenBox_F",[-0.623151,6.14532,0],166.635,false,true,[0,-0],0,false,"",""],
	["Land_WoodenWall_01_m_4m_F",[-4.1745,-7.77574,0],46.7922,false,false,[0,0],0,false,"",""],
	["Land_WoodenWall_01_m_4m_F",[-5.04419,3.69128,0],285.64,false,false,[0,0],0,false,"",""],
	["Land_WoodenWall_01_m_8m_F",[-5.59286,-2.19864,0],269.431,false,false,[0,0],0,false,"",""],
	["Land_WoodPile_F",[-4.625,2.125,0],182.377,false,false,[0,0],0,false,"",""],
	["Land_BakedBeans_F",[-0.272277,-1.37671,0],307.017,false,true,[0,0],0,false,"",""],
	["Land_BakedBeans_F",[-0.306247,-1.54116,0],250.215,false,true,[0,0],0,false,"",""],
	["Land_Bandage_F",[-0.237036,-9.10901,0],302.448,false,true,[0,0],0,false,"",""],
	["Land_Bandage_F",[-0.360929,-9.04027,0],210.951,false,true,[0,0],0,false,"",""],
	["Land_ButaneCanister_F",[-0.119064,-9.20653,0],280.651,false,true,[0,0],0,false,"",""],
	["Land_Campfire_F",[-2.25941,-1.50266,0],303.854,true,false,[0,0],0,true,"",""],
	["Land_CanisterPlastic_F",[0.584864,-9.21946,0],126.85,false,true,[0,-0],0,false,"",""],
	["Land_Canteen_F",[-2.76003,-3.85548,-0.00399971],349.858,false,true,[0,0],0,false,"",""],
	["Land_Canteen_F",[-3.71337,1.55489,0],319.556,false,true,[0,0],0,false,"",""],
	["Land_CratesShabby_F",[-2.625,8.375,0],274.819,false,false,[0,0],0,false,"",""],
	["Land_DuctTape_F",[-2.69906,-3.5431,0],309.991,false,true,[0,0],0,false,"",""],
	["Land_Garbage_square3_F",[-1.24902,-1.56264,0],115.255,false,false,[0,-0],0,false,"",""],
	["Land_GasCanister_F",[-0.358018,-9.22312,0],316.357,false,true,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-1.875,6.25,-1.5],185,true,false,[0,0],0,true,"",""],
	["Land_LampShabby_F",[-2.5,-8.25,-2],45,true,false,[0,0],0,true,"",""],
	["Land_Matches_F",[-4.04727,-1.70908,0],281.473,false,true,[0,0],0,false,"",""],
	["Land_PainKillers_F",[-3.98753,1.45023,-0.0061698],281.477,false,true,[0,0],0,false,"",""],
	["Land_Sacks_heap_F",[-2.625,7.125,0],303.571,false,false,[0,0],0,false,"",""],
	["Land_Sacks_heap_F",[-3.75,6.375,0],303.571,false,false,[0,0],0,false,"",""],
	["Land_PlasticCase_01_large_F",[-0.625,2.875,0],90.0007,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_medium_F",[-4.875,-2.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_small_F",[-1.625,-5.125,0],295,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_HMG_01_high_F",[-0.375,10.375,0],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-1.25,-10.75,0],190,true,false,[0,0],0,true,"",""],
	["CamoNet_ghex_open_F",[0.282837,-1.46892,0],89.4251,false,false,[0,0],0,false,"",""]
]
