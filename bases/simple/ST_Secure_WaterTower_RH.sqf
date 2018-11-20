/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_Secure_WaterTower_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_WaterTower_01_F",[0,0,0],0,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_round_green_F",[-5.54268,4.7543,0],138.97,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.14332,4.68935,0],226.496,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-5.57292,-5.92121,0],43.6167,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[5.06001,-5.97774,0],318.092,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.258861,-4.07487,0.717835],268.939,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.323227,-4.00953,0],268.939,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.013905,3.9236,0.717835],86.5814,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[0.0530946,3.86096,0],86.5814,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[3.9363,2.28382,0.717835],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.09883,2.59478,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.16536,2.53164,0.717835],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.00282,2.34697,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.13589,-3.34504,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-4.20241,-3.40819,0.717835],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.2349,-3.54451,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.16837,-3.60766,0.717835],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[5.62689,2.84929,0],223.925,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-5.73876,3.02097,0],135.906,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6.37039,1.78487,0],61.2821,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6.79421,0.570454,0],256.405,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-6.52376,2.01803,0],119.097,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6.94385,-0.705243,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-6.98128,-1.75465,0],76.6653,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[5.57336,-4.21076,0],315.646,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-6.56297,-2.97098,0],241.542,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-7.0056,0.804641,0],101.842,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-5.8243,-4.03876,0],44.1844,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6.83014,-1.9887,0],281.583,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[6.3538,-3.20427,0],298.838,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-7.12513,-0.478289,0],270.26,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-0.3,-5.708,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-0.0953079,5.54638,0],0,false,false,[0,0],0,false,"",""],
	["Land_Plank_01_4m_F",[-2.75,0.75,8.125],105,false,false,[0,-0],0,false,"",""],
	["Land_Plank_01_8m_F",[-4.625,-0.5,8.125],90,false,false,[0,-0],0,false,"",""],
	["Land_PortableLight_double_F",[5.62164,-0.627102,0],90.0846,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[5.26715,3.85111,0],213.206,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[5.303,-5.12022,0],329.919,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-5.61511,4.08384,0],148.936,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-5.67045,-5.05819,0],44.1193,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[0.75,-0.375,8.111],105,true,false,[0,-0],0,true,"",""],
	["Land_PowerPoleWooden_F",[-7.125,-0.5,-3.25],0,false,false,[0,0],0,false,"",""],
	["Land_PowerPoleWooden_F",[-4.25,0.125,-3.25],0,false,false,[0,0],0,false,"",""],
	["Land_WaterPurificationTablets_F",[-0.625,1,8.125],344.726,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WaterPurificationTablets_F",[-0.283494,-0.18075,8.111],338.602,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WaterPurificationTablets_F",[0.973865,-0.618855,8.111],41.5386,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WaterPurificationTablets_F",[-0.5,0.25,8.125],139.506,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WaterPurificationTablets_F",[0.5,-0.125,8.125],340.799,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_WaterPurificationTablets_F",[-0.158574,0.193744,8.111],306.738,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_BarrelWater_F",[-3.62572,0.997181,8.25],0,true,false,[0.399092,-0.102795],0,true,"","this setVariable ['taskObject',true];"],
	["Land_BarrelWater_F",[-7.75072,-0.502819,8.25],0,true,false,[0.399092,-0.102795],0,true,"","this setVariable ['taskObject',true];"],
	["Land_BarrelWater_F",[-5.25,0.125,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_BarrelWater_F",[2.5,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
