/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Land_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Large_F",[-7.87079,8.65869,0],90.047,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Large_F",[8.42462,-7.99854,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Tower_F",[-3.25263,-3.58447,0],270.298,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Tower_F",[3.22857,4.9585,0],90.4502,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-5.63739,-4.64844,2.78],38.5512,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-5.71747,-2.54492,2.78],135.554,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[5.72125,3.78662,2.78],312.191,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[5.8023,5.99219,2.78],230.888,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-3.57856,-1.9668,2.60166],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-3.63227,-5.2417,2.60166],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[3.90753,3.07422,2.60166],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[4.08526,6.75293,2.78],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-9.30951,-5.18311,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[0.572079,0.727539,0],269.854,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[9.83355,5.3916,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[-13.56,13.9844,0],0,false,false,[0,0],0,false,"",""],
	["Land_CzechHedgehog_01_F",[13.5943,-13.5718,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[-5.87714,-5.3252,0],274.829,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[6.36041,4.77734,0],91.3464,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.234074,-11.5889,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-0.296818,11.5283,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-10.7846,-8.36768,0],270.348,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-7.96625,0.739258,0],245.58,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-8.6059,-11.6196,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[11.4073,8.50391,0],89.9204,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[8.07428,11.6528,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[8.88238,-1.20166,0],56.5901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-11.0891,-5.23877,1.0478],0,false,false,[4.43136,-2.94511],0,false,"",""],
	["Land_HBarrier_1_F",[11.7366,5.3374,1.22258],0,false,false,[-4.45311,2.91195],0,false,"",""],
	["Land_HBarrier_Big_F",[-2.65326,-7.1167,0],2.40864,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-0.530477,-3.60297,4.90381],274.047,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.19658,-4.40997,4.90381],5.64016,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[0.502745,5.17043,4.90381],88.8864,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[1.26897,5.94701,4.90381],184.234,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-14.009,9.0127,0],270.184,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-8.73578,14.1343,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[13.9349,-8.69971,0],269.538,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[8.7962,-14.2031,0],358.725,false,false,[0,0],0,false,"",""],
	["O_static_AA_F",[-4.51117,-4.37158,2.60166],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[4.54376,4.29053,2.60166],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
