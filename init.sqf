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

	Name: init.sqf
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

// this script is called AFTER 'BIS_fnc_init' is set to true!

[] call BIS_fnc_reviveInit; // make sure to load vanilla revive system for server and clients
// call compileFinal preprocessFileLineNumbers "thirdParty\farRevive\farReviveInit.sqf";

// [] call RELO_fnc_dynamicSimulationSetup; // initialize dynamic simulation for all (players and server) <- doesnt work for any AO objects

// zeus handlers for adding/removing objects/units - moved to zeusInitCurators
/* {
	_x addEventHandler ["CuratorObjectPlaced",{_this remoteExecCall ["RELO_fnc_zeusAddObject"];}];
	_x addEventHandler ["CuratorObjectDeleted",{_this remoteExecCall ["RELO_fnc_zeusDeleteObject"];}];
} forEach allCurators; */
