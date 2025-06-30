// [this] execVM "Image\LoopImageDZ.sqf";

Params ["_Object"];

if(!isServer) exitWith { false };

while {true} do {
	for "_i" from 1 to 17 do {

		_Object setObjectTextureGlobal [0,format["images\dz_%1.jpg",_i]];
		sleep 0.8;
	};
	sleep 3;
};