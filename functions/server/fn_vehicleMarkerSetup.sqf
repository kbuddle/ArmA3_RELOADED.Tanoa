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

	Name: fn_vehicleMarkerSetup.sqf
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

diag_log "[INIT] -> Vehicle Marker Setup";

{
	_vehicleKind = _x select 0;
	_vehicleIcon = _x select 1;
	_allMissionObjects = allMissionObjects _vehicleKind;
	{
		_vehicle = _x;
		_vehiclePos = getPos _vehicle;
		_vehicleDir = getDir _vehicle;
		_vehicleBox = boundingBoxReal _vehicle;
		_vehicleDim = _vehicleBox select 0;

		_vehicleMarker = createMarker [format ["%1",vehicleVarName _vehicle],_vehiclePos];
		_vehicleMarker setMarkerColor "ColorRed";
		_vehicleMarker setMarkerShape "RECTANGLE";
		_vehicleMarker setMarkerAlpha 0.5;
		_vehicleMarker setMarkerBrush "DIAGGRID";
		_vehicleMarker setMarkerSize [(_vehicleDim select 0),(_vehicleDim select 1)];
		_vehicleMarker setMarkerDir _vehicleDir;

		_vehicleMarker = createMarker [format ["RELO_mkr_vehicle_%1",_vehiclePos],_vehiclePos];
		_vehicleMarker setMarkerShape "ICON";
		_vehicleMarker setMarkerType _vehicleIcon;
		_vehicleMarker setMarkerSize [0.5,0.5];
		_vehicleMarker setMarkerColor "colorBLUFOR";
		_vehicleMarker setMarkerAlpha 0.5;
	} forEach _allMissionObjects;
} forEach [["Helicopter","b_air"],["Plane","b_plane"],["LandVehicle","b_recon"],["Ship","b_armor"]];
