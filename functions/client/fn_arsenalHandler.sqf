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

	Name: fn_arsenalHandler.sqf
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

[missionNamespace, "arsenalOpened", {
	_display = _this select 0;
	['showMessage',[_display,'To add ammunition, open the container on the left (uniform,vest,backpack) and add ammunition on the right.']] call BIS_fnc_Arsenal;
}] call BIS_fnc_addScriptedEventHandler;

[missionNamespace, "arsenalClosed", {
	_arsenalSaved = getUnitLoadout player;
	missionNamespace setVariable ["RELO_var_arsenalSaved",_arsenalSaved,false];
}] call BIS_fnc_addScriptedEventHandler;
