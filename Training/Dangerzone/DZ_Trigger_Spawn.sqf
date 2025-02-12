Params [
	"_Terminal",
	"_ZoneTrigger",
	["_CourseNumber",1,[1]],
	["_CrossingNumber",1,[1]],
	["_Direction","front",[""]],
	["_Reversed",false,[false]]
];

if(isNil "_Terminal") exitWith { "_Terminal undefined. Exiting."};
if(isNil "_ZoneTrigger") exitWith { "_ZoneTrigger undefined. Exiting."};

// [this,1,1,"front"] execVM "DZ_Trigger_Spawn.sqf"
// [this,1,1,"left"] spawn DZ_Trigger_Spawn;
private ["_SelectedCrossingArray","_SelectedTargetsArray","_SelectedCrossing","_IsMovingTarget"];
_SelectedDifficulty = _Terminal getVariable ["DZ_CourseActive",0];
_isMovingTarget = false;
nopop = true;
publicVariable "nopop";

// Crossing 1
_TargetsLeft_1 = [
	[dz_left_1_1, dz_left_1_2, dz_left_1_3, dz_left_1_4, 
	dz_left_1_5, dz_left_1_6, dz_left_1_7, dz_left_1_8]
];
_TargetsRight_1 = [
	[dz_right_1_1, dz_right_1_2, dz_right_1_3, dz_right_1_4, 
	dz_right_1_5, dz_right_1_6, dz_right_1_7, dz_right_1_8]
];
_TargetsFront_1 = [
	[dz_front_1_1, dz_front_1_2],
	[dz_reverse_1_1,dz_reverse_1_2]
];
_TargetsMoving_1 = [
	[
		dz_leftMoving_1_1, 
		dz_leftMoving_1_2, 
		dz_leftMoving_1_3
	],
	[
		dz_rightMoving_1_1,
		dz_rightMoving_1_2,
		dz_rightMoving_1_3
	]
];
_Targets_1 = [_TargetsLeft_1,_TargetsRight_1,_TargetsFront_1,_TargetsMoving_1];

// Crossing 2
_TargetsLeft_2 = [
	[dz_left_2_1, dz_left_2_2, dz_left_2_3, dz_left_2_4, 
	dz_left_2_5, dz_left_2_6, dz_left_2_7, dz_left_2_8]
];
_TargetsRight_2 = [
	[dz_right_2_1, dz_right_2_2, dz_right_2_3, dz_right_2_4, 
	dz_right_2_5, dz_right_2_6, dz_right_2_7, dz_right_2_8]
];
_TargetsFront_2 = [
	[dz_front_2_1, dz_front_2_2],
	[dz_reverse_2_1,dz_reverse_2_2]
];
_TargetsMoving_2 = [
	[
		dz_leftMoving_2_1, 
		dz_leftMoving_2_2, 
		dz_leftMoving_2_3
	],
	[
		dz_rightMoving_2_1,
		dz_rightMoving_2_2,
		dz_rightMoving_2_3
	]
];
_Targets_2 = [_TargetsLeft_2,_TargetsRight_2,_TargetsFront_2,_TargetsMoving_2];

// Crossing 3
_TargetsLeft_3 = [
	[dz_left_3_1, dz_left_3_2, dz_left_3_3, dz_left_3_4, 
	dz_left_3_5, dz_left_3_6, dz_left_3_7, dz_left_3_8]
];
_TargetsRight_3 = [
	[dz_right_3_1, dz_right_3_2, dz_right_3_3, dz_right_3_4, 
	dz_right_3_5, dz_right_3_6, dz_right_3_7, dz_right_3_8]
];
_TargetsFront_3 = [
	[dz_front_3_1, dz_front_3_2],
	[dz_reverse_3_1,dz_reverse_3_2]
];
_TargetsMoving_3 = [
	[
		dz_leftMoving_3_1, 
		dz_leftMoving_3_2, 
		dz_leftMoving_3_3
	],
	[
		dz_rightMoving_3_1,
		dz_rightMoving_3_2,
		dz_rightMoving_3_3
	]
];
_Targets_3 = [_TargetsLeft_3,_TargetsRight_3,_TargetsFront_3,_TargetsMoving_3];

/// Select Crossing
switch (_CrossingNumber) do {
	case 1: {
		_SelectedCrossingArray = _Targets_1;
		_SelectedCrossing = Crossing_1;
	};
	case 2: {
		_SelectedCrossingArray = _Targets_2;
		_SelectedCrossing = Crossing_2;
	};
	case 3: {
		_SelectedCrossingArray = _Targets_3;
		_SelectedCrossing = Crossing_3;
	};		
	default { };
};
if(isNil "_SelectedCrossingArray") exitWith { systemChat "_SelectedCrossingArray is undefined. Exiting."};

/// Select Direction
switch (toLower _Direction) do {
	case "left": { 
		_random = random 1;
		if(_random < 0.5 && _SelectedDifficulty > 1) then {
			_SelectedLeftTargetsArray = _SelectedCrossingArray select 3;
			_SelectedTargetsArray = _SelectedLeftTargetsArray select 0;
			_isMovingTarget = true;
			systemChat "IsMovingTarget";			
		} else {
			_SelectedLeftTargetsArray = _SelectedCrossingArray select 0;
			_SelectedTargetsArray = _SelectedLeftTargetsArray select 0;
		};
	};

	case "right": {
		_random = random 1;
		if(_random < 0.5 && _SelectedDifficulty > 1) then {
			_SelectedLeftTargetsArray = _SelectedCrossingArray select 3;
			_SelectedTargetsArray = _SelectedLeftTargetsArray select 1;
			_isMovingTarget = true;
			systemChat "IsMovingTarget";
		} else {		
			_SelectedRightTargetsArray = _SelectedCrossingArray select 1;
			_SelectedTargetsArray = _SelectedRightTargetsArray select 0;
		}
	};
	case "front": { 
		_SelectedFrontTargetsArray = _SelectedCrossingArray select 2;
		_SelectedTargetsArray = _SelectedFrontTargetsArray select 0;

		if(_Reversed) then {
			//systemChat "Reversed. Selecting Reversed Array";
			_SelectedTargetsArray = _SelectedFrontTargetsArray select 1;
		}
	};
	default { };
};

// Spawn Code
_SpawnMovingUnitCode = {
	Params ["_SpawnObject","_Crossing","_IsPopUp"];

	_UnitTypes = [
		"O_Soldier_AR_F", "O_soldier_M_F", "O_Soldier_F", 
		"O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F",
		"O_Soldier_F", "O_Soldier_F", "O_Soldier_F"
	];

	_EnemyGroup = createGroup east;
	_Unit = _EnemyGroup createUnit [selectRandom _UnitTypes, [0,0,0], [], 0, "NONE"];
	_Unit setVariable ["acex_headless_blacklist",true,true];
	_Unit setVariable ["BIS_noCoreConversations", true,true];
	sleep 1 + ceil(random 3);
	_Unit setPos (getPosATL _SpawnObject);
	_Unit setDir (_Unit getDir _Crossing);
	_Unit setUnitPos "UP";		
	{
		_Unit reveal [_X,4]
	} foreach (AllPlayers select {_X distance _Unit < 100});
	waitUntil {sleep 1; !isNil "lambs_wp_fnc_moduleRush"};
	_WP = _EnemyGroup addWaypoint [_Crossing,0];
	_WP setWaypointType "SAD";
	[_EnemyGroup,200,5,[],[],false] remoteExec ["lambs_wp_fnc_taskRush",0];
	systemChat "MovingTarget Rush";
};
_SpawnUnitCode = {
	Params ["_SpawnObject","_Crossing","_IsPopUp"];

	if(!(_SpawnObject getVariable ["TargetDown",false])) then {
		_SpawnObject setVariable ["TargetDown",true,true];
		if(_IsPopUp) exitWith {
			_SpawnObject animateSource ["terc", 0];
		};

		_UnitTypes = [
			"O_Soldier_AR_F", "O_soldier_M_F", "O_Soldier_F", 
			"O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F",
			"O_Soldier_F", "O_Soldier_F", "O_Soldier_F"
		];

		_EnemyGroup = createGroup east;
		_Unit = _EnemyGroup createUnit [selectRandom _UnitTypes, [0,0,0], [], 0, "NONE"];
		_Unit setVariable ["acex_headless_blacklist",true,true];
		_Unit setVariable ["BIS_noCoreConversations", true,true];
		_Unit switchMove "AmovPpneMstpSrasWrflDnon";
		_Unit setUnitPos "DOWN";
		_Unit disableAI "PATH";
		sleep 1 + ceil(random 3);

		_Unit setPos (getPosATL _SpawnObject);
		_Unit setDir (_Unit getDir _Crossing);
		_Unit doWatch (_Crossing);
		sleep 0.2;
		_Unit setUnitPos "UP";		
		sleep 0.1;
		{
			_Unit reveal [_X,4]
		} foreach (AllPlayers select {_X distance _Unit < 100});
	}
};

// If DZ Course is Active then.

if(_SelectedDifficulty > 0) then {
	switch (_SelectedDifficulty) do {
		case 1: {
			// Dry-Run
			for "_i" from 0 to 0 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				if(_isMovingTarget) then {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnMovingUnitCode;
				} else {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnUnitCode;
				};
			};
		};
		case 2: {
			// Live - 1 Target
			for "_i" from 0 to 0 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				if(_isMovingTarget) then {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnMovingUnitCode;
				} else {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnUnitCode;
				};
				sleep 5;
			};
		};
		case 3: {
			// Live - 2 Targets
			for "_i" from 0 to 1 do {
				_CopiedTargetArray = [];
				{
					_CopiedTargetArray pushBackUnique _X;
				} foreach _SelectedTargetsArray;

				_SelectedTarget = selectRandom _CopiedTargetArray;
				_CopiedTargetArray deleteAt (_CopiedTargetArray find _SelectedTarget);

				if(_isMovingTarget) then {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnMovingUnitCode;
				} else {
					[_SelectedTarget,_SelectedCrossing,false] spawn _SpawnUnitCode;
				};
				sleep 5;
			};
		};

		default { 
			// Inactive - Nothing
		};
	};
} else {
	waitUntil {sleep 0.1; _Terminal getVariable ["DZ_CourseActive",0] > 0};
	for "_i" from 0 to (count _Targets_1 - 1) do {
		[(_Targets_1 select _i),_i,_Reversed,_Terminal] spawn DZ_ForeachSide;
	};
	for "_i" from 0 to (count _Targets_2 - 1) do {
		[(_Targets_2 select _i),_i,_Reversed,_Terminal] spawn DZ_ForeachSide;
	};
	for "_i" from 0 to (count _Targets_3 - 1) do {
		[(_Targets_3 select _i),_i,_Reversed,_Terminal] spawn DZ_ForeachSide;
	};

	{
		if(!isPlayer _X) then {
			deleteVehicle _X;
		};
	} foreach list _ZoneTrigger;
};