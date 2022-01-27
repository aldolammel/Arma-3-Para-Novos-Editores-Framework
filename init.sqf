// PARA SERVIDORES DEDICADOS E CLIENTES COMUNS E CLIENTES HEADLESS
if (!isDedicated) then { 
	waitUntil { 
		!isNull player
		};
	[] call compile preProcessFileLineNumbers "briefing.sqf";
};

// APENAS PARA CLIENTES 
if(hasInterface) then {
    [] spawn {
        waitUntil {
			sleep 0.1; !isNull player
			};
    };
};

// SONS CUSTOMIZADOS
//null = [radinho, 0, [["sounds\musiquinha.ogg", 61],["sounds\musiquinha.ogg", 61]]] execVM "radio.sqf";

// T8 ZONAS ONDE A AI IRÁ SPAWNAR
"zona01" setmarkeralpha 0;
"zona02" setmarkeralpha 0;
"zona03" setmarkeralpha 0;
"zona04" setmarkeralpha 0;

execVM "T8_missionEXEC.sqf";

// MARCAS NO MAPA > GAMEPLAY > PÚBLICAS PARA TODOS
"PUB-markerVersion" setmarkeralpha 100;
"PUB-marker01" setmarkeralpha 100;
"PUB-marker02" setmarkeralpha 100;

"PUB-marker03" setmarkeralpha 0;

// MARCAS NO MAPA > GAMEPLAY > PRIVADAS POR FACÇÃO
// Estão no arquivo initPlayerLocal.sqf

// MARCAS NO MAPA > EDITOR > PRIVADAS DO EDITOR
"dashboard-sucesso" setmarkeralpha 0;
"dashboard-neutro" setmarkeralpha 0;
"dashboard-fracasso" setmarkeralpha 0;

// CONVENSÂO DE GENEBRA
null=[] execVM "genevaConvention.sqf";