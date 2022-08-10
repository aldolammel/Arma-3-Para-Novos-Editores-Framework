// Nativamente o initServer.sqf é executado somente pelo servidor (seja a máquina de um jogador que está hosteando a missão, seja pelo servidor dedicado. Sua ordem de execução NÃO é garantida, podendo ser iniciado somente após a execução do initPlayerLocal.sqf por exemplo, mas sem dúvida somente depois da execução do init.sqf que é sempre o primeiro init a ser rodado.

// Nunca, neste arquivo, faça validações como " if (isServer)" ou " if (!hasInterface)". Não há essa necessidade porque este arquivo é SOMENTE lido por servidores.

// ANIMAÇÃO
// Abaixo, AI's que estão sendo animadas, porém existe uma certa desincronização das animações para cada player. Caso vc perceba
// essa desincronização e isso atrapalhe a missão, tente executar tudo isso no init.sqf porém pode estar sobrecarregando aquele arquivo
// que tem o objetivo de executar tudo antes da partida começar.

	// ambientAnim (tipos de animação que não reagem se forem estimuladas, como engajamentos, por exemplo):
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

	// ambientAnimCombat (tipos de animação que reagem a estimulos como, por exemplo, quando engajadas, deixando a animação e assumindo por definitivo outra postura):
	{[soldadoAnimado01,"WATCH","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado02,"WATCH1","RANDOM",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado03,"WATCH2","RANDOM",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado04,"STAND_IA","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado05,"KNEEL","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado06,"LEAN","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	{[soldadoAnimado07,"SIT_LOW","FULL",{(player distance _this) < 0}] call BIS_fnc_ambientAnimCombat} remoteExec ["call",0];
	
// CONVENSÂO DE GENEBRA
// verifica o número de civis mortos.
null=[] execVM "genevaConvention.sqf";

// T8 EXECUÇÃO
// não existe qualquer necessidade do T8 rodar nos clientes ou estar no pacote das primeiras coisas a serem rodadas no início da missão.
execVM "T8_missionEXEC.sqf";