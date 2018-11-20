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

	Name: fn_pauseMenuOverride.sqf
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

call {
	0 spawn {
		waitUntil {!isNull findDisplay 46}; // INGAME
		findDisplay 46 displayAddEventHandler ["KeyDown",{
			if ((_this select 1) in actionKeys "IngamePause") then
			{
				_this spawn
				{
					scriptName "fn_pauseMenuOverride_ingame_locationRespawnAvailable";
					waitUntil {!isNull findDisplay 49};
					disableSerialization;
					while {!isNull findDisplay 49} do
					{
						_ctrl0 = findDisplay 49 displayCtrl 103; // save button
						if (missionNameSpace getVariable ["RELO_var_locationRespawnAvailable",false]) then
						{
							_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
							_ctrl0 ctrlSetText "RESPAWN AT AO";
							_ctrl0 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
							_ctrl0 ctrlEnable true;
							waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo false};
						}
						else
						{
							_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
							_ctrl0 ctrlSetText "RESPAWN AT AO";
							_ctrl0 ctrlSetBackgroundColor [0,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
							_ctrl0 ctrlEnable false;
							waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo true};
						};
					};
				};
				_this spawn
				{
					scriptName "fn_pauseMenuOverride_ingame_mainButtons";
					waitUntil {!isNull findDisplay 49};
					disableSerialization;
					_ctrl0 = findDisplay 49 displayCtrl 109; // player name
					_ctrl0 ctrlEnable true;
					_ctrl0 ctrlSetText format ["%1",toUpper (roleDescription player)];
					_ctrl1 = findDisplay 49 displayCtrl 523; // title
					_ctrl1 ctrlEnable true;
					_ctrl1 ctrlSetText "RELOADED";

					_ctrl2 = findDisplay 49 displayCtrl 2; // continue button
					_ctrl2 ctrlEnable false;
					_ctrl2 ctrlSetBackgroundColor [(profileNamespace getVariable ['GUI_BCG_RGB_R',0]),(profileNamespace getVariable ['GUI_BCG_RGB_G',0]),(profileNamespace getVariable ['GUI_BCG_RGB_B',0]),(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
					_ctrl2 ctrlSetStructuredText parseText format ["<t size='1' align='center' color='#ffffff'>%1 (%2)</t>",toUpper (name player), getPlayerUID player];

					_ctrl3 = findDisplay 49 displayCtrl 1010; // respawn button
					_ctrl3 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
					_ctrl3 ctrlSetText "RESPAWN AT BASE";
					_ctrl3 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];

					_ctrl4 = findDisplay 49 displayCtrl 122; // field manual button
					_ctrl4Pos = ctrlPosition _ctrl4;
					_ctrl4 ctrlShow false;
					_ctrl4 ctrlEnable false;

					_ctrl5 = findDisplay 49 ctrlCreate ["RscButtonMenu", 12345];
					_ctrl5 ctrlSetPosition _ctrl4Pos;
					_ctrl5 ctrlShow true;
					_ctrl5 ctrlEnable true;
					_ctrl5 ctrlSetText "SERVER RULES";
					_ctrl5 ctrlSetTooltip "SERVER RULES! MAKE SURE YOU READ THEM, NO EXCUSES!";
					_ctrl5 ctrlSetBackgroundColor [1,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
					_ctrl5 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; hint 'server rules yet to be implemented!';"];
					_ctrl5 ctrlCommit 0;
				};
			};
			false
		}];
	};
};

call {
	0 spawn {
		while {true} do
		{
			waitUntil {!isNull findDisplay 60492}; // SPECTATOR
			findDisplay 60492 displayAddEventHandler ["KeyDown",{
				if ((_this select 1) in actionKeys "IngamePause") then
				{
					_this spawn
					{
						scriptName "fn_pauseMenuOverride_spectate_locationRespawnAvailable";
						waitUntil {!isNull findDisplay 49};
						disableSerialization;
						while {!isNull findDisplay 49} do
						{
							_ctrl0 = findDisplay 49 displayCtrl 103; // save button
							if (missionNameSpace getVariable ["RELO_var_locationRespawnAvailable",false]) then
							{
								_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
								_ctrl0 ctrlSetText "RESPAWN AT AO";
								_ctrl0 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
								_ctrl0 ctrlEnable true;
								waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo false};
							}
							else
							{
								_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
								_ctrl0 ctrlSetText "RESPAWN AT AO";
								_ctrl0 ctrlSetBackgroundColor [0,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
								_ctrl0 ctrlEnable false;
								waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo true};
							};
						};
					};
					_this spawn
					{
						scriptName "fn_pauseMenuOverride_spectate_mainButtons";
						waitUntil {!isNull findDisplay 49};
						disableSerialization;
						_ctrl0 = findDisplay 49 displayCtrl 109; // player name
						_ctrl0 ctrlEnable true;
						_ctrl0 ctrlSetText "SPECTATOR";
						_ctrl1 = findDisplay 49 displayCtrl 523; // title
						_ctrl1 ctrlEnable true;
						_ctrl1 ctrlSetText "RELOADED";

						_ctrl2 = findDisplay 49 displayCtrl 2; // continue button
						_ctrl2 ctrlEnable false;
						_ctrl2 ctrlSetBackgroundColor [(profileNamespace getVariable ['GUI_BCG_RGB_R',0]),(profileNamespace getVariable ['GUI_BCG_RGB_G',0]),(profileNamespace getVariable ['GUI_BCG_RGB_B',0]),(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
						_ctrl2 ctrlSetStructuredText parseText format ["<t size='1' align='center' color='#ffffff'>%1 (%2)</t>",toUpper (name player), getPlayerUID player];

						_ctrl3 = findDisplay 49 displayCtrl 1010; // respawn button
						_ctrl3 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
						_ctrl3 ctrlSetText "RESPAWN AT BASE";
						_ctrl3 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];

						_ctrl4 = findDisplay 49 displayCtrl 122; // field manual button
						_ctrl4Pos = ctrlPosition _ctrl4;
						_ctrl4 ctrlShow false;
						_ctrl4 ctrlEnable false;

						_ctrl5 = findDisplay 49 ctrlCreate ["RscButtonMenu", 12345];
						_ctrl5 ctrlSetPosition _ctrl4Pos;
						_ctrl5 ctrlShow true;
						_ctrl5 ctrlEnable true;
						_ctrl5 ctrlSetText "SERVER RULES";
						_ctrl5 ctrlSetTooltip "SERVER RULES! MAKE SURE YOU READ THEM, NO EXCUSES!";
						_ctrl5 ctrlSetBackgroundColor [1,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
						_ctrl5 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; hint 'server rules yet to be implemented!';"];
						_ctrl5 ctrlCommit 0;
					};
				};
				false
			}];
			waitUntil {isNull(findDisplay 60492)};
			uiSleep 0.1;
		};
	};
};

call {
	0 spawn {
		while {true} do
		{
			waitUntil {!isNull findDisplay 312}; // ZEUS
			findDisplay 312 displayAddEventHandler ["KeyDown",{
				if ((_this select 1) in actionKeys "IngamePause") then
				{
					_this spawn
					{
						scriptName "fn_pauseMenuOverride_zeus_locationRespawnAvailable";
						waitUntil {!isNull findDisplay 49};
						disableSerialization;
						while {!isNull findDisplay 49} do
						{
							_ctrl0 = findDisplay 49 displayCtrl 103; // save button
							if (missionNameSpace getVariable ["RELO_var_locationRespawnAvailable",false]) then
							{
								_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
								_ctrl0 ctrlSetText "RESPAWN AT AO";
								_ctrl0 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
								_ctrl0 ctrlEnable true;
								waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo false};
							}
							else
							{
								_ctrl0 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
								_ctrl0 ctrlSetText "RESPAWN AT AO";
								_ctrl0 ctrlSetBackgroundColor [0,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
								_ctrl0 ctrlEnable false;
								waitUntil {(missionNameSpace getVariable "RELO_var_locationRespawnAvailable") isEqualTo true};
							};
						};
					};
					_this spawn
					{
						scriptName "fn_pauseMenuOverride_zeus_mainButtons";
						waitUntil {!isNull findDisplay 49};
						disableSerialization;
						_ctrl0 = findDisplay 49 displayCtrl 109; // player name
						_ctrl0 ctrlEnable true;
						_ctrl0 ctrlSetText "ZEUS";
						_ctrl1 = findDisplay 49 displayCtrl 523; // title
						_ctrl1 ctrlEnable true;
						_ctrl1 ctrlSetText "RELOADED";

						_ctrl2 = findDisplay 49 displayCtrl 2; // continue button
						_ctrl2 ctrlEnable false;
						_ctrl2 ctrlSetBackgroundColor [(profileNamespace getVariable ['GUI_BCG_RGB_R',0]),(profileNamespace getVariable ['GUI_BCG_RGB_G',0]),(profileNamespace getVariable ['GUI_BCG_RGB_B',0]),(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
						_ctrl2 ctrlSetStructuredText parseText format ["<t size='1' align='center' color='#ffffff'>%1 (%2)</t>",toUpper (name player), getPlayerUID player];

						_ctrl3 = findDisplay 49 displayCtrl 1010; // respawn button
						_ctrl3 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; player setDamage 1;"];
						_ctrl3 ctrlSetText "RESPAWN AT BASE";
						_ctrl3 ctrlSetBackgroundColor [0,0.6,1,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];

						_ctrl4 = findDisplay 49 displayCtrl 122; // field manual button
						_ctrl4Pos = ctrlPosition _ctrl4;
						_ctrl4 ctrlShow false;
						_ctrl4 ctrlEnable false;

						_ctrl5 = findDisplay 49 ctrlCreate ["RscButtonMenu", 12345];
						_ctrl5 ctrlSetPosition _ctrl4Pos;
						_ctrl5 ctrlShow true;
						_ctrl5 ctrlEnable true;
						_ctrl5 ctrlSetText "SERVER RULES";
						_ctrl5 ctrlSetTooltip "SERVER RULES! MAKE SURE YOU READ THEM, NO EXCUSES!";
						_ctrl5 ctrlSetBackgroundColor [1,0,0,(profileNamespace getVariable ['GUI_BCG_RGB_A',0.8])];
						_ctrl5 ctrlSetEventHandler ["buttonClick", "findDisplay 49 closeDisplay 0; hint 'server rules yet to be implemented!';"];
						_ctrl5 ctrlCommit 0;
					};
				};
				false
			}];
			waitUntil {isNull(findDisplay 312)};
			uiSleep 0.1;
		};
	};
};

// show idc code of buttons/gui
// {_x ctrlSetTooltip str(ctrlIDC _x) } forEach (allControls findDisplay 49)

// _ctrls = "";
// for "_i" from -1 to 10000 do {
 // with uiNamespace do {
  // _ctrl = findDisplay 49 displayCtrl _i;
  // if (!isNull _ctrl) then {
   // _ctrls = _ctrls + format ["IDC: %1, Class Name: %2\n", _i, ctrlClassName _ctrl];
  // };
 // };
// };
// hint _ctrls;
// copyToClipboard str _ctrls;

// display 49 (pause menu)
// IDC: -1, Class Name: MissionNameBackground
// IDC: 1, Class Name: ButtonExecuteLocal
// IDC: 2, Class Name: ButtonCancel
// IDC: 101, Class Name: ButtonOptions
// IDC: 103, Class Name: ButtonSAVE
// IDC: 104, Class Name: ButtonAbort
// IDC: 109, Class Name: PlayersName
// IDC: 120, Class Name: MissionTitle
// IDC: 121, Class Name: TraffLight
// IDC: 122, Class Name: ButtonTutorialHints
// IDC: 301, Class Name: ButtonVideo
// IDC: 302, Class Name: ButtonAudio
// IDC: 303, Class Name: ButtonControls
// IDC: 307, Class Name: ButtonGame
// IDC: 523, Class Name: Title
// IDC: 1000, Class Name: Pause1
// IDC: 1001, Class Name: Pause2
// IDC: 1002, Class Name: ButtonSkip
// IDC: 1005, Class Name: Version
// IDC: 1010, Class Name: ButtonRespawn
// IDC: 1050, Class Name: TitleBackground
// IDC: 2351, Class Name: MessageBox
// IDC: 6455, Class Name: Feedback
