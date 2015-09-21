// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

// STRINGA DA INSERIRE NELL'INIT DEL LEADER DEL GRUPPO CHE SI VUOLE CREARE //
// null = [this,"alphaSpawn","PATROL",300,"WEDGE","AWARE","LIMITED"] execVM "server\nf_fnc_spawnGroup.sqf"; //
// [leader,variabile,script,area,formazione,stato,velocità] //
// Solo i primi 2 valori sono necessari, il resto è opzionale //

/// NON MODIFICARE ///
if (!isServer) exitWith {};
if (count _this < 2) exitWith {};

private ["_array","_oldLeader","_oldGroup","_spawnVar","_spawnTask","_pArea","_pFormation","_pBehaviour","_pSpeed","_gPos","_gSide","_gDir","_syncVeh","_gClassArray","_textVar","_newGroup"];

_array = [null,null,"",50,"COLUMN","SAFE","LIMITED"];
if ((count _this) > 2) then {
	if (_this select 2 == "GARRISON") then {
		_array = [null,null,"",50,true,false];
	};
};

for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_oldLeader = _array select 0;
_oldGroup = group _oldLeader;
_spawnVar = _array select 1;
_spawnTask = _array select 2;

_pArea = _array select 3;
_pFormation = _array select 4;
_pBehaviour = _array select 5;
_pSpeed = _array select 6;

_gPos = getPos _oldLeader;
_gSide = side _oldLeader;
_gDir = getDir _oldLeader;

_initDelay = allGroups find _oldGroup;
sleep (_initDelay * 0.01);

var_spawnGroupArray = var_spawnGroupArray + [_oldGroup];

_syncVeh = [];
if (count synchronizedObjects _oldLeader > 0) then {
	{
		_syncVeh = _syncVeh + [[typeOf _x, getPos _x, getDir _x]];
		deleteVehicle _x;
	} forEach synchronizedObjects _oldLeader;
};

_gClassArray = [];
{
	_gClassArray = _gClassArray + [typeOf _x];
	deleteVehicle _x;
} forEach units _oldGroup;

_textVar = format ["waitUntil {sleep 2; %1}", _spawnVar];
call compile (_spawnVar + " = false");
call compile _textVar;

_delay = var_spawnGroupArray find _oldGroup;
sleep (_delay * 0.3);

//_newGroup = [_gPos, _gSide, _gClassArray] call BIS_fnc_spawnGroup;
_newGroup = createGroup _gSide;
{
	_x createUnit [_gPos,_newGroup];
	sleep 0.3;
} forEach _gClassArray;

_newGroup setFormDir _gDir;
{
	_x setDir _gDir;
} forEach units _newGroup;

if (_spawnTask == "") then {
	if (count _syncVeh > 0) then {
		{
			_vehClass = _x select 0;
			_vehPos = _x select 1;
			_vehDir = _x select 2;
			
			_veh = _vehClass createVehicle _vehPos;
			_veh setPos _vehPos;
			_veh setDir _vehDir;
			
			_newGroup addVehicle _veh;
		} forEach _syncVeh;
	};
	
	_newGroup copyWaypoints _oldGroup;
} else {
	switch (_spawnTask) do {
		case "PATROL" : {
			[_newGroup, _gPos, _pArea, 6, "MOVE", _pBehaviour, "YELLOW", _pSpeed, _pFormation] call CBA_fnc_taskPatrol;
		};
		
		case "GARRISON" : {
			_hTeleport = _array select 4;
			_hPatrol = _array select 5;
			
			//[_newGroup, _pArea, _hTeleport, _hPatrol] execVM "server\nf_fnc_buildingPatrol.sqf";
			[_newGroup, _pArea, _hTeleport, _hPatrol] execVM "server\nf_fnc_taskGarrison.sqf";
		};
		
		case "PLACE" : {
			[leader _newGroup, _pArea] execVM "server\nf_fnc_placeUnits.sqf";
		};
	};
};

deleteGroup _oldGroup;

_textVar = format ["waitUntil {sleep 3; !%1}", _spawnVar];
call compile _textVar;

{
	deleteVehicle _x;
} forEach units _newGroup;
deleteGroup _newGroup;