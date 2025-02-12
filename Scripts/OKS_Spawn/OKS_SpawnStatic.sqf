	// OKS_Garrison
	// [[positions],independent] spawn OKS_SpawnStatic;
	if(!isServer) exitWith {};

	Params ["_Positions","_Side"];
	_Settings = [_Side] Call OKS_Dynamic_Setting;
	_Settings Params ["_Units"];

	systemChat str _Units;
	_Units Params ["_Leaders","_Units","_Officer"];
	Private ["_GarrisonPositions","_GarrisonMaxSize","_GarrisonMaxSize","_Unit","_Group"];

		_Group = CreateGroup _Side;
		_Group setVariable ["lambs_danger_disableGroupAI", true];
		{
			if ( (count (units _Group)) == 0 ) then
			{
				_Unit = _Group CreateUnit [(_Leaders call BIS_FNC_selectRandom), _X, [], 0, "NONE"];
				_Unit setRank "SERGEANT";
			} else {
				_Unit = _Group CreateUnit [(_Units call BIS_FNC_selectRandom), _X, [], 0, "NONE"];
				_Unit setRank "PRIVATE";
			};
			_Unit setRank "PRIVATE";
			[_Unit,"PATH"] remoteExec ["disableAI",0];
			[_Unit,(selectRandom ["UP","MIDDLE"])] remoteExec ["setUnitPos",0];;		
			[_Unit,4] spawn OKS_StealAmmo;				
		} foreach _Positions;