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
	
	Name: fn_respawnMarkerSetup.sqf
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

diag_log "[INIT] -> Respawn Marker Setup";

_respawnAreas = (allMapMarkers) select {["respawn_", str _x] call BIS_fnc_inString};

if !(_respawnAreas isEqualTo []) then
{
	{
		_respawnArea = _x;
		_respawnAreaPos = markerPos _respawnArea;
		_respawnAreaDir = markerDir _respawnArea;
		
		_respawnAreaMarker = createMarker [format ["RELO_mkr_respawnArea_%1",_respawnArea],_respawnAreaPos];
		_respawnAreaMarker setMarkerShape "ELLIPSE";
		_respawnAreaMarker setMarkerBrush "SOLID";
		_respawnAreaMarker setMarkerSize [20,20];
		_respawnAreaMarker setMarkerDir _respawnAreaDir;
		_respawnAreaMarker setMarkerColor "colorBlack";
		_respawnAreaMarker setMarkerAlpha 0.25;
		
		_respawnAreaMarker = createMarker [format ["RELO_mkr_respawnAreaEllipse_%1",_respawnArea],_respawnAreaPos];
		_respawnAreaMarker setMarkerShape "ELLIPSE";
		_respawnAreaMarker setMarkerBrush "DIAGGRID";
		_respawnAreaMarker setMarkerSize [10,10];
		_respawnAreaMarker setMarkerDir _respawnAreaDir;
		_respawnAreaMarker setMarkerColor "colorBLUFOR";
		_respawnAreaMarker setMarkerAlpha 1;
	} forEach _respawnAreas;
};
