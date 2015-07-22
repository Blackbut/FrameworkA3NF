// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2014 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

// STRINGA DA INSERIRE NELL'INIT DEL VEICOLO //
// null = [this,"WEST",0,[["M4A1",4]],["20Rnd_556x45_Stanag",5]]; //
// [veicolo,fazione,tipo,armi aggiuntive,munizioni aggiuntive] //
// Solo i primi 2 valori sono necessari, il resto è opzionale //

/// NON MODIFICARE ///
_array = [NULL,"WEST",0,[],[]];
for "_i" from 0 to ((count _this) - 1) do {
	_array set [_i, _this select _i];
};

_veh = _array select 0;
_side = _array select 1;
_type = _array select 2;
_customWeaponArray = _array select 3;
_customAmmoArray = _array select 4;

clearWeaponCargo _veh;
clearMagazineCargo _veh;

_grenadeClass = if (_side == "WEST") then {[["HandGrenade_West",5]]} else {[["HandGrenade_East",5]]};
_rifleMagazineClass = if (_side == "WEST") then {[["30Rnd_556x45_Stanag",15]]} else {[["30Rnd_545x39_AK",8],["30Rnd_762x39_AK47",8]]};
_autoMagazineClass = if (_side == "WEST") then {[["200Rnd_556x45_M249",6],["100Rnd_762x51_M240",8]]} else {[["75Rnd_545x39_RPK",8],["100Rnd_762x54_PK",8]]};
_glMagazineClass = if (_side == "WEST") then {[["1Rnd_HE_M203",8]]} else {[["1Rnd_HE_GP25",8]]};
_atWeaponClass = if (_side == "WEST") then {[["ACE_M136_CSRS",2]]} else {[["RPG18",2]]};
_backpackClass = if (_side == "WEST") then {"ACE_Backpack_Wood"} else {"ACE_ALICE_Backpack"};

_defaultWeapon = [
	["ACRE_PRC148",2],
	[_backpackClass,3]
];

_addAmmoArray = [];
_addWeaponArray = [];
switch (_type) do {
	case 0 : {
		_defaultAmmo = [["SmokeShell",5],["ACE_Medkit",2],["ACE_Bandage",5]];
		_addAmmoArray = [_defaultAmmo,_grenadeClass,_rifleMagazineClass,_customAmmoArray];
		_addWeaponArray = [_customWeaponArray];
	};
	
	case 1 : {
		_defaultAmmo = [["SmokeShell",10],["ACE_Medkit",2],["ACE_Morphine",5],["ACE_Epinephrine",5],["ACE_Bandage",5]];
		_addAmmoArray = [_defaultAmmo,_grenadeClass,_rifleMagazineClass,_autoMagazineClass,_glMagazineClass,_customAmmoArray];
		_addWeaponArray = [_defaultWeapon,_customWeaponArray];
	};
	
	case 2 : {
		_defaultAmmo = [["SmokeShell",10],["SmokeShellYellow",5],["IR_Strobe_Target",3],["ACE_Medkit",4],["ACE_Morphine",5],["ACE_Epinephrine",5],["ACE_Bandage",10]];
		_addAmmoArray = [_defaultAmmo,_grenadeClass,_rifleMagazineClass,_autoMagazineClass,_glMagazineClass,_customAmmoArray];
		_addWeaponArray = [_defaultWeapon,_atWeaponClass,_customWeaponArray];
	};
};

{
	{
		_veh addWeaponCargo _x;
	} forEach _x;
} forEach _addWeaponArray;

{
	{
		_veh addMagazineCargo _x;
	} forEach _x;
} forEach _addAmmoArray;