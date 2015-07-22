// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2014 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

/// NON MODIFICARE ///
if (!isServer) exitWith {};

_group = group (_this select 0);
_posArray = var_posListArray select (_this select 1);

_unitID = 1;
{
	_unitArray = _posArray select _unitID;
	_newGroup = createGroup (side _x);
	[_x] join _newGroup;
	
	_x setPosASL (_unitArray select 0);
	_x setDir (_unitArray select 1);
	_newGroup setFormDir (_unitArray select 1);
	
	_stanceArray = ["UP","MIDDLE","DOWN"];
	_x setUnitPos (_stanceArray select (_unitArray select 2));
	
	_unitID = _unitID + 1;
} forEach units _group;

deleteGroup _group;