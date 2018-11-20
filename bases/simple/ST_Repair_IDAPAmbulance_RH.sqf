/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_Repair_IDAPAmbulance_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["C_IDAP_Van_02_medevac_F",[0.215,0.143958,0],175.701,true,false,[0,-0],0.398419,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["Land_CncBarrier_F",[-3.12462,-2.65086,0],269.221,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[3.78865,-0.0323902,0],89.6,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[4.94649,3.83559,0],89.6,false,false,[0,0],0,false,"",""],
	["Land_CncBarrierMedium4_F",[-4.54317,1.89947,0],285.755,false,false,[0,0],0,false,"",""],
	["Land_CncBarrierMedium4_F",[4.35589,-3.88698,0],133.361,false,false,[0,-0],0,false,"",""],
	["Land_PortableLight_double_F",[5.36415,-4.95412,0],133.738,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[-4.00806,8.02082,0],325.83,true,false,[0,0],0,true,"",""],
	["RoadBarrier_F",[1.94745,6.34782,0],16.348,false,false,[0,0],0,false,"",""],
	["RoadBarrier_F",[-1.56153,-5.68317,0],17.5741,false,false,[0,0],0,false,"",""],
	["RoadCone_L_F",[2.14461,-8.05846,0],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-1.47386,8.02084,0],0,true,false,[0,0],0,true,"",""]
]
