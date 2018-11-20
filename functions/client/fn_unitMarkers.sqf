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

	Name: fn_unitMarkers.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 8:50 PM 20/05/2016
	Modification Date: 8:10 PM 09/12/2017

	Description:

	Parameter(s): none

	Example: none

	Change Log:
	1.0.0 - original base script.
	1.0.1 - added in 3d markers for friendlies and autonomous vehicles.
	1.0.2 - refactored code structure for better conditional checks.
	1.0.3 - introduced pulsing incapacitated icon (for use with vanilla revive system).

	----------------------------------------------------------------------------------------------
*/

if (!hasInterface) exitWith {};

RELO_fncl_unitMarkers3DInit = {
	disableSerialization;
	// systemChat "INITIATED 3D MARKERS ON DISPLAY 46";
	setGroupIconsVisible [false,false];
	unitMarkers3D = addMissionEventHandler ["Draw3D", {
		_duplicateUsers = [];
		{
			if ((_x != player) || ((vehicle (cameraOn)) != player)) then
			{
				if ((str side _x == "WEST") || (str side _x == "CIV" && lifeState _x == "INCAPACITATED")) then
				{
					if (vehicle _x == _x) then
					{
						_pos = (_x modelToWorldVisual (_x selectionPosition "Spine3"));
						if !(worldToScreen _pos isEqualTo []) then
						{
							_name = (name _x);
							if (_name != "") then
							{
								_distance2d = (round (positionCameraToWorld [0,0,0] distance2d _x));
								_viewDistance = viewDistance;
								if (_distance2d < (_viewDistance - 100)) then
								{
									_distanceTranslucency = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d _x))) * 0.8;
									_distanceSize = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d _x))) * 0.8;
									_icon = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
									_color = [];
									_cameraNotOnPlayer = (((vehicle (cameraOn)) != player) && _x == player);
									_sameGroup = (group player == group _x);

									/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
									// shitty code, not used
									// _drawMiddle = vectorUp _x;
									// _drawFov = call RELO_fnc_trueZoom;
									// _drawUp = _drawMiddle vectorMultiply (0.0175 * _distance2d / _drawFov);
									// _drawDown = _drawUp vectorMultiply (0.0175 / _distance2d / _drawFov);
									// _drawPosUp = _pos vectorAdd _drawUp;
									// _drawPosDown = _pos vectorAdd _drawDown;

									// _posTop = _pos;
									// _posTop set [2, (_posTop select 2) + 1.0];

									// _posBottom = _pos;
									// _posBottom set [2, (_posBottom select 2) - 1.0];
									/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

									_role = getText (configfile >> "CfgVehicles" >> typeOf _x >> "displayName");

									if (currentVisionMode player == 0) then // normal vision
									{
										switch (true) do
										{
											case (_cameraNotOnPlayer): {_color = [0.698,0.101,0,_distanceTranslucency];}; // red
											case (_sameGroup): {_color = [0,0.501961,0,_distanceTranslucency];}; // green
											default {_color = [0,0.298039,0.596078,_distanceTranslucency]}; // blue
										};
									};
									if (currentVisionMode player == 1) then // night vision
									{
										switch (true) do
										{
											case (_cameraNotOnPlayer): {_color = [0.039215,0.160784,0.039215,_distanceTranslucency];}; // green nvg 10%
											case (_sameGroup): {_color = [0.2,0.8,0.2,_distanceTranslucency]}; // green nv 50%
											default {_color = [0.121568,0.478431,0.121568,_distanceTranslucency];}; // green nv 30%
										};
									};
									if (currentVisionMode player == 2) then // thermal vision
									{
										switch (true) do
										{
											// case (_cameraNotOnPlayer): {_color = [0.101960,0.101960,0.101960,_distanceTranslucency];}; // grey 10%
											// case (_sameGroup): {_color = [0.501961,0.501961,0.501961,_distanceTranslucency]}; // grey 50%
											// default {_color = [0.301960,0.301960,0.301960,_distanceTranslucency];}; // grey 30%
											case (_cameraNotOnPlayer): {_color = [0.101960,0.101960,0.101960,_distanceTranslucency];}; // grey 10%
											case (_sameGroup): {_color = [0.749019,0.749019,0.749019,_distanceTranslucency];}; // grey 75%
											default {_color = [0.400000,0.400000,0.400000,_distanceTranslucency];}; // grey 40%
										};
									};
									if (lifeState _x == "INCAPACITATED") then
									{
										///////////////////////////////////////////////////////////////////////////////////////////////////
										// icon translucency based upon blood level of incapacitated unit (vanilla revive system)
										_colorUnconscious = _color;
										if ((missionNamespace getVariable ["bis_revive_mode",0]) > 0) then
										{
											_iconTranslucency = 1;
											_bleedOutLevel = (_x getVariable ["#revL",9]); // blood level of incapacitated unit (rounded) from vanilla revive system
											switch (_bleedOutLevel) do
											{
												case 3: {_iconTranslucency = 1};
												case 2: {_iconTranslucency = 0.75};
												case 1: {_iconTranslucency = 0.50};
												case 0: {_iconTranslucency = 0.25};
												default {_iconTranslucency = 1};
											};
											_colorUnconscious = [_color select 0,_color select 1, _color select 2,(_distanceTranslucency * _iconTranslucency)];
										};
										///////////////////////////////////////////////////////////////////////////////////////////////////
										if (player getUnitTrait "MEDIC") then
										{
											drawIcon3D ["a3\ui_f\data\igui\cfg\cursors\watch_ca.paa", _colorUnconscious, _pos, _distanceSize * (RELO_var_unitMarkersPulse + 1.5), _distanceSize * (RELO_var_unitMarkersPulse + 1.5), 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
											drawIcon3D ["a3\ui_f\data\igui\cfg\cursors\unitUnconscious_ca.paa", _colorUnconscious, _pos, _distanceSize * RELO_var_unitMarkersPulse, _distanceSize * RELO_var_unitMarkersPulse, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
										}
										else
										{
											drawIcon3D ["a3\ui_f\data\igui\cfg\cursors\unitUnconscious_ca.paa", _colorUnconscious, _pos, _distanceSize * RELO_var_unitMarkersPulse, _distanceSize * RELO_var_unitMarkersPulse, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
										};
									}
									else
									{
										if (leader group _x == _x) then
										{
											drawIcon3D ["a3\ui_f\data\igui\cfg\cursors\leader_ca.paa", _color, _pos, _distanceSize, _distanceSize, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
										};
									};
									if (_x in [cursorObject,cursorTarget]) then
									{
										/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
										// extended icon draw.

										// _fov = call RELO_fnc_trueZoom;
										// _cameraPos = positionCameraToWorld [0,0,0];

										// drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, "", 0, 0.0333, "RobotoCondensed", "center", false]; // middle

										// _distance = _pos distance _cameraPos;
										// _direction = _pos vectorDiff _cameraPos;

										// _drawMiddle = vectorNormalized (((_cameraPos vectorFromTo positionCameraToWorld [0,0,1]) vectorCrossProduct (vectorUp _x)) vectorCrossProduct _direction);
										// _drawUpUp = _drawMiddle vectorMultiply ((0.0190 + (0.0333 / 10)) * _distance / _fov); _drawPosUpUp = _pos vectorAdd _drawUpUp;
										// _drawUp = _drawMiddle vectorMultiply ((0.0150 + (0.0333 / 10)) * _distance / _fov); _drawPosUp = _pos vectorAdd _drawUp;
										// _drawDown = _drawMiddle vectorMultiply ((-0.0010 - (0.0333 / 10)) * _distance / _fov); _drawPosDown = _pos vectorAdd _drawDown;
										// _drawDownDown = _drawMiddle vectorMultiply ((-0.0050 - (0.0333 / 10)) * _distance / _fov); _drawPosDownDown = _pos vectorAdd _drawDownDown;

										// if (cameraView isEqualTo "EXTERNAL") then // adjustment for external camera view
										// {
											// _distance = _distance - 2;
										// };

										// _posAboveAbove = _drawPosUpUp;
										// drawIcon3D ["", _color, _posAboveAbove, _distanceSize, _distanceSize, 0, _name, 1, _distanceSize * 0.0333, "RobotoCondensed", "center", false]; // bottom
										// _posAbove = _drawPosUp;
										// drawIcon3D ["", _color, _posAbove, _distanceSize, _distanceSize, 0, toUpper _role, 1, _distanceSize * 0.0333, "RobotoCondensed", "center", false]; // top
										// _drawHealth = false;
										// if (player getUnitTrait "MEDIC") then
										// {
											// if ("Medikit" in (items player)) then
											// {
												// _drawHealth = true;
												// _posBelow = _drawPosDown;
												// drawIcon3D ["", _color, _posBelow, _distanceSize, _distanceSize, 0, format ["%1%2 Health",(1 - getDammage _x) * 100,"%"], 1, _distanceSize * 0.0333, "RobotoCondensed", "center", false]; // top
											// };
										// };
										// if (("ItemGPS" in (assignedItems player)) && ("ItemGPS" in (assignedItems _x))) then
										// {
											// if !(_drawHealth) then
											// {
												// _posBelowBelow = _drawPosDown;
												// drawIcon3D ["", _color, _posBelowBelow, _distanceSize, _distanceSize, 0, format ["%1m Away",floor _distance], 1, _distanceSize * 0.0333, "RobotoCondensed", "center", false]; // bottom
											// }
											// else
											// {
												// _posBelowBelow = _drawPosDownDown;
												// drawIcon3D ["", _color, _posBelowBelow, _distanceSize, _distanceSize, 0, format ["%1m Away",floor _distance], 1, _distanceSize * 0.0333, "RobotoCondensed", "center", false]; // bottom
											// };
										// };
										///////////////////////////////////////////////////////////////////////////////////////////////////////////////
										drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, format ["%1",_name], 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
									}
									else
									{
										drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
									};
								};
							};
						};
					}
					else
					{
						_pos = ((vehicle _x) modelToWorldVisual [0,0,0]);
						if !(worldToScreen _pos isEqualTo []) then
						{
							_crew = "";
							if (alive (vehicle _x)) then
							{
								_isAutonomousVehicle = (getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "vehicleClass") == "Autonomous");
								if !(_isAutonomousVehicle) then
								{
									_allCrew = (crew (vehicle _x));
									if !((count _allCrew) == 0) then
									{
										if (player in _allCrew) then
										{
											_crew = "";
										}
										else
										{
											{
												if !(_x in _duplicateUsers) then
												{
													if (_crew == "") then
													{
														_crew = (name _x);
													}
													else
													{
														_crew = format ["%1, %2",_crew, (name _x)];
													};
												};
												_duplicateUsers pushBack _x;
											} forEach _allCrew;
										};
									};
								};
							};
							if (_crew != "") then
							{
								_distance2d = (round (positionCameraToWorld [0,0,0] distance2d (vehicle _x)));
								_viewDistance = viewDistance;
								if (_distance2d < (_viewDistance - 100)) then
								{
									_distanceTranslucency = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d (vehicle _x)))) * 0.8;
									_distanceSize = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d (vehicle _x)))) * 0.8;
									_icon = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
									_color = [];
									_cameraNotOnPlayer = (((vehicle (cameraOn)) != player) && (vehicle _x == vehicle player));
									_sameGroup = (group player == group (vehicle _x));
									if (currentVisionMode player == 0) then // normal vision
									{
										switch (true) do
										{
											case (_cameraNotOnPlayer): {_color = [0.698,0.101,0,_distanceTranslucency];}; // red
											case (_sameGroup): {_color = [0,0.501961,0,_distanceTranslucency];}; // green
											default {_color = [0,0.298039,0.596078,_distanceTranslucency]}; // blue
										};
									};
									if (currentVisionMode player == 1) then // night vision
									{
										switch (true) do
										{
											case (_cameraNotOnPlayer): {_color = [0.039215,0.160784,0.039215,_distanceTranslucency];}; // green nvg 10%
											case (_sameGroup): {_color = [0.2,0.8,0.2,_distanceTranslucency]}; // green nv 50%
											default {_color = [0.121568,0.478431,0.121568,_distanceTranslucency];}; // green nv 30%
										};
									};
									if (currentVisionMode player == 2) then // thermal vision
									{
										switch (true) do
										{
											case (_cameraNotOnPlayer): {_color = [0.101960,0.101960,0.101960,_distanceTranslucency];}; // grey 10%
											case (_sameGroup): {_color = [0.501961,0.501961,0.501961,_distanceTranslucency]}; // grey 50%
											default {_color = [0.301960,0.301960,0.301960,_distanceTranslucency];}; // grey 30%
										};
									};
									// if (cursorObject isEqualTo (vehicle _x)) then
									if ((vehicle _x) in [cursorObject,cursorTarget]) then
									{
										drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, format ["%1",_crew], 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
									}
									else
									{
										drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
									};
								};
							};
						};
					};
				};
			};
		} forEach (allUnits select {(str side _x isEqualTo "WEST") || (str side _x isEqualTo "CIV" && lifeState _x == "INCAPACITATED")});
	}];
	///////////////////////////////////////////////////////////////////////////////////////////////
	RELO_fncl_autonomousMarkers3D = addMissionEventHandler ["Draw3D", {
		_allAutonomous = allUnitsUAV select {side _x isEqualTo WEST};
		{
			_pos = (_x modelToWorldVisual [0,0,0]);
			if !(worldToScreen _pos isEqualTo []) then
			{
				_name = name ((uavControl _x) select 0);
				if (((vehicle (cameraOn)) != player) && (isUAVConnected _x)) then
				{
					_name = "";
				}
				else
				{
					if (_name isEqualTo "Error: No vehicle") then
					{
						_name = "No Controller";
					};
				};
				if (_name != "") then
				{
					_distance2d = (round (positionCameraToWorld [0,0,0] distance2d _x));
					_viewDistance = viewDistance;
					if (_distance2d < (_viewDistance - 100)) then
					{
						_distanceTranslucency = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d _x))) * 0.8;
						_distanceSize = (1 - ((1 / _viewDistance) * (positionCameraToWorld [0,0,0] distance2d _x))) * 0.8;
						_icon = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
						_color = [];
						// _cameraNotOnPlayer = (((vehicle (cameraOn)) != player) && _x == player);
						_cameraNotOnPlayer = (((vehicle (cameraOn)) != player) && (vehicle _x == vehicle player));
						_sameGroup = (group player == group ((uavControl _x) select 0));
						if (currentVisionMode player == 0) then // normal vision
						{
							switch (true) do
							{
								case (_cameraNotOnPlayer): {_color = [0.698,0.101,0,_distanceTranslucency];}; // red
								case (_sameGroup): {_color = [0,0.501961,0,_distanceTranslucency];}; // green
								default {_color = [0,0.298039,0.596078,_distanceTranslucency]}; // blue
							};
						};
						if (currentVisionMode player == 1) then // night vision
						{
							switch (true) do
							{
								case (_cameraNotOnPlayer): {_color = [0.039215,0.160784,0.039215,_distanceTranslucency];}; // green nvg 10%
								case (_sameGroup): {_color = [0.2,0.8,0.2,_distanceTranslucency]}; // green nv 50%
								default {_color = [0.121568,0.478431,0.121568,_distanceTranslucency];}; // green nv 30%
							};
						};
						if (currentVisionMode player == 2) then // thermal vision
						{
							switch (true) do
							{
								case (_cameraNotOnPlayer): {_color = [0.101960,0.101960,0.101960,_distanceTranslucency];}; // grey 10%
								case (_sameGroup): {_color = [0.501961,0.501961,0.501961,_distanceTranslucency]}; // grey 50%
								default {_color = [0.301960,0.301960,0.301960,_distanceTranslucency];}; // grey 30%
							};
						};
						// if (cursorObject isEqualTo _x) then
						if (_x in [cursorObject,cursorTarget]) then
						{
							drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, format ["%1",_name], 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
						}
						else
						{
							drawIcon3D [_icon, _color, _pos, _distanceSize, _distanceSize, 0, "", 0, _distanceSize * 0.0333, "RobotoCondensed", "center", false];
						};
					};
				};
			};
		} forEach (_allAutonomous);
	}];
};

RELO_fncl_unitMarkersMapInit = {
	disableSerialization;
	// systemChat "INITIATED MAP MARKERS ON DISPLAY 12 CTRL 51";
	_mapCtrl = findDisplay 12 displayCtrl 51;
	unitMarkersMap = _mapCtrl ctrlAddEventHandler ["Draw", {
		#define _between(_compare,_start,_end) (if ((_compare > _start) && (_compare <= _end)) then {true} else {false})
		///////////////////////////////////////////////////////////////////////////////////////////////
		_showVehicleName = true;
		_showCrewNames = true;
		///////////////////////////////////////////////////////////////////////////////////////////////
		_duplicateUsers = [];
		{
			if ((str side _x == "WEST") || (str side _x == "CIV" && lifeState _x == "INCAPACITATED") || (_x == player)) then
			{
				if (vehicle _x == _x) then
				{
					_name = (name _x);
					if (_name != "") then
					{
						_pos = (_x modelToWorldVisual [0,0,0]);
						_dir = getDir _x;
						_icon = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "icon");
						_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
						_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
						_color = [];
						_lifeState = lifeState _x;
						_damage = damage _x;
						switch (_lifeState) do
						{
							case "HEALTHY": {_color = [0,0.298039,0.596078,1];}; // blue
							case "INJURED": {
								switch (true) do
								{
									case (_between(_damage,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
									case (_between(_damage,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
									case (_between(_damage,0.5,1)): {_color = [1,0.2,0,1];}; // red
								};
							};
							case "INCAPACITATED": {_color = [0,0,0,1];}; // black
							case "DEAD": {_color = [1,1,1,1];};
							case "DEAD-RESPAWN": {_color = [1,1,1,1];};
							default {_color = [0,0.298039,0.596078,1];}; // blue
						};
						if (_x == player) then
						{
							_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
							_colorPlayer = [0.698,0.101,0,1]; // red
							(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
						}
						else
						{
							_sameGroup = (group player == group _x);
							if (_sameGroup) then
							{
								_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
								_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
								(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
							};
						};
						if ((ctrlMapScale (_this select 0)) < 0.025) then
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_name], 0, _textScale, "RobotoCondensed", "right"];
						}
						else
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
						};
						(_this select 0) ctrlCommit 1;
					};
				}
				else
				{
					_crew = "";
					if (_showCrewNames) then
					{
						if (alive (vehicle _x)) then
						{
							_isAutonomousVehicle = (getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "vehicleClass") == "Autonomous");
							if !(_isAutonomousVehicle) then
							{
								_allCrew = (crew (vehicle _x) select {alive _x});
								if !((count _allCrew) == 0) then
								{
									{
										if !(_x in _duplicateUsers) then
										{
											if (_crew == "") then
											{
												_crew = (name _x);
											}
											else
											{
												_crew = format ["%1, %2",_crew, (name _x)];
											};
										};
										_duplicateUsers pushBack _x;
									} forEach _allCrew;
								};
							};
						};
					}
					else
					{
						if (alive (vehicle _x)) then
						{
							_isAutonomousVehicle = (getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "vehicleClass") == "Autonomous");
							if !(_isAutonommousVehicle) then
							{
								_driver = name (driver vehicle _x);
								_crewNum = ((count crew (vehicle _x)));
								if (_driver == "Error: No vehicle") then
								{
									_driver = "No Driver";
									_crew = format ["%1, +%2",_driver, _crewNum];
								}
								else
								{
									if (_crewNum > 1) then
									{
										_crew = format ["%1, +%2",_driver, (_crewNum - 1)];
									}
									else
									{
										_crew = format ["%1",_driver];
									};
								};
							};
						};
					};
					if (_crew != "") then
					{
						_pos = ((vehicle _x) modelToWorldVisual [0,0,0]);
						_dir = getDir (vehicle _x);
						_icon = getText (configfile >> "CfgVehicles" >> (typeOf vehicle _x) >> "icon");
						_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
						_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
						_name = gettext (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
						_color = [];
						_damageVehicle = damage vehicle _x;
						switch (true) do
						{
							case (_between(_damageVehicle,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
							case (_between(_damageVehicle,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
							case (_between(_damageVehicle,0.5,1)): {_color = [1,0.2,0,1];}; // red
							default {_color = [0,0.298039,0.596078,1];}; // blue
						};
						if (player in crew (vehicle _x)) then
						{
							_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
							_colorPlayer = [0.698,0.101,0,1]; // red
							(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
						}
						else
						{
							_sameGroup = (group player == group (vehicle _x));
							if (_sameGroup) then
							{
								_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
								_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
								(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
							};
						};

						if (_showVehicleName) then
						{
							if ((ctrlMapScale (_this select 0)) < 0.025) then
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1 - %2",_name,_crew], 0, _textScale, "RobotoCondensed", "right"];
							}
							else
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
							};
						}
						else
						{
							if ((ctrlMapScale (_this select 0)) < 0.025) then
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_crew], 0, _textScale, "RobotoCondensed", "right"];
							}
							else
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
							};
							(_this select 0) ctrlCommit 1;
						};
					};
				};
			};
		} forEach (allUnits select {(str side _x isEqualTo "WEST") || (str side _x isEqualTo "CIV" && lifeState _x == "INCAPACITATED")});
	}];
	///////////////////////////////////////////////////////////////////////////////////////////////
	autonomousMarkers = _mapCtrl ctrlAddEventHandler ["Draw", {
		_allAutonomous = allUnitsUAV select {side _x isEqualTo WEST};
		#define _between(_compare,_start,_end) (if ((_compare > _start) && (_compare <= _end)) then {true} else {false})
		///////////////////////////////////////////////////////////////////////////////////////////////
		_showVehicleName = true;
		_showCrewNames = true;
		///////////////////////////////////////////////////////////////////////////////////////////////
		{
			_crew = name ((uavControl _x) select 0);
			if (_crew != "") then
			{
				if (_crew isEqualTo "Error: No vehicle") then
				{
					_crew = "No Controller";
				};
				_pos = (_x modelToWorldVisual [0,0,0]);
				_dir = getDir _x;
				_icon = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "icon");
				_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
				_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
				_name = gettext (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
				_color = [];
				_lifeState = lifeState _x;
				_damage = damage _x;
				switch (true) do
				{
					case (_between(_damage,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
					case (_between(_damage,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
					case (_between(_damage,0.5,1)): {_color = [1,0.2,0,1];}; // red
					case (!alive _x):{_color = [1,1,1,1];};
					default {_color = [0,0.298039,0.596078,1];}; // blue
				};
				_sameGroup = (group player == group ((uavControl _x) select 0));
				if (_sameGroup) then
				{
					_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
					_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
					(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
				};
				if (_showVehicleName) then
				{
					if ((ctrlMapScale (_this select 0)) < 0.025) then
					{
						(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1 - %2",_name,_crew], 0, _textScale, "RobotoCondensed", "right"];
					}
					else
					{
						(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
					};
				}
				else
				{
					if ((ctrlMapScale (_this select 0)) < 0.025) then
					{
						(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_crew], 0, _textScale, "RobotoCondensed", "right"];
					}
					else
					{
						(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
					};
					(_this select 0) ctrlCommit 1;
				};
			};
		} forEach (_allAutonomous);
	}];
};

RELO_fncl_unitMarkersMiniMapInit = {
	disableSerialization;
	// _mapCtrl = controlNull;
	// {
		// if (['311',(str _x),FALSE] call BIS_fnc_inString) then
		// {
			// if (!isNull (_x displayCtrl 101)) exitWith
			// {
				// _mapCtrl = (_x displayCtrl 101);
			// };
		// };
	// } forEach (uiNamespace getVariable 'IGUI_displays');
	_mapCtrl = (uiNamespace getVariable ["RscCustomInfoMiniMap",displayNull] displayCtrl 101);
	if (!isNull _mapCtrl) then
	{
		_mapCtrl ctrlRemoveAllEventHandlers "Draw";
		// systemChat format ["INITIATED MINIMAP MARKERS ON %1 %2",toUpper(str(uiNamespace getVariable ["RscCustomInfoMiniMap",displayNull])),toUpper(str(_mapCtrl))];
		unitMarkersMiniMap = _mapCtrl ctrlAddEventHandler ["Draw", {
			#define _between(_compare,_start,_end) (if ((_compare > _start) && (_compare <= _end)) then {true} else {false})
			///////////////////////////////////////////////////////////////////////////////////////////////
			_showVehicleName = true;
			_showCrewNames = true;
			///////////////////////////////////////////////////////////////////////////////////////////////
			_duplicateUsers = [];
			{
				if ((str side _x == "WEST") || (str side _x == "CIV" && lifeState _x == "INCAPACITATED") || (_x == player)) then
				{
					if (vehicle _x == _x) then
					{
						_name = (name _x);
						if (_name != "") then
						{
							_pos = (_x modelToWorldVisual [0,0,0]);
							_dir = getDir _x;
							_icon = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "icon");
							_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
							_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
							_color = [];
							_lifeState = lifeState _x;
							_damage = damage _x;
							switch (_lifeState) do
							{
								case "HEALTHY": {_color = [0,0.298039,0.596078,1];}; // blue
								case "INJURED": {
									switch (true) do
									{
										case (_between(_damage,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
										case (_between(_damage,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
										case (_between(_damage,0.5,1)): {_color = [1,0.2,0,1];}; // red
									};
								};
								case "INCAPACITATED": {_color = [0,0,0,1];}; // black
								case "DEAD": {_color = [1,1,1,1];};
								case "DEAD-RESPAWN": {_color = [1,1,1,1];};
								default {_color = [0,0.298039,0.596078,1];}; // blue
							};
							if (_x == player) then
							{
								// _iconPlayer = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
								_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
								_colorPlayer = [0.698,0.101,0,1]; // red
								(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
							}
							else
							{
								// _sameGroup = (((group player) == (group _x)) && _x != player);
								_sameGroup = (group player == group _x);
								if (_sameGroup) then
								{
									// _iconPlayer = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
									_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
									_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
									(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
								};
							};
							if ((ctrlMapScale (_this select 0)) < 0.025) then
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_name], 0, _textScale, "RobotoCondensed", "right"];
							}
							else
							{
								(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
							};
							(_this select 0) ctrlCommit 1;
						};
					}
					else
					{
						_crew = "";
						if (_showCrewNames) then
						{
							if (alive (vehicle _x)) then
							{
								_isAutonomousVehicle = (getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "vehicleClass") == "Autonomous");
								if !(_isAutonomousVehicle) then
								{
									_allCrew = (crew (vehicle _x) select {alive _x});
									if !((count _allCrew) == 0) then
									{
										{
											if !(_x in _duplicateUsers) then
											{
												if (_crew == "") then
												{
													_crew = (name _x);
												}
												else
												{
													_crew = format ["%1, %2",_crew, (name _x)];
												};
											};
											_duplicateUsers pushBack _x;
										} forEach _allCrew;
									};
								};
							};
						}
						else
						{
							if (alive (vehicle _x)) then
							{
								_isAutonomousVehicle = (getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "vehicleClass") == "Autonomous");
								if !(_isAutonommousVehicle) then
								{
									_driver = name (driver vehicle _x);
									_crewNum = ((count crew (vehicle _x)));
									if (_driver == "Error: No vehicle") then
									{
										_driver = "No Driver";
										_crew = format ["%1, +%2",_driver, _crewNum];
									}
									else
									{
										if (_crewNum > 1) then
										{
											_crew = format ["%1, +%2",_driver, (_crewNum - 1)];
										}
										else
										{
											_crew = format ["%1",_driver];
										};
									};
								};
							};
						};
						if (_crew != "") then
						{
							_pos = ((vehicle _x) modelToWorldVisual [0,0,0]);
							_dir = getDir (vehicle _x);
							_icon = getText (configfile >> "CfgVehicles" >> (typeOf vehicle _x) >> "icon");
							_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
							_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
							_name = gettext (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
							_color = [];

							_damageVehicle = damage vehicle _x;
							switch (true) do
							{
								case (_between(_damageVehicle,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
								case (_between(_damageVehicle,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
								case (_between(_damageVehicle,0.5,1)): {_color = [1,0.2,0,1];}; // red
								default {_color = [0,0.298039,0.596078,1];}; // blue
							};
							if (player in crew (vehicle _x)) then
							{
								_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
								_colorPlayer = [0.698,0.101,0,1]; // red
								(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
							}
							else
							{
								_sameGroup = (group player == group (vehicle _x));
								if (_sameGroup) then
								{
									_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
									_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
									(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
								};
							};
							if (_showVehicleName) then
							{
								if ((ctrlMapScale (_this select 0)) < 0.025) then
								{
									(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1 - %2",_name,_crew], 0, _textScale, "RobotoCondensed", "right"];
								}
								else
								{
									(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
								};
							}
							else
							{
								if ((ctrlMapScale (_this select 0)) < 0.025) then
								{
									(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_crew], 0, _textScale, "RobotoCondensed", "right"];
								}
								else
								{
									(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
								};
								(_this select 0) ctrlCommit 1;
							};
						};
					};
				};
			} forEach (allUnits select {(str side _x isEqualTo "WEST") || (str side _x isEqualTo "CIV" && lifeState _x == "INCAPACITATED")});
		}];
		///////////////////////////////////////////////////////////////////////////////////////////////
		autonomousMarkersMiniMap = _mapCtrl ctrlAddEventHandler ["Draw", {
			// _distanceToRender = 125 * (1 + (abs (round (3.6 * (velocityModelSpace vehicle player select 1))) / 25));
			// _allAutonomous = allUnitsUAV select {((_x distance positionCameraToWorld [0,0,0]) <= _distanceToRender) && (side _x isEqualTo WEST)};
			_allAutonomous = allUnitsUAV select {side _x isEqualTo WEST};
			#define _between(_compare,_start,_end) (if ((_compare > _start) && (_compare <= _end)) then {true} else {false})
			///////////////////////////////////////////////////////////////////////////////////////////////
			_showVehicleName = true;
			_showCrewNames = true;
			///////////////////////////////////////////////////////////////////////////////////////////////
			{
				_crew = name ((uavControl _x) select 0);
				if (_crew != "") then
				{
					if (_crew isEqualTo "Error: No vehicle") then
					{
						_crew = "No Controller";
					};
					_pos = (_x modelToWorldVisual [0,0,0]);
					_dir = getDir _x;
					_icon = getText (configfile >> "CfgVehicles" >> (typeOf _x) >> "icon");
					_iconScale = (1 - ctrlMapScale (_this select 0)) min 24 max 24;
					_textScale = (1 - ctrlMapScale (_this select 0)) min 0.06 max 0.06;
					_name = gettext (configFile >> "CfgVehicles" >> (typeOf vehicle _x) >> "displayName");
					_color = [];
					_lifeState = lifeState _x;
					_damage = damage _x;
					switch (true) do
					{
						case (_between(_damage,0,0.25)): {_color = [0,0.298039,0.596078,1];}; // blue
						case (_between(_damage,0.25,0.5)): {_color = [1,0.6,0,1];}; // orange
						case (_between(_damage,0.5,1)): {_color = [1,0.2,0,1];}; // red
						case (!alive _x):{_color = [1,1,1,1];};
						default {_color = [0,0.298039,0.596078,1];}; // blue
					};
					_sameGroup = (group player == group ((uavControl _x) select 0));
					if (_sameGroup) then
					{
						_iconPlayer = "a3\ui_f\data\igui\cfg\cursors\select_ca.paa";
						_colorPlayer = [0.121568,0.478431,0.121568,1]; // green
						(_this select 0) drawIcon [_iconPlayer, _colorPlayer, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, 0, "" , 0, 0, "RobotoCondensed", ""];
					};
					if (_showVehicleName) then
					{
						if ((ctrlMapScale (_this select 0)) < 0.025) then
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1 - %2",_name,_crew], 0, _textScale, "RobotoCondensed", "right"];
						}
						else
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
						};
					}
					else
					{
						if ((ctrlMapScale (_this select 0)) < 0.025) then
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, format ["%1",_crew], 0, _textScale, "RobotoCondensed", "right"];
						}
						else
						{
							(_this select 0) drawIcon [_icon, _color, [(_pos select 0),(_pos select 1)], _iconScale, _iconScale, _dir, "", 0, _textScale, "RobotoCondensed", "right"];
						};
						(_this select 0) ctrlCommit 1;
					};
				};
			} forEach (_allAutonomous);
		}];
	};
};

[] spawn
{
	scriptName "RELO_var_unitMarkersPulse";
	RELO_var_unitMarkersPulse = 0;
	_maxCount = 1.5;
	_incCount = 0.25;

	_sleep = 0.05;
	while {true} do
	{
		if (RELO_var_unitMarkersPulse <= 0) then
		{
			while {RELO_var_unitMarkersPulse < _maxCount} do
			{
				sleep _sleep;
				RELO_var_unitMarkersPulse = (RELO_var_unitMarkersPulse + _incCount);
			};
		};
		if (RELO_var_unitMarkersPulse == _maxCount) then
		{
			while {RELO_var_unitMarkersPulse > 0} do
			{
				sleep _sleep;
				RELO_var_unitMarkersPulse = (RELO_var_unitMarkersPulse - _incCount);
			};
		};
	};
};

RELO_fnc_trueZoom = { // credits to KillzoneKid for this function.
    (
        [0.5,0.5]
        distance2D
        worldToScreen
        positionCameraToWorld
        [0,3,4]
    ) * (
        getResolution
        select 5
    ) / 2
};

[] spawn {
	disableSerialization;
	waitUntil {!isNull findDisplay 46};
	call RELO_fncl_unitMarkers3DInit;
};

[] spawn {
	disableSerialization;
	waitUntil {!(isNull (findDisplay 12 displayCtrl 51))};
	call RELO_fncl_unitMarkersMapInit;
};

[] spawn {
	disableSerialization;
	waitUntil {!(isNull (uiNamespace getVariable ["RscCustomInfoMiniMap",displayNull] displayCtrl 101))};
	call RELO_fncl_unitMarkersMiniMapInit;
};

// allDisplays
// [Display #0,Display #313,Display #70,Display #46,Display #49,Display #12]

// uiNamespace getVariable "IGUI_Displays"
// [Display #305,Display #303,Display #311,Display #320,Display #313,Display #315,Display #312,Display #314,Display #311,Display #320,Display #313,Display #315,Display #312,Display #316,Display #319,Display #314,Display #317,Display #318,Display #300,Display #300,Display #-1,Display #300]

// player groupChat "Maplike display controls";
// {
	// _disp = _x;
	// {
		// _ctrl = _x;
		// if (ctrlType _ctrl in[100,101] or toUpper(ctrlClassName _ctrl) find "MAP" > -1) then
		// {
			// systemChat (str(ctrlIDD _disp) + " " + str(ctrlIDC _ctrl) + " " + ctrlClassName _ctrl);
		// };
	// } forEach allControls _x;
// } forEach allDisplays + (uiNamespace getVariable "IGUI_Displays");

// 313 51 Map
// 313 10303 Map
// 12 -1 CA_RscMapSignalBackground
// 12 -1 CA_RscMapSignalPicture
// 12 -1 CA_RscMapSignalText
// 12 51 CA_Map
// 311 13301 MiniMap
// 311 101 CA_MiniMap
// 312 1200 BackgroundMap
// 312 100 Map
// 311 13301 MiniMap
// 311 101 CA_MiniMap
// 312 1200 BackgroundMap
// 312 100 Map

// if (isNil "unitMarkers_isOn") then
// {
	// call unitMarkersInit;
	// unitMarkers_isOn = true;
// }
// else
// {
	// removeMissionEventHandler ["Draw3D", unitMarkers3D];
	// removeMissionEventHandler ["Draw3D", RELO_fncl_autonomousMarkers3D];
	// _mapCtrl = findDisplay 12 displayCtrl 51;
	// _mapCtrl ctrlRemoveEventHandler ["Draw", unitMarkersMap];
	// _mapCtrl = controlNull;
	// {
		// if ((['311',(str _x),FALSE] call BIS_fnc_inString) && (!isNull (_x displayCtrl 101))) exitWith
		// {
			// _mapCtrl = (_x displayCtrl 101);
		// };
	// } forEach (uiNamespace getVariable 'IGUI_displays');
	// if (!(isNull _mapCtrl) && !(isNil "unitMarkersGPS")) then
	// {
		// _mapCtrl ctrlRemoveEventHandler ["Draw", unitMarkersGPS];
	// };
	// unitMarkers_isOn = nil;
// };
