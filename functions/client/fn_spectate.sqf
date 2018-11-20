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

	Name: fn_spectate.sqf
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

RELO_fncl_addLocations = {
	_taskIcon = "\A3\3den\Data\Displays\Display3DEN\PanelLeft\locationList_ca.paa";
	_natoBasePos = getMarkerPos "bluForBase";
	_natoBasePos set [2,20];
	["AddLocation", ["NATO Base","NATO Base","",_taskIcon,[_natoBasePos,[0,0,0],[0,0,0]],[0, false]]] call BIS_fnc_EGSpectator;
	_taskMarkerArray = allMapMarkers select {(["RELO_task_exactPos_",_x] call BIS_fnc_inString) isEqualTo true};
	{
		_taskMarker = _x;
		_taskMarkerName = _taskMarker splitString "_" select 3;
		_taskMarkerPos = getMarkerPos _taskMarker;
		_taskMarkerPos set [2,20];
		["AddLocation", [_taskMarkerName,_taskMarkerName,"",_taskIcon,[_taskMarkerPos,[0,0,0],[0,0,0]],[0, false]]] call BIS_fnc_EGSpectator;
	} forEach _taskMarkerArray;
};

RELO_fncl_deleteLocations = {
	_locationList = ["GetLocations"] call BIS_fnc_EGSpectator;
	{
		_location = _x;
		["RemoveLocation", _location] call BIS_fnc_EGSpectator;
	} forEach _locationList;
};

RELO_fncl_spectate = {
	params ["_isSpectating"];
	if (_isSpectating isEqualTo "true") then
	{
		playerSoundVolume = soundVolume;
		playerCameraView = cameraView;
		0.2 fadeSound 1;
		["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
		[] spawn {call RELO_fncl_addLocations};
		player hideObjectGlobal true;
		player allowDamage false;
	};
	if (_isSpectating isEqualTo "false") then
	{
		0.2 fadeSound playerSoundVolume;
		["Terminate"] call BIS_fnc_EGSpectator;
		[] spawn {call RELO_fncl_deleteLocations};
		player hideObjectGlobal false;
		player allowDamage true;
		player switchCamera playerCameraView;
		_isSpectating = nil;
	};
};

waitUntil {!(RELO_var_whiteListedSpectate isEqualTo [])};

_playerUID = getPlayerUID player;
_isWhiteListed = _playerUID in RELO_var_whiteListedSpectate;
if (_isWhiteListed isEqualTo true) then
{
	// in-game display, wait for in game display to initiate before adding display event handler.
	waitUntil {!isNull findDisplay 46};
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		_source = _this select 0; _keyCode = _this select 1; _isShift = _this select 2; _isCtrl = _this select 3; _isAlt = _this select 4;
		if (_keyCode isEqualTo 24) then // used SHIFT + CTRL + Y
		{
			"true" call RELO_fncl_spectate;
		};
	}];

	while {sleep 1; !(isNull findDisplay 46)} do // while in-game
	{
		// spectate display, display gets destroyed after closing spectate therefore the display event handler is also destroyed.
		waitUntil {!isNull findDisplay 60492};
		(findDisplay 60492) displayAddEventHandler ["KeyDown", {
			_source = _this select 0; _keyCode = _this select 1; _isShift = _this select 2; _isCtrl = _this select 3; _isAlt = _this select 4;
			if (_keyCode isEqualTo 24) then // used SHIFT + CTRL + Y
			{
				"false" call RELO_fncl_spectate;
			};
		}];
	};
};
