	MISSION_ROOT = call { private "_arr"; _arr = toArray __FILE__; _arr resize (count _arr - 8); toString _arr};
	execVM "FAC_Teleport.sqf";
	execVM "Training\Init.sqf";

	dzshow=false;
