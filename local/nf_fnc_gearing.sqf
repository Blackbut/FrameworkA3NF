// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

/// NON MODIFICATE NULLA DENTRO A QUESTO PARAGRAFO ///
_unit = _this;
_var = _unit getVariable ["nf_gearing","null"];
if (_var == "null") exitWith {};

if (_unit distance (getMarkerPos "respawn_west") > 500) exitWith {};

removeAllWeapons _unit;
removeBackpack _unit;

_addMagazines = {
	_unit = _this select 0;
	_mag = _this select 1;
	_count = _this select 2;
	
	for "_i" from 1 to _count do {
		_unit addMagazine _mag;
	};
};

_addItems = {
	_unit = _this select 0;
	_item = _this select 1;
	_count = _this select 2;
	
	for "_i" from 1 to _count do {
		_unit addItem _item;
	};
};

_addBasicDressings = {
	[_this,"ACE_fieldDressing",3] call _addItems;
	_this addItem "ACE_morphine";
};

_addBackpack = {
	_unit = _this select 0;
	_backpack = _this select 1;
	_array = _this select 2;
	
	_unit addBackpack _backpack;
	clearAllItemsFromBackpack _unit;
	
	sleep 1;
	
	{
		for "_i" from 1 to (_x select 1) do {
			_unit addItemToBackpack (_x select 0);
		};
	} forEach _array;
};

_addWeapon = {
	_unit = _this select 0;
	_class = _this select 1;
	_array = _this select 2;
	
	_amountGL = 5;
	_amount = _array;
	if (typeName _array == "ARRAY") then {
		_amount = _array select 0;
		_amountGL = _array select 1;
	};
	_mag = if (count _this > 3) then {_this select 3};
	
	_ammoArray = getArray (configFile >> "CfgWeapons" >> _class >> "magazines");
	_muzzleArray = getArray (configFile >> "CfgWeapons" >> _class >> "muzzles");
	_weaponType = getText (configFile >> "CfgWeapons" >> _class >> "recoil");
	
	_unit addWeapon _class;
	
	if (isNil "_mag") then {
		_mag = _ammoArray select 0;
	};
	
	if (count _muzzleArray > 1) then {
		_glClass = _muzzleArray select 1;
		_glAmmo = getArray (configFile >> "CfgWeapons" >> _class >> _glClass >> "magazines");
		if (isNil "_amountGL") then {
			_amountGL = 5;
		};
		
		for "_i" from 1 to _amountGL do {
			_unit addMagazine (_glAmmo select 0);
		};
	};
	
	for "_i" from 1 to _amount do {
		_unit addMagazine _mag;
	};
};

_addAttachment = {
	_unit = _this select 0;
	_attachArray = _this - [_unit];
	
	{
		_unit addPrimaryWeaponItem _x;
	} forEach _attachArray;
};

_unit call _addBasicDressings;
_unit addItem "ACE_EarPlugs";
_unit addItem "ACE_CableTie";
_unit linkItem "rhsusf_ANPVS_14";

/// DA QUI' POTETE COMINCIARE A MODIFICARE LO SCRIPT ///
// INIT DA METTERE NELL'UNITÀ TRAMITE EDITOR: //
// this setVariable ["nf_gearing","TL",true];

// Classname sistema medico ACE
//["ACE_EarPlugs","ACE_CableTie","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_bloodIV_250"]

switch (_var) do {
	default {};

	case "TL" : { // Questa è la classe da specificare nell'init dell'unità
		[_unit,"rhs_weap_m4_m203",[8,6]] call _addWeapon; // I caricatori vengono aggiungi automaticamente dallo script, l'unica cosa da inserire è il classname dell'arma (trovate una lista quì http://browser.six-projects.net/cfg_weapons/classlist?utf8=%E2%9C%93&version=65&commit=Save) e la quantità di caricatori da aggiungere nell'inventario. 
		// La formula [0,0] va usata solo se l'arma ha un Lanciagranate integrato e si vuole modificare il valore di Grante HE (5 di default)
		// Se si desidera usare dei caricatori particolari potete usare questa sintassi: [_unit,"M16A4_ACG_GL",6,"ACE_30Rnd_556x45_T_Stanag"] call _addWeapon;
	
		[_unit,"rhsusf_acc_ACOG","rhsusf_acc_anpeq15"] call _addAttachment; // Questa funzione vieni utilizzata per assegnare una lista di accessori all'arma primaria
		_unit addHeadgear "rhsusf_mich_bare_norotos_headset";
		
		_unit addWeapon "Binocular";
		[_unit,"SmokeShellGreen",3] call _addMagazines; // Questa funzione vieni utilizzata per aggiungere ulteriori caricatori o granate HE\Fumonegene.
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addItem "ACRE_PRC148";
		_unit addMagazine "B_IR_Grenade";
	};
	
	case "SL" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_ACOG","rhsusf_acc_anpeq15"] call _addAttachment;
		_unit addHeadgear "rhsusf_mich_bare_norotos_headset";
		
		_unit addWeapon "Binocular";
		[_unit,"SmokeShellGreen",3] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addItem "ACRE_PRC148";
		_unit addMagazine "B_IR_Grenade";
	};
	
	case "PL" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_compm4","rhsusf_acc_anpeq15"] call _addAttachment;
		_unit addHeadgear "rhsusf_mich_bare_norotos_headset";
		
		_unit addWeapon "Binocular";
		[_unit,"SmokeShellGreen",3] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addItem "ACRE_PRC148";
		_unit addMagazine "B_IR_Grenade";
	};
	
	case "RADIO" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_eotech_552","rhsusf_acc_anpeq15"] call _addAttachment;
		
		_unit addWeapon "Binocular";
		[_unit,"SmokeShellGreen",3] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addItem "ACRE_PRC148";
	};
	
	case "R" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_compm4","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
	};
	
	case "R_C4" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_compm4","rhsusf_acc_anpeq15"] call _addAttachment;
		
		_unit addItem "DemoCharge_Remote_Mag";
		_unit addItem "DemoCharge_Remote_Mag";
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
	};
	
	case "AT" : {
		[_unit,"rhs_weap_m4_grip2",8] call _addWeapon;
		[_unit,"rhsusf_acc_compm4","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addWeapon "rhs_weap_M136"; // Per le armi a uso singolo, come l'AT 4, usare il comando addWeapon
	};
	
	case "AT_H" : {
		[_unit,"rhs_weap_m4",6] call _addWeapon;
		[_unit,"rhsusf_acc_eotech_552","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
		[_unit,"rhs_weap_fgm148",1] call _addWeapon;
	};
	
	case "AAT_H" : {
		[_unit,"rhs_weap_m4",6] call _addWeapon;
		[_unit,"rhsusf_acc_eotech_552","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		
		[_unit,"rhsusf_assault_eagleaiii_ocp",[["rhs_fgm148_magazine_AT",2]]] spawn _addBackpack;
		//[_unit,"ACE_BackPack",[["SMAW_HEAA",2]]] spawn _addBackpack; // Comando usato per aggiungere uno zaino e relativo equipaggiamento
		// Esempio per aggiungere equipaggiamento vario ad uno zaino: [_unit,"ACE_BackPack",[["30Rnd_556x45_Stanag",6],["HandGrenade",2],["SmokeShell",4]]] spawn _addBackpack;
	};
	
	case "AR" : {
		_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
		[_unit,"rhs_weap_m249_pip",4] call _addWeapon;
		[_unit,"rhsusf_acc_ELCAN","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
	};
	
	case "AAR" : {
		[_unit,"rhs_weap_m4_grip2",8] call _addWeapon;
		[_unit,"rhsusf_acc_compm4","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"HandGrenade",2] call _addMagazines;
		[_unit,"SmokeShell",2] call _addMagazines;
		[_unit,"rhsusf_assault_eagleaiii_ocp",[["rhsusf_100Rnd_556x45_soft_pouch",4]]] spawn _addBackpack;
	};
	
	case "R_AMMO" : {
		[_unit,"rhs_weap_m4",8] call _addWeapon;
		[_unit,"rhsusf_acc_eotech_552","rhsusf_acc_anpeq15"] call _addAttachment;
		
		[_unit,"SmokeShell",2] call _addMagazines;
		[_unit,"rhsusf_assault_eagleaiii_ocp",[["30Rnd_65x39_caseless_mag",10],["1Rnd_HE_Grenade_shell",4]]] spawn _addBackpack;
	};
	
	case "MM" : {
		[_unit,"rhs_weap_m14ebrri",6] call _addWeapon;
		[_unit,"rhsusf_acc_ACOG3","rhsusf_acc_anpeq15"] call _addAttachment;

		[_unit,"SmokeShellGreen",3] call _addMagazines;
		_unit addMagazine "B_IR_Grenade";
	};
	
	case "MEDIC" : {
		[_unit,"rhs_weap_m4_grip2",6] call _addWeapon;
		[_unit,"rhsusf_acc_eotech_552","rhsusf_acc_anpeq15"] call _addAttachment;
		
		_unit addItem "ACE_personalAidKit";
		[_unit,"rhsusf_assault_eagleaiii_ocp",[["ACE_fieldDressing",35],["ACE_morphine",20],["ACE_epinephrine",20],["ACE_bloodIV_250",10],["ACE_personalAidKit",10]]] spawn _addBackpack;
		[_unit,"SmokeShellYellow",4] call _addMagazines;
	};
	
	case "PILOT" : {
		[_unit,"rhs_weap_m4",4] call _addWeapon;
		[_unit,"SmokeShellGreen",4] call _addMagazines;
		
		_unit addItem "ACE_morphine";
		_unit addItem "ACE_epinephrine";
		
		_unit addbackpack "B_Parachute";
		_unit addItem "ACRE_PRC148";
	};
	
	case "CREW" : {
		[_unit,"rhs_weap_m4",4] call _addWeapon;
		[_unit,"SmokeShellGreen",4] call _addMagazines;
		
		_unit addItem "ACE_morphine";
		_unit addItem "ACE_epinephrine";
		
		_unit addItem "ACRE_PRC148";
	};
};

sleep 1;
reload _unit;