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
	
	Name: fn_corpseCleanupHandler.sqf
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

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////

_corpseArea = 5; // 5m around the corpse

_corpseObjectsToDelete =
[
	"groundWeaponHolder",
	"WeaponHolderSimulated"
];

///////////////////////////////////////////////////////////////////////////////////////////////
_corpse = param [0, ""];
///////////////////////////////////////////////////////////////////////////////////////////////
_wasAI = _corpse getVariable ["unitBelongsToLocation",nil];
if !(isNil "_wasAI") then
{
	RELO_var_locationEnemyCasualties = RELO_var_locationEnemyCasualties + 1; // was an AI unit
}
else
{
	RELO_var_locationFriendlyCasualties = RELO_var_locationFriendlyCasualties + 1; // was a player
};
///////////////////////////////////////////////////////////////////////////////////////////////
_corpse setVariable ["corpseCleanup",true,false];
///////////////////////////////////////////////////////////////////////////////////////////////
_corpseType = typeOf _corpse;
///////////////////////////////////////////////////////////////////////////////////////////////
_corpseInitialWait = getNumber (missionConfigFile >> "corpseRemovalMinTime"); // 120
_corpseTimeWait = (_corpseInitialWait / 2); // 60
///////////////////////////////////////////////////////////////////////////////////////////////
sleep _corpseInitialWait;
///////////////////////////////////////////////////////////////////////////////////////////////
_corpsePosition = getPosWorld _corpse;
///////////////////////////////////////////////////////////////////////////////////////////////
if !(_corpsePosition inArea "bluforBase") then // if in base area, don't check for near players
{
	_anyPlayersAround = {alive _x} count (nearestObjects [_corpsePosition, ["MAN"], _corpseArea]);
	while {sleep 1; (_anyPlayersAround > 0)} do
	{
		_anyPlayersAround = {alive _x} count (nearestObjects [_corpsePosition, ["MAN"], _corpseArea]);
		sleep _corpseTimeWait;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////
removeAllActions _corpse;
deleteVehicle objectFromNetId (netID _corpse);
///////////////////////////////////////////////////////////////////////////////////////////////
_anyObjectsAround = nearestObjects [_corpsePosition, ["ALL"], _corpseArea];
_anyObjectsAroundCount = (count _anyObjectsAround);
if (_anyObjectsAroundCount > 0) then
{
	_anyObjectsAroundDeleted = 0;
	{
		_object = _x;
		_typeOfObject = typeOf _object;
		if (_typeOfObject in _corpseObjectsToDelete) then
		{
			removeAllActions _object;
			deleteVehicle objectFromNetId (netID _object);
			_anyObjectsAroundDeleted = _anyObjectsAroundDeleted + 1;
		};
	} forEach _anyObjectsAround;
	#ifdef __DEBUG__
		_displayName = getText (configFile >> "CfgVehicles" >> _corpseType >> "displayName");
		format [" ! cleaned up corpse of %1 at grid position %2",_displayName, mapGridPosition _corpsePosition] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format [" ! cleaned up corpse of '%1' at grid position %2",_displayName, mapGridPosition _corpsePosition];
	#endif
};
///////////////////////////////////////////////////////////////////////////////////////////////
