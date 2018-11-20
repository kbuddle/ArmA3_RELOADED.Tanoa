/*
	fn_objectsGrabber by soulkobk.
	mission: baseCOB_Delta_RH
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
*/

[
	["Land_Cargo_Tower_V4_F",[0,0,0],45,true,false,[0,0],0,true,"",""],
	["Land_BagFence_01_long_green_F",[-0.126464,-7.97672,0],137.046,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-11.5437,-5.95919,0],179.189,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-14.0612,1.66165,0],357.816,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-15.8563,1.63519,0],268.04,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-7.339,13.548,0],330.113,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[-8.06246,-10.7642,0],205.879,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[0.00513258,9.21451,0],268.04,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[11.1735,-7.19168,0],171.25,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[12.4947,6.92801,0],128.091,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[14.6819,-4.38548,0],64.2859,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[17.9526,1.0388,0],268.04,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.26591,-11.3089,0],156.593,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_long_green_F",[7.76929,13.7352,0],31.273,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.52308,7.37893,0],136.191,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[-6.55325,-6.48486,0],43.7052,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[6.6489,-6.03257,0],317.73,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_round_green_F",[7.13612,6.88128,0],225.807,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.0124856,9.23773,0.828234],268.745,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-0.132434,-8.00525,0.832463],137.752,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-11.5672,-5.97634,0.828234],179.895,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-14.038,1.67936,0.828234],358.521,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-15.8739,1.65841,0.828234],268.745,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-7.32674,13.5744,0.828234],330.818,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[-8.09122,-10.7689,0.828234],206.584,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[11.1525,-7.21192,0.828234],171.956,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[12.4933,6.8989,0.828234],128.796,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[14.7074,-4.39964,0.828234],64.9913,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[17.935,1.06202,0.828234],268.745,false,false,[0,0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[7.25073,-11.3338,0.828234],157.298,false,false,[0,-0],0,false,"",""],
	["Land_BagFence_01_short_green_F",[7.79837,13.7372,0.828234],31.9784,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-14.0103,12.5485,0],268.574,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-14.1045,-9.91224,0],90.6544,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-18.0482,-4.06123,0],200.06,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-18.0903,7.34988,0],155.715,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-3.40759,16.7673,0],224.229,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[-3.73972,-14.6857,0],135,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[13.969,-10.7112,0],89.1554,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[14.1409,12.3426,0],268.936,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[18.9337,-5.37077,0],336.901,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[19.1278,6.03876,0],21.2466,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[3.32401,-14.8222,0],44.8098,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_big_4_green_F",[3.63767,16.8033,0],313.282,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-11.2838,15.7604,0],44.5483,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-11.5987,-13.3758,0],133.998,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-20.1828,3.62081,0],199.35,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-20.2211,-0.440711,0],339.664,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-7.58999,17.4496,0],264.235,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[-7.9232,-15.1045,0],274.312,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[11.3563,-13.9577,0],226.873,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[11.4871,15.7753,0],316.333,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[21.2139,-1.68773,0],19.0844,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[21.2333,2.37392,0],159.398,false,false,[0,-0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[7.59701,-15.4957,0],86.5595,false,false,[0,0],0,false,"",""],
	["Land_HBarrier_01_line_3_green_F",[7.88506,17.6522,0],96.6467,false,false,[0,-0],0,false,"",""],
	["Land_DataTerminal_01_F",[-3.07172,-1.39797,15.3646],0,true,false,[0,0],0,true,"",""],
	["Land_Laptop_02_unfolded_F",[0.525862,1.53959,13.6095],110.398,true,false,[0,-0],0,true,"",""],
	["OfficeTable_01_old_F",[0.554677,1.4995,12.7646],134.299,true,false,[0,-0],0,true,"",""],
	["O_HMG_01_high_F",[-5.64774,6.62955,0],318.853,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[-5.84221,-5.33078,0],219.008,true,false,[0,0],0,true,"",""],
	["O_HMG_01_high_F",[5.73147,-5.21787,0],139.942,true,false,[0,-0],0,true,"",""],
	["O_HMG_01_high_F",[6.46764,5.99827,0],47.2357,true,false,[0,0],0,true,"",""]
]
