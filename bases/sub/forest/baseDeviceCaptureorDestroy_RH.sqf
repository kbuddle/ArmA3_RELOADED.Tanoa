/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseDeviceCaptureorDestroy_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_large_green_F",[10,0,0],270,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_large_green_F",[-10,0,0.178],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[0.150368,7.42308,2.78],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-0.212402,-7.18721,2.78],180,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[4.835,-0.623989,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-5.05598,0.77079,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-10.7565,6.58071,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[10.7814,-6.61371,0],0,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[6.13145,10.8443,0],90,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-6.43917,-10.9138,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-3.99756,-2.59744,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[3.81506,-2.75147,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[2.65244,3.8371,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[3.78387,2.41206,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-2.65696,-4.03174,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-4.02876,2.56608,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[2.72793,-4.06199,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-2.64044,3.88814,0],0,false,false,[0,0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[-4.03372,-0.000639995,0],90,false,false,[0,-0],0,false,"",""],
	["Land_CncBarrier_stripes_F",[3.7789,-0.154665,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Device_slingloadable_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_HBarrier_01_line_5_green_F",[14.5209,7.26854,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-14.4917,7.57784,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-14.6707,-7.50025,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.85123,14.0033,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.65785,-13.8989,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[14.3858,-7.31678,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.73991,14.1089,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.8245,-14.0494,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_tower_green_F",[0,-10,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_tower_green_F",[0,10,0],180,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[-8.94184,-8.00425,0],179.745,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[8.65942,7.91069,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[7.70746,-9.16602,0],90,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_wall_corner_green_F",[-7.73978,9.11265,0],270,false,false,[0,0],0,false,"",""],
	["Land_Pallet_MilBoxes_F",[0.714987,10.1325,0],0,false,false,[0,0],0,false,"",""],
	["O_HMG_01_high_F",[0.0780859,-8.35652,2.78],0,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[0.482,8.421,2.78],180,true,false,[0,0],0,true,"",""]
]
