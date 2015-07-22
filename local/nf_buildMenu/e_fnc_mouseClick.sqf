switch (_this select 1) do {
	case 0 : {
		if (!dialog) then {
			var_be_curObj allowDamage true;
			
			if (!var_be_movingObj) then {
				var_be_objHistory pushBack var_be_curObj;
				var_be_curObj hideObject false;
				
				_z = getPosATL var_be_curObj select 2;
				if ((_z == 0 OR (_z > 0 && _z < 0.05)) && var_be_terrainSnap) then {
					_pos = getPos var_be_curObj;
					_pos set [2,0];
					
					var_be_curObj setPos _pos;
				};
				
				var_be_curObj = objNull;
				
				false call e_fnc_setObj;
			} else {
				var_be_movingObj = false;
				var_be_curObj = objNull;
			};
		};
	};
		
	case 1 : {
		if (dialog) then {closeDialog 0} else {
			var_be_movingObj = false;
			if (isNull var_be_curObj) then {
				if !(isNil "var_be_nearObj") then {
					1 spawn e_fnc_openInterface;
				};
			} else {
				var_be_curObj call e_fnc_deleteObj;
				var_be_curObjClass = "";
			};
		};
	};
};