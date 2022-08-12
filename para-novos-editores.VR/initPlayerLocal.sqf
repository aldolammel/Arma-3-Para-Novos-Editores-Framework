// Nativamente o initPlayerLocal.sqf é executado somente pelo jogador (seja um player comum ou o player que está hosteando a partida quando não se há um servidor dedicado fazendo a função). Sua ordem de execução NÃO é garantida, podendo ser iniciado somente após a execução do initServer.sqf por exemplo, mas sem dúvida somente depois da execução do init.sqf que é sempre o primeiro init a ser rodado.

// Nunca, neste arquivo, faça validações como " if (isServer)" ou " if (hasInterface)". Não há essa necessidade porque este arquivo é SOMENTE lido por players.

// PLAYER FACES
[playerIdNameFace, "AfricanHead_02"] remoteExec ["setFace", 0, playerIdNameFace];

// MARCAS NO MAPA > CONTROLE DE VISIBILIDADE
// ao criar markers no Eden, utilize os prefixos para garantir que somente aquela facção verá as marcas: WEST-, EAST-, GUER-, CIV-
// por enquanto só funciona com markers que já estão disponíveis no início da missão. Se as marcas das facções precisarem
// aparecer durando a partida, trate-as como públicas infelizmente até eu adaptar o script abaixo.
[] spawn
{
    while { true } do
	{
		waitUntil
		{ 
			sleep 1;
			alive player;
		};
        {
            _arr = _x splitString "-";
            _pre = _arr select 0;
			
            if (_pre in ["WEST","EAST","GUER","CIV"]) then
			{
				if (format["%1",side player] == _pre) then
				{
					_x setMarkerAlphaLocal 1;
                } else 
				{
                    _x setMarkerAlphaLocal 0;
                };
            };
        } count allMapMarkers;
    };
};

// MARCAS NO MAPA > T8 ZONAS DE SPAWN
// estão no init.sqf.

// MARCAS NO MAPA > GAMEPLAY > PÚBLICAS PARA TODOS
"PUB_marker01" setMarkerAlpha 100;
"PUB_marker02" setMarkerAlpha 100;
"PUB_markerVersion" setMarkerAlpha 100;

// MARCAS NO MAPA > GAMEPLAY > PRIVADAS POR FACÇÃO
// Desnecessário porque o Controle de Visibilidade já faz este papel.

	// MARCAS NO MAPA > GAMEPLAY > MARCAS QUE VÃO APARECER NO DECORRER DA MISSÃO
	// infelizmente, não consegui fazer as marcas abaixo ficarem ocultas para suas respectivas facções. Sendo assim, trato elas como se fossem PUBLICAS porém deixando elas no initPlayer para o dia que eu conseguir arrumar isso.
	"marker_civbug01" setMarkerAlpha 0;
	"marker_bluforbug01" setMarkerAlpha 0;
	"marker_opforbug01" setMarkerAlpha 0;

// MARCAS NO MAPA > EDITOR > PRIVADAS DO EDITOR
"dashboard_sucesso" setMarkerAlpha 0;
"dashboard_neutro" setMarkerAlpha 0;
"dashboard_fracasso" setMarkerAlpha 0;