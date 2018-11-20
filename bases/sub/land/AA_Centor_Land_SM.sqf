/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Land_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Large_F",[-8.65544,8.42648,0],90.4659,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Large_F",[8.05257,-8.51591,0],269.008,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Small_F",[-2.75823,-3.37723,0],359.573,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-9.24431,-5.09159,0],1.90181,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[0.079421,4.18722,0],269.742,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[9.95882,5.30587,0],182.552,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.3144,14.0852,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[14.0924,-13.6639,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[-5.84001,-5.21122,0],274.829,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[6.39754,4.89132,0],91.3464,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.196946,-11.4749,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.25969,11.6423,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-10.7475,-8.2537,0],270.348,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-7.92912,0.853235,0],245.58,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-8.56877,-11.5057,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[11.4444,8.61788,0],89.9204,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[8.1114,11.7668,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[8.91951,-1.08768,0],56.5901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-11.0519,-5.12479,1.05556],0,false,false,[4.43136,-2.94511],0,false,"",""],
	["Land_HBarrier_1_F",[11.7738,5.45138,1.22258],0,false,false,[-4.45311,2.91195],0,false,"",""],
	["Land_HBarrier_Big_F",[-2.61614,-7.00272,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-6.09074,-3.14628,0],88.3515,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[0.468337,-1.57352,0],88.2879,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[2.95686,6.83468,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-10.7247,-11.7161,1.23299],42.6997,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-9.44438,-5.22882,2.43677],144.195,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[11.4196,11.9813,1.2399],227.876,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[9.93959,5.28295,2.43769],323.476,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-14.6181,9.25021,0],272.933,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-9.33489,14.2185,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[14.1734,-8.491,0],269.538,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[9.03474,-13.9944,0],358.725,false,false,[0,0],0,false,"",""],
	["Land_CampingTable_F",[-2.74162,-4.37723,0],0,false,true,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[-2.53093,-4.34257,0.634665],0,true,false,[0,0],0,true,"",""],
	["B_SAM_System_02_F",[-2.857,-3.865,2.005],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
