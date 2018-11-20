/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseFOBLand_CM
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
	["Box_CSAT_Uniforms_F",[-5.48314,-11.3327,0],284.099,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_CSAT_Uniforms_F",[-5.53706,-10.5193,0],261.97,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_AmmoOrd_F",[-13.952,-12.4464,0],269.909,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_AmmoOrd_F",[-13.8891,-13.1888,0.0331221],269.909,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_AmmoVeh_F",[-5.80355,-12.5021,0],269.909,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_Wps_F",[-13.8835,-13.071,0.422966],269.909,true,false,[0.0279664,-4.43533e-005],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_WpsLaunch_F",[-12.2287,-12.7213,0],179.687,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_WpsLaunch_F",[-12.2409,-13.192,0],179.687,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_East_WpsLaunch_F",[-12.2186,-13.1976,0.249113],179.687,true,false,[0.0791282,-0.000432888],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_T_East_Ammo_F",[8.99772,-11.9489,0],249.759,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_T_East_Wps_F",[10.0227,-11.8762,0],171.02,true,false,[0,-0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Box_T_East_WpsSpecial_F",[11.5717,-11.9846,0],184.411,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["Land_BagBunker_01_large_green_F",[-0.516721,7.70224,0],179.91,false,false,[0,-0],0,false,"",""],
	["Land_Cargo_Patrol_V4_F",[-12.2911,10.8149,4.76837e-007],133.724,true,false,[0,-0],0,true,"",""],
	["Land_Cargo_Patrol_V4_F",[12.1723,10.8734,4.76837e-007],220.506,true,false,[0,0],0,true,"",""],
	["Land_HBarrier_01_line_3_green_F",[14.1856,13.8011,0],359.832,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-1.606,13.774,0],359.905,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[4.11332,13.7275,0],359.905,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.1116,-1.11683,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.2458,-1.03782,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.69497,-10.9105,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.00478,-10.8457,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.77773,-14.5492,0],359.953,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.221,4.66736,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[11.4852,-14.562,0],359.953,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-7.31121,13.7984,0],359.905,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.8704,-14.4778,0],359.953,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-11.5764,-14.4455,0],359.953,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.1741,10.3867,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.1364,4.58834,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.219,-12.4086,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.1833,10.3077,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.0714,-6.86125,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[15.0686,-12.4942,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-15.1942,-6.70345,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-13.0556,13.8383,0],359.905,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[9.79113,13.7184,0],359.905,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_tower_green_F",[9.35538,-10.8203,0],269.909,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_Gate_F",[-0.054389,-15.5302,0],0.0095486,false,false,[0,0],0,false,"",""],
	["Land_Pallet_vertical_F",[-13.8756,-7.10525,0],87.636,false,true,[0,0],0,false,"",""],
	["Land_Pallets_F",[-13.5745,-8.73358,0],85.9904,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[13.663,-7.12302,0],120.328,true,false,[0,-0],0,true,"",""],
	["Land_PortableLight_double_F",[-13.9221,-9.88799,0],246.955,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-6.19946,11.9437,0],21.2528,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[7.059,10.523,0],347.337,true,false,[0,0],0,true,"",""],
	["Land_WaterTank_04_F",[5.56355,11.6935,0],1.30483,true,false,[0,0],0,true,"",""],
	["O_CargoNet_01_ammo_F",[-8.5106,-12.9115,0],269.909,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_CargoNet_01_ammo_F",[-10.4254,-12.872,0],265.42,true,false,[0,0],0,true,"","[this] call RELO_fnc_randomContainerLoadout;"],
	["O_HMG_01_high_F",[7.41058,-11.162,2.60166],235.64,true,false,[0,0],0,true,"",""],
	["O_LSV_02_armed_F",[11.1735,0.253147,0],269.909,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout; [this,false] call RELO_fnc_vehicleDisable;"],
	["O_MRAP_02_F",[-9.59724,1.57341,-4.76837e-007],122.695,true,false,[0,-0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout; [this,false] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[12.8508,-3.54956,0],269.909,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout; [this,false] call RELO_fnc_vehicleDisable;"],
	["O_Quadbike_01_F",[12.8476,-5.39877,0],269.909,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout; [this,false] call RELO_fnc_vehicleDisable;"],
	["O_Truck_02_transport_F",[-8.639,-8.14393,0],44.1938,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this] call RELO_fnc_randomContainerLoadout; [this,false] call RELO_fnc_vehicleDisable;"]
]
