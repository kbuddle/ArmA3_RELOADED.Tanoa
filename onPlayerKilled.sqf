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
	
	Name: onPlayerKilled.sqf
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

params ["_corpse","_killer","_delay"];

[] spawn
{
	titleCut ["", "BLACK OUT", 2.5];
	2.5 fadeSound 0;
	2.5 fadeMusic 0;
	waitUntil {alive player};
	titleCut ["", "BLACK IN", 2.5];
	2.5 fadeSound earPlugLevel; // see fn_earPlugs
	2.5 fadeMusic 1;
};

[player] call RELO_fnc_ejectCorpse; // client side eject from vehicle

[_corpse] remoteExec ["RELO_fnc_corpseCleanupHandler",2,false]; // server side corpse handler

_controllingAutonomousVehicle = getConnectedUAV player; // disconnect player from connected autonomous vehicle on death
if !(isNull _controllingAutonomousVehicle) then
{
	player connectTerminalToUAV objNull;
	// hint format ["disconnected from autonomous vehicle %1",_controllingAutonomousVehicle];
	[_controllingAutonomousVehicle] spawn
	{
		params ["_controllingAutonomousVehicle"];
		waitUntil {alive player};
		if (alive _controllingAutonomousVehicle) then
		{
			_hasConnected = player connectTerminalToUAV _controllingAutonomousVehicle;
			_i = 0;
			while {(!_hasConnected) || (_i < 10)} do
			{
				_hasConnected = player connectTerminalToUAV _controllingAutonomousVehicle;
				_i = _i + 1;
			};
			// _controllingAutonomousVehicle = getConnectedUAV player;
			// if !(isNull _controllingAutonomousVehicle) then
			// {
				// hint format ["reconnected to autonomous vehicle %1",_controllingAutonomousVehicle];
			// }
			// else
			// {
				// hint format ["unable to reconnected to autonomous vehicle %1",_controllingAutonomousVehicle];
			// };
		};
	};
};
