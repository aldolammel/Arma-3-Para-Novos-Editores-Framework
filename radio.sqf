 params ["_obj", "_dist", "_sounds"];
if (!isServer) exitWith {};

while {alive _obj} do {
	(selectRandom _sounds) params ["_file", "_length"];
	private _mr = str missionConfigFile select [0, count str missionConfigFile - 15];
     
	playSound3D [_mr + _file, _obj, false, getPosASL _obj, 1, 1, _dist];
	sleep _length;
};