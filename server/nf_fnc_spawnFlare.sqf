// null = ["MarkerFlare1","Red"] execVM "server\nf_fnc_spawnFlare.sqf";

if (!isServer) exitWith {};

_pos = getMarkerPos (_this select 0);
_color = _this select 1;

_pos set [2,150];
_class = "F_40mm_" + _color;

_flare = _class createVehicle _pos;
_flare setPos _pos;