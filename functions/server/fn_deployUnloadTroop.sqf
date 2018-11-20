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
	
	Name: fn_deployUnloadTroop.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - reference code by SPUn
	Creation Date: 3:27 PM 30/07/2017
	Modification Date: 3:27 PM 30/07/2017
	
	Description:

	Parameter(s):
		spot = drop spot (name of marker or object or unit, or position array) DEFAULT: --
		distance = number (from how far chopper comes from) DEFAULT: 1500
		direction = "random" or 0-360 (direction where chopper comes from, use quotes with random!) DEFAULT: "random"
		fly height = number (how high chopper flies) DEFAULT: 200
		jump distance =	number (how many meters before target location units starts jumping out of heli) DEFAULT: 150
		group size = number (how many units is in unload drop group) DEFAULT: 8
		jump delay = number (how many seconds is the delay between jumps) DEFAULT: 0.5
		open height = number (in which height units opens their parachutes) DEFAULT: 50
		smokes = true/false (will units throw cover smokes (on 10m height)) DEFAULT: false
		flares = true/false (will units throw flares (on 30m height)) DEFAULT: false	
		chems = true/false (will units throw chemlights (on 30m height)) DEFAULT: false

	Example:
		nul = ["marker_0", 1000, "random", true, 500, 200, 6, 1, 50, true, false, true] call RELO_fnc_heliDeploy;
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
private ["_grpVehicle","_vehicleType","_soldierClasses","_grpDeploy","_soldierClass","_unit","_targetMkr","_flyHeight","_deployDelay","_deployNum","_vehicleDistance","_vehicleDirection","_flyBy","_deployPos","_sPos","_vehicle","_crew","_dir","_finishPos","_deployDistanceFromTarget","_deploySmoke","_deployFlares","_deployChemlight","_cycle","_wp0","_wp1"];
///////////////////////////////////////////////////////////////////////////////////////////////////
_targetMkr = param [0];
_patrolMkr = param [1];
_vehicleDistance = param [2,3000];
_vehicleDirection = param [3,"random"];
_flyHeight = param [4,200];
_deployDistanceFromTarget = param [5,150];
_deployNum = param [6,6];
_deployDelay = param [7,0.5];
_deploySmoke = param [8,false];
_deployFlares = param [9,false];
_deployChemlight = param [10,false];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleClasses =
[
	// "O_Heli_Light_02_dynamicLoadout_F",
	// "O_Heli_Light_02_unarmed_F", // PO-30 Orca (Unarmed) - AIR - VANILLA
	"O_Heli_Transport_04_covered_F" // Mi-290 Taru (Transport) - AIR - HELI
];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleType = selectRandom _vehicleClasses;
if (typeName _vehicleType == "ARRAY") then
{
	_vehicleType = selectRandom _vehicleType;
};
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
if !(_targetMkr in allMapMarkers) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
_task = _targetMkr splitString "_" select 3;
_deployPos = getMarkerPos _targetMkr;
_deployPosOriginal = _deployPos;
_deploySize = selectMax (getMarkerSize _targetMkr);
///////////////////////////////////////////////////////////////////////////////////////////////////
if (typeName _vehicleDirection == "STRING") then
{
	_vehicleDirection = random 360;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// _deployPos = [_deployPos,_deploySize,round(random 360)] call BIS_fnc_relPos; // random deploy position inside marker area.
// while {sleep 0.5; surfaceIsWater _deployPos} do // make sure _deployPos is on land!
// {
	// _deployPos = [_deployPos,_deploySize,round(random 360)] call BIS_fnc_relPos; // random deploy position inside marker area.
// };
///////////////////////////////////////////////////////////////////////////////////////////////////
// _deployPos = _deployPos findEmptyPosition [10,_deploySize,_vehicleType];

// fnc_isFlatEmpty =
// {
	// params ["_pos", "_params"];
	// _pos = _pos findEmptyPosition [0, _params select 0];
	// if (_pos isEqualTo []) exitWith {[]};
	// _params =+ _params;
	// _params set [0, -1];
	// _pos = _pos isFlatEmpty _params;
	// if (_pos isEqualTo []) exitWith {[]};
	// _pos
// };
// [[4274.66,12113,0.00139618], [1, -1, 0.1, 1, -1, false, objNull]] call fnc_isFlatEmpty;

#ifdef __DEBUG__
	format ["   + unload troop respawn at task %1 searching for landing position",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + unload troop respawn at task %1 searching for landing position",_task];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
for [{_i = 0},{_i < _deploySize},{_i = _i + 1}] do
{
	_j = 1;
	while {sleep 0.1; _j < _deploySize} do
	{
		_landingPos = [_deployPos, 1, _deploySize, 12.5, 0, 0.1, 0, [], []] call BIS_fnc_findSafePos;
		if !(_landingPos isEqualTo []) then
		{
			// _landingPosEmpty = !(_landingPos isFlatEmpty [12.5, -1, 0.1, 12.5, 0, false] isEqualTo []);
			_landingPosEmpty = !(_landingPos isFlatEmpty [12.5, -1, 0.1, 12.5, -1, false] isEqualTo []);
			if (_landingPosEmpty) exitWith
			{
				_deployPos = [_landingPos select 0,_landingPos select 1,0];
				_i = (_deploySize + 1);
				_j = (_deploySize + 1);
			};
		};
		_j = _j + 1;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if ((isNil "_deployPos") || (count _deployPos isEqualTo 2) || (_deployPosOriginal isEqualTo _deployPos) || (_deployPos isEqualTo [])) exitWith
{
	#ifdef __DEBUG__
		format ["   + unload troop respawn at task %1 unable to find landing position, exiting!",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["   + unload troop respawn at task %1 unable to find landing position, exiting!",_task];
	#endif
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   + unload troop respawn at task %1 found landing position, deploying %2 units",_task,_deployNum] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + unload troop respawn at task %1 found landing position, deploying %2 units",_task,_deployNum];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_sPos = [(_deployPos select 0) + (sin _vehicleDirection) * _vehicleDistance, (_deployPos select 1) + (cos _vehicleDirection) * _vehicleDistance, _flyHeight];
_vehicle = createVehicle [_vehicleType, _sPos, [], _vehicleDirection, "FLY"];
waitUntil {!isNull _vehicle};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle allowDamage false;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
[_vehicle,300,120] spawn RELO_fnc_taskVehicleHandler; // if it gets shot down, handle the wreckage
[_vehicle,300] spawn RELO_fnc_abandonVehicleHandler; // if it gets abandoned, handle the wreckage
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpVehicle = createGroup EAST;
///////////////////////////////////////////////////////////////////////////////////////////////////
_groupID = groupID _grpVehicle;
_grpVehicle setGroupIdGlobal [format ["Unload Troop Vehicle - %1",_groupID]];
RELO_var_locationGroups pushBack _grpVehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
_crew = [_vehicle,_grpVehicle] call BIS_fnc_spawnCrew;
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpDeploy = createGroup EAST;
///////////////////////////////////////////////////////////////////////////////////////////////////
_groupID = groupID _grpDeploy;
_grpDeploy setGroupIdGlobal [format ["Unload Troop Patrol - %1",_groupID]];
RELO_var_locationGroups pushBack _grpDeploy;
///////////////////////////////////////////////////////////////////////////////////////////////////
_pilotCrew = ((fullCrew [_vehicle,"ALL",true]) select {!isNull (_x select 0)});
{
	_unit = _x select 0;
	_unit addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
	_unit setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
	sleep 0.1;
} forEach _pilotCrew;
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_x addCuratorEditableObjects [[_vehicle],true];
} forEach allCurators;
///////////////////////////////////////////////////////////////////////////////////////////////////
_allCrew = (fullCrew [_vehicle,"ALL",true]);
_cargoCrew = _allCrew - _pilotCrew;
{
	if (_forEachIndex > (_deployNum - 1)) exitWith {}; // exit if current count is more than _deployNum, starts at 0
	_unit = _x select 0;
	_cargoIndex = _x select 2;
	if (isNull _unit) then
	{
		_soldierClass = selectRandom _soldierClasses;
		if (typeName _soldierClass == "ARRAY") then
		{
			_soldierClass = selectRandom _soldierClass;
		};
		_unit = _grpDeploy createUnit [_soldierClass, [(getPos _vehicle) select 0,(getPos _vehicle) select 1, ((getPos _vehicle) select 2) + 2000], [], 0, "NONE"];
		waitUntil {!isNull _unit};
		_unit allowDamage false;
		_unit setDamage 0;
		///////////////////////////////////////////////////////////////////////////////////////////////
		_unit moveInCargo [_vehicle,_cargoIndex]; // put soldier in a cargo seat of the vehicle
		///////////////////////////////////////////////////////////////////////////////////////////////
		{
			_x addCuratorEditableObjects [[_unit],false];
		} forEach allCurators;
		///////////////////////////////////////////////////////////////////////////////////////////////
		_skillSet = selectRandom ["LOW","REGULAR","MEDIUM"]; // full list = ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
		[_unit,_skillSet] call RELO_fnc_aiSetSkill;
		sleep 0.1;
		_unit addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
		sleep 0.1;
		_addDogTags = [_unit] call RELO_fnc_addActionDogTags;
		sleep 0.1;
		_addGoldTooth = [_unit] call RELO_fnc_addActionGoldTooth;
		sleep 0.1;
		_unit setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
		_unit setVariable ["unitBelongsToTask",_task,false];
		///////////////////////////////////////////////////////////////////////////////////////////////
		_unit allowDamage true;
	};
	sleep 0.5;
} forEach _cargoCrew;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle flyInHeight _flyHeight;
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpVehicle setCombatMode "YELLOW";
_grpVehicle setBehaviour "AWARE";
_grpVehicle setSpeedMode "NORMAL";
_grpVehicle allowFleeing 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpDeploy setCombatMode "YELLOW";
_grpDeploy setBehaviour "AWARE";
_grpDeploy setSpeedMode "NORMAL";
_grpDeploy allowFleeing 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_dir = ((_deployPos select 0) - (_sPos select 0)) atan2 ((_deployPos select 1) - (_sPos select 1));
_finishPos = [(_deployPos select 0) + (sin _dir) * _vehicleDistance, (_deployPos select 1) + (cos _dir) * _vehicleDistance, _flyHeight];
///////////////////////////////////////////////////////////////////////////////////////////////////
_wayPointTarget = _grpVehicle addWayPoint [_deployPos,1];
_wayPointTarget setWayPointType "MOVE";
_wayPointTarget setWaypointCompletionRadius _deployDistanceFromTarget;
waitUntil {!(isNil "_wayPointTarget")};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle allowDamage true;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle doMove _deployPos;
_vehicle move _deployPos;
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerTarget = createTrigger ["EmptyDetector", _deployPos];
_triggerTarget setTriggerArea [_deployDistanceFromTarget,_deployDistanceFromTarget,0,false];
_triggerTarget setTriggerType "SWITCH";
_triggerTarget setTriggerActivation [format ["%1",EAST], "PRESENT", false];
_triggerTarget synchronizeTrigger [_wayPointTarget,[_grpVehicle,1]];
_triggerTarget setTriggerStatements ["(thisTrigger getVariable 'triggerVehicle') in thisList","",""];
_triggerTarget setVariable ['triggerVehicle', _vehicle];
_triggerTarget setVariable ['landingPosition', _deployPos];
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerTargetTime = round(diag_tickTime);
waitUntil {sleep 0.5; (triggerActivated _triggerTarget) || (!alive _vehicle) || (!canMove _vehicle) || (round(diag_tickTime - _triggerTargetTime) > 300)};
// while {sleep 5; !(triggerActivated _triggerTarget) || ((_vehicle distance2D _deployPos) > _deployDistanceFromTarget)} do
// {
	// if (round(diag_tickTime - _triggerTargetTime) > 600) exitWith {};
	// if (((count ((units _grpVehicle) select {alive _x})) isEqualTo 0) || (!alive _vehicle) || (!canMove _vehicle)) exitWith {};
	// {
		// _x doMove _deployPos;
		// _x move _deployPos;
		// sleep 0.1;
	// } forEach (units _grpVehicle);
// };
///////////////////////////////////////////////////////////////////////////////////////////////////
_heliPad = createVehicle ["Land_HelipadEmpty_F", _deployPos, [], _vehicleDirection, "NONE"];
waitUntil {!isNull _heliPad};
_heliPad setPosATL _deployPos;
_gameLogicVehicle = _grpVehicle createUnit ["LOGIC", _deployPos, [], 0, "NONE"];
waitUntil {!isNull _gameLogicVehicle};
_gameLogicVehicle setPosATL _deployPos;
_vehicle setVariable ["troopDeployed",false];
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpVehicle setCombatMode "BLUE";
_grpVehicle setBehaviour "CARELESS";
_grpVehicle setSpeedMode "NORMAL";
_grpVehicle allowFleeing 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_wayPointLand = _grpVehicle addWayPoint [_heliPad,2];
// _wayPointLand setWayPointType "UNLOAD";
// _wayPointLand setWayPointType "MOVE";
_wayPointLand setWayPointType "TR UNLOAD";
_wayPointLand setWaypointCompletionRadius _deployDistanceFromTarget;
waitUntil {!(isNil "_wayPointLand")};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle doMove getPosATL _heliPad;
_vehicle move getPosATL _heliPad;
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerLand = createTrigger ["EmptyDetector", _heliPad];
_triggerLand setTriggerArea [_deployDistanceFromTarget,_deployDistanceFromTarget,0,false];
_triggerLand setTriggerType "SWITCH";
_triggerLand setTriggerActivation [format ["%1",EAST], "PRESENT", false];
_triggerLand synchronizeTrigger [_wayPointLand,[_grpVehicle,2]];
_triggerLand setTriggerStatements ["(thisTrigger getVariable 'triggerVehicle') in thisList","(thisTrigger getVariable 'triggerVehicle') land 'LAND'",""];
_triggerLand setVariable ['triggerVehicle', _vehicle];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle animateDoor ["door_4_source",1,false]; // taru left cargo door - open
_vehicle animateDoor ["door_5_source",1,false]; // taru right cargo door - open
_vehicle animateDoor ["door_6_source",1,false]; // taru rear cargo door - open
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerLandTime = round(diag_tickTime);
// waitUntil {sleep 0.5; ((triggerActivated _triggerLand) && (isTouchingGround _vehicle)) || (!alive _vehicle) || (!canMove _vehicle) || (round(diag_tickTime - _triggerLandTime) > 120)};
while {sleep 5; (alive _vehicle) || (canMove _vehicle) || (round(diag_tickTime - _triggerLandTime) < 120)} do
{
	if ((triggerActivated _triggerLand) && (isTouchingGround _vehicle)) exitWith {};
	_vehicle doMove getPosATL _heliPad;
	_vehicle move getPosATL _heliPad;
	if ((_vehicle distance2D _heliPad) < 2) then // force helicopter to fucking land! pos glitchy code.
	{
		_vehicle setVelocity [0,0,-1];
	};
	_vehicle land "LAND";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_vehicle disableAI _x;
} forEach ["TARGET","AUTOTARGET","ANIM","AUTOCOMBAT","PATH"];
// } forEach ["TARGET","AUTOTARGET","MOVE","ANIM","AUTOCOMBAT","PATH"];
// _vehicle disableAI "ALL"; // keep the helicopter on the ground!
_vehicle setVelocity [0,0,-1];
///////////////////////////////////////////////////////////////////////////////////////////////////
if ((alive _vehicle) && (_vehicle inArea RELO_var_locationMkrCurr)) then
{
	_allCrew = (fullCrew [_vehicle,"ALL",true]);
	_cargoCrew = _allCrew - _pilotCrew;
	{
		_unit = _x select 0;
		_cargoIndex = _x select 2;
		_vehicle setVelocity [0,0,-1];
		if (!(isNull _unit) && (alive _unit)) then
		{
			unassignVehicle _unit;
			moveOut _unit;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			_unit doMove getPos _unit;
			_unit move getPos _unit;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			_isMedic = _unit getUnitTrait "MEDIC";
			if (_isMedic) then
			{
				_medicInit = [_unit,"EAST"] spawn RELO_fnc_medicPatrol;
			};
			_isEngineer = _unit getUnitTrait "ENGINEER";
			if (_isEngineer) then
			{
				_engineerInit = [_unit,"EAST"] spawn RELO_fnc_engineerPatrol;
			};
			///////////////////////////////////////////////////////////////////////////////////////////////////
			[_unit,_deploySmoke,_deployFlares,_deployChemlight,_targetMkr] spawn
			{
				params ["_unit","_deploySmoke","_deployFlares","_deployChemlight","_targetMkr"];
				if !(alive _unit) exitWith {};
				if (_deploySmoke) then
				{
					[_unit] spawn
					{
						params ["_unit"];
						_smokeGrenade = "SmokeShellRed" createVehicle (getPos _unit); // smoke grenade red
					};
				};
				if (_deployFlares) then
				{
					[_unit] spawn
					{
						params ["_unit"];
						_flare = "F_40mm_Red" createVehicle [(getPos _unit) select 0,(getPos _unit) select 1,0]; // flare red
					};
				};
				if (_deployChemlight) then
				{
					[_unit] spawn
					{
						params ["_unit"];
						_chemlight = "Chemlight_red" createVehicle (getPos _unit); // chemlight red
					};
				};
			};
			sleep _deployDelay;
		};
	} forEach _cargoCrew;
}
else
{
	{
		_x setDamage 1;
	} forEach (units _grpVehicle);
	{
		_x setDamage 1;
	} forEach (units _grpDeploy);
	_vehicle setDamage 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_leader = leader _grpDeploy;
_unitPatrol = [_leader,_patrolMkr,"NOFOLLOW","NOSLOW"] spawn RELO_fnc_urbanPatrol;
///////////////////////////////////////////////////////////////////////////////////////////////////
[_task,_deployPosOriginal,_deploySize,_grpDeploy] spawn
{
	params ["_task","_deployPosOriginal","_deploySize","_grpDeploy"];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_scriptName = format ["RELO_fnc_deployUnloadTroop: Task %1, Group %2",_task,_grpDeploy];
	scriptName _scriptName;
	///////////////////////////////////////////////////////////////////////////////////////////////
	_leader = leader _grpDeploy;
	///////////////////////////////////////////////////////////////////////////////////////////////
	_wayPointTarget = _grpDeploy addWayPoint [_deployPosOriginal,0];
	_wayPointTarget setWayPointType "SAD";
	_wayPointTarget setWaypointCompletionRadius _deploySize;
	waitUntil {!(isNil "_wayPointTarget")};
	_triggerTarget = createTrigger ["EmptyDetector", _deployPosOriginal];
	_triggerTarget setTriggerArea [_deploySize,_deploySize,0,false];
	_triggerTarget setTriggerType "SWITCH";
	_triggerTarget setTriggerActivation [format ["%1",EAST], "PRESENT", false];
	_triggerTarget synchronizeTrigger [_wayPointTarget,[_grpDeploy,0]];
	_triggerTarget setTriggerStatements ["({(group _x) isEqualTo (thisTrigger getVariable 'triggerGroup')} count thisList) > 0","",""];
	_triggerTarget setVariable ['triggerGroup', _grpDeploy];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_triggerTargetTime = round(diag_tickTime);
	while {sleep 5; ((count ((units _grpDeploy) select {alive _x})) > 0) || (round(diag_tickTime - _triggerTargetTime) < 600)} do
	{
		if ((triggerActivated _triggerTarget) || ((_leader distance2D _deployPosOriginal) < _deploySize)) exitWith
		{
			// #ifdef __DEBUG__
				// format ["   ! unload troop patrol at task %1 seek and destroy activated!",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				// diag_log format ["   ! unload troop patrol at task %1 seek and destroy activated!",_task];
			// #endif
		};
		{
			_x doMove _deployPosOriginal;
			_x move _deployPosOriginal;
			sleep 0.1;
		} forEach (units _grpDeploy);
	};
	deleteVehicle _triggerTarget; // delete trigger (emptyDetector)
	///////////////////////////////////////////////////////////////////////////////////////////////
	_waypointSeekAndDestroyTime = round(diag_tickTime);
	waitUntil {sleep 5; ((count ((units _grpDeploy) select {alive _x})) isEqualTo 0) || (round(diag_tickTime - _waypointSeekAndDestroyTime) > 600)};
	deleteWaypoint [_grpDeploy, 0]; // delete waypoint
	///////////////////////////////////////////////////////////////////////////////////////////////
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle setVariable ["troopDeployed",true];
deleteVehicle _gameLogicVehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_vehicle enableAI _x;
} forEach ["TARGET","AUTOTARGET","ANIM","AUTOCOMBAT","PATH"];
// } forEach ["TARGET","AUTOTARGET","MOVE","ANIM","AUTOCOMBAT","PATH"];
// _vehicle enableAI "ALL";
///////////////////////////////////////////////////////////////////////////////////////////////////
_wayPointFinish = _grpVehicle addWayPoint [_finishPos,3];
_wayPointFinish setWayPointType "MOVE";
_wayPointFinish setWaypointCompletionRadius _deployDistanceFromTarget;
waitUntil {!(isNil "_wayPointFinish")};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle doMove _finishPos;
_vehicle move _finishPos;
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerFinish = createTrigger ["EmptyDetector", _finishPos];
_triggerFinish setTriggerArea [_deployDistanceFromTarget,_deployDistanceFromTarget,0,false];
_triggerFinish setTriggerType "SWITCH";
_triggerFinish setTriggerActivation [format ["%1",EAST], "PRESENT", false];
_triggerFinish synchronizeTrigger [_wayPointFinish,[_grpVehicle,3]];
_triggerFinish setTriggerStatements ["(thisTrigger getVariable 'triggerVehicle') in thisList","",""];
_triggerFinish setVariable ['triggerVehicle', _vehicle];
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpVehicle setCombatMode "YELLOW";
_grpVehicle setBehaviour "AWARE";
_grpVehicle setSpeedMode "NORMAL";
_grpVehicle allowFleeing 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerTargetTime = round(diag_tickTime);
waitUntil {sleep 0.5; !(isTouchingGround _vehicle) || (!alive _vehicle) || (!canMove _vehicle) || (round(diag_tickTime - _triggerTargetTime) > 120)};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle flyInHeight _flyHeight;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle animateDoor ["door_4_source",0,false]; // taru left cargo door - close
_vehicle animateDoor ["door_5_source",0,false]; // taru right cargo door - close
_vehicle animateDoor ["door_6_source",0,false]; // taru rear cargo door - close
///////////////////////////////////////////////////////////////////////////////////////////////////
_triggerFinishTime = round(diag_tickTime);
waitUntil {sleep 0.5; (triggerActivated _triggerFinish) || ((_vehicle distance2D _finishPos) < _deployDistanceFromTarget) || (!alive _vehicle) || (!canMove _vehicle) || (round(diag_tickTime - _triggerFinishTime) > 600) || (vectorMagnitude velocity _vehicle < 0.05)};
///////////////////////////////////////////////////////////////////////////////////////////////////
if ((triggerActivated _triggerFinish) || ((_vehicle distance2D _finishPos) < _deployDistanceFromTarget) || (round(diag_tickTime - _triggerFinishTime) > 300)) then
{
	_anyPlayersAround = {alive _x && isPlayer _x} count (nearestObjects [(getPos _vehicle), ["MAN"], 400]);
	if (_anyPlayersAround isEqualTo 0) then
	{
		{
			moveOut _x;
			deleteVehicle _x;
		} forEach crew _vehicle;
		deleteVehicle _vehicle;
	}
	else
	{
		_vehicle setDamage 1;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
deleteWaypoint [_grpVehicle, 1]; // delete waypoint
deleteVehicle _triggerTarget; // delete trigger (emptyDetector)
deleteWaypoint [_grpVehicle, 2]; // delete waypoint
deleteVehicle _triggerLand; // delete trigger (emptyDetector)
deleteWaypoint [_grpVehicle, 3]; // delete waypoint
deleteVehicle _triggerFinish; // delete trigger (emptyDetector)
///////////////////////////////////////////////////////////////////////////////////////////////////
deleteVehicle _heliPad; // delete the temporary helipad
