if (!isServer) exitWith {};

// Copiare le stringe salvate con il Build Menu
_objArray = [
	
];

{
	_class = _x select 0;
	_posASL = _x select 1;
	_dir = _x select 2;
	_id = _x select 3;
	if (isNil "_id") then {_id = ""};
	
	_obj = _class createVehicle _posASL;
	_obj setPosASL _posASL;
	_obj setDir _dir;
	_obj setVariable ["be_objID",_id,true];
} forEach _objArray;