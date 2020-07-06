// Serverside scripts, funcs, etc

// INTRO
//"missionIntro.sqf" remoteExec ["BIS_fnc_execVM"];

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