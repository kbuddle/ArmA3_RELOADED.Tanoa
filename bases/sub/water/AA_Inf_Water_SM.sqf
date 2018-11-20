/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Inf_Water_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Pier_Box_F",[0.2097,0.204102,3.89337],0,false,false,[0,0],0,false,"",""],
	["Land_Pier_addon",[-11.466,1.562,-2],270,false,false,[0,0],0,false,"",""],
	["Land_Pier_addon",[11.924,-0.729,-2],90,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Small_F",[-3.58522,7.7627,3.89337],179.752,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Small_F",[-5.84132,-6.43701,3.89337],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Small_F",[3.91087,-6.43994,3.89337],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Small_F",[6.19359,7.69531,3.89337],179.24,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Long_F",[-3.97609,-3.76514,3.89337],270.957,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Long_F",[4.10399,5.34131,3.89337],273.466,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-0.863542,-1.35547,3.89337],219.1,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-3.19045,-1.40576,3.89337],136.87,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[1.05076,2.78125,3.89337],34.6083,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[3.34398,2.8833,3.89337],316.13,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[-7.3008,-0.855469,3.89337],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[7.97508,2.00098,3.89337],92.0826,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[-7.39919,4.73389,3.89337],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[7.90892,-3.46973,3.89337],94.5064,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-0.912858,-6.56934,3.89337],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[1.31053,9.20996,3.89337],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-7.66927,1.06649,5.14089],90.3851,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[8.24608,-0.0513039,5.15078],269.714,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-12.8815,7.88939,0.661729],143.304,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-12.8905,-5.162,0.661721],36.982,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[13.1165,-7.26762,0.661728],302.456,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[13.1592,5.5087,0.661724],235.112,true,false,[0,0],0,true,"",""],
	["Land_SandbagBarricade_01_half_F",[-8.53395,-5.93604,3.89337],354.973,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[8.91063,6.8208,3.89337],180.317,false,false,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[-3.38161,7.94824,3.89337],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-5.98586,-6.97119,3.89337],182.052,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[3.78783,-6.98828,3.89337],182.052,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[6.38377,7.646,3.89337],0,true,false,[0,0],0,true,"",""],
	["O_static_AA_F",[-1.81569,-3.32764,3.89337],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_static_AA_F",[2.31126,4.09521,3.89337],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Box_FIA_Support_F",[-0.416764,7.50928,3.89337],0,true,false,[0,0],0,true,"",""],
	["Box_FIA_Support_F",[-5.92043,3.95459,3.89337],0,true,false,[0,0],0,true,"",""],
	["Box_FIA_Support_F",[6.32835,-2.49512,3.89337],0,true,false,[0,0],0,true,"",""]
]
