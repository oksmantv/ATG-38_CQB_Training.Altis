// [_Targets_1,false] spawn DZ_ForeachSide;

Params [
	"_CrossingsArray",
	"_Reversed",
	"_Terminal"
];

if(isNil "_CrossingsArray") exitWith { "_CrossingsArray undefined. Exiting." remoteExec ["DZ_Debug",0]; };
if(isNil "_Reversed") exitWith { "_Reversed undefined. Exiting." remoteExec ["DZ_Debug",0]; };

{
	[_X,_Reversed,_Terminal,_CrossingsArray] spawn DZ_ForeachSide;
} foreach _CrossingsArray;
