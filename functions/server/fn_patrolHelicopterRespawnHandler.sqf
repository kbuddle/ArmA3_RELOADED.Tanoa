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

_respawnDelay = selectRandom [300,450,600];

///////////////////////////////////////////////////////////////////////////////////////////////
_vehicle = _this select 0;
_locationMkrName = _this select 1;
_locationMkrInside = _this select 2;
///////////////////////////////////////////////////////////////////////////////////////////////
_vehicleName = getText (configfile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
///////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format [" * initiated patrol helicopter respawn handler for %1",_vehicleName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format [" * initiated patrol helicopter respawn handler for %1",_vehicleName];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
_locationMkrCurr = RELO_var_locationMkrCurr;
///////////////////////////////////////////////////////////////////////////////////////////////
waitUntil {sleep 1; !(alive _vehicle) || !(_locationMkrCurr isEqualTo RELO_var_locationMkrCurr)};
///////////////////////////////////////////////////////////////////////////////////////////////
if (_locationMkrCurr isEqualTo RELO_var_locationMkrCurr) then // check if AO is still active
{
	// #ifdef __DEBUG__
		// format [" - patrol helicopter %1 has been destroyed, waiting %2 seconds for respawn!",typeOf _vehicle,_respawnDelay] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format [" - patrol helicopter %1 has been destroyed, waiting %2 seconds for respawn!",typeOf _vehicle,_respawnDelay];
	// #endif
	sleep _respawnDelay;
	if (_locationMkrCurr isEqualTo RELO_var_locationMkrCurr) then // check if AO is still active after respawn delay
	{
		[_locationMkrName,_locationMkrInside] spawn RELO_fnc_patrolHelicopter;
	};
};
