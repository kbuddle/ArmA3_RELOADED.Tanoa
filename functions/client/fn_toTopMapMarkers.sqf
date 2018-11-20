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
	
	Name: fn_toTopMapMarkers.sqf
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

// if !(hasInterface) exitWith {};

waitUntil {!(isNull (findDisplay 12 displayCtrl 51))}; // waitUntil map is visible before rearranging markers

_mapMarkers =
[
	"respawn_west",
	"respawn_west_diverSquad",
	"respawn_west_fighterPilot",
	"respawn_west_helicopterPilot",
	"bluforBase"
];

{
	_mapMarker = _x;
	_markerAlpha = markerAlpha _mapMarker;
	_markerBrush = markerBrush _mapMarker;
	_markerColor = markerColor _mapMarker;
	_markerDir = markerDir _mapMarker;
	_markerPos = markerPos _mapMarker;
	_markerShape = markerShape _mapMarker;
	_markerSize = markerSize  _mapMarker;
	_markerType = markerType _mapMarker;
	deleteMarkerLocal _mapMarker;
	_updateMkr = createMarkerLocal [format ["%1",_mapMarker],_markerPos];
	_updateMkr setMarkerAlpha _markerAlpha;
	_updateMkr setMarkerBrush _markerBrush;
	_updateMkr setMarkerColor _markerColor;
	_updateMkr setMarkerDir _markerDir;
	_updateMkr setMarkerPos _markerPos;
	_updateMkr setMarkerShape _markerShape;
	_updateMkr setMarkerSize _markerSize;
	_updateMkr setMarkerType _markerType;
} forEach _mapMarkers;
