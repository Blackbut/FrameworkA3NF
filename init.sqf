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
execVM "server\nf_fnc_baseFort.sqf"
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

// AGGIUNGERE I GRUPPI A CUI ASSEGNARE UN MARKER TENENDOLI SEPARATI DA UNA VIRGOLA " , " //
// [gruppo,testo marker,icona marker,colore marker] //
// La lista completa dei marker è disponibile a questo link ( https://community.bistudio.com/wiki/cfgMarkers )
var_groupMarkerArray = [
	[plhq_g,"PL1","b_hq","ColorOrange"],
	[asl_g,"ASL","b_hq"],
	[a1_g,"A1","b_inf"],
	[a2_g,"A2","b_inf"],
	[bsl_g,"BSL","b_hq","ColorGreen"],
	[b1_g,"B1","b_inf","ColorGreen"],
	[b2_g,"B2","b_inf","ColorGreen"],
	[steelrain_g,"Steelrain","b_air","ColorRed"],
	[arrowhead_g,"Arrowhead","b_air","ColorRed"],
	[panther_g,"Panther","b_armor","ColorRed"]
];