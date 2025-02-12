Params ["_Object","_CourseNumber","_ZoneTrigger"];

// [this,1] execVM "DZ_Actions.sqf"
// [this,1] spawn DZ_Actions;

waitUntil{!isNil "DZ_Trigger_Spawn"};

_Object addAction
[
	"<t color='#32ec08'>Start Dry-Run</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_arguments params ["_CourseNumber","_ZoneTrigger"];

		// Reset Targets
		_target setVariable ["DZ_CourseActive",0];
		[_target,_ZoneTrigger,_CourseNumber,1,nil,false] spawn DZ_Trigger_Spawn;
		[_target,_caller] spawn {
			params ["_target","_caller"];
			playSound3D [getMissionPath "activated.wav", _target, false, getPosASL _target, 5, 1, 50];
			sleep 0.5;
			_target setVariable ["DZ_CourseActive",1];
			sleep 3;
			"DZ Course 1 - Ready - Dry Run" remoteExec ["systemChat",0];
			"OKS_Buzzer" remoteExec ["PlaySound",units (group _caller)];						
		};
	},
	[_CourseNumber,_ZoneTrigger],// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_Object addAction
[
	"<t color='#32ec08'>Start Live-Run (1)</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_arguments params ["_CourseNumber","_ZoneTrigger"];
		_target setVariable ["DZ_CourseActive",0];
		[_target,_ZoneTrigger,_CourseNumber,1,nil,false] spawn DZ_Trigger_Spawn;
		[_target,_caller] spawn {
			params ["_target","_caller"];
			playSound3D [getMissionPath "activated.wav", _target, false, getPosASL _target, 5, 1, 50];
			sleep 0.5;
			_target setVariable ["DZ_CourseActive",2];
			sleep 3;
			"DZ Course 1 - Ready - Level 1" remoteExec ["systemChat",0];
			"OKS_Buzzer" remoteExec ["PlaySound",units (group _caller)];
		};
	},
	[_CourseNumber,_ZoneTrigger],		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

_Object addAction
[
	"<t color='#32ec08'>Start Live-Run (2)</t>",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script
		_arguments params ["_CourseNumber","_ZoneTrigger"];
		_target setVariable ["DZ_CourseActive",0];
		[_target,_ZoneTrigger,_CourseNumber,1,nil,"front",false] spawn DZ_Trigger_Spawn;
		[_target,_caller] spawn {
			params ["_target","_caller"];

			playSound3D [getMissionPath "activated.wav", _target, false, getPosASL _target, 5, 1, 50];
			sleep 0.5;
			_target setVariable ["DZ_CourseActive",3];
			sleep 3;
			"DZ Course 1 - Ready - Level 2" remoteExec ["systemChat",0];
			"OKS_Buzzer" remoteExec ["PlaySound",units (group _caller)];			
		};
	},
	[_CourseNumber,_ZoneTrigger],		// arguments
	1.5,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true",		// condition
	50,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];

