/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Runway_Gr_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_large_green_F",[-7.75995,-10.3705,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[-8.48676,9.90827,0],88.7229,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[8.43951,-2.47161,0],270.177,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-3.52802,12.3316,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.49371,4.49226,0],182.834,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[1.5401,-5.53851,0],11.4043,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[7.4964,2.9986,0],0.167466,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-1.05145,14.0362,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-11.204,-0.00188541,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.0029,-12.12,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.0407,-5.3139,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.4462,5.21589,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.538,14.3428,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-8.82098,4.68122,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-8.9411,-4.7055,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[10.6009,9.35651,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.4783,-6.97308,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.4964,1.59138,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[5.6839,-13.6103,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.53131,-13.3852,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[8.69537,13.6133,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[9.46539,9.70466,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.51764,-6.11663,0],89.2036,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.53253,-6.0888,2.82143],89.2036,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.82489,-0.0214167,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-3.13788,-0.147393,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.5578,-0.212823,0],269.83,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[0.347473,10.5113,0],2.69594,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[5.40533,2.83308,0],3.27062,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[6.48346,6.43952,0],91.985,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-3.78217,3.26813,0],1.80639,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-3.85736,-3.49163,0],180.966,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-5.68378,-0.0736628,0],272.493,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[0.603577,-10.309,0],181.95,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[5.78619,10.5987,0],0.861471,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[6.54913,-9.75726,0],88.4751,false,false,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.36151,1.89216,1.56416],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.3725,0.504462,1.37596],0,false,true,[0,8.31594],0,false,"",""],
	["Land_Pallet_F",[-2.37469,-2.15032,1.55756],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.3764,-0.631768,1.60065],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.73822,0.737861,1.44684],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.75653,-0.638604,1.53434],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.77826,-2.15081,1.5133],0,false,true,[0,0],0,false,"",""],
	["Land_Pallet_F",[-3.85614,1.89851,1.47061],0,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[6.46435,10.8737,1.24566],223.501,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[6.80013,-10.6707,1.2542],320.823,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-6.09756,3.57733,1.20358],105.442,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-6.14757,-3.83689,1.21819],69.0024,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-13.9655,-7.63079,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.2058,0.861396,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-14.446,9.47126,0],88.2162,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[0.785461,-13.5034,0],359.848,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[11.7549,-10.2919,0],127.792,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[12.6793,5.41364,0],65.2403,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[14.3641,-2.80853,0],91.0746,false,false,[0,-0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[1.25446,8.92145,0],268.337,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[2.79913,-7.23089,0],278.647,false,false,[0,0],0,false,"",""],
	["O_static_AA_F",[-3.25726,-1.69769,1.77134],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[-3.39569,1.02253,1.82631],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
