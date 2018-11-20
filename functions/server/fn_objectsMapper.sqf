private ["_fileName", "_dir", "_pos", "_objList", "_objs", "_class", "_relPos", "_relDir", "_fuel", "_damage", "_init"];

params ["_objList","_basePos","_baseDir","_baseSurface"];

_objs = [];

///////////////////////////////////////////////////////////////////////////////////////////////
if (_baseSurface isEqualTo "bridge") then
{
	_basePosNew = _basePos;
	_basePosIntersect = +_basePosNew;
	_basePosIntersect set [2, 100];
	while {(lineIntersects [ATLToASL _basePosIntersect,ATLToASL _basePosNew])} do
	{
		_basePosNew set [2, ((_basePosNew select 2) + 0.25)];
	};
	// _basePosNew set [2, ((_basePosNew select 2) - 0.25)];
	_basePos = ATLToASL _basePosNew;
};
///////////////////////////////////////////////////////////////////////////////////////////////
{
	// private ["_obj"];

	// array list: [objectClass, objectPosition, objectDirection, objectSimulation, _objectSimpleObject, _objectPitchBank, objectDamage, _objectAllowDamage, objectVarName, objectInit]
	_obj = objNull;
	_objClass = _x select 0;
	_objPos = _x select 1;
	_objDir = _x select 2;
	_objSimulation = _x param [3, true];
	_objSimObj = _x param [4, false];
	_objectPitchBank = _x param [5, nil];
	_objDamage = _x param [6, nil];
	_objAllowDamage = _x param [7, nil];
	_objVarName = _x param [8, nil];
	_objInit = _x param [9, nil];

	// relative position
	_objPos = _basePos vectorAdd ([_objPos, -(_baseDir)] call BIS_fnc_rotateVector2D);

	// create vehicle/simple object
	if (_objSimObj isEqualTo false) then
	{
		_isMineBase = false;
		_cfgCheck = "(getText (_x >> 'ammo') isEqualTo _objClass)" configClasses (configFile >> "cfgVehicles");
		if !(_cfgCheck isEqualTo "") then
		{
			_isMineBase = _objClass isKindOf ["MineBase", configFile >> "CfgVehicles"];
		};
		if (_isMineBase) then
		{
			_obj = createMine [_objClass, _objPos, [], 0];
		}
		else
		{
			_obj = createVehicle [_objClass, _objPos, [], 0, "CAN_COLLIDE"];

			_obj allowDamage false; // test for exploding objects

			if (!isNil "_objSimulation") then
			{
				_obj enableSimulationGlobal _objSimulation;
				_obj setVariable ["BIS_Dyno_simulation",_objSimulation];
			};
		};
	}
	else
	{
		_obj = createSimpleObject [_objClass, _objPos];
	};

	// object damage
	if (!isNil "_objDamage") then
	{
		if (typeName _objDamage isEqualTo "SCALAR") then
		{
			_obj setDamage _objDamage;
		};
	};

	// object var name
	if (!isNil "_objVarName") then
	{
		if (_objVarName != "") then
		{
			_obj setVehicleVarName _objVarName;
			call (compile (_objVarName + " = _obj;"));
		};
	};

	// object init
	if (!isNil "_objInit") then
	{
		_obj call (compile ("this = _this; " + _objInit));
	};

	// object direction
	_obj setDir (_baseDir + _objDir);

	// object surface
	switch (_baseSurface) do
	{
		case "land": {_obj setPosATL _objPos;};
		case "water": {_obj setPosASL _objPos;};
		case "bridge": {
				_obj setPosASL _objPos;
				_objPosNew = getPosATL _obj;
				_objPosZ = (_objPosNew select 2);
				if (_objPosZ <= 0) then
				{
					_objPosNew set [2,0];
					_obj setPosATL _objPosNew;
					if !(_obj isKindOf "HOUSE") then
					{
						_obj setVectorUp surfaceNormal position _obj;
					};
				};
		};
		default {_obj setPosATL _objPos;};
	};

	// adapt object to surface if on land
	// if (!(_obj isKindOf "HOUSE") && (_objectPitchBank in [[0,0],[-0,0],[0,-0],[-0,-0]])) then
	if (!(_obj isKindOf "HOUSE") && (_baseSurface isEqualTo "land")) then
	{
		_obj setVectorUp surfaceNormal position _obj;
	};

	// pitchbank object
	if ((!isNil "_objectPitchBank") && (typeName _objectPitchBank isEqualTo "ARRAY") && !(_objectPitchBank in [[0,0],[-0,0],[0,-0],[-0,-0]])) then
	{
		[_obj, (_objectPitchBank select 0), (_objectPitchBank select 1)] call BIS_fnc_setPitchBank;
	};

	_obj allowDamage true; // test for exploding objects

	// allow object damage
	if (!isNil "_objAllowDamage") then
	{
		if (typeName _objDamage isEqualTo "BOOL") then
		{
			_obj allowDamage _objAllowDamage;
		};
	};

	_obj setVariable ["baseCompositionObject",true];

	_objs pushBack _obj;
	// uiSleep 0.01;
} forEach _objList;

_objs
