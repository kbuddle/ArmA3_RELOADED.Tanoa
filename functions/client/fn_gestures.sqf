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
	
	Name: fn_gestures.sqf
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

if !(hasInterface) exitWith {};

disableSerialization;
waitUntil {!isNull(findDisplay 46)};
findDisplay 46 displayAddEventHandler ["KeyDown", {
	_handled = false;
	params ["_displayCode","_keyCode","_isShift","_isCtrl","_isAlt"];
    if (_keyCode isEqualTo 0x4F && _isCtrl) then {
        player playAction "gestureGo";
		_text = "go";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x50 && _isCtrl) then {
        player playAction "gestureNod";
		_text = "nod";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x51 && _isCtrl) then {
        player playAction "gestureFreeze";
		_text = "freeze";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x4B && _isCtrl) then {
        player playAction "gestureAdvance";
		_text = "advance";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x4C && _isCtrl) then {
        player playAction "gestureHi";
		_text = "hi";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x4D && _isCtrl) then {
        player playAction "gestureFollow";
		_text = "follow";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x47 && _isCtrl) then {
        player playAction "gestureYes";
		_text = "yes";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x48 && _isCtrl) then {
        player playAction "gesturePoint";
		_text = "point";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
    if (_keyCode isEqualTo 0x49 && _isCtrl) then {
        player playAction "gestureNo";
		_text = "no";
		[_text, 1] call RELO_fnc_titleTextGlobal;
		_handled = true;
    };
	_handled
}];
