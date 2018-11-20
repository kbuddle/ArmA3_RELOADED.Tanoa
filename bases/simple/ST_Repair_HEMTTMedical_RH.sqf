/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_Repair_HEMTTMedical_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["B_Truck_01_medical_F",[-0.307,0.111,0],158.257,true,false,[0,-0],0.504233,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["Land_CncBarrier_F",[-3.52487,-4.93116,0],269.221,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[2.68924,4.41403,0],89.6,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[-4.50832,-3.05076,0],269.221,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_F",[3.55778,1.30152,0],44.5238,false,false,[0,0],0,false,"",""],
	["Land_CncBarrierMedium4_F",[-4.54317,1.89947,0],251.25,false,false,[0,0],0,false,"",""],
	["Land_CncBarrierMedium4_F",[5.31349,-3.59556,0],104.946,false,false,[0,-0],0,false,"",""],
	["Land_PortableLight_double_F",[-4.27736,8.15509,0],325.83,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[3.18549,-7.98062,0],158.285,true,false,[0,-0],0,true,"",""],
	["RoadBarrier_F",[-2.04,-7.291,0],16.348,true,false,[0,0],0,true,"",""],
	["RoadBarrier_F",[2.413,6.722,0],16.348,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[2.14461,-8.05846,0],0,true,false,[0,0],0,true,"",""],
	["RoadCone_L_F",[-1.63469,7.24454,0],0,true,false,[0,0],0,true,"",""]
]
