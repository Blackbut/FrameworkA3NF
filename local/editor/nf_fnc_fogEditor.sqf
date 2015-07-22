// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (isMultiplayer) exitWith {};

var_fogSettings = [0,0,0];
player addAction ["Fog Editor",{call nf_fnc_fogDialog},1,-2001,false,false,"","vehicle player == player"];

nf_fnc_fogDialog = {
	createDialog "nf_fog_editor";
	
	0 setFog var_fogSettings;
	hintSilent "";
	
	{
		sliderSetRange _x;
	} forEach [
		[70001,0,0.3],
		[70002,0,0.2],
		[70003,-100,1000]
	];
	
	_id = 0;
	{
		_value = var_fogSettings select _id;
		_id = _id + 1;
		
		sliderSetPosition [_x,_value];
	} forEach [70001,70002,70003];
};

nf_fnc_fogSlider = {
	_var = _this select 0;
	_value = (_this select 1) select 1;
	
	var_fogSettings set [_var,_value];
	0 setFog var_fogSettings;
	
	hintSilent str(var_fogSettings);
};

nf_fnc_sliderReset = {
	var_fogSettings = [0,0,0];
	closeDialog 0;
	call nf_fnc_fogDialog;
};