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
	
	Name: fn_serviceUAV.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description: Invade & Annex - Main AO calculations

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

_customResupply = true;

///////////////////////////////////////////////////////////////////////////////
_unit = _this select 0;
///////////////////////////////////////////////////////////////////////////////
_vehicle = vehicle _unit;
_vehicleClass = typeOf _vehicle;
_vehicleCfg = configFile >> "CfgVehicles" >> _vehicleClass;
_vehicleName = getText (_vehicleCfg >> "displayName");
///////////////////////////////////////////////////////////////////////////////
if (driver _vehicle != _unit) exitWith
{
	["You Must Be In The Driver Seat To Service A Vehicle.", 1] call RELO_fnc_titleTextGlobal;
	uiSleep 2;
	["", 1] call RELO_fnc_titleTextGlobal;
};
///////////////////////////////////////////////////////////////////////////////
if (isNil "RELO_var_servicingVehicle") then
{
	RELO_var_servicingVehicle = false;
};
///////////////////////////////////////////////////////////////////////////////
_servicesCompletedCount = 0;
///////////////////////////////////////////////////////////////////////////////
if !(RELO_var_servicingVehicle) then
{
	_vehicle lockDriver true;
	_vehicle lockCargo true;
	///////////////////////////////////////////////////////////////////////////////
	RELO_var_servicingVehicle = true;
	[_vehicle,_unit,_vehicleName] spawn {
		_vehicle = _this select 0;
		_unit = _this select 1;
		_vehicleName = _this select 2;
		_vehicle engineOn false;
		while {RELO_var_servicingVehicle} do
		{
			if (!(driver _vehicle == _unit) || (isEngineOn _vehicle) || !(alive _vehicle) || (cameraOn == player)) then
			{
				RELO_var_servicingVehicle = false;
				if !(isNull _vehicle) then
				{
					_text = format ["Servicing %1 Aborted!", _vehicleName];
					[_text, 1] call RELO_fnc_titleTextGlobal;
					uiSleep 1;
				};
				_vehicle lockDriver false;
				_vehicle lockCargo false;
			};
			uiSleep 0.1;
		};
		uiSleep 2;
		["", 1] call RELO_fnc_titleTextGlobal;
	};
	///////////////////////////////////////////////////////////////////////////////
	uiSleep 1;
	///////////////////////////////////////////////////////////////////////////////
	if (RELO_var_servicingVehicle) then
	{
		_text = format ["Servicing %1, Please Wait...", _vehicleName];
		[_text, 1] call RELO_fnc_titleTextGlobal;
		uiSleep 5;
		if !(RELO_var_servicingVehicle) exitWith {};
		_vehicle setVelocity [0,0,0];
		_vehicleDamage = getDammage _vehicle;
		_vehicleHitPointsAllArr = getAllHitPointsDamage _vehicle;
		// [["HitHull","HitFuel","HitAvionics","HitMissiles","HitEngine1","HitEngine2","HitEngine","HitHRotor","HitVRotor","HitGlass1","HitGlass2","HitGlass3","HitGlass4","HitGlass5","HitGlass6","HitGlass7","HitGlass8","HitGlass9","HitGlass10","HitGlass11","HitGlass12","HitGlass13","HitGlass14","HitRGlass","HitLGlass","HitEngine3","HitWinch","HitTransmission","HitLight","HitHydraulics","HitGear","HitHStabilizerL1","HitHStabilizerR1","HitVStabilizer1","HitTail","HitPitotTube","HitStaticPort","HitStarter1","HitStarter2","HitStarter3","","","HitTurret","HitGun","HitTurret","HitGun","HitTurret","HitGun"],["","fuel_hit","avionics_hit","ammo_hit","engine_1_hit","engine_2_hit","engine_hit","main_rotor_hit","tail_rotor_hit","glass1","glass2","glass3","glass4","glass5","glass6","glass7","glass8","glass9","glass10","glass11","glass12","glass13","glass14","","","","slingload0","transmission","","","","","","","","","","","","","light_l","light_r","","","","","",""],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
		if !(_vehicleHitPointsAllArr isEqualTo []) then // some autonomous vehicles don't have any hitpoints.
		{
			_vehicleHitPointsNameArr = _vehicleHitPointsAllArr select 0;
			_vehicleHitPointsDamageArr = _vehicleHitPointsAllArr select 2;
			_vehicleDamageHitPointDamage = {_x > 0} count _vehicleHitPointsDamageArr;
			if ((_vehicleDamage > 0) || (_vehicleDamageHitPointDamage > 0)) then
			{
				_text = format ["Checking %1 Parts For Repair...", (count _vehicleHitPointsNameArr)];
				[_text, 1] call RELO_fnc_titleTextGlobal;
				uiSleep 5;
				if !(RELO_var_servicingVehicle) exitWith {};
				_hitPointCount = 0;
				{
					_hitPoint = _x;
					_hitPointDamage = ((_vehicleHitPointsAllArr select 2) select _forEachIndex);
					_hitPointCount = _hitPointCount + 1;
					if (_hitPointDamage > 0) then
					{
						_text = format ["Found Damage On Part %1, Repairing...", _hitPointCount];
						[_text, 1] call RELO_fnc_titleTextGlobal;
						_servicesCompletedCount = _servicesCompletedCount + 1;
						_i = _hitPointDamage;
						while {_i > 0} do
						{
							_i = _i - 0.1;
							_vehicle setHitPointDamage [_hitPoint, _i];
							uiSleep 0.1;
							if !(RELO_var_servicingVehicle) exitWith {};
						};
						uiSleep 1;
						if !(RELO_var_servicingVehicle) exitWith {};
					};
					if !(RELO_var_servicingVehicle) exitWith {};
				} forEach _vehicleHitPointsNameArr;
			};
		};
		uiSleep 1;
		if !(RELO_var_servicingVehicle) exitWith {};
		if (_vehicleDamage > 0) then
		{
			_text = "Repairing Body Work...";
			[_text, 1] call RELO_fnc_titleTextGlobal;
			uiSleep 5;
			if !(RELO_var_servicingVehicle) exitWith {};
			_vehicle setDamage 0;
			_servicesCompletedCount = _servicesCompletedCount + 1;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		_vehicleRepairCargo = getRepairCargo _vehicle;
		if (((typeName _vehicleRepairCargo) isEqualTo "SCALAR") && (_vehicleRepairCargo < 1)) then
		{
			["Resupplying Repair Cargo...", 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
			_servicesCompletedCount = _servicesCompletedCount + 1;
			_i = _vehicleRepairCargo;
			while {_i < 1} do
			{
				_i = _i + 0.01;
				_vehicle setRepairCargo _i;
				uiSleep 0.1;
				if !(RELO_var_servicingVehicle) exitWith {};
			};
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		if ((fuel _vehicle) < 0.99) then
		{
			["Refueling...", 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
			_servicesCompletedCount = _servicesCompletedCount + 1;
			_vehicleFuel = fuel _vehicle;
			_i = _vehicleFuel;
			while {_i < 1} do
			{
				_i = _i + 0.01;
				_vehicle setFuel _i;
				uiSleep 0.1;
				if !(RELO_var_servicingVehicle) exitWith {};
			};
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		_vehicleFuelCargo = getFuelCargo _vehicle;
		if (((typeName _vehicleFuelCargo) isEqualTo "SCALAR") && (_vehicleFuelCargo < 1)) then
		{
			["Resupplying Fuel Cargo...", 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
			_servicesCompletedCount = _servicesCompletedCount + 1;
			_i = _vehicleFuelCargo;
			while {_i < 1} do
			{
				_i = _i + 0.01;
				_vehicle setFuelCargo _i;
				uiSleep 0.1;
				if !(RELO_var_servicingVehicle) exitWith {};
			};
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		_vehicleTurrets = magazinesAllTurrets _vehicle;
		// [["240Rnd_CMFlare_Chaff_Magazine",[-1],240,1.00224e+007,2],["Laserbatteries",[0],0,1.00219e+007,2],["6Rnd_LG_scalpel",[0],0,1.00219e+007,2]]
		if !(_vehicleTurrets isEqualTo []) then
		{
			{
				_turretClass = _x select 0;
				_turretPath = _x select 1;
				_turretAmmoCount = _x select 2;
				_turretCreator = _x select 4;
				_turretDisplayName = getText (configfile >> "CfgMagazines" >> _turretClass >> "displayName");
				if (_turretDisplayName isEqualTo "") then
				{
					_turretDisplayName = "Countermeasures";
				};
				_turretAmmoCountFull = (getNumber (configFile >> "CfgMagazines" >> _turretClass >> "count"));
				_turretNeedsRearm = !(_turretAmmoCountFull isEqualTo _turretAmmoCount);
				if (_turretNeedsRearm) then
				{
					_turretUnit = _vehicle turretUnit _turretPath;
					if !(isNull _turretUnit) then
					{
						// if !(_turretUnit isEqualTo _unit) then // this gets stuck in an infinite loop with UAV's
						// {
							// moveOut _turretUnit;
							// waitUntil {uiSleep 1; _turretUnit = _vehicle turretOwner _turretPath; _turretUnit isEqualTo _unit;};
						// };
					};
					_text = format ["Rearming %1...",_turretDisplayName];
					[_text, 1] call RELO_fnc_titleTextGlobal;
					uiSleep 5;
					if !(RELO_var_servicingVehicle) exitWith {};
					_servicesCompletedCount = _servicesCompletedCount + 1;
					_vehicle removeMagazineTurret [_turretClass,_turretPath];
					_vehicle addMagazineTurret [_turretClass,_turretPath];
				};
				uiSleep 1;
				if !(RELO_var_servicingVehicle) exitWith {};
			} forEach _vehicleTurrets;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		_vehicleAmmoCargo = getAmmoCargo _vehicle;
		if (((typeName _vehicleAmmoCargo) isEqualTo "SCALAR") && (_vehicleAmmoCargo < 1)) then
		{
			["Resupplying Ammo Cargo...", 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
			_servicesCompletedCount = _servicesCompletedCount + 1;
			_i = _vehicleAmmoCargo;
			while {_i < 1} do
			{
				_i = _i + 0.01;
				_vehicle setAmmoCargo _i;
				uiSleep 0.1;
				if !(RELO_var_servicingVehicle) exitWith {};
			};
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(RELO_var_servicingVehicle) exitWith {};
		if !(_customResupply) then
		{
			clearBackpackCargoGlobal _vehicle;
			clearItemCargoGlobal _vehicle;
			clearMagazineCargoGlobal _vehicle;
			clearWeaponCargoGlobal _vehicle;
			{
				_transportClass = _x;
				_transportCfg = configfile >> "CfgVehicles" >> _vehicleClass >> _transportClass;
				_transportCount = count _transportCfg;
				if (_transportCount > 0) then
				{
					_text = format ["Resupplying %1...", _transportClass];
					[_text, 1] call RELO_fnc_titleTextGlobal;
					uiSleep 1;
					_i = 0;
					while {_i < (_transportCount - 1)} do
					{
						_transportContents = _transportCfg select _i;
						switch (_transportClass) do
						{
							case "TransportBackpacks": {
								_transportWhat = getText (_transportContents >> "backpack");
								_transportWhatNum = getNumber (_transportContents >> "count");
								_vehicle addBackpackCargoGlobal [_transportWhat, _transportWhatNum];
							};
							case "TransportItems": {
								_transportWhat = getText (_transportContents >> "name");
								_transportWhatNum = getNumber (_transportContents >> "count");
								_vehicle addItemCargoGlobal [_transportWhat, _transportWhatNum];
							};
							case "TransportMagazines": {
								_transportWhat = getText (_transportContents >> "magazine");
								_transportWhatNum = getNumber (_transportContents >> "count");
								_vehicle addMagazineCargoGlobal [_transportWhat, _transportWhatNum];
							};
							case "TransportWeapons": {
								_transportWhat = getText (_transportContents >> "weapon");
								_transportWhatNum = getNumber (_transportContents >> "count");
								_vehicle addWeaponCargoGlobal [_transportWhat, _transportWhatNum];
							};
						};
						_i = _i + 1;
						uiSleep 0.1;
						if !(RELO_var_servicingVehicle) exitWith {};
					};
				};
				uiSleep 1;
				if !(RELO_var_servicingVehicle) exitWith {};
			} forEach ["TransportBackpacks","TransportItems","TransportMagazines","TransportWeapons"];
		}
		else
		{
			_text = "Resupplying Random Transport Loadout...";
			[_text, 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
			[_vehicle] remoteExecCall ["RELO_fnc_randomContainerLoadout",2,false];
			uiSleep 1;
			if !(RELO_var_servicingVehicle) exitWith {};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if (_servicesCompletedCount > 0) then
		{
			_text = format ["Servicing Of %1 Complete",_vehicleName];
			[_text, 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
		}
		else
		{
			_text = format ["Servicing Of %1 Not Required",_vehicleName];
			[_text, 1] call RELO_fnc_titleTextGlobal;
			uiSleep 1;
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		_vehicle engineOn true;
		RELO_var_servicingVehicle = false;
	};
	if (RELO_var_servicingVehicle isEqualTo true) then
	{
		["Servicing Error!", 1] call RELO_fnc_titleTextGlobal;
		uiSleep 1;
	};
	///////////////////////////////////////////////////////////////////////////////
	_vehicle lockDriver false;
	_vehicle lockCargo false;
	RELO_var_servicingVehicle = false;
};
