/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_Repair_GhostHawk_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["B_Heli_Transport_01_F",[-0.537,-0.683645,0],190.797,true,false,[0,0],0.495767,true,"","this setVariable ['taskObject',true]; [this,false] call RELO_fnc_vehicleDisable;"],
	["Land_BagFence_01_long_green_F",[3.72769,-9.79727,0],150.076,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[4.31453,7.64905,0],199.814,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.5,8.65501,0],199.814,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-4.95913,-10.8025,0],199.814,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-5.87777,9.7072,0],341.348,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.885245,-10.8785,0],162.907,false,false,[0,-0],0,false,"",""],
	["Land_GarbageHeap_01_F",[-7.849,-7.804,0],252.681,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-7.28197,7.59889,0],333.161,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[5.20022,-10.1312,0],148.18,true,false,[0,-0],0,true,"",""],
	["Land_Wired_Fence_8m_F",[-9.15732,4.82047,0],278.48,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[6.4888,2.42408,0],82.8147,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[-8.91625,-2.81023,0],259.761,false,false,[0,0],0,false,"",""],
	["Land_Wired_Fence_8m_F",[6.32306,-5.20863,0],101.533,false,false,[0,-0],0,false,"",""]
]
