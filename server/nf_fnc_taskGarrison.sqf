if (!isServer) exitWith {};
waitUntil {time > 0};

_excludedClasses = [
	"Land_A_Minaret_EP1",
	"Land_Mil_House_EP1",
	"Land_Mil_Repair_center_EP1",
	"Land_Mil_Barracks_EP1",
	"Land_Mil_Guardhouse_EP1"
];

_array = [NULL,100,false,true,"SAFE"];
for "_i" from 0 to ((count _this) - 1) do {_array set [_i, _this select _i]};

_group = _array select 0;
_area = _array select 1;
_teleport = _array select 2;
_patrol = _array select 3;
_behaviour = _array select 4;

_group setBehaviour _behaviour;
_groupSize = count units _group;
_houseSizeMin = switch (true) do {
	case (_groupSize <= 2) : {10};
	case (_groupSize <= 3) : {18};
	case (_groupSize >= 4) : {22};
};

_nearHouses = nearestObjects [_group, ["House"], _area];
_filterHouses = [];
{
	_class = typeOf _x;
	_size = round(sizeOf _class);
	
	if (
		_size >= _houseSizeMin && 
		!(_x in var_filledHouses) && 
		!(_class in _excludedClasses) && 
		(_x buildingExit 0) select 0 != 0
	) then {
		_filterHouses pushBack _x;
	};
} forEach _nearHouses;
if (count _filterHouses < 1) exitWith {hintSilent (str(_group)+"\nNessuna casa compatibile nelle vicinanze")};
	
_selHouse = _filterHouses select round(random(count _filterHouses - 1));
var_filledHouses pushBack _selHouse;

_holdPos = [];
for "_i" from 0 to 40 do {if ((_selHouse buildingPos _i) select 0 != 0) then {_holdPos pushBack _i}};

{
	_posID = _holdPos select round(random(count _holdPos - 1));
	_x setVariable ["var_unitBuildID",_posID];
	_holdPos = _holdPos - [_posID];
	
	_movePos = _selHouse buildingPos _posID;
	if (!_teleport) then {
		_x doMove _movePos;
		[_x,_movePos] spawn {
			waitUntil {(_this select 0) distance (_this select 1) <= 1}; 
			doStop (_this select 0);
		};
	} else {
		_x setPos _movePos;
		doStop _x;
	};
	
	sleep 0.25;
} forEach units _group;

if (!_patrol) exitWith {};

while {true} do {
	{
		_beha = behaviour _x;
		if (round(random 10) >= 4 && _beha != "COMBAT") then {
			sleep (15 + random 30);
			
			_oldID = _x getVariable ["var_unitBuildID",-1];
			_newID = _holdPos select round(random(count _holdPos - 1));
			_x setVariable ["var_unitBuildID",_newID];
			
			_holdPos = _holdPos - [_newID];
			_holdPos pushBack _oldID;
	
			_movePos = _selHouse buildingPos _newID;
			_x doMove _movePos;
			[_x,_movePos] spawn {
				waitUntil {(_this select 0) distance (_this select 1) <= 1}; 
				doStop (_this select 0);
			};
		} else {
			_stance = if (_beha == "COMBAT") then {"MIDDLE"} else {"UP"};
			_x setUnitPos _stance;
			
			sleep 2;
		};
	} forEach units _group;
	
	sleep 1;
};