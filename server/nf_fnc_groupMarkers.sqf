// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2014 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

/// NON MODIFICARE ///
if (!isServer) exitWith {};
waitUntil {time > 5};

if (count var_groupMarkerArray < 1 OR !var_groupMarkers) exitWith {};

_fnc_createMarker = {
	_grp = _this select 0;
	_text = _this select 1;
	_type = _this select 2;
	if (isNil "_grp") exitWith {};
	if (!var_groupMarkers) exitWith {};
	_color = if (count _this > 3) then {_this select 3} else {"ColorBlue"};
	
	_marker = [str _grp, [0,0], "Icon", [0.7,0.7], "PERSIST"] call CBA_fnc_createMarker;
	_kiaDelay = 0;
	
	while {true} do {
		if (alive leader _grp) then {
			_kiaDelay = 0;
			_marker setMarkerPos (getPos (leader _grp));
			_marker setMarkerType _type;
			_marker setMarkerText _text;
			_marker setMarkerColor _color;
			_marker setMarkerAlpha 0.7;
			
			sleep var_groupMarkersDelay;
		} else {
			sleep 3;
			if !(alive leader _grp) then {
				_kiaDelay = _kiaDelay + 1;
				_marker setMarkerColor "ColorBlack";
				_marker setMarkerText (_text + " - KIA");
				_marker setMarkerAlpha 0.5;
				
				if (_kiaDelay >= 20) then {
					_marker setMarkerAlpha 0;
				};
			};
		};
	};
};

{
	_x spawn _fnc_createMarker;
	sleep 0.2;
} forEach var_groupMarkerArray;