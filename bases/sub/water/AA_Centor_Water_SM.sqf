/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Water_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Pier_Box_F",[-0.0118957,-0.0664063,3.90902],0,false,false,[0,0],0,false,"",""],
	["Land_Pier_addon",[-11.687,1.29,-2],270,false,false,[0,0],0,false,"",""],
	["Land_Pier_addon",[11.703,-1,-2],90,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Small_F",[-3.80682,7.49219,3.90902],179.752,false,false,[0,-0],0,false,"",""],
	["Land_BagBunker_Small_F",[-6.06292,-6.70752,3.90902],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Small_F",[3.68928,-6.71045,3.90902],0,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Small_F",[5.97199,7.4248,3.90902],179.24,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-2.1513,-1.98486,3.90902],40.9347,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[-2.22479,2.71631,3.90902],134.159,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[2.63557,2.69141,3.90902],222.699,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[2.6739,-2.13574,3.90902],316.21,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[-7.52239,-1.12598,3.90902],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall4_F",[7.75349,1.73047,3.90902],92.0826,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[-7.62078,4.46338,3.90902],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corner_F",[7.68732,-3.74023,3.90902],94.5064,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_5_F",[-1.13445,-6.83984,3.90902],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_5_F",[1.08893,8.93945,3.90902],0,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_single_F",[-8.91073,9.1787,3.91467],138.054,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[-9.28482,-8.85957,3.91466],35.942,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[8.99903,-8.69644,3.91467],320.14,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[9.14559,9.16467,3.91466],225.972,true,false,[0,0],0,true,"",""],
	["Land_SandbagBarricade_01_half_F",[-3.13177,0.495605,3.90902],88.671,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[-8.75555,-6.20654,3.90902],354.973,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[0.242255,-2.81592,3.90902],0.396413,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[0.317694,3.61084,3.90902],180.511,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[3.69269,0.304199,3.90902],269.912,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[8.68903,6.55029,3.90902],180.317,false,false,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[-3.6723,7.90234,3.90902],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-6.27654,-7.01709,3.90902],182.052,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[3.49714,-7.03418,3.90902],182.052,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[6.09308,7.6001,3.90902],0,true,false,[0,0],0,true,"",""],
	["Box_FIA_Support_F",[-0.643243,7.29102,3.90902],0,true,false,[0,0],0,true,"",""],
	["Box_FIA_Support_F",[6.33674,-2.83691,3.90902],0,true,false,[0,0],0,true,"",""],
	["Land_CampingTable_F",[2.71882,7.67529,3.90902],180.585,false,true,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[3.15851,7.58643,3.90902],176.429,true,false,[0,-0],0,true,"",""],
	["B_SAM_System_02_F",[0.288,0.177,3.909],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
