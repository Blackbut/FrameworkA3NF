if (isDedicated) exitWith {};

// Spectator
if (isMultiplayer) then {
	execVM "CSSA3\CSSA3_init.sqf";
};

// Script & Funzioni
player execVM "local\nf_fnc_gearing.sqf";

nf_fnc_manageTask = compile preprocessFileLineNumbers "local\nf_fnc_manageTask.sqf";

// Variabili
var_taskStep = 0;