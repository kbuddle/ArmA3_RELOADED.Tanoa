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

	Name: fn_bluforBaseObjectRemoval.sqf
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

if !(isServer) exitWith {};

// "rd_line_5m.p3d", // these are unable to be hidden... pfft.

_removeObjects =
[
	"parkingmeter_01_f.p3d",
	"garbagebin_02_f.p3d"
];

_mapMarker = "bluforBase";
_markerPos = getMarkerPos _mapMarker;
_markerSize = selectMax (getMarkerSize _mapMarker);

_nearestObjects = (nearestObjects [_markerPos,[],_markerSize + 10]);

_objectDeleteInfoArr = [];
_objectDeleteAmountArr = [];

{
	_object = _x;
	_modelInfo = getModelInfo _object select 0;
	if !(isNil "_modelInfo") then
	{
		if (_modelInfo in _removeObjects) then
		{
			deleteVehicle _object;
			if !(isNull _object) then
			{
				_object setObjectTextureGlobal [0,""];
				_object hideObjectGlobal true;
			};
			if !(_modelInfo in _objectDeleteInfoArr) then
			{
				_objectDeleteInfoArr pushBack _modelInfo;
				_objectDeleteAmountArr pushBack 0;
			}
			else
			{
				_objectIndex = _objectDeleteInfoArr find _modelInfo;
				_objectDeleteAmount = _objectDeleteAmountArr select _objectIndex;
				_objectDeleteAmountArr set [_objectIndex,(_objectDeleteAmount + 1)];
			};
		};
	};
} forEach _nearestObjects;

{
	_object = _x;
	_objectIndex = _objectDeleteInfoArr find _object;
	_objectAmount = _objectDeleteAmountArr select _objectIndex;
	diag_log format ["[INIT] -> Blufor Base Removed %1 %2 Object(s) @ Grid Position %3",_objectAmount, _object, mapGridPosition _markerPos];
} forEach _objectDeleteInfoArr;
