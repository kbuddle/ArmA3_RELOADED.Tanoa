/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: simpleMilitaryIntelRoof
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_TBox_F",[-1.125,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_IndPipe1_ground_F",[1.375,2.125,0],90,false,false,[0,-0],0,false,"",""],
	["Land_TTowerSmall_1_F",[-0.149683,1.41581,2.125],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_SolarPanel_2_F",[-1.25,4.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[4.75,-4,0],115,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[5.75,-1.25,0],285,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[6.875,1,0],300,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[-5.25,-2.25,0],310,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[0.5,-7.125,0],250,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[2,-7.25,0],325,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_1_F",[3.125,-6.375,0],200,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-5.25,4.75,0],165,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-5.25,4.75,1.25],165,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[-6.875,2,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[0.25,-2.875,0],125.001,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_3_F",[3.25,5,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[3.25,5,1.25],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[6.5,4,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[6.5,4,1.25],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-3.5,-6.125,0],210,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-7.5,-2.125,0],240,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-7.5,-2.125,1.25],240,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-6.125,4.375,0],130,true,false,[0,-0],0,true,"",""],
	["Land_LampShabby_F",[3.25,-6.125,0],0,true,false,[0,0],0,true,"",""],
	["Land_Plank_01_4m_F",[-4.625,2.75,1.87682],270,false,false,[-25,-2.57984e-005],0,false,"",""],
	["Land_Plank_01_4m_F",[-6.25,-0.625,1.25],335,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_8m_F",[-2.125,-4.5,0.373547],305,false,false,[14.9998,-2.4307e-005],0,false,"",""],
	["Land_Plank_01_8m_F",[3.375,1.25,0.999291],0,false,false,[25,0],0,false,"",""],
	["Land_Razorwire_F",[-1.25,7.25,-0.0665917],2.22544e-005,false,false,[-11.9616,-2.41248],0,false,"",""],
	["Box_East_Ammo_F",[-6.25,-0.75,0],335,true,false,[0,0],0,true,"",""],
	["Box_East_Support_F",[-1.75,-3,0],30,true,false,[0,0],0,true,"",""],
	["Box_East_WpsSpecial_F",[-4,-3.25,0],335,true,false,[0,0],0,true,"",""]
]
