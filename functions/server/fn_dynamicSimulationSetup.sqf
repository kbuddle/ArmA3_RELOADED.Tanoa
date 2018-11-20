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

	Name: fn_dynamicSimulationSetup.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description: Invade & Annex - Main AO calculations

	Parameter(s): RELO_var_dynamicSimulation (name of game logic)

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {};

_gameLogicName = RELO_var_dynamicSimulation;

RELO_fnc_dynamicSimulationSetup = {
	params ["_gameLogicName"];
	_gameLogicName setVariable ["radius",20]; // default at 2000m (can adapt to change the distance based on view distance of current player)
	_gameLogicName setVariable ["excludeAir",false]; // include all air objects
	[_gameLogicName] execFSM "\a3\modules_f\ObjectModifiers\functions\fn_moduleSimulationManager.fsm"; // initiate simulation manager
	hint "initiated simulation manager";
};

publicVariable "RELO_fnc_dynamicSimulationSetup";
[_gameLogicName] call RELO_fnc_dynamicSimulationSetup;
remoteExecCall ["RELO_fnc_dynamicSimulationSetup",-2,true];
