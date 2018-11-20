// this is for use with tasks so it doesnt destroy map objects... it will replace the object for the task, once done, delete and unhide the original.
// test code...
[] spawn
{
	_cursorTarget = cursorObject;

	_objPos = getPosATL _cursorTarget;
	_obj = typeOf _cursorTarget;
	_objDir = direction _cursorTarget;

	_cursorTarget enableSimulationGlobal false;
	_cursorTarget allowDamage false;
	_cursorTarget hideObjectGlobal true;
	
	uiSleep 0.1;

	_objRep = createVehicle [_obj, _objPos, [], 0, "CAN_COLLIDE"];
	_objRep setDir _objDir;
	_objRep setPosATL _objPos;
};

