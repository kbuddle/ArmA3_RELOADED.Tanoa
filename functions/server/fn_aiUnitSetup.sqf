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
	
	Name: fn_aiUnitSetup.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 3:15 PM 05/08/2017
	Modification Date: 3:15 PM 05/08/2017
	
	Description: Invade & Annex - Main AO calculations

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

_soldier = param [0,objNull];
///////////////////////////////////////////////////////////////////////////////////////////////
if (_soldier isEqualTo objNull) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
if ((_soldier isKindOf "MAN") && (!isPlayer _soldier)) then
{
	_soldier setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_skillSet = selectRandom ["VERY LOW","LOW","REGULAR","MEDIUM"]; // full list = ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
	[_soldier,_skillSet] call RELO_fnc_aiSetSkill;
	///////////////////////////////////////////////////////////////////////////////////////////////
	_soldier addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
	///////////////////////////////////////////////////////////////////////////////////////////////
	_addDogTags = [_soldier] call RELO_fnc_addActionDogTags;
	_addGoldTooth = [_soldier] call RELO_fnc_addActionGoldTooth;
	///////////////////////////////////////////////////////////////////////////////////////////////
};
