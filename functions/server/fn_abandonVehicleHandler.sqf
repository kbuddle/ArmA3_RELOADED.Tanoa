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
	
	Name: fn_abandonVehicleHandler.sqf
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
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
_vehicle = param [0, objNull, [objNull]];
_vehicleTimer = param [1, 300, [0]];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleClass = typeOf _vehicle;
_vehicleName = getText (configfile >> "CfgVehicles" >> _vehicleClass >> "displayName");
///////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_abandonVehicleHandler: %1 (%2), %3 Sec Cleanup",_vehicle,_vehicleClass,_vehicleTimer];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////
// #ifdef __DEBUG__
	// format ["   ! spawned abandon vehicle handler for %1",_vehicleName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log format ["   ! spawned abandon vehicle handler for %1",_vehicleName];
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////
sleep 60;
///////////////////////////////////////////////////////////////////////////////////////////////
_i = _vehicleTimer;
while {sleep 10; alive _vehicle} do
{
	_count = count ((crew _vehicle) select {(alive _x) && !(isPlayer _x)});
	if (_count isEqualTo 0) then
	{
		_i = _i - 10;
	}
	else
	{
		_i = _vehicleTimer;
	};
	if (_i <= 0 ) exitWith
	{
		for [{_j = 0},{_j < 5},{_j = _j + 1}] do
		{
			// _vehicle say3D "Orange_Car_Alarm_Loop_01"; // say3D is local only, it needs remoteExec
			[_vehicle,"Orange_Car_Alarm_Loop_01"] remoteExec ["say3D",[0,-2] select isDedicated];
			sleep 2.25;
		};
		_vehicle setDamage 1;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////
