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
	
	Name: fn_findDeepWaterPosition.sqf
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

_locationDescription = "deep water";
_locationMarkerColor = "colorBlue";

_locationMkrSteps = 33;
_minWaterDepth = 50;
_maxWaterDepth = 60;
_maxRadius = 16.5;

///////////////////////////////////////////////////////////////////////////////////////////////
_findPos = param [0, false, [true,false]];
///////////////////////////////////////////////////////////////////////////////////////////////////
_terrainMarker = createMarker [format ["%1Marker_%2",_locationDescription,RELO_var_locationMkrPos],RELO_var_locationMkrPos];
_terrainMarker setMarkerShape "ELLIPSE";
_terrainMarker setMarkerSize [RELO_var_locationMkrSize,RELO_var_locationMkrSize];
_terrainMarker setMarkerBrush "Solid";
_terrainMarker setMarkerColor _locationMarkerColor;
_terrainMarker setMarkerAlpha 0;
///////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	_terrainMarker setMarkerAlpha 0.25;
	if (_findPos isEqualTo true) then
	{
		format [" * scanning for %1 position...",_locationDescription] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format [" * scanning for %1 position...",_locationDescription];
	}
	else
	{
		format [" * init for %1 position...",_locationDescription] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format [" * init for %1 position...",_locationDescription];
	};
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
_terrainPos = [0,0,0];
_terrainPosArr = [];
///////////////////////////////////////////////////////////////////////////////////////////////
_sin = sin RELO_var_locationTerrainDir;
_cos = cos RELO_var_locationTerrainDir;
markerSize _terrainMarker params ["_mw", "_mh"];
markerPos _terrainMarker params ["_mx", "_my"];
///////////////////////////////////////////////////////////////////////////////////////////////
for "_i" from -_mw to _mw step _locationMkrSteps do
{
	for "_j" from -_mh to _mh step _locationMkrSteps do
	{
		_mapPosCurr = [_mx + _cos * _i + _sin * _j, _my + -_sin * _i + _cos * _j, 0];
		if (_mapPosCurr inArea _terrainMarker) then
		{
			_isEmpty = !(_mapPosCurr isFlatEmpty  [_maxRadius, -1, -1, -1, -1, false, objNull] isEqualTo []);
			///////////////////////////////////////////////////////////////////////////////////////////////
			// _isBaseCompositionClose = false;
			// {
				// _object = _x;
				// if (_object getVariable ["baseCompositionObject",false]) exitWith
				// {
					// _isBaseCompositionClose = true;
				// };
			// } forEach (nearestObjects [_mapPosCurr, [], (_maxRadius * 2)]);
			///////////////////////////////////////////////////////////////////////////////////////////////
			_isBaseCompositionClose = !((nearestObjects [_mapPosCurr, [], (_maxRadius * 4)] select {(_x getVariable ["baseCompositionObject",false] isEqualTo true)}) isEqualTo []);
			///////////////////////////////////////////////////////////////////////////////////////////////
			if ((_isEmpty isEqualTo true) && (_isBaseCompositionClose isEqualTo false)) then
			{
				_mapPosCurrDepth = ASLtoATL _mapPosCurr;
				_mapPosCurrDepth = (_mapPosCurrDepth select 2);
				if ((surfaceIsWater _mapPosCurr) && (_mapPosCurrDepth >= _minWaterDepth) && (_mapPosCurrDepth <= _maxWaterDepth)) then
				{
					// if (_mapPosCurr inArea _terrainMarker) then
					// {
						_terrainPosArr pushBackUnique _mapPosCurr;
					// };
				};
			};
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////
if (!(RELO_var_locationMkrsExempt isEqualTo []) && !(_terrainPosArr isEqualTo [])) then
{
	{
		_exemptTerrainPosArr = _terrainPosArr inAreaArray _x;
		{
			_terrainPosArr = _terrainPosArr - [_x];
			#ifdef __DEBUG__
				deleteMarker format ["%1MarkerTemp_%2",_locationDescription,_x];
			#endif
		} forEach _exemptTerrainPosArr;
	
	} forEach RELO_var_locationMkrsExempt;
};
///////////////////////////////////////////////////////////////////////////////////////////////
if !(_terrainPosArr isEqualTo []) then
{
	_terrainPos = selectRandom _terrainPosArr;
	#ifdef __DEBUG__
		{
			_terrainMarkerTemp = createMarker [format ["%1MarkerTemp_%2",_locationDescription,_x],_x];
			RELO_var_locationMrksDebug pushBackUnique _terrainMarkerTemp;
			_terrainMarkerTemp setMarkerShape "ELLIPSE";
			_terrainMarkerTemp setMarkerSize [_maxRadius,_maxRadius];
			_terrainMarkerTemp setMarkerColor _locationMarkerColor;
			_terrainMarkerTemp setMarkerAlpha 1;
		} forEach _terrainPosArr;
		if (_findPos isEqualTo true) then
		{
			_terrainMarkerChosen = createMarker [format ["%1MarkerChosen_%2",_locationDescription,_terrainPos],_terrainPos];
			RELO_var_locationMrksDebug pushBackUnique _terrainMarkerChosen;
			_terrainMarkerChosen setMarkerShape "RECTANGLE";
			_terrainMarkerChosen setMarkerSize [_maxRadius * 2,_maxRadius * 2];
			_terrainMarkerChosen setMarkerColor _locationMarkerColor;
			_terrainMarkerChosen setMarkerAlpha 1;
			if !(_terrainPos isEqualTo [0,0,0]) then
			{
				format ["   + %1 position found at grid position %2",_locationDescription,mapGridPosition _terrainPos] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log format ["   + %1 position found at grid position %2",_locationDescription,mapGridPosition _terrainPos];
			}
			else
			{
				format ["   - %1 position not found!",_locationDescription] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log format ["   - %1 position not found!",_locationDescription];
			};
		}
		else
		{
			format ["   + %1 %2 position(s) found",count _terrainPosArr,_locationDescription] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log format ["   + %1 %2 position(s) found",count _terrainPosArr,_locationDescription];
		};
	#endif
}
else
{
	#ifdef __DEBUG__
		format ["   - no %1 positions found",_locationDescription] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["   - no %1 positions found",_locationDescription];
	#endif
};
///////////////////////////////////////////////////////////////////////////////////////////////
deleteMarker _terrainMarker;
///////////////////////////////////////////////////////////////////////////////////////////////
if (_findPos isEqualTo false) then
{
	RELO_var_locationDeepWaterArr = _terrainPosArr;
};

_terrainPos
