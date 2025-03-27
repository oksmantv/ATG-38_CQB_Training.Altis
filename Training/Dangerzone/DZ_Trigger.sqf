/*

	[DZ_Terminal_1,1,1,true] spawn DZ_Trigger;
*/

Params [
	"_Terminal",
	"_ZoneTrigger",
	["_CourseNumber",1,[1]],
	["_CrossingNumber",1,[1]],
	["_isFront",false,[false]],
	["_isReversed",false,[false]]
];
Private ["_SelectedSides","_Chance"];

waitUntil{sleep 0.5; !isNil "DZ_Trigger_Spawn"};

_SelectedSides = ["left","right"];
_Chance = 1;
if(_isFront) then {
	_SelectedSides = ["front"];
	_Chance = 0.5;
};

if((random 1) <= _Chance) then {
	_FirstSelect = selectRandom _SelectedSides;
	_SelectedSides deleteAt (_SelectedSides find _FirstSelect);
	format["%1 Spawn - Passed Chance",_FirstSelect] remoteExec ["DZ_Debug",0];
 	[_Terminal,_ZoneTrigger,_CourseNumber,_CrossingNumber,_FirstSelect,_isReversed] spawn DZ_Trigger_Spawn;
} else {
	format["%1 Spawn - Failed Chance",_SelectedSides] remoteExec ["DZ_Debug",0];
};

sleep 2 + (random 4);

if(count _SelectedSides > 0) then {
	_SecondSelect = selectRandom _SelectedSides;	
	[_Terminal,_ZoneTrigger,_CourseNumber,_CrossingNumber,_SecondSelect,_isReversed] spawn DZ_Trigger_Spawn;
	format["%1 Spawn - Second Spawn",_SecondSelect] remoteExec ["DZ_Debug",0];
};

