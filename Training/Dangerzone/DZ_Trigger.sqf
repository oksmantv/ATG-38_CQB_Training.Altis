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
	//systemChat "Side Spawn - Passed Chance";
	_FirstSelect = selectRandom _SelectedSides;
	_SelectedSides deleteAt (_SelectedSides find _FirstSelect);	
 	[_Terminal,_ZoneTrigger,_CourseNumber,_CrossingNumber,_FirstSelect,_isReversed] spawn DZ_Trigger_Spawn;
} else {
	//systemChat "Side Spawn - Failed Chance";
};

sleep 2 + (random 4);

if(count _SelectedSides > 0) then {
	_SecondSelect = selectRandom _SelectedSides;	
	[_Terminal,_ZoneTrigger,_CourseNumber,_CrossingNumber,_SecondSelect,_isReversed] spawn DZ_Trigger_Spawn;
	//systemChat "Side Spawn - Second Spawn";
};

