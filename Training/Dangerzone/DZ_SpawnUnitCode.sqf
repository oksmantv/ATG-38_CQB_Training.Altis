	Params ["_SpawnObject","_Crossing","_IsPopUp"];

	if(!(_SpawnObject getVariable ["TargetDown",false])) then {
		_SpawnObject setVariable ["TargetDown",true,true];
		if(_IsPopUp) exitWith {
			format["%1 popped.",_SpawnObject] remoteExec ["DZ_Debug",0];
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
		sleep 4;
		_Unit setPos (getPosATL _SpawnObject);
		_Unit setDir (_Unit getDir _Crossing);
		_Unit doWatch (_Crossing);
		sleep 0.2;
		_Unit setUnitPos "UP";		
		sleep 0.1;
		{
			_Unit reveal [_X,4]
		} foreach (AllPlayers select {_X distance _Unit < 100});
		format["%1 static spawned.",_SpawnObject] remoteExec ["DZ_Debug",0];
	}