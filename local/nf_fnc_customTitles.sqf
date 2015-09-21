// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (isDedicated) exitWith {};

waitUntil {time > 0};
sleep (_this select 0);

disableSerialization;
250 cutRsc ["nf_titleHUD", "PLAIN"];

_fnc_simpleRank = {
	_rank = switch (_this) do {
		case "PRIVATE" : {"Pvt. "};
		case "CORPORAL" : {"Cpr. "};
		case "SERGEANT" : {"Stg. "};
		case "LIEUTENANT" : {"Ltn. "};
		case "CAPTAIN" : {"Cpt. "};
		case "MAJOR" : {"Mjr. "};
		case "COLONEL" : {"Col. "};
	};
	
	_rank
};

_fnc_dynamicText = {
	disableSerialization;
	_hud = var_title_hudIDD select 0;
	_line = _this select 0;
	
	_textArray = [_this select 1, ""] call CBA_fnc_split;
	_randomChar = ["abcdefhkmnorstuvwxz", ""] call CBA_fnc_split;
	
	_newArray = [];
	for "_i" from 0 to count _textArray - 1 do {
		_text = "";
		_newArray = _newArray + [_textArray select _i];
		playsound "counter";
		
		{
			_char = _x;
			if ((_i < (_newArray find _char) + 5) && _char != " ") then {
				_char = _randomChar call BIS_fnc_selectRandom;
			};
			
			_text = _text + _char;
		} forEach _newArray;
		
		_line ctrlSetText _text;
		sleep 0.05;
	};
	
	_line ctrlSetText (_this select 1);
};

_fnc_dynamicTime = {
	disableSerialization;
	_hud = var_title_hudIDD select 0;
	_line = _this;
	
	_year = str (date select 0);
	_month = str (date select 1);
	_day = str (date select 2);
	_hour = str (date select 3);
	_min = str (date select 4);
	
	_timeText = _day + "/" + _month + "/" + _year + " - " + _hour + ":" + _min + ":";
	_timeArray = [_timeText, ""] call CBA_fnc_split;
	_newArray = [];
	_text = "";
	for "_i" from 0 to count _timeArray - 1 do {
		_text = "";
		_newArray = _newArray + [_timeArray select _i];
		playsound "counter";
		
		{
			_text = _text + _x;
		} forEach _newArray;	
	
		_line ctrlSetText _text;
		sleep 0.05;
	};
	
	[_text, _line] spawn {
		for "_i" from 1 to 30 do {
			_dec = "";
			
			_length = [str(round time)] call CBA_fnc_strLen;
			if (_length < 2) then {_dec = "0"};
			_newText = (_this select 0) + _dec + str(round time);
		
			(_this select 1) ctrlSetText _newText;
			sleep 1;
		};
	};
};

_hud = var_title_hudIDD select 0;
_lines = [
	_hud displayCtrl 6101,
	_hud displayCtrl 6102,
	_hud displayCtrl 6103,
	_hud displayCtrl 6104,
	_hud displayCtrl 6105,
	_hud displayCtrl 6106,
	_hud displayCtrl 6107,
	_hud displayCtrl 6108
];

_textArray = _this;
_textArray deleteAt 0;

_writtenLines = [];
_id = 0;
{
	_curLine = _lines select _id;
	if (_x != "") then {
		if (_x != "time") then {
			[_curLine,_x] spawn _fnc_dynamicText;
		} else {
			_curLine spawn _fnc_dynamicTime;
		};
	};
		
	_id = _id + 1;
	if (_x != "") then {
		_textLenght = (count (toArray _x)) * 0.09;
		sleep _textLenght;
	} else {
		sleep 0.5;
	};

	_writtenLines pushBack _curLine;
	_lineCount = count _writtenLines;
	_lineY = 0.9;
	if (_lineCount < count _textArray) then {
		_lineH = safeZoneH * 0.03;
		for "_i" from 0 to _lineCount do {
			(_writtenLines select _i) ctrlSetPosition [safezoneX, _lineY - _lineH*(_lineCount - _i)];
			(_writtenLines select _i) ctrlCommit 0;
		};
	};
} forEach _textArray;
	
sleep 5;
	
_alpha = 0.8;
_fadeTime = 160;
for "_i" from 0 to _fadeTime do {
	{
		if (_x != _lines select 0 && _i < (_fadeTime / 2)) then {
			_x ctrlSetTextColor [0.9, 0.9, 0.9, _alpha];
		};
		
		if (_x == _lines select 0 && _i > (_fadeTime / 2 + 10)) then {
			_x ctrlSetTextColor [0.9, 0.9, 0.9, _alpha];
		};
	} forEach _lines;
	
	_alpha = _alpha - 0.017;
	if (_i > (_fadeTime / 2) && _i < (_fadeTime / 2 + 10)) then {_alpha = 0.8};
	
	sleep 0.03;
};
	
sleep 1;
_hud closeDisplay 1;