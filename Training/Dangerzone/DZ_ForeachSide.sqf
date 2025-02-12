// [_Targets_1,false] spawn DZ_ForeachSide;

// Left
// Right
// Front

Params [
	"_DirectionArray",
	"_Index",
	"_Reversed",
	"_Terminal"
];

if(isNil "_DirectionArray") exitWith { systemChat "_DirectionArray undefined. Exiting." };
if(isNil "_Index") exitWith { systemChat "_Index undefined. Exiting." };
if(isNil "_Reversed") exitWith { systemChat "_Reversed undefined. Exiting." };
if(isNil "_Terminal") exitWith { systemChat "_Terminal undefined. Exiting." };

if(_Terminal getVariable ["DZ_CourseActive",0] > 1) exitWith {
	{
		[_X, true] spawn DZ_ForeachUnits;	
	} forEach _DirectionArray;
	SystemChat "IsLiveExit"
};

if(_Index in [0,1]) then {
	[_DirectionArray select 0, false] spawn DZ_ForeachUnits;	
};

if(_Index == 2) then {
	If(_Reversed) then {
		[_DirectionArray select 0, false] spawn DZ_ForeachUnits;	
		[_DirectionArray select 1, true] spawn DZ_ForeachUnits;	
	} else {
		[_DirectionArray select 0, true] spawn DZ_ForeachUnits;	
		[_DirectionArray select 1, false] spawn DZ_ForeachUnits;			
	}
};

// for "_i" from 0 to (count _DirectionArray - 1) do {
// 	if(count _DirectionArray > 1) then {
// 		if(_Reversed) then {
// 			[(_DirectionArray select 0),true] spawn DZ_ForeachUnits;	
// 			[(_DirectionArray select 1),false] spawn DZ_ForeachUnits;	
// 		} else {
// 			[(_DirectionArray select 0),false] spawn DZ_ForeachUnits;	
// 			[(_DirectionArray select 1),true] spawn DZ_ForeachUnits;				
// 		};
// 		//systemChat str [_i,(_DirectionArray select _i)];
// 		//[_X] spawn DZ_ForeachUnits;
// 	} else {
// 		[_DirectionArray select 0,false] spawn DZ_ForeachUnits;	
// 	};
// };

// //copyToClipboard str _SideArray;
