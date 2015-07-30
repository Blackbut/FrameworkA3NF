_obj = player;
_pos = getposASL _obj;

_cPos = _this select 0;
_area = _this select 1;

_windMult = 0.01;
_color = [0.1,0.1,0.1];
_alpha = 0.1;

while {true} do {
	_dust = "#particlesource" createVehicleLocal _cPos;
	_dust setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d", 16, 12, 4, 0], "", "Billboard", 1, 10, [0, 0, 0], [(wind select 0)*_windMult,(wind select 1)*_windMult,0.01], 2, 1.3, 1, 0, [20], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 1, "", "", _dust];
	_dust setParticleRandom [30, [_area, _area, 0.3], [0, 0, 0], 1, 0.2, [0, 0, 0, 0.01], 0, 0];
	_dust setDropInterval 0.01;
	
	sleep 300;
	deleteVehicle _dust;
};