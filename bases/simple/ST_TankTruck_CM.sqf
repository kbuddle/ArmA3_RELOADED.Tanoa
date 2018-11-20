/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171030

	mission: ST_TankTruck_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Shed_Big_F",[3,2,-2],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-1.07689,-6.15537,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-1.22523,6.08798,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-4.83773,-0.142322,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[10.9614,-4.36426,0],90,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[11.0184,4.40256,0],90,false,false,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.23936,-1.58476,0],270,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.24238,3.00003,0],230,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.3165,0.138938,0],200,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.32058,0.903976,0],270,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.33072,1.68979,0],260,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.34145,-0.763242,0],335,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.42279,4.62007,0],255,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.44921,-4.17742,0],315,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.48952,3.76166,0],315,false,true,[0,0],0,false,"",""],
	["Land_MetalBarrel_F",[3.55145,-3.16761,0],255,false,true,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[10.074,10.0766,0],40,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[9.99796,-10.0253,0],145,true,false,[0,-0],0,true,"",""],
	["Land_Tank_rust_F",[0,-3.002,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tank_rust_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Tank_rust_F",[0,3.033,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["O_Truck_03_fuel_F",[7.198,1.58086,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"]
]
