// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

// STRINGA DA INSERIRE NELL' "ACT" DEL TRIGGER //
// null = [this,150,4,true] execVM "server\nf_fnc_civilianSettle.sqf";
// [marker,area,densità (Da 1 a 10),civili nelle case] //
// Per avviare lo script applicate l'Init ad un GameLogic e piazzatelo sopra la città che volete riempire PS: Al momento la funzione per gli edifici è disabilitata

/// NON MODIFICARE ///
if (!isServer) exitWith {};

_array = [NULL,100,3,true];
for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_marker = getPos(_array select 0);
_area = _array select 1;
_density = _array select 2;
_house = _array select 3;
if (_density > 10) then {_density = 10};
if (_density < 1) then {_density = 1};

_fnc_randomWalk = {
	private ["_group","_area","_center","_civ","_radius","_dir","_wpPos"];
	_group = _this select 0;
	_area = _this select 1;
	_center = _this select 2;
	
	_civ = leader _group;
	_group setFormDir round(random 360);
	
	sleep (random 10);
	while {alive _civ} do {
		if (behaviour _civ in ["AWARE","COMBAT"]) then {
			_civ setUnitPos "DOWN";
			sleep 5;
		} else {
			_civ setUnitPos "UP";
			
			_radius = round((_area / 5) + random 30);
			_dir = round(random 360);
			_wpPos = [(getPos _civ select 0) + (_radius * sin(_dir)), (getPos _civ select 1) + (_radius * cos(_dir)), 0];
			
			if (_wpPos distance _center < _area && !(isOnRoad _wpPos)) then {		
				_wp = _group addWaypoint [_wpPos, 0];
				_wp setWaypointSpeed "LIMITED";
				_wp setWaypointType "MOVE";
			
				sleep (10 + round(random 10));
			};
		};
		sleep 0.5;
	};
	sleep 10;
	
	hideBody _civ;
	sleep 5;
	deleteVehicle _civ;
};

_civArray = [
	"C_man_polo_1_F_euro",
	"C_man_polo_2_F_euro",
	"C_man_polo_3_F_euro",
	"C_man_polo_4_F_euro",
	"C_man_polo_5_F_euro",
	"C_man_polo_6_F_euro",
	"C_man_1_1_F",
	"C_man_1_2_F",
	"C_man_1_3_F",
	"C_man_shorts_2_F",
	"C_man_shorts_3_F"
];

_rate = ceil((_area / 20)*_density);
for "_i" from 0 to _rate do {
	_class = _civArray call BIS_fnc_selectRandom;
	
	_spawnPos = [_marker, _area] call CBA_fnc_randPos;
	_group = createGroup civilian;
	_class createUnit [_spawnPos,_group];
	_group setBehaviour "SAFE";
	
	[_group,_area,_marker] spawn _fnc_randomWalk;
};

/*
_houseClasses = [
	"Land_House_C_1_EP1",
	"Land_House_C_1_v2_EP1",
	"Land_House_C_2_EP1",
	"Land_House_C_3_EP1",
	"Land_House_C_4_EP1",
	"Land_House_C_5_V1_EP1",
	"Land_House_C_5_V2_EP1",
	"Land_House_C_5_V3_EP1",
	"Land_House_C_9_EP1",
	"Land_House_C_10_EP1",
	"Land_House_C_11_EP1",
	"Land_House_C_12_EP1",
	"Land_House_K_1_EP1",
	"Land_House_K_2_EP1",
	"Land_House_K_3_EP1",
	"Land_House_K_4_EP1",
	"Land_House_K_5_EP1",
	"Land_House_K_6_EP1",
	"Land_House_K_7_EP1",
	"Land_House_K_8_EP1",
	"Land_House_L_1_EP1",
	"Land_House_L_2_EP1",
	"Land_House_L_3_EP1",
	"Land_House_L_4_EP1",
	"Land_House_L_5_EP1",
	"Land_House_L_6_EP1",
	"Land_House_L_7_EP1",
	"Land_House_L_8_EP1",
	"Land_House_L_9_EP1"
];

_fnc_housePatrol = {
	private ["_unit","_house","_bPos"];
	_unit = _this select 0;
	_house = _this select 1;
	
	while {alive _unit} do {
		_bPos = _house buildingPos round(random 20);
		_unit doMove _bPos;
		
		sleep (120 + round(random 60));
	};
};

_civilianClassArray = [_chernArray,_takiArray] select _type;

_rate = ceil((_area / 20)*_density);
_maxHouse = ceil(_rate / 5);
_curHouse = 0;

for "_i" from 0 to _rate do {
	_group = createGroup civilian;
	_class = _civilianClassArray call BIS_fnc_selectRandom;
	
	if (_curHouse < _maxHouse) then {
		_houseArray = nearestObjects [getMarkerPos _marker, _houseClasses, _area];
		_selHouse = _houseArray select round(random(count _houseArray - 1));
		
		_class createUnit [(_selHouse buildingPos 2),_group];
		_civ = leader _group;
		[_civ,_selHouse] spawn _fnc_housePatrol;
		
		_curHouse = _curHouse + 1;
	} else {
		_spawnPos = [getMarkerPos _marker, _area] call CBA_fnc_randPos;
		_class createUnit [_spawnPos,_group];
		[_group,_area,getMarkerPos _marker] spawn _fnc_randomWalk;
	};
	sleep 0.2;
};*/