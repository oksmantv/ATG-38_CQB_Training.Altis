// [_Targets_1,false,_Terminal] spawn DZ_ForeachUnits;

Params [
	"_UnitsArray",
	"_Hide"
];

if(isNil "_UnitsArray") exitWith { systemChat "_UnitsArray undefined. Exiting." };
if(isNil "_Hide") exitWith { systemChat "_Hide undefined. Exiting." };


{
	if(
		["front", str (vehicleVarName _X)] call BIS_fnc_inString || 
		["reverse", str (vehicleVarName _X)] call BIS_fnc_inString
	) then {
		systemChat str [_X,_Hide];
	};
	//systemChat "Hiding " + str _X;
	_X hideObjectGlobal _Hide;
	_X animateSource ["terc", 1]; sleep 0.05;
	_X setVariable ["TargetDown",false,true];		
	sleep 1;
} forEach _UnitsArray;


	// copyToClipboard str _UnitsArray;
	// // Select Side
	// {			
	// 	_Target = _X;	

	// 	if(_Target in [1,2]) then {

	// 	};
	// 	systemChat str _Target;
	// 	_Target animateSource ["terc", 1]; sleep 0.05;
	// 	_Target setVariable ["TargetDown",false,true];
	// 	if(_Terminal getVariable ["DZ_CourseActive",0] > 1) then {
	// 		_Target hideObjectGlobal true;
	// 	} else {
			
	// 		systemChat str _Sides;
	// 		_ReversedArray = _Sides select 2;
	// 		if(_Reversed && _Target == _Sides select 2) then {
	// 			systemChat format["Reversed - %1",_ReversedArray];
	// 		};
			
	// 		if(_Reversed) then {
	// 			if(_Target in _ReversedArray) then {
	// 				//systemChat format["In Array - Unhide %1",_Target];
	// 				_Target hideObjectGlobal false;
	// 			} else {
	// 				_Target hideObjectGlobal true;
	// 				//systemChat format["Not In Array - Hide %1",_Target];
	// 			};
	// 		} else {
	// 			_Target hideObjectGlobal false;
	// 		}		
	// 	}
	// } foreach _UnitsArray;
