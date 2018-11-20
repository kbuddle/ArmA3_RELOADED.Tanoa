/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: radioTowerLand_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_BagBunker_01_small_green_F",[4.76923,5.8922,0],220.157,false,false,[0,0],0,false,"",""],
	["Land_BagBunker_01_small_green_F",[-5.12766,-5.23079,0],41.645,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-9.07411,-1.97414,0],279.724,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-9.12797,-2.16266,0.836816],279.073,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.08653,2.81713,0],276.902,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.709703,-8.30501,0],316.709,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.22738,9.54186,0],342.922,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[9.15735,2.71172,0.805414],94.5414,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.94447,0.370959,0],311.656,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[8.18527,0.226336,0],128.461,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.15198,8.11727,0],313.626,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.68558,-9.4194,0],355.435,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-1.62948,-9.43168,0.80527],354.726,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[1.03338,9.46385,0.850903],162.706,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-4.26183,-9.0746,0],36.3209,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-8.93739,-4.6448,0],58.1105,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[3.58486,9.66057,0],203.373,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[8.73635,5.442,0],229.903,false,false,[0,0],0,false,"",""],
	["Land_Communication_F",[0.007,-0.016,0],355.381,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_HBarrier_01_line_1_green_F",[-0.162695,3.40215,0],86.7231,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[3.24197,0.446124,0],355.381,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-3.50187,-0.485219,0],355.381,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_1_green_F",[-0.0387421,-3.43126,0],86.7231,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[2.27767,-2.04527,0],310.752,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-2.50727,1.97426,0],310.752,false,false,[0,0],0,false,"",""],
	["Land_PortableLight_double_F",[8.39417,2.78132,0],86.079,true,false,[0,0],0,true,"",""],
	["Land_PortableLight_double_F",[-8.38009,-2.10088,0],277.669,true,false,[0,0],0,true,"",""],
	["Land_Razorwire_F",[-7.70563,6.39989,0],308.505,false,false,[0,0],0,false,"",""],
	["Land_Razorwire_F",[7.28789,-6.68261,0],313.256,false,false,[0,0],0,false,"",""],
	["Land_WoodenCrate_01_F",[-1.25315,-8.71673,0],271.084,false,true,[0,0],0,false,"",""]
]
