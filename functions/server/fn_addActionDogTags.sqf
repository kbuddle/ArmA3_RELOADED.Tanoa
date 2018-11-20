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
	
	Name: fn_addActionDogTags.sqf
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

params ["_unit"];

_percentageOfDogTags = 50;

_wasAdded = false;
if (_percentageOfDogTags > (round(random 99))) then
{
	_unitDogTags = [_unit, ["Collect Dog Tags", {player playAction 'PutDown'; ["DOGTAG",['DOG TAGS COLLECTED','+1 Score Added']] call RELO_fnc_notificationGlobal; [(_this select 1),1] remoteExec ["RELO_fnc_addScorePlayer",2,false]; (_this select 0) setVariable ["dogTagsTaken",true,true];},nil,1.5,true,true,"","!(alive _target) && !(_target getVariable ['dogTagsTaken',false])",3,false,""]] remoteExec ["addAction",0,_unit];
	_unit setVariable ["dogTagsTaken",false,true];
	_wasAdded = true;
};

_wasAdded
