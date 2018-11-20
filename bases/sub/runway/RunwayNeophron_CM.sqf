/*
	fn_objectsGrabber by soulkobk.
	mission: RunwayNeophron_CM
	world: VR
	center position: [0,0,0]
	radius: 100
	array list: [objectClass, objectPosition, objectDirection, objectSimulation, _objectSimpleObject, _objectPitchBank, objectDamage, _objectAllowDamage, objectVarName, objectInit]
*/

[
	["Land_DeckTractor_01_F",[5.53956,7.49124,0],355,true,false,[0,0],0,true,"",""],
	["Land_JetEngineStarter_01_F",[7.80103,1.99913,0],325,true,false,[0,0],0,true,"",""],
	["Land_Laptop_02_unfolded_F",[5.08865,5.94307,1.06998],80,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[2.26592,4.48512,0],260,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[2.31312,3.55624,0],260,true,false,[0,0],0,true,"",""],
	["Land_MetalBarrel_F",[2.39496,2.73823,0],260,true,false,[0,0],0,true,"",""],
	["Land_MetalCase_01_large_F",[-5.36928,1.46021,0],300,true,false,[0,0],0,true,"",""],
	["Land_Missle_Trolley_02_F",[-3.25391,3.80268,0],12.1792,true,false,[0,0],0,true,"",""],
	["Land_Missle_Trolley_02_F",[4.38636,-5.17178,0],324.158,true,false,[0,0],0,true,"",""],
	["Land_PalletTrolley_01_yellow_F",[3.44942,3.80954,0],145,true,false,[0,-0],0,true,"",""],
	["Land_PitotTubeCover_01_F",[-1.22254,9.05849,0],145,true,false,[0,-0],0,true,"",""],
	["Land_PlasticCase_01_large_gray_F",[-3.00219,8.13634,0],250,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-5.7759,7.60201,0],310,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[2.4181,8.63616,0],10,true,false,[0,0],0,true,"",""],
	["Land_TowBar_01_F",[0.0170716,6.21026,0],0,true,false,[0,0],0,true,"",""],
	["Land_WheelChock_01_F",[0.0490855,3.57995,0],90,true,false,[0,0],0,true,"",""],
	["O_Truck_02_transport_F",[-5.15982,12.2255,0],330,true,false,[0,0],0,true,"","[_this,true] call RELO_fnc_vehicleDisable;"],
	["O_Plane_CAS_02_dynamicLoadout_F",[0,0.0805664,-0.00108814],0,true,false,[0,0],0,true,"","_this setVariable ['taskObject',true]; [_this,true] call RELO_fnc_vehicleDisable;"]
]
