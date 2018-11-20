/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: ST_WellPoison_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_ConcreteWell_01_F",[-4,0,0.0949287],180,false,false,[0.000278217,-180],0,false,"",""],
	["Land_ConcreteWell_01_F",[-4,0,0.653753],0,false,false,[0,0],0,false,"",""],
	["Land_ConcreteWell_01_F",[0,0,0.477425],180,false,false,[0.000278217,-180],0,false,"",""],
	["Land_ConcreteWell_01_F",[0,0,1.03625],0,false,false,[0,0],0,false,"",""],
	["Land_ConcreteWell_01_F",[4,0,0.0949287],180,false,false,[0.000278217,-180],0,false,"",""],
	["Land_ConcreteWell_01_F",[4,0,0.653753],0,false,false,[0,0],0,false,"",""],
	["Land_AirConditioner_02_F",[-6.125,-5.5,0],140,false,false,[0,-0],0,false,"",""],
	["Land_AirConditioner_04_F",[1,-2.375,0],125,false,false,[0,-0],0,false,"",""],
	["Land_CanisterFuel_F",[-3.70767,-1.63447,0],345,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[-4.125,-2,0],230,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[-4.25,-1.25,0],45,false,true,[0,0],0,false,"",""],
	["Land_CanisterFuel_F",[-4.47117,-2.61373,0],25,false,true,[0,0],0,false,"",""],
	["Land_Garbage_square5_F",[-2.89573,-2.28932,0],0,false,false,[0,0],0,false,"",""],
	["Land_Garbage_square5_F",[3.20421,-4.862,0],15,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-4.72726,2.28691,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-8.75,-9.25,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[0.854082,2.23409,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[3.5,-11.5,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[6.48656,2.22143,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[8.54645,-1.4776,0],90,false,false,[0,0],0,false,"",""],
	["Land_IndPipe1_ground_F",[1.5,0,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_LampShabby_F",[-6.75,2.125,0],135,true,false,[0,-0],0,true,"",""],
	["Land_LampShabby_F",[8.5,2.125,0],225,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-4.91,3.66596,0],180,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WiredFence_F",[-8.35268,-7.52232,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[-8.36922,0.217075,0],90,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[10.1205,-7.56803,0],270,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[10.1333,0.176943,0],270,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[2.84064,3.65167,0],180,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WiredFence_F",[6.63498,-11.0464,0],0.000475552,false,false,[0,0],0,false,"",""],
	["Land_Mil_WiredFence_F",[6.68572,3.65075,0],180,false,false,[0,-0],0,false,"",""],
	["Land_Mil_WiredFence_Gate_F",[-3.75,-11.5,0],0,false,false,[0,0],0,false,"",""],
	["O_Truck_02_fuel_F",[-2.625,-6.375,0],225,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["I_G_Offroad_01_repair_F",[3.625,-7.59425,-0.000293255],255,true,false,[0,0],0,true,"","this setVariable ['taskObject',true]; [this,true] call RELO_fnc_vehicleDisable;"],
	["WaterPump_01_forest_F",[4.625,-3.625,0],215,false,true,[0,0],0,false,"",""]
]
