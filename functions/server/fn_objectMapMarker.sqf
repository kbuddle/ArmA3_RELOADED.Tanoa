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
	
	Name: fn_objectMapMarker.sqf
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

private ["_object","_objectPos", "_objectDir", "_boundingBoxReal"];

_object = param [0, objNull, [objNull]];

if (isNull _object) exitWith {};

_objectPos = getPos _object;
_objectPos set [2,-1];
_objectDir = getDir _object;
_boundingBoxReal = boundingBoxReal _object;

_objectDimension = _boundingBoxReal select 0;

_objectMkr = createMarker [format ["RELO_mkr_object_%1",_objectPos],_objectPos];
_objectMkr setMarkerColor "ColorGrey";
_objectMkr setMarkerShape "RECTANGLE";
_objectMkr setMarkerAlpha 1;
_objectMkr setMarkerBrush "SOLIDFULL";
_objectMkr setMarkerSize [(_objectDimension select 0),(_objectDimension select 1)];
_objectMkr setMarkerDir _objectDir;
