// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (count _this < 2) exitWith {};
waitUntil {time > 0};

_taskArray = [NULL,NULL,"","",""];
for "_i" from 0 to ((count _this) - 1) do {
	_taskArray set [_i, _this select _i];
};

_taskName = _taskArray select 0;
_taskStatus = _taskArray select 1;
_taskTitle = _taskArray select 2;
_taskDesc = _taskArray select 3;
_taskMarker = _taskArray select 4;

_fnc_findTask = {
	_index = (var_taskArray find _this) + 1;
	_taskID = var_taskArray select _index;
	
	_taskID
};

switch (_taskStatus) do {
	case "NEW" : {
		_task = player createSimpleTask [_taskName];
		_task setSimpleTaskDescription [_taskDesc, _taskTitle, _taskTitle];
		if (_taskMarker != "") then {_task setSimpleTaskDestination (getMarkerPos _taskMarker)};
		var_taskArray = var_taskArray + [_taskName, _task];
		
		player setCurrentTask _task;
		_task setTaskState "Assigned";
		["TaskCreated",["",_taskTitle]] call BIS_fnc_showNotification;
	};
	
	case "COMPLETE" : {
		_task = _taskName call _fnc_findTask;
		_taskTitle = (taskDescription _task) select 1;
		if (taskState _task in ["Canceled", "Failed"]) exitWith {};
		
		_task setTaskState "Succeeded";
		["TaskSucceeded",["",_taskTitle]] call BIS_fnc_showNotification;
	};
	
	case "FAIL" : {
		_task = _taskName call _fnc_findTask;
		_taskTitle = (taskDescription _task) select 1;
		if (taskState _task in ["Succeeded", "Canceled"]) exitWith {};
		
		_task setTaskState "Failed";
		["TaskFailed",["",_taskTitle]] call BIS_fnc_showNotification;
	};
	
	case "CANCEL" : {
		_task = _taskName call _fnc_findTask;
		_taskTitle = (taskDescription _task) select 1;
		if (taskState _task in ["Succeeded", "Failed"]) exitWith {};
		
		_task setTaskState "Canceled";
		["TaskCanceled",["",_taskTitle]] call BIS_fnc_showNotification;
	};
};