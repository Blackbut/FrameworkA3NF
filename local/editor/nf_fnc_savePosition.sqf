// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (_this select 3 > 0) exitWith {
	var_positionArray = ["0"];
	hintSilent str var_positionArray;
};

_rawPos = getPosASL player; 
_dir = round(getDir player);

_stanceId = 0;
_found = false;
{
	_find = [animationState player, _x] call CBA_fnc_find;
	if (!_found) then {
		if (_find < 0) then {
			_stanceId = _stanceId + 1;
		} else {
			_found = true;
		};
	};
} forEach ["perc","pknl","ppne"];
_curStance = ["UP","MIDDLE","DOWN"] select _stanceId;

_roundPos = [];
for "_i" from 0 to 2 do {
	_roundPos = _roundPos + [round((_rawPos select _i)*10)/10];
};

var_positionArray = var_positionArray + [[_roundPos,_dir,_stanceId]];
var_positionArray set [0, str(count var_positionArray - 1)];

copyToClipboard str(var_positionArray);
hintSilent str var_positionArray;