/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: OrcaDown1_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["B_Slingload_01_Repair_F",[-5.65335,8.25043,0],215,true,false,[0,0],0,true,"",""],
	["Box_NATO_AmmoVeh_F",[-0.903352,8.9724,0],90,true,false,[0,0],0,true,"",""],
	["CraterLong",[0,-3.64959,-0.247847],0,false,false,[0,0],0,false,"",""],
	["CraterLong",[0,0.901204,-0.247847],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-6.86043,-0.0150735,0],5,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_corner_green_F",[-6.82064,-0.0140965,0.649866],5,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.5183,-1.96389,0],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.0534,-10.7301,0.610471],340,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.47851,-1.96291,0.649866],90.0001,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-6.21381,-4.73715,0],80.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.8277,3.09023,0],265,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.95266,9.90078,0],125,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.3366,5.87917,0],255,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.20743,10.0158,0.52914],200,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.97214,0.284112,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.98538,0.275775,0.52914],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.19419,10.0241,0],200,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.8493,-2.53781,0],275,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.46372,-7.45154,0],70.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.42393,-7.45057,0.649866],70.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.34983,5.87084,0.52914],255,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.91912,9.91102,0.560326],125,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.2454,8.43165,0],240,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.51126,-5.31172,0],280,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.82215,-8.00939,0],290,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.83539,-8.01773,0.52914],290,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.79934,-10.7462,0],25.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-2.81962,-10.7532,0.610471],25.0001,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[5.07368,-10.723,0],340,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.477926,10.9969,0],185,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-0.4224,10.9826,0.518226],185,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.82123,12.7812,0.560326],175,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-9.48673,6.26647,0.560326],80,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[0.968942,-11.8855,0],1.06722e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[0.96406,-11.8831,0.284431],1.06722e-005,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-8.10791,1.13465,0],55,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.85476,12.7709,0],175,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-7.67525,3.27343,0],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-7.63546,3.27441,0.649866],145,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-9.52027,6.25623,0],80,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[8.74967,-3.67707,0.477614],275,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-5.28583,-1.51772,9.53674e-007],260,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[4.38835,-9.60349,9.53674e-007],150,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[4.6403,8.99908,0],30,true,false,[0,0],0,true,"",""],
	["O_Heli_Light_02_dynamicLoadout_F",[0.302194,0.64925,0.676619],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_HMG_01_high_F",[6.11379,6.91286,0],45.0003,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[6.68966,-5.2136,0],100,true,false,[0,-0],0,true,"",""],
	["O_HMG_01_high_F",[-7.15345,2.29458,0],230,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[0.653236,-10.4325,0],175,true,false,[0,-0],0,true,"",""]
]
