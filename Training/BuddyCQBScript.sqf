/* 
	[this,[BCT_1_1, BCT_1_10, BCT_1_11, BCT_1_12, BCT_1_2, BCT_1_3, BCT_1_4, BCT_1_5, BCT_1_6, BCT_1_7, BCT_1_8, BCT_1_9],TriggerName] execVM "BuddyCQBScript.sqf";
	[
		this,
		[
			SCQB_1, SCQB_10, SCQB_11, SCQB_12, SCQB_13, 
			SCQB_14, SCQB_15, SCQB_16, SCQB_17, SCQB_18, SCQB_19, 
			SCQB_2, SCQB_20, SCQB_21, SCQB_22, SCQB_23, SCQB_24, 
			SCQB_25, SCQB_26, SCQB_27, SCQB_28, SCQB_29, SCQB_3, 
			SCQB_30, SCQB_31, SCQB_32, SCQB_33, SCQB_34, SCQB_35, 
			SCQB_36, SCQB_37, SCQB_38, SCQB_39, SCQB_4, SCQB_40, 
			SCQB_41, SCQB_42, SCQB_43, SCQB_44, SCQB_45, SCQB_46, 
			SCQB_47, SCQB_48, SCQB_49, SCQB_5, SCQB_50, SCQB_51, 
			SCQB_52, SCQB_53, SCQB_54, SCQB_55, SCQB_56, SCQB_57, 
			SCQB_58, SCQB_59, SCQB_6, SCQB_60, SCQB_61, SCQB_62, 
			SCQB_63, SCQB_64, SCQB_65, SCQB_7, SCQB_8, SCQB_9,
			SCQB_66, SCQB_67, SCQB_68, SCQB_69, SCQB_70
		],
		SCQBTrigger,
		[
			SCQBP_1, SCQBP_10, SCQBP_11, SCQBP_2, SCQBP_3,
			SCQBP_4, SCQBP_5, SCQBP_6, SCQBP_7, SCQBP_8, SCQBP_9,
			SCQBP_12, SCQBP_13, SCQBP_14
		],
		[
			SCQBR_1, SCQBR_2, SCQBR_3, 
			SCQBR_4, SCQBR_5, SCQBR_6
		],
		SCQBStartTrigger
	] execVM "Training\BuddyCQBScript.sqf";
*/

Params [
	"_Object",
	"_TargetArray",
	"_Trigger",
	["_PatrolSpawns",[],[[]]],
	["_HuntSpawns",[],[[]]],
	["_HuntStartTrigger",nil,[objNull]]
];

if(!(_HuntSpawns IsEqualTo [])) then {
	if(!isNil "_HuntStartTrigger") exitWith {
		systemChat "_HuntStartTrigger undefined. Exiting."
	}
};

waitUntil {sleep 5; !isNil "OKS_Patrol_Spawn" && !isNil "OKS_Lambs_Spawner" && !isNil "OKS_LiveTargets" && !isNil "OKS_CourseReset"};

[_TargetArray] remoteExec ["OKS_PopUpTargets",2];
{
	_Percentage = _X;
	_Object addAction [format["<t color='#0AE422'>Spawn Live-Targets (%1%2)</t>",_X,"%"],{
		(_this select 3) Params ["_TargetArray","_PatrolSpawns","_HuntSpawns","_HuntStartTrigger","_Object","_Percentage"];
		[_TargetArray,_Percentage] remoteExec ["OKS_LiveTargets",2];
		{
			[getPos _X] remoteExec ["OKS_Patrol_Spawn",2];
		} foreach _PatrolSpawns;

		[_HuntSpawns, _HuntStartTrigger, _Object] spawn {
			Params ["_HuntSpawns", "_HuntStartTrigger", "_Object"];
			playSound3D [GetMissionPath "activated.wav", _Object, false, getPosASL _Object, 1, 1, 50];
			sleep 20;
			playSound3D [GetMissionPath "Training\MarksmanQualification\oks_buzzer.ogg", _Object, false, getPosASL _Object, 1, 1, 50];
			waitUntil {sleep 5; triggerActivated (_this select 1)};
			{
				[getPos _X, "rush", 1, east, 1000, [], SCQBEndTrigger, 180] spawn OKS_Lambs_Spawner;
				sleep 30;
			} foreach (_this select 0);
		};
	},[_TargetArray,_PatrolSpawns,_HuntSpawns,_HuntStartTrigger,_Object,_Percentage]];
} foreach [33,66,100];

_Object addAction ["<t color='#E40A0A'>Reset Course</t>",{
	(_this select 3) remoteExec ["OKS_CourseReset",2];
	SCQBEndTrigger setVariable ["SQCBEnd",true,true];
},[_TargetArray,_Trigger]];