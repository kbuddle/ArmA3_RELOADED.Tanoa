/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_Secure_DataIntel_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Cargo_House_V4_F",[-0.386433,3.07681,0],320.34,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V4_F",[4.56068,-3.10365,4.76837e-007],0,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_long_green_F",[6.00532,-3.68506,0.78913],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.0048,-3.71857,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.71568,5.99052,0.78913],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[2.71516,5.95702,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.67027,-4.678,0],87.0178,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.22947,1.58766,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[6.22998,1.62117,0.78913],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.70376,-4.67677,0.78913],87.0178,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.55304,2.3834,0],60.5249,false,false,[0,0],0,false,"",""],
	["Land_CampingChair_V2_white_F",[-2.13858,-2.2132,0],357.97,true,false,[0,0],0,true,"",""],
	["Land_CampingChair_V2_white_F",[-0.937325,-2.98837,0],76.3729,true,false,[0,0],0,true,"",""],
	["Land_CampingTable_F",[-2.19408,-3.2419,0],41.8121,true,false,[0,0],0,true,"",""],
	["Land_DataTerminal_01_F",[-1.39326,2.65928,0.592812],320.151,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_FieldToilet_F",[2.375,7.25,0],269.463,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[0.707201,-7.27796,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-4.56481,-4.91908,0],49.3667,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-7.25333,1.3966,0],89.9043,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[3.80585,9.55215,0],179.569,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[8.77195,4.65325,0],270.927,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[8.60338,-3.74345,0],270.927,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-3.72052,7.48978,0],140.182,false,false,[0,-0],0,false,"",""],
	["Land_LampHalogen_F",[8.875,9.75,4.76837e-007],319.106,true,false,[0,0],0,true,"",""],
	["Land_Laptop_unfolded_F",[-3.05025,2.44284,1.43762],12.3979,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_OfficeCabinet_02_F",[-0.616949,3.21856,0.592812],49.9952,false,false,[0,0],0,false,"",""],
	["Land_OfficeCabinet_02_F",[-1.1407,3.83212,0.592812],49.9952,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[3.75,-9.125,0],344.74,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[2.2897,-6.00124,0],239.786,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-9,1.5,0],89.9043,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.937448,-9.0363,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-5.74926,-6.23887,0],49.3667,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[10.5338,4.85503,0],270.927,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-5.02331,8.69291,0],140.182,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[3.56239,11.3087,0],179.569,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[10.3652,-3.54167,0],270.927,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[10,10.75,0],46.8728,false,false,[0,0],0,false,"",""],
	["Land_SignM_WarningMilitaryArea_english_F",[8.5539,-9.15064,0],0,false,false,[0,0],0,false,"",""],
	["MapBoard_Tanoa_F",[-1.10301,6.79321,0.728848],0,true,false,[0,0],0,true,"",""],
	["O_supplyCrate_F",[6.125,4.625,0],0,true,false,[0,0],0,true,"",""],
	["O_supplyCrate_F",[6.25,2.875,0],0,true,false,[0,0],0,true,"",""],
	["OfficeTable_01_old_F",[-2.96495,2.33954,0.592812],229.194,false,false,[0,0],0,false,"",""]
]
