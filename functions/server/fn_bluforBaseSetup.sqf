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

	Name: fn_bluforBaseSetup.sqf
	Version: 1.0.1
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 8:28 PM 12/12/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 - original base script.
	1.0.1 - added in no fire zone for autonomous vehicles, removed 3d sound clicks.
	1.0.2 - fixed player check error for no fire zone (forgot to remove autonomous).

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {};

RELO_fncl_bluforBaseSetup = {
	_bluforBaseZones = (allMapMarkers) select {["bluforBase", str _x] call BIS_fnc_inString};
	if !(_bluforBaseZones isEqualTo []) then
	{
		{
			// set up lock heli zone
			_lockHeliZone = _x;
			_lockHeliZonePos = markerPos _lockHeliZone;
			_lockHeliZoneDir = markerDir _lockHeliZone;
			_lockHeliZoneSize = markerSize _lockHeliZone select 0;
			_lockHeliZoneTrigger = createTrigger ["EmptyDetector", _lockHeliZonePos, true];
			_lockHeliZoneTrigger setTriggerArea [_lockHeliZoneSize,_lockHeliZoneSize,_lockHeliZoneDir,false,_lockHeliZoneSize];
			_lockHeliZoneTrigger setTriggerActivation ["WEST", "PRESENT", true];
			_lockHeliZoneTrigger setTriggerStatements [ \
				"
					(((objectParent player) in thisList) && ((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player)));
				", \
				"
					0 = [] spawn
					{
						if (((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player))) then
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
				", \
				"
					0 = [] spawn
					{
						if (((driver (objectParent player)) isEqualTo player) && (alive (objectParent player)) && ((objectParent player) isKindOf 'Helicopter') && (!isNull assignedDriver (objectParent player))) then
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
				" \
			];
			if (isServer) then
			{
				diag_log format ["[INIT] -> Blufor Base Setup (Heli Lock Zone Trigger) @ Grid Position %1", mapGridPosition _lockHeliZonePos];
			};
			// set up no fire zone
			_noFireZonePlayer = _x;
			_noFireZonePlayerPos = markerPos _noFireZonePlayer;
			_noFireZonePlayerDir = markerDir _noFireZonePlayer;
			_noFireZonePlayerSize = markerSize _noFireZonePlayer select 0;
			_noFireZonePlayerTrigger = createTrigger ["EmptyDetector", _noFireZonePlayerPos, true];
			_noFireZonePlayerTrigger setTriggerArea [_noFireZonePlayerSize,_noFireZonePlayerSize,_noFireZonePlayerDir,false,_noFireZonePlayerSize];
			_noFireZonePlayerTrigger setTriggerActivation ["WEST", "PRESENT", true];
			_noFireZonePlayerTrigger setTriggerStatements [ \
				"
					((vehicle player) in thisList);
				", \
				"
					0 = [] spawn
					{
						waitUntil {!(isNull player)};
						noBaseFireActionEventHandlerPlayer = player addEventHandler ['Fired', {
							_unit = _this select 0;
							_class = _this select 5;
							_projectile = _this select 6;
							deleteVehicle _projectile;
							titleText ['NO FIRE ZONE','PLAIN'];
							_unit addItem _class;
						}];
						noBaseFireActionPlayer = player addAction ['NO FIRE ZONE', {titleText ['NO FIRE ZONE','PLAIN'];}, '', 0, false, true, 'DefaultAction'];
					};
				", \
				"
					0 = [] spawn
					{
						waitUntil {!(isNull player)};
						player removeEventHandler ['Fired', noBaseFireActionEventHandlerPlayer];
						player removeAction noBaseFireActionPlayer;
					};
				" \
			];
						// noBaseFireActionPlayer = player addAction ['NO FIRE ZONE', {playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', (_this select 0), false, eyePos (_this select 0)]; titleText ['NO FIRE ZONE','PLAIN'];}, '', 0, false, true, 'DefaultAction'];
							// playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _unit, false, eyePos _unit];
			if (isServer) then
			{
				diag_log format ["[INIT] -> Blufor Base Setup (No Base Fire Zone Trigger For Players) @ Grid Position %1", mapGridPosition _noFireZonePlayerPos];
			};
			// set up no fire zone for autonomous vehicles
			_noFireZoneAutonomous = _x;
			_noFireZoneAutonomousPos = markerPos _noFireZoneAutonomous;
			_noFireZoneAutonomousDir = markerDir _noFireZoneAutonomous;
			_noFireZoneAutonomousSize = markerSize _noFireZoneAutonomous select 0;
			_noFireZoneAutonomousTrigger = createTrigger ["EmptyDetector", _noFireZoneAutonomousPos, true];
			_noFireZoneAutonomousTrigger setTriggerArea [_noFireZoneAutonomousSize,_noFireZoneAutonomousSize,_noFireZoneAutonomousDir,false,_noFireZoneAutonomousSize];
			_noFireZoneAutonomousTrigger setTriggerActivation ["WEST", "PRESENT", true];
			_noFireZoneAutonomousTrigger setTriggerStatements [ \
				"
					((getConnectedUAV player) in thisList);
				", \
				"
					0 = [] spawn
					{
						waitUntil {!(isNull (getConnectedUAV player))};
						noBaseFireActionEventHandlerAutonomous = (getConnectedUAV player) addEventHandler ['Fired', {
							_unit = _this select 0;
							_class = _this select 5;
							_projectile = _this select 6;
							deleteVehicle _projectile;
							titleText ['NO FIRE ZONE','PLAIN'];
							_unit addItem _class;
						}];
						noBaseFireActionAutonomous = (getConnectedUAV player) addAction ['NO FIRE ZONE', {titleText ['NO FIRE ZONE','PLAIN'];}, '', 0, false, true, 'DefaultAction'];
					};
				", \
				"
					0 = [] spawn
					{
						waitUntil {!(isNull (getConnectedUAV player))};
						(getConnectedUAV player) removeEventHandler ['Fired', noBaseFireActionEventHandlerAutonomous];
						(getConnectedUAV player) removeAction noBaseFireActionAutonomous;
					};
				" \
			];
						// noBaseFireActionAutonomous = (getConnectedUAV player) addAction ['NO FIRE ZONE', {playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', (_this select 0), false, eyePos (_this select 0)]; titleText ['NO FIRE ZONE','PLAIN'];}, '', 0, false, true, 'DefaultAction'];
							// playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _unit, false, eyePos _unit];
			if (isServer) then
			{
				diag_log format ["[INIT] -> Blufor Base Setup (No Base Fire Zone Trigger For Autonomous Vehicles) @ Grid Position %1", mapGridPosition _noFireZoneAutonomousPos];
			};
		} forEach _bluforBaseZones;
	};
};

publicVariable "RELO_fncl_bluforBaseSetup";
[] call RELO_fncl_bluforBaseSetup;
remoteExecCall ["RELO_fncl_bluforBaseSetup",-2,true];
