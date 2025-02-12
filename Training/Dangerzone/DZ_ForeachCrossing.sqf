// [_Targets_1,false] spawn DZ_ForeachSide;

Params [
	"_CrossingsArray",
	"_Reversed",
	"_Terminal"
];

if(isNil "_CrossingsArray") exitWith { systemChat "_CrossingsArray undefined. Exiting." };
if(isNil "_Reversed") exitWith { systemChat "_Reversed undefined. Exiting." };

{
	[_X,_Reversed,_Terminal,_CrossingsArray] spawn DZ_ForeachSide;
} foreach _CrossingsArray;
