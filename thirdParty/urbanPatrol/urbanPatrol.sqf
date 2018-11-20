// Urban Patrol Script
// Version: 2.2.0
// Author: Kronzky (www.kronzky.info / kronzky@gmail.com) - modified by soulkobk 7:15 PM 27/07/2017
// ---------------------------------------------------------------------------------------------------------
// Required parameters:
//  unit     = Unit to patrol area (1st argument)
//  markername  = Name of marker that covers the active area. (2nd argument)
//  (e.g. nul = [this,"town"] execVM "ups.sqf")
//
// Optional parameters:
//  random    = Place unit at random start position.
//  randomdn   = Only use random positions on ground level.
//  randomup   = Only use random positions at top building positions.
//  nomove    = Unit will stay at start position until enemy is spotted.
//  nofollow   = Unit will only follow an enemy within the marker area.
//  nowait    = Do not wait at patrol end points.
//  noslow    = Keep default behaviour of unit (don't change to "safe" and "limited").
//  noai     = Don't use enhanced AI for evasive and flanking maneuvers.
//  track     = Display a position and destination marker for each unit.
//

if (!isServer) exitWith {};
///////////////////////////////////////////////////////////////////////////////////////////////////
#include "..\..\debug.hpp"
#ifdef RELO_DEBUG
	#define __DEBUG__
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
// how far opfors should move away if they're under attack
// set this to 200-300, when using the script in open areas (rural surroundings)
#define SAFEDIST 200

// how close unit has to be to target to generate a new one
#define CLOSEENOUGH 200

// how close units have to be to each other to share information
#define SHAREDIST 100

// how long AI units should be in alert mode after initially spotting an enemy
#define ALERTTIME 120
///////////////////////////////////////////////////////////////////////////////////////////////////
// convert argument list to uppercase
_ucThis = [];
for [{_i = 0},{_i < count _this},{_i = _i + 1}] do {_e = _this select _i; if (typeName _e == "STRING") then {_e = toUpper(_e)};_ucThis set [_i,_e]};
///////////////////////////////////////////////////////////////////////////////////////////////////
if (isNil "KRON_UPS_INIT") then
{
	KRON_UPS_INIT = 0;

	// find a random position within a radius
	KRON_randomPos = {private["_cx","_cy","_rx","_ry","_cd","_sd","_ad","_tx","_ty","_xout","_yout"];_cx = _this select 0; _cy = _this select 1; _rx = _this select 2; _ry = _this select 3; _cd = _this select 4; _sd = _this select 5; _ad = _this select 6; _tx = random (_rx*2)-_rx; _ty = random (_ry*2)-_ry; _xout = if (_ad != 0) then {_cx+ (_cd*_tx - _sd*_ty)} else {_cx + _tx}; _yout = if (_ad != 0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy + _ty}; [_xout,_yout]};
	// find any building (and its possible building positions) near a position
	KRON_PosInfo = {private["_pos","_lst","_bld","_bldPos"];_pos = _this select 0; _lst = nearestObjects [_pos,["House"],20]; if (count _lst == 0) then {_bld = 0;_bldPos = 0} else {_bld = _lst select 0; _bldPos = [_bld] call KRON_BldPos}; [_bld,_bldPos]};
	/// find the highest building position
	KRON_BldPos = {private ["_bld","_bi","_bldPos","_maxZ","_bp","_bz","_higher"];_bld = _this select 0;_maxZ = 0;_bi = 0;_bldPos = 0;while {_bi >= 0} do {_bp = _bld BuildingPos _bi;if ((_bp select 0) == 0) then {_bi = -99} else {_bz = _bp select 2; _higher = ((_bz>_maxZ) || ((abs(_bz-_maxZ)<.5) && (random 1>.5))); if ((_bz>4) && _higher) then {_maxZ = _bz; _bldPos = _bi}};_bi = _bi + 1};_bldPos};
	KRON_OnRoad = {private["_pos","_car","_tries","_lst"];_pos = _this select 0; _car = _this select 1; _tries = _this select 2; _lst = _pos nearRoads 4; if ((count _lst != 0) && (_car || !(surfaceIsWater _pos))) then {_tries = 99}; (_tries + 1)};
	KRON_getDirPos = {private["_a","_b","_from","_to","_return"]; _from = _this select 0; _to = _this select 1; _return = 0; _a = ((_to select 0) - (_from select 0)); _b = ((_to select 1) - (_from select 1)); if (_a != 0 || _b != 0) then {_return = _a atan2 _b}; if ( _return < 0 ) then { _return = _return + 360 }; _return};
	KRON_distancePosSqr = {(((_this select 0) select 0)-((_this select 1) select 0))^2 + (((_this select 0) select 1)-((_this select 1) select 1))^2};
	KRON_relPos = {private["_p","_d","_a","_x","_y","_xout","_yout"];_p = _this select 0; _x = _p select 0; _y = _p select 1; _d = _this select 1; _a = _this select 2; _xout = _x + sin(_a)*_d; _yout = _y + cos(_a)*_d;[_xout,_yout,0]};
	KRON_rotPoint = {private["_cp","_a","_tx","_ty","_cd","_sd","_cx","_cy","_xout","_yout"];_cp = _this select 0; _cx = _cp select 0; _cy = _cp select 1; _a = _this select 1; _cd = cos(_a*-1); _sd = sin(_a*-1); _tx = _this select 2; _ty = _this select 3; _xout = if (_a != 0) then {_cx+ (_cd*_tx - _sd*_ty)} else {_cx + _tx}; _yout = if (_a != 0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy + _ty}; [_xout,_yout,0]};
	KRON_stayInside = {
		private["_np","_nx","_ny","_cp","_cx","_cy","_rx","_ry","_d","_tp","_tx","_ty","_fx","_fy"];
		_np = _this select 0;	_nx = _np select 0;	_ny = _np select 1;
		_cp = _this select 1;	_cx = _cp select 0;	_cy = _cp select 1;
		_rx = _this select 2;	_ry = _this select 3;	_d = _this select 4;
		_tp = [_cp,_d,(_nx-_cx),(_ny-_cy)] call KRON_rotPoint;
		_tx = _tp select 0; _fx = _tx;
		_ty = _tp select 1; _fy = _ty;
		if (_tx < (_cx-_rx)) then {_fx = _cx-_rx};
		if (_tx > (_cx + _rx)) then {_fx = _cx + _rx};
		if (_ty < (_cy-_ry)) then {_fy = _cy-_ry};
		if (_ty > (_cy + _ry)) then {_fy = _cy + _ry};
		if ((_fx != _tx) || (_fy != _ty)) then {_np = [_cp,_d*-1,(_fx-_cx),(_fy-_cy)] call KRON_rotPoint};
		_np;
	};
	// Misc
	KRON_getArg = {private["_cmd","_arg","_list","_a","_v"]; _cmd = _this select 0; _arg = _this select 1; _list = _this select 2; _a = -1; {_a = _a + 1; _v = format ["%1",_list select _a]; if (_v == _cmd) then {_arg = (_list select _a + 1)}} forEach _list; _arg};
	KRON_deleteDead = {private["_u","_s"];_u = _this select 0; _s= _this select 1; _u removeAllEventHandlers "killed"; sleep _s; deletevehicle _u};
	KRON_KnownEnemy = [objNull,objNull,objNull]; // enemy information is shared between different groups

	if (isNil "KRON_UPS_Debug") then {KRON_UPS_Debug = 0};
	KRON_UPS_Instances = 0;
	KRON_UPS_Total = 0;
	KRON_UPS_Exited = 0;

	KRON_UPS_INIT = 1;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
/* if ((count _this) < 2) exitWith
{
	if (format ["%1",_this] != "INIT") then {hint "urbanPatrolScript -> Unit and marker name have to be defined!"};
}; */
///////////////////////////////////////////////////////////////////////////////////////////////////
_exit = false;
_onRoof = false;
///////////////////////////////////////////////////////////////////////////////////////////////////
waitUntil {sleep 0.5; KRON_UPS_INIT == 1};
///////////////////////////////////////////////////////////////////////////////////////////////////
KRON_UPS_Instances = KRON_UPS_Instances + 1;
///////////////////////////////////////////////////////////////////////////////////////////////////
_areaMarker = _this select 1;
if (isNil "_areaMarker") exitWith
{
	// hint "urbanPatrolScript -> Area marker not defined.\n(Typo, or name not enclosed in quotation marks?)";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_centerPos = [];
_centerX = [];
_centerY = [];
_rangeX = 0;
_rangeY = 0;
_areaDir = 0;
_areaName = "";
///////////////////////////////////////////////////////////////////////////////////////////////////
_getAreaInfo = {
	if (typeName _areaMarker == "String") then
	{
		_centerPos = getMarkerPos _areaMarker;
		_centerX = abs (_centerPos select 0);
		_centerY = abs (_centerPos select 1);
		_areaSize = getMarkerSize _areaMarker;
		_rangeX = _areaSize select 0;
		_rangeY = _areaSize select 1;
		_areaDir = (markerDir _areaMarker) * -1;
		_areaName = _areaMarker;
	};
};
[] call _getAreaInfo;
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_obj = _this select 0;
_npc = _obj;
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(_npc isKindOf "Man") exitWith
{
	#ifdef __DEBUG__
		format ["   - patrol exiting -> %1 is not a MAN",_npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		diag_log format ["   - patrol exiting -> %1 is not a MAN",_npc];
	#endif
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_exit = true;
if (typeName _obj == "OBJECT") then
{
	if (alive _npc) then {_exit = false;}
}
else
{
	if (count _obj > 0) then
	{
		{
			if (alive _x) then
			{
				_npc = _x;
				_exit = false;
			};
			sleep 0.5;
		} forEach _obj;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_grpIndex = format ["%1",KRON_UPS_Instances];
_grpName = format ["%1_%2",(side _npc),_grpIndex];
_grpActual = str (group _npc);
///////////////////////////////////////////////////////////////////////////////////////////////
_scriptName = format ["urbanPatrolScript: %1",_grpName];
scriptName _scriptName;
///////////////////////////////////////////////////////////////////////////////////////////////////
// #ifdef __DEBUG__
	// format ["   + patrol init for group -> %1 via leader %2",_grpActual,(name _npc)] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	// diag_log format ["   + patrol init for group -> %1 via leader %2",_grpActual,(name _npc)];
// #endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_members = units _npc;
KRON_UPS_Total = KRON_UPS_Total + (count _members);
///////////////////////////////////////////////////////////////////////////////////////////////////
_isMan = ((isNull objectParent _npc) && (_npc isKindOf "Man"));
_isCar = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Car")); // mrap/ifrit/qilin/quadbike/truck/etc
_isTank = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Tank")); // tank/apc
_isBoat = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Ship"));
_isPlane = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Plane"));
_isHelicopter = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Helicopter"));
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   * patrol init -> %1 (%2)",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   * patrol init -> %1 (%2)",_grpActual,name _npc];
	// if (_isMan) then
	// {
		// format ["   + patrol init -> %1 (%2) ground deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) ground deploy",_grpActual,name _npc];
	// };
	// if (_isCar) then
	// {
		// format ["   + patrol init -> %1 (%2) vehicle deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) vehicle deploy",_grpActual,name _npc];
	// };
	// if (_isTank) then
	// {
		// format ["   + patrol init -> %1 (%2) tank deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) tank deploy",_grpActual,name _npc];
	// };
	// if (_isBoat) then
	// {
		// format ["   + patrol init -> %1 (%2) boat deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) boat deploy",_grpActual,name _npc];
	// };
	// if (_isPlane) then
	// {
		// format ["   + patrol init -> %1 (%2) plane deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) plane deploy",_grpActual,name _npc];
	// };
	// if (_isHelicopter) then
	// {
		// format ["   + patrol init -> %1 (%2) helicopter deploy",_grpActual,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol init -> %1 (%2) helicopter deploy",_grpActual,name _npc];
	// };
#endif
///////////////////////////////////////////////////////////////////////////////////////////////////
_isSoldier = false;
{
	if (((side _npc) getFriend _x) < 0.6) exitWith
	{
		_isSoldier = true;
	};
} forEach [EAST,WEST,INDEPENDENT,CIVILIAN];
///////////////////////////////////////////////////////////////////////////////////////////////////
_friends = [];
_enemies = [];
_sharedEnemy = 0;
if (_isSoldier) then
{
	_sharedEnemy = switch (side _npc) do
	{
		case WEST: { 0 };
		case EAST: { 1 };
		case INDEPENDENT: { 2 };
	};
	{
		if (((side _x) getFriend (side _npc)) < 0.6) then
		{
			_enemies = _enemies + [_x];
		} else {
			_friends = _friends + [_x];
		};
	} forEach allUnits - _members;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_named = false;
_npcName = str (side _npc);
if ("NAMED" in _ucThis) then
{
	_named = true;
	_npcName = format ["%1",_npc];
	_grpIndex = _npcName;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
call compile format ["KRON_UPS_%1 = 1",_npcName];
///////////////////////////////////////////////////////////////////////////////////////////////////
_cosDir = cos(_areaDir);
_sinDir = sin(_areaDir);
///////////////////////////////////////////////////////////////////////////////////////////////////
if (_rangeX == 0) exitWith
{
	// hint format ["urbanPatrolScript -> Cannot patrol Sector: %1\nArea Marker doesn't exist",_areaName];
	// #ifdef __DEBUG__
		// format ["   + patrol exiting -> %1 no longer exists",_areaName] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
		// diag_log format ["   + patrol exiting -> %1 no longer exists",_areaName];
	// #endif
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_minDist = (_rangeX^2 + _rangeY^2) / 4;
///////////////////////////////////////////////////////////////////////////////////////////////////
_orgMode = behaviour _npc;
_orgSpeed = speedMode _npc;
_speedMode = _orgSpeed;
///////////////////////////////////////////////////////////////////////////////////////////////////
_currPos = getPos _npc;
_orgPos = _currPos;
_orgWatch = [_currPos,50,getDir _npc] call KRON_relPos;
_orgDir = getDir _npc;
_avoidPos = [0,0];
_flankPos = [0,0];
_attackPos = [0,0];
///////////////////////////////////////////////////////////////////////////////////////////////////
_dist = 0;
_lastDist = 0;
_lastMoveOne = 0;
_lastMoveTwo = 0;
_maxMove = 0;
_moved = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_damm = 0;
_dammChg = 0;
_lastDamm = 0;
_timeOnTarget = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_fightMode = "WALK";
_fm = 0;
_gotHit = false;
_hitPos = [0,0,0];
_react = 99;
_lastDamage = 0;
_lastKnown = 0;
_opfKnowVal = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_sin90 = 1;
_cos90 = 0;
_sin270 = -1;
_cos270 = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////
_closeEnough = CLOSEENOUGH;
if (_isPlane) then
{
	_closeEnough = 800;
};
if (_isHelicopter) then
{
	_closeEnough = 400;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
///////////////////////////////////////////////////////////////////////////////////////////////////
// wait at patrol end points
_pause = if ("NOWAIT" in _ucThis) then {"NOWAIT"} else {"WAIT"};

// don't move until an enemy is spotted
_noMove = if ("NOMOVE" in _ucThis) then {"NOMOVE"} else {"MOVE"};

// don't follow outside of marker area
_noFollow = if ("NOFOLLOW" in _ucThis) then {"NOFOLLOW"} else {"FOLLOW"};

// share enemy info
_shareInfo = if ("NOSHARE" in _ucThis) then {"NOSHARE"} else {"SHARE"};

// suppress FIGHT behaviour
if ("NOAI" in _ucThis) then {_isSoldier = false};

// adjust cycle delay
_cycle = ["CYCLE:",5,_ucThis] call KRON_getArg;

_initPos = "ORIGINAL";
// drop units at random positions
if ("RANDOM" in _ucThis) then {_initPos = "RANDOM"};
if ("RANDOMUP" in _ucThis) then {_initPos = "RANDOMUP"};
if ("RANDOMDN" in _ucThis) then {_initPos = "RANDOMDN"};

// don't position groups or vehicles on rooftops
if ((_initPos != "ORIGINAL") && ((!_isMan) || (count _members) > 1)) then {_initPos = "RANDOMDN"};

// set behaviour modes (or not)
_noSlow = if ("NOSLOW" in _ucThis) then {"NOSLOW"} else {"SLOW"};

if (_noSlow != "NOSLOW") then
{
	_npc setBehaviour "SAFE";
	_npc setSpeedMode "LIMITED";
	_speedMode = "LIMITED";
};

if (_initPos != "ORIGINAL") then
{
	// find a random position (try a max of 20 positions)
	_try = 0;
	_bld = 0;
	_bldPos = 0;
	while {sleep 0.5; _try < 20} do
	{
		_currPos = [_centerX,_centerY,_rangeX,_rangeY,_cosDir,_sinDir,_areaDir] call KRON_randomPos;
		if ((_initPos == "RANDOMUP") || ((_initPos == "RANDOM") && (random 1 > 0.75))) then
		{
			_posInfo = [_currPos] call KRON_PosInfo;
			// _posInfo: [0,0] = no house near, [obj,-1] = house near, but no roof positions, [obj,pos] = house near, with roof pos
			_bld = _posInfo select 0;
			_bldPos = _posInfo select 1;
		};
		if (_isPlane || _isHelicopter || _isBoat || !(surfaceIsWater _currPos)) then
		{
			if (((_initPos == "RANDOM") || (_initPos == "RANDOMUP")) && (_bldPos > 0)) then {_try = 99};
			if (((_initPos == "RANDOM") || (_initPos == "RANDOMDN")) && (_bldPos == 0)) then {_try = 99};
		};
		_try = _try + 1;
	};
	if (_bldPos == 0) then
	{
		if (_isMan) then
		{
			{_x setPos _currPos} forEach units _npc;
		}
		else
		{
			_npc setPos _currPos;
		};
	}
	else
	{
	// put the unit on top of a building
		_npc setPos (_bld buildingPos _bldPos);
		_npc setUnitPos "up";
		_currPos = getPos _npc;
		_onRoof = true;
		_exit = true; // don't patrol if on roof
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_track = if (("TRACK" in _ucThis) || (KRON_UPS_Debug>0)) then {"TRACK"} else {"NOTRACK"};
_trackerName = "";
_destName = "";
_markerDot = "";
if (_track == "TRACK") then
{
	_track = "TRACK";
	_trackerName = format ["trk_%1",_grpIndex];
	_markerObj = createMarker[_trackerName,[0,0]];
	_markerObj setMarkerShape "ICON";
	_markerDot = "";
	{
		if (isClass (configFile >> "cfgMarkers" >> _x)) then {_markerDot = _x};
	} forEach ["DOT","WTF_Dot","MIL_DOT"];
	if (_markerDot == "") exitWith {};
	_trackerName setMarkerType _markerDot;
	_markerColor = switch (side _npc) do {
		case WEST: {"ColorBlue"};
		case EAST: {"ColorRed"};
		case INDEPENDENT: {"ColorGreen"};
		default {"ColorBlack"};
	};
	_trackerName setMarkerColor _markerColor;
	_trackerName setMarkerText format ["%1",_grpIndex];
	_trackerName setMarkerPos _currPos;
	_trackerName setMarkerSize [.5,.5];
	_destName = format ["dest_%1",_grpIndex];
	_markerObj = createMarker[_destName,[0,0]];
	_markerObj setMarkerShape "ICON";
	if (isClass (configFile >> "cfgMarkers" >> "WTF_Flag")) then {"WTF_FLAG"} else {"FLAG"};
	_markerType = "";
	{
		if (isClass (configFile >> "cfgMarkers" >> _x)) then {_markerType = _x};
	} forEach ["FLAG","WTF_Flag","mil_objective"];
	_destName setMarkerType _markerType;
	_destName setMarkerColor _markerColor;
	_destName setMarkerText format ["%1",_grpIndex];
	_destName setMarkerSize [.5,.5];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
sleep 0.5;
///////////////////////////////////////////////////////////////////////////////////////////////////
_makeNewTarget = true;
_newPos = false;
_targetPos = _currPos;
// _swimming = false;
_waiting = if (_noMove == "NOMOVE") then {9999} else {0};
///////////////////////////////////////////////////////////////////////////////////////////////////
if (_exit) exitWith
{
	if ((KRON_UPS_DEBUG > 0) && !_onRoof) then {hint "Initialization aborted"};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_currLeaderName = format ["%1",(name _npc)];
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
_loop = true;
_currCycle = _cycle;
while {sleep 0.5; _loop} do
{
	// change patrol cycle dependent on if npc is on foot or in vehicle!
	_isMan = ((isNull objectParent _npc) && (_npc isKindOf "Man"));
	_isCar = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Car"));
	_isTank = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Tank"));
	_isBoat = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Ship"));
	_isPlane = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Plane"));
	_isHelicopter = (!(isNull objectParent _npc) && ((objectParent _npc) isKindOf "Helicopter"));
	///////////////////////////////////////////////////////////////////////////////////////////////
	if (alive _npc) then
	{
		_currLeaderName = format ["%1",(name _npc)];
	};
	///////////////////////////////////////////////////////////////////////////////////////////////
	// added for medic heal, so npc pauses combat loop untill finished. For use with -> RELO_fnc_medicPatrol
	_isHealingASoldier = _npc getVariable ["isHealingASoldier",false];
	if (_isHealingASoldier) then
	{
		while {sleep 0.5; _isHealingASoldier} do
		{
			_isHealingASoldier = _npc getVariable ["isHealingASoldier",false];
			if (_isHealingASoldier isEqualTo false) exitWith {};
		};
	};
	///////////////////////////////////////////////////////////////////////////////////////////////
	// added for engineer repair, so npc pauses combat loop untill finished. For use with -> RELO_fnc_engineerPatrol
	_isRepairingAVehicle = _npc getVariable ["isRepairingAVehicle",false];
	if (_isRepairingAVehicle) then
	{
		while {sleep 0.5; _isRepairingAVehicle} do
		{
			_isRepairingAVehicle = _npc getVariable ["isRepairingAVehicle",false];
			if (_isRepairingAVehicle isEqualTo false) exitWith {};
		};
	};
	sleep 0.5;
	_timeOnTarget = _timeOnTarget + _currCycle;
	_react = _react + _currCycle;
	_newDamage = 0;
	{
		if (((damage _x) > 0.2) || (isNull _x)) then
		{
			_newDamage = _newDamage + (damage _x);
			if (_newDamage > _lastDamage) then
			{
				_lastDamage = _newDamage;
				_gotHit = true;
			};
			_hitPos = getPos _x;
			if (!alive _x) then
			{
				_members = _members - [_x];
				_friends = _friends - [_x];
			};
		};
		sleep 0.5;
	} forEach _members;
	sleep 0.5;
	if (count _members == 0) then
	{
		_exit = true;
	}
	else
	{
		if (!alive _npc) then
		{
			_npcs = _members select {alive _x};
			if !(_npcs isEqualTo []) then
			{
				_npc = _npcs select 0;
				group _npc selectLeader _npc;
				#ifdef __DEBUG__
					format ["   ! patrol change -> %1 leader %2 died, changed leader to %3",_grpActual,_currLeaderName,name _npc] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
					diag_log format ["   ! patrol change -> %1 leader %2 died, changed leader to %3",_grpActual,_currLeaderName,name _npc];
				#endif
			}
			else
			{
				_exit = true;
			};
			if (isPlayer _npc) then {_exit = true};
		};
	};
	_currPos = getPos _npc;
	_currX = _currPos select 0;
	_currY = _currPos select 1;
	if (_track == "TRACK") then
	{
		_trackerName setMarkerPos _currPos;
	};
	if ((_isSoldier) && ((count _enemies) > 0) && !(_exit)) then
	{
		// if the leader comes across another unit that's either injured or dead, go into combat mode as well.
		// If the other person is still alive, share enemy information.
		if (_shareInfo == "SHARE") then
		{
			_others = _friends-_members-[player];
			{
				if ((!(isNull _x) && (_npc distance _x < SHAREDIST)) && ((damage _x > 0.5) || (behaviour _x in ["AWARE","COMBAT"]))) exitWith
				{
					_npc setBehaviour "AWARE";
					_gotHit = true;
					if ((_hitPos select 0) == 0) then
					{
						_hitPos = getPos _x;
					};
					if (_npc knowsAbout _x > 3) then
					{
						if (alive _x) then {_npc reveal (KRON_KnownEnemy select _sharedEnemy)};
					};
				};
				sleep 0.5;
			} forEach _others;
		};
		sleep 0.5;
		///////////////////////////////////////////////////////////////////////////////////////////////////
		_lastKnown = _opfKnowVal;
		_opfKnowVal = 0;
		_maxKnowledge = 0;
		{
			_knows = _npc knowsAbout _x;
			if ((alive _x) && (_knows > 0.2) && (_knows > _maxKnowledge)) then
			{
				KRON_KnownEnemy set [_sharedEnemy,_x];
				_opfKnowVal = _opfKnowVal + _knows;
				_maxKnowledge = _knows;
			};
			if (!alive _x) then {_enemies = _enemies - [_x]};
			if (_maxKnowledge == 4) exitWith {};
			sleep 0.5;
		} forEach _enemies;
		sleep 0.5;
		///////////////////////////////////////////////////////////////////////////////////////////////////
		_pursue = false;
		_accuracy = 100;
		if (_opfKnowVal > _lastKnown || _gotHit) then
		{
			_npc setBehaviour "COMBAT";
			_pursue = true;
			_accuracy = 21 - (_maxKnowledge * 5);
		};
		if (isNull (KRON_KnownEnemy select _sharedEnemy)) then
		{
			_pursue = false;
		};
		if ((_react < 60) && (_fightMode != "WALK")) then
		{
			_pursue = false;
		};
		if (_pursue) then
		{
			// get position of spotted unit in player group, and watch that spot
			_offsX = _accuracy/2-random _accuracy;
			_offsY = _accuracy/2-random _accuracy;
			_targetPos = getPos (KRON_KnownEnemy select _sharedEnemy);
			_targetPos = [(_targetPos select 0) + _offsX, (_targetPos select 1) + _offsY];
			_targetX = _targetPos select 0; _targetY = _targetPos select 1;
			{
				_x doWatch _targetPos;
				sleep 0.5;
			} forEach units _npc;
			sleep 0.5;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			_npc setSpeedMode "FULL";
			_speedMode = "FULL";
			_npc setBehaviour "COMBAT";
			_pause = "NOWAIT";
			_waiting = 0;
			_dir1 = [_currPos,_targetPos] call KRON_getDirPos;
			_dir2 = (_dir1 + 180) mod 360;
			_dir3 = if (_hitPos select 0 != 0) then {[_hitPos,_targetPos] call KRON_getDirPos} else {_dir1};
			_dd = (_dir1 - _dir3);
			_relUX = sin (_dir1) * SAFEDIST; _relUY = cos (_dir1) * SAFEDIST;
			_relTX = sin (_dir2) * SAFEDIST; _relTY = cos (_dir2) * SAFEDIST;
			_sinU = _sin90;
			_cosU = _cos90;
			_sinT = _sin270;
			_cosT = _cos270;
			if ((_dd < 0) || (_dd == 0 && (random 1) > 0.5)) then
			{
				_sinU = _sin270;
				_cosU = _cos270;
				_sinT = _sin90;
				_cosT = _cos90;
			};
			_avoidX = _currX + _cosU*_relUX - _sinU*_relUY;
			_avoidY = _currY + _sinU*_relUX + _cosU*_relUY;
			_avoidPos = [_avoidX,_avoidY];
			_flankX = _targetX + _cosT*_relTX - _sinT*_relTY;
			_flankY = _targetY + _sinT*_relTX + _cosT*_relTY;
			_flankPos = [_flankX,_flankY];
			_attackPos = _targetPos;
			_targetPos = _avoidPos;
			if (_noFollow == "NOFOLLOW") then
			{
				_avoidPos = [_avoidPos,_centerPos,_rangeX,_rangeY,_areaDir] call KRON_stayInside;
				_flankPos = [_flankPos,_centerPos,_rangeX,_rangeY,_areaDir] call KRON_stayInside;
				_attackPos = [_attackPos,_centerPos,_rangeX,_rangeY,_areaDir] call KRON_stayInside;
				_targetPos = [_targetPos,_centerPos,_rangeX,_rangeY,_areaDir] call KRON_stayInside;
			};
			_react = 0;
			_fightMode = "FIGHT";
			_timeOnTarget = 0;
			_fm = 1;
			if (KRON_UPS_Debug != 0) then
			{
				"dead" setMarkerPos _hitPos; "avoid" setMarkerPos _avoidPos; "flank" setMarkerPos _flankPos; "target" setMarkerPos _attackPos;
			};
			_newPos = true;
			if (_currCycle >= _cycle) then
			{
				_currCycle = 1;
			};
		};
	};
	sleep 0.5;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	if !(_newPos) then
	{
		// calculate new distance
		// if we're waiting at a waypoint, no calculating necessary
		if (_waiting <= 0) then
		{
			// distance to target
			_dist = [_currPos,_targetPos] call KRON_distancePosSqr;
			if (_lastDist == 0) then
			{
				_lastDist = _dist;
			};
			_moved = abs (_dist-_lastDist);
			// adjust the target tolerance for fast moving vehicles
			if (_moved > _maxMove) then
			{
				_maxMove = _moved;
				if ((_maxMove / 40) > _closeEnough) then
				{
					_closeEnough = _maxMove / 40;
				};
			};
			// how much did we move in the last three cycles?
			_totMove = _moved + _lastMoveOne + _lastMoveTwo;
			_damm = damage _npc;
			// is our damage changing (increasing)?
			_dammChg = abs (_damm - _lastDamm);
			///////////////////////////////////////////////////////////////////////////////////////////////////
			// we're either close enough, seem to be stuck, or are getting damaged, so find a new target
			// if ((!_swimming) && ((_dist <= _closeEnough) || (_totMove < 0.2) || (_dammChg > 0.01) || (_timeOnTarget > ALERTTIME))) then
			if ((_dist <= _closeEnough) || (_totMove < 0.2) || (_dammChg > 0.01) || (_timeOnTarget > ALERTTIME)) then
			{
				_makeNewTarget = true;
			};
			///////////////////////////////////////////////////////////////////////////////////////////////////
			// in 'attack (approach) mode', so follow the flanking path (don't make it too predictable though)
			if ((_fightMode != "WALK") && (_dist <= _closeEnough)) then
			{
				if ((random 1) < 0.95) then
				{
					if (_flankPos select 0 != 0) then
					{
						_targetPos = _flankPos;
						_flankPos = [0,0];
						_makeNewTarget = false;
						_newPos = true;
						_fm = 1;
					}
					else
					{
						if (_attackPos select 0 != 0) then
						{
							_targetPos = _attackPos;
							_attackPos = [0,0];
							_makeNewTarget = false;
							_newPos = true;
							_fm = 2;
						};
					};
				};
			};
			sleep 0.5;
			///////////////////////////////////////////////////////////////////////////////////////////////////
			// make new target
			if (_makeNewTarget) then
			{
				if ((_noMove == "NOMOVE") && (_timeOnTarget > ALERTTIME)) then
				{
					if (([_currPos,_orgPos] call KRON_distancePosSqr) < _closeEnough) then
					{
						_newPos = false;
					}
					else
					{
						_targetPos = _orgPos;
					};
				}
				else
				{
					// re-read marker position/size
					[] call _getAreaInfo;
					// find a new target that's not too close to the current position
					_targetPos = _currPos;
					_tries = 0;
					while {sleep 0.5; ((([_currPos,_targetPos] call KRON_distancePosSqr) < _minDist)) && (_tries < 20)} do
					{
						_tries = _tries + 1;
						// generate new target position (on the road)
						_tries = 0;
						while {sleep 0.5; _tries < 20} do
						{
							_targetPos = [_centerX,_centerY,_rangeX,_rangeY,_cosDir,_sinDir,_areaDir] call KRON_randomPos;
							if (_isCar || _isTank) then
							{
								_roadList = _targetPos nearRoads 100;
								if (count _roadList > 0) then
								{
									_checkPos = getPos (_roadList select 0);
									if (isOnRoad _checkPos) then // make sure it is a ROAD and not a PATH!
									{
										_targetPos = _checkPos;
										_tries = 99;
									};
								};
							}
							else
							{
								_tries = 99;
							};
							//_road = [_targetPos,(_isPlane||_isBoat),_road] call KRON_OnRoad;
						};
					};
				};
				_avoidPos = [0,0];
				_flankPos = [0,0];
				_attackPos = [0,0];
				_gotHit = false;
				_hitPos = [0,0,0];
				_fm = 0;
				_npc setSpeedMode _orgSpeed;
				_newPos = true;
				///////////////////////////////////////////////////////////////////////////////////////////////////
				// if we're waiting at patrol end points then don't create a new target right away. Keep cycling though to check for enemy encounters
				if ((_pause != "NOWAIT") && (_waiting < 0)) then {_waiting = (15 + random 20)};
			};
		};
	};
	sleep 0.5;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// added boat check for water and depth - soulkobk
	if (_isBoat) then
	{
		_targetPos = [0,0,0];
		_tries = 0;
		while {sleep 0.5; _targetPos isEqualTo [0,0,0] && (_tries < 20)} do
		{
			_ws = [_centerPos,round(random _rangeX),round(random 360)] call KRON_relPos; // keep the boat within the circle bounds
			_currDepth = ASLtoATL _ws;
			_currDepth = (_currDepth select 2);
			if ((surfaceIsWater _ws) && (_currDepth >= 5)) exitWith
			{
				_targetPos = _ws;
			};
			_tries = _tries + 1;
		};
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// added plane check for height reset - soulkobk
	if (_isPlane) then
	{
		(objectParent _npc) flyInHeight 300;
		_targetPos set [2,300];
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// if in water, get right back out of it again
	if (surfaceIsWater _currPos) then
	{
		// if (_isMan && !_swimming) then
		if (_isMan) then
		{
			// look around, to find a dry spot from 50m to 1000m from current position at 360 degrees, exit at first one found. -soulkobk.
			for [{_a = 50}, {_a <= 1000}, {_a = _a + 50}] do
			{
				for [{_b = 0}, {_b <= 270}, {_b = _b + 45}] do
				{
					_dp = [_currPos,_a,_b] call KRON_relPos;
					if !(surfaceIsWater _dp) then
					{
						_a = 1001;
						_b = 271;
						_targetPos = _dp;
					};
				};
			};
			_newPos = true;
			// _swimming = true;
		};
	// }
	// else
	// {
		// _swimming = false;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_waiting = _waiting - _currCycle;
	if ((_waiting <= 0) && _newPos) then
	{
		// tell unit about new target position
		if (_fightMode != "WALK") then
		{
			// reset patrol speed after following enemy for a while
			if (_timeOnTarget > ALERTTIME) then
			{
				_fightMode = "WALK";
				_speedMode = _orgSpeed;
				{
					_x setSpeedMode _speedMode;
					_x setBehaviour _orgMode;
					sleep 0.5;
				} forEach _members;
			};
			// use individual doMoves if pursuing enemy,
			// as otherwise the group breaks up too much
			{
				_x doMove _targetPos;
				sleep 0.5;
			} forEach _members;
		}
		else
		{
			(group _npc) move _targetPos;
			(group _npc) setSpeedMode _speedMode;
		};
		if (_track == "TRACK") then
		{
			switch (_fm) do
			{
				case 1: {_destName setMarkerSize [.4,.4]};
				case 2: {_destName setMarkerSize [.6,.6]};
				default	{_destName setMarkerSize [.5,.5]};
			};
			_destName setMarkerPos _targetPos;
		};
		_dist = 0;
		_moved = 0;
		_lastMoveOne = 10;
		_waiting = -1;
		_newPos = false;
		// _swimming = false;
		_timeOnTarget = 0;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// move on
	_lastDist = _dist;
	_lastMoveTwo = _lastMoveOne;
	_lastMoveOne = _moved;
	_lastDamm = _damm;
	///////////////////////////////////////////////////////////////////////////////////////////////////
	// check external loop switch
	_cont = (call compile format ["KRON_UPS_%1",_npcName]);
	if (_cont == 0) then
	{
		_exit = true;
	};
	///////////////////////////////////////////////////////////////////////////////////////////////////
	_makeNewTarget = false;
	if ((_exit) || (isNil "_npc")) then
	{
		_loop = false;
	}
	else
	{
		// slowly increase the cycle duration after an incident
		if (_currCycle < _cycle) then
		{
			_currCycle = _currCycle + 0.5;
		};
		sleep _currCycle;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
if !(isNil "_npc") then
{
	{
		doStop _x;
		_x doMove getPos _x;
		_x move getPos _x;
		sleep 0.5;
	} forEach _members;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
KRON_UPS_Exited = KRON_UPS_Exited + 1;
if (_track == "TRACK") then
{
	_trackerName setMarkerType _markerDot;
	_destName setMarkerType "Empty";
};
///////////////////////////////////////////////////////////////////////////////////////////////////
_friends = nil;
_enemies = nil;
///////////////////////////////////////////////////////////////////////////////////////////////////
#ifdef __DEBUG__
	format ["   - patrol exiting -> %1 no longer exists",_grpActual] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
	diag_log format ["   - patrol exiting -> %1 no longer exists",_grpActual];
#endif
