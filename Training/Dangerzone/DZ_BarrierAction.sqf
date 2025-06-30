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
		private _Hidden = _target getVariable ["ObjectIndex",1];
		switch (_Hidden) do {
			case 1: {
				// Activate Two
				_target setVariable ["ObjectIndex",2,true];
				{
					_X hideObjectGlobal true;		
				} foreach _Array1;
				{
					_X hideObjectGlobal false;		
				} foreach _Array2;					
			};
			case 2: {
				// Activate Three
				_target setVariable ["ObjectIndex",3,true];	
				{
					_X hideObjectGlobal true;								
				} foreach _Array1;
				{
					_X hideObjectGlobal true;								
				} foreach _Array2;					
			};
			case 3: {
				// Activate One
				_target setVariable ["ObjectIndex",1,true];	
				{
					_X hideObjectGlobal false;							
				} foreach _Array1;	
				{
					_X hideObjectGlobal false;								
				} foreach _Array2;								
			};
			default { };
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
