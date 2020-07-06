// Checks if player is within X meters, moves toward them if they are.
// Will chose a new target player if another comes closer.
// Detonates upon getting within 10 meters of player
// Includes dead man switch (detonates upon death)
// Usage: null = [suicida,40] execVM "suicideBomberScript.sqf";

private ["_suicida","_targetdistance","_detonated"];
_suicida = _this select 0;
_targetdistance = _this select 1;
_detonated = 0;

While {alive _suicida} do 
{
	_nearest = objNull;
	_nearestdist = _targetdistance;
	{
		_dist= vehicle _x distance _suicida;
		if (isPlayer _x and _dist < _nearestdist) then
		{
			_nearest= _x;
			_nearestdist = _dist;
		};
	} forEach playableUnits;

	if (!isNull _nearest) then
	{
		_suicida move getPos _nearest;
		_suicida setCombatMode "RED";
		_suicida setSpeedMode  "FULL";
		_suicida directSay "gritoSuicida";

		if ((_suicida distance _nearest)<= 10) then
		{
			_detonated = 1;
			sleep 1;
			_bomb = "Bomb_04_F" createVehicle getPos _suicida;
			deletevehicle _suicida;

		};
	}
	else
	{
		_suicida moveTo getPos _suicida;
		sleep 1;
	};
	sleep 2;
};