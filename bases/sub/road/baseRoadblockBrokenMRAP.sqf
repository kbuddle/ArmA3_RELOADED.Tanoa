/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: roadBlockBrokenMRAP
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
	["B_MRAP_01_F",[-3.5,-2.00157,-4.76837e-007],275,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["Box_AAF_Equip_F",[10,-2,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_CSAT_Equip_F",[-10,-2,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["I_HMG_01_high_F",[9,5,0],0,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-9,-9,0],180,true,false,[0,-0],0,true,"",""],
	["Land_CncBarrier_stripes_F",[4,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[0,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[4,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-4,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-4,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[0,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-9,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-11,-10,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-14,-2,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[9,2,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-9,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[9,-6,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[11,6,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[14,-2,0],270,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[6,2,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[-6,-6,0],180,true,false,[0,0],0,true,"",""],
	["Land_ScrapHeap_1_F",[4.07518,-3.14843,1.90735e-006],95,false,false,[0,-0],0,false,"",""]
]
