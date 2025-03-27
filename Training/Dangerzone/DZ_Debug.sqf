Params ["_Text"];

if(!HasInterface) exitWith {false};

_FinalText = "DZ: " + _Text;
if(DZ_Debug_Variable) then {
	systemChat _FinalText;
	player createDiaryRecord ["Diary", ["Debug Messages", format["%1",_FinalText]]]
};