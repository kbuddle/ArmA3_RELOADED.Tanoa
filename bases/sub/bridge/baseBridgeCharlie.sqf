/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: baseBridgeCharlie
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagFence_Corner_F",[-3.625,9.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Corner_F",[3.54524,-9.13607,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-2.375,4.625,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[2.29524,-4.63608,-4.43459e-005],270.001,false,false,[-0.102789,-0.399093],0,false,"",""],
	["Land_BagFence_Long_F",[2.375,4.625,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-3.25,7.25,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-3.32976,-7.13608,0],135,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[3.17024,-7.26108,0.0031991],225.001,false,false,[-0.354883,-0.209524],0,false,"",""],
	["Land_BagFence_Round_F",[3.25,7.125,0],315,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-3,9.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-3.95476,-8.88608,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[2.92024,-9.88607,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[3.125,9.875,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[3.875,8.875,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_GarbageHeap_02_F",[1.04525,8.23892,0],0,false,false,[0,0],0,false,"",""],
	["Land_GasTank_01_khaki_F",[-2.25,-2.5,0],300,true,false,[0,0],0,true,"",""],
	["Land_GasTank_01_khaki_F",[-2.25,-3,0],60.0002,true,false,[0,0],0,true,"",""],
	["Land_GasTank_01_khaki_F",[-2.625,-2.75,0],240,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_1_F",[-2.625,2.125,0.102223],195,false,false,[0.412094,0.00402643],0,false,"",""],
	["Land_HBarrier_1_F",[-3.125,-10.125,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[2.98967,11.1602,0],120,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_center_F",[0.125,9.5,0],180,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_4m_damaged_left_F",[2.125,0.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_Mil_WallBig_debris_F",[0,4.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_Pallet_F",[-2.375,8.25,0],120,false,true,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[-1.17024,-6.11393,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.5,3.875,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.625,1.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.625,3.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.625,6.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.875,4.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-3.875,6.875,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-4.125,2.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-4.125,5.375,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-4.5,7.625,0],270,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[0,-3.375,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[0.25,-5,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[2.625,-6.125,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[3.42024,-3.88607,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[3.54524,-1.63608,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[3.54524,-3.13608,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[3.79524,-4.63607,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[3.79524,-6.88607,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[4.04524,-2.38608,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[4.04524,-5.38607,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_4m_F",[4.42024,-7.63607,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_8m_F",[1.75,-8.5,0.404744],3.57635e-006,false,false,[6.19442e-006,-60],0,false,"",""],
	["Land_Plank_01_8m_F",[1.875,-4.5,0.40417],3.57635e-006,false,false,[6.19442e-006,-60],0,false,"",""],
	["Land_PortableLight_double_F",[-4.75,7,0.103891],195,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[4.75,-7.25,0],30,true,false,[0,0],0,true,"",""],
	["Land_TrenchFrame_01_F",[-5.375,3.125,2],90,false,false,[0,-0],0,false,"",""],
	["Land_TrenchFrame_01_F",[-5.75,6.5,2],90,false,false,[0,-0],0,false,"",""],
	["Land_TrenchFrame_01_F",[4.125,-2.75,2],225,false,false,[0,0],0,false,"",""],
	["Land_TrenchFrame_01_F",[5.625,-6.5,2],270,false,false,[0,0],0,false,"",""],
	["Land_TripodScreen_01_large_F",[-3.875,6.25,0.102801],195,true,false,[0.412094,0.00402635],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_large_F",[-2.75,-1,0],90,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_large_F",[-2.75,-1.75,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_large_F",[3.75,-3.25,0.10278],315.001,true,false,[0.209524,-0.354886],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PlasticCase_01_small_F",[2.875,-5.5,0.100317],0,true,false,[0.399094,-0.102795],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PortableGenerator_01_F",[-3.25,5.125,0.103385],90.0014,true,false,[-0.102785,-0.399097],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-3,1.875,1.47879],0,true,false,[1.27194,-4.81731],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-3.24994,4.62524,0.874999],255,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[-4.99994,5.75024,0.125],165,true,false,[0.358891,-0.202588],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[3.87494,-6.37524,0.10369],345.001,true,false,[0.358894,-0.202583],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tablet_02_F",[4.87494,-4.37524,0.249999],255,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
