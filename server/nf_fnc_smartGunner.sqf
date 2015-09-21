// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //
waitUntil {time > 0};

if (!isServer) exitWith {};
if (count _this < 1) exitWith {};

_array = [null,10,"WEST"];
for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_gun = _array select 0;
_area = _array select 1;
_side = _array select 2;

_pos = _gun modelToWorld [0,0 - _area,0];

/*_marker = createMarker [str(_gun), _pos];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [_area,_area];

_marker = createMarker [str(_gun) + "2", getPos _gun];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";*/

_trigger = createTrigger ["EmptyDetector", _pos];
_trigger setTriggerArea [_area, _area, 0, false];
_trigger setTriggerActivation [_side, "PRESENT", false];

waitUntil {sleep 1; triggerActivated _trigger};
_crew = gunner _gun;

_crew leaveVehicle _gun;
doGetOut _crew;