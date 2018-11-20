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

	Name: fn_serviceWaterVehicleSetup.sqf
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

RELO_fncl_serviceWaterVehicleSetup = {
	_servicePads = (allMissionObjects "ALL") select {["servicePadWaterVehicle", str _x] call BIS_fnc_inString};
	if !(_servicePads isEqualTo []) then
	{
		{
			_servicePad = _x;
			_servicePadPos = getPos _servicePad;
			_servicePadDir = getDir _servicePad;
			_servicePadTrigger = createTrigger ["EmptyDetector", (getPos _servicePad), true];
			_servicePadTrigger setTriggerArea [7.5,7.5,0,false,7.5];
			_servicePadTrigger setTriggerActivation ["WEST", "PRESENT", true];
			_servicePadTrigger setTriggerStatements [ \
				"((vehicle player) in thisList) && {(_x isKindOf 'Ship') && (surfaceIsWater (getPos _x)) && (alive _x) && (!isNull assignedDriver _x)} count thisList > 0", \
				"serviceWaterVehicle = player addAction ['Service Water Vehicle', {[_this select 1] spawn RELO_fnc_serviceWaterVehicle},[],0,true,false,'','((!isNull (assignedDriver vehicle _this)) && (surfaceIsWater (getPos _this)))',-1,false,''];", \
				"player removeAction serviceWaterVehicle; ['', 1] call RELO_fnc_titleTextGlobal" \
			];
			if (isServer) then
			{
				_servicePadMarker = createMarker [format ["RELO_mkr_servicePadArea_%1",_servicePad],_servicePadPos];
				_servicePadMarker setMarkerShape "RECTANGLE";
				_servicePadMarker setMarkerBrush "SOLID";
				_servicePadMarker setMarkerSize [20,20];
				_servicePadMarker setMarkerDir _servicePadDir;
				_servicePadMarker setMarkerColor "colorBlack";
				_servicePadMarker setMarkerAlpha 0.25;

				_servicePadMarker = createMarker [format ["RELO_mkr_servicePadRectangle_%1",_servicePad],_servicePadPos];
				_servicePadMarker setMarkerShape "RECTANGLE";
				_servicePadMarker setMarkerBrush "DIAGGRID";
				_servicePadMarker setMarkerSize [10,10];
				_servicePadMarker setMarkerDir _servicePadDir;
				_servicePadMarker setMarkerColor "colorOrange";
				_servicePadMarker setMarkerAlpha 1;

				_servicePadMarker = createMarker [format ["RELO_mkr_servicePadIcon_%1",_servicePad],_servicePadPos];
				_servicePadMarker setMarkerShape "ICON";
				_servicePadMarker setMarkerType "b_service";
				_servicePadMarker setMarkerSize [0.5,0.5];
				_servicePadMarker setMarkerColor "colorOrange";
				_servicePadMarker setMarkerAlpha 1;
				diag_log format ["[INIT] -> Service Water Vehicle @ Grid Position %1", mapGridPosition _servicePad];
			};
		} forEach _servicePads;
	};
};

publicVariable "RELO_fncl_serviceWaterVehicleSetup";
[] call RELO_fncl_serviceWaterVehicleSetup;
remoteExecCall ["RELO_fncl_serviceWaterVehicleSetup",-2,true];
