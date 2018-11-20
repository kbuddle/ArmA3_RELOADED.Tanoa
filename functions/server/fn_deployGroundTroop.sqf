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
	
	Name: fn_deployGroundTroop.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - reference code by SPUn
	Creation Date: 3:27 PM 30/07/2017
	Modification Date: 3:27 PM 30/07/2017
	
	Description:

	Parameter(s):
		spot = drop spot (name of marker or object or unit, or position array) DEFAULT: --
		distance = number (from how far unit comes from) DEFAULT: 1000
		direction = "random" or 0-360 (direction where unit comes from, use quotes with random!) DEFAULT: "random"
		deploy radius = DEFAULT: 100
		deploy size = number (how many units is in ground drop group) DEFAULT: 6
		deploy delay = number (how many seconds is the delay between jumps) DEFAULT: 0.5

	Example:
		nul = ["marker_0", 1000, "random", 100, 6, 0.1] call RELO_fnc_deployGroundTroop;
	
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
private ["_grpVehicle","_unitType","_soldierClasses","_grpDeploy","_soldierClass","_unit","_targetMkr","_deployChuteHeight","_deployDelay","_deployNum","_unitDistance","_unitDirection","_stopAndGo","_deployPos","_sPos","_unit","_crew","_dir","_finishPos","_deployRadius","_deploySmoke","_deployFlares","_deployChemlight","_cycle","_wp0","_wp1"];
///////////////////////////////////////////////////////////////////////////////////////////////////
_targetMkr = param [0];
_patrolMkr = param [1];
_unitDistance = param [2,1000];
_unitDirection = param [3,"random"];
_deployRadius = param [4,100];
_deployNum = param [5,6];
_deployDelay = param [6,0.5];
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
_deployPosRel = [_deployPos,round(random _deploySize),round(random 360)] call BIS_fnc_relPos; // random deploy position inside marker area.
if (surfaceIsWater _deployPosRel) then
{
	// #ifdef __DEBUG__
		// format ["   ! ground troop respawn at task %1 is water position, readjusting to land position...",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   ! ground troop respawn at task %1 is water position, readjusting to land position...",_task];
	// #endif
	while {sleep 0.5; surfaceIsWater _deployPosRel} do // make sure _deployPos is on land!
	{
		_deployPosRel = [_deployPos,round(random _deploySize),round(random 360)] call BIS_fnc_relPos; // random deploy position inside marker area.
	};
	// #ifdef __DEBUG__
		// format ["   ! ground troop respawn at task %1 readjusted to land position!",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   ! ground troop respawn at task %1 readjusted to land position!",_task];
	// #endif
};
_deployPos = _deployPosRel;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   + ground troop respawn at task %1 with %2 units",_task,_deployNum] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + ground troop respawn at task %1 with %2 units",_task,_deployNum];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
if (typeName _unitDirection == "STRING") then
{
	_unitDirection = random 360;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpDeploy = createGroup EAST;
///////////////////////////////////////////////////////////////////////////////////////////////////
_groupID = groupID _grpDeploy;
_grpDeploy setGroupIdGlobal [format ["Ground Troop Patrol - %1",_groupID]];
RELO_var_locationGroups pushBack _grpDeploy;
///////////////////////////////////////////////////////////////////////////////////////////////////
_deployPosRandom = [0,0,0];
_i = 0;
while {sleep 0.5; _i < 100} do
{
	_deployPosRandom = [_deployPos, _unitDistance, _unitDirection] call BIS_fnc_relPos;
	if !(surfaceIsWater _deployPosRandom) then
	{
		_nearRockObjects = (nearestTerrainObjects [_deployPosRandom, ["ROCK"], 10]);
		if (_nearRockObjects isEqualTo []) then // no rocks around... so AI can't spawn inside those fckn rocks!
		{
			_anyPlayersAround = {alive _x && isPlayer _x} count (nearestObjects [_deployPosRandom, ["MAN"], _deployRadius]);
			if (_anyPlayersAround isEqualTo 0) then
			{
				// #ifdef __DEBUG__
					// format ["   + ground troop respawn at task %1 took %2 loop(s) to get spawn location",_task,_i] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					// diag_log format ["   + ground troop respawn at task %1 took %2 loop(s) to get spawn location",_task,_i];
				// #endif
				_i = 101;
			};
		};
	};
	_i = _i + 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if (_deployPosRandom isEqualTo [0,0,0]) exitWith
{
	diag_log "[DEPLOY GROUND TROOP] -> unable to find land start position for deploying unit spawn, exited!";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// #ifdef __DEBUG__
	// format ["   + ground troop respawn at task %1 got spawn location at %2",_task,_deployPosRandom] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log format ["   + ground troop respawn at task %1 got spawn location at %2",_task,_deployPosRandom];
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_i = 0;
while {sleep 0.5; _i < _deployNum} do
{
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_unitPosStart = [0,0,0];
	_j = 0;
	while {sleep 0.5; _j < 100} do
	{
		_nearTerrainObjects = (nearestTerrainObjects [_deployPosRandom, ["BUSH"], _deployRadius]);
		if (_nearTerrainObjects isEqualTo []) then
		{
			_deployRadius = _deployRadius + _deployRadius;
		}
		else
		{
			_unitPosRandom = getPosATL (selectRandom _nearTerrainObjects);
			_anyPlayersAround = {alive _x && isPlayer _x} count (nearestObjects [_unitPosRandom, ["MAN"], _deployRadius]);
			if (_anyPlayersAround isEqualTo 0) then
			{
				// #ifdef __DEBUG__
					// format ["   + ground troop respawn at task %1 found a bush to spawn at position %2",_task,_unitPosRandom] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					// diag_log format ["   + ground troop respawn at task %1 found a bush to spawn at position %2",_task,_unitPosRandom];
				// #endif
				_unitPosStart = _unitPosRandom;
				_j = 101;
			}
			else
			{
				_deployRadius = _deployRadius + 12.5;
			};
		};
		_j = _j + 1;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	if !(_unitPosStart isEqualTo [0,0,0]) then
	{
		_soldierClass = selectRandom _soldierClasses;
		if (typeName _soldierClass == "ARRAY") then
		{
			_soldierClass = selectRandom _soldierClass;
		};
		_unit = _grpDeploy createUnit [_soldierClass, _unitPosStart, [], 0, "NONE"];
		waitUntil {!isNull _unit};
		_unit allowDamage false;
		_unit setDamage 0;
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		{
			_x addCuratorEditableObjects [[_unit],false];
		} forEach allCurators;
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		_unitPosStart set [2,0]; // reset height back to ground level
		_unit setPosATL _unitPosStart;
		///////////////////////////////////////////////////////////////////////////////////////////////
		_unit switchMove "AmovPpneMstpSrasWrflDnon";
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
		sleep 0.5;
		///////////////////////////////////////////////////////////////////////////////////////////////
		_nearRocks = nearestTerrainObjects [_unitPosStart,["ROCK","ROCKS"],50];
		if !(_nearRocks isEqualTo []) then
		{
			_pos = getPosATL _unit;
			_start = +_pos;
			_start set [2, 100];
			while {(lineIntersects [ATLToASL _start, ATLToASL _pos])} do
			{
				_pos set [2, ((_pos select 2) + 0.25)]
			};
			_unit setPosATL _pos;
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		[_unit] spawn
		{
			params ["_unit"];
			_idleTime = (diag_tickTime + 10);
			waitUntil {sleep 0.5; (isTouchingGround _unit) || (diag_tickTime > _idleTime)};
			if (diag_tickTime > _idleTime) then
			{
				_unitPos = (getPosATL _unit);
				_unitPos set [2,0];
				_unit setPosATL _unitPos;
			};
			_unit allowDamage true;
			_unit switchMove "AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon";
		};
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_i = _i + 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpDeploy setCombatMode "YELLOW";
_grpDeploy setBehaviour "AWARE";
_grpDeploy setSpeedMode "NORMAL";
_grpDeploy allowFleeing 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_leader = leader _grpDeploy;
_unitPatrol = [_leader,_patrolMkr,"NOFOLLOW","NOSLOW"] spawn RELO_fnc_urbanPatrol;
///////////////////////////////////////////////////////////////////////////////////////////////////
[_task,_deployPosOriginal,_deploySize,_grpDeploy] spawn
{
	params ["_task","_deployPosOriginal","_deploySize","_grpDeploy"];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_scriptName = format ["RELO_fnc_deployGroundTroop: Task %1, Group %2",_task,_grpDeploy];
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
