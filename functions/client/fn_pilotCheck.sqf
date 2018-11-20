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
	
	Name: fn_pilotCheck.sqf
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

player addEventHandler ["getInMan",{
	_player = _this select 0;
	_position = _this select 1;
	_vehicle = _this select 2;
	_turret = _this select 3; // [0] = co-pilot, [1],[2] etc = weapon turrets
	
	_playerUID = getPlayerUID _player;
	
	if ((_vehicle isKindOf "Helicopter") || (typeOf _vehicle isEqualTo "B_T_VTOL_01_infantry_F")) exitWith // allow heli pilots to fly the VTOL
	{
		_isWhiteListed = _playerUID in RELO_var_whiteListedHelicopterPilots;
		if (_isWhiteListed isEqualTo true) exitWith {};
		
		if (typeOf _vehicle isEqualTo "B_Heli_Light_01_F") exitWith {}; // allow anyone to pilot a MH-9 Hummingbird;
		
		_isPilot = (_player getUnitTrait "RELO_trait_helicopterPilot");
		if (_isPilot isEqualTo false) then
		{
			if (_position isEqualTo "driver") then
			{
				systemChat "You can not pilot this aircraft, helicopter pilots only!";
				unassignVehicle _player;
				_player action ["getOut", _vehicle];
			};
			if (_turret isEqualTo [0]) then
			{
				systemChat "You can not co-pilot this aircraft, helicopter pilots only!";
				unassignVehicle _player;
				_player action ["getOut", _vehicle];
			};
		};
	};
	
	if (_vehicle isKindOf "Plane") exitWith
	{
		_isWhiteListed = _playerUID in RELO_var_whiteListedFighterPilots;
		if (_isWhiteListed isEqualTo true) exitWith {};
		_isPilot = (_player getUnitTrait "RELO_trait_fighterPilot");
		if (_isPilot isEqualTo false) then
		{
			if (_position isEqualTo "driver") then
			{
				systemChat "You can not pilot this aircraft, fighter pilots only!";
				unassignVehicle _player;
				_player action ["getOut", _vehicle];
			};
			if (_turret isEqualTo [0]) then
			{
				systemChat "You can not co-pilot this aircraft, fighter pilots only!";
				unassignVehicle _player;
				_player action ["getOut", _vehicle];
			};
		};
	};
}];
