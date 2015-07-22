if (var_be_curObjClass == "") exitWith {};
var_be_curObj call e_fnc_deleteObj;
	
var_be_curObj = var_be_curObjClass createVehicle (getMarkerPos "spawn_vehicle");
e_arrow hideObject true;
e_arrow setDir var_be_curDir;

if (var_be_curObj isKindOf "LandVehicle" OR var_be_curObj isKindOf "Air") then {
	if (dialog) then {
		[] spawn {
			waitUntil {!dialog};
			if (var_be_curObj isKindOf "LandVehicle" OR var_be_curObj isKindOf "Air") then {
				var_be_curObj hideObject true;
				e_arrow hideObject false;
			};
		};
	} else {
		var_be_curObj hideObject true;
		e_arrow hideObject false;
	};
};

var_be_curObj setPos (getPos e_center);
var_be_curObj setDir var_be_curDir;
	
if (_this) then {var_be_curObjClass = ""};
	
var_be_curObj