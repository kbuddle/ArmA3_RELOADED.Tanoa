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

	Name: fn_objectsGrabber.sqf
	Version: 1.0.0
	Author: soulkobk (soulkobk.blogspot.com) - credit to Sa-Matra for original base code
	Creation Date: 00:00 PM 01/07/2017
	Modification Date: 00:00 PM 01/07/2017

	Description:
	this script was created for RELOADED mission in order to be able to create base compositions
	within EDEN editor and export them as code that RELOADED mission understands.
	

	Parameter(s): none

	Example:
	copy/paste the below code in to eden debug console and execute it when the base composition
	is complete. paste the clipboard contents in to a <base composition>.sqf text file.
	
	all base composition scripts are placed within the appropriate \bases directory. update tasks
	to use the base composition within the \tasks directory, in the appropriate *Config.sqf file(s).

	Change Log:
	1.0.0 -	original base script.

	----------------------------------------------------------------------------------------------
*/

sortObjects = {
	params ["_objects"];
	_sorted = [];
	{
		_object = _x;
		_typeOf = typeOf _object;
		_sorted pushBack [_typeOf,_object];
	} forEach _objects;
	_sorted sort true;
	_sorted
};

getRelativePositions = {
	params ["_objects","_centerPoint","_centerRadius"];

	_br = toString [13, 10];
	_tab = toString [9];

	_str = "";
	_str = "/*" + _br + _tab + "fn_objectsGrabber for EDEN editor by soulkobk." + _br;
	_str = _str + _tab + "revision: 20171123" + _br;
	_str = _str + _br;
	_str = _str + _tab + "mission: " + (if (missionName == "") then {"unnamed"} else {missionName}) + _br;
	_str = _str + _tab + "world: " + worldName + _br;
	_str = _str + _tab + "center position: " + (str (_centerPoint)) + _br;
	_str = _str + _tab + "radius: " + (str _centerRadius) + _br;
	_str = _str + _br;
	_str = _str + _tab + "array list: [objectClass, objectPosition, objectDirection, objectSimulation, objectSimpleObject, objectPitchBank, objectDamage, objectAllowDamage, objectVarName, objectInit]" + _br;
	_str = _str + _br;
	_str = _str + _tab + "to set object as task object, place in init of object = this setVariable ['taskObject',true];" + _br;
	_str = _str + _tab + "to damage/disable/lock vehicle (true to lock), place in init of object = [this,true] call RELO_fnc_vehicleDisable;" + _br;
	_str = _str + _tab + "to do a random crate loadout, place in init of object = [this] call RELO_fnc_randomContainerLoadout;" + _br;
	_str = _str + _br;
	_str = _str + _tab + "make sure as many objects as possible have simulation turned off, or simple object enabled!";
	_str = _str + _br;
	_str = _str + "*/" + _br + _br + "[" + _br;
	
	{
		_typeOf = _x select 0;
		_object = _x select 1;
		
		private ["_relPos"];
		_objectPos = (getPosATL _object);
		_relPos = _centerPoint vectorAdd ([_objectPos, 0] call BIS_fnc_rotateVector2D);
		_objectSimulation = _object get3DENAttribute "enableSimulation" select 0;
		_objectSimpleObject = _object get3DENAttribute "objectIsSimple" select 0;
		_objectPitchBank = _object call BIS_fnc_getPitchBank;
		_objectDamage = _object get3DENAttribute "health" select 0;
		switch (_objectDamage) do
		{
			case 1: {_objectDamage = 0;};
			default {_objectDamage = 1 - (abs (_objectDamage - 1));};
		};
		_objectAllowDamage = _object get3DENAttribute "allowDamage" select 0;
		_objectVarName = _object get3DENAttribute "name" select 0;
		_objectInit = _object get3DENAttribute "init" select 0;
		
		_line = [_typeOf, _relPos, getDir _object, _objectSimulation, _objectSimpleObject, _objectPitchBank, _objectDamage, _objectAllowDamage, _objectVarName, _objectInit];
		
		_str = _str + _tab + (str _line);
		if (_forEachIndex < ((count _objects) - 1)) then
		{
			_str = _str + "," + _br;
		}
		else
		{
			_str = _str + _br;
		};
	} forEach _objects;
	_str = _str + "]" + _br;
	copyToClipboard _str;
	_str
};

_centerPoint = [0,0,0];
_centerRadius = 100;
_objects = nearestObjects [_centerPoint, ["ALL"], _centerRadius];
_logics = nearestObjects [_centerPoint, ["LOGIC"], _centerRadius];
_filteredObjects = _objects - _logics;
_filteredObjects = [_filteredObjects] call sortObjects;

[_filteredObjects,_centerPoint,_centerRadius] call getRelativePositions;
