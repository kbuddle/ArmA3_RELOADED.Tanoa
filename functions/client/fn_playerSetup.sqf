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

	Name: fn_playerSetup.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

waitUntil {!(isNull player)};

if !(playerSide isEqualTo WEST) then
{
	_groupWest = createGroup WEST;
	player joinSilent _groupWest;
};

player allowDamage true;
player disableConversation true;
player enableAimPrecision false;
player setCustomAimCoef 0.5;
player enableFatigue false;
player enableStamina false;
player setSpeaker "NoVoice";
player setVariable ["BIS_noCoreConversations",true,false];
player switchCamera "External";
player switchMove "";

enableEnvironment [false, true];
enableSaving [false, false];
enableSentences false;
enableRadio false;

// enableCamShake false;

showSubtitles false;

{
	player disableAI _x;
} forEach ["TEAMSWITCH", "FSM", "AIMINGERROR", "SUPPRESSION", "COVER", "AUTOCOMBAT"];
player enableAI "MOVE";

// saved arsenal loadout
if !((missionNamespace getVariable ["RELO_var_arsenalSaved",[]]) isEqualTo []) then
{
	player setUnitLoadout [(missionNamespace getVariable "RELO_var_arsenalSaved"),true];
};

// remove pilot channel
if (!isNil "RELO_var_radioChannelPilot") then
{
	RELO_var_radioChannelPilot radioChannelRemove [player];
};

// respawn positions bases on player trait
switch (true) do
{
	case (player getUnitTrait "RELO_trait_helicopterPilot"): {
		_markerPos = getMarkerPos "respawn_west_helicopterPilot";
		_markerPos set [2,0];
		_safePos = _markerPos findEmptyPosition [1, 20, "C_MAN_1"];
		waitUntil {alive player};
		player setPosATL _safePos;
		while {!(isTouchingGround player)} do
		{
			player setPosATL _safePos;
		};
		RELO_var_radioChannelPilot radioChannelAdd [player];
	};
	case (player getUnitTrait "RELO_trait_fighterPilot"): {
		_markerPos = getMarkerPos "respawn_west_fighterPilot";
		_markerPos set [2,0];
		_safePos = _markerPos findEmptyPosition [1, 20, "C_MAN_1"];
		waitUntil {alive player};
		player setPosATL _safePos;
		while {!(isTouchingGround player)} do
		{
			player setPosATL _safePos;
		};
		RELO_var_radioChannelPilot radioChannelAdd [player];
	};
	case (player getUnitTrait "RELO_trait_diverSquad"): {
		_markerPos = getMarkerPos "respawn_west_diverSquad";
		_markerPos set [2,7.4];
		waitUntil {alive player};
		player setPosATL _markerPos;
		while {!(isTouchingGround player)} do
		{
			player setPosATL _safePos;
		};
	};
	default {
		_markerPos = getMarkerPos "respawn_west";
		_markerPos set [2,0];
		_safePos = _markerPos findEmptyPosition [1, 20, "C_MAN_1"];
		waitUntil {alive player};
		player setPosATL _safePos;
		while {!(isTouchingGround player)} do
		{
			player setPosATL _safePos;
		};
	};
};

// sticky charges, event handlers need to be readded at each spawn, init only once (see fn_playerInit.sqf)
inGameUISetEventHandler ["Action", "_this call A3W_fnc_stickyCharges_actionEvent"];
inGameUISetEventHandler ["PrevAction", "_this call A3W_fnc_stickyCharges_actionSelect"];
inGameUISetEventHandler ["NextAction", "_this call A3W_fnc_stickyCharges_actionSelect"];

// add player to all zeus curators
[player] remoteExec ["RELO_fnc_zeusAddPlayer"];
