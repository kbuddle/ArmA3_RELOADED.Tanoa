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
	
	Name: fn_fireAndSmoke.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - credits to original BIS code.
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description:

	Parameter(s): none

	Example: [getPos this, "FIRE_LARGE", 20] remoteExec ["RELO_fnc_fireAndSmoke",[0,-2] select isDedicated];
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

private["_effect","_pos","_fire","_smoke","_duration"];
private["_brightness","_color","_ambient","_intensity","_attenuation"];
private["_eFire","_eSmoke","_eLight"];

_pos		= _this select 0;
_effect		= _this select 1;
_duration	= _this select 2;

_fire		= "";
_smoke		= "";
_eLight		= objNull;
_color		= [1,0.85,0.6];
_ambient	= [1,0.3,0];

switch (_effect) do
{
	case "FIRE_SMALL" : {
			_fire 	= "SmallDestructionFire";
			_smoke 	= "SmallDestructionSmoke";
		};
	case "FIRE_MEDIUM" : {
			_fire 	= "MediumDestructionFire";
			_smoke 	= "MediumDestructionSmoke";
			_brightness	= 1.0;
			_intensity	= 400;
			_attenuation	= [0,0,0,2];
		};
	case "FIRE_LARGE" : {
			_fire 	= "BigDestructionFire";
			_smoke 	= "BigDestructionSmoke";
			_brightness	= 1.0;
			_intensity	= 1600;
			_attenuation	= [0,0,0,1.6];
		};
	case "SMOKE_SMALL" : {
			_smoke 	= "SmallDestructionSmoke";
		};
	case "SMOKE_MEDIUM" : {
			_smoke 	= "MediumSmoke";
		};
	case "SMOKE_LARGE" : {
			_smoke 	= "BigDestructionSmoke";
	};
};

if (_fire != "") then
{
	_eFire = "#particlesource" createVehicleLocal _pos;
	_eFire setParticleClass _fire;
	_eFire setPosATL _pos;
	if !(_duration isEqualTo -1) then
	{
		[_eFire,_duration] spawn
		{
			params ["_eFire","_duration"];
			uiSleep _duration;
			deleteVehicle _eFire;
		};
	};
};

if (_smoke != "") then
{
	_eSmoke = "#particlesource" createVehicleLocal _pos;
	_eSmoke setParticleClass _smoke;
	_eSmoke setPosATL _pos;
	if !(_duration isEqualTo -1) then
	{
		[_eSmoke,_duration] spawn
		{
			params ["_eSmoke","_duration"];
			uiSleep _duration;
			deleteVehicle _eSmoke;
		};
	};
};

//create lightsource
if (_effect in ["FIRE_LARGE","FIRE_MEDIUM"]) then
{
	_pos   = [_pos select 0,_pos select 1,(_pos select 2)+1];
	_eLight = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
	_eLight setPosATL _pos;

	_eLight setLightBrightness _brightness;
	_eLight setLightColor _color;
	_eLight setLightAmbient _ambient;
	_eLight setLightIntensity _intensity;
	_eLight setLightAttenuation _attenuation;
	_eLight setLightDayLight false;
	if !(_duration isEqualTo -1) then
	{
		[_eLight,_duration] spawn
		{
			params ["_eLight","_duration"];
			uiSleep _duration;
			deleteVehicle _eLight;
		};
	};
};
