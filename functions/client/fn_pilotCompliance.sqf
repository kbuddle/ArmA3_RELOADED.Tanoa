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
	
	Name: fn_addPilotCompliance.sqf
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

if !(hasInterface) exitWith {};

waitUntil {!isNull player};

if ((player getUnitTrait "RELO_trait_helicopterPilot") || (player getUnitTrait "RELO_trait_fighterPilot")) then
{
	waitUntil {!isNull (findDisplay 46)};
	_pilotConfirm = ["TO COMPLY WITH A PILOT ROLE, YOU MUST BE COMMUNICABLE IN THE DISCORD 'PILOT-VOICE' CHANNEL!", "PILOT COMMUNICATIONS", "I ACCEPT", "I DECLINE"] call BIS_fnc_guiMessage;
	if (!_pilotConfirm) exitWith
	{
		endMission "LOSER";
	};
	_text = "You Have Accepted To Comply With A Pilot Role,\nAccepting But Failing To Comply Will Result In A Ban!";
	[_text, 1] call RELO_fnc_titleTextGlobal;
};
