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

	Name: fn_emptyGroupsHandler.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 3:27 PM 30/07/2017
	Modification Date: 3:27 PM 30/07/2017

	Description: Invade & Annex - Main AO calculations

	Parameter(s): none

	Example: none

	Change Log:
	1.0 - original base script.

	----------------------------------------------------------------------------------------------
*/

///////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////
diag_log "[INIT] -> Empty Groups Handler";
///////////////////////////////////////////////////////////////////////////////////////////////
while {sleep 60; true} do
{
	_allGroups = allGroups;
	if !(_allGroups isEqualTo []) then
	{
		{
			_group = _x;
			_isGroupEmpty = ((count (units _group)) isEqualTo 0);
			if (_isGroupEmpty) then
			{
				deleteGroup _group;
			};
		} forEach _allGroups;
	};
};
