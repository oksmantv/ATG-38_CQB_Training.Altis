	Params ["_TargetArray",["_Percentage",100,[0]]];

	private _Percentage = _Percentage / 100;
	private _AmountOfTargets = round(count _TargetArray * _Percentage);
	private _SelectedTargets = [];

	while {count _SelectedTargets < _AmountOfTargets} do {
		_SelectedTargets pushBackUnique (selectRandom _TargetArray);
	};


	private _UnitTypes = [
		"O_Soldier_AR_F", "O_soldier_M_F", "O_Soldier_F", 
		"O_medic_F", "O_HeavyGunner_F", "O_Sharpshooter_F",
		"O_Soldier_F", "O_Soldier_F", "O_Soldier_F"
	];

	{
		_Pos = [getPosATL _X select 0,getPosATL _X select 1,(getPosATL _X select 2 + 0.5)];		
		_Dir = ((getDir _X) - 180);
		_Group = createGroup east;
		_Group setVariable ["hc_blacklist",true];
		_Group setVariable ["lambs_danger_disableAI", true];
		_Unit = _Group createUnit [selectRandom _UnitTypes, [0,0,0], [], 0, "CAN_COLLIDE"];
		_Unit setPosATL _Pos;
		_Unit setDir _Dir;
		_Unit disableAI "PATH";
		_Unit setUnitPos "UP";
		_X hideObjectGlobal true
	} foreach _SelectedTargets;