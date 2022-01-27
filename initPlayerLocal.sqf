//Lembre-se de que o ARMA só lê este arquivo INIT na máquina do jogador, ou seja, o que estiver declarado aqui nunca será processado pelo Servidor Dedicado da partida. Em outras palavras, não adicionar "isDedicated" (é servidor dedicado) ou !isDedicated (não é servidor dedicado) neste arquivo init.

// MARCAS NO MAPA > CONTROLE DE VISIBILIDADE
// Prefixos pra markers no Editor: WEST-, EAST-, GUER-, CIV-
[] spawn {
    while { true } do {
        waitUntil { sleep 1; alive player};
        {
            _arr = _x splitString "-";
            _pre = _arr select 0;
            if (_pre in ["WEST","EAST","GUER","CIV"]) then {
                if (format["%1",side player] == _pre) then {
                    _x setMarkerAlphaLocal 1;
                } else {
                    _x setMarkerAlphaLocal 0;
                };
            };
            
        } count allMapMarkers;
    };
};

// MARCAS NO MAPA > GAMEPLAY > PÚBLICAS PARA TODOS
// Estão no arquivo init.sqf

// MARCAS NO MAPA > GAMEPLAY > PRIVADAS POR FACÇÃO
	// Para players BluFor
		"WEST-marker01" setmarkeralpha 0;	
		"WEST-marker02" setmarkeralpha 0;
	// Para players OpFor
		"EAST-marker01" setmarkeralpha 0;	
		"EAST-marker02" setmarkeralpha 0;
	// Para players Civillians
		"CIV-marker01" setmarkeralpha 0;	
	// Para players Independent
		//"GUER-marker01" setmarkeralpha 0;	
		//"GUER-marker02" setmarkeralpha 0;

// MARCAS NO MAPA > GAMEPLAY > MARCAS QUE VÃO APARECER NO DECORRER DA MISSÃO
// infelizmente, não consegui fazer as marcas abaixo ficarem ocultas para suas respectivas facções. Sendo assim, trato elas como se fossem PUBLICAS porém deixando elas no initPlayer para o dia que eu conseguir arrumar isso.
"marker-civbug01" setmarkeralpha 0;
"marker-bluforbug01" setmarkeralpha 0;
"marker-opforbug01" setmarkeralpha 0;

// MARCAS NO MAPA > EDITOR > PRIVADAS DO EDITOR
// Estão no arquivo init.sqf

// ÁREA JOGÁVEL
"playableArea.sqf" remoteExec ["BIS_fnc_execVM"];
"markerPlayableArea" setmarkeralpha 0; // oculta o marcador quando a partida começa.