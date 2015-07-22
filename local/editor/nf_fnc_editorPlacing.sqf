// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (isMultiplayer) exitWith {};

var_positionArray = ["0"];
player addAction ["Salva posizione","local\editor\nf_fnc_savePosition.sqf",0,-1000,false,false,"","vehicle player == player"];
player addAction ["Reset","local\editor\nf_fnc_savePosition.sqf",1,-1001,false,false,"","vehicle player == player && var_positionArray select 0 != '0'"];