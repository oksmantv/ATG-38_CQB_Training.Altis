	Params ["_TargetArray","_Trigger"];

	{_X hideObject false} foreach _TargetArray;
	{_x animate ["Terc",0];} forEach _TargetArray;
	{_x addEventHandler ["HIT",
		{
			(_this select 0) animate ["Terc",1];
			(_this select 0) RemoveEventHandler ["HIT",0]
		}
	]} forEach _TargetArray;

	{ if(!isPlayer _X) then { deleteVehicle _X} } foreach list _Trigger;
	{ if(_X inArea _Trigger) then { deleteVehicle _X} } foreach allDeadMen;