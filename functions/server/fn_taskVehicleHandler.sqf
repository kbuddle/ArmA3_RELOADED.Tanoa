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
	
	Name: fn_taskVehicleHandler.sqf
	Version: 1.0.2
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 00:00 PM 01/07/2017
	Modification Date: 00:00 PM 01/07/2017
	
	Description: none
	
	Parameter(s): none

	Example: none
	
	Change Log:
	1.0.0 -	original base script.
	
	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param; 
_vehCleanupDelay = [_this, 1, 600, [0]] call BIS_fnc_param; 
_vehDestroyedDelay = [_this, 2, 120, [0]] call BIS_fnc_param;
///////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_taskVehicleHandler: Respawn Handler For Task Vehicle %1 (%2), %3 Sec Abandoned, %4 Sec Destroyed,",_vehicle,typeOf _vehicle,_vehCleanupDelay,_vehDestroyedDelay];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle setVariable ["taskVehicle", true, false];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehDisplayName = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskAO = RELO_var_locationMkrCurr;
waitUntil {sleep 1; !(RELO_var_locationMkrCurr isEqualTo _taskAO) || !(alive _vehicle)}; // wait until location of AO has changed or vehicle is dead
///////////////////////////////////////////////////////////////////////////////////////////////////
_cleanUpTime = diag_tickTime;
///////////////////////////////////////////////////////////////////////////////////////////////////
while {sleep 1; alive _vehicle} do
{
	if (diag_tickTime > (_cleanUpTime + _vehCleanupDelay)) then
	{
		_count = count ((crew _vehicle) select {(alive _x) && !(isPlayer _x)});
		if (_count isEqualTo 0) then
		{
			#ifdef __DEBUG__
				format ["   - deleted vehicle %1 at grid position %2",_vehDisplayName,mapGridPosition (getPos _vehicle)] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log format ["   - deleted vehicle %1 at grid position %2",_vehDisplayName,mapGridPosition (getPos _vehicle)];
			#endif
			{
				if (!isPlayer _x) then
				{
					deleteVehicle objectFromNetId (netID _x);
				};
			} forEach (crew _vehicle);
			deleteVehicle objectFromNetId (netID _vehicle);
		}
		else
		{
			waitUntil {sleep 1; ({alive _x} count (crew _vehicle) == 0)};
			_cleanUpTime = diag_tickTime;
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isNull _vehicle) then
{
	#ifdef __DEBUG__
		format ["   - vehicle %1 destroyed at grid position %2, deleting in %3 seconds",_vehDisplayName,mapGridPosition (getPos _vehicle),_vehDestroyedDelay] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["   - vehicle %1 destroyed at grid position %2, deleting in %3 seconds",_vehDisplayName,mapGridPosition (getPos _vehicle),_vehDestroyedDelay];
	#endif
	_deleteVehicleTime = diag_tickTime;
	waitUntil {sleep 1; (diag_tickTime > (_deleteVehicleTime + _vehDestroyedDelay))};
	deleteVehicle objectFromNetId (netID _vehicle);
};
///////////////////////////////////////////////////////////////////////////////////////////////////
