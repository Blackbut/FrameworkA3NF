if (dialog) exitWith {closeDialog 0};	
	
createDialog "nf_editor_interface";
disableSerialization;

_list = 21000;
_category = 21001;
_button1 = 22000;
_button2 = 23000;
_button3 = 24000;
_button4 = 25000;

_button5 = 26000;
_button6 = 26001;
_button7 = 26002;
_button8 = 26003;

{
	ctrlShow [_x, false];
} forEach [_list,_category,_button1,_button2,_button3,_button4];

_actionArray = ["var_be_gripSnap","var_be_rotationSnap","var_be_terrainSnap","var_be_showInfo"];
_buttonArray = [_button5,_button6,_button7,_button8];
for "_i" from 0 to 3 do {
	_var = _actionArray select _i;
	_action = _var + " = !" + _var;
	buttonSetAction [_buttonArray select _i, _action];
};
	
_mousePos = [0.5, 0.5];
if (_this != 0) then {
	ctrlShow [_button1, true];
	ctrlShow [_button2, true];
	ctrlShow [_button3, true];
	ctrlShow [_button4, true];
	
	_b1Action = "
		var_be_curDir = getDir var_be_nearObj; 
		var_be_curObjClass = typeOf var_be_nearObj; 
		var_be_curObj = var_be_nearObj;
		var_be_movingObj = true;
			
		closeDialog 0; 
		false
	";
	
	_b3Action = "
		var_be_curDir = getDir var_be_nearObj; 
		var_be_curObjClass = typeOf var_be_nearObj;
		false call e_fnc_setObj;
		
		closeDialog 0; 
		false
	";
	
	_b4Action = "
		call e_fnc_objFunctions;
		
		closeDialog 0; 
		false
	";
	
	buttonSetAction [_button1, _b1Action];
	buttonSetAction [_button2, "var_be_nearObj call e_fnc_deleteObj; closeDialog 0; false"];
	buttonSetAction [_button3, _b3Action];
	buttonSetAction [_button4, _b4Action];
} else {
	_mousePos = [0.62, 0.43];
	ctrlShow [_list, true];
	ctrlShow [_category, true];
};

setMousePosition _mousePos;

_ui = findDisplay 20000;
_holdKey = _ui displayAddEventHandler ["KeyDown", "if (dialog && var_be_inEditor) then {(_this select 1) call e_fnc_holdKey}; false"];

if (_this != 0) exitWith {};

lbClear _list;
lbClear _category;
_arraysList = [];
{
	if (typeName _x == "STRING") then {
		lbAdd [_category, _x];
	} else {
		_arraysList pushBack _x;
	};
} forEach var_be_buildCategories;
lbSetCurSel [_category, var_be_curCategory];

_array = _arraysList select var_be_curCategory;
var_be_curSel = if (var_be_curObjClass == "") then {-1} else {
	_array find var_be_curObjClass;
};
	
while {dialog} do {
	_array = _arraysList select var_be_curCategory;
	lbClear _list;
	{
		_name = getText (configFile >> "CfgVehicles" >> _x >> "DisplayName");
		lbAdd [_list, _name];
	} forEach _array;
	
	if (var_be_curSel > -1) then {
		lbSetCurSel [_list, var_be_curSel];
		var_be_curObjClass = _array select (lbCurSel _list);
		false call e_fnc_setObj;
	};
	
	waitUntil {sleep 0.1; lbCurSel _list != var_be_curSel OR lbCurSel _category != var_be_curCategory OR !dialog};
	if (!dialog) exitWith {};
	
	var_be_curSel = if (lbCurSel _category != var_be_curCategory) then {0} else {
		lbCurSel _list;
	};
	
	var_be_curCategory = lbCurSel _category;
};