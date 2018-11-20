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

	Name: fn_patrolHelicopterRespawnHandler.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 3:27 PM 30/07/2017
	Modification Date: 3:27 PM 30/07/2017

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
_taskUnits = 6;
///////////////////////////////////////////////////////////////////////////////////////////////
_task = RELO_var_locationMkrCurrInner splitString "_" select 3;
_locationMkrCurrInner = RELO_var_locationMkrCurrInner; // "RELO_mkr_location_Location Inner Patrol_[0,0,0]";
_locationSize = selectMax (markerSize RELO_var_locationMkrCurrInner);
///////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format [" * initiated ground troop patrol respawn handler for location %1",_task] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format [" * initiated ground troop patrol respawn handler for location %1",_task];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
while {sleep 10; _locationMkrCurrInner isEqualTo RELO_var_locationMkrCurrInner} do
{
	_unitCount = count (allUnits select {(_x getVariable "unitBelongsToTask") isEqualTo _task});
	_currentCount = RELO_var_locationPatrolTroop - _unitCount;
	// #ifdef __DEBUG__
		// format [" ! current %1 troop patrol number is %2, %3 are currently on patrol!",_task,RELO_var_locationPatrolTroop,_unitCount] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format [" ! current %1 troop patrol number is %2, %3 are currently on patrol!",_task,RELO_var_locationPatrolTroop,_unitCount];
	// #endif
	if (_currentCount >= _taskUnits) then
	{
		_chosenRedeployMethod = selectRandomWeighted ["quadbike",0.3,"unarmedvehicle",0.3,"ground",0.8,"para",0.5,"unload",0.4,"vehicle",0.2];
		// _chosenRedeployMethod = selectRandomWeighted ["rappel",0.9];
		_chosenTaskPos = getMarkerPos _locationMkrCurrInner;
		if (surfaceIsWater _chosenTaskPos) then
		{
			_chosenTaskPosDepth = ASLtoATL _chosenTaskPos;
			_chosenTaskPosDepth = (_chosenTaskPosDepth select 2);
			if (_chosenTaskPosDepth >= 5) then
			{
				// _chosenRedeployMethod = selectRandom ["rappel"];
				_chosenRedeployMethod = selectRandom ["para"];
			}
			else
			{
				_chosenRedeployMethod = selectRandom ["para"];
			};
		};
		switch (_chosenRedeployMethod) do
		{
			case "ground": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * ((random(0.5)) + (random(0.5))),"random",100 + random(100),_taskUnits,0.5] spawn RELO_fnc_deployGroundTroop;};

			case "para": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (4 + (random(0.625))),"random",((random 50) + 50),(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,_taskUnits,0.5,((random 50) + 50),false,false,false] spawn RELO_fnc_deployParaTroop;};

			case "unload": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (4 + (random(0.625))),"random",((random 25) + 25),(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnloadTroop;};

			case "rappel": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (4 + (random(0.625))),"random",((random 25) + 25),(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployRappelTroop;};

			case "vehicle": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (1.25 + (random(0.625))),"random",(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployVehicleTroop;};

			case "unarmedvehicle": {[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (1.25 + (random(0.625))),"random",(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnarmedVehicleTroop;};

			case "quadbike": {
				{
					[_locationMkrCurrInner,_locationMkrCurrInner,_locationSize * (1.25 + (random(0.625))),"random",(_locationSize * random(0.5)) + (_locationSize * random(0.5)) + 50,2,0.5,false,false,false] spawn RELO_fnc_deployQuadbikeTroop;
				} forEach [1,2,3]; // 2 units per quad bike... spawn 3 quad bikes, _taskUnits units
			};
		};
	};
};
