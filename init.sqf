// Variabili 
var_taskArray = [];
var_groupMarkers = true;
var_groupMarkersDelay = 60;
var_filledHouses = [];
var_spawnGroupArray = [];

// Editor Script
execVM "local\editor\nf_fnc_editorPlacing.sqf";
execVM "local\editor\nf_fnc_fogEditor.sqf";
execVM "local\nf_buildMenu\nf_be_editorInit.sqf";
execVM "local\fnc_briefing.sqf";

// Server Script
execVM "server\nf_fnc_groupMarkers.sqf";
execVM "server\nf_fnc_removeBodies.sqf";
execVM "server\nf_fnc_baseFort.sqf";
if (isServer && isMultiplayer) then {
	execVM "functions.sqf";
};

if (!isMultiplayer) then {
	{
		if (!isPlayer _x) then {
			deleteVehicle _x;
			_x execVM "local\nf_fnc_gearing.sqf";
		};
	} forEach switchableUnits;
	
	player addAction ["Virtual Arsenal",{["Open",true] spawn BIS_fnc_arsenal},0,-1000,false,false,"",""];
};

// Server Init Delay
if (!isServer) exitWith {};
waitUntil {time > 0};

// Array Settings
// AGGIUNGERE GLI ARRAY DI POSIZIONE QUI' SOTTO TENENDOLI DIVISI DA UNA VIRGOLA " , " //
var_posListArray = [

];

// AGGIUNGERE I CLASSNAME DA AGGIUNGERE AL BUILD MENU
[
	
] spawn fnc_be_addCustomObject;

// AGGIUNGERE I GRUPPI A CUI ASSEGNARE UN MARKER TENENDOLI SEPARATI DA UNA VIRGOLA " , " //
// [gruppo,testo marker,icona marker,colore marker] //
// La lista completa dei marker è disponibile a questo link ( https://community.bistudio.com/wiki/cfgMarkers )
var_groupMarkerArray = [
	//[plhq_g,"PL1","b_hq","ColorOrange"]
];