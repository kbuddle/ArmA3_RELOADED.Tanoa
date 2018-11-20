/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Green_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_large_green_F",[-8.57545,7.78,0.53502],90.4659,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[8.13256,-9.16238,0.53502],269.008,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[-2.67774,-4.02371,0],359.573,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-8.99195,-5.58621,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[0.490647,3.31278,0],89.4347,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[9.96727,4.83127,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.2344,13.4387,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.1724,-14.3103,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-2.53614,-7.6492,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-6.01075,-3.79275,0],88.3515,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[0.548329,-2.22,0],88.2879,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[3.11127,5.64507,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-10.9719,-5.77127,1.24165],0,false,false,[4.43136,-2.94511],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[11.8537,4.8049,1.21703],0,false,false,[-4.45311,2.91195],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[-5.76002,-5.8577,0],274.829,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[6.47753,4.24484,0],91.3464,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-0.116954,-12.1214,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-0.179698,10.9958,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-10.6675,-8.90018,0],270.348,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-7.84913,0.206758,0],245.58,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-8.48878,-12.1521,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[11.5244,7.97141,0],89.9204,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[8.1914,11.1203,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[8.9995,-1.73416,0],56.5901,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-11.8126,-4.49033,0],137.321,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[12.6212,3.54472,0],331.046,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-14.5381,8.60373,0],272.933,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-9.25489,13.572,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[14.2534,-9.13748,0],269.538,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[9.11474,-14.6409,0],358.725,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[-2.66163,-5.02371,0],0,false,true,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[-2.45094,-4.98904,0.813005],0,true,false,[0,0],0,true,"",""],
	["B_SAM_System_02_F",[-2.777,-4.512,4.01],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
