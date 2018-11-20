		if !(_locationBldPosArr isEqualTo []) then
		{
			_locationBldPos = selectRandom _locationBldPosArr;
			_locationBldPosArr = _locationBldPosArr - [_locationBldPos];
			doStop _unit;
			_unit setPosASL _locationBldPos; // ASL?
		}
		else
		{
			_k = 0;
			_foundPos = false;
			while {sleep 0.1; (_k < 360) || (_foundPos isEqualTo false)} do
			{
				// _newPos = _taskLocation findEmptyPosition [1,20,(typeOf _unit)];
				// if (_newPos isEqualTo []) then
				// {
					// _newPos = [_taskLocation, 1, _taskAreaBase, 0.5, 1, 20, 0] call BIS_fnc_findSafePos;
				// };
				_newPos = _taskLocation getPos [round(random _taskAreaBase),round(random 360)];
				// [[[7323.15,5422.82,3.60964],[-0,-0,1],286c74b80# 1675074: pier_box_f.p3d,286c74b80# 1675074: pier_box_f.p3d]]
				// [[[7332.35,5434.33,-25.9618],[0.0557787,-0.0690597,0.996052],<NULL-object>,<NULL-object>]]
				_lis = lineIntersectsSurfaces [AGLToASL [(_newPos select 0),(_newPos select 1),0],AGLToASL [(_newPos select 0),(_newPos select 1),25],objNull,objNull,true,1,"GEOM","NONE"];

				_lisPos = _lis select 0 select 0;
				_lisVecUp = _lis select 0 select 1;
				_lisIntersectObj = _lis select 0 select 2;
				_lisParentObj = _lis select 0 select 3;

				if (!isNil "_lisParentObj") then
				{
					if ((_lisVecUp isEqualTo [-0,-0,1]) && ((_lisPos select 2) > 1)) then // if vector is up/flat and height above water is greater than 1 meters
					{
						_unit setPosASL _lisPos;
						_foundPos = true;
						#ifdef __DEBUG__
							format ["         + %1 has been moved to position %2",_unit,_lisPos] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
							diag_log format ["         + %1 has been moved to position %2",_unit,_lisPos];
						#endif
					};
				};
				if (_k > 100) exitWith
				{
					#ifdef __DEBUG__
						format ["         - %1 is doomed! can't find pier position.",_unit] remoteExec ["RELO_fnc_systemChatGlobal",[0,-2] select isDedicated];
						diag_log format ["         - %1 is doomed! can't find pier position.",_unit];
					#endif
				};
				_k = _k + 1;
			};
		};