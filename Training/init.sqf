// [] execVM "Training\init.sqf";

// Global Commands
execVM "Training\CompoundBreach\init.sqf";

// Marksman Course
OKS_Marksman_Debug = false;
publicVariable "OKS_Marksman_Debug";

AI_Death = compile preprocessFileLineNumbers "Training\AI_Death.sqf";
CQB_Garrison = compile preprocessFileLineNumbers "Training\CQB_Garrison.sqf";
OKS_PlaySound = compile preprocessFileLineNumbers "Training\OKS_PlaySound.sqf";
DryRunCode = compile preprocessFileLineNumbers "Training\DryRunCode.sqf";
LiveRunCode = compile preprocessFileLineNumbers "Training\LiveRunCode.sqf";
CQB_Garrison = compile preprocessFileLineNumbers "Training\CQB_Garrison.sqf";
VehicleRequest = compile preprocessFileLineNumbers "Training\VehicleRequest.sqf";
OKS_LiveTargets = compile preprocessFileLineNumbers "Training\OKS_LiveTargets.sqf";
OKS_CourseReset = compile preprocessFileLineNumbers "Training\OKS_CourseReset.sqf";

// Global disable for Pop-Up Targets.
boundPopup = [];
nopop = true;

// CQB Exercise
execVM "Training\DryRun_Action.sqf";
execVM "Training\CQB_Actions.sqf";
execVM "Medical\Init.sqf";	
execVM "Training\Dangerzone\init.sqf";

sleep 5;
if(isServer) then {
	[helo_1, getPos helospawn_1, getDir helospawn_1, ["helicopter"]] remoteExec ["VehicleRequest",0];
	[helo_2, getPos helospawn_2, getDir helospawn_2, ["helicopter"]] remoteExec ["VehicleRequest",0];
	[plane_1, getPos planespawn_1, getDir planespawn_1, ["plane"]] remoteExec ["VehicleRequest",0];
	[plane_2, getPos planespawn_2, getDir planespawn_2, ["plane"]] remoteExec ["VehicleRequest",0];
	[plane_3, getPos planespawn_3, getDir planespawn_3, ["plane"]] remoteExec ["VehicleRequest",0];

	[ 
		SCQB_Terminal, 
		[ 
			SCQB_1, SCQB_10, SCQB_11, SCQB_12, SCQB_13,  
			SCQB_14, SCQB_15, SCQB_16, SCQB_17, SCQB_18, SCQB_19,  
			SCQB_2, SCQB_20, SCQB_21, SCQB_22, SCQB_23, SCQB_24,  
			SCQB_25, SCQB_26, SCQB_27, SCQB_28, SCQB_29, SCQB_3,  
			SCQB_30, SCQB_31, SCQB_32, SCQB_33, SCQB_34, SCQB_35,  
			SCQB_36, SCQB_37, SCQB_38, SCQB_39, SCQB_4, SCQB_40,  
			SCQB_41, SCQB_42, SCQB_43, SCQB_44, SCQB_45, SCQB_46,  
			SCQB_47, SCQB_48, SCQB_49, SCQB_5, SCQB_50, SCQB_51,  
			SCQB_52, SCQB_53, SCQB_54, SCQB_55, SCQB_56, SCQB_57,  
			SCQB_58, SCQB_59, SCQB_6, SCQB_60, SCQB_61, SCQB_62,  
			SCQB_63, SCQB_64, SCQB_65, SCQB_7, SCQB_8, SCQB_9 
		], 
		SCQBTrigger, 
		[ 
			SCQBP_1, SCQBP_10, SCQBP_11, SCQBP_2, SCQBP_3, 
			SCQBP_4, SCQBP_5, SCQBP_6, SCQBP_7, SCQBP_8, SCQBP_9, 
			SCQBP_12, SCQBP_13, SCQBP_14 
		], 
		[ 
			SCQBR_1, SCQBR_2, SCQBR_3,  
			SCQBR_4, SCQBR_5, SCQBR_6 
		], 
		SCQBStartTrigger 
	] remoteExec ["BuddyCQBScript",0];

};