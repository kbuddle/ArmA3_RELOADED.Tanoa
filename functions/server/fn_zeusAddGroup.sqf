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

	Name: fn_zeusAddGroup.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description:

	Parameter(s):

	Example:

	Change Log:
	1.0 - original base script for object delete.

	----------------------------------------------------------------------------------------------
*/

params ["_curator","_placed"];

_nameOfCurator = _curator getVariable ["name","UNKNOWN"];

{
	_x addCuratorEditableObjects [(units _placed),true];

	_x addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
	_x setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];

} forEach (allCurators - [_curator]);

_typeOfObject = typeOf _placed;
_locationOfObject = mapGridPosition (getPos _placed);

/* format ["[ZEUS] %1(%2) placed group %3(%4) at grid position %5.",_curator,_nameOfCurator,_placed,_typeOfObject,_locationOfObject] call RELO_fnc_systemChatGlobal; */
/* format ["[ZEUS] %1(%2) placed group %3(%4) at grid position %5.",_curator,_nameOfCurator,_placed,_typeOfObject,_locationOfObject]; */
