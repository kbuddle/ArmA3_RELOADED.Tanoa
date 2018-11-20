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
	
	Name: fn_lockAirVehicle.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description: Invade & Annex - Main AO calculations

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {};

_vehicle = param [0, objNull, [objNull]];

waitUntil {!(isNull _vehicle)};

if ((_vehicle isKindOf "Helicopter") || (_vehicle isKindOf "Plane")) then
{
	// lock all turrets
	{ 
		_vehicle lockTurret [_x, true]; 
	} forEach (allTurrets [_vehicle, true]); 

	// lock all cargo
	{ 
		_vehicle lockCargo [(_x select 2), true]; 
	} forEach (fullCrew [_vehicle,"cargo",true]);
	
	_vehicle setVariable ["isLocked",true,true];
};
