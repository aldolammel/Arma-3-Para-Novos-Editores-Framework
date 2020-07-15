areaTimer = 0;
#define DTIME 10 // Tempo limite (em segundos) para o jogador voltar a área jogável da partida.

while { true } do {
	_pos = getMarkerPos "markerPlayableArea";
	_size = getMarkerSize "markerPlayableArea";
	_p = getpos player;
	_w = _size select 0;
	_h = _size select 1;
	if(((_p select 0) > ((_pos select 0) - _w)) && ((_p select 0) < ((_pos select 0) + _w))
&&  ((_p select 1) > ((_pos select 1) - _h)) && ((_p select 1) < ((_pos select 1) + _h))  ) then {
		areaTimer = time;
	}
	else {
		_t = time - areaTimer;
		if(_t >= DTIME) then {
			player setDamage 1;
			(vehicle player) setDamage 1;
		}
		else {
			hintSilent format["Você será dado como desertor em:\n\n%1s", DTIME - _t];
		};
	};
 sleep 0.1;
};