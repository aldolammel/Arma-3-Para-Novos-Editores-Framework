// Serverside scripts, funcs, etc

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

// ANIMATIONS
// All soldiers animations are here for turn around the server sync issue.

	// ambientAnim
	{[controleDaMissao,"BRIEFING","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado08,"BRIEFING","MEDIUM"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado09,"LISTEN_BRIEFING","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado10,"SIT_LOW_U","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado11,"SIT_AT_TABLE","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado12,"SIT_SAD1","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado13,"PRONE_INJURED","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado14,"PRONE_INJURED_U2","LIGHT"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado15,"KNEEL_TREAT","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado16,"PRONE_INJURED_U1","LIGHT"] call BIS_fnc_ambientAnim} remoteExec ["call",0];
	{[soldadoAnimado17,"KNEEL_TREAT2","FULL"] call BIS_fnc_ambientAnim} remoteExec ["call",0];

	// ambientAnimCombat - these can reative to combat
	{[soldadoAnimado01,"WATCH","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado02,"WATCH1","RANDOM",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado03,"WATCH2","RANDOM",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado04,"STAND_IA","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado05,"KNEEL","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado06,"LEAN","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado07,"SIT_LOW","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	
