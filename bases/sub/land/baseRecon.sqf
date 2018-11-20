/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: outpostSoulRecon
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
	["Land_Cargo_Tower_V1_F",[0,0,0],270,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V1_F",[8.45585,9.25773,4.76837e-007],225,true,false,[0,0],0,true,"",""],
	["Land_Cargo_Patrol_V1_F",[-9.04415,-8.49227,4.76837e-007],45,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[-9.54415,15.0077,2.78],90,true,false,[0,-0],0,true,"",""],
	["I_HMG_01_high_F",[-8,10,0],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[8.70585,-14.2423,2.78],270,true,false,[0,0],0,true,"",""],
	["I_HMG_01_high_F",[7,-9,0],90,true,false,[0,-0],0,true,"",""],
	["Land_BagBunker_Tower_F",[6.70585,-14.4923,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Tower_F",[-7.54415,15.2577,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Corner_F",[-8.25,-3.25,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Corner_F",[7.75,4,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[10,3.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-7,7.25,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[9.75,-10,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[6.25,-6.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-10.5,-3,0],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[-10.5,10.75,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[9,-7.25,0],225,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-9.75,8,0],45,false,false,[0,0],0,false,"",""],
	["Land_BarGate_F",[-21.2942,8.50773,0],90,true,false,[0,-0],0,true,"",""],
	["Land_BarGate_F",[20.7058,-8.24227,0],270,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_3_F",[6.20585,5.25773,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_3_F",[-6.79415,-4.49227,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-9.79415,-12.4923,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[0.705849,13.2577,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[9.20585,13.2577,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-16.2942,13.2577,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[15.7058,-12.4923,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[12.7058,10.0077,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-13.2942,-0.742268,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[15.9558,-3.74227,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-16.2942,4.50773,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[12.7058,1.50773,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-1.29415,-12.4923,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-4.29415,8.25773,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[3.45585,-7.49227,0],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_Big_F",[-13.2942,-9.24227,0],270,false,false,[0,0],0,false,"",""],
	["Land_LampHalogen_F",[-13.0442,4.75773,0.17999],0,true,false,[0,0],0,true,"",""],
	["Land_LampHalogen_F",[12.7058,-3.99227,4.76837e-007],180,true,false,[0,0],0,true,"",""],
	["Box_IND_WpsSpecial_F",[5.75,-4,16.75],90,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_NATO_WpsSpecial_F",[5.75,-1.5,16.75],90,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_O_UAV_06_F",[-4.24999,5.00018,16],245,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["I_supplyCrate_F",[1,-3,19.5],90,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_AirConditioner_02_F",[-2.25,6.5,0],95,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_03_F",[0.5,-10.5,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_AirConditioner_04_F",[10.5,2.75,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_MetalCase_01_large_F",[-4,4,19.5],55.0003,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_MetalCase_01_medium_F",[0.75,5.75,19.25],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_large_F",[-5.5,14.75,3.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_medium_F",[5.25,-3,19.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_medium_F",[4.75,-14,4.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_small_F",[-2.5,-3.5,10],90,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_small_F",[-2,-0.25,19],290,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"],
	["Land_PlasticCase_01_small_F",[-11,-8.25,5.5],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout;"]
]
