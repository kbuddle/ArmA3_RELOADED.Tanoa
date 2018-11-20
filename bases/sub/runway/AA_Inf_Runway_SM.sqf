/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Runway_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Large_F",[-7.67614,-10.7114,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Large_F",[-8.40295,9.5674,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Large_F",[8.52332,-2.81248,0],270.177,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-3.44421,11.9907,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.57752,4.15139,0],182.834,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.62391,-5.87937,0],11.4043,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[7.5802,2.65774,0],0.167466,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-0.967644,13.6953,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-11.1202,-0.342753,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-13.9191,-12.4609,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-13.9569,-5.65476,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.3624,4.87502,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.4542,14.002,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-8.73717,4.34035,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-8.85729,-5.04637,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[10.6847,9.01565,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.5621,-7.31394,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.5802,1.25051,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[5.76771,-13.9512,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.6151,-13.7261,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.77917,13.2725,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[9.5492,9.36379,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[0.431282,10.1704,0],2.69594,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[5.48914,2.49221,0],3.27062,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[6.56727,6.09865,0],91.985,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall6_F",[-3.69836,2.92727,0],1.80639,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-3.77355,-3.8325,0],180.966,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-5.59997,-0.41453,0],272.493,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[0.687386,-10.6499,0],181.95,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[5.87,10.2578,0],0.861471,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[6.63294,-10.0981,0],88.4751,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[3.60145,-6.4575,0],89.2036,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[3.61634,-6.42967,1.23564],89.4202,false,false,[-2.88063,-4.33377],0,false,"",""],
	["Land_HBarrier_5_F",[-1.74108,-0.362284,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-3.05407,-0.488261,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-4.47399,-0.55369,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.2777,1.55129,1.35355],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.28869,0.163595,1.22016],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.29089,-2.49119,1.34465],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.29259,-0.972636,1.3564],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.65441,0.396993,1.27949],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.67272,-0.979471,1.31357],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.69445,-2.49168,1.29888],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.77233,1.55764,1.28666],0,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-5.97921,-4.13467,1.2089],51.6578,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-5.98181,3.08009,1.21347],143.935,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[6.55769,10.375,1.2608],228.772,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[7.01933,-10.9174,1.25228],305.905,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-13.8817,-7.97166,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.1219,0.520529,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.3622,9.13039,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.86927,-13.8442,0],359.848,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[11.8387,-10.6328,0],127.792,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[12.7631,5.07277,0],65.2403,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[14.4479,-3.14939,0],91.0746,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[1.33826,8.58059,0],268.337,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[2.88294,-7.57176,0],278.647,false,false,[0,0],0,false,"",""],
	["O_static_AA_F",[-3.17345,-2.03855,1.55757],0,true,false,[0.384612,-16.34],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[-3.31188,0.681661,1.55477],0,true,false,[0.0593307,-8.35382],0,true,"","this setVariable ['taskObject',true];"]
]
