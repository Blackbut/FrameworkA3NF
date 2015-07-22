// Quì vanno inseriti tutti gli init di missione, come se fosse in init.sqf
// Lo sript verrà eseguito dal server, dai client e dai client in JIP

0 setFog [0,0,0];
setAccTime  1;

_fnc_objectiveHint = {
	/*
	[
		"nome", // Nome dell'obiettivo, questo verrà usato per richiamare l'obiettivo tramite script - Questo parametro è necessario
		"stato", // Lo stato da applicare all'obiettivo, tra: "NEW","COMPLETE","FAIL","CANCEL" - Questo parametro è necessario
		"titolo", // Il titolo dell'obiettivo
		"descrizione", // Una breve descrizione sull'obiettivo
		"marker" // Marker della posizione dove verrà svolto l'obiettivo
	] call nf_fnc_manageTask;
	*/
};

_fnc_radioBox = {
	clearItemCargoGlobal _this;
	clearMagazineCargoGlobal _this;
	clearWeaponCargoGlobal _this;
	
	_this addItemCargoGlobal ["ACRE_PRC148", 10];
	_this addItemCargoGlobal ["ACRE_PRC343", 30];
};

// Queste funzioni verranno eseguite solo sul client dei giocatori sia ad inizio che in JIP (Join in Progress)
if (!isDedicated) then {
	[]spawn _fnc_objectiveHint;
	
	[5,"[NF] Co@30 - Framework","Linea 1","Linea 2"] execVM "local\nf_fnc_customTitles.sqf";
};

// Queste funzioni verranno eseguite solo sul server
if (isServer) then {
	acre_box call _fnc_radioBox;
};