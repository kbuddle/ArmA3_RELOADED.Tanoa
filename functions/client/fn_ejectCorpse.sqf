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
	
	Name: fn_ejectCorpse.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com) - credit to exile for reference code
	Creation Date: 12:00 PM 12/06/2017
	Modification Date: 12:00 PM 12/06/2017
	
	Description:

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0 - original base script.
	
	----------------------------------------------------------------------------------------------
*/

params ["_player"];

_vehicle = objectParent _player;

if (isNull _vehicle) then
{
	_vehicle = vehicle _player;
};

if !(_vehicle isEqualTo _player) then
{

	_wasDriver = ((assignedDriver objectParent _player) isEqualTo _player);
	_wasInHelicopter = ((objectParent _player) isKindOf "Helicopter");
	
	unassignVehicle _player;
	_player action ["GetOut", vehicle _player];
	_player action ["Eject", vehicle _player];
	_relativePos = (vehicle _player) worldToModel (getPos _player);
	_corpsePos = call
	{
		if ((_relativePos select 0) < 0.02) exitWith { _relativePos set [0, -2]; _relativePos };
		if ((_relativePos select 0) > 0.02) exitWith { _relativePos set [0, 2]; _relativePos };
		[2,2,0]
	};
	_corpsePos = ((vehicle _player) modelToWorld _corpsePos);
	_player setPos _corpsePos;
	// if (_wasDriver && _wasInHelicopter) then
	// {
		// if ((count (fullCrew _vehicle)) > 0) then
		// {
			// [_vehicle] spawn
			// {
				// params ["_vehicle"];
				// if ((alive _vehicle) && !(isTouchingGround _vehicle)) then
				// {
					// [_vehicle] remoteExec ["RELO_fnc_emergencyParachute",2,false];
				// };
			// };
		// };
	// };
};