// File: THY_fnc_whoAlmostCantDrive.sqf
// MAKE THE DRIVER POSITION UNABLE IN FEW CARS FOR A SPECIFIC UNIT:
// by thy @aldolammel
//
// On Eden Editor, just set this into the unit INIT:
// [this] execVM "THY_fnc_whoAlmostCantDrive.sqf";
//

if (isDedicated) exitWith {};  // define here who is the person that driver position must be unavailable.

params ["_unit"];
private _acceptableVehicles = [civVeh09];  // [vehicle1, vehicle2, vehicle3]

while {alive _unit} do  // if the player is alive, the loop runs:
{			
	if (!isNull objectParent _unit) then   // if the player is in a vehicle, so...
	{
		{ // lets check each vehicle (_x) available in array _cars...
			if ((driver _x) isEqualTo _unit) then {
				sleep 5;  // breathe
				continue;  // go straight on to the next loop.
			} else {
				if (driver vehicle _unit isEqualTo _unit) then {
					vehicle _unit engineOn false; // force the vehicle engine turns off.
					_unit action ["Eject", vehicle _unit];  // diferent than doGetOut, Action Eject force the unit to leave even though the vehicle is moving.
					format ["EN: %1, this vehicle is not yours. You wanna go to jail?", name _unit] remoteExec ["systemChat", _unit];
					format ["PT: %1, esse veículo não é seu. Quer ir preso?", name _unit] remoteExec ["systemChat", _unit];
				};
				sleep 2;
			};  // if the player is the driver of on _car (_x) in _cars array, so...

		} forEach _acceptableVehicles;   // finish the forEach _cars.
		sleep 1;   // execution breathe. In this case, if bigger than 0.5, the player is allowed to accelerate the vehicle hehe.
	};
	sleep 1; // execution breathe.
};
