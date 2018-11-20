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

	Name: fn_deployBuildingTroop.sqf
	Version: 1.0.1
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 8:28 PM 12/12/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
_soldierClasses =
[
	// "O_soldierU_AAA_F", // Asst. Missile Specialist (AA) - MENURBAN - VANILLA
	// "O_soldierU_AAR_F", // Asst. Autorifleman - MENURBAN - VANILLA
	// "O_soldierU_AAT_F", // Asst. Missile Specialist (AT) - MENURBAN - VANILLA
	// "O_soldierU_AA_F", // Missile Specialist (AA) - MENURBAN - VANILLA
	// "O_soldierU_AR_F", // Autorifleman - MENURBAN - VANILLA
	// "O_soldierU_AT_F", // Missile Specialist (AT) - MENURBAN - VANILLA
	// "O_soldierU_A_F", // Ammo Bearer - MENURBAN - VANILLA
	// "O_soldierU_exp_F", // Explosive Specialist - MENURBAN - VANILLA
	// "O_soldierU_F", // Rifleman - MENURBAN - VANILLA
	// "O_SoldierU_GL_F", // Grenadier - MENURBAN - VANILLA
	// "O_soldierU_LAT_F", // Rifleman (AT) - MENURBAN - VANILLA
	// "O_soldierU_medic_F", // Combat Life Saver - MENURBAN - VANILLA
	// "O_soldierU_M_F", // Marksman - MENURBAN - VANILLA
	// "O_soldierU_repair_F", // Repair Specialist - MENURBAN - VANILLA
	// "O_SoldierU_SL_F", // Squad Leader - MENURBAN - VANILLA
	// "O_soldierU_TL_F", // Team Leader - MENURBAN - VANILLA
	// "O_Soldier_AAA_F", // Asst. Missile Specialist (AA) - MENSUPPORT - VANILLA
	// "O_Soldier_AAR_F", // Asst. Autorifleman - MENSUPPORT - VANILLA
	// "O_Soldier_AAT_F", // Asst. Missile Specialist (AT) - MENSUPPORT - VANILLA
	"O_medic_F", // Combat Life Saver - MEN - VANILLA
	"O_engineer_F", // Engineer - MEN - VANILLA
	"O_HeavyGunner_F", // Heavy Gunner - MEN - MARK
	"O_Soldier_AA_F", // Missile Specialist (AA) - MEN - VANILLA
	"O_Soldier_AR_F", // Autorifleman - MEN - VANILLA
	"O_Soldier_AT_F", // Missile Specialist (AT) - MEN - VANILLA
	"O_Soldier_A_F", // Ammo Bearer - MEN - VANILLA
	"O_soldier_exp_F", // Explosive Specialist - MEN - VANILLA
	"O_Soldier_F", // Rifleman - MEN - VANILLA
	"O_Soldier_GL_F", // Grenadier - MEN - VANILLA
	"O_Soldier_LAT_F", // Rifleman (AT) - MEN - VANILLA
	"O_Soldier_lite_F", // Rifleman (Light) - MEN - VANILLA
	// "O_soldier_M_F", // Marksman - MEN - VANILLA
	// "O_soldier_PG_F", // Para Trooper - MEN - VANILLA
	"O_soldier_repair_F", // Repair Specialist - MEN - VANILLA
	"O_Soldier_SL_F", // Squad Leader - MEN - VANILLA
	"O_Soldier_TL_F" // Team Leader - MEN - VANILLA
];
///////////////////////////////////////////////////////////////////////////////////////////////

_task = "Building Troop";

_locationBldPosArr = RELO_var_locationBuildingPosArr;
_locationBldPosArrCount = count _locationBldPosArr;

if (_locationBldPosArrCount isEqualTo 0) exitWith {};

_taskUnits = 6;
_taskGroups = selectRandom [1,2,3,4]; // min 6, max 24

if (_locationBldPosArrCount < (_taskUnits * _taskGroups)) then
{
	_taskGroups = floor(_locationBldPosArrCount / _taskUnits);
};

_taskLocation = getMarkerPos RELO_var_locationMkrCurrInner;
_taskAreaBase = selectMax (getMarkerSize RELO_var_locationMkrCurrInner);
///////////////////////////////////////////////////////////////////////////////////////////////
_i = 0;
while {sleep 0.1; _i < _taskGroups} do
{
	_grpDeploy = createGroup EAST;
	_groupID = groupID _grpDeploy;
	_grpDeploy setGroupIdGlobal [format ["%1 Patrol - %2",_task,_groupID]];
	RELO_var_locationGroups pushBack _grpDeploy;
	_j = 0;
	while {sleep 0.1; _j < _taskUnits} do
	{
		_soldierClass = selectRandom _soldierClasses;
		if (typeName _soldierClass == "ARRAY") then
		{
			_soldierClass = selectRandom _soldierClass;
		};
		_unit = _grpDeploy createUnit [_soldierClass, _taskLocation, [], 0, "NONE"];
		waitUntil {!isNull _unit};
		_unit allowDamage false;
		_unit setDamage 0;
		///////////////////////////////////////////////////////////////////////////////////////////////

		{
			_x addCuratorEditableObjects [[_unit],false];
		} forEach allCurators;

		///////////////////////////////////////////////////////////////////////////////////////////////
		_skillSet = selectRandom ["LOW","REGULAR","MEDIUM"]; // full list = ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
		[_unit,_skillSet] call RELO_fnc_aiSetSkill;
		sleep 0.1;
		_unit addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
		sleep 0.1;
		_addDogTags = [_unit] call RELO_fnc_addActionDogTags;
		sleep 0.1;
		_addGoldTooth = [_unit] call RELO_fnc_addActionGoldTooth;
		sleep 0.1;
		_unit setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
		_unit setVariable ["unitBelongsToTask",_task,false];
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(_locationBldPosArr isEqualTo []) then
		{
			_locationBldPos = selectRandom _locationBldPosArr;
			_locationBldPosArr = _locationBldPosArr - [_locationBldPos];
			_unit setPosATL _locationBldPos;
			doStop _unit;
		}
		else
		{
			_newPos = [_taskLocation, 1, _taskAreaBase, 0.5, 1, 20, 0] call BIS_fnc_findSafePos;
			_unit setPos _newPos;
		};
		_unit allowDamage true;
		_j = _j + 1;
	};
	_leader = leader _grpDeploy;
	_unitPatrol = [_leader,RELO_var_locationMkrCurrInner,"NOFOLLOW","NOSLOW","NOMOVE"] spawn RELO_fnc_urbanPatrol;
	_i = _i + 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////
