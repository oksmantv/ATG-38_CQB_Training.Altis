Params ["_CrossingNumber","_Direction","_Reversed","_SelectedDifficulty","_Terminal"];
private ["_SelectedCrossingArray","_SelectedCrossing","_IsMovingTarget"];
_isMovingTarget = false;

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

// Crossing 4
_TargetsLeft_4 = [
	[dz_left_4_1, dz_left_4_2, dz_left_4_3, dz_left_4_4, 
	dz_left_4_5, dz_left_4_6, dz_left_4_7, dz_left_4_8]
];
_TargetsRight_4 = [
	[dz_right_4_1, dz_right_4_2, dz_right_4_3, dz_right_4_4, 
	dz_right_4_5, dz_right_4_6, dz_right_4_7, dz_right_4_8]
];
_TargetsFront_4 = [
	[dz_front_4_1, dz_front_4_2],
	[dz_reverse_4_1,dz_reverse_4_2]
];
_TargetsMoving_4 = [
	[
		dz_leftMoving_4_1, 
		dz_leftMoving_4_2, 
		dz_leftMoving_4_3
	],
	[
		dz_rightMoving_4_1,
		dz_rightMoving_4_2,
		dz_rightMoving_4_3
	]
];
_Targets_4 = [_TargetsLeft_4,_TargetsRight_4,_TargetsFront_4,_TargetsMoving_4];

_TargetsLeft_5 = [
	[dz_left_5_1, dz_left_5_2, dz_left_5_3, dz_left_5_4, 
	dz_left_5_5, dz_left_5_6, dz_left_5_7, dz_left_5_8]
];
_TargetsRight_5 = [
	[dz_right_5_1, dz_right_5_2, dz_right_5_3, dz_right_5_4, 
	dz_right_5_5, dz_right_5_6, dz_right_5_7, dz_right_5_8]
];
_TargetsFront_5 = [
	[dz_front_5_1, dz_front_5_2],
	[dz_reverse_5_1,dz_reverse_5_2]
];
_TargetsMoving_5 = [
	[
		dz_leftMoving_5_1, 
		dz_leftMoving_5_2, 
		dz_leftMoving_5_3
	],
	[
		dz_rightMoving_5_1,
		dz_rightMoving_5_2,
		dz_rightMoving_5_3
	]
];
_Targets_5 = [_TargetsLeft_5,_TargetsRight_5,_TargetsFront_5,_TargetsMoving_5];

_TargetsLeft_6 = [
	[dz_left_6_1, dz_left_6_2, dz_left_6_3, dz_left_6_4, 
	dz_left_6_5, dz_left_6_6, dz_left_6_7, dz_left_6_8]
];
_TargetsRight_6 = [
	[dz_right_6_1, dz_right_6_2, dz_right_6_3, dz_right_6_4, 
	dz_right_6_5, dz_right_6_6, dz_right_6_7, dz_right_6_8]
];
_TargetsFront_6 = [
	[dz_front_6_1, dz_front_6_2],
	[dz_reverse_6_1,dz_reverse_6_2]
];
_TargetsMoving_6 = [
	[
		dz_leftMoving_6_1, 
		dz_leftMoving_6_2, 
		dz_leftMoving_6_3
	],
	[
		dz_rightMoving_6_1,
		dz_rightMoving_6_2,
		dz_rightMoving_6_3
	]
];
_Targets_6 = [_TargetsLeft_6,_TargetsRight_6,_TargetsFront_6,_TargetsMoving_6];

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
	case 4: {
		_SelectedCrossingArray = _Targets_4;
		_SelectedCrossing = Crossing_4;
	};
	case 5: {
		_SelectedCrossingArray = _Targets_5;
		_SelectedCrossing = Crossing_5;
	};
	case 6: {
		_SelectedCrossingArray = _Targets_6;
		_SelectedCrossing = Crossing_6;
	};				
	default { };
};

if(isNil "_SelectedCrossingArray") exitWith { "_SelectedCrossingArray is undefined. Exiting." remoteExec ["DZ_Debug",0]; };

/// Select Direction
switch (toLower _Direction) do {
	case "left": { 
		_random = random 1;
		if(_random < 0.5 && _SelectedDifficulty > 1) then {
			_SelectedLeftTargetsArray = _SelectedCrossingArray select 3;
			_SelectedTargetsArray = _SelectedLeftTargetsArray select 0;
			_isMovingTarget = true;
			//systemChat "IsMovingTarget";			
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
			//systemChat "IsMovingTarget";
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
if(_Terminal in [DZ_Terminal_1,DZ_Terminal_Reverse_1]) then {
	format["%1 and %2 given AllTargets.",DZ_Terminal_1,DZ_Terminal_Reverse_1] remoteExec ["DZ_Debug",0];;
	_Terminal setVariable ["AllTargets",[_Targets_1,_Targets_2,_Targets_3],true];
};
if(_Terminal in [DZ_Terminal_2,DZ_Terminal_Reverse_2]) then {
	format["%1 and %2 given AllTargets.",DZ_Terminal_2,DZ_Terminal_Reverse_2] remoteExec ["DZ_Debug",0];;
	_Terminal setVariable ["AllTargets",[_Targets_4,_Targets_5,_Targets_6],true];
};

format["Crossing %2: %1 - IsMovingTarget: %3",_SelectedTargetsArray,_SelectedCrossing,_isMovingTarget] remoteExec ["DZ_Debug",0];;
[_SelectedTargetsArray,_SelectedCrossing,_isMovingTarget];
