if (!var_be_inEditor) exitWith {};

if (!isMultiplayer) then {
	//hintSilent str(_this);
};

_moveSpeed = 0.2;
switch (_this) do {
	case 16 : {0 spawn e_fnc_openInterface};
	
	case 21 : {var_be_gripSnap = !var_be_gripSnap};
	case 22 : {var_be_rotationSnap = !var_be_rotationSnap};
	case 23 : {var_be_terrainSnap = !var_be_terrainSnap};
	case 24 : {var_be_showInfo = !var_be_showInfo};
	
	case 29 : {var_be_holdCtrl = true};
	case 42 : {var_be_holdShift = true};
	
	case 57 : {player setPos (getPos e_center)};
	case 33 : {var_be_curObjZ = 0};
	
	case 44 : {
		if (var_be_holdCtrl) then {
			_last = count var_be_objHistory - 1;
			if (_last > -1) then {
				deleteVehicle (var_be_objHistory select _last);
				var_be_objHistory deleteAt _last;
			};
		};
	};
	
	case 18 : {
		var_be_curDir = getDir var_be_nearObj; 
		var_be_curObjClass = typeOf var_be_nearObj;
		
		_obj = false call e_fnc_setObj;
		if (_obj isKindOf "LandVehicle" OR _obj isKindOf "Air") then {_obj hideObject true};
	};
	
	case 19 : {
		var_be_nearObj call e_fnc_deleteObj;
		var_be_curObjClass = "";
	};
		
	case 59 : {
		var_be_showHelp = !var_be_showHelp;
		_helpCtrl = (var_be_hudIDD select 0) displayCtrl 32000;
		_helpText = parseText "<t size='1.5'>Premi F1 per (mostrare) i comandi</t>";
		
		if (var_be_showHelp) then {
			_helpText = parseText 
			"<t size='1.5'>Premi F1 per (nascondere) i comandi</t><br/>WASD - Muovi<br/>Spazio - Teletrasporto<br/>LMB - Piazza<br/>RMB - Interazione Oggetto\Chiudi\Annulla<br/>Q - Lista<br/>E - Copia<br/>R - Rimuovi<br/>F - Reset Altezza<br/>Y - Segui Griglia<br/>U - Blocca Rotazione<br/>I - Livella al terreno<br/>O - Info Oggetto<br/>Ctrl + Z - Annulla ultimo<br/><br/>Hold Ctrl + Scroll - Rotazione<br/>Hold Shift + Scroll - Altezza<br/>Mouse Scroll - Altezza Telecamera";
		};
		_helpCtrl ctrlSetStructuredText _helpText;
	};
		
	default {
		var_be_holdCtrl = false;
		var_be_holdShift = false;
		var_be_controllerX = 0;
		var_be_controllerY = 0;
	};
};