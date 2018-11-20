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
	
	Name: fn_spawnWaterVehicles.sqf
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
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////

_vehicleArr =
[
	"O_Boat_Armed_01_hmg_F",
	"O_Boat_Transport_01_F",
	"O_Boat_Transport_01_F",
	"O_Boat_Transport_01_F"
];

_vehicleMarkerColor = "colorWhite";
_vehicleSpawnProbability = 5;
_vehicleAreaRadius = 50;

///////////////////////////////////////////////////////////////////////////////////////////////////
_vehiclePosArray = RELO_var_locationShallowWaterArr;
///////////////////////////////////////////////////////////////////////////////////////////////////
if (_vehiclePosArray isEqualTo []) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	" * spawning water vehicles..." remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " * spawning water vehicles...";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_numVehiclesSpawned = 0;
_vehiclePosExemptArr = [];
{
	_vehiclePos = _x;
	if !(_vehiclePos in _vehiclePosExemptArr) then
	{
		if (_vehicleSpawnProbability > random 99) then
		{
			_vehicleType = selectRandom _vehicleArr;
			_vehicleDisplayName = getText (configfile >> "CfgVehicles" >> _vehicleType >> "displayName");
			_vehicle = createVehicle [_vehicleType,[(_vehiclePos select 0),(_vehiclePos select 1),((_vehiclePos select 2) + 0.5)], [], 0, "CAN_COLLIDE"];
			_vehicle setVariable ["BIS_enableRandomization", false];
			_vehicle setVariable ["taskVehicle",true];
			_vehicle setDir (random 360);
			_vehicle setPos [(_vehiclePos select 0),(_vehiclePos select 1),((_vehiclePos select 2) + 0.5)];
			_vehicle setFuel ((random 100) / 100);
			
			[_vehicle,60,120] spawn RELO_fnc_taskVehicleHandler;
			
			clearWeaponCargoGlobal _vehicle;
			clearItemCargoGlobal _vehicle;
			clearBackpackCargoGlobal _vehicle;
			clearMagazineCargoGlobal _vehicle;
			_numVehiclesSpawned = _numVehiclesSpawned + 1;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			_vehicleMkrExempt = createMarker [format ["exempt_%1_%2",_vehiclePos],_vehiclePos];
			_vehicleMkrExempt setMarkerShape "ELLIPSE";
			_vehicleMkrExempt setMarkerBrush "Solid";
			_vehicleMkrExempt setMarkerSize [(_vehicleAreaRadius * 2),(_vehicleAreaRadius * 2)];
			_vehicleMkrExempt setMarkerColor "colorOrange";
			_vehicleMkrExempt setMarkerAlpha 0;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			RELO_var_locationMkrsExempt pushBack _vehicleMkrExempt;
			///////////////////////////////////////////////////////////////////////////////////////////////
			if (!(RELO_var_locationMkrsExempt isEqualTo []) && !(_vehiclePosArray isEqualTo [])) then
			{
				{
					_exemptVehiclePosArr = _vehiclePosArray inAreaArray _x;
					{
						_vehiclePosExemptArr pushBackUnique _x;
					} forEach _exemptVehiclePosArr;
				
				} forEach RELO_var_locationMkrsExempt;
			};
			///////////////////////////////////////////////////////////////////////////////////////////////////
			#ifdef __DEBUG__
				_vehicleMkrExempt setMarkerAlpha 0.5;
				{
					if ((getMarkerPos _x inArea _vehicleMkrExempt) && ([ "MarkerTemp", _x ] call BIS_fnc_inString)) then
					{
						deleteMarker _x;
					};
				} forEach allMapMarkers;
				_vehicleMarkerTemp = createMarker [format ["vehicleMarkerChosen_%1",_vehiclePos],_vehiclePos];
				RELO_var_locationMrksDebug pushBackUnique _vehicleMarkerTemp;
				_vehicleMarkerTemp setMarkerShape "ICON";
				_vehicleMarkerTemp setMarkerType "mil_triangle";
				_vehicleMarkerTemp setMarkerDir (getDir _vehicle);
				_vehicleMarkerTemp setMarkerText format ["%1",_vehicleDisplayName];
				_vehicleMarkerTemp setMarkerColor _vehicleMarkerColor;
				_vehicleMarkerTemp setMarkerSize [0.5,0.5];
				_vehicleMarkerTemp setMarkerAlpha 0.5;
				format ["   + %1 spawned at grid position %2",_vehicleDisplayName,mapGridPosition _vehiclePos] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log format ["   + %1 spawned at grid position %2",_vehicleDisplayName,mapGridPosition _vehiclePos];
			#endif
		};
	};
} forEach _vehiclePosArray;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	if (_numVehiclesSpawned isEqualTo 0) then
	{
		"   + no water vehicles spawned" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log "   + no water vehicles spawned";
	}
	else
	{
		format ["   + spawned %1 water vehicles",_numVehiclesSpawned] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["   + spawned %1 water vehicles",_numVehiclesSpawned];
	};
#endif
