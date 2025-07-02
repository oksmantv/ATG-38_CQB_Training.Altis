/*

	[HTerminal_1,[HCourse_1,HCourse_2,HCourse_3]] spawn DZ_BarrierAction;
	[HTerminal_2,[HCourse_4,HCourse_5,HCourse_6]] spawn DZ_BarrierAction;
*/

Params [
	"_Object",
	"_Barriers",
	"_SecondBarriers"
];

_Object setVariable ["ObjectIndex",1,true];
_Object addAction [
	"<t color='#55df36'>Cycle Layout</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_arguments params ["_Array1","_Array2"];
		if(isNil "_Array1") exitWith {
			"[DZ_Barrier] DZ_BarrierAction: _Array1 is nil." spawn OKS_fnc_LogDebug;
		};
		if(isNil "_Array2") exitWith {
			"[DZ_Barrier] DZ_BarrierAction: _Array2 is nil." spawn OKS_fnc_LogDebug;
		};

		private _Hidden = _target getVariable ["ObjectIndex",1];
		("[DZ_Barrier] DZ_BarrierAction: Current ObjectIndex value: " + str _Hidden) spawn OKS_fnc_LogDebug;

		switch (_Hidden) do {
			case 1: {
				// Activate Two
				_target setVariable ["ObjectIndex",2,true];
				{
					[_X,true] remoteExec ["hideObjectGlobal",0];	
				} foreach _Array1;
				{
					[_X,false] remoteExec ["hideObjectGlobal",0];	
				} foreach _Array2;		
				"[DZ_Barrier] DZ_BarrierAction: Activated Two" spawn OKS_fnc_LogDebug;			
			};
			case 2: {
				// Activate Three
				_target setVariable ["ObjectIndex",3,true];	
				{
					[_X,true] remoteExec ["hideObjectGlobal",0];							
				} foreach _Array1;
				{
					[_X,true] remoteExec ["hideObjectGlobal",0];							
				} foreach _Array2;		
				"[DZ_Barrier] DZ_BarrierAction: Activated Three" spawn OKS_fnc_LogDebug;			
			};
			case 3: {
				// Activate One
				_target setVariable ["ObjectIndex",1,true];	
				{
					[_X,false] remoteExec ["hideObjectGlobal",0];						
				} foreach _Array1;	
				{
					[_X,false] remoteExec ["hideObjectGlobal",0];							
				} foreach _Array2;			
				"[DZ_Barrier] DZ_BarrierAction: Activated One" spawn OKS_fnc_LogDebug;					
			};
			default { 
				"[DZ_Barrier] DZ_BarrierAction: Invalid ObjectIndex value: " + str _Hidden spawn OKS_fnc_LogDebug;;
			};
		};
	},
	[_Barriers,_SecondBarriers],		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	15,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];
