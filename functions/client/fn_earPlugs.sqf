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

	Name: fn_earPlugs.sqf
	Version: 1.0.2
	Author: soulkobk (soulkobk.blogspot.com) - credit to Sa-Matra for original base code
	Creation Date: 00:00 PM 01/07/2017
	Modification Date: 00:00 PM 01/07/2017

	Description: none

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 -	original base script.

	----------------------------------------------------------------------------------------------
*/

_playerUID = getPlayerUID player;

// main screen
call {
	0 spawn {
		scriptName "fn_earPlugs_main";
		earPlugLevel = 1;
		earPlugsIn = false;
		disableSerialization;
		waitUntil {!isNull(findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {
			if (_this select 1 == 0xCF) then // used END key
			{
				_earPlugsCtrl = (_this select 0) displayCtrl 9001;
				if (isNull(_earPlugsCtrl)) then
				{
					_earPlugsCtrl = (_this select 0) ctrlCreate ["RscStructuredText", 9001];
					_earPlugsText = format ["<img align='center' shadow='0' size='2' image='media\icons\functions\earPlugs.paa'/>"];
					_earPlugsCtrl ctrlSetStructuredText parseText _earPlugsText;
					_earPlugsCtrl ctrlSetPosition [safeZoneX + safeZoneW - 0.20, safeZoneY + safeZoneH - 0.14, 0.24, 0.24];
					_earPlugsCtrl ctrlShow false;
					_earPlugsCtrl ctrlCommit 0;
				};
				_shown = ctrlShown _earPlugsCtrl;
				if (_shown) then
				{
					earPlugLevel = 1;
					earPlugsIn = false;
				}
				else
				{
					earPlugLevel = 0.1;
					earPlugsIn = true;
				};
				0.2 fadeSound earPlugLevel;
				_earPlugsCtrl ctrlShow !_shown;
			};
		}];
	};
};

if (_playerUID in RELO_var_whiteListedSpectate) then
{
	// spectate screen
	call {
		0 spawn {
			scriptName "fn_earPlugs_spectate";
			earPlugLevel = 1;
			earPlugsIn = false;
			disableSerialization;
			while {true} do
			{
				waitUntil {!isNull(findDisplay 60492)};
				(findDisplay 60492) displayAddEventHandler ["KeyDown", {
					if (_this select 1 == 0xCF) then // used END key
					{
						_earPlugsCtrl = (_this select 0) displayCtrl 9001;
						if (isNull(_earPlugsCtrl)) then
						{
							_earPlugsCtrl = (_this select 0) ctrlCreate ["RscStructuredText", 9001];
							_earPlugsText = format ["<img align='center' shadow='0' size='2' image='media\icons\functions\earPlugs.paa'/>"];
							_earPlugsCtrl ctrlSetStructuredText parseText _earPlugsText;
							// _earPlugsCtrl ctrlSetPosition [safeZoneX + safeZoneW - 0.14, safeZoneY + safeZoneH - 0.14, 0.24, 0.24];
							_earPlugsCtrl ctrlSetPosition [(safeZoneX / 2) + (safeZoneW / 2), safeZoneY + safeZoneH - 0.16, 0.24, 0.24];
							_earPlugsCtrl ctrlShow false;
							_earPlugsCtrl ctrlCommit 0;
						};
						_shown = ctrlShown _earPlugsCtrl;
						if (_shown) then
						{
							earPlugLevel = 1;
							earPlugsIn = false;
						}
						else
						{
							earPlugLevel = 0.1;
							earPlugsIn = true;
						};
						0.2 fadeSound earPlugLevel;
						_earPlugsCtrl ctrlShow !_shown;
					};
				}];
				waitUntil {isNull(findDisplay 60492)};
				earPlugLevel = 1;
				earPlugsIn = false;
				0.2 fadeSound 1; // fade sound back to normal
				uiSleep 0.1;
			};
		};
	};
};

if (_playerUID in RELO_var_whiteListedZeus) then
{
	// zeus screen
	call {
		0 spawn {
			scriptName "fn_earPlugs_zeus";
			earPlugLevel = 1;
			earPlugsIn = false;
			disableSerialization;
			while {true} do
			{
				waitUntil {!isNull(findDisplay 312)};
				(findDisplay 312) displayAddEventHandler ["KeyDown", {
					if (_this select 1 == 0xCF) then // used END key
					{
						_earPlugsCtrl = (_this select 0) displayCtrl 9001;
						if (isNull(_earPlugsCtrl)) then
						{
							_earPlugsCtrl = (_this select 0) ctrlCreate ["RscStructuredText", 9001];
							_earPlugsText = format ["<img align='center' shadow='0' size='2' image='media\icons\functions\earPlugs.paa'/>"];
							_earPlugsCtrl ctrlSetStructuredText parseText _earPlugsText;
							// _earPlugsCtrl ctrlSetPosition [safeZoneX + safeZoneW - 0.14, safeZoneY + safeZoneH - 0.14, 0.24, 0.24];
							_earPlugsCtrl ctrlSetPosition [(safeZoneX / 2) + (safeZoneW / 2), safeZoneY + safeZoneH - 0.16, 0.24, 0.24];
							_earPlugsCtrl ctrlShow false;
							_earPlugsCtrl ctrlCommit 0;
						};
						_shown = ctrlShown _earPlugsCtrl;
						if (_shown) then
						{
							earPlugLevel = 1;
							earPlugsIn = false;
						}
						else
						{
							earPlugLevel = 0.1;
							earPlugsIn = true;
						};
						0.2 fadeSound earPlugLevel;
						_earPlugsCtrl ctrlShow !_shown;
					};
				}];
				waitUntil {isNull(findDisplay 312)};
				earPlugLevel = 1;
				earPlugsIn = false;
				0.2 fadeSound 1; // fade sound back to normal
				uiSleep 0.1;
			};
		};
	};
};
