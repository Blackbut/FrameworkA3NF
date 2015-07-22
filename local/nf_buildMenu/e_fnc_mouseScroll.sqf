if (!var_be_holdCtrl && !var_be_holdShift) then {
	var_be_cameraZ = -(_this * 0.1);
} else {
	if (var_be_holdCtrl && !var_be_holdShift) then {
		_speed = if (var_be_rotationSnap) then {22.5} else {2.5};
		_multi = if (_this > 0) then {1} else {-1};
		
		var_be_curDir = (getDir var_be_curObj + (_multi * _speed));
		var_be_curObj setDir var_be_curDir;
		e_arrow setDir var_be_curDir;
	} else {
		if (var_be_holdShift && !var_be_holdCtrl) then {
			var_be_curObjZ = var_be_curObjZ + (_this * 0.1);
			if (var_be_curObjZ < -4) then {
				var_be_curObjZ = -4;
			};
				
			if (var_be_curObjZ > 10) then {
				var_be_curObjZ = 10;
			};
		};
	};
};