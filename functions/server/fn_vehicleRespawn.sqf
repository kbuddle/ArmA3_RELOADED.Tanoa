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
	
	Name: fn_vehicleRespawn.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - original code by Iceman 77
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description:
	
	Parameter(s): 

	Example: 
	
	Change Log:
	1.0 - original base script for object delete.
	
	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
private ["_veh","_vehAbandonDelay","_vehDestroyedDelay","_vehInit","_vehName","_vehDir","_vehPos","_vehType","_isAbandoned","_isDead"];

_veh = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_vehAbandonDelay = [_this, 1, 300, [0]] call BIS_fnc_param;
_vehDestroyedDelay = [_this, 2, 120, [0]] call BIS_fnc_param;
_vehInit = [_this, 3, {}, [{}]] call BIS_fnc_param;

_vehDir = getDir _veh;
_vehPos = visiblePosition _veh;
_vehType = typeOf _veh;
_vehName = vehicleVarName _veh;

_vehProximity = 50;

///////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_vehicleRespawn: Respawn Handler For Vehicle %1 (%2)",_vehName,_vehType];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(_vehInit isEqualTo {}) then
{
	[_veh,_vehInit] spawn
	{
		params ["_veh","_vehInit"];
		_veh call _vehInit;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_fncl_ropeEventHandler = {
	params ["_veh"];
	if (_veh isKindOf "HELICOPTER") then
	{
		_veh addEventHandler ["RopeAttach", {
			_heli = _this select 0;
			_rope = _this select 1;
			_slingLoad = _this select 2;
			_typeOfHeli = typeOf _heli;
			_typeOfSlingLoad = typeOf _slingLoad;
			_heliDisplayName = getText (configfile >> "CfgVehicles" >> _typeOfHeli >> "displayName");
			_slingLoadDisplayName = getText (configfile >> "CfgVehicles" >> _typeOfSlingLoad >> "displayName");
			if !(_slingLoad getVariable ["isSlingLoaded",false]) then
			{
				_slingLoad setVariable ["isSlingLoaded",true,false];
				[_heli,_rope,_slingLoad,_typeOfHeli,_typeOfSlingLoad,_heliDisplayName,_slingLoadDisplayName] spawn
				{
					params ["_heli","_rope","_slingLoad","_typeOfHeli","_typeOfSlingLoad","_heliDisplayName","_slingLoadDisplayName"];
					waitUntil {sleep 1; (isNull (ropeAttachedTo _slingLoad))};
					if (_slingLoad getVariable ["isSlingLoaded",false]) then
					{
						_slingLoad setVariable ["isSlingLoaded",false,false];
						_slingLoadHeight = getPos _slingLoad select 2;
						if (_slingLoadHeight > 10) then
						{
							[_slingLoad] spawn
							{
								params ["_slingLoad"];
								sleep 3;
								_slingLoadChute = createVehicle [ "O_Parachute_02_F", [0,0,0], [], 0, "CAN_COLLIDE" ]; // create the parachute - shitty parachute spawns OPEN, then collapses... collision WILL explode the heli.
								_slingLoadChute allowDamage false; // disallow damage to parachute
								_slingLoadPos = (getPos _slingLoad);
								_slingLoadChute setPos _slingLoadPos;
								_slingLoad attachTo [_slingLoadChute, [0,0,0]]; // attach the crate to the parachute
							};
						};
						#ifdef RELO_DEBUG
							format ["[SLING LOAD] + %1 has been detached from sling load at grid location %2",_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
							diag_log format ["[SLING LOAD] + %1 has been detached from sling load at grid location %2",_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))];
						#endif
					};
				};
				#ifdef RELO_DEBUG
					format ["[SLING LOAD] + pilot %1 (%2) attached sling load object %3 at grid location %4",(name assignedDriver _heli), _heliDisplayName,_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					diag_log format ["[SLING LOAD] + pilot %1 (%2) attached sling load object %3 at grid location %4",(name assignedDriver _heli), _heliDisplayName,_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))];
				#endif
			};
		}];
		_veh addEventHandler ["RopeBreak", {
			_heli = _this select 0;
			_rope = _this select 1;
			_slingLoad = _this select 2;
			_typeOfHeli = typeOf _heli;
			_typeOfSlingLoad = typeOf _slingLoad;
			_heliDisplayName = getText (configfile >> "CfgVehicles" >> _typeOfHeli >> "displayName");
			_slingLoadDisplayName = getText (configfile >> "CfgVehicles" >> _typeOfSlingLoad >> "displayName");
			if (_slingLoad getVariable ["isSlingLoaded",false]) then
			{
				_slingLoad setVariable ["isSlingLoaded",false,false];
				_slingLoadHeight = getPos _slingLoad select 2;
				if (_slingLoadHeight > 10) then
				{
					[_slingLoad] spawn
					{
						params ["_slingLoad"];
						sleep 3;
						_slingLoadChute = createVehicle [ "O_Parachute_02_F", [0,0,0], [], 0, "CAN_COLLIDE" ]; // create the parachute - shitty parachute spawns OPEN, then collapses... collision WILL explode the heli.
						_slingLoadChute allowDamage false; // disallow damage to parachute
						_slingLoadPos = (getPos _slingLoad);
						_slingLoadChute setPos _slingLoadPos;
						_slingLoad attachTo [_slingLoadChute, [0,0,0]]; // attach the crate to the parachute
					};
				};
				#ifdef RELO_DEBUG
					format ["[SLING LOAD] + pilot %1 (%2) detached sling load object %3 at grid location %4",(name assignedDriver _heli), _heliDisplayName,_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					diag_log format ["[SLING LOAD] + pilot %1 (%2) detached sling load object %3 at grid location %4",(name assignedDriver _heli), _heliDisplayName,_slingLoadDisplayName,(mapGridPosition (getPosASL _slingLoad))];
				#endif
			};
		}];
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_fncl_applyLivery = {
	params ["_veh"];
	if (_veh isKindOf "HELICOPTER") then
	{
		_veh setVariable ["BIS_enableRandomization", false];
		_typeOfHeli = typeOf _veh;
		switch (_typeOfHeli) do
		{
			case "I_Heli_Transport_02_F": {
				_path = "media\textures\vehicle\I_Heli_Transport_02_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"I_Heli_Transport_02_F_0.jpg"]];
				_veh setObjectTextureGlobal [1,format ["%1\%2",_path,"I_Heli_Transport_02_F_1.jpg"]];
				_veh setObjectTextureGlobal [2,format ["%1\%2",_path,"I_Heli_Transport_02_F_2.jpg"]];
			}; // mohawk
			case "B_Heli_Transport_01_F": {
				_path = "media\textures\vehicle\B_Heli_Transport_01_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"B_Heli_Transport_01_F_0.jpg"]];
				_veh setObjectTextureGlobal [1,format ["%1\%2",_path,"B_Heli_Transport_01_F_1.jpg"]];
			}; // ghosthawk
			case "B_Heli_Transport_03_F": {
				_path = "media\textures\vehicle\B_Heli_Transport_03_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"B_Heli_Transport_03_F_0.jpg"]];
				_veh setObjectTextureGlobal [1,format ["%1\%2",_path,"B_Heli_Transport_03_F_1.jpg"]];
			}; // huron armed
			case "B_Heli_Transport_03_unarmed_F": {
				_path = "media\textures\vehicle\B_Heli_Transport_03_unarmed_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"B_Heli_Transport_03_unarmed_F_0.jpg"]];
				_veh setObjectTextureGlobal [1,format ["%1\%2",_path,"B_Heli_Transport_03_unarmed_F_1.jpg"]];
			}; // huron unarmed
			case "B_Heli_Light_01_F": {
				_path = "media\textures\vehicle\B_Heli_Light_01_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"B_Heli_Light_01_F_0.jpg"]];
			}; // hummingbird
			case "O_Heli_Transport_04_F": {
				_path = "media\textures\vehicle\O_Heli_Transport_04_F";
				_veh setObjectTextureGlobal [0,format ["%1\%2",_path,"O_Heli_Transport_04_F_0.jpg"]];
				_veh setObjectTextureGlobal [1,format ["%1\%2",_path,"O_Heli_Transport_04_F_1.jpg"]];
			}; // taru
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_veh call RELO_fncl_ropeEventHandler;
_veh call RELO_fncl_applyLivery;
// [_veh] spawn
// {
	// params ["_veh"];
	// waitUntil {sleep 0.1; !alive _veh};
	// _veh removeAllEventHandlers "RopeAttach";
	// _veh removeAllEventHandlers "RopeBreak";
// };
///////////////////////////////////////////////////////////////////////////////////////////////////
[_veh,['Force Vehicle Respawn', {deleteVehicle (_this select 0)},[],0,false,false,'','((assignedDriver _target) isEqualTo _this) && (vehicle _this isEqualTo _this) && ({alive _x} count crew _target == 0)',5,false,'']] remoteExec ['addAction',0,true];
_veh enableCopilot false; // disable controls for co-pilot
///////////////////////////////////////////////////////////////////////////////////////////////////
while {true} do
{
	if ((alive _veh) && {canMove _veh} && {{alive _x} count crew _veh == 0} && !({_x distance _veh < _vehProximity } count allUnits > 0) && !(_veh getVariable ["isSlingLoaded",false])) then // added in player proximity check - soulkobk
	{
		_isAbandoned = true;
		for "_i" from 0 to _vehAbandonDelay do
		{  
			if (({alive _x} count (crew _veh) > 0) || (!alive _veh) || (!canMove _veh) || ({_x distance _veh < _vehProximity } count allUnits > 0) || (_veh getVariable ["isSlingLoaded",false])) exitWith {_isAbandoned = false;}; // added in player proximity check - soulkobk
			sleep 1;  
		};
		
		if ((_isAbandoned) && {_veh distance _vehPos > 10}) then
		{
			_blockingUnits = allUnits inAreaArray _vehName;
			{
				moveOut _x;
				_x setPos ((getPos _x) findEmptyPosition [1,50]);
			} forEach _blockingUnits;
			sleep 0.5;
			deleteVehicle _veh;
			sleep 0.5;
			_blockingObjectsAlive = vehicles inAreaArray _vehName; // marker name is the same as vehicle var name
			_blockingObjectsDead = allDead inAreaArray _vehName; // marker name is the same as vehicle var name
			{
				_x setPos [0,0,0]; // move the blocking vehicle away
				_x setDamage [1,false]; // damage the vehicle so it respawns where it should be
			} forEach _blockingObjectsAlive + _blockingObjectsDead;
			sleep 0.9;
			_veh = createVehicle [_vehType, [(_vehPos select 0), (_vehPos select 1), (_vehPos select 2) + 8000], [], 0, "NONE"];
			waitUntil {!isNull _veh};
			[_veh] spawn RELO_fnc_lockAirVehicle;
			_veh call RELO_fncl_ropeEventHandler;
			_veh call RELO_fncl_applyLivery;
			[_veh] spawn
			{
				params ["_veh"];
				waitUntil {sleep 0.1; !alive _veh};
				_veh removeAllEventHandlers "RopeAttach";
				_veh removeAllEventHandlers "RopeBreak";
			};
			_veh hideObjectGlobal true;
			_veh setDir _vehDir;
			_veh allowDamage false;
			sleep 0.1;
			_veh setPos [(_vehPos select 0), (_vehPos select 1), (_vehPos select 2) + 0.25];
			if (_vehName != "") then
			{
				_veh setVehicleVarName _vehName;
			};
			if !(_vehInit isEqualTo {}) then
			{
				[_veh,_vehInit] spawn
				{
					params ["_veh","_vehInit"];
					_veh call _vehInit;
				};
			};
			sleep 1;
			_veh allowDamage true;
			_veh setDamage 0;
			_veh hideObjectGlobal false;
			[_veh,['Force Vehicle Respawn', {deleteVehicle (_this select 0)},[],0,false,false,'','((assignedDriver _target) isEqualTo _this) && (vehicle _this isEqualTo _this) && ({alive _x} count crew _target == 0)',5,false,'']] remoteExec ['addAction',0,true];
			_veh enableCopilot false; // disable controls for co-pilot
		};
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	if ((!alive _veh) || (!canMove _veh)) then
	{
		_isDead = true;
		if !(_veh isEqualTo objNull) then
		{
			for "_i" from 0 to _vehDestroyedDelay do
			{  
				if (({alive _x} count (crew _veh) > 0) || (canMove _veh)) exitWith {_isDead = false;};
				sleep 1;  
			};
		};
		if (_isDead) then
		{
			_blockingUnits = allUnits inAreaArray _vehName;
			{
				moveOut _x;
				_x setPos ((getPos _x) findEmptyPosition [1,50]);
			} forEach _blockingUnits;
			sleep 0.5;
			deleteVehicle _veh;
			sleep 0.5;
			_blockingObjectsAlive = vehicles inAreaArray _vehName; // marker name is the same as vehicle var name
			_blockingObjectsDead = allDead inAreaArray _vehName; // marker name is the same as vehicle var name
			{
				_x setPos [0,0,0]; // move the blocking vehicle away
				_x setDamage [1,false]; // damage the vehicle so it respawns where it should be
			} forEach _blockingObjectsAlive + _blockingObjectsDead;
			sleep 0.9;
			_veh = createVehicle [_vehType, [(_vehPos select 0), (_vehPos select 1), (_vehPos select 2) + 8000], [], 0, "NONE"];
			waitUntil {!isNull _veh};
			[_veh] spawn RELO_fnc_lockAirVehicle;
			_veh call RELO_fncl_ropeEventHandler;
			_veh call RELO_fncl_applyLivery;
			[_veh] spawn
			{
				params ["_veh"];
				waitUntil {sleep 0.1; !alive _veh};
				_veh removeAllEventHandlers "RopeAttach";
				_veh removeAllEventHandlers "RopeBreak";
			};
			_veh hideObjectGlobal true;
			_veh setDir _vehDir;
			_veh allowDamage false;
			sleep 0.1;
			_veh setPos [(_vehPos select 0), (_vehPos select 1), (_vehPos select 2) + 0.25];
			if (_vehName != "") then
			{
				_veh setVehicleVarName _vehName;
			};
			if !(_vehInit isEqualTo {}) then
			{
				[_veh,_vehInit] spawn
				{
					params ["_veh","_vehInit"];
					_veh call _vehInit;
				};
			};
			sleep 1;
			_veh allowDamage true;
			_veh setDamage 0;
			_veh hideObjectGlobal false;
			[_veh,['Force Vehicle Respawn', {deleteVehicle (_this select 0)},[],0,false,false,'','((assignedDriver _target) isEqualTo _this) && (vehicle _this isEqualTo _this) && ({alive _x} count crew _target == 0)',5,false,'']] remoteExec ['addAction',0,true];
			_veh enableCopilot false; // disable controls for co-pilot
		};
	};
	sleep 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
