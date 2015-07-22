// -------------------------------- //
//   Creato da: =]NF[= Blackbut  	//
//     "NF Framework" - 2015 		//
//   http://www.nerafolgore.it/ 	//
// -------------------------------- //

if (isMultiplayer) exitWith {};
waitUntil {time > 1};

var_be_customObjectArray = [""];

_wallMilArray = [
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_Razorwire_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_BagFence_Short_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_End_F",
	"Land_Mil_WiredFence_F",
	"Land_IndFnc_9_F",
	"Land_IndFnc_3_F",
	"Land_IndFnc_Pole_F",
	"Land_New_WiredFence_5m_F",
	"Land_New_WiredFence_pole_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Mil_WallBig_Corner_F"
];

_wallCivArray = [
	"Land_Pipe_fence_4m_F",
	"Land_PipeWall_concretel_8m_F",
	"Land_Slums01_8m",
	"Land_Slums01_pole",
	"Land_Slums02_4m",
	"Land_Slums02_pole",
	"Land_SportGround_fence_F",
	"Land_Stone_4m_F",
	"Land_Stone_Gate_F",
	"Land_Stone_pillar_F",
	"Land_Wall_Tin_4",
	"Land_Wall_Tin_Pole",
	"Land_City_4m_F",
	"Land_City_Gate_F",
	"Land_City_Pillar_F"
];

_bunkersArray = [
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Tower_F"
];

_killhouseArray = [
	"Land_Shoot_House_Panels_F",
	"Land_Shoot_House_Panels_Window_F",
	"Land_Shoot_House_Panels_Vault_F",
	"Land_Shoot_House_Wall_Stand_F",
	"Land_Shoot_House_Wall_Prone_F",
	"Land_Shoot_House_Tunnel_F",
	"Land_Shoot_House_Tunnel_Prone_F",
	"Land_Shoot_House_Tunnel_Stand_F"
];

_targetsArray = [
	"TargetP_Inf3_Acc1_F",
	"Land_Target_Swivel_01_F",
	"Target_Swivel_01_left_F",
	"Target_Swivel_01_right_F",
	"TargetP_Civ2_F"
];

_rangeMiscArray = [
	"Land_Obstacle_Ramp_F",
	"Land_Obstacle_Bridge_F",
	"ShootingPos_F",
	"Dirthump_3_F"
];

_usLightDArray = [
	"rhsusf_m1025_d_m2",
	"rhsusf_m1025_d_Mk19",
	"rhsusf_m1025_d",
	"rhsusf_m998_d_2dr_fulltop",
	"rhsusf_m998_d_2dr",
	"rhsusf_m998_d_4dr_fulltop",
	"rhsusf_m998_d_4dr",
	"rhsusf_M1078A1P2_d_fmtv_usarmy",
	"rhsusf_M1078A1P2_d_flatbed_fmtv_usarmy",
	"rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy"
];

_usLightWArray = [
	"rhsusf_m1025_w_m2",
	"rhsusf_m1025_w_Mk19",
	"rhsusf_m1025_w",
	"rhsusf_m998_w_2dr_fulltop",
	"rhsusf_m998_w_2dr",
	"rhsusf_m998_w_4dr_fulltop",
	"rhsusf_m998_w_4dr",
	"rhsusf_M1078A1P2_wd_fmtv_usarmy",
	"rhsusf_M1078A1P2_wd_fmtv_usarmy",
	"rhsusf_M1078A1P2_wd_flatbed_fmtv_usarmy",
	"rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy"
];

_usHeavyDArray = [
	"RHS_M2A3",
	"RHS_M2A3_BUSKI",
	"RHS_M2A3_BUSKIII",
	"rhsusf_m1a2sep1d_usarmy",
	"rhsusf_m1a2sep1tuskid_usarmy"
];

_usHeavyWArray = [
	"RHS_M2A3_wd",
	"RHS_M2A3_BUSKI_wd",
	"RHS_M2A3_BUSKIII_wd",
	"rhsusf_m1a2sep1wd_usarmy",
	"rhsusf_m1a2sep1tuskiwd_usarmy"
];

_ruLightArray = [
	"rhs_tigr_vv",
	"rhs_tigr_3camo_vv",
	"rhs_uaz_vv",
	"rhs_uaz_open_vv",
	"rhs_btr60_vv",
	"rhs_btr70_vv",
	"rhs_btr80_vv",
	"rhs_btr80a_vv"
];

_ruHeavyArray = [
	"rhs_bmp1_tv",
	"rhs_bmp1p_tv",
	"rhs_bmp2_tv",
	"rhs_bmp2e_tv",
	"rhs_bmp2k_tv",
	"rhs_prp3_vv",
	"rhs_bmp3m_msv",
	"rhs_t72bc_tv",
	"rhs_t80",
	"rhs_t80a",
	"rhs_t80b",
	"rhs_t80bvk",
	"rhs_t80um"
];

_ammoBoxArray = [
	"rhsusf_weapons_crate",
	"rhs_weapons_crate_ak",
	"ACE_Box_Misc",
	"ACE_medicalSupplyCrate_advanced"
];

var_be_allArray = (_wallMilArray + _wallCivArray + _bunkersArray + _killhouseArray + _targetsArray + _rangeMiscArray + _usLightDArray + _usLightWArray + _usHeavyDArray + _usHeavyWArray + _ruLightArray + _ruHeavyArray + var_be_customObjectArray);
var_be_buildCategories = [
	"--Fortifications--",(_wallMilArray + _wallCivArray + _bunkersArray)," -Walls",(_wallMilArray + _wallCivArray),"  -Military Walls",_wallMilArray,"  -Civilian Walls",_wallCivArray," -Bunkers",_bunkersArray,
	"--Shooting Range--",(_killhouseArray + _targetsArray + _rangeMiscArray)," -Shoothouse",_killhouseArray," -Targets",_targetsArray," -Misc",_rangeMiscArray,
	"--Vehicles--",(_usLightDArray + _usLightWArray + _usHeavyDArray + _usHeavyWArray + _ruLightArray + _ruHeavyArray),
	" -US Light",(_usLightDArray + _usLightWArray), "  -Desert",_usLightDArray,"  -Woodland",_usLightWArray,
	" -US Heavy",(_usHeavyDArray + _usHeavyWArray), "  -Desert",_usHeavyDArray,"  -Woodland",_usHeavyWArray,
	" -RU Light",_ruLightArray,
	" -RU Heavy",_ruHeavyArray,
	"--Ammoboxes--",_ammoBoxArray,
	"--Custom--",var_be_customObjectArray
];

fnc_be_addCustomObject = {
	waitUntil {time > 2};
	
	{
		var_be_customObjectArray pushBack _x;
	} forEach _this;
};

_mouseMoving = (findDisplay 46) displayAddEventHandler ["MouseMoving", "if (!dialog && var_be_inEditor) then {_this call e_fnc_mouseMoving}; false"];
_mouseClick = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", "if (var_be_inEditor) then {_this call e_fnc_mouseClick}; false"];
_mouseScroll = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "if (!dialog && var_be_inEditor) then {(_this select 1) call e_fnc_mouseScroll}; false"];
_holdKey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if (!dialog && var_be_inEditor) then {(_this select 1) call e_fnc_holdKey}; false"];
_releaseKey = (findDisplay 46) displayAddEventHandler ["KeyUp", "if (!dialog && var_be_inEditor) then {0 call e_fnc_holdKey}; false"];

var_be_inEditor = false;
var_be_showTips = true;
player addAction ["<t color='#9EDD00'>Build Editor</t>","local\nf_buildMenu\nf_be_openEditor.sqf",0,-800,false,true,"","!isMultiplayer"];

addMissionEventHandler ["Draw3D", {
	if (!dialog && var_be_inEditor) then {
		if !(isNil "var_be_nearObj") then {
			_bound = boundingBoxReal var_be_nearObj;
			_min = _bound select 0;
			_max = _bound select 1;
			
			_pos = [getPosATL var_be_nearObj select 0, getPosATL var_be_nearObj select 1, ((abs ((_max select 2) - (_min select 2))) / 2) + (getPosATL var_be_nearObj select 2)];
			drawLine3D [getPosATL e_center, _pos, [1,1,1,1]];
		};
	};
}];

e_fnc_openInterface = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_openInterface.sqf";
e_fnc_holdKey = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_holdKey.sqf";
e_fnc_mouseClick = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_mouseClick.sqf";
e_fnc_mouseScroll = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_mouseScroll.sqf";
e_fnc_mouseMoving = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_mouseMoving.sqf";
e_fnc_objFunctions = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_objFunctions.sqf";
e_fnc_setObj = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_setObj.sqf";
e_fnc_getHistory = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_getHistory.sqf";
e_fnc_editorTips = compile preprocessFileLineNumbers "local\nf_buildMenu\e_fnc_editorTips.sqf";