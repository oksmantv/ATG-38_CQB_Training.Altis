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
	format["%1 - Crossing %2 - moving unit spawned.",_SpawnObject,_Crossing] remoteExec ["DZ_Debug",0];