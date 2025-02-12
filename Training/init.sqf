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
};