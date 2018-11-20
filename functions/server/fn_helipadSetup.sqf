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

	Name: fn_helipadSetup.sqf
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

RELO_fncl_helipadSetup = {
	_helipads = (allMissionObjects "ALL") select {["bluforBaseHelipad", str _x] call BIS_fnc_inString};
	if !(_helipads isEqualTo []) then
	{
		{
			_helipad = _x;
			_helipadPos = getPos _helipad;
			_helipadDir = getDir _helipad;
			_helipadTrigger = createTrigger ["EmptyDetector", _helipadPos, true];
			_helipadTrigger setTriggerArea [6,6,_helipadDir,true,6];
			_helipadTrigger setTriggerActivation ["WEST", "PRESENT", true];
			_helipadTrigger setTriggerStatements [ \
				"
					(((objectParent player) in thisList) && ((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player)) && (isTouchingGround (objectParent player)));
				", \
				"
					0 = [] spawn
					{
						if (((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player)) && (isTouchingGround (objectParent player))) then
						{
							['UNLOCKED HELICOPTER\nAll Seats Are Now Unlocked!', 1] call RELO_fnc_titleTextGlobal;
							{
								(objectParent player) lockTurret [_x, false];
							} forEach (allTurrets [(objectParent player), true]);
							{
								(objectParent player) lockCargo [(_x select 2), false];
							} forEach (fullCrew [(objectParent player),'cargo',true]);
							(objectParent player) setVariable ['isLocked',false,true];
						};
					};
				", \
				"
					0 = [] spawn
					{
						if (((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player)) && !(isTouchingGround (objectParent player))) then
						{
							['LOCKED HELICOPTER\nLand On A Helipad To Unlock Or Exit Base Area!', 1] call RELO_fnc_titleTextGlobal;
							{
								(objectParent player) lockTurret [_x, true];
							} forEach (allTurrets [(objectParent player), true]);
							{
								(objectParent player) lockCargo [(_x select 2), true];
							} forEach (fullCrew [(objectParent player),'cargo',true]);
							(objectParent player) setVariable ['isLocked',true,true];
						};
					};
				" \
			];
			if (isServer) then
			{
				_helipadPos = getPos _helipad;
				_helipadPos set [2,-1];
				_helipadDir = getDir _helipad;
				_boundingBoxReal = boundingBoxReal _helipad;
				_helipadDimension = _boundingBoxReal select 0;
				_helipadMkr = createMarker [format ["RELO_mkr_helipad_%1",_helipadPos],_helipadPos];
				_helipadMkr setMarkerColor "ColorBLUFOR";
				_helipadMkr setMarkerShape "RECTANGLE";
				_helipadMkr setMarkerAlpha 1;
				_helipadMkr setMarkerBrush "SOLIDBORDER";
				_helipadMkr setMarkerSize [(_helipadDimension select 0),(_helipadDimension select 1)];
				_helipadMkr setMarkerDir _helipadDir;

				_helipadMkr = createMarker [format ["RELO_mkr_helipadIcon_%1",_helipadPos],_helipadPos];
				_helipadMkr setMarkerColor "colorBLUFOR";
				_helipadMkr setMarkerShape "ICON";
				_helipadMkr setMarkerAlpha 1;
				_helipadMkr setMarkerType "n_air";
				_helipadMkr setMarkerSize [0.5,0.5];
				diag_log format ["[INIT] -> Heli Pad Setup (Helipad Lock Trigger) @ Grid Position %1", mapGridPosition _helipad];
			};
		} forEach _helipads;
	};
};

publicVariable "RELO_fncl_helipadSetup";
[] call RELO_fncl_helipadSetup;
remoteExecCall ["RELO_fncl_helipadSetup",-2,true];
