// File: THY_fnc_whoCantDrive.sqf
// MAKE THE DRIVER POSITION UNABLE FOR A SPECIFIC UNIT:
// by thy @aldolammel
//
// On Eden Editor, just set this into the unit INIT:
// [this] execVM "THY_fnc_whoCantDrive.sqf";
//

if (isDedicated) exitWith {};

params ["_unit"];

while {alive _unit} do  // if the player is alive, the loop runs:
{			
	if (!isNull objectParent _unit && driver vehicle _unit isEqualTo _unit) then
	{
		vehicle _unit engineOn false; // force the vehicle engine turns off.
		_unit action ["Eject", vehicle _unit];   // diferent than doGetOut, Action Eject force the unit to leave even though the vehicle is moving.
		format ["EN: %1, you don't know how to drive.", name _unit] remoteExec ["systemChat", _unit];
		format ["PT: %1, você não sabe dirigir.", name _unit] remoteExec ["systemChat", _unit];
		sleep 2;
	};
	sleep 1;  // execution breathe.
};