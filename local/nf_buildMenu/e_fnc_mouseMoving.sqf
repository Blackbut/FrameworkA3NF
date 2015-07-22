//_x = round((_this select 1) * 100) / 100;
//_y = round((_this select 2) * 100) / 100;
	
//var_be_cameraX = var_be_cameraX + _x;
	
_y = _this select 2;
var_be_cameraY = var_be_cameraY - _y;
if (var_be_cameraY > 89) then {
	var_be_cameraY = 89;
} else {
	if (var_be_cameraY < -80) then {
		var_be_cameraY = -80;
	};
};