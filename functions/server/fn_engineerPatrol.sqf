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
	
	Name: fn_engineerPatrol.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - credits to Barret for reference script
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
if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
private ["_unitEngineer","_unitIdle","_allVehicles","_maxWalkDistance","_handle","_maxSearchDistance","_unitOnlyRepair","_medicBag","_unitNeutral","_timeoutMax","_dummy"];
// Settings
_unitEngineer				= _this select 0;				// Engineer unit itself
_unitOnlyRepair				= _this select 1;				// Argument accepts: "WEST", "EAST", "GUER", "CIV" or "ALL"
_unitIdle					= 60;							// Idle time in seconds between each cycle
_unitNeutral				= false;						// Marks the engineer as captive which is neutral for everyone
_unitAllowDmg				= true;							// Basicly sets the engineer in 'Godmode'
_unitReturnToGroupFormation	= true;							// Return to group formations when repair procedure is finished
///////////////////////////////////////////////////////////////////////////////////////////////////
_maxSearchDistance			= 400;							// Max search distance2D for a damaged vehicle
///////////////////////////////////////////////////////////////////////////////////////////////////
_timeoutMax 				= 180;							// Time out in seconds for 'waitUntil' procedures
///////////////////////////////////////////////////////////////////////////////////////////////////
_unitEngineerName = (name _unitEngineer);
_unitEngineerGroup = (group _unitEngineer);
///////////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_engineerPatrol: %1 (%2)",_unitEngineerName,_unitEngineerGroup];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////////
waitUntil {!isnil "BIS_fnc_init"};
if (isPlayer _unitEngineer) exitWith {};
if (!_unitAllowDmg) then {_unitEngineer allowDamage false;};
if (_unitNeutral) then {_unitEngineer setCaptive true;};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["        * engineer init -> %1 (%2)",_unitEngineerGroup,_unitEngineerName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["        * engineer init -> %1 (%2)",_unitEngineerGroup,_unitEngineerName];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_fn_checkRepair =
{
	params ["_target"];
	_targetNeedsRepair = false;
	_targetIsDisabledVehicle = _target getVariable ["disabledVehicle",false];
	if !(_targetIsDisabledVehicle) then
	{
		if ((getDammage _target) > 0.01) then
		{
			_targetNeedsRepair = true;
		}
		else
		{
			_targetHitPointDamage = getAllHitPointsDamage _target select 2;
			{
				if (_x > 0.01) exitWith
				{
					_targetNeedsRepair = true;
				};
			} forEach _targetHitPointDamage;
		};
	};
	_targetNeedsRepair
};
///////////////////////////////////////////////////////////////////////////////////////////////////
while {sleep 0.5; alive _unitEngineer} do
{
	///////////////////////////////////////////////////////////////////////////////////////////////
	_allVehicles = (_unitEngineer nearEntities [["CAR","TANK"], _maxSearchDistance]);
	///////////////////////////////////////////////////////////////////////////////////////////////
	if ((count _allVehicles) > 0) then
	{
		{
			_target = _x;
			_targetClass = (typeOf _target);
			_targetName = getText (configfile >> "CfgVehicles" >> _targetClass >> "displayName");
			_targetSide = getNumber (configfile >> "CfgVehicles" >> _targetClass >> "side");
			switch (_targetSide) do
			{
				case 0: {_targetSide = "EAST"};
				case 1: {_targetSide = "WEST"};
				case 2: {_targetSide = "GUER"};
				case 3: {_targetSide = "CIV"};
				default {_targetSide = "EAST"};
			};
			if ((_unitOnlyRepair == "ALL") || (_targetSide isEqualTo _unitOnlyRepair)) then
			{
				if (alive _target) then
				{
					_targetNeedsRepair = [_target] call _fn_checkRepair;
					// sleep 5;
					// #ifdef __DEBUG__
						// format ["        * engineer %1 checked %2 and needs repair is %3!",_unitEngineerName, _targetName, _targetNeedsRepair] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
						// diag_log format ["        * engineer %1 checked %2 and needs repair is %3!",_unitEngineerName, _targetName, _targetNeedsRepair];
					// #endif
					if ((_targetNeedsRepair) && (((_target getVariable ["isBeingRepaired",false]) isEqualTo false) || ((_target getVariable ["isOnRouteForRepair",false]) isEqualTo false))) then
					{
						#ifdef __DEBUG__
							format ["        * engineer %1 is in route to repair %2",_unitEngineerName, _targetName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
							diag_log format ["        * engineer %1 is in route to repair %2",_unitEngineerName, _targetName];
						#endif
						///////////////////////////////////////////////////////////////////////////////////////////////
						_orgMode = behaviour _unitEngineer;
						_orgSpeed = speedMode _unitEngineer;
						///////////////////////////////////////////////////////////////////////////////////////////////
						_target setVariable ["isOnRouteForRepair",true];
						_unitEngineer setVariable ["isRepairingAVehicle",true];
						///////////////////////////////////////////////////////////////////////////////////////////////
						_unitEngineer setBehaviour "CARELESS";
						_unitEngineer setSpeedMode "FULL";
						///////////////////////////////////////////////////////////////////////////////////////////////
						_doVehicleRepair = true;
						_timeoutCount = 0;
						_outputMsg = "";
						///////////////////////////////////////////////////////////////////////////////////////////////
						while {sleep 0.5; ((_unitEngineer distance2D _target) > 2.5) || (_timeoutCount < _timeoutMax)} do
						{
							_waitTime = (diag_tickTime + 5);
							_target doMove (getPosATL _unitEngineer);
							_target move (getPosATL _unitEngineer);
							_unitEngineer setBehaviour "CARELESS";
							_unitEngineer setSpeedMode "FULL";
							_unitEngineer doMove (getPosATL _target);
							_unitEngineer move (getPosATL _target);
							///////////////////////////////////////////////////////////////////////////////////////////
							_targetNeedsRepair = [_target] call _fn_checkRepair;
							if (((_unitEngineer distance2D _target) < 5) || (!alive _unitEngineer) || (!alive _target) || (!_targetNeedsRepair)) exitWith
							{
								switch (true) do
								{
									case (!alive _unitEngineer): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 died.",_unitEngineerName];};
									case (!alive _target): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 support cancelled, %2 is beyond repair.",_unitEngineerName,_targetName];};
									case (!_targetNeedsRepair): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 support cancelled, %2 has already been repaired.",_unitEngineerName,_targetName];};
									default {_doVehicleRepair = true; _outputMsg = "";};
								};
							};
							waitUntil {sleep 0.5; diag_tickTime > _waitTime};
							_timeoutCount = _timeoutCount + 0.5;
							if (_timeoutCount >= _timeoutMax) exitWith
							{
								_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 support cancelled, could not get to %2 for some reason!",_unitEngineerName,_targetName];
							};
							if ((_target getVariable ["isBeingRepaired",false]) isEqualTo true) exitWith
							{
								_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 support cancelled, %2 is being repair by another engineer!",_unitEngineerName,_targetName];
							};
						};
						///////////////////////////////////////////////////////////////////////////////////////////////
						if (_doVehicleRepair) then
						{
							_target setVariable ["isBeingRepaired",true];
							#ifdef __DEBUG__
								format ["        * engineer %1 is repairing vehicle %2",_unitEngineerName, _targetName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
								diag_log format ["        * engineer %1 is repairing vehicle %2",_unitEngineerName, _targetName];
							#endif
							_target forceSpeed 0;
							///////////////////////////////////////////////////////////////////////////////////////////////
							_faceDirection = [_unitEngineer,_target] call BIS_fnc_dirTo;
							_unitEngineer setDir _faceDirection;
							///////////////////////////////////////////////////////////////////////////////////////////////
							_animationComplete = false;
							_animationLoop = 0;
							while {sleep 0.5; !(_animationComplete)} do
							{
								_unitEngineer switchMove "Acts_carFixingWheel"; // action is 20s duration
								_unitEngineer playMove "Acts_carFixingWheel"; // action is 20s duration
								waitUntil {sleep 20; !((animationState _unitEngineer) isEqualTo "Acts_carFixingWheel")};
								_animationLoop = _animationLoop + 1;
								_targetNeedsRepair = [_target] call _fn_checkRepair;
								if ((_animationLoop > 2) || (!_targetNeedsRepair) || (!alive _target)) exitWith {_animationComplete = true;};
							};
							///////////////////////////////////////////////////////////////////////////////////////////////
							_idleTime = (diag_tickTime + _timeoutMax);
							waitUntil {sleep 0.5; _targetNeedsRepair = [_target] call _fn_checkRepair; !((animationState _unitEngineer) isEqualTo "Acts_carFixingWheel") || !(_targetNeedsRepair) || (!alive _target) || (diag_tickTime > _idleTime)};
							_target setDamage 0;
							_target setVectorUp [0,0,1];
							_target forceSpeed -1;
							_unitEngineer enableAI "MOVE";
							_unitEngineer enableAI "ANIM";
							switch (true) do
							{
								case (!_targetNeedsRepair): {_doVehicleRepair = false; _outputMsg = format ["  + %1 has been repaired.",_targetName];};
								case (!alive _target): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 support cancelled, %2 is beyond repair.",_unitEngineerName,_targetName];};
								case (diag_tickTime > _idleTime): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 exited repair routine for %2, timed out!",_unitEngineerName,_targetName];};
								default {_doVehicleRepair = true; _outputMsg = format ["  + %1 has been repaired.",_targetName];};
							};
							_target doMove (getPosATL _target);
							_target setVariable ["isBeingRepaired",false];
						};
						///////////////////////////////////////////////////////////////////////////////////////////////
						#ifdef __DEBUG__
							if !(_outputMsg isEqualTo "") then
							{
								format ["%1",_outputMsg] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
								diag_log format ["%1",_outputMsg];
							};
						#endif
						///////////////////////////////////////////////////////////////////////////////////////////////
						_target setVariable ["isOnRouteForRepair",false];
						_unitEngineer setVariable ["isRepairingAVehicle",false];
						///////////////////////////////////////////////////////////////////////////////////////////////
						if ((alive _unitEngineer) && (_unitReturnToGroupFormation)) then
						{
							#ifdef __DEBUG__
								format ["        * engineer %1 is returning to group formation",_unitEngineerName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
								diag_log format ["        * engineer %1 is returning to group formation",_unitEngineerName];
							#endif
							_timeoutCount = 0;
							_outputMsg = "";
							_leaderGroup = leader _unitEngineerGroup;
							units _unitEngineerGroup doFollow _leaderGroup;
							while {sleep 0.5; ((_unitEngineer distance2D _leaderGroup) > 10) || (_timeoutCount < _timeoutMax)} do
							{
								_waitTime = (diag_tickTime + 5);
								_unitEngineer setBehaviour "CARELESS";
								_unitEngineer setSpeedMode "FULL";
								_unitEngineer doMove (getPosATL _leaderGroup);
								_unitEngineer move (getPosATL _leaderGroup);
								waitUntil {sleep 0.5; diag_tickTime > _waitTime};
								if (((_unitEngineer distance2D _leaderGroup) < 10) || (!alive _unitEngineer)) exitWith
								{
									switch (true) do
									{
										case ((_unitEngineer distance2D _leaderGroup) < 10): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 is now back in group formation",_unitEngineerName];};
										case (!alive _unitEngineer): {_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 return to original position cancelled, %1 has died",_unitEngineerName];};
									};
								};
								_timeoutCount = _timeoutCount + 5;
								if (_timeoutCount >= _timeoutMax) exitWith
								{
									_doVehicleRepair = false; _outputMsg = format ["        * engineer %1 exited return to group formation routine, timed out!",_unitEngineerName];
								};
								// sleep 5;
							};
							#ifdef __DEBUG__
								if !(_outputMsg isEqualTo "") then
								{
									format ["%1",_outputMsg] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
									diag_log format ["%1",_outputMsg];
								};
							#endif
						};
						///////////////////////////////////////////////////////////////////////////////////////////////
						_unitEngineer setBehaviour _orgMode;
						_unitEngineer setSpeedMode _orgSpeed;
						///////////////////////////////////////////////////////////////////////////////////////////////
					};
				};
			};
			sleep 1;
		} forEach _allVehicles;
	};
	sleep _unitIdle;
};
