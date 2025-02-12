execVM "Training\Dangerzone\init.sqf";

// Global Commands
DZ_Actions = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Actions.sqf";
DZ_Trigger = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Trigger.sqf";
DZ_Trigger_Spawn = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Trigger_Spawn.sqf";
DZ_ForeachSide = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachSide.sqf";
DZ_ForeachCrossing = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachCrossing.sqf";
DZ_ForeachUnits = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachUnits.sqf";