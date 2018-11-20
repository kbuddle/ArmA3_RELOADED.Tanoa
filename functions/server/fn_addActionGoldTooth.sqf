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
	
	Name: fn_addActionGoldTooth.sqf
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

_percentageOfGoldTooth = 10;

_wasAdded = false;
if (_percentageOfGoldTooth > (round(random 99))) then
{
	_unitGoldTooth = [_unit, ["Collect Gold Tooth", {player playAction 'PutDown'; ["TOOTH",['GOLD TOOTH COLLECTED','+10 Score Added']] call RELO_fnc_notificationGlobal; [(_this select 1),10] remoteExec ["RELO_fnc_addScorePlayer",2,false]; (_this select 0) setVariable ["goldToothTaken",true,true];},nil,1.5,true,true,"","!(alive _target) && !(_target getVariable ['goldToothTaken',false])",3,false,""]] remoteExec ["addAction",0,_unit];
	_unit setVariable ["goldToothTaken",false,true];
	_wasAdded = true;
};

_wasAdded
