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

	Name: fn_playerInit.sqf
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

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;

[] spawn RELO_fnc_arsenalHandler;
[] spawn RELO_fnc_lifeStateHandler;
[] spawn RELO_fnc_gestures;
[] spawn RELO_fnc_playerJump;
[] spawn RELO_fnc_earPlugs;
[] spawn RELO_fnc_unitMarkers;
[] spawn RELO_fnc_pilotCheck;
[] spawn RELO_fnc_pauseMenuOverride;
[] spawn RELO_fnc_dlcPageOverride;
[] spawn RELO_fnc_pilotCompliance;
[] spawn RELO_fnc_toTopMapMarkers;
[] spawn RELO_fnc_spectate;

// sticky charges
[] execVM "thirdParty\stickyCharges\init.sqf";
// compass
// [] execVM "thirdParty\voyagerCompass\voyagerCompass.sqf";
// chvd
CHVD_allowNoGrass = false;
CHVD_maxView = 6000;
CHVD_maxObj = 6000;
// for alpha testing teleport
player onMapSingleClick "if (_alt) then {vehicle player setPos _pos}"; // delete this after debug testing!
// for server restart messages
"RM_DISPLAYTEXT_PUBVAR" addPublicVariableEventHandler {(_this select 1) spawn BIS_fnc_dynamicText;};
