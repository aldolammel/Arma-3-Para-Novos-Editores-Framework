/* 

	Nativamente o init.sqf é executado no exato instante que a missão é iniciada, antes mesmo da tela de briefing. Sua ordem de execução é garantida, sempre será a primeira coisa a ser lida, antes mesmo do initServer.sqf e initPlayerLocal.sqf.
	
	Igualmente nativo, tudo o que for depositado aqui, será rodado em todos os clientes (jogadores e headless clients) e servidores (dedicado e hosteado). Novamente, e apenas como exemplo, a diferença de carregar algo aqui para o servidor que não no initServer.sqf é quando você precisa - seja lá o motivo - que um script rode garantidamente no início absoluto da partida. 
	
	Uma escola mais atual nascida na comunidade do Arma 3 instrui a esquecer e não usar nada neste arquivo genérico de inicialização diante ao escopo/função dos arquivos initPlayerLocal.sqf, initPlayerServer.sqf e initServer.sqf.

*/ 

// CHAMANDO A TELA DO BRIEFING.SQF
if (!isDedicated) then
{ 													
	waitUntil
	{ 																
		!isNull player;
	};
	
	[] call compile preProcessFileLineNumbers "briefing.sqf";
};

// AUTORIZANDO A ENTRADA DO PLAYER
// se quem acessa o init.sqf tem algum tipo de interface (jogadores e jogadores hosteado têm interface, 
// já servidores dedicados não), então...
if (hasInterface) then		
{
	[] spawn
	{
        waitUntil	
		{
			sleep 0.1;	
			!isNull player;	
		};
	};
};

// INTRO
//"missionIntro.sqf" remoteExec ["BIS_fnc_execVM"];	

// MARCAS NO MAPA > T8 ZONAS DE SPAWN
// se estiver usando o T8 na missão, essas marcas estão no init.sqf porque elas, sob nenhuma hipótese, 
// podem ser visualizadas pelo player. Só o init.sqf garante essa leitura antes do player entrar na partida.
"zona01" setMarkerAlpha 0; 
"zona02" setMarkerAlpha 0;
"zona03" setMarkerAlpha 0; // tornando invisíveis a marca, colocando seu alpha em 0 ao invés de 100 (totalmente visível).
"zona04" setMarkerAlpha 0;

// SONS CUSTOMIZADOS
// se o som precisa estar disponível imediatamente após o início da partida, mantenha-o no init.sqf. Do contrário, initPlayerLocal.sqf.
//null = [radinho, 0, [["sounds\musiquinha1.ogg", 61],["sounds\musiquinha2.ogg", 61]] execVM "radio.sqf";  // obj, distance, song.
