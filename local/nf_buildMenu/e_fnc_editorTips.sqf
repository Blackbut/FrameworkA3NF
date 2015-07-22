disableSerialization;
_tipCtrl = (var_be_hudIDD select 0) displayCtrl 33000;
_tipW = 0.4;
_tipH = 0.125;
_closeSize = 0.03;

_ctrlPos = ctrlPosition _tipCtrl;
//_tipCtrl ctrlSetStructuredText parseText "pfofi s sdisjdis disdiu s ddusudsyd s usd";
_tipCtrl ctrlSetPosition [(_ctrlPos select 0) + _tipW - _closeSize, _ctrlPos select 1, _closeSize, _closeSize];
_tipCtrl ctrlCommit 1;

while {var_be_inEditor} do {
	waitUntil {var_be_showTips};
	
};