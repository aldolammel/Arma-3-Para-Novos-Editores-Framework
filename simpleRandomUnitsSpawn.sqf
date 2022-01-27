// COMMOM DESTINIES FOR ALLIES AND ENEMIES
_whereToGo = ["destiny01","destiny02","destiny03","destiny04"]; 

//WEST TEAM
_westSpawnPosition = selectRandom ["westSpwn01","westSpwn02","westSpwn03","westSpwn04","westSpwn05","westSpwn06"]; 

	//creating groups
	_westGroup01 = [getmarkerpos _westSpawnPosition, WEST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_westWaypoint = _westGroup01 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0]; 
	_westGroup02 = [getmarkerpos _westSpawnPosition, WEST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_westWaypoint = _westGroup02 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0]; 
	_westGroup03 = [getmarkerpos _westSpawnPosition, WEST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_westWaypoint = _westGroup03 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0]; 

//EAST TEAM
_eastSpawnPosition = selectRandom ["eastSpwn01","eastSpwn02","eastSpwn03","eastSpwn04","eastSpwn05","eastSpwn06"]; 

	//creating groups
	_eastGroup01 = [getmarkerpos _eastSpawnPosition, EAST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_eastWaypoint = _eastGroup01 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0]; 
	_eastGroup02 = [getmarkerpos _eastSpawnPosition, EAST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_eastWaypoint = _eastGroup02 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0]; 
	_eastGroup03 = [getmarkerpos _eastSpawnPosition, EAST, ["B_sniper_F", "B_spotter_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;   
	_eastWaypoint = _eastGroup03 addWaypoint [getmarkerpos (selectRandom _whereToGo), 0];