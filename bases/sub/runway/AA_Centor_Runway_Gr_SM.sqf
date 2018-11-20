/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Runway_Gr_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_large_green_F",[-8.07019,-10.5893,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[-8.797,9.68956,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[8.12927,-2.69033,0],270.177,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[-2.94348,0.373151,0],89.996,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-3.83826,12.1129,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.18347,4.27354,0],182.834,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.22986,-5.75722,0],11.4043,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[7.18615,2.77989,0],0.167466,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-1.3617,13.8175,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-11.5143,-0.220599,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.3131,-12.3388,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.351,-5.53261,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.7565,4.99717,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.8483,14.1241,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-9.13123,4.46251,0.0581646],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-9.25135,-4.92421,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[10.2906,9.1378,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.1681,-7.19179,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.1862,1.37266,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[5.37365,-13.829,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.22107,-13.6039,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.38513,13.3946,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[9.15515,9.48594,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.20739,-6.33535,0],89.2036,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.22229,-6.30751,1.41398],89.4202,false,false,[-2.88063,-4.33377],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[0.0372286,10.2926,0],2.69594,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[5.09509,2.61436,0],3.27062,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[6.17321,6.22081,0],91.985,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-4.09241,3.04942,0],1.80639,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-4.16761,-3.71035,0],180.966,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-5.99402,-0.292377,0],272.493,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[0.293332,-10.5277,0],181.95,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[5.47595,10.38,0],0.861471,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[6.23889,-9.97597,0],88.4751,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-10.4441,-0.201854,0],91.8512,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[6.64018,-13.394,0],17.4495,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.01349,12.8516,0],189.492,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[8.8242,-7.70427,0],307.215,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[8.84788,2.55354,0],221.307,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-14.2758,-7.84951,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.516,0.642682,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.7562,9.25255,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.475217,-13.7221,0],359.848,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[11.4447,-10.5106,0],127.792,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[12.369,5.19493,0],65.2403,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[14.0538,-3.02724,0],91.0746,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-2.56165,-2.40322,0],2.96635,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-4.33606,-2.3832,0],0.599803,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[0.944211,8.70274,0],268.337,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[2.48889,-7.4496,0],278.647,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[-3.76868,0.349713,0],88.8698,false,true,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[-3.83899,0.356061,0.77453],92.2163,true,false,[0,-0],0,true,"",""],
	["B_SAM_System_02_F",[-3.572,0.253,3.158],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
