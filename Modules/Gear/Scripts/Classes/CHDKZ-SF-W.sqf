_useMineDetector = false;
_allowedNightStuff = true;
// Not required since it uses M320 secondary for Grenadiers
// _glHE = "rhs_VOG25P";
// _glHEDP = "rhs_VOG25P";
// _glsmokeW = "rhs_GRD40_White";
// _glsmokeB = "";
// _glsmokeG = "rhs_GRD40_Green";
// _glsmokeO = "";
// _glsmokeP = "";
// _glsmokeR = "rhs_GRD40_Red";
// _glsmokeY = "";

// _glflareG = "rhs_VG40OP_green";
// _glflareR = "rhs_VG40OP_red";
// _glflareW = "rhs_VG40OP_white";

_insignia = "";
_goggles = ["rhs_balaclava","rhs_balaclava1_olive"];
_helmet = ["H_HelmetB_light_black"];
_OfficerHelmet = "UK3CB_H_Beret_Officer_Red_Star";
_uniform = "UK3CB_CHD_B_U_CombatUniform_05";
_vest = "rhs_vydra_3m";
_backpack = "UK3CB_LDF_B_B_ASS_OLI";
_backpackRadio = _backpack;
if (true) then {
	_backpackRadio = "UK3CB_B_O_Alice_Radio_Backpack";
};

if (_role isEqualTo "uav") then {
	_backpack = "O_UAV_01_backpack_F";
	_gps = "O_UAVTerminal";
};

if(_role isEqualTo "p") then {
	_helmet = "UK3CB_ARD_B_H_zsh7a_mike";
	_uniform = "UK3CB_CHD_B_U_H_Pilot_Uniform_01";
	_backpackRadio = _backpack;
};
if (_role isEqualTo "jetp") then {
	_goggles = "G_Aviator";
	_helmet = "rhs_zsh7a_alt";
	_uniform = "UK3CB_CHD_B_U_H_Pilot_Uniform_01";
	_vest = "V_Rangemaster_belt";
	_backpack = "B_Parachute";
};

// Attachments
_silencer = "";
_pointer = "";
_sight = "";
_bipod = "";

_rifle = ["rhs_weap_asval_grip", _silencer, _pointer, _sight, _bipod];
_rifleC = ["rhs_weap_asval_grip", _silencer, _pointer, _sight, _bipod];
_rifleGL = ["rhs_weap_asval_grip", _silencer, _pointer, _sight, _bipod];
_rifleL = ["rhs_weap_vss_grip", _silencer, _pointer, "rhs_acc_pso1m21", "rhs_acc_grip_ffg2"];

_rifle_mag = "rhs_20rnd_9x39mm_SP6";
_rifle_mag_tr = "rhs_20rnd_9x39mm_SP6";
_rifleC_mag = "rhs_20rnd_9x39mm_SP6";
_rifleC_mag_tr = "rhs_20rnd_9x39mm_SP6";
_rifleGL_mag = "rhs_20rnd_9x39mm_SP6";
_rifleGL_mag_tr = "rhs_20rnd_9x39mm_SP6";
_rifleL_mag = "ACE_10Rnd_762x54_Tracer_mag";

_LMG = ["rhs_weap_rpk74m", "rhs_acc_tgpa", _pointer, _sight, _bipod];
_LMG_mag = "rhs_45Rnd_545X39_7N22_AK";

_MMG = ["rhs_weap_pkp", _silencer, _pointer, _sight, _bipod];
_MMG_mag = "150Rnd_762x54_Box_Tracer";

_LAT = ["rhs_weap_rpg26", _silencer, _pointer, _sight, _bipod];
_LAT_mag = "rhs_rpg26_mag";
_LAT_ReUsable = false;

_MAT = ["rhs_weap_rpg7", _silencer, _pointer, _sight, _bipod];
_MAT_mag = "rhs_rpg7_PG7VS_mag";

_HAT = ["launch_O_Vorona_green_F", _silencer, _pointer, _sight, _bipod];
_HAT_mag = "Vorona_HEAT";

_AA = ["rhs_weap_igla", _silencer, _pointer, _sight, _bipod];
_AA_mag = "rhs_mag_9k38_rocket";

if(_role in ["sl","fac","tl","g"]) then {
	_pistol = ["rhs_weap_M320", _silencer, _pointer, _sight, _bipod];
	_pistol_mag = "";
} else {
	_pistol = ["rhs_weap_pb_6p9", "rhs_acc_6p9_suppressor", _pointer, _sight, _bipod];
	_pistol_mag = "rhs_mag_9x18_8_57N181S";
};

_pdw = ["rhs_weap_pp2000", _silencer, _pointer, _sight, _bipod];
_pdw_mag = "rhs_mag_9x19mm_7n31_44";

_silencer = "";
_pointer = "";
_sight = "rhs_acc_pso1m21";
_bipod = "";

_rifleMarksman = ["rhs_weap_svdp", _silencer, _pointer, _sight, _bipod];
_rifleMarksman_mag = "UK3CB_SVD_10rnd_762x54_GT";
_rifleMarksman_mag_tr = "UK3CB_SVD_10rnd_762x54_GT";