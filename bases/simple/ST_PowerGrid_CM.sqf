/*
	fn_objectsGrabber for EDEN editor by soulkobk.
	revision: 20171123

	mission: ST_PowerGrid_CM
	world: VR
	center position: [0,0,0]
	radius: 100

	array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]

	to set object as task object, place in init of object = this setVariable ['taskObject',true];
	to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;
	to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomCrateLoadOut;

	make sure as many objects as possible have simulation turned off, or simple object enabled!
*/

[
	["Land_CinderBlocks_01_F",[10.7272,9.18871,0],90,false,false,[0,0],0,false,"",""],
	["Land_DPP_01_transformer_F",[4.1651,2.30696,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_DPP_01_transformer_F",[4.1651,-2.70304,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_DPP_01_transformer_F",[-1.2287,-2.73725,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_DPP_01_transformer_F",[-1.2287,2.27275,0],0,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_FieldToilet_F",[11.8984,-5.26094,0],90,false,false,[0,0],0,false,"",""],
	["Land_LampHalogen_F",[-7.77001,-10.3957,4.76837e-007],140,true,false,[0,-0],0,true,"",""],
	["Land_LampHalogen_F",[12.7451,10.3621,4.76837e-007],320,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[2.15679,11.2043,0],180,true,false,[0,-0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-9.05704,0.0282593,0],90,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-5.59115,11.2046,0],180,true,false,[0,-0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-9.04795,7.76062,0],90,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-5.62124,-11.184,0],0,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[2.11112,-11.193,0],0,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[13.3487,7.72197,0],270,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[-9.05731,-7.71967,0],90,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[9.88916,11.1952,0],180,true,false,[0,-0],0,true,"",""],
	["Land_Mil_WiredFence_F",[13.3116,-7.75004,0],270,true,false,[0,0],0,true,"",""],
	["Land_Mil_WiredFence_F",[9.85905,-11.1933,0],0,true,false,[0,0],0,true,"",""],
	["Land_PowLines_Transformer_F",[-6.84997,-2.8682,-4.76837e-007],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_PowLines_Transformer_F",[-6.64952,2.56612,-4.76837e-007],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_Shed_02_F",[0.182065,-7.73979,0],180,true,false,[0,0],0,true,"",""],
	["Land_Shed_05_F",[8.4387,-8.20822,0],0,true,false,[0,0],0,true,"",""],
	["Land_SolarPanel_2_F",[-5.57584,-6.9763,0],270,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_SolarPanel_2_F",[-6.25251,6.88048,0],305,true,false,[0,0],0,true,"","this setVariable ['taskObject',true];"],
	["Land_TimberPile_01_F",[0.135467,9.81185,0],0,false,false,[0,0],0,false,"",""],
	["Land_TimberPile_01_F",[-0.130541,8.13747,0],180,false,false,[0,-0],0,false,"",""],
	["Land_WoodenPlanks_01_F",[6.50759,8.99544,0],0,false,false,[0,0],0,false,"",""]
]
