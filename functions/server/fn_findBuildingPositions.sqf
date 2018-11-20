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
	
	Name: fn_findBuildingPositions.sqf
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
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////

_locationDescription = "building positions";
_locationMarkerColor = "colorOPFOR";

///////////////////////////////////////////////////////////////////////////////////////////////////
_terrainMarker = createMarker [format ["%1Marker_%2",_locationDescription,RELO_var_locationMkrPos],RELO_var_locationMkrPos];
_terrainMarker setMarkerShape "ELLIPSE";
_terrainMarker setMarkerSize [RELO_var_locationMkrSize,RELO_var_locationMkrSize];
_terrainMarker setMarkerBrush "Solid";
_terrainMarker setMarkerColor _locationMarkerColor;
_terrainMarker setMarkerAlpha 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	_terrainMarker setMarkerAlpha 0.25;
	systemChat " * init for buildings...";
	" * init for buildings..." remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " * init for buildings...";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_buildingsArr = [];
_buildingsArr = nearestObjects [RELO_var_locationMkrPos,["Building","House","HouseBase","Ruins","House_F","Ruins_F","House_Small_F"],RELO_var_locationMkrSize];
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	if !(_buildingsArr isEqualTo []) then
	{
		format ["  + %1 buildings found",(count _buildingsArr)] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["  + %1 buildings found",(count _buildingsArr)];
	}
	else
	{
		"  - no buildings found" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log "  - no buildings found";
	};
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationBuildingPosArr = [];
{
	if !(["container", typeOf _x] call BIS_fnc_inString) then
	{
		_buildingPositions = _x buildingPos -1;
		{
			if (_forEachIndex % 6 == 0) then // every 6th location
			{
				_isEmpty = !(_x isFlatEmpty  [0, -1, -1, -1, -1, false, objNull] isEqualTo []);
				if (_isEmpty isEqualTo true) then
				{
					RELO_var_locationBuildingPosArr pushBackUnique _x;
				};
			};
		} forEach _buildingPositions;
	};
} forEach _buildingsArr;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	if !(_buildingsArr isEqualTo []) then
	{
		format ["  + %1 building positions found",(count RELO_var_locationBuildingPosArr)] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["  + %1 building positions found",(count RELO_var_locationBuildingPosArr)];
		{
			_pathMarkerTemp = createMarker [format ["bldPosMarkerTemp_%1",_x],_x];
			RELO_var_locationMrksDebug pushBackUnique _pathMarkerTemp;
			_pathMarkerTemp setMarkerShape "ICON";
			_pathMarkerTemp setMarkerType "o_unknown";
			_pathMarkerTemp setMarkerSize [0.25,0.25];
			_pathMarkerTemp setMarkerColor _locationMarkerColor;
			_pathMarkerTemp setMarkerAlpha 0.5;
		} forEach RELO_var_locationBuildingPosArr;
	};
	"  + compiling building position array complete!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log "  + compiling building position array complete!";
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
deleteMarker _terrainMarker;
