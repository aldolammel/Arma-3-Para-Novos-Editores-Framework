// PARA SERVIDORES DEDICADOS E CLIENTES COMUNS E CLIENTES HEADLESS
if (!isDedicated) then												// se não for servidor dedicado, então...
{ 													
	waitUntil														// aguarde até que...
	{ 																
		!isNull player												// exista o jogador.
	};
	[] call compile preProcessFileLineNumbers "briefing.sqf"; 		// chama o arquivo.
};

// APENAS PARA CLIENTES 
if(hasInterface) then
{
	[] spawn
	{
        waitUntil
		{
			sleep 0.1;
			!isNull player
		};
    };
};