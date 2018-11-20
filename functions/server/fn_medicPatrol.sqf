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
	
	Name: fn_medicPatrol.sqf
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
private ["_unitMedic","_unitIdle","_allUnits","_maxWalkDistance","_handle","_maxSearchUnitDistance","_unitOnlyHeal","_medicBag","_unitNeutral","_timeoutMax","_unitReturnPoint","_dummy"];
// Settings
_unitMedic					= _this select 0;				// Medic unit itself
_unitOnlyHeal				= _this select 1;				// Argument accepts: "WEST", "EAST", "GUER", "CIV" or "ALL"
_unitIdle					= 30;							// Idle time in seconds between each cycle
_unitNeutral				= false;						// Marks the medic as captive which is neutral for everyone
_unitAllowDmg				= true;							// Basicly sets the medic in 'Godmode'
_unitReturnToGroupFormation	= true;							// Return to group formations when repair procedure is finished
///////////////////////////////////////////////////////////////////////////////////////////////////
_maxSearchUnitDistance		= 200;							// Max search distance for an injured unit
///////////////////////////////////////////////////////////////////////////////////////////////////
_timeoutMax 				= 120;							// Time out in seconds for 'waitUntil' procedures
///////////////////////////////////////////////////////////////////////////////////////////////////
_unitMedicName = (name _unitMedic);
_unitMedicGroup = (group _unitMedic);
///////////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["RELO_fnc_medicPatrol: %1 (%2)",_unitMedicName,_unitMedicGroup];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////////
waitUntil {!isnil "BIS_fnc_init"};
if (isPlayer _unitMedic) exitWith {};
if (!_unitAllowDmg) then {_unitMedic allowDamage false;};
if (_unitNeutral) then {_unitMedic setCaptive true;};
///////////////////////////////////////////////////////////////////////////////////////////////////
if (surfaceIsWater position _unitMedic) then
{
	_unitReturnPoint = getPosASL _unitMedic;
}
else
{
	_unitReturnPoint = getPosATL _unitMedic;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["        * medic init -> %1 (%2)",_unitMedicGroup,_unitMedicName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["        * medic init -> %1 (%2)",_unitMedicGroup,_unitMedicName];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
while {sleep 0.5; alive _unitMedic} do
{
	///////////////////////////////////////////////////////////////////////////////////////////////
	if ((!_unitAllowDmg) && ((getDammage _unitMedic) > 0.1)) then
	{
		#ifdef __DEBUG__
			format ["        * medic %1 has been injured, self healing!",_unitMedic] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
			diag_log format ["        * medic %1 has been injured, self healing!",_unitMedic];
		#endif
		_timeoutMax = (diag_tickTime + 5);
		_unitMedic action ["HEALSOLDIERSELF",_unitMedic];
		waitUntil {sleep 0.5; (getDammage _unitMedic < 0.1) || (!alive _unitMedic) || (diag_tickTime > _timeoutMax)};
		if (!alive _unitMedic) exitWith
		{
			#ifdef __DEBUG__
				format ["        * medic %1 has died",_unitMedicName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log format ["        * medic %1 has died",_unitMedicName];
			#endif
		};
	};
	///////////////////////////////////////////////////////////////////////////////////////////////
	_allUnits = ((_unitMedic nearEntities ["MAN", _maxSearchUnitDistance]) - [_unitMedic]);
	///////////////////////////////////////////////////////////////////////////////////////////////
	if ((count _allUnits) > 0) then
	{
		{
			_target = _x;
			_targetName = (name _target);
			if ((_unitOnlyHeal == "ALL") || ((str(side _target)) isEqualTo _unitOnlyHeal)) then
			{
				if ((_target isKindOf "MAN") && (alive _target) && ((getDammage _target) > 0.1)) then
				{
					#ifdef __DEBUG__
						format ["        * medic %1 is in route for %2",_unitMedicName, _targetName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
						diag_log format ["        * medic %1 is in route for %2",_unitMedicName, _targetName];
					#endif
					///////////////////////////////////////////////////////////////////////////////////////////////
					_orgMode = behaviour _unitMedic;
					_orgSpeed = speedMode _unitMedic;
					///////////////////////////////////////////////////////////////////////////////////////////////
					_unitMedic setVariable ["isHealingASoldier",true];
					///////////////////////////////////////////////////////////////////////////////////////////////
					_unitMedic setBehaviour "CARELESS";
					_unitMedic setSpeedMode "FULL";
					///////////////////////////////////////////////////////////////////////////////////////////////
					_doUnitHeal = true;
					_timeoutCount = 0;
					_outputMsg = "";
					///////////////////////////////////////////////////////////////////////////////////////////////
					while {sleep 0.5; ((_unitMedic distance _target) > 2) || (_timeoutCount < _timeoutMax)} do
					{
						_waitTime = (diag_tickTime + 5);
						_unitMedic setBehaviour "CARELESS";
						_unitMedic setSpeedMode "FULL";
						if (surfaceIsWater position _target) then
						{
							_unitMedic doMove (getPosASL _target);
							_unitMedic move (getPosASL _target);
							_unitMedic moveTo (getPosASL _target);
						}
						else
						{
							_unitMedic doMove (getPosATL _target);
							_unitMedic move (getPosATL _target);
							_unitMedic moveTo (getPosATL _target);
						};
						if (((_unitMedic distance _target) < 2) || (!alive _unitMedic) || (!alive _target) || ((getDammage _target) < 0.1)) exitWith
						{
							switch (true) do
							{
								case (!alive _unitMedic): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 has died",_unitMedicName];};
								case (!alive _target): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 support cancelled, %2 has died.",_unitMedicName,_targetName];};
								case ((getDammage _target) < 0.1): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 support cancelled, %2 has already been healed.",_unitMedicName,_targetName];};
								default {_doUnitHeal = true; _outputMsg = "";};
							};
						};
						waitUntil {sleep 0.5; diag_tickTime > _waitTime};
						_timeoutCount = _timeoutCount + 5;
						if (_timeoutCount >= _timeoutMax) exitWith
						{
							_doUnitHeal = false; _outputMsg = format ["        * medic %1 support cancelled, could not get to %2 for some reason!.",_unitMedicName,_targetName];
						};
					};
					///////////////////////////////////////////////////////////////////////////////////////////////
					if (_doUnitHeal) then
					{
						#ifdef __DEBUG__
							format ["        * medic %1 is healing %2",_unitMedicName, _targetName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
							diag_log format ["        * medic %1 is healing %2",_unitMedicName, _targetName];
						#endif
						_idleTime = (diag_tickTime + _timeoutMax);
						_target disableAI "MOVE";
						_target setUnitPos "DOWN";
						_unitMedic action ["HEALSOLDIER", _target];
						waitUntil {sleep 0.5; ((getDammage _target) < 0.1) || (!alive _target) || (diag_tickTime > _idleTime)};
						switch (true) do
						{
							case ((getDammage _target) < 0.1): {_doUnitHeal = false; _outputMsg = format ["  + %1 has been healed.",_targetName];};
							case (!alive _target): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 support cancelled, %2 has died.",_unitMedicName,_targetName];};
							case (diag_tickTime > _idleTime): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 exited heal routine for %2, timed out!",_unitMedicName,_targetName];};
							default {_doUnitHeal = true; _outputMsg = format ["  + %1 has been healed.",_targetName];};
						};
						_target enableAI "MOVE";
						_target setUnitPos "AUTO";
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
					_unitMedic setVariable ["isHealingASoldier",false];
					///////////////////////////////////////////////////////////////////////////////////////////////
					if ((alive _unitMedic) && (_unitReturnToGroupFormation)) then
					{
						#ifdef __DEBUG__
							format ["        * medic %1 is returning to group formation",_unitMedicName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
							diag_log format ["        * medic %1 is returning to group formation",_unitMedicName];
						#endif
						_timeoutCount = 0;
						_outputMsg = "";
						_leaderGroup = leader _unitMedicGroup;
						units _unitMedicGroup doFollow _leaderGroup;
						while {sleep 0.5; ((_unitMedic distance2D _leaderGroup) > 10) || (_timeoutCount < _timeoutMax)} do
						{
							_waitTime = (diag_tickTime + 5);
							_unitMedic setBehaviour "CARELESS";
							_unitMedic setSpeedMode "FULL";
							_unitMedic doMove (getPosATL _leaderGroup);
							_unitMedic move (getPosATL _leaderGroup);
							_unitMedic moveTo (getPosATL _leaderGroup);
							waitUntil {sleep 0.5; diag_tickTime > _waitTime};
							if (((_unitMedic distance2D _leaderGroup) < 10) || (!alive _unitMedic)) exitWith
							{
								switch (true) do
								{
									case ((_unitMedic distance2D _leaderGroup) < 10): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 is now back in group formation",_unitMedicName];};
									case (!alive _unitMedic): {_doUnitHeal = false; _outputMsg = format ["        * medic %1 return to original position cancelled, %1 has died",_unitMedicName];};
								};
							};
							_timeoutCount = _timeoutCount + 5;
							if (_timeoutCount >= _timeoutMax) exitWith
							{
								_doUnitHeal = false; _outputMsg = format ["        * medic %1 exited return to group formation routine, timed out!",_unitMedicName];
							};
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
					_unitMedic setBehaviour _orgMode;
					_unitMedic setSpeedMode _orgSpeed;
					///////////////////////////////////////////////////////////////////////////////////////////////
				};
			};
			sleep 1;
		} forEach _allUnits;
	};
	sleep _unitIdle;
};
