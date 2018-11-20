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

	Name: fn_vehicleDisable.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
params [["_vehicle",objNull],["_lock",true]];
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleType = typeOf _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle setVariable ["disabledVehicle",true]; // for use with engineerPatrol script so they don't repair the vehicle.
if (_lock isEqualTo true) then
{
	_vehicle lock true;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle setDamage 0.6; // set over all damage to 50% to allow engineer to repair it via prompt/repair icon when close to vehicle (sets all hitpoints to 0.75 also).
// #ifdef __DEBUG__
	// format ["   ! task vehicle %1 has been damaged to 60%!",_vehicleType] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log format ["   ! task vehicle %1 has been damaged to 60%!",_vehicleType];
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicleHitPointCount = count (configfile >> "CfgVehicles" >> _vehicleType >> "HitPoints");
if (_vehicleHitPointCount > 0) then
{
	for [{_i = 0},{_i < _vehicleHitPointCount},{_i = _i + 1}] do
	{
		_vehicle setHitIndex [_i,0.75]; // set the hit index to 75% for conditional checking for repair task role.
		_hitPointName = configName ((configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints") select _i);
		if (!(((toLower _hitPointName) find "wheel") isEqualTo -1) || !(((toLower _hitPointName) find "glass") isEqualTo -1)) then // only damage wheels and glass
		{
			if (0.50 > random 1) then // 50% chance of damage to each hit point
			{
				// #ifdef __DEBUG__
					// format ["   ! task vehicle %1 hit point %2 is being damaged!",_vehicleType,_hitPointName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					// diag_log format ["   ! task vehicle %1 hit point %2 is being damaged!",_vehicleType,_hitPointName];
				// #endif
				_vehicle setHit [getText (configFile >> "cfgVehicles" >> _vehicleType >> "HitPoints" >> _hitPointName >> "name"),1];
			};
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_vehicle setFuel (0.2 + round(random 0.2));
_vehicle setVehicleAmmo (0.2 + round(random 0.2));
///////////////////////////////////////////////////////////////////////////////////////////////////
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitLFWheel" >> "name"),1];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitLBWheel" >> "name"),1];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRFWheel" >> "name"),1];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitRBWheel" >> "name"),1];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass1" >> "name"),0.75];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass2" >> "name"),0.75];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass3" >> "name"),0.75];};
// if (random 1 > 0.25) then {_vehicle setHit [getText (configFile >> "cfgVehicles" >> (TypeOf _vehicle) >> "HitPoints" >> "HitGlass4" >> "name"),0.75];};
///////////////////////////////////////////////////////////////////////////////////////////////

// _vehicleHitPointCount = count (configfile >> "CfgVehicles" >> _vehicleType >> "HitPoints");
// if (_vehicleHitPointCount > 0) then
// {
	// for [{_i = 0},{_i < _vehicleHitPointCount},{_i = _i + 1}] do
	// {
		// _hitPointName = configName ((configFile >> "CfgVehicles" >> _vehicleType >> "HitPoints") select _i);
		// if !(_hitPointName isEqualTo "") then
		// {
			// if (0.5 > random 1) then // 50% chance of damage to each hit point
			// {
				// #ifdef __DEBUG__
					// format ["   ! task vehicle %1 hit point %2 is being damaged!",_vehicleType,_hitPointName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					// diag_log format ["   ! task vehicle %1 hit point %2 is being damaged!",_vehicleType,_hitPointName];
				// #endif
				// _vehicle setHit [getText (configFile >> "cfgVehicles" >> _vehicleType >> "HitPoints" >> _hitPointName >> "name"),1];
			// };
		// };
	// };
// };
