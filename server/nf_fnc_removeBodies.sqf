if (!isServer) exitWith {};

_delay = 15;

while {true} do {
	_deadMen = [];
	{
		_var = _x getVariable ["nf_gearing","null"];
		if (_var == "null") then {
			_deadMen pushBack _x;
		};
	} forEach allDeadMen;
	
	if (count _deadMen > 20) then {
		(_deadMen select 0) spawn {
			hideBody _this;
			sleep 5;
			
			deleteVehicle _this;
		};
	};
	
	sleep _delay;
};