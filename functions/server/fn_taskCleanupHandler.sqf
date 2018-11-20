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
	
	Name: fn_taskCleanupHandler.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
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

_playerTimeWait = 30; // set the time (in seconds) to wait if a player is present

_locationObjectsToDelete =
[
	"groundWeaponHolder",
	"weaponHolderSimulated"
];

///////////////////////////////////////////////////////////////////////////////////////////////
_task = param [0, ""];
_taskPosition = param [1, [0,0,0], [],3];
_taskArea = param [2, 15];
_taskObjects = param [3, []];
_hiddenObjects = param [4, []];
_taskAO = param [5, ""];
///////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_taskCleanupHandler: %1",_task];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////

waitUntil {sleep 1; !(RELO_var_locationMkrCurr isEqualTo _taskAO)}; // wait until location of AO has changed

if (_taskPosition isEqualTo [0,0,0]) exitWith {};

_anyPlayersAround = {alive _x} count (nearestObjects [_taskPosition, ["MAN"], (_taskArea * 4)]);
while {(_anyPlayersAround > 0)} do
{
	_anyPlayersAround = {alive _x} count (nearestObjects [_taskPosition, ["MAN"], (_taskArea * 4)]);
	uiSleep _playerTimeWait;
};

_anyDeadAround = {!alive _x} count (nearestObjects [_taskPosition, ["MAN"], (_taskArea * 8)]);
if (_anyDeadAround > 0) then
{
	_deadAround = (nearestObjects [_taskPosition, ["MAN"], (_taskArea * 8)]);
	{
		if !(alive _x) then
		{
			deleteVehicle _x;
		};
	} forEach _deadAround;
};

if !(_taskObjects isEqualTo []) then
{
	{
		deleteVehicle _x;
	} forEach _taskObjects;
};

_ruinsAround = (nearestObjects [_taskPosition, ["RUINS"], (_taskArea * 2)]);
if !(_ruinsAround isEqualTo []) then
{
	{
		deleteVehicle _x;
	} forEach _ruinsAround;
};

if !(_hiddenObjects isEqualTo []) then
{
	{
		_x hideObjectGlobal false;
		_x allowDamage true;
	} forEach _hiddenObjects;
};

_anyObjectsAround = nearestObjects [_taskPosition, ["ALL"], (_taskArea * 2)];
_anyObjectsAroundCount = (count _anyObjectsAround);
_anyObjectsAroundDeleted = 0;
{
	_typeOfObject = typeOf _x;
	if (_typeOfObject in _locationObjectsToDelete) then
	{
		deleteVehicle _x;
		_anyObjectsAroundDeleted = _anyObjectsAroundDeleted + 1;
	};

} forEach _anyObjectsAround;

#ifdef __DEBUG__
	format [" ! cleaned up previous task %1 at grid position %2",_task, mapGridPosition _taskPosition] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format [" ! cleaned up previous task %1 at grid position %2",_task, mapGridPosition _taskPosition];
#endif
