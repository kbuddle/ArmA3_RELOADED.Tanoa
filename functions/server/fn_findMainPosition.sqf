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

	Name: fn_findMainPosition.sqf
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
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
#define BETWEEN(COMPARE,START,END) (if ((COMPARE > START) && (COMPARE <= END)) then {true} else {false})
///////////////////////////////////////////////////////////////////////////////////////////////////
if (RELO_var_locationMkrPrevious isEqualTo "") then
{
	RELO_var_locationMkrs = [];
	{
		if (["RELO_mkr_location_", _x] call BIS_fnc_inString) then
		{
			RELO_var_locationMkrs pushBack _x;
			#ifdef __DEBUG__
				_locationMarkerTemp = createMarker [format ["locationMarkerTemp_%1",getMarkerPos _x],getMarkerPos _x];
				RELO_var_locationMrksDebug pushBack _locationMarkerTemp;
				_locationMarkerTemp setMarkerShape "ICON";
				_locationMarkerTemp setMarkerType "mil_circle";
				_locationMarkerTemp setMarkerSize [0.5,0.5];
				_locationMarkerTemp setMarkerColor "colorGreen";
				_locationMarkerTemp setMarkerAlpha 0.5;
			#endif
		};
	} forEach allMapMarkers;
}
else
{
	RELO_var_locationMkrs = [];
	{
		if (["RELO_mkr_location_", _x] call BIS_fnc_inString) then
		{
			if (!((getMarkerPos _x) inArea RELO_var_locationMkrPrevious) && !((getMarkerPos _x) inArea RELO_var_locationMkrPreviousPrevious) && !((getMarkerPos _x) inArea RELO_var_locationMkrPreviousSector) && !((getMarkerPos _x) inArea RELO_var_locationMkrPreviousSectorPrevious)) then
			{
				RELO_var_locationMkrs pushBack _x;
				#ifdef __DEBUG__
					_locationMarkerTemp = createMarker [format ["locationMarkerTemp_%1",getMarkerPos _x],getMarkerPos _x];
					RELO_var_locationMrksDebug pushBack _locationMarkerTemp;
					_locationMarkerTemp setMarkerShape "ICON";
					_locationMarkerTemp setMarkerType "mil_circle";
					_locationMarkerTemp setMarkerSize [0.5,0.5];
					_locationMarkerTemp setMarkerColor "colorGreen";
					_locationMarkerTemp setMarkerAlpha 0.5;
				#endif
			};
			#ifdef __DEBUG__
				_locationMarkerTemp = createMarker [format ["locationMarkerTemp_%1",getMarkerPos _x],getMarkerPos _x];
				RELO_var_locationMrksDebug pushBack _locationMarkerTemp;
				_locationMarkerTemp setMarkerShape "ICON";
				_locationMarkerTemp setMarkerType "mil_circle";
				_locationMarkerTemp setMarkerSize [0.5,0.5];
				_locationMarkerTemp setMarkerColor "colorRed";
				_locationMarkerTemp setMarkerAlpha 0.5;
			#endif
		};
	} forEach allMapMarkers;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrMain = selectRandom RELO_var_locationMkrs;

// for testing purposes...
// RELO_var_locationMkrMain = "testRELO_mkr_location_0"; // water bases

///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrPos = getMarkerPos RELO_var_locationMkrMain;
RELO_var_locationTerrainDir = round(random 360);
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrPos = [RELO_var_locationMkrPos, round(random 500), round(random 360)] call BIS_fnc_relPos; // randomize the position from the marker position
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	_locationMarkerTemp = createMarker [format ["locationMarkerTemp_%1",RELO_var_locationMkrPos],RELO_var_locationMkrPos];
	RELO_var_locationMrksDebug pushBack _locationMarkerTemp;
	_locationMarkerTemp setMarkerShape "ICON";
	_locationMarkerTemp setMarkerType "mil_arrow2";
	_locationMarkerTemp setMarkerSize [0.5,0.5];
	_locationMarkerTemp setMarkerDir RELO_var_locationTerrainDir;
	_locationMarkerTemp setMarkerColor "colorRed";
	_locationMarkerTemp setMarkerAlpha 0.5;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrSize = 0;
RELO_var_locationTaskAmount = 0;
RELO_var_locationSimpleTaskAmount = 0;
RELO_var_locationTroopAmount = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
switch (floor(random 3)) do
{
	case 0: { RELO_var_locationMkrSize = selectRandom [600,650,700]; RELO_var_locationTaskAmount = selectRandom [2,3]; RELO_var_locationSimpleTaskAmount = selectRandom [2,3]; RELO_var_locationTroopAmount = 114; }; // max troop = 114
	case 1: { RELO_var_locationMkrSize = selectRandom [650,700,850]; RELO_var_locationTaskAmount = selectRandom [3,4]; RELO_var_locationSimpleTaskAmount = selectRandom [3,4]; RELO_var_locationTroopAmount = 128; }; // max troop = 128
	case 2: { RELO_var_locationMkrSize = selectRandom [700,850,900]; RELO_var_locationTaskAmount = selectRandom [4,5]; RELO_var_locationSimpleTaskAmount = selectRandom [4,5]; RELO_var_locationTroopAmount = 142; }; // max troop = 142
};
// switch (floor(random 3)) do
// {
	// case 0: { RELO_var_locationMkrSize = selectRandom [600,650,700]; RELO_var_locationTaskAmount = selectRandom [3,4]; RELO_var_locationSimpleTaskAmount = selectRandom [3,4]; RELO_var_locationTroopAmount = 114; }; // max troop = 114
	// case 1: { RELO_var_locationMkrSize = selectRandom [650,700,850]; RELO_var_locationTaskAmount = selectRandom [4,5]; RELO_var_locationSimpleTaskAmount = selectRandom [4,5]; RELO_var_locationTroopAmount = 128; }; // max troop = 128
	// case 2: { RELO_var_locationMkrSize = selectRandom [700,850,900]; RELO_var_locationTaskAmount = selectRandom [5,6]; RELO_var_locationSimpleTaskAmount = selectRandom [5,6]; RELO_var_locationTroopAmount = 142; }; // max troop = 142
// };
/*/
#ifdef __DEBUG__
	// random for debug
	switch (floor(random 3)) do
	{
		// case 0: { RELO_var_locationMkrSize = selectRandom [600,700,800]; RELO_var_locationTaskAmount = selectRandom [4,5,6]; RELO_var_locationSimpleTaskAmount = selectRandom [1,2,3]; RELO_var_locationTroopAmount = 160; }; // max troop = 114
		// case 1: { RELO_var_locationMkrSize = selectRandom [700,800,900]; RELO_var_locationTaskAmount = selectRandom [5,6,7]; RELO_var_locationSimpleTaskAmount = selectRandom [2,3,4]; RELO_var_locationTroopAmount = 170; }; // max troop = 128
		// case 2: { RELO_var_locationMkrSize = selectRandom [800,900,1000]; RELO_var_locationTaskAmount = selectRandom [6,7,8]; RELO_var_locationSimpleTaskAmount = selectRandom [3,4,5]; RELO_var_locationTroopAmount = 180; }; // max troop = 142
		case 0: { RELO_var_locationMkrSize = selectRandom [600,700,800]; RELO_var_locationTaskAmount = selectRandom [4,5,6]; RELO_var_locationSimpleTaskAmount = selectRandom [1,2,3]; RELO_var_locationTroopAmount = 114; }; // max troop = 114
		case 1: { RELO_var_locationMkrSize = selectRandom [700,800,900]; RELO_var_locationTaskAmount = selectRandom [5,6,7]; RELO_var_locationSimpleTaskAmount = selectRandom [2,3,4]; RELO_var_locationTroopAmount = 128; }; // max troop = 128
		case 2: { RELO_var_locationMkrSize = selectRandom [800,900,1000]; RELO_var_locationTaskAmount = selectRandom [6,7,8]; RELO_var_locationSimpleTaskAmount = selectRandom [3,4,5]; RELO_var_locationTroopAmount = 142; }; // max troop = 142
	};
#else
	// size of AO and tasks dependent on number of current players
	switch (true) do
	{
		case (BETWEEN((count allPlayers),0,10)): { RELO_var_locationMkrSize = selectRandom [600,700,800]; RELO_var_locationTaskAmount = selectRandom [4,5,6]; RELO_var_locationSimpleTaskAmount = selectRandom [1,2,3]; RELO_var_locationTroopAmount = 114; };
		case (BETWEEN((count allPlayers),10,20)): { RELO_var_locationMkrSize = selectRandom [700,800,900]; RELO_var_locationTaskAmount = selectRandom [5,6,7]; RELO_var_locationSimpleTaskAmount = selectRandom [2,3,4]; RELO_var_locationTroopAmount = 128; };
		case (BETWEEN((count allPlayers),30,40)): { RELO_var_locationMkrSize = selectRandom [800,900,1000]; RELO_var_locationTaskAmount = selectRandom [6,7,8]; RELO_var_locationSimpleTaskAmount = selectRandom [3,4,5]; RELO_var_locationTroopAmount = 142; };
		// case (BETWEEN((count allPlayers),40,50)): { RELO_var_locationMkrSize = selectRandom [900,1000,1100]; RELO_var_locationTaskAmount = selectRandom [7,8,9]; RELO_var_locationSimpleTaskAmount = selectRandom [4,5,6]; RELO_var_locationTroopAmount = 190; };
		// case (BETWEEN((count allPlayers),50,60)): { RELO_var_locationMkrSize = selectRandom [1000,1100,1200]; RELO_var_locationTaskAmount = selectRandom [8,9,10]; RELO_var_locationSimpleTaskAmount = selectRandom [5,6,7]; RELO_var_locationTroopAmount = 200; };
	};
#endif
/*/
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrCurr = createMarker [format ["RELO_mkr_location_Location Patrol_%1",RELO_var_locationMkrPos],RELO_var_locationMkrPos];
RELO_var_locationMkrCurr setMarkerShape "ELLIPSE";
RELO_var_locationMkrCurr setMarkerBrush "FDiagonal";
RELO_var_locationMkrCurr setMarkerColor "colorRed";
RELO_var_locationMkrCurr setMarkerAlpha 0.5;
RELO_var_locationMkrCurr setMarkerSize [RELO_var_locationMkrSize + (RELO_var_locationMkrSize * RELO_var_locationExpansion),RELO_var_locationMkrSize + (RELO_var_locationMkrSize * RELO_var_locationExpansion)]; // 60% larger than actual
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrCurrInner = createMarker [format ["RELO_mkr_location_Location Patrol Inner_%1",RELO_var_locationMkrPos],RELO_var_locationMkrPos];
RELO_var_locationMkrCurrInner setMarkerShape "ELLIPSE";
RELO_var_locationMkrCurrInner setMarkerBrush "Border";
RELO_var_locationMkrCurrInner setMarkerColor "colorRed";
RELO_var_locationMkrCurrInner setMarkerAlpha 0;
RELO_var_locationMkrCurrInner setMarkerSize [RELO_var_locationMkrSize,RELO_var_locationMkrSize];
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrCurrOuter = createMarker [format ["RELO_mkr_location_Location Patrol Outer_%1",RELO_var_locationMkrPos],RELO_var_locationMkrPos];
RELO_var_locationMkrCurrOuter setMarkerShape "ELLIPSE";
RELO_var_locationMkrCurrOuter setMarkerBrush "Border";
RELO_var_locationMkrCurrOuter setMarkerColor "colorRed";
RELO_var_locationMkrCurrOuter setMarkerAlpha 0;
RELO_var_locationMkrCurrOuter setMarkerSize [RELO_var_locationMkrSize * 3,RELO_var_locationMkrSize * 3];
///////////////////////////////////////////////////////////////////////////////////////////////////

_fromPos = getMarkerPos "bluForBase";
_toPos = RELO_var_locationMkrPos;
_directionOfAO = [_fromPos,_toPos] call BIS_fnc_dirTo;
_distanceToAO = round(_fromPos distance2D _toPos);

_newAOlocation = "";
if (_directionOfAO >= 0 && _directionOfAO < 10) then {_newAOlocation = "N"}; // 0

if (_directionOfAO >= 10 && _directionOfAO < 30) then {_newAOlocation = "NNE"};
if (_directionOfAO >= 30 && _directionOfAO < 60) then {_newAOlocation = "NE"};
if (_directionOfAO >= 60 && _directionOfAO < 80) then {_newAOlocation = "ENE"};

if (_directionOfAO >= 80 && _directionOfAO < 100) then {_newAOlocation = "E"}; // 90

if (_directionOfAO >= 100 && _directionOfAO < 120) then {_newAOlocation = "ESE"};
if (_directionOfAO >= 120 && _directionOfAO < 150) then {_newAOlocation = "SE"};
if (_directionOfAO >= 150 && _directionOfAO < 170) then {_newAOlocation = "SSE"};

if (_directionOfAO >= 170 && _directionOfAO < 190) then {_newAOlocation = "S"}; // 180

if (_directionOfAO >= 190 && _directionOfAO < 210) then {_newAOlocation = "SSW"};
if (_directionOfAO >= 210 && _directionOfAO < 240) then {_newAOlocation = "SW"};
if (_directionOfAO >= 240 && _directionOfAO < 260) then {_newAOlocation = "WSW"};

if (_directionOfAO >= 260 && _directionOfAO < 280) then {_newAOlocation = "W"}; // 270

if (_directionOfAO >= 280 && _directionOfAO < 300) then {_newAOlocation = "WNW"};
if (_directionOfAO >= 300 && _directionOfAO < 330) then {_newAOlocation = "NW"};
if (_directionOfAO >= 330 && _directionOfAO < 360) then {_newAOlocation = "NNW"};

if (_directionOfAO >= 350 && _directionOfAO < 360) then {_newAOlocation = "N"}; // 360

///////////////////////////////////////////////////////////////////////////////////////////////////
_nearestLocation = text (nearestLocations [RELO_var_locationMkrPos, ["NameVillage", "NameCity", "NameCityCapital", "NameMarine", "NameLocal"],(RELO_var_locationMkrSize * 3)] select 0);
#ifdef __DEBUG__
	format [" ! new AO near %1 at size %2m diameter containing %3 tasks and %4 simple tasks, %5 total",_nearestLocation,(RELO_var_locationMkrSize * 2),RELO_var_locationTaskAmount,RELO_var_locationSimpleTaskAmount,(RELO_var_locationTaskAmount + RELO_var_locationSimpleTaskAmount)] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format [" ! new AO near %1 at size %2m diameter containing %3 tasks and %4 simple tasks, %5 total",_nearestLocation,(RELO_var_locationMkrSize * 2),RELO_var_locationTaskAmount,RELO_var_locationSimpleTaskAmount,(RELO_var_locationTaskAmount + RELO_var_locationSimpleTaskAmount)];
	// format [" * terrain scan direction is %1 degrees",RELO_var_locationTerrainDir] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log format [" * terrain scan direction is %1 degrees",RELO_var_locationTerrainDir];
	// sleep 5;
#endif

"[NATO INTELLIGENCE] scanning terrain for enemy activity via satellite..." remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
sleep round(random 5);
format ["[NATO INTELLIGENCE] a CSAT AO near %1 has been found %2m %3 of the NATO base!",_nearestLocation,_distanceToAO,_newAOlocation] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
sleep round(random 5);
"[NATO INTELLIGENCE] gathering intel on CSAT AO, refer to your map and task list for intel updates!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
sleep round(random 5);
