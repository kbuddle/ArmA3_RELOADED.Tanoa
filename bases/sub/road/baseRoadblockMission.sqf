/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: roadBlockMission
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
	["Box_CSAT_Equip_F",[2.5,7,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Wps_F",[-6.875,-1.625,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Wps_F",[-6.875,-2.625,0],0,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["I_HMG_01_high_F",[-3.25,-12.875,0],180,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-8.75,-8.75,0],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[3.125,12.75,0],0,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[8.75,8.875,0],90,true,false,[0,-0],0,true,"",""],
	["Land_BagFence_Long_F",[7.5,13.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[12,10.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-12.125,-10.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-7.625,-13.625,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[12,7.5,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-12.125,-7.375,0],90,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-11.5,-13,0],45,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[11.375,13.125,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[-9.875,-13.625,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Short_F",[9.75,13.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BarGate_F",[-0.25,14.5,0],180,true,false,[0,0],0,true,"",""],
	["Land_BarGate_F",[0.25,-14.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_3_F",[-2.625,-9,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[2.625,9,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[-5,-11.125,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[5,11.125,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[5,-9.75,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_Big_F",[-5.125,9.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[8.125,-4.375,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-8.25,4.375,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-8.25,-4.625,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[8.125,4.625,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[13.5,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_Big_F",[-13.625,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierTower_F",[-10,-0.25,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierTower_F",[10,0.25,0],270,false,false,[0,0],0,false,"",""],
	["Land_LampSolar_F",[-4.5,4.5,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[4.25,4.5,0],0,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[-4.5,-4.5,0],180,true,false,[0,0],0,true,"",""],
	["Land_LampSolar_F",[4.25,-4.5,0],0,true,false,[0,0],0,true,"",""],
	["O_Quadbike_01_F",[6.06513,-1.76755,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[-2.625,-5.375,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["O_Truck_03_transport_F",[-1,7.37372,-4.76837e-007],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["RoadBarrier_F",[-0.875,-5.5,0],90,true,false,[0,-0],0,true,"",""],
	["RoadBarrier_F",[1.375,6.375,0],270,true,false,[0,0],0,true,"",""],
	["RoadBarrier_F",[-2.25,-2.625,0],180,true,false,[0,-0],0,true,"",""],
	["RoadBarrier_F",[3.375,1.5,0],240,true,false,[0,0],0,true,"",""],
	["RoadBarrier_small_F",[-5,-15.25,0],0,true,false,[0,0],0,true,"",""],
	["RoadBarrier_small_F",[-5,15.25,0],0,true,false,[0,0],0,true,"",""],
	["RoadBarrier_small_F",[5,15.25,0],180,true,false,[0,0],0,true,"",""],
	["RoadBarrier_small_F",[5,-15.25,0],180,true,false,[0,0],0,true,"",""]
]
