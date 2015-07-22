_class = typeOf var_be_nearObj;
switch (true) do {
	case (_class in ["TargetP_Inf3_Acc1_F","TargetP_Civ2_F","Land_Target_Swivel_01_F","Target_Swivel_01_left_F","Target_Swivel_01_right_F"]) : {
		if !(var_be_nearObj in var_popupTargets) then {
			var_popupTargets pushBack var_be_nearObj;
			var_be_nearObj animate ["terc",1];
			//var_be_nearObj addMPEventHandler ["MPHit",{(_this select 0) animate ['terc', 1]}];
		} else {
			var_popupTargets = var_popupTargets - [var_be_nearObj];
			var_be_nearObj animate ["terc",0];
		};
	};
};