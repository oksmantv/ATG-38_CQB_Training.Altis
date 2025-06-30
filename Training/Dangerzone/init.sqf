//execVM "Training\Dangerzone\init.sqf";



// Global Commands
DZ_Debug_Variable = false;
DZ_Debug = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Debug.sqf";
DZ_SpawnMovingUnitCode = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_SpawnMovingUnitCode.sqf";
DZ_SpawnUnitCode = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_SpawnUnitCode.sqf";
DZ_Actions = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Actions.sqf";
DZ_BarrierAction = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_BarrierAction.sqf";
DZ_Trigger = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Trigger.sqf";
DZ_Trigger_Spawn = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_Trigger_Spawn.sqf";
DZ_ForeachSide = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachSide.sqf";
DZ_GetCrossingArray = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_GetCrossingArray.sqf";
DZ_ForeachCrossing = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachCrossing.sqf";
DZ_ForeachUnits = compile preprocessFileLineNumbers "Training\Dangerzone\DZ_ForeachUnits.sqf";

[DZ_Terminal_2,2,DZ_Trigger_2] spawn DZ_Actions;
[DZ_Terminal_Reverse_2,2,DZ_Trigger_2] spawn DZ_Actions;

[DZ_Terminal_1,1,DZ_Trigger_1] spawn DZ_Actions;
[DZ_Terminal_Reverse_1,1,DZ_Trigger_1] spawn DZ_Actions;

[HTerminal_1,[HCourse_1,HCourse_2,HCourse_3],[HCourse2_1,HCourse2_2,HCourse2_3]] spawn DZ_BarrierAction;
[HTerminal_2,[HCourse_4,HCourse_5,HCourse_6],[HCourse3_1,HCourse3_2,HCourse3_3]] spawn DZ_BarrierAction;

dzterminalmain addAction ["<t color='#11d037'>Show Dangerzone Area</t>",{ dzshow=true; publicVariable "dzshow"; }];
dzterminalmain addAction ["<t color='#d01111'>Hide Dangerzone Area</t>",{ dzshow=false; publicVariable "dzshow"; }];