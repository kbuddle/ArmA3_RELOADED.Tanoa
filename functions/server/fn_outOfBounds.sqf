/*
	----------------------------------------------------------------------------------------------

	Copyright © 2016 soulkobk (soulkobk.blogspot.com)

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

	Name: fn_outOfBounds.sqf
	Version: 1.0.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 9:33 PM 04/07/2016
	Modification Date: 8:11 PM 21/07/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 -	original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {};

_mapSizeSquare = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
_mapSizeEllipse = sqrt ((_mapSizeSquare * _mapSizeSquare) + (_mapSizeSquare * _mapSizeSquare));
_mapCenterPos = [(_mapSizeSquare / 2),(_mapSizeSquare / 2)];

_mkrInBounds = createMarker ["RELO_mkr_playableArea",_mapCenterPos];
_mkrInBounds setMarkerColor "ColorBlue";
_mkrInBounds setMarkerShape "ELLIPSE";
_mkrInBounds setMarkerBrush "BORDER";
_mkrInBounds setMarkerAlpha 1;
_mkrInBounds setMarkerSize [(_mapSizeEllipse / 1.5),(_mapSizeEllipse / 1.5)];

diag_log "[INIT] -> Out Of Bounds";

RELO_fncl_outOfBounds =
{

	_maxTime = 20; // 20 seconds max default
	_maxHeight = 5000; // 5000m height max default

	/*	------------------------------------------------------------------------------------------
		DO NOT EDIT BELOW HERE!
		------------------------------------------------------------------------------------------	*/

	if (hasInterface) then
	{
		if (!isNil "oobCheck") exitWith {};
		[_maxTime,_maxHeight] spawn
		{
			scriptName "RELO_fncl_outOfBounds";
			params ["_maxTime","_maxHeight"];
			_inLoop = false;
			_loopForever = true;
			while {_loopForever} do
			{
				waitUntil {uiSleep 0.1; alive player};
				if (alive player) then
				{
					_outOfBounds = !(player inArea "RELO_mkr_playableArea");
					_outOfBoundsAltitude = (getPos player select 2 > _maxHeight);
					if (((_outOfBounds) || (_outOfBoundsAltitude)) && (!_inLoop)) then
					{
						_inLoop = true;
						_inLoopTimer = _maxTime;
						_secondsText = "";
						while {(_outOfBounds) || (_outOfBoundsAltitude)} do
						{
							if (_inLoopTimer > 1) then
							{
								_secondsText = "SECONDS";
							}
							else
							{
								_secondsText = "SECOND";
							};
							_oobText = format ["YOU ARE OUTSIDE OF THE PLAYABLE AREA!\n\nYOU HAVE %1 %2 TO BE INSIDE THE PLAYABLE AREA AND UNDER %3M ALTITUDE!",_inLoopTimer,_secondsText,_maxHeight];
							[_oobText, 1] call RELO_fnc_titleTextGlobal;
							playSound "Alarm";
							uiSleep 1;
							_inLoopTimer = _inLoopTimer - 1;
							if (_inLoopTimer isEqualTo 0) exitWith
							{
								vehicle player setDamage 1;
								player setDamage 1;
							};
							_outOfBounds = !(player inArea "RELO_mkr_playableArea");
							_outOfBoundsAltitude = (getPos player select 2 > _maxHeight);
						};
						if (alive player) then
						{
							_oobText = "YOU ARE BACK INSIDE THE PLAYABLE AREA!";
							[_oobText, 1] call RELO_fnc_titleTextGlobal;
						}
						else
						{
							_oobText = "YOU WERE OUTSIDE OF THE PLAYABLE AREA FOR TOO LONG AND HAVE BEEN KILLED!";
							[_oobText, 1] call RELO_fnc_titleTextGlobal;
						};
						_inLoop = false;
						_outOfBounds = false;
						_outOfBoundsAltitude = false;
					};
				};
				uiSleep 1;
			};
		};
	};
};

publicVariable "RELO_fncl_outOfBounds";
[] call RELO_fncl_outOfBounds;
remoteExecCall ["RELO_fncl_outOfBounds",-2,true];
