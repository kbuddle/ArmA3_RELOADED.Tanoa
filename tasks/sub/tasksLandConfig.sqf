/*
	----------------------------------------------------------------------------------------------
	
	Copyright © 2017 soulkobk (soulkobk.blogspot.com)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as
	published by the Free Software Foundation, either version 3 of the
	License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.

	----------------------------------------------------------------------------------------------
	
	Name: tasksLandConfig.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description:

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
// AVAILABLE ICONS...
// ACCURACY ADDRESS AIRCRAFTSEATMIDDLE AIRDROP AIRPILOTHAT AIRPLANEMODEON AIRTRAFFICCONTROLTOWER ALARM AMMO ANCHOR APPLAUSE
// APPLICATIONSHIELD ARMYTANK ARMYVEHICLE ASSAULTRIFLE ATOMICBOMB ATTENDANCE AUSTRALIAMAP AUTOMATION AUTOMOTIVEGENERATOR
// BATTELEFIELD BATTLESHIP BINOCULARS BOMB BOOM BOOTS BOX BULLET BULLETPROOFVEST BUOY CAMERATRIPOD CAMP CANNON CARTOPVIEW
// CELLULARNETWORK CENTREOFGRAVITY CITY CLEAVER CLOSEDTREASURECHEST CLOUDLIGHTNING COMMA COMMANDSERGEANTMAJORCSM COMMUNICATION
// CONNECTED CORPORALCPL DATAPROTECTION DELETESHIELD DEMAND DISCONNECTED DISCORD DOGE DOGTAG EASY EINSTEIN EMU4IOS ETHERNETOFF
// ETHERNETON EXPLOSION EXPLOSIVE FANHEAD FENCE FIGHTERJET FIREALARM FIRINGGUN FIRSTSERGEANT1SG FISH FLASHBANG FORWARDPUNCH
// GASPUMP GASPUMPHANDLE GATLINGGUN GEAR GRENADE GUN HACKER HANGAR HEARTPULSE HEAVYVEHICLE HELICOPTER HELICOPTERMILITARY HELMET
// HERE ICEBERG IMPORTANTNOTE INCENDIARYGRENADE INFANTRYKNIFE INTERNET INTERSTATETRUCK JAILCELLDOOR JAILDOOR JEANS JERRYCAN
// JETENGINE JETENGINETRANSPORTATIONCRADLE KABOOM KEY KEYHOLESHIELD LIFERING LOCATIONOFF MALE MANUFACTURING MARINERADIO
// MASTERSERGEANTMSG MEDAL MEDICBAG MEDICBANDAGE MEDICCROSS MESH MILITARYBACKPACKRADIO MINELAND MINENAVAL MINETANK MISSILE
// MORTAR MOUNTAIN MOVE MUSHROOMCLOUD NAVIGATION NIGHTVISION NOISEOFF NOTIFICATION NUCLEAR OILBARREL OILPUMP OILTRANSPORTATION
// PARTYBALOONS PARTYHAT PAYPAL PERISCOPE PIPELINES PIRATE POLYLINE PRIVATEFIRSTCLASSPFC PRIVATEPV2 PUMP QUESTIONSHIELD
// RADIOHANDHELD RAZORBLADE RECOVERY REFRESHSHIELD REFUELTRUCK RESTRICTIONSHIELD RIBBON RIFLEMAGAZINE RIGHT2 ROAD RPG RUCKSACK
// RUNWAY SAILBOAT SAILINGBOATLARGE SAILINGBOATMEDIUM SCUBATANK SECURITYCHECKED SERGEANTFIRSTCLASSSFC SERGEANTMAJOROFARMYSMA
// SERGEANTMAJORSGT SERGEANTSGT SHIELD SHIPPINGCONTAINER SHIPWHEEL SHOP SIGNALHORN SKIMASK SKULLCROSSBONES SNIPERRIFLE SOLDIER
// SOUND SPEAKERNOTES SPEED STAFFSERGEANTSSG STAR STOPWATCH STORAGEBOX SUBMACHINEGUN SUBMARINE SWISSARMYKNIFE TANK TEAMSHIRT
// THRUSTER TRAIN TRAINING TRAINSTEAM TRAINSTOP TRAINTRACKS TRAINTRACKSINTERSECTION UNDERCONSTRUCTION USAIRBORNE USAMAP USERLOCATION
// USERSHIELD VOLUMEOFF VOLUMEON WARNINGSHIELD WATERTRANSPORTATION WEB WEBSHIELD WHARF WOODENBARREL WORLDMAP WRENCH
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskArr =
[
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Mortar Defense Base", // task title
		"Placeholder Description!", // task description
		["secure"], // task roless
		"MORTAR", // task icon
		100, // task area radius (red outer circle)
		10, // task base radius (for base placement)
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		2, // number of unit groups
		6 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Infantry Supply Depot",
		"Placeholder Description!",
		["secure"], // task roles
		"FENCE",
		150,
		15,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Land Vehicle Supply Depot",
		"Placeholder Description!",
		["secure"], // task roles
		"FENCE",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Air Vehicle Supply Depot",
		"Placeholder Description!",
		["secure"], // task roles
		"FENCE",
		220,
		22,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Communications Broadcast Tower",
		"Placeholder Description!",
		["secure"], // task roles
		"RADIOHANDHELD",
		100,
		10,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Communications Control Center",
		"Placeholder Description!",
		["secure"], // task roles
		"RADIOHANDHELD",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Air Defense",
		"Placeholder Description!",
		["secure"], // task roles
		"RPG",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Infantry Support Base",
		"Placeholder Description!",
		["secure"], // task roles
		"SOLDIER",
		150,
		15,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Land Vehicle Support Base",
		"Placeholder Description!",
		["secure"], // task roles
		"TANK",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Air Vehicle Support Base",
		"Placeholder Description!",
		["secure"], // task roles
		"HELICOPTER",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Infantry Training Center",
		"Placeholder Description!",
		["secure"], // task roles
		"SOLDIER",
		150,
		15,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Land Vehicle Training Center",
		"Placeholder Description!",
		["secure"], // task roles
		"TANK",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Air Vehicle Training Center",
		"Placeholder Description!",
		["secure"], // task roles
		"FIGHTERJET",
		200,
		20,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Encrypted Data Control Unit",
		"Placeholder Description!",
		["secure"], // task roles
		"DATAPROTECTION",
		100,
		10,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Medical Treatment Centre",
		"Placeholder Description!",
		["secure"], // task roles
		"MEDICBAG",
		120,
		12,
		[
			"baseDeviceCaptureorDestroy_RH",
			"baseForestAlpha_RH",
			"baseHelicopterResupply_RH",
			"baseInfantryTrainingCenter_RH",
			"baseMedical",
			"baseMedicalCenter_RH",
			"baseRampant",
			"baseRecon",
			"baseResistance",
			"baseSmallHQ_RH",
			"baseSupplies",
			"CrampedBase_CM"
		],
		"land",
		2,
		6
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
		[
		"Anti-Air Base",
		"The enemy have set up an anti-air base in this general area, go find it, and destroy it!",
		["destroy"], // task role
		"JETENGINE",
		120,
		12,
		[
			"AA_Centor_Green_SM",
			"AA_Centor_Land_SM",
			"AA_Inf_Green_SM",
			"AA_Inf_Land_SM"
		],
		"land",
		2,
		6
	]
];
///////////////////////////////////////////////////////////////////////////////////////////////////
_soldierClasses =
[
	// "O_soldierU_AAA_F", // Asst. Missile Specialist (AA) - MENURBAN - VANILLA
	// "O_soldierU_AAR_F", // Asst. Autorifleman - MENURBAN - VANILLA
	// "O_soldierU_AAT_F", // Asst. Missile Specialist (AT) - MENURBAN - VANILLA
	// "O_soldierU_AA_F", // Missile Specialist (AA) - MENURBAN - VANILLA
	// "O_soldierU_AR_F", // Autorifleman - MENURBAN - VANILLA
	// "O_soldierU_AT_F", // Missile Specialist (AT) - MENURBAN - VANILLA
	// "O_soldierU_A_F", // Ammo Bearer - MENURBAN - VANILLA
	// "O_soldierU_exp_F", // Explosive Specialist - MENURBAN - VANILLA
	// "O_soldierU_F", // Rifleman - MENURBAN - VANILLA
	// "O_SoldierU_GL_F", // Grenadier - MENURBAN - VANILLA
	// "O_soldierU_LAT_F", // Rifleman (AT) - MENURBAN - VANILLA
	// "O_soldierU_medic_F", // Combat Life Saver - MENURBAN - VANILLA
	// "O_soldierU_M_F", // Marksman - MENURBAN - VANILLA
	// "O_soldierU_repair_F", // Repair Specialist - MENURBAN - VANILLA
	// "O_SoldierU_SL_F", // Squad Leader - MENURBAN - VANILLA
	// "O_soldierU_TL_F", // Team Leader - MENURBAN - VANILLA
	// "O_Soldier_AAA_F", // Asst. Missile Specialist (AA) - MENSUPPORT - VANILLA
	// "O_Soldier_AAR_F", // Asst. Autorifleman - MENSUPPORT - VANILLA
	// "O_Soldier_AAT_F", // Asst. Missile Specialist (AT) - MENSUPPORT - VANILLA
	"O_medic_F", // Combat Life Saver - MEN - VANILLA
	"O_engineer_F", // Engineer - MEN - VANILLA
	"O_HeavyGunner_F", // Heavy Gunner - MEN - MARK
	"O_Soldier_AA_F", // Missile Specialist (AA) - MEN - VANILLA
	"O_Soldier_AR_F", // Autorifleman - MEN - VANILLA
	"O_Soldier_AT_F", // Missile Specialist (AT) - MEN - VANILLA
	"O_Soldier_A_F", // Ammo Bearer - MEN - VANILLA
	"O_soldier_exp_F", // Explosive Specialist - MEN - VANILLA
	"O_Soldier_F", // Rifleman - MEN - VANILLA
	"O_Soldier_GL_F", // Grenadier - MEN - VANILLA
	"O_Soldier_LAT_F", // Rifleman (AT) - MEN - VANILLA
	"O_Soldier_lite_F", // Rifleman (Light) - MEN - VANILLA
	// "O_soldier_M_F", // Marksman - MEN - VANILLA
	// "O_soldier_PG_F", // Para Trooper - MEN - VANILLA
	"O_soldier_repair_F", // Repair Specialist - MEN - VANILLA
	"O_Soldier_SL_F", // Squad Leader - MEN - VANILLA
	"O_Soldier_TL_F" // Team Leader - MEN - VANILLA
];
///////////////////////////////////////////////////////////////////////////////////////////////////
