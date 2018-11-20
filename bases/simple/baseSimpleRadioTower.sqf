/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: baseSimpleRadioTower
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_Barricade_01_4m_F",[0.125,0.875,0],0,false,false,[0,0],0,false,"",""],
	["Land_Barricade_01_4m_F",[0,-0.875,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-2.375,0.125,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[2.25,0.125,0],90.0021,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[0,9.375,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-9.50873,-5.79323,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-9.50873,5.70681,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-0.00872803,-7.79323,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[9.44805,-5.78451,0],90.0013,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[9.44803,5.71555,0],90.0013,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[9.5,0,0],75.0012,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.75873,-7.79324,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[5.74127,7.83177,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[-5.75873,7.83177,0],0,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_5_green_F",[4.125,-9.5,0],225.001,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-4.25,0.125,0],270.001,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[4.125,9.75,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-4.25873,9.70677,0],0,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[4.5,-0.625,0],105.001,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[-2.25,-9.75,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-11.3511,-5.27447,0],310.001,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[4.125,-12.375,0],225.001,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[11.323,4.21553,0],90.0013,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[11.3663,-4.16823,0],90.0013,false,false,[0,-0],0,false,"",""],
	["Land_Razorwire_F",[-11.4761,5.10053,0],230.002,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[-10.125,-9.75,0],180.001,false,false,[0,0],0,false,"",""],
	["Land_Sign_Mines_F",[7.25,2.875,0],9.75436e-005,false,false,[0,0],0,false,"",""],
	["Land_Sign_Mines_F",[-5.5,0,0],90,false,false,[0,-0],0,false,"",""],
	["Land_Sign_MinesDanger_English_F",[9.375,-8.875,0],9.82907e-005,false,false,[0,0],0,false,"",""],
	["Land_Communication_F",[0,0,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Sign_MinesDanger_English_F",[1.875,8,0],180,false,false,[0,-0],0,false,"",""],
	["Land_Sign_MinesDanger_English_F",[-10,-2,0],90,false,false,[0,-0],0,false,"",""]
]
