Params [
	"_Terminal",
	"_ZoneTrigger",
	["_CourseNumber",1,[1]],
	["_CrossingNumber",1,[1]],
	["_Direction","front",[""]],
	["_Reversed",false,[false]]
];

if(isNil "_Terminal") exitWith { "_Terminal undefined. Exiting." remoteExec ["DZ_Debug",0]};
if(isNil "_ZoneTrigger") exitWith { "_ZoneTrigger undefined. Exiting." remoteExec ["DZ_Debug",0]};

private ["_SelectedCrossingArray","_SelectedTargetsArray","_SelectedCrossing","_IsMovingTarget"];
_SelectedDifficulty = _Terminal getVariable ["DZ_CourseActive",0];
_isMovingTarget = false;
nopop = true;
publicVariable "nopop";

_ReturnArray = [_CrossingNumber,_Direction,_Reversed,_SelectedDifficulty,_Terminal] call DZ_GetCrossingArray;
_ReturnArray params ["_SelectedTargetsArray","_SelectedCrossing","_IsMovingTarget"];
format["_SelectedDifficulty reached - %1",_SelectedDifficulty] remoteExec ["DZ_Debug",0];
// If DZ Course is Active then.
if(_SelectedDifficulty > 0) then {
	format["_SelectedDifficulty - %1",_SelectedDifficulty] remoteExec ["DZ_Debug",0];
	switch (_SelectedDifficulty) do {
		case 1: {
			// Dry-Run
			"Dry-Run Selected" remoteExec ["DZ_Debug",0];

			for "_i" from 0 to 0 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				format["SelectedDifficulty: %1 - SelectedTarget: %2 - SelectedCrossing: %3 - DZ_SpawnUnitCode",_SelectedDifficulty,_SelectedTarget,_SelectedCrossing] remoteExec ["DZ_Debug",0];
				[_SelectedTarget,_SelectedCrossing,true] remoteExec ["DZ_SpawnUnitCode",2];
			};
		};
		case 2: {
			// Live - 1 Target
			"Live 1 Selected" remoteExec ["DZ_Debug",0];
			for "_i" from 0 to 0 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				if(_isMovingTarget) then {
					[_SelectedTarget,_SelectedCrossing,false] remoteExec ["DZ_SpawnMovingUnitCode",2];
				} else {
					[_SelectedTarget,_SelectedCrossing,false] remoteExec ["DZ_SpawnUnitCode",2];
				};
				
				format["SelectedDifficulty: %1 - SelectedTarget: %2 - SelectedCrossing: %3 - DZ_SpawnUnitCode",_SelectedDifficulty,_SelectedTarget,_SelectedCrossing] remoteExec ["DZ_Debug",0];
				sleep 5;
			};
		};
		case 3: {
			// Live - 2 Targets
			"Live 2 Selected" remoteExec ["DZ_Debug",0];
			for "_i" from 0 to 1 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				if(_isMovingTarget) then {
					[_SelectedTarget,_SelectedCrossing,false] remoteExec ["DZ_SpawnMovingUnitCode",2];
				} else {
					[_SelectedTarget,_SelectedCrossing,false] remoteExec ["DZ_SpawnUnitCode",2];
				};
				format["SelectedDifficulty: %1 - SelectedTarget: %2 - SelectedCrossing: %3 - DZ_SpawnUnitCode",_SelectedDifficulty,_SelectedTarget,_SelectedCrossing] remoteExec ["DZ_Debug",0];
				sleep 5;
			};
		};

		default { 
			// Inactive - Nothing
			format["Undefined Case - %1 - No Spawns",_SelectedDifficulty] remoteExec ["DZ_Debug",0];
		};
	};
} else {
	waitUntil {sleep 0.1; _Terminal getVariable ["DZ_CourseActive",0] > 0};

	_AllTargets = _Terminal getVariable ["AllTargets",[]];
	format["Reset of Targets - %1: %2",_Terminal,_AllTargets] remoteExec ["DZ_Debug",0];
	_AllTargets Params ["_Targets_1","_Targets_2","_Targets_3"];

	for "_i" from 0 to (count _Targets_1 - 1) do {
		[(_Targets_1 select _i),_i,_Reversed,_Terminal] remoteExec ["DZ_ForeachSide",0];
	};
	for "_i" from 0 to (count _Targets_2 - 1) do {
		[(_Targets_2 select _i),_i,_Reversed,_Terminal] remoteExec ["DZ_ForeachSide",0];
	};
	for "_i" from 0 to (count _Targets_3 - 1) do {
		[(_Targets_3 select _i),_i,_Reversed,_Terminal] remoteExec ["DZ_ForeachSide",0];
	};

	{
		if(!isPlayer _X) then {
			deleteVehicle _X;
		};
	} foreach list _ZoneTrigger;
};