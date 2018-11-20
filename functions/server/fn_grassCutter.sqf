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

	Name: fn_grassCutter.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - credit to Sa-Matra for original base code
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description: Invade & Annex - Main AO calculations

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!

{
    if ((markerShape _x == "RECTANGLE") && (toLower _x find "grasscutter" == 0)) then
	{
    if (isServer) then
		{
			_marker = _x;
      _sin = sin markerDir _marker;
      _cos = cos markerDir _marker;
      markerSize _marker params ["_mw", "_mh"];
      markerPos _marker params ["_mx", "_my"];
      for "_i" from -_mw to _mw step 6 do
      {
        for "_j" from -_mh to _mh step 6 do
        {
          createVehicle ["Land_ClutterCutter_large_F", [_mx + _cos * _i + _sin * _j, _my + -_sin * _i + _cos * _j, 0], [], 0, "CAN_COLLIDE"];
        };
      };
			_nearTerrainPos = markerPos _marker;
			_nearTerrainSize = 0;
			if (_mw > _mh) then
			{
				_nearTerrainSize = _mw;
			}
			else
			{
				_nearTerrainSize = _mh;
			};
			_nearTerrain = nearestTerrainObjects [_nearTerrainPos, ["bush","tree","rock"], _nearTerrainSize];
			{
				_object = _x;
				if (_object inArea _marker) then
				{
					_x allowDamage false;
					_x hideObjectGlobal true;
				};
			} forEach _nearTerrain;
			deleteMarker _x; deleteMarkerLocal _x;
        };
		if (toLower _x find "grasscutter" == 0) then
		{
			deleteMarkerLocal _x;
		};
  };
} forEach allMapMarkers;
