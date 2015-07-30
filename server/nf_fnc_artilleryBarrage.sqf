// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

// STRINGA DA USARE PER AVVIARE LO SCRIPT: //
// null = [marker\oggetto\posizione,"HE",20,100,5,20] execVM "server\nf_fnc_artilleryBarrage.sqf" //
// Solo i primi 2 valori sono necessari, il resto è opzionale //

/// NON MODIFICARE ///
if (!isServer) exitWith {};

_array = [NULL,"HE",5,100,5,10];
for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_pos = _array select 0;
_type = _array select 1;
_amount = _array select 2;
_spread = _array select 3;
_delayShell = _array select 4;
_delayMission = _array select 5;

_cPos = switch (typeName _pos) do {
	case "STRING" : {getMarkerPos _pos};
	case "OBJECT" : {getPos _pos};
	case "ARRAY" : {_pos};
};

_ammo = switch (_type) do {
	case "HE" : {"Sh_155mm_AMOS"};
	case "AP" : {"Sh_125mm_APFSDS"};
	case "SMOKE" : {"Smoke_120mm_AMOS_White"};
	default {_type};
};

sleep (_delayMission + random 5);
[-1,{
	_this execVM "local\nf_fnc_spawnDust.sqf";
},[_pos,_spread]] call CBA_fnc_globalExecute;

_soundArray = [0,0,0,0,0];
_rounds = 1;
while {_rounds <= _amount} do {
	_rnd = ceil(random 10);
	if !(_rnd in _soundArray) then {
		_soundArray pushBack _rnd;
		_soundArray deleteAt 0;
	
		_rounds = _rounds + 1;
		_tPos = _cPos;
		_tPos set [2, 200];
	
		_shell = createVehicle [_ammo, _tPos, [], _spread, "NONE"];
		_shell setVectorUp [0,9,0.1];
		_shell setVelocity [0,0,-200];
	
		if (_type == "HE") then {
			[_shell,_rnd] spawn {
				_shell = _this select 0;
				_rnd = _this select 1;
			
				_sPos = getPos _shell;
				_sPos set [2,(-1 + (random 0.65))];
				_soundPos = [_sPos select 0, _sPos select 1, (getPosASL _shell select 2) - 200];
				
				waitUntil {!alive _shell};
				_crater = "CraterLong" createVehicle _sPos;
				_crater setDir (random 360);
				_crater setPos _sPos;
			
				_sound = format ["sound\artillery\large_shell_impact_distant_%1.ogg", _rnd];
				_path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				playSound3D [_path+_sound,_crater,false,_soundPos,30,1,1000];
			};
		};
		
		sleep ((_delayShell - 1) + random 2);
	};
	
	sleep 0.1;
}; 