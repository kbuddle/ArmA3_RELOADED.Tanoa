/*
	fn_objectsGrabber by soulkobk.
	mission: RunwayTaru_CM
	world: VR
	center position: [0,0,0]
	radius: 100
	array list: [objectClass, objectPosition, objectDirection, objectSimulation, _objectSimpleObject, _objectPitchBank, objectDamage, _objectAllowDamage, objectVarName, objectInit]
*/

[
	["Land_JumpTarget_F",[0.0959745,0.0241346,0],0,false,false,[0,0],0,true,"",""],
	["Land_WheelChock_01_F",[-3.35887,-0.674773,0],90,false,false,[0,0],0,true,"",""],
	["Land_WheelChock_01_F",[3.38907,-0.664362,0],90,false,false,[0,0],0,true,"",""],
	["Land_AirIntakePlug_04_F",[-3.44223,1.7875,0],165,false,false,[0,-0],0,true,"",""],
	["Land_RotorCoversBag_01_F",[-3.79124,2.40271,0],0,false,false,[0,0],0,true,"",""],
	["Land_RotorCoversBag_01_F",[-3.84432,3.599,0],0,false,false,[0,0],0,true,"",""],
	["Land_HelicopterWheels_01_assembled_F",[0.680808,6.21602,0],195,false,false,[0,0],0,true,"",""],
	["Land_PortableLight_single_F",[-2.63454,7.00132,0],355,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[7.4678,-5.78866,0],140,true,false,[0,-0],0,true,"",""],
	["I_G_Offroad_01_repair_F",[-4.375,8.53075,-0.000293255],30,true,false,[0,0],0,true,"","[_this,true] call RELO_fnc_vehicleDisable;"],
	["Land_Pod_Heli_Transport_04_box_F",[-0.125,-2.25,0],355,true,false,[0,0],0,true,"","[_this,true] call RELO_fnc_vehicleDisable;"],
	["Land_Pod_Heli_Transport_04_box_F",[-8.875,-7,0],25,true,false,[0,0],0,true,"","[_this,true] call RELO_fnc_vehicleDisable;"],
	["O_Heli_Transport_04_F",[0,-0.012732,-2.86102e-005],0,true,false,[0,0],0,true,"","_this setVariable ['taskObject',true]; [_this,true] call RELO_fnc_vehicleDisable;"]
]
