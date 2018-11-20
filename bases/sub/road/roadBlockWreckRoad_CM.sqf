/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: roadBlockWreckRoad_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
	to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomContainerLoadout;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Cargo_House_V4_F",[7.25,0,0],90,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V4_F",[-6.86711,-5.7609,4.76837e-007],0,true,false,[0,0],0,true,"",""],
	["Crater",[0,0,-0.00717974],338.745,false,false,[2.75223,8.18357],0,false,"",""],
	["CraterLong_small",[2.25,-1,0],90.2177,false,false,[0,-0],0,false,"",""],
	["CraterLong_small",[-1,0,0],358.844,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[-4.54926,-0.736141,0.315738],241.212,false,false,[0,0],0,false,"",""],
	["Land_BagFence_End_F",[-4.55409,-0.653405,0],262.302,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[9.125,-3.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[12.375,-0.75,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[9.25,4,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[9.625,-7.25,0],105,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-7.25,9.5,0],120,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[11.75,3.25,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[11.625,-3.25,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-5.25,10.25,0],195,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-5.5,-2.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-10,-3.5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[10,-5,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Short_F",[6.875,-3.875,0],2.64101e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[7,4,0],2.64101e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-9,-2.5,0],2.45889e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[12.375,1.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-4.31157,2.141,0.302431],89.2197,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-4.30434,2.11155,0],89.2197,false,false,[0,0],0,false,"",""],
	["Land_Cliff_stoneCluster_F",[1.5227,5.06784,0],306.314,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_4x4_F",[-7.625,-5.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_DirtPatch_01_6x8_F",[-7,5.625,0],285,false,false,[0,0],0,false,"",""],
	["Land_Garbage_square5_F",[0,-6,0],357.43,false,false,[0,0],0,false,"",""],
	["Land_GarbageHeap_03_F",[4.82744,4.56945,0],265.569,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.11345,-9.10392,0],300.16,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.98507,9.19359,0],238.738,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.11363,-8.02396,0],290.982,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.07711,7.20301,0],299.224,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.98231,-11.8462,0],250.129,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.86711,-10.7609,0],312.663,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.10404,9.36543,0],279.242,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.08255,8.29144,0],221.994,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.17081,-6.91717,0],155.624,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[4.06684,-10.285,0],245.867,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.11711,-7.2609,0],270.256,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4,-4,0],270.256,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.00725,5.85106,0],278.181,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[6.13055,-11.6634,0],13.8437,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.61711,-8.7609,0],0.255993,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_center_F",[3.8551,4.63182,0],89.1047,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_left_F",[3.74923,-4.10705,0],90.359,false,false,[0,-0],0,false,"",""],
	["Land_Pallet_MilBoxes_F",[8,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[6,-9.75,0],121.508,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[6,5.5,0],60,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-6,8.75,0],308.431,true,false,[0,0],0,true,"",""],
	["Land_SharpStones_erosion",[-0.686059,4.14684,0.0479732],191.173,false,false,[0,0],0,false,"",""],
	["Land_SharpStones_erosion",[0,-6,0],7.79366,false,false,[0,0],0,false,"",""],
	["Box_CSAT_Equip_F",[10,-0.375,1.625],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Grenades_F",[10,-2,1.625],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Wps_F",[10,1.375,1.875],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_Quadbike_01_F",[-6.5,5.5,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-8.25,5.5,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Truck_03_covered_F",[-0.000367314,-0.00150982,-0.000418186],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"]
]
