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

// MARCAS NO MAPA > GAMEPLAY
"marker-exemplo" setmarkeralpha 0;
"marker-spawn01" setmarkeralpha 0;	// exemplo do spawn randomico
"marker-spawn02" setmarkeralpha 0;	// exemplo do spawn randomico
"marker-spawn03" setmarkeralpha 0;	// exemplo do spawn randomico


// MARCAS NO MAPA > PARA O EDITOR APENAS
"dashboard-sucesso" setmarkeralpha 0;
"dashboard-neutro" setmarkeralpha 0;
"dashboard-fracasso" setmarkeralpha 0;

// CONVENSÂO DE GENEBRA
null=[] execVM "genevaConvention.sqf";