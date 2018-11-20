/*
	----------------------------------------------------------------------------------------------

	Copyright © 2016 soulkobk (soulkobk.blogspot.com)

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

	Name: fn_exemptMarkerSetup.sqf
	Version: 1.0.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 9:33 PM 04/07/2016
	Modification Date: 8:11 PM 21/07/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 -	original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {};

_mapSizeSquare = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
_mapSizeEllipse = sqrt ((_mapSizeSquare * _mapSizeSquare) + (_mapSizeSquare * _mapSizeSquare));
_mapCenterPos = [(_mapSizeSquare / 2),(_mapSizeSquare / 2)];

_exemptMarkerNorthWestPos = [_mapCenterPos, _mapSizeEllipse / 4, 315] call BIS_fnc_relPos;
_exemptMarkerNorthEastPos = [_mapCenterPos, _mapSizeEllipse / 4 , 45] call BIS_fnc_relPos;
_exemptMarkerSouthWestPos = [_mapCenterPos, _mapSizeEllipse / 4, 225] call BIS_fnc_relPos;
_exemptMarkerSouthEastPos = [_mapCenterPos, _mapSizeEllipse / 4, 135] call BIS_fnc_relPos;

{
	_mkrName = _x select 0;
	_mkrPos = _x select 1;
	_mkrExempt = createMarker [format ["%1",_mkrName],_mkrPos];
	_mkrExempt setMarkerColor "ColorGreen";
	_mkrExempt setMarkerShape "RECTANGLE";
	_mkrExempt setMarkerBrush "SOLIDBORDER";
	_mkrExempt setMarkerAlpha 0;
	_mkrExempt setMarkerSize [_mapSizeSquare / 4,_mapSizeSquare / 4];
} forEach [["exemptMarkerNorthWest",_exemptMarkerNorthWestPos],["exemptMarkerNorthEast",_exemptMarkerNorthEastPos],["exemptMarkerSouthWest",_exemptMarkerSouthWestPos],["exemptMarkerSouthEast",_exemptMarkerSouthEastPos]];

diag_log "[INIT] -> Exempt Marker Setup";
