/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Green_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_large_green_F",[-8.39014,9.22443,0],90.047,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[7.90527,-7.4328,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.15674,-4.0827,2.78],38.5512,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.23682,-1.97918,2.78],135.554,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.2019,4.35236,2.78],312.191,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.28295,6.55793,2.78],230.888,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.09791,-1.40106,2.73497],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.15162,-4.67596,2.82064],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.38818,3.63996,2.73934],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.46004,7.18419,2.70397],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-9.8733,-4.67596,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[0.135003,1.34699,0],89.4347,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[9.14941,6.22882,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-14.0794,14.5501,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[13.0749,-13.006,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-3.17261,-6.55096,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-11.6084,-4.67303,1.23389],0,false,false,[4.43136,-2.94511],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[11.2173,5.90314,1.15909],0,false,false,[-4.45311,2.91195],0,false,"",""],
	["Land_HBarrier_01_tower_green_F",[-3.77198,-3.01873,0],270.298,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_tower_green_F",[2.70922,5.52423,0],90.4502,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[-6.39649,-4.75946,0],274.829,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_4_green_F",[5.84106,5.34308,0],91.3464,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-0.753425,-11.0231,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-0.816169,12.0941,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-11.304,-7.80194,0],270.348,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-8.4856,1.305,0],245.58,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[-9.12525,-11.0539,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[10.8879,9.06964,0],89.9204,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[7.55492,12.2186,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_6_green_F",[8.36303,-0.635922,0],56.5901,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-1.56526,-2.90664,4.90381],272.993,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-11.2121,-11.4479,1.23438],38.6082,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[0.771482,5.63155,4.90381],88.1297,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[11.0153,12.5028,1.23093],229.74,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-14.5283,9.57843,0],270.184,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-9.25513,14.7,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[13.4155,-8.13397,0],269.538,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[8.27685,-13.6374,0],358.725,false,false,[0,0],0,false,"",""],
	["O_static_AA_F",[-5.03052,-3.80584,2.78],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[4.02441,4.85627,2.78],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
