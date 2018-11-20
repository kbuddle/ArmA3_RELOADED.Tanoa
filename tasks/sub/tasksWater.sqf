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

	Name: taskWater.sqf
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

///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
params ["_taskTerrain","_taskLocation"];
///////////////////////////////////////////////////////////////////////////////////////////////////
if (isNil "_taskLocation") exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "tasksWaterConfig.sqf"; // configuration for tasks.
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskChosen = [];
for [{_i = 0},{_i < (count _taskArr)},{_i = _i + 1}] do
{
	_taskChosen = selectRandom _taskArr;
	if !((_taskChosen select 0) in RELO_var_locationTasksActive) exitWith {};
};
if ((_taskChosen select 0) in RELO_var_locationTasksActive) exitWith
{
	#ifdef __DEBUG__
		"  ! couldn't find suitable task, exited!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log "  ! couldn't find suitable task, exited!";
	#endif
	if (isNil "noSuitableTasksWater") then
	{
		noSuitableTasksWater = 1;
	}
	else
	{
		noSuitableTasksWater = noSuitableTasksWater + 1;
		if (noSuitableTasksWater > count _taskArr) exitWith
		{
			RELO_var_locationTaskAmount = RELO_var_locationTaskAmount - 1;
			noSuitableTasksWater = nil;
			#ifdef __DEBUG__
				"  ! exhausted suitable water tasks, adjusted total task amount!" remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
				diag_log "  ! exhausted suitable water tasks, adjusted total task amount!";
			#endif
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskTitle = _taskChosen select 0;
_taskDescription = _taskChosen select 1;
_taskRole = _taskChosen select 2;
_taskIcon = _taskChosen select 3;
_taskAreaRadius = _taskChosen select 4;
_taskAreaBase = _taskChosen select 5;
_taskBase = _taskChosen select 6;
_taskSurface = _taskChosen select 7;
_taskGroups = _taskChosen select 8;
_taskUnits = _taskChosen select 9;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   + task chosen is -> %1",_taskTitle] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + task chosen is -> %1",_taskTitle];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskSide = WEST;
_taskLocationRelative = [_taskLocation, round(random(_taskAreaRadius - _taskAreaBase)), round(random 360)] call BIS_fnc_relPos;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskMkr = createMarker [format ["RELO_task_areaPos_%1_%2",_taskTitle,_taskLocationRelative],_taskLocationRelative];
_taskMkr setMarkerShape "ELLIPSE";
_taskMkr setMarkerBrush "Border";
_taskMkr setMarkerSize [_taskAreaRadius,_taskAreaRadius];
_taskMkr setMarkerColor "colorRed";
_taskMkr setMarkerAlpha 1;
RELO_var_locationMkrsTask pushBack _taskMkr;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskMkrExact = createMarker [format ["RELO_task_exactPos_%1_%2",_taskTitle,_taskLocation],_taskLocation];
_taskMkrExact setMarkerShape "ELLIPSE";
_taskMkrExact setMarkerBrush "SolidBorder";
_taskMkrExact setMarkerSize [(_taskAreaBase * 2),(_taskAreaBase * 2)];
_taskMkrExact setMarkerColor "colorGreen";
_taskMkrExact setMarkerAlpha 0;
RELO_var_locationMkrsTask pushBack _taskMkrExact;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskMkrExempt = createMarker [format ["exempt_%1_%2",_taskTitle,_taskLocation],_taskLocation];
_taskMkrExempt setMarkerShape "ELLIPSE";
_taskMkrExempt setMarkerBrush "Solid";
_taskMkrExempt setMarkerSize [(_taskAreaRadius * 2),(_taskAreaRadius * 2)];
_taskMkrExempt setMarkerColor "colorOrange";
_taskMkrExempt setMarkerAlpha 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	_taskMkrExempt setMarkerAlpha 0.5;
	{
		if ((getMarkerPos _x inArea _taskMkrExempt) && ([ "MarkerTemp", _x ] call BIS_fnc_inString)) then
		{
			deleteMarker _x;
		};
	} forEach allMapMarkers;
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
RELO_var_locationMkrsExempt pushBack _taskMkrExempt;
///////////////////////////////////////////////////////////////////////////////////////////////////
_task = [_taskSide,[_taskTitle],[_taskDescription,_taskTitle,_taskTitle],_taskLocationRelative,0,1,false,_taskIcon] call BIS_fnc_taskCreate;
_notificationRemoteExec = [_taskIcon,['AO SUB TASK',_taskTitle]] remoteExec ['RELO_fnc_notificationGlobal',0,FALSE];
RELO_var_locationTasksActive pushBack _task;
///////////////////////////////////////////////////////////////////////////////////////////////////
// _clearSurround = nearestTerrainObjects [_taskLocation,["TREE","SMALL TREE","BUSH","ROCK","ROCKS","HIDE","WALL","FENCE","HOUSE"],(_taskAreaBase + 10)];
_clearSurround = nearestTerrainObjects [_taskLocation,["TREE","SMALL TREE","BUSH","HOUSE","WALL"],(_taskAreaBase + 10)];
_hiddenObjects = [];
{
	_hiddenObjects pushBack _x;
	_x allowDamage false;
	_x hideObjectGlobal true;
} forEach _clearSurround;
///////////////////////////////////////////////////////////////////////////////////////////////////
_taskDirection = round(random 360);
///////////////////////////////////////////////////////////////////////////////////////////////////
if (isOnRoad _taskLocation) then
{
	_nearRoads = _taskLocation nearRoads 50;
	if ((count _nearRoads) > 0) then
	{
		_nearRoad = _nearRoads select 0;
		_nearRoadNext = _nearRoads select 1;
		if !(isNil "_nearRoadNext") then
		{
			_taskDirection = (_nearRoad getDir _nearRoadNext);
		};
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_baseChosen = selectRandom _taskBase;
_baseChosenObjects = call compile preProcessFileLineNumbers format ["bases\sub\water\%1.sqf",_baseChosen];
_baseObjects = []; _baseObjects = [_baseChosenObjects,_taskLocation,_taskDirection,_taskSurface] call RELO_fnc_objectsMapper;
waitUntil {!(_baseObjects isEqualTo [])};
///////////////////////////////////////////////////////////////////////////////////////////////////
{
	_isObjectVehicle = _x isKindOf "AllVehicles";
	_isObjectStatic = _x isKindOf "StaticWeapon";
	if ((_isObjectVehicle isEqualTo true) && (_isObjectStatic isEqualTo false)) then
	{
		_baseObjects = _baseObjects - [_x];
		[_x,300,120] spawn RELO_fnc_taskVehicleHandler; // after AO is over with, wait 300 seconds if alive and unoccupied or 120 seconds if dead before deleting.
	};
} forEach _baseObjects;
///////////////////////////////////////////////////////////////////////////////////////////////////
[_task,_taskLocation,_taskAreaBase,_baseObjects,_hiddenObjects,RELO_var_locationMkrCurr] spawn RELO_fnc_taskCleanupHandler;
///////////////////////////////////////////////////////////////////////////////////////////////////
// sleep 5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_buildingsArr = [];
_buildingsArr = nearestObjects [_taskLocation,["House_F","Ruins_F"],(_taskAreaBase * 2)];
_locationBldPosArr = [];
if !(_buildingsArr isEqualTo []) then
{
	{
		_buildingPositions = _x buildingPos -1;
		{
			if ((_forEachIndex + 1) % 2 == 0) then
			{
				// _isEmpty = !(_x isFlatEmpty  [0, -1, -1, -1, -1, false, objNull] isEqualTo []);
				// if (_isEmpty) then
				// {
					_locationBldPosArr pushBackUnique _x;
				// };
			};
		} forEach _buildingPositions;
	} forEach _buildingsArr;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_pierArr = [];
_pierArr = (nearestObjects [_taskLocation,["Piers_base_F"],(_taskAreaBase * 2)]);
_pierPosArr = [];
if !(_pierArr isEqualTo []) then
{
	{
		_pier = _x;
		_typeOfPier = typeOf _pier;
		if (_typeOfPier isEqualTo "Land_Pier_Box_F") then
		{
			_pierPos = getPosASL _pier;
			// for [{_p = 0},{_p < 360},{_p = _p + 10}] do
			// {
				// for [{_q = 0},{_q < _taskAreaBase},{_q = _q + 5}] do
				// {
					// _placementPos = _pierPos getPos [_q,_p];
					// _placementPos set [2,(_pierPos select 2)];
					// _pierPosArr pushBack _placementPos;
				// };
			// };
			_pierPosArr pushBack _pierPos;
		};
	} forEach _pierArr;
};
#ifdef __DEBUG__
	format ["   + task %1 has %2 pier positions at %3m above sea level",_taskTitle,count _pierPosArr,_pierPosArr select 0 select 2] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   + task %1 has %2 pier positions at %3m above sea level",_taskTitle,count _pierPosArr,_pierPosArr select 0 select 2];
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////


// if (true) exitWith {};

// _relativePositions = [];
// switch (_baseChosen) do
// {
	// case "baseWaterBaseAlpha": {_relativePositions = [[-19.5569,-3.10938,-0.222875],[-23.0662,-4.03125,-1.73389],[-11.9795,-14.457,4.30938],[-14.679,-14.5781,4.62992],[-15.1008,-12.2188,4.10445],[-14.2876,-8.27637,0.0273623],[-12.365,-0.910156,0.361867],[1.75488,-0.569336,0.59656],[8.52173,-0.575195,0.535489],[17.8689,-8.34668,-0.249927],[14.3608,-19.9033,0.00192785],[9.64233,-22.5098,-3.19868],[4.72363,-22.4648,-2.98881],[15.2751,8.47656,-0.0864701],[9.75342,12.1338,4.13554],[9.36914,15.0938,4.44032],[6.65137,14.9854,4.32612],[-5.4729,2.79004,0.267971],[0.158691,9.63184,0.0867949],[-11.5503,10.8604,0.730761],[-15.3906,17.127,0.14077],[-15.2,19.9248,-0.0206761],[-5.52417,22.5107,-3.21294],[-10.5957,22.458,-2.98715],[-9.16846,14.6797,0.0709138],[6.28516,-5.31738,3.31338],[3.9856,-5.32813,3.09065],[-2.55566,-7.44434,2.93463],[-2.66284,-15.3027,3.11748],[-2.56152,-11.1855,3.33586],[-0.0834961,-15.2207,2.89335],[7.86353,-12.3174,3.13304],[2.03589,-8.53613,2.99566],[2.03589,-10.9844,3.23927],[3.25903,-15.04,3.3149],[7.16724,-12.2959,0.621427],[7.00977,-9.90625,0.62384],[6.9375,-7.14746,0.63541],[3.33301,-7.27344,0.358103],[3.25391,-9.78223,0.500844],[-3.36475,-9.74902,0.473743],[0.533691,-7.24512,0.790722],[0.637695,-9.59766,0.684279],[3.65649,-14.6484,0.407849],[-4.63818,-12.8154,0.620389],[-5.79102,-15.1611,0.136404],[-5.53271,-3.38379,0.0103488],[-11.6235,3.01465,0.792365],[-14.0305,3.16211,0.710862],[2.25562,3.5166,0.917548],[-0.0461426,3.4873,0.778358],[8.80811,3.55664,0.78513],[6.49316,3.53125,0.926188],[14.8782,0.03125,-0.0332458],[13.2505,-6.81055,-0.0259311],[13.3345,-12.3301,0.241043],[17.6746,-18.2334,-0.0337188],[4.46704,-2.48242,-0.0823901],[-13.2681,-15.498,-0.0706916],[-22.0759,3.20703,-1.89955],[-15.6665,11.7266,0.731295],[-15.6667,8.91992,0.575914],[14.2673,13.0527,0.0614972],[18.0479,13.3896,-0.200907],[18.0066,18.001,0.164885],[14.1028,17.9063,0.131107],[15.7,15.4746,-0.196723],[10.571,-9.43652,0.020937],[14.8782,-9.3252,-0.152906],[5.31226,-9.85352,3.06226]];};
	// case "baseWaterBravo_RH": {_relativePositions = [[26.7942,28.3809,-2.12367],[26.6587,24.3135,-1.95557],[19.8992,15.6748,-2.08268],[25.4614,17.999,-0.405608],[25.6426,13.8174,-0.806108],[10.4038,17.5771,-2.06686],[12.2695,24.0225,-0.661593],[12.5562,19.8945,-0.413556],[13.7888,12.2871,-2.07202],[8.11133,11.6396,0.0324016],[5.24609,13.1602,0.091969],[-6.646,12.8682,-0.186521],[-13.0173,12.4199,-0.0407023],[-16.4736,10.8311,-0.246234],[-27.1521,8.57813,-3.08917],[-22.4019,8.5498,-3.31614],[-17.7913,8.41309,-3.48521],[-24.8291,14.1172,-0.285089],[-28.3206,21.0693,0.225394],[-20.0371,27.3613,-0.327803],[-22.6128,20.3818,-0.012754],[-18.1108,20.4854,-0.0395169],[1.85913,7.82227,0.100436],[-7.00903,7.19824,0.146524],[-7.21436,1.22656,0.145619],[11.3386,-1.72754,0.670651],[17.3928,7.63086,0.144755],[12.0422,7.63086,0.0230637],[18.1462,5.95117,3.11587],[21.0198,5.98633,3.07348],[23.2822,2.60645,3.02476],[24.2434,-1.0293,3.45229],[13.7876,3.50879,2.91515],[13.9839,-4.48438,3.37366],[16.1406,-4.52441,3.26059],[13.7778,-0.757813,3.17594],[19.6072,-3.75195,3.15493],[21.395,5.66797,0.748701],[19.7449,1.36914,0.720623],[15.5305,3.56836,0.679047],[12.2505,1.54492,0.553452],[13.5034,-3.87695,0.72877],[10.3994,-4.66797,0.146282],[4.97095,0.55957,-0.0957718],[5.13428,-8.58887,0.00951481],[0.730469,-11.0283,0.207841],[9.07178,-14.8867,-0.271611],[11.4802,-25.7861,-3.37853],[11.5247,-21.2871,-3.03589],[11.4829,-16.3496,-3.44713],[3.70679,-18.8838,0.12977],[-3.22217,-16.3369,0.633552],[-7.4856,-16.4082,0.480625],[5.7229,-24.7979,0.665432],[4.30298,-23.085,0.550063],[1.81128,-24.665,0.860678],[-6.42603,-25.5508,-0.105669],[-10.502,-18.9229,0.191518],[-18.574,-24.7852,-0.00138617],[-12.3174,-26.5322,0.0344496],[-26.0635,-26.2334,0.133328],[-28.2573,-20.0605,0.0484657],[-27.3362,-15.749,-0.0221076],[-28.575,-9.5918,-0.0478182],[-18.1279,-7.27832,-2.9941],[-22.3113,-7.3252,-3.18926],[-27.2041,-7.27344,-3.29336],[-24.7439,-10.8594,-0.0620008],[-19.8628,-11.1309,0.274724],[-17.5205,-17.707,0.525955],[-13.198,-15.6787,0.729814],[-13.2095,-18.2578,0.963546],[-21.9143,-18.2383,0.00536203],[-13.9399,-10.9023,0.0226579],[-9.17334,-8.18066,0.0430961],[-5.50708,-11.9883,-0.160033],[0.355957,-5.88281,0.0203218],[2.12524,1.4502,4.40383],[-2.58691,2.5498,8.46639],[4.02295,3.08789,12.1469],[-2.90112,4.50684,12.7947],[5.30249,-0.814453,12.5374],[1.2561,-3.52637,15.179],[-2.85571,-5.24707,15.0948],[-6.00928,1.76953,15.3542],[-0.36377,1.8252,17.5362],[-1.44897,-5.34082,17.2978],[-4.41309,-5.39453,17.6923],[-3.29028,-0.842773,17.3886],[-4.56079,5.18652,17.3036],[-2.15723,5.0332,17.4094],[4.66357,4.0166,17.7626],[3.03345,0.495117,17.4197],[6.01001,-0.708008,17.6067],[4.71875,-3.10547,17.7303],[2.49829,-3.10742,17.3977],[6.22583,4.27051,15.2629],[-1.43481,-0.842773,14.9004],[-4.34766,-4.79688,12.7534]];};
	// default {_relativePositions = [];};
// };

// _centralPos =[];
// if !(_relativePositions isEqualTo []) then
// {
	// _centralPos = nearestObjects [_taskLocation,["Land_SewerCover_03_f"],100] select 0;
// };
///////////////////////////////////////////////////////////////////////////////////////////////
_i = 0;
while {sleep 0.1; _i < _taskGroups} do
{
	_grpDeploy = createGroup EAST;
	_groupID = groupID _grpDeploy;
	_grpDeploy setGroupIdGlobal [format ["%1 Patrol - %2",_taskTitle,_groupID]];
	RELO_var_locationGroups pushBack _grpDeploy;
	_j = 0;
	while {sleep 0.1; _j < _taskUnits} do
	{
		_soldierClass = selectRandom _soldierClasses;
		if (typeName _soldierClass == "ARRAY") then
		{
			_soldierClass = selectRandom _soldierClass;
		};
		_unit = _grpDeploy createUnit [_soldierClass, _taskLocation, [], 0, "NONE"];
		waitUntil {!isNull _unit};
		_unit allowDamage false;
		_unit setDamage 0;
		///////////////////////////////////////////////////////////////////////////////////////////////
		
		{
			_x addCuratorEditableObjects [[_unit],false];
		} forEach allCurators;
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		_skillSet = selectRandom ["LOW","REGULAR","MEDIUM"]; // full list = ["VERY LOW","LOW","REGULAR","MEDIUM","HIGH","ELITE"]
		[_unit,_skillSet] call RELO_fnc_aiSetSkill;
		sleep 0.1;
		_unit addEventHandler ["KILLED", {(_this select 0) spawn RELO_fnc_corpseCleanupHandler}];
		sleep 0.1;
		_addDogTags = [_unit] call RELO_fnc_addActionDogTags;
		sleep 0.1;
		_addGoldTooth = [_unit] call RELO_fnc_addActionGoldTooth;
		sleep 0.1;
		_unit setVariable ["unitBelongsToLocation",RELO_var_locationMkrCurr,false];
		_unit setVariable ["unitBelongsToTask",_task,false];
		///////////////////////////////////////////////////////////////////////////////////////////////
		_isMedic = _unit getUnitTrait "MEDIC";
		if (_isMedic) then
		{
			_medicInit = [_unit,"EAST"] spawn RELO_fnc_medicPatrol;
		};
		_isEngineer = _unit getUnitTrait "ENGINEER";
		if (_isEngineer) then
		{
			_engineerInit = [_unit,"EAST"] spawn RELO_fnc_engineerPatrol;
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		if !(_locationBldPosArr isEqualTo []) then
		{
			_locationBldPos = selectRandom _locationBldPosArr;
			_locationBldPosArr = _locationBldPosArr - [_locationBldPos];
			doStop _unit;
			_unit setPosASL _locationBldPos; // ASL?
		}
		else
		{
			if !(_pierPosArr isEqualTo []) then
			{
				// _k = 0;
				// while {sleep 0.1; !(isTouchingGround _unit) || (_k < 100)}; do
				// {
					_pierPos = selectRandom _pierPosArr;
					_pierPosNew = _pierPos getPos [random 3,random 360];
					_pierPosNew set [2,(_pierPos select 2)]; // re set the height above sea level
					_unit setPosASL _pierPosNew; // ASL?
					doStop _unit;
					// _unit setPosASL _pierPos; // ASL?
					// _k = _k + 1;
				// };
					// _pierPosArr = _pierPosArr - [_pierPos];
					// doStop _unit;
					// [_unit] spawn
					// {
						// params ["_unit"];
						// sleep 10;
						// _unit doMove getPosASL _unit;
					// };
			};
		};
		///////////////////////////////////////////////////////////////////////////////////////////////
		

		// if !(_relativePositions isEqualTo []) then
		// {
			// _relativePosition = selectRandom _relativePositions;
			// _relativePositions = _relativePositions - _relativePosition;
			// _newPos = _centralPos modelToWorld _relativePosition;
			// _unit setPosASL _newPos;
		// }
		// else
		// {
			///////////////////////////////////////////////////////////////////////////////////////
			// _newPos = _taskLocation findEmptyPosition [0,100,(typeOf _unit)];
			// if (_newPos isEqualTo []) then
			// {
				// _newPos = [_taskLocation, 1, _taskAreaBase, 0.5, 1, 20, 0] call BIS_fnc_findSafePos;
			// };
			// _newPosASL = _newPos;
			// _newPosASL set [2,4.5];
			// _unit setPosASL _newPosASL;
			///////////////////////////////////////////////////////////////////////////////////////
			// _newPos = _taskLocation findEmptyPosition [1,20,(typeOf _unit)];
			// if (_newPos isEqualTo []) then
			// {
				// _newPos = [_taskLocation, 1, _taskAreaBase, 0.5, 1, 20, 0] call BIS_fnc_findSafePos;
			// };
			// _unitPosNew = _newPos;
			// _unitPosIntersect = +_unitPosNew;
			// _unitPosIntersect set [2, 100];
			// while {(lineIntersects [ATLToASL _unitPosIntersect,ATLToASL _unitPosNew])} do
			// {
				// _unitPosNew set [2, ((_unitPosNew select 2) + 0.25)];
			// };
			// _newPos = ATLToASL _unitPosNew;
			// _unit setPosASL _newPos;
		// };
		_unit allowDamage true;
		_j = _j + 1;
	};
	_leader = leader _grpDeploy;
	_unitPatrolArea = selectRandom [_taskMkr,_taskMkrExact];
	// _unitPatrol = [_leader,_unitPatrolArea,"NOFOLLOW","NOSLOW"] spawn RELO_fnc_urbanPatrol;
	_unitDefend = [_leader,_unitPatrolArea] call BIS_fnc_taskDefend;
	[_taskTitle,_taskLocation,_taskAreaRadius,_grpDeploy,50] call RELO_fnc_aiStaticWeaponOccupy;
	_i = _i + 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////
_numOfPatrolBoats = selectRandom [0,1,2];
if !(_numOfPatrolBoats isEqualTo 0) then
{
	for [{_i = 0},{_i < _numOfPatrolBoats},{_i = _i + 1}] do
	{
		[_taskMkr,true] spawn RELO_fnc_patrolBoat; // spawn a water vehicle patrol at the task
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////
// [_task,_taskMkr,_taskMkrExact,_taskUnits,_taskGroups] spawn
// {
	// params ["_task","_taskMkr","_taskMkrExact","_taskUnits","_taskGroups"];
	/////////////////////////////////////////////////////////////////////////////////////////////
	// sleep 60;
	/////////////////////////////////////////////////////////////////////////////////////////////
	// _locationMkrCurr = RELO_var_locationMkrCurr;
	// _locationSize = (markerSize RELO_var_locationMkrCurr select 0);
	// _taskSize = (markerSize _taskMkr select 0);
	/////////////////////////////////////////////////////////////////////////////////////////////
	// _taskUnitsTotal = (_taskUnits * _taskGroups);
	/////////////////////////////////////////////////////////////////////////////////////////////
	// while {sleep 10; _task in RELO_var_locationTasksActive} do
	// {
		// if !(_locationMkrCurr isEqualTo RELO_var_locationMkrCurr) exitWith {};
		// _unitCount = count (allUnits select {((_x getVariable "unitBelongsToTask") isEqualTo _task) && (alive _x)});
		// _currentCount = _taskUnitsTotal - _unitCount;
		// if (_currentCount >= _taskUnits) then
		// {
			// _chosenRedeployMethod = selectRandomWeighted ["quadbike",0.3,"unarmedvehicle",0.3,"ground",0.8,"para",0.5,"unload",0.4,"vehicle",0.2];
			// _chosenTaskMarker = selectRandom [_taskMkr,_taskMkrExact];
			// _chosenTaskPos = getMarkerPos _chosenTaskMarker;
			// if (surfaceIsWater _chosenTaskPos) then
			// {
				// _chosenTaskPosDepth = ASLtoATL _chosenTaskPos;
				// _chosenTaskPosDepth = (_chosenTaskPosDepth select 2);
				// if (_chosenTaskPosDepth >= 5) then
				// {
					// _chosenRedeployMethod = selectRandom ["rappel"];
					// _chosenRedeployMethod = selectRandom ["para"];
				// };
			// };
			// switch (_chosenRedeployMethod) do
			// {
				// case "ground": {[_chosenTaskMarker,_locationMkrCurr,_taskSize * 1.5,"random",100 + random(100),_taskUnits,0.5] spawn RELO_fnc_deployGroundTroop;};
				// case "para": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,50 + random(50),false,false,false] spawn RELO_fnc_deployParaTroop;};
				// case "unload": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnloadTroop;};
				// case "rappel": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 3,"random",25,100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployRappelTroop;};
				// case "vehicle": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployVehicleTroop;};
				// case "unarmedvehicle": {[_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),_taskUnits,0.5,false,false,false] spawn RELO_fnc_deployUnarmedVehicleTroop;};
				// case "quadbike": {
					// {
						// [_chosenTaskMarker,_locationMkrCurr,_locationSize * 1.25,"random",100 + random(100),2,0.5,false,false,false] spawn RELO_fnc_deployQuadbikeTroop;
					// } forEach [1,2,3]; // 2 units per quad bike
				// };
			// };
			// sleep 10;
		// };
	// };
// };
///////////////////////////////////////////////////////////////////////////////////////////////
sleep 5;
_taskRoleChosen = selectRandom _taskRole;
if !(_taskRoleChosen in ["destroy","repair","secure"]) then
{
	_taskRoleChosen = ""; // force default option (potato sack)
};
_taskDefinition = "water";
///////////////////////////////////////////////////////////////////////////////////////////////
switch (_taskRoleChosen) do
{
	case "destroy": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDestroy;}; // explosive specialist or missile specialist class needed
	case "repair": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleRepair;}; // engineer or repair specialist class needed
	case "secure": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSecure;}; // any class
	case "steal": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSteal;}; // any class
	// case "dismantle": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDismantle;}; // engineer class needed
	// case "seize": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSeize;}; // any class
	// case "deactivate": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDeactivate;}; // explosive specialist class needed
	// case "download": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDownload;}; // squad leader class needed
	// case "jammer": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleJammer;}; // squad leader or engineer class needed
	// case "release": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleRelease;}; // medic or squad leader class needed
	// case "assasinate": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleAssasinate;}; // marksman or sniper class needed
	// case "supplydrop": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleSupplyDrop;}; // helicopter pilot class needed
	// case "vehicledrop": {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleVehicleDrop;}; // helicopter pilot class needed
	default {[_taskLocation,_taskAreaBase,_taskTitle,_taskMkr,_taskUnits,_taskGroups,_taskDefinition] spawn RELO_fnc_taskRoleDefault;}; // potato sack
};
///////////////////////////////////////////////////////////////////////////////////////////////
