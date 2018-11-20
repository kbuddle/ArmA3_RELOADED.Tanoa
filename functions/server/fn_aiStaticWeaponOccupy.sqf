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

	Name: fn_aiStaticWeaponOccupy.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - credits to Joris-Jan van't Land for reference code.
	Creation Date: 1:54 PM 16/10/2017
	Modification Date: 1:54 PM 16/10/2017

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
params ["_taskTitle","_taskLocation","_taskAreaRadius","_grpDeploy","_percentChance"];
///////////////////////////////////////////////////////////////////////////////////////////////////
private ["_staticWeaponsArr", "_units"];
_staticWeaponsArr = _taskLocation nearObjects ["STATICWEAPON", _taskAreaRadius];
_units = (units _grpDeploy) - [leader _grpDeploy];
///////////////////////////////////////////////////////////////////////////////////////////////////
_staticWeapons = [];
{
	if ((_x emptyPositions "GUNNER") > 0) then
	{
		_staticWeapons = _staticWeapons + [_x];
	};
} forEach _staticWeaponsArr;
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_weapon = _x;
	_typeOfWeapon = typeOf _weapon;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_isUAV = unitIsUAV _weapon;
	if (_isUAV) then
	{
		createVehicleCrew _weapon;
		_groupUAV = createGroup EAST;
		(crew _weapon) joinSilent _groupUAV;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	if ((count _units) > 0) then
	{
		if (_percentChance > (random 1)) then
		{
			private ["_unit"];
			_unit = (_units select ((count _units) - 1));
			_unit assignAsGunner _weapon;
			[_unit] orderGetIn true;
			// #ifdef __DEBUG__
				// format ["   ! %1 on static weapon at %2",(name _unit),_taskTitle] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				// diag_log format ["   ! %1 on static weapon at %2",(name _unit),_taskTitle];
			// #endif
			_units resize ((count _units) - 1);
		};
	};
} forEach _staticWeapons;
///////////////////////////////////////////////////////////////////////////////////////////////////
