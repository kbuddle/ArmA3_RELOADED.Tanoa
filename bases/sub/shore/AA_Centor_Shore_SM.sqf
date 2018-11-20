/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: AA_Centor_Shore_SM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_Small_F",[0.849122,-0.785157,-0.0048604],358.918,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_Tower_F",[0.681149,9.34423,-0.0048604],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_Round_F",[-4.61279,0.555418,-0.0048604],32.7474,false,false,[0,0],0,false,"",""],
	["Land_BagFence_Round_F",[5.8418,0.875,-0.0048604],320.521,false,false,[0,0],0,false,"",""],
	["Land_Breakwater_01_F",[-3.95361,-8.90735,-2.00486],0,false,false,[0,0],0,false,"",""],
	["Land_Breakwater_01_F",[4.77939,-8.88735,-2.00486],0,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[-13.0889,10.4353,-0.0048604],270,false,false,[0,0],0,false,"",""],
	["Land_CncShelter_F",[13.6338,11.1682,-0.0048604],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierTower_F",[-9.60352,5.07373,-0.0048604],85.6156,false,false,[0,0],0,false,"",""],
	["Land_HBarrierTower_F",[10.8052,5.55835,-0.0048604],265.593,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-3.86133,11.7556,-0.0048604],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[-9.19775,-1.42969,-0.0048604],270,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[4.55371,11.8823,-0.0048604],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall6_F",[9.9082,-1.42969,-0.0048604],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrierWall_corridor_F",[-10.7295,10.3135,-0.0048604],182.574,false,false,[0,0],0,false,"",""],
	["Land_HBarrierWall_corridor_F",[11.4302,10.9536,-0.0048604],182.574,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[-9.4038,0.671719,1.22362],69.7775,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[10.0921,1.24672,1.19718],293.04,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-1.14964,9.7282,4.89895],182.202,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-12.833,10.4731,2.4329],91.545,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_single_F",[13.7449,10.9975,2.43202],270,true,false,[0,0],0,true,"",""],
	["Land_SandbagBarricade_01_half_F",[-2.47803,0.105711,-0.0048604],359.702,false,false,[0,0],0,false,"",""],
	["Land_SandbagBarricade_01_half_F",[4.0625,0.346436,-0.0048604],179.104,false,false,[0,-0],0,false,"",""],
	["Land_CampingTable_F",[0.793458,-1.66748,-0.209083],359.211,false,false,[0,0],0,false,"",""],
	["Land_Laptop_unfolded_F",[0.352052,-1.58911,0.603923],355.055,true,false,[0,0],0,true,"",""],
	["B_SAM_System_02_F",[1,-1,2],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
