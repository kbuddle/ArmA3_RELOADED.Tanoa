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

	Name: locationSetup.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description: - test/debug script.

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/
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
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
if (RELO_var_locationSetupInProgress isEqualTo true) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////

// debug shit for when laptop at NATO base still exists.
params ["_nearestPlayer"];
_nearestPlayerName = name _nearestPlayer;
format [" ### NEW AO INITIALIZATION STARTED BY %1 ###",toUpper _nearestPlayerName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
diag_log format [" ### NEW AO INITIALIZATION STARTED BY %1 ###",toUpper _nearestPlayerName];

///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	" ! AREA OF OPERATIONS SETUP STARTED !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " ! AREA OF OPERATIONS SETUP STARTED !";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationSetupInProgress = true;
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrCurr isEqualTo "") then
{
	[] call RELO_fnc_aoCleanupHandler; // clean last AO on AO success/fail variable
	sleep selectRandom [30,40,50,60,70,80,90,100,110,120];
};
[] call RELO_fnc_findMainPosition; // find new AO position
[] call RELO_fnc_findBuildingPositions; // find buildings and building positions - disabled 3:26 PM 18/11/2017 due to not needing it yet.
///////////////////////////////////////////////////////////////////////////////////////////////////
KRON_UPS_Exited = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_nearestLocation = text (nearestLocations [RELO_var_locationMkrPos, ["NameVillage", "NameCity", "NameCityCapital"],(RELO_var_locationMkrSize * 10)] select 0);
_notificationRemoteExec = ["ADDRESS", ["AREA OF OPERATIONS FOUND, SCANNING TERRAIN...",_nearestLocation]] remoteExec ['RELO_fnc_notificationGlobal',0,FALSE];
///////////////////////////////////////////////////////////////////////////////////////////////////
allPositionsArr = [];
_mainArr = [];
///////////////////////////////////////////////////////////////////////////////////////////////////
_noLand = (([false] call RELO_fnc_findLandPosition) isEqualTo [0,0,0]);
if !(_noLand) then
{
	allPositionsArr pushBackUnique "land";
	_mainArr pushBackUnique "land";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noForest = (([false] call RELO_fnc_findForestPosition) isEqualTo [0,0,0]);
if !(_noForest) then
{
	allPositionsArr pushBackUnique "forest";
	_mainArr pushBackUnique "forest";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noShore = (([false] call RELO_fnc_findShorePosition) isEqualTo [0,0,0]);
if !(_noShore) then
{
	allPositionsArr pushBackUnique "shore";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noShallowWater = (([false] call RELO_fnc_findShallowWaterPosition) isEqualTo [0,0,0]);
// if !(_noShallowWater) then
// {
	// [] call RELO_fnc_spawnWaterVehicles;
// };
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noWater = (([false] call RELO_fnc_findWaterPosition) isEqualTo [0,0,0]);
if !(_noWater) then
{
	allPositionsArr pushBackUnique "water";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// _noDeepWater = (([false] call RELO_fnc_findDeepWaterPosition) isEqualTo [0,0,0]);
// if !(_noDeepWater) then
// {
	// allPositionsArr pushBackUnique "deepwater";
// };
// #ifdef __DEBUG__
	// sleep 2;
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noRoad = (([false] call RELO_fnc_findRoadPosition) isEqualTo [0,0,0]);
if !(_noRoad) then
{
	allPositionsArr pushBackUnique "road";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noBridge = (([false] call RELO_fnc_findBridgePosition) isEqualTo [0,0,0]);
if !(_noBridge) then
{
	allPositionsArr pushBackUnique "bridge";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noPath = (([false] call RELO_fnc_findPathPosition) isEqualTo [0,0,0]);
if !(_noPath) then
{
	allPositionsArr pushBackUnique "path";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noRunway = (([false] call RELO_fnc_findRunwayPosition) isEqualTo [0,0,0]);
if !(_noRunway) then
{
	allPositionsArr pushBackUnique "runway";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noRailway = (([false] call RELO_fnc_findRailwayPosition) isEqualTo [0,0,0]);
if !(_noRailway) then
{
	allPositionsArr pushBackUnique "railway";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noShipwreck = (([false] call RELO_fnc_findShipwreckPosition) isEqualTo [0,0,0]);
if !(_noShipwreck) then
{
	allPositionsArr pushBackUnique "shipwreck";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// _noFuelStation = (([false] call RELO_fnc_findFuelStationPosition) isEqualTo [0,0,0]);
// if !(_noFuelStation) then
// {
	// allPositionsArr pushBackUnique "fuelstation";
// };
// #ifdef __DEBUG__
	// sleep 2;
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_noTransmitter = (([false] call RELO_fnc_findTransmitterPosition) isEqualTo [0,0,0]);
if !(_noTransmitter) then
{
	allPositionsArr pushBackUnique "transmitter";
};
#ifdef __DEBUG__
	sleep 2;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// _noWaterTower = (([false] call RELO_fnc_findWaterTowerPosition) isEqualTo [0,0,0]);
// if !(_noWaterTower) then
// {
	// allPositionsArr pushBackUnique "watertower";
// };
// #ifdef __DEBUG__
	// sleep 2;
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// #ifdef __DEBUG__
	// " ! AREA OF OPERATIONS INITIALIZATION COMPLETE, CALCULATING TASK/OBJECT PLACEMENTS !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log " ! AREA OF OPERATIONS INITIALIZATION COMPLETE, CALCULATING TASK/OBJECT PLACEMENTS !";
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	sleep 5;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// RELO_var_locationLandArr RELO_var_locationForestArr RELO_var_locationShallowWaterArr RELO_var_locationWaterArr RELO_var_locationDeepWaterArr
// RELO_var_locationShoreArr RELO_var_locationRoadArr RELO_var_locationBridgeArr RELO_var_locationPathArr RELO_var_locationRunwayArr RELO_var_locationRailWayArr
// RELO_var_locationShipwreckArr RELO_var_locationFuelstationArr RELO_var_locationTransmitterArr RELO_var_locationWaterTowerArr RELO_var_locationBuildingPosArr
///////////////////////////////////////////////////////////////////////////////////////////////////
[] call RELO_fnc_deployBuildingTroop;
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationShallowWaterArr isEqualTo []) then
{
	[] call RELO_fnc_spawnWaterVehicles;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_mainLocation = selectRandom _mainArr;
///////////////////////////////////////////////////////////////////////////////////////////////////
switch (_mainLocation) do
{
	case "land": {
		_terrainPos = [true] call RELO_fnc_findLandPosition;
		["land",_terrainPos] execVM "tasks\main\tasksMain.sqf";
		RELO_var_locationLandArr = RELO_var_locationLandArr - _terrainPos;
	};
	case "forest": {
		_terrainPos = [true] call RELO_fnc_findForestPosition;
		["forest",_terrainPos] execVM "tasks\main\tasksMain.sqf";
		RELO_var_locationForestArr = RELO_var_locationForestArr - _terrainPos;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// sleep 5;
#ifdef __DEBUG__
	" ! AREA OF OPERATIONS SPAWNING TASKS..." remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " ! AREA OF OPERATIONS SPAWNING TASKS...";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskLoop = true;
while {_taskLoop isEqualTo true} do
{
	if ((count RELO_var_locationTasksActive) >= RELO_var_locationTaskAmount) exitWith
	{
		_taskLoop = false;
		#ifdef __DEBUG__
			" ! AREA OF OPERATIONS INITIALIZATION MAX TASKS REACHED !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log " ! AREA OF OPERATIONS INITIALIZATION MAX TASKS REACHED !";
		#endif
	};
	if (allPositionsArr isEqualTo []) exitWith
	{
		_taskLoop = false;
		#ifdef __DEBUG__
			" ! AREA OF OPERATIONS INITIALIZATION MAX TASKS EXHAUSTED !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log " ! AREA OF OPERATIONS INITIALIZATION MAX TASKS EXHAUSTED !";
		#endif
	};
	_chosenPos = selectRandom allPositionsArr;
	switch _chosenPos do
	{
		case "land": {
			_landPos = [true] call RELO_fnc_findLandPosition;
			if !(_landPos isEqualTo [0,0,0]) then
			{
				["land",_landPos] execVM "tasks\sub\tasksLand.sqf";
				RELO_var_locationLandArr = RELO_var_locationLandArr - _landPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["land"];
			};
		};
		case "forest": {
			_forestPos = [true] call RELO_fnc_findForestPosition;
			if !(_forestPos isEqualTo [0,0,0]) then
			{
				["forest",_forestPos] execVM "tasks\sub\tasksForest.sqf";
				RELO_var_locationForestArr = RELO_var_locationForestArr - _forestPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["forest"];
			};
		};
		case "shore": {
			_shorePos = [true] call RELO_fnc_findShorePosition;
			if !(_shorePos isEqualTo [0,0,0]) then
			{
				["shore",_shorePos] execVM "tasks\sub\tasksShore.sqf";
				RELO_var_locationShoreArr = RELO_var_locationShoreArr - _shorePos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["shore"];
			};
		};
		case "shallowwater": {
			_shallowWaterPos = [true] call RELO_fnc_findShallowWaterPosition;
			if !(_shallowWaterPos isEqualTo [0,0,0]) then
			{
				#ifdef __DEBUG__
					"   + placed boat in the shallow water" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				#endif
				RELO_var_locationShallowWaterArr = RELO_var_locationShallowWaterArr - _shallowWaterPos;
				allPositionsArr = allPositionsArr - ["shallowwater"];
			}
			else
			{
				allPositionsArr = allPositionsArr - ["shallowwater"];
			};
		};
		case "water": {
			_waterPos = [true] call RELO_fnc_findWaterPosition;
			if !(_waterPos isEqualTo [0,0,0]) then
			{
				["water",_waterPos] execVM "tasks\sub\tasksWater.sqf";
				RELO_var_locationWaterArr = RELO_var_locationWaterArr - _waterPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["water"];
			};
		};
		case "deepwater": {
			_deepWaterPos = [true] call RELO_fnc_findDeepWaterPosition;
			if !(_deepWaterPos isEqualTo [0,0,0]) then
			{
				["deepwater",_deepWaterPos] execVM "tasks\sub\tasksWater.sqf";
				RELO_var_locationDeepWaterArr = RELO_var_locationDeepWaterArr - _deepWaterPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["deepwater"];
			};
		};
		case "road": {
			_roadPos = [true] call RELO_fnc_findRoadPosition;
			if !(_roadPos isEqualTo [0,0,0]) then
			{
				["road",_roadPos] execVM "tasks\sub\tasksRoad.sqf";
				RELO_var_locationRoadArr = RELO_var_locationRoadArr - _roadPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["road"];
			};
		};
		case "bridge": {
			_bridgePos = [true] call RELO_fnc_findBridgePosition;
			if !(_bridgePos isEqualTo [0,0,0]) then
			{
				["bridge",_bridgePos] execVM "tasks\sub\tasksBridge.sqf";
				RELO_var_locationBridgeArr = RELO_var_locationBridgeArr - _bridgePos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["bridge"];
			};
		};
		case "path": {
			_pathPos = [true] call RELO_fnc_findPathPosition;
			if !(_pathPos isEqualTo [0,0,0]) then
			{
				["path",_pathPos] execVM "tasks\sub\tasksPath.sqf";
				RELO_var_locationPathArr = RELO_var_locationPathArr - _pathPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["path"];
			};
		};
		case "runway": {
			_runwayPos = [true] call RELO_fnc_findRunwayPosition;
			if !(_runwayPos isEqualTo [0,0,0]) then
			{
				["runway",_runwayPos] execVM "tasks\sub\tasksRunway.sqf";
				RELO_var_locationRunwayArr = RELO_var_locationRunwayArr - _runwayPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["runway"];
			};
		};
		case "railway": {
			_railwayPos = [true] call RELO_fnc_findRailwayPosition;
			if !(_railwayPos isEqualTo [0,0,0]) then
			{
				["railway",_railwayPos] execVM "tasks\sub\tasksRailway.sqf";
				RELO_var_locationRailWayArr = RELO_var_locationRailWayArr - _railwayPos;
			}
			else
			{
				allPositionsArr = allPositionsArr - ["railway"];
			};
		};
		case "shipwreck": {
			_shipwreckPos = [true] call RELO_fnc_findShipwreckPosition;
			if !(_shipwreckPos isEqualTo [0,0,0]) then
			{
				#ifdef __DEBUG__
					"   + placed treasure chest at the shipwreck" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				#endif
				RELO_var_locationShipwreckArr = RELO_var_locationShipwreckArr - _shipwreckPos;
				allPositionsArr = allPositionsArr - ["shipwreck"];
			}
			else
			{
				allPositionsArr = allPositionsArr - ["shipwreck"];
			};
		};
		case "fuelstation": {
			_fuelstationPos = [true] call RELO_fnc_findFuelstationPosition;
			if !(_fuelstationPos isEqualTo [0,0,0]) then
			{
				#ifdef __DEBUG__
					"   + placed booby trap at the fuelstation" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				#endif
				RELO_var_locationFuelstationArr = RELO_var_locationFuelstationArr - _fuelstationPos;
				allPositionsArr = allPositionsArr - ["fuelstation"];
			}
			else
			{
				allPositionsArr = allPositionsArr - ["fuelstation"];
			};
		};
		case "transmitter": {
			_transmitterPos = [true] call RELO_fnc_findTransmitterPosition;
			if !(_transmitterPos isEqualTo [0,0,0]) then
			{
				#ifdef __DEBUG__
					"   + placed booby trap at the transmitter" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				#endif
				RELO_var_locationTransmitterArr = RELO_var_locationTransmitterArr - _transmitterPos;
				allPositionsArr = allPositionsArr - ["transmitter"];
			}
			else
			{
				allPositionsArr = allPositionsArr - ["transmitter"];
			};
		};
		case "watertower": {
			_watertowerPos = [true] call RELO_fnc_findWaterTowerPosition;
			if !(_watertowerPos isEqualTo [0,0,0]) then
			{
				#ifdef __DEBUG__
					"   + placed booby trap at the watertower" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				#endif
				RELO_var_locationWaterTowerArr = RELO_var_locationWaterTowerArr - _watertowerPos;
				allPositionsArr = allPositionsArr - ["watertower"];
			}
			else
			{
				allPositionsArr = allPositionsArr - ["watertower"];
			};
		};
	};
	sleep selectRandom [2.5,5,7.5,10];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	sleep 5;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrsExempt isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach RELO_var_locationMkrsExempt;
	RELO_var_locationMkrsExempt = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	" ! AREA OF OPERATIONS SPAWNING SIMPLE TASKS..." remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " ! AREA OF OPERATIONS SPAWNING SIMPLE TASKS...";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
simplePositionsArr = [];

if !(RELO_var_locationLandArr isEqualTo []) then {simplePositionsArr pushBackUnique "land"};
if !(RELO_var_locationForestArr isEqualTo []) then {simplePositionsArr pushBackUnique "forest"};

_simpleTaskLoop = true;
while {_simpleTaskLoop isEqualTo true} do
{
	if ((count RELO_var_locationTasksActive) >= (RELO_var_locationTaskAmount + RELO_var_locationSimpleTaskAmount)) exitWith // current task amount + simple task amount.
	{
		_simpleTaskLoop = false;
		#ifdef __DEBUG__
			" ! AREA OF OPERATIONS INITIALIZATION MAX SIMPLE TASKS REACHED !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log " ! AREA OF OPERATIONS INITIALIZATION MAX SIMPLE TASKS REACHED !";
		#endif
	};
	if (simplePositionsArr isEqualTo []) exitWith
	{
		_simpleTaskLoop = false;
		#ifdef __DEBUG__
			" ! AREA OF OPERATIONS INITIALIZATION MAX SIMPLE TASKS EXHAUSTED !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log " ! AREA OF OPERATIONS INITIALIZATION MAX SIMPLE TASKS EXHAUSTED !";
		#endif
	};
	_chosenPos = selectRandom simplePositionsArr;
	switch _chosenPos do
	{
		case "land": {
			_landPos = [true] call RELO_fnc_findLandPosition;
			// _landPos = selectRandom RELO_var_locationLandArr; // this random choice will ignore other task placements
			// _landPosEmpty = !(_landPos isFlatEmpty  [10, -1, -1, -1, -1, false, objNull] isEqualTo []); // make sure the position is empty, else keep cycling (choose another).
			// if (_landPosEmpty) then
			// {
				if !(_landPos isEqualTo [0,0,0]) then
				{
					["land",_landPos] execVM "tasks\simple\tasksSimple.sqf";
					RELO_var_locationLandArr = RELO_var_locationLandArr - _landPos;
				}
				else
				{
					simplePositionsArr = simplePositionsArr - ["land"];
				};
			// };
		};
		case "forest": {
			_forestPos = [true] call RELO_fnc_findForestPosition;
			// _forestPos = selectRandom RELO_var_locationForestArr; // this random choice will ignore other task placements
			// _forestPosEmpty = !(_forestPos isFlatEmpty  [10, -1, -1, -1, -1, false, objNull] isEqualTo []); // make sure the position is empty, else keep cycling (choose another).
			// if (_forestPosEmpty) then
			// {
				if !(_forestPos isEqualTo [0,0,0]) then
				{
					["forest",_forestPos] execVM "tasks\simple\tasksSimple.sqf";
					RELO_var_locationForestArr = RELO_var_locationForestArr - _forestPos;
				}
				else
				{
					simplePositionsArr = simplePositionsArr - ["forest"];
				};
			// };
		};
	};
	sleep 5;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	sleep 5;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrsExempt isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach RELO_var_locationMkrsExempt;
	RELO_var_locationMkrsExempt = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	sleep 5;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_notificationRemoteExec = ["ADDRESS", ["AREA OF OPERATIONS TERRAIN SCAN COMPLETE",_nearestLocation]] remoteExec ['RELO_fnc_notificationGlobal',0,FALSE];
///////////////////////////////////////////////////////////////////////////////////////////////////
_numOfPatrolHelicopters = selectRandom [1,2];
if !(_numOfPatrolHelicopters isEqualTo 0) then
{
	for [{_i = 0},{_i < _numOfPatrolHelicopters},{_i = _i + 1}] do
	{
		[RELO_var_locationMkrCurrInner,true] spawn RELO_fnc_patrolHelicopter; // spawn a AO helicopter patrol
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_numOfPatrolPlanes = selectRandom [1];
if !(_numOfPatrolPlanes isEqualTo 0) then
{
	for [{_i = 0},{_i < _numOfPatrolPlanes},{_i = _i + 1}] do
	{
		[RELO_var_locationMkrCurrOuter,true] spawn RELO_fnc_patrolPlane; // spawn a AO plane patrol
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationRoadArr isEqualTo []) then
{
	_numOfPatrolVehicles = selectRandom [1,2,3,4];
	if !(_numOfPatrolVehicles isEqualTo 0) then
	{
		for [{_i = 0},{_i < _numOfPatrolVehicles},{_i = _i + 1}] do
		{
			[RELO_var_locationMkrCurrInner,true] spawn RELO_fnc_patrolVehicle; // spawn a AO vehicle patrol
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationRoadArr isEqualTo []) then
{
	_numOfPatrolTanks = selectRandom [1,2];
	if !(_numOfPatrolTanks isEqualTo 0) then
	{
		for [{_i = 0},{_i < _numOfPatrolTanks},{_i = _i + 1}] do
		{
			[RELO_var_locationMkrCurrInner,true] spawn RELO_fnc_patrolTank; // spawn a AO tank patrol
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationWaterArr isEqualTo []) then
{
	_numOfPatrolBoats = selectRandom [1,2];
	if !(_numOfPatrolBoats isEqualTo 0) then
	{
		for [{_i = 0},{_i < _numOfPatrolBoats},{_i = _i + 1}] do
		{
			[RELO_var_locationMkrCurr,true] spawn RELO_fnc_patrolBoat; // spawn a AO plane patrol
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
[] spawn RELO_fnc_locationPatrolTroopRespawnHandler; // spawn location troop patrol
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	sleep 5;
	if !(RELO_var_locationMrksDebug isEqualTo []) then
	{
		{
			deleteMarker _x;
		} forEach RELO_var_locationMrksDebug;
		RELO_var_locationMrksDebug = [];
	};
	if !(RELO_var_locationMkrsExempt isEqualTo []) then
	{
		{
			deleteMarker _x;
		} forEach RELO_var_locationMkrsExempt;
		RELO_var_locationMkrsExempt = [];
	};
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationSetupInProgress = false;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	" ! AREA OF OPERATIONS SETUP COMPLETE !" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " ! AREA OF OPERATIONS SETUP COMPLETE !";
#endif
