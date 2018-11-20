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
	
	Name: tasksSimpleConfig.sqf
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
		"Communications Tower", // task title
		"We found an enemy communications set up within the general position, pin point the position, attack and secure it soldiers!", // task description
		["destroy"], // task roles
		"CELLULARNETWORK", // task icon
		125, // task area radius (red outer circle)
		12.5, // task base radius (for base placement)
		[
			"baseSimpleRadioTower",
			"radioTowerLand_CM",
			"Radio1_CM",
			"Radio2_CM",
			"Radio3_CM",
			"simpleMilitaryIntelRoof"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		2, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Military Intel", // task title
		"After a satellite scan of the terrain, and intercepting communications from the enemy we found a small set up for intelligence towards nato, go put the pressure on soldiers!", // task description
		["destroy"], // task roles
		"CELLULARNETWORK", // task icon
		100, // task area radius (red outer circle)
		10, // task base radius (for base placement)
		[
			"baseSimpleIntel"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Rusty Supply Tank", // task title
		"By the looks from the satellite imagery nato received, there is a rusty tank containing water or fuel at this general location, it shouldn't be too hard to locate.", // task description
		["destroy"], // task roles
		"PIPELINES", // task icon
		150, // task area radius (red outer circle)
		15, // task base radius (for base placement)
		[
			"baseSimpleRustyTank",
			"baseSimpleRustyTankTwo",
			"ST_RustyTankShed_CM",
			"simpleTankRustyFence",
			"simpleTankGreenWalls",
			"ST_TankTruck_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Orca Down", // task title
		"Orca Down!.. We've spotted a downed enemy helicopter that seems to be damaged, go destroy it before the enemy repair it!", // task description
		["destroy"], // task roles
		"HELICOPTERMILITARY", // task icon
		150, // task area radius (red outer circle)
		15, // task base radius (for base placement)
		[
			"baseSimpleHeliDown",
			"OrcaDown1_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Transportable Fuel Storage", // task title
		"The enemy are storing transportable fuel bladders, they look abandoned... but be careful. go find and deal with them soldiers!", // task description
		["destroy"], // task roles
		"OILBARREL", // task icon
		175, // task area radius (red outer circle)
		17.5, // task base radius (for base placement)
		[
			"baseSimpleFuelDestroyTwo",
			"simpleFuelStorageShed"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Repairable Kajman", // task title
		"Repairable Kajman!.. We've spotted a Kajman helicopter which the enemy are repairing, go destroy it before the enemy take it to the skies!", // task description
		["destroy"], // task roles
		"HELICOPTERMILITARY", // task icon
		125, // task area radius (red outer circle)
		12.5, // task base radius (for base placement)
		[
			"baseSimpleFencedOffKajman"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		2 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"CSAT Intelligence", // task title
		"We've intercepted CSAT trying to gather intelligence on NATO, go in and secure it so won't reveal NATO secrets!", // task description
		["secure"], // task roles
		"IMPORTANTNOTE", // task icon
		100, // task area radius (red outer circle)
		10, // task base radius (for base placement)
		[
			"ST_Secure_DataIntel_RH",
			"ST_IntelLaptop_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Poisoned Water Source", // task title
		"From NATO surveillance, CSAT were spotted poisoning a water source, go fix the issue soldiers!", // task description
		["secure"], // task roles
		"OILBARREL", // task icon
		150, // task area radius (red outer circle)
		15, // task base radius (for base placement)
		[
			"ST_Secure_WaterTower_RH",
			"ST_WellPoison_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Stolen IDAP Helicopter", // task title
		"From the intel we gathered, it looks as though CSAT have stolen an IDAP helicopter and the supplies it contained to use for themselves, go find it soldiers!", // task description
		["repair"], // task roles
		"MEDICCROSS", // task icon
		125, // task area radius (red outer circle)
		12.5, // task base radius (for base placement)
		[
			"ST_RepairIDAPheli_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Stolen NATO Ghost Hawk Helicopter", // task title
		"CSAT have captured a downed NATO helicopter, go find it soldiers!", // task description
		["repair"], // task roles
		"HELICOPTERMILITARY", // task icon
		125, // task area radius (red outer circle)
		12.5, // task base radius (for base placement)
		[
			"ST_Repair_GhostHawk_RH"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Stolen NATO Medical Truck", // task title
		"CSAT have captured a damaged NATO medical truck, go take it back soldiers!", // task description
		["repair"], // task roles
		"INTERSTATETRUCK", // task icon
		75, // task area radius (red outer circle)
		7.5, // task base radius (for base placement)
		[
			"ST_Repair_HEMTTMedical_RH"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Stolen IDAP Ambulance", // task title
		"From the intel we gathered, it looks as though CSAT have stolen an IDAP ambulance to use for themselves, go find it soldiers!", // task description
		["repair"], // task roles
		"MEDICCROSS", // task icon
		75, // task area radius (red outer circle)
		7.5, // task base radius (for base placement)
		[
			"ST_Repair_IDAPAmbulance_RH"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	],
	///////////////////////////////////////////////////////////////////////////////////////////////
	[
		"Power Sub Station Takeover", // task title
		"CSAT have taken control of the power sub station, go do what you have to secure it soldiers!", // task description
		["destroy"], // task roles
		"CITY", // task icon
		75, // task area radius (red outer circle)
		7.5, // task base radius (for base placement)
		[
			"ST_PowerGrid_CM"
		], // base compositions available
		"land", // location surface "land", "water", "bridge"
		1, // number of unit groups
		3 // number of units per group
	]
	///////////////////////////////////////////////////////////////////////////////////////////////
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
