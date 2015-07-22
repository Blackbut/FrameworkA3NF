systemChat "Initializing Build Editor...";

var_be_showInfo = false;
var_be_showHelp = false;
var_be_cameraX = 0;
var_be_cameraY = 0;
var_be_cameraZ = 0;
var_be_holdShift = false;
var_be_holdCtrl = false;
var_be_gripSnap = false;
var_be_rotationSnap = false;
var_be_terrainSnap = false;
var_be_movingObj = false;

var_be_controllerX = 0;
var_be_controllerY = 0;

var_be_curSel = 0;
var_be_curCategory = 0;
var_be_nearObj = objNull;
var_be_curObj = objNull;
var_be_curObjClass = "";
var_be_curObjZ = 0;
var_be_curDir = 0;

var_be_objHistory = [];
sleep 0.25;

e_fnc_deleteObj = {
	e_arrow hideObject true;
	
	var_be_objHistory = var_be_objHistory - [_this];
	deleteVehicle _this;
};

10 cutRsc ["nf_editor_hud", "PLAIN"];
disableSerialization;
_textCtrl = (var_be_hudIDD select 0) displayCtrl 31000;
_helpCtrl = (var_be_hudIDD select 0) displayCtrl 32000;

_gridCtrl = (var_be_hudIDD select 0) displayCtrl 34000;
_rotCtrl = (var_be_hudIDD select 0) displayCtrl 34001;
_terCtrl = (var_be_hudIDD select 0) displayCtrl 34002;
_infoCtrl = (var_be_hudIDD select 0) displayCtrl 34003;

_helpText = parseText "<t size='1.5'>Premi F1 per (mostrare) i comandi</t>";
_helpCtrl ctrlSetStructuredText _helpText;

e_camera = "Sign_Sphere10cm_F" createVehicleLocal (getPos player);
e_center = "Sign_Sphere25cm_F" createVehicleLocal (getPos player);
e_arrow = "Sign_Arrow_Direction_Blue_F" createVehicleLocal (getPos player);
e_arrow hideObject true;
e_camera hideObject true;

var_be_inEditor = true;
sleep 0.1;
systemChat "Build Editor Initialized.";

e_camera setPos [getPos e_camera select 0, getPos e_camera select 1, 15];
e_camera switchCamera "INTERNAL";

var_be_iconArray = [_gridCtrl,_rotCtrl,_terCtrl,_infoCtrl];
[] spawn {
	_z = 10;
	while {var_be_inEditor} do {
		_z = _z + var_be_cameraZ;
		if (_z < 2) then {_z = 2} else {if (_z > 12) then {_z = 12}};
		var_be_cameraZ = 0;
	
		_cPos = getPosATL player;
		e_camera setPosATL [_cPos select 0, _cPos select 1, (_cPos select 2) + _z];
		e_camera setDir (getDir player);
	
		[e_camera,var_be_cameraY,0] call BIS_fnc_setPitchBank;
		_varArray = [var_be_gripSnap,var_be_rotationSnap,var_be_terrainSnap,var_be_showInfo];
		
		for "_i" from 0 to 3 do {
			_ctrl = var_be_iconArray select _i;
			_alpha = if (_varArray select _i) then {0.95} else {0.3};
			_ctrl ctrlSetTextColor [0.9,0.9,0.9,_alpha]
		};
		
		sleep 0.01;
	};
};

while {var_be_inEditor} do {
	_ePos = screenToWorld [0.5,0.5];
	if (_ePos distance player < 100) then {
		if (var_be_gripSnap) then {
			_ePos = [round((_ePos select 0)), round((_ePos select 1))];
		};
		e_center setPosATL [_ePos select 0, _ePos select 1, var_be_curObjZ];
		e_arrow setPosATL [_ePos select 0, _ePos select 1, 0];
		
		_nearArray = nearestObjects [e_center, (var_be_allArray + ["LandVehicle","Air"]), 5];
		_nearArray = _nearArray - [e_center];
		var_be_nearObj = _nearArray select 0;
	};
	
	if !(isNull var_be_curObj) then {var_be_nearObj = var_be_curObj};
	
	if !(isNil "var_be_nearObj") then {
		_bound = boundingBoxReal var_be_nearObj;
		_min = _bound select 0;
		_max = _bound select 1;
		_nPos = [getPos var_be_nearObj select 0, getPos var_be_nearObj select 1, ((abs ((_max select 2) - (_min select 2))) / 2) + (getPosATL var_be_nearObj select 2)];
		
		_objAlt = (round((getPosATL var_be_nearObj select 2) * 10)) / 10;
		_objAltText = if (_objAlt > 0) then {(" - Alt: " + str(_objAlt))} else {""};
		
		_text = if (var_be_showInfo) then {
			_displayName = getText (configFile >> "CfgVehicles" >> typeOf var_be_nearObj >> "DisplayName");
			parseText format ["%1 - %2<br/>%3<br/>Alt: %4 - Dir: %5<br/>ID: %6",typeOf var_be_nearObj,_displayName,[getPos var_be_nearObj select 0,getPos var_be_nearObj select 1],(getPosATL var_be_nearObj select 2),getDir var_be_nearObj,var_be_nearObj getVariable ["be_objID","?"]];
		} else {parseText (typeOf var_be_nearObj + _objAltText)};
		
		_textCtrl ctrlSetStructuredText _text;
		_textCtrl ctrlSetPosition (worldToScreen _nPos);
		_textCtrl ctrlCommit 0;
	} else {
		_textCtrl ctrlSetStructuredText parseText "";
		var_be_curDir = 0;
	};
	
	if (!isNull var_be_curObj) then {
		var_be_curObj setPosATL (getPosATL e_center);
	};
	
	sleep 0.01;
	if (dialog) then {
		_textCtrl ctrlSetStructuredText parseText "";
		waitUntil {!dialog};
	};
};

deleteVehicle e_camera;
deleteVehicle e_center;
deleteVehicle e_arrow;
deleteVehicle var_be_curObj;

(var_be_hudIDD select 0) closeDisplay 1;
player switchCamera "INTERNAL";
var_be_inEditor = false;