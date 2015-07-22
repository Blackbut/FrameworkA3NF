// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

// STRINGA DA USARE PER AVVIARE LO SCRIPT: //
// null = ["marker","HE",20,100,5,20] execVM "server\nf_fnc_artilleryBarrage.sqf" //
// Solo i primi 2 valori sono necessari, il resto è opzionale //

/// NON MODIFICARE ///
if (!isServer) exitWith {};

_array = [NULL,"HE",5,100,5,10];
for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_marker = _array select 0;
_type = _array select 1;
_amount = _array select 2;
_spread = _array select 3;
_delayShell = _array select 4;
_delayMission = _array select 5;

_ammo = switch (_type) do {
	case "HE" : {"Sh_125mm_HE"};
	case "AP" : {"Sh_125mm_APFSDS"};
	case "SMOKE" : {"Smoke_120mm_AMOS_White"};
	default {_type};
};

sleep (_delayMission + random 10);

for "_i" from 1 to _amount do {
	_tPos = getMarkerPos _marker;
	_tPos set [2, 200];
	
	_shell = createVehicle [_ammo, _tPos, [], _spread, "NONE"];
	_shell setVectorUp [0,9,0.1];
	_shell setVelocity [0,0,-200];
	
	sleep ((_delayShell - 1) + random 2);
}; 