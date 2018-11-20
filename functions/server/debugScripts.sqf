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

	Name: debugScripts.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - original code by Iceman 77
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description:

	Parameter(s):

	Example:

	Change Log:
	1.0 - original base script for object delete.

	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG_STATS
	#define __DEBUGSTATS__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
scriptName "RELO_fnc_debugScript";
///////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUGSTATS__
	diag_log "[SERVER SCRIPTS DEBUG] -> enabled 60 second loop check!";
	while {sleep 60; true} do
	{
		_spawnedRunning = diag_activeScripts select 0;
		_execVMRunning = diag_activeScripts select 1;
		_execRunning = diag_activeScripts select 2;
		_execFSMRunning = diag_activeScripts select 3;
		_total = _spawnedRunning + _execVMRunning + _execRunning + _execFSMRunning;

		format ["[DEBUG] processes -> spawned %1 - execVM %2 - exec %3 - execFSM %4 - total %5",_spawnedRunning,_execVMRunning,_execRunning,_execFSMRunning,_total] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["[DEBUG] processes -> spawned %1 - execVM %2 - exec %3 - execFSM %4 - total %5",_spawnedRunning,_execVMRunning,_execRunning,_execFSMRunning,_total];

		_playersAlive = count (allPlayers select {(alive _x) && (_x inArea RELO_var_locationMkrCurrOuter)});
		_unitsAlive = count ((allUnits - allPlayers) select {(alive _x) && ((_x getVariable ["unitBelongsToLocation","noLocation"]) isEqualTo RELO_var_locationMkrCurr)});
		_allCars = count (allMissionObjects "CAR" select {(alive _x) && ((_x getVariable ["taskVehicle", false]) isEqualTo true)});
		_allTanks = count (allMissionObjects "TANK" select {(alive _x) && ((_x getVariable ["taskVehicle", false]) isEqualTo true)});
		_allHelicopters = count (allMissionObjects "HELICOPTER" select {(alive _x) && ((_x getVariable ["taskVehicle", false]) isEqualTo true)});
		_allPlanes = count (allMissionObjects "PLANE" select {(alive _x) && ((_x getVariable ["taskVehicle", false]) isEqualTo true)});

		_aoPatrolUnits = count ((allUnits - allPlayers) select {(alive _x) && (_x getVariable "unitBelongsToTask") isEqualTo "Location Patrol Inner"});
		_cobPatrolUnits = count ((allUnits - allPlayers) select {(alive _x) && (_x getVariable "unitBelongsToTask") isEqualTo "Contingency Operating Base"});

		// format ["! ao objects -> players %1 - units %2 of %3 - cars %4 - tanks %5 - helicopters %6 - planes %7",_playersAlive,_unitsAlive,RELO_var_locationTroopAmount,_allCars,_allTanks,_allHelicopters,_allPlanes] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["! ao objects -> players %1 - units %2 of %3 - cars %4 - tanks %5 - helicopters %6 - planes %7",_playersAlive,_unitsAlive,RELO_var_locationTroopAmount,_allCars,_allTanks,_allHelicopters,_allPlanes];

		format ["[DEBUG] ao objects -> players %1 - units %2 - cars %3 - tanks %4 - helicopters %5 - planes %6",_playersAlive,_unitsAlive,_allCars,_allTanks,_allHelicopters,_allPlanes] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["[DEBUG] ao objects -> players %1 - units %2 - cars %3 - tanks %4 - helicopters %5 - planes %6",_playersAlive,_unitsAlive,_allCars,_allTanks,_allHelicopters,_allPlanes];

		format ["[DEBUG] death count -> players %1 - ai %2",RELO_var_locationFriendlyCasualties,RELO_var_locationEnemyCasualties] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["[DEBUG] death count -> players %1 - ai %2",RELO_var_locationFriendlyCasualties,RELO_var_locationEnemyCasualties];

		format ["[DEBUG] server -> fps %1",diag_fps] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["[DEBUG] server -> fps %1",diag_fps];
	};
#endif
