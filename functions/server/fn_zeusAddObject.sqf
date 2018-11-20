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
	
	Name: fn_zeusAddObject.sqf
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
if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////

params ["_curator","_placed"];

_nameOfCurator = _curator getVariable ["name","UNKNOWN"];

{
	_x addCuratorEditableObjects [[_placed],true];
	_placed setVariable ["zeusSpawnedBy",_nameOfCurator,false];
	
	if (_placed isKindOf "CAMANBASE") then
	{
		_placed addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
		_placed setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
	};
	if ((_placed isKindOf "CAR") || (_placed isKindOf "HELICOPTER") || (_placed isKindOf "PLANE") || (_placed isKindOf "TANK")) then
	{
		[_placed,300,120] spawn RELO_fnc_taskVehicleHandler;
		[_placed,300] spawn RELO_fnc_abandonVehicleHandler;
		_placedCrew = crew _placed;
		if !(_placedCrew isEqualTo []) then
		{
			{
				_placed addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
				_placed setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
			} forEach _placedCrew;
		};
	};
} forEach (allCurators - [_curator]);

_typeOfObject = typeOf _placed;
_locationOfObject = mapGridPosition (getPos _placed);

// format ["[ZEUS] %1(%2) placed object %3(%4) at grid position %5.",_curator,_nameOfCurator,_placed,_typeOfObject,_locationOfObject] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];