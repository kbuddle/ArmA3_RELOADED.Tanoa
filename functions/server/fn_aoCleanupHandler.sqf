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

	Name: fn_aoCleanupHandler.sqf
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
if (RELO_var_locationMkrCurr isEqualTo "") exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
// #ifdef __DEBUG__
	// " ! area of operations, cleaning initiated" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log " ! area of operations, cleaning initiated";
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationTasksActive isEqualTo []) then
{
	{
		[_x] call BIS_fnc_deleteTask;
	} forEach RELO_var_locationTasksActive;
	RELO_var_locationTasksActive = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationTasksFinished isEqualTo []) then
{
	{
		[_x] call BIS_fnc_deleteTask;
	} forEach RELO_var_locationTasksFinished;
	RELO_var_locationTasksFinished = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationObjects isEqualTo []) then
{
	{
		deleteVehicle _x;
	} forEach RELO_var_locationObjects;
	RELO_var_locationObjects = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrsExempt isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach RELO_var_locationMkrsExempt;
	RELO_var_locationMkrsExempt = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrsTask isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach RELO_var_locationMkrsTask;
	RELO_var_locationMkrsTask = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMrksDebug isEqualTo []) then
{
	{
		deleteMarker _x;
	} forEach RELO_var_locationMrksDebug;
	RELO_var_locationMrksDebug = [];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrPreviousPrevious isEqualTo "") then
{
	{
		if (((getMarkerPos _x) inArea RELO_var_locationMkrPreviousPrevious) && (["_USER_DEFINED", _x] call BIS_fnc_inString)) then
		{
			deleteMarker _x;
		}
	} forEach allMapMarkers;
	deleteMarker RELO_var_locationMkrPreviousPrevious;
	deleteMarker RELO_var_locationMkrPreviousSectorPrevious;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrPrevious isEqualTo "") then
{
	RELO_var_locationMkrPreviousPrevious = createMarker [format ["RELO_mkr_locationPreviousPrevious_%1",RELO_var_locationMkrPreviousPos],RELO_var_locationMkrPreviousPos];
	RELO_var_locationMkrPreviousPreviousPos = RELO_var_locationMkrPreviousPos;
	RELO_var_locationMkrPreviousPreviousSize = RELO_var_locationMkrPreviousSize;
	RELO_var_locationMkrPreviousPrevious setMarkerShape "ELLIPSE";
	RELO_var_locationMkrPreviousPrevious setMarkerBrush "Solid";
	RELO_var_locationMkrPreviousPrevious setMarkerColor "colorBlack";
	RELO_var_locationMkrPreviousPrevious setMarkerAlpha 0;
	RELO_var_locationMkrPreviousPrevious setMarkerSize [(RELO_var_locationMkrPreviousSize * 3),(RELO_var_locationMkrPreviousSize * 3)];

	{
		if (RELO_var_locationMkrPreviousSectorPos inArea _x) exitWith
		{
			RELO_var_locationMkrPreviousSectorPrevious = createMarker [format ["RELO_mkr_locationPreviousPrevious_%1",RELO_var_locationMkrPreviousSectorPos],RELO_var_locationMkrPreviousSectorPos];
			RELO_var_locationMkrPreviousSectorPreviousPos = RELO_var_locationMkrPreviousSectorPos;
			RELO_var_locationMkrPreviousSectorPreviousSize = RELO_var_locationMkrPreviousSectorSize;
			RELO_var_locationMkrPreviousSectorPrevious setMarkerShape "RECTANGLE";
			RELO_var_locationMkrPreviousSectorPrevious setMarkerBrush "Solid";
			RELO_var_locationMkrPreviousSectorPrevious setMarkerColor "colorBlack";
			RELO_var_locationMkrPreviousSectorPrevious setMarkerAlpha 0;
			RELO_var_locationMkrPreviousSectorPrevious setMarkerSize RELO_var_locationMkrPreviousSectorSize;
		};
	} forEach ["exemptMarkerNorthWest","exemptMarkerNorthEast","exemptMarkerSouthWest","exemptMarkerSouthEast"];
	deleteMarker RELO_var_locationMkrPrevious;
	deleteMarker RELO_var_locationMkrPreviousSector;
};

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationMkrCurr isEqualTo "") then
{
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// instant mine cleanup
	{
		deleteVehicle _x;
	} forEach allMines select {_x inArea RELO_var_locationMkrCurrOuter};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// instant dropped items cleanup
	_cleanUpObjects =
	[
		"GroundWeaponHolder",
		"WeaponHolderSimulated"
	];
	_nearestObjects = nearestObjects [getMarkerPos RELO_var_locationMkrCurrOuter, _cleanUpObjects, selectMax (getMarkerSize RELO_var_locationMkrCurrOuter)];
	if (count _nearestObjects != 0) then
	{
		{
			deleteVehicle _x;
		} forEach _nearestObjects;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// instant dead cleanup
	{
		deleteVehicle _x;
	} forEach allDead select {_x inArea RELO_var_locationMkrCurrOuter};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////
	RELO_var_locationMkrPrevious = createMarker [format ["RELO_mkr_locationPrevious_%1",RELO_var_locationMkrPos],RELO_var_locationMkrPos];
	RELO_var_locationMkrPreviousPos = RELO_var_locationMkrPos;
	RELO_var_locationMkrPreviousSize = RELO_var_locationMkrSize;
	RELO_var_locationMkrPrevious setMarkerShape "ELLIPSE";
	RELO_var_locationMkrPrevious setMarkerBrush "Solid";
	RELO_var_locationMkrPrevious setMarkerColor "colorBlack";
	RELO_var_locationMkrPrevious setMarkerAlpha 0;
	RELO_var_locationMkrPrevious setMarkerSize [(RELO_var_locationMkrSize * 3),(RELO_var_locationMkrSize * 3)];
	///////////////////////////////////////////////////////////////////////////////////////////////////
	{
		if (RELO_var_locationMkrPos inArea _x) exitWith
		{
			RELO_var_locationMkrPreviousSector = createMarker [format ["RELO_mkr_locationPrevious_%1",getMarkerPos _x],getMarkerPos _x];
			RELO_var_locationMkrPreviousSectorPos = getMarkerPos _x;
			RELO_var_locationMkrPreviousSectorSize = getMarkerSize _x;
			RELO_var_locationMkrPreviousSector setMarkerShape "RECTANGLE";
			RELO_var_locationMkrPreviousSector setMarkerBrush "Solid";
			RELO_var_locationMkrPreviousSector setMarkerColor "colorBlack";
			RELO_var_locationMkrPreviousSector setMarkerAlpha 0;
			RELO_var_locationMkrPreviousSector setMarkerSize getMarkerSize _x;
		};
	} forEach ["exemptMarkerNorthWest","exemptMarkerNorthEast","exemptMarkerSouthWest","exemptMarkerSouthEast"];
	///////////////////////////////////////////////////////////////////////////////////////////////////
	{
		moveOut _x;
		_group = group _x;
		_numInGroup = count (units (group _x));
		deleteVehicle _x;
		if (_numInGroup isEqualTo 1) then
		{
			deleteGroup _group;
		};
	} forEach (allUnits - allPlayers) select {((_x getVariable ["unitBelongsToLocation","none"]) isEqualTo RELO_var_locationMkrCurr)};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	deleteMarker RELO_var_locationMkrCurr;
	deleteMarker RELO_var_locationMkrCurrInner;
	deleteMarker RELO_var_locationMkrCurrOuter;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(RELO_var_locationGroups isEqualTo []) then
{
	{
		deleteGroup _x;
	} forEach RELO_var_locationGroups;
};
RELO_var_locationGroups = [];
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationPatrolTroop = RELO_var_locationPatrolTroopINIT; // reset the number back to the original INIT
RELO_var_locationCOBTroop = RELO_var_locationCOBTroopINIT; // reset the number back to the original INIT
///////////////////////////////////////////////////////////////////////////////////////////////////
KRON_UPS_Exited = 0; // for Urban Patrol Script
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationEnemyCasualties = 0; // reset casualties back to 0
RELO_var_locationFriendlyCasualties = 0; // reset casualties back to 0
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	" ! area of operations, cleaning complete" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log " ! area of operations, cleaning complete";
#endif
