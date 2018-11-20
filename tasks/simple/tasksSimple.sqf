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
	
	Name: tasksSimple.sqf
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
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
params ["_taskTerrain","_taskLocation"];
///////////////////////////////////////////////////////////////////////////////////////////////////
if (isNil "_taskLocation") exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "tasksSimpleConfig.sqf"; // configuration for tasks.
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskChosen = [];
for [{_i = 0},{_i < (count _taskArr)},{_i = _i + 1}] do
{
	_taskChosen = selectRandom _taskArr;
	if !((_taskChosen select 0) in RELO_var_locationTasksActive) exitWith {};
};
if ((_taskChosen select 0) in RELO_var_locationTasksActive) exitWith
{
	#ifdef __DEBUG__
		"  ! couldn't find suitable simple task, exited!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log "  ! couldn't find suitable simple task, exited!";
	#endif
	if (isNil "noSuitableTasksSimple") then
	{
		noSuitableTasksSimple = 1;
	}
	else
	{
		noSuitableTasksSimple = noSuitableTasksSimple + 1;
		if (noSuitableTasksSimple > count _taskArr) exitWith
		{
			RELO_var_locationTaskAmount = RELO_var_locationTaskAmount - 1;
			noSuitableTasksSimple = nil;
			#ifdef __DEBUG__
				"  ! exhausted suitable simple tasks, adjusted total task amount!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log "  ! exhausted suitable simple tasks, adjusted total task amount!";
			#endif
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskTitle = _taskChosen select 0;
_taskDescription = _taskChosen select 1;
_taskRole = _taskChosen select 2;
_taskIcon = _taskChosen select 3;
_taskAreaRadius = _taskChosen select 4;
_taskAreaBase = _taskChosen select 5;
_taskBase = _taskChosen select 6;
_taskSurface = _taskChosen select 7;
_taskGroups = _taskChosen select 8;
_taskUnits = _taskChosen select 9;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   + simple task chosen is -> %1",_taskTitle] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + simple task chosen is -> %1",_taskTitle];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskSide = WEST;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskLocationRelative = [_taskLocation, round(random(_taskAreaRadius - _taskAreaBase)), round(random 360)] call BIS_fnc_relPos;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskMkr = createMarker [format ["RELO_task_areaPos_%1_%2",_taskTitle,_taskLocationRelative],_taskLocationRelative];
_taskMkr setMarkerShape "ELLIPSE";
_taskMkr setMarkerBrush "Border";
_taskMkr setMarkerSize [_taskAreaRadius,_taskAreaRadius];
_taskMkr setMarkerColor "colorRed";
_taskMkr setMarkerAlpha 1;
RELO_var_locationMkrsTask pushBack _taskMkr;
_taskMkrExact = createMarker [format ["RELO_task_exactPos_%1_%2",_taskTitle,_taskLocation],_taskLocation];
_taskMkrExact setMarkerShape "ELLIPSE";
_taskMkrExact setMarkerBrush "SolidBorder";
_taskMkrExact setMarkerSize [(_taskAreaBase * 2),(_taskAreaBase * 2)];
_taskMkrExact setMarkerColor "colorGreen";
_taskMkrExact setMarkerAlpha 0;
RELO_var_locationMkrsTask pushBack _taskMkrExact;
_taskMkrExempt = createMarker [format ["exempt_%1_%2",_taskTitle,_taskLocation],_taskLocation];
_taskMkrExempt setMarkerShape "ELLIPSE";
_taskMkrExempt setMarkerBrush "Solid";
_taskMkrExempt setMarkerSize [(_taskAreaRadius * 2),(_taskAreaRadius * 2)];
_taskMkrExempt setMarkerColor "colorOrange";
_taskMkrExempt setMarkerAlpha 0;
RELO_var_locationMkrsExempt pushBack _taskMkrExempt;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	_taskMkrExempt setMarkerAlpha 0.5;
	{
		if ((getMarkerPos _x inArea _taskMkrExempt) && ([ "MarkerTemp", _x ] call BIS_fnc_inString)) then
		{
			deleteMarker _x;
		};
	} forEach allMapMarkers;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_task = [_taskSide,[_taskTitle],[_taskDescription,_taskTitle,_taskTitle],_taskLocationRelative,0,1,false,_taskIcon] call BIS_fnc_taskCreate;
_notificationRemoteExec = [_taskIcon,['AO SIMPLE TASK',_taskTitle]] remoteExec ['RELO_fnc_notificationGlobal',0,FALSE];
RELO_var_locationTasksActive pushBack _task;
///////////////////////////////////////////////////////////////////////////////////////////////////
_clearSurround = nearestTerrainObjects [_taskLocation,["TREE","SMALL TREE","BUSH","HOUSE","WALL"],(_taskAreaBase + 10)];
_hiddenObjects = [];
{
	_hiddenObjects pushBack _x;
	_x allowDamage false;
	_x hideObjectGlobal true;
} forEach _clearSurround;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskDirection = round(random 360);
///////////////////////////////////////////////////////////////////////////////////////////////////
_baseChosen = selectRandom _taskBase;
_baseComposition = call compile preProcessFileLineNumbers format ["bases\simple\%1.sqf",_baseChosen];
_baseObjects = [_baseComposition,_taskLocation,_taskDirection,_taskSurface] call RELO_fnc_objectsMapper;
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_isObjectVehicle = _x isKindOf "AllVehicles";
	_isObjectStatic = _x isKindOf "StaticWeapon";
	if ((_isObjectVehicle isEqualTo true) && (_isObjectStatic isEqualTo false)) then
	{
		_baseObjects = _baseObjects - [_x];
		[_x,300,120] spawn RELO_fnc_taskVehicleHandler; // after AO is over with, wait 300 seconds if alive and unoccupied or 120 seconds if dead before deleting.
	};
} forEach _baseObjects;
///////////////////////////////////////////////////////////////////////////////////////////////////
[_task,_taskLocation,_taskAreaBase,_baseObjects,_hiddenObjects,RELO_var_locationMkrCurr] spawn RELO_fnc_taskCleanupHandler;
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_buildingsArr = [];
_buildingsArr = nearestObjects [_taskLocation,["House_F","Ruins_F"],_taskAreaBase];
_locationBldPosArr = [];
if !(_buildingsArr isEqualTo []) then
{
	{
		_buildingPositions = _x buildingPos -1;
		{
			if ((_forEachIndex + 1) % 2 == 0) then
			{
				_isEmpty = !(_x isFlatEmpty  [0, -1, -1, -1, -1, false, objNull] isEqualTo []);
				if (_isEmpty) then
				{
					_locationBldPosArr pushBackUnique _x;
				};
			};
		} forEach _buildingPositions;
	} forEach _buildingsArr;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 1;
///////////////////////////////////////////////////////////////////////////////////////////////
_i = 0;
while {sleep 0.1; _i < _taskGroups} do
{
	_grpDeploy = createGroup EAST;
	_groupID = groupID _grpDeploy;
	_grpDeploy setGroupIdGlobal [format ["%1 Patrol - %2",_taskTitle,_groupID]];
	RELO_var_locationGroups pushBack _grpDeploy;
	_j = 0;
	while {sleep 0.1; _j < _taskUnits} do
	{
		_soldierClass = selectRandom _soldierClasses;
		if (typeName _soldierClass == "ARRAY") then
		{
			_soldierClass = selectRandom _soldierClass;
		};
		_unit = _grpDeploy createUnit [_soldierClass, _taskLocation, [], 0, "NONE"];
		waitUntil {!isNull _unit};
		_unit allowDamage false;
		_unit setDamage 0;
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
		if !(_locationBldPosArr isEqualTo []) then
		{
			_locationBldPos = selectRandom _locationBldPosArr;
			_locationBldPosArr = _locationBldPosArr - [_locationBldPos];
			_unit setPosATL _locationBldPos;
			doStop _unit;
		}
		else
		{
			_newPos = [_taskLocation, 1, _taskAreaBase, 0.5, 1, 20, 0] call BIS_fnc_findSafePos;
			_unit setPos _newPos;
		};
		_unit allowDamage true;
		_j = _j + 1;
	};
	_leader = leader _grpDeploy;
	_unitPatrolArea = selectRandom [_taskMkr,_taskMkrExact];
	_unitPatrol = [_leader,_unitPatrolArea,"NOFOLLOW","NOSLOW"] spawn RELO_fnc_urbanPatrol;
	[_taskTitle,_taskLocation,_taskAreaRadius,_grpDeploy,50] call RELO_fnc_aiStaticWeaponOccupy;
	_i = _i + 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////
[_task,_taskMkr,_taskMkrExact,_taskUnits,_taskGroups] spawn
{
	params ["_task","_taskMkr","_taskMkrExact","_taskUnits","_taskGroups"];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_scriptName = format ["tasksSimple: Respawn Handler For Task %1, Units %2, Groups %3",_task,_taskUnits,_taskGroups];
	scriptName _scriptName;
	///////////////////////////////////////////////////////////////////////////////////////////////
	sleep 60;
	///////////////////////////////////////////////////////////////////////////////////////////////
	_locationMkrCurr = RELO_var_locationMkrCurr;
	_locationSize = (markerSize RELO_var_locationMkrCurr select 0);
	_taskSize = (markerSize _taskMkr select 0);
	///////////////////////////////////////////////////////////////////////////////////////////////
	_taskUnitsTotal = (_taskUnits * _taskGroups);
	///////////////////////////////////////////////////////////////////////////////////////////////
	while {sleep 10; _task in RELO_var_locationTasksActive} do
	{
		if !(_locationMkrCurr isEqualTo RELO_var_locationMkrCurr) exitWith {};
		_aiCount = count (allUnits select {(_x getVariable ["unitBelongsToLocation","noLocation"]) isEqualTo RELO_var_locationMkrCurr});
		// if (_aiCount < RELO_var_locationTroopAmount) then
		// {
			_unitCount = count (allUnits select {((_x getVariable "unitBelongsToTask") isEqualTo _task) && (alive _x)});
			_currentCount = _taskUnitsTotal - _unitCount;
			if (_currentCount >= _taskUnits) then
			{
				_chosenRedeployMethod = selectRandomWeighted ["ground",0.8,"para",0.5];
				_chosenTaskMarker = selectRandom [_taskMkr,_taskMkrExact];
				_chosenTaskPos = getMarkerPos _chosenTaskMarker;
				if (surfaceIsWater _chosenTaskPos) then
				{
					_chosenTaskPosDepth = ASLtoATL _chosenTaskPos;
					_chosenTaskPosDepth = (_chosenTaskPosDepth select 2);
					if (_chosenTaskPosDepth >= 5) then
					{
						_chosenRedeployMethod = selectRandom ["para"];
					};
				};
				switch (_chosenRedeployMethod) do
				{
					case "ground": {[_chosenTaskMarker,_locationMkrCurr,_taskSize * 1.5,"random",100 + random(100),_taskUnits,0.5] spawn RELO_fnc_deployGroundTroop;};
					case "para": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,50 + random(50),false,false,false] spawn RELO_fnc_deployParaTroop;};
					case "unload": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnloadTroop;};
					case "rappel": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployRappelTroop;};
					case "vehicle": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployVehicleTroop;};
					case "unarmedvehicle": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnarmedVehicleTroop;};
					case "quadbike": {
						{
							[_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),2,0.5,false,false,false] spawn RELO_fnc_deployQuadbikeTroop;
						} forEach [1,2,3]; // 2 units per quad bike
					};
				};
				sleep 10;
			};
		// };
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////
sleep 5;
_taskRoleChosen = selectRandom _taskRole;
if !(_taskRoleChosen in ["destroy","repair","secure"]) then
{
	_taskRoleChosen = ""; // force default option (potato sack)
};
_taskDefinition = "simple";
///////////////////////////////////////////////////////////////////////////////////////////////
switch (_taskRoleChosen) do
{
	case "destroy": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDestroy;}; // explosive specialist or missile specialist class needed
	case "repair": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleRepair;}; // engineer or repair specialist class needed
	case "secure": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSecure;}; // any class
	case "steal": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSteal;}; // any class
	// case "dismantle": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDismantle;}; // engineer class needed
	// case "seize": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSeize;}; // any class
	// case "deactivate": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDeactivate;}; // explosive specialist class needed
	// case "download": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDownload;}; // squad leader class needed
	// case "jammer": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleJammer;}; // squad leader or engineer class needed
	// case "release": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleRelease;}; // medic or squad leader class needed
	// case "assasinate": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleAssasinate;}; // marksman or sniper class needed
	// case "supplydrop": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSupplyDrop;}; // helicopter pilot class needed
	// case "vehicledrop": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleVehicleDrop;}; // helicopter pilot class needed
	default {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDefault;}; // potato sack
};
///////////////////////////////////////////////////////////////////////////////////////////////
