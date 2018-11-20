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

	Name: RELO_fnc_zeusInitCurators.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description:

	Parameter(s):

	Example:

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!

#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif

waitUntil {!(RELO_var_whiteListedZeus isEqualTo [])};

_zeusLogicCenter = createCenter sideLogic;
_zeusLogicGroup = createGroup _zeusLogicCenter;
_zeusLogicObject = _zeusLogicGroup createUnit ["Logic",[0,0,0],[],0,"NONE"];

{
	_playerUID = _x;
	_zeusCurator = _zeusLogicGroup createUnit ["ModuleCurator_F",[0,0,0],[],0,"NONE"];
	_zeusCurator setVehicleVarName format ["RELO_var_curator_%1",_playerUID];
	[_zeusCurator,[-1,-2,0,1]] call BIS_fnc_setCuratorVisionModes;
	_zeusCurator setVariable ["showNotification",false];
	_zeusCurator setVariable ["forced",0];
	_zeusCurator setVariable ["owner",_playerUID];
	_cfgPatches = (configFile >> "CfgPatches");
	_zeusCuratorAddons = [];
	for "_i" from 0 to((count _cfgPatches) - 1) do
	{
		_cfgName = configName (_cfgPatches select _i);
		_zeusCuratorAddons pushBack _cfgName;
	};
	if (count _zeusCuratorAddons > 0) then
	{
		_zeusCurator addCuratorAddons _zeusCuratorAddons
	};
	_zeusCurator addEventHandler ["CuratorObjectPlaced",{_this remoteExecCall ["RELO_fnc_zeusAddObject"];}];
	_zeusCurator addEventHandler ["CuratorObjectDeleted",{_this remoteExecCall ["RELO_fnc_zeusDeleteObject"];}];
} forEach RELO_var_whiteListedZeus;

diag_log "[INIT] -> Zeus Init Curator Setup";
