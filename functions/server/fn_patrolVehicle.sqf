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

	Name: fn_patrolVehicle.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 9:52 PM 27/07/2017
	Modification Date: 9:52 PM 27/07/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////

_vehicleClasses =
[
	"O_G_Offroad_01_armed_F", // Offroad (Armed) - CAR - VANILLA
	// "O_G_Offroad_01_F", // Offroad - CAR - VANILLA
	// "O_G_Quadbike_01_F", // Quad Bike - CAR - VANILLA
	// "O_G_Van_01_transport_F", // Truck - CAR - VANILLA
	"O_LSV_02_armed_F", // Qilin (Armed) - CAR - EXPANSION
	// "O_LSV_02_unarmed_F", // Qilin (Unarmed) - CAR - EXPANSION
	// "O_MRAP_02_F", // Ifrit - CAR - VANILLA
	"O_MRAP_02_gmg_F", // Ifrit GMG - CAR - VANILLA
	"O_MRAP_02_hmg_F", // Ifrit HMG - CAR - VANILLA
	// "O_Quadbike_01_F", // Quad Bike - CAR - VANILLA
	// "O_Truck_02_covered_F", // Zamak Transport (Covered) - CAR - VANILLA
	// "O_Truck_02_transport_F", // Zamak Transport - CAR - VANILLA
	// "O_Truck_03_covered_F", // Tempest Transport (Covered) - CAR - VANILLA
	// "O_Truck_03_device_F", // Tempest (Device) - CAR - VANILLA
	// "O_Truck_03_transport_F", // Tempest Transport - CAR - VANILLA
	"O_T_LSV_02_AT_F", // Qilin (AT) - CAR - TANKS
	"O_T_LSV_02_armed_F", // Qilin (Minigun) - CAR - EXPANSION
	// "O_T_LSV_02_unarmed_F", // Qilin (Unarmed) - CAR - EXPANSION
	// "O_T_MRAP_02_ghex_F", // Ifrit - CAR - EXPANSION
	"O_T_MRAP_02_gmg_ghex_F", // Ifrit GMG - CAR - EXPANSION
	"O_T_MRAP_02_hmg_ghex_F" // Ifrit HMG - CAR - EXPANSION
	// "O_T_Quadbike_01_ghex_F", // Quad Bike - CAR - EXPANSION
	// "O_T_Truck_03_covered_ghex_F", // Tempest Transport (Covered) - CAR - EXPANSION
	// "O_T_Truck_03_device_ghex_F", // Tempest (Device) - CAR - EXPANSION
	// "O_T_Truck_03_transport_ghex_F", // Tempest Transport - CAR - EXPANSION
];

///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleClass = selectRandom _vehicleClasses;
_vehicleName = getText (configfile >> "CfgVehicles" >> _vehicleClass >> "displayName");
///////////////////////////////////////////////////////////////////////////////////////////////////
_locationMkrName = _this select 0; // marker name
_locationMkrInside = _this select 1; // spawn inside the marker zone? true/false
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(typeName _locationMkrName isEqualTo "STRING") exitWith
{
	diag_log "[PATROL VEHICLE] -> invalid marker name, exited!";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_locationPos = markerPos _locationMkrName;
_locationSize = markerSize _locationMkrName select 0; // X and Y are the same dimension
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleDistance = 0;
if (isNil "_locationMkrInside") then
{
	_locationMkrInside = false;
};
if (_locationMkrInside isEqualTo true) then
{
	_vehicleDistance = _locationSize;
}
else
{
	_vehicleDistance = _locationSize * 2;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if (_vehicleDistance isEqualTo 0) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehiclePosStart = 0;
_vehiclePosStartSurface = "";
_i = 0;
while {sleep 0.1; _vehiclePosStartSurface != "road" || _i > 100} do
{
	_vehiclePosRandom = [_locationPos, _vehicleDistance, (round (random 360))] call BIS_fnc_relPos;
	_anyPlayersAround = {alive _x && isPlayer _x} count (nearestObjects [_vehiclePosRandom, ["MAN"], 400]);
	if (_anyPlayersAround isEqualTo 0) then
	{
		_nearRoads = _vehiclePosRandom nearRoads 400;
		if !(_nearRoads isEqualTo []) then
		{
			_nearRoad = selectRandom _nearRoads;
			_nearRoadPos = getPosATL _nearRoad;
			if (isOnRoad _nearRoadPos) then
			{
				_vehiclePosStartSurface = "road";
				_vehiclePosStart = _nearRoadPos;
			};
		};
	};
	_i = _i + 1;
};
if (_vehiclePosStartSurface != "road" || _i > 100) exitWith
{
	diag_log "[PATROL VEHICLE] -> unable to find road start position for patrol vehicle spawn, exited!";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehiclePosEnd = _locationPos;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleDir = [_vehiclePosStart,_vehiclePosEnd] call BIS_fnc_dirTo;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle = createVehicle [_vehicleClass, _vehiclePosStart, [], _vehicleDir, "CAN_COLLIDE"];
waitUntil {!isNull _vehicle};
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_x addCuratorEditableObjects [[_vehicle],true];
} forEach allCurators;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle allowDamage false;
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
_vehicle setVariable ["patrolVehicle",true];
[_vehicle,300,120] spawn RELO_fnc_taskVehicleHandler;
[_vehicle,300] spawn RELO_fnc_abandonVehicleHandler;
createVehicleCrew _vehicle;
{
	_unit = _x;
	///////////////////////////////////////////////////////////////////////////////////////////////
	{
		_x addCuratorEditableObjects [[_unit],false];
	} forEach allCurators;
	///////////////////////////////////////////////////////////////////////////////////////////////
	_skillSet = selectRandom ["LOW","REGULAR","MEDIUM","HIGH"]; // full list = ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
	[_unit,_skillSet] call RELO_fnc_aiSetSkill; // if _skillSet is removed, skillset will be random of ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
	sleep 0.1;
	_unit addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
	sleep 0.1;
	_addDogTags = [_unit] call RELO_fnc_addActionDogTags;
	sleep 0.1;
	_addGoldTooth = [_unit] call RELO_fnc_addActionGoldTooth;
	sleep 0.1;
	_unit setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
	_unit setVariable ["unitBelongsToTask",_locationMkrName,false];
	sleep 0.1;
} forEach crew _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format [" ! spawned patrol vehicle %1 at grid position %2",_vehicleName, mapGridPosition _vehiclePosStart] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format [" ! spawned patrol vehicle %1 at grid position %2",_vehicleName, mapGridPosition _vehiclePosStart];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_side = side _vehicle;
_group = group _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
_groupID = groupID _group;
_group setGroupIdGlobal [format ["Vehicle Patrol - %1",_groupID]];
RELO_var_locationGroups pushBack _group;
///////////////////////////////////////////////////////////////////////////////////////////////////
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
_group setBehaviour "CARELESS";
_group setCombatMode "BLUE";
_group setSpeedMode "FULL";
///////////////////////////////////////////////////////////////////////////////////////////////////
for [{_i = 0},{_i < 10},{_i = _i + 1}] do
{
	_vehicle setPosATL [(_vehiclePosStart select 0),(_vehiclePosStart select 1),(_vehiclePosStart select 2) + 0.5];
	_vehicle engineOn true;
	sleep 0.1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_wayPointPatrol = _group addWayPoint [_vehiclePosEnd,0];
_wayPointPatrol setWayPointType "MOVE";
_wayPointPatrol setWaypointCompletionRadius _locationSize;
waitUntil {!(isNil "_wayPointPatrol")};
_triggerPatrol = createTrigger ["EmptyDetector", _vehiclePosEnd];
_triggerPatrol setTriggerArea [_locationSize,_locationSize,0,false];
_triggerPatrol setTriggerType "SWITCH";
_triggerPatrol setTriggerActivation [format ["%1",_side], "PRESENT", false];
_triggerPatrol synchronizeTrigger [_wayPointPatrol,[_group,0]];
_triggerPatrol setTriggerStatements ["(thisTrigger getVariable 'triggerVehicle') in thisList","",""];
_triggerPatrol setVariable ['triggerVehicle', _vehicle];
_triggerPatrolTime = round(diag_tickTime);
///////////////////////////////////////////////////////////////////////////////////////////////////
[_vehicle,_locationMkrName,false] spawn RELO_fnc_patrolVehicleRespawnHandler; // individual vehicle respawn handler
_vehicle allowDamage true;
///////////////////////////////////////////////////////////////////////////////////////////////////
waitUntil {sleep 1; (triggerActivated _triggerPatrol) || (!alive _vehicle) || (!canMove _vehicle) || (round(diag_tickTime - _triggerPatrolTime) > 600)};
///////////////////////////////////////////////////////////////////////////////////////////////////
deleteWaypoint [_group, 0]; // delete waypoint
deleteVehicle _triggerPatrol; // delete trigger (emptyDetector)
///////////////////////////////////////////////////////////////////////////////////////////////////
if ((alive _vehicle) && ((count ((crew _vehicle) select {isPlayer _x}) > 0))) exitWith {}; // players in vehicle, exit routine
///////////////////////////////////////////////////////////////////////////////////////////////////
if (alive _vehicle) then
{
	_group setCombatMode "YELLOW";
	_group setBehaviour "AWARE";
	_group setSpeedMode "NORMAL";
	_group allowFleeing 0;
	_leader = leader _group;
	_vehiclePatrol = [_leader,_locationMkrName,"NOSLOW","NOFOLLOW","NOWAIT"] spawn RELO_fnc_urbanPatrol;
};
