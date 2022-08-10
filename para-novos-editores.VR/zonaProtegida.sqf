0= [] spawn {
  while {true} do {
   sleep 0.1;
   {
     if !(_x getVariable ["MGIttd",false]) then {
       _x setVariable ["MGIttd",true];
       _x addEventHandler ["firedman", { 
          _shooter = _this select 0; 
          _projectile = _this select 6;
          _target = if (isplayer _shooter) then [{cursorTarget},{ assignedTarget _shooter}];
          call {
            if (_projectile inArea trgProtectedZone1 or _projectile inArea trgProtectedZone2 or _projectile inArea trgProtectedZone3) exitWith {
              deleteVehicle _projectile;
              if (isPlayer _shooter) then {
                "Bases are protected!" remoteExec ["hintC",_shooter]
              }
            };
            if (_target inArea trgProtectedZone1 or _target inArea trgProtectedZone2 or _target inArea trgProtectedZone3) exitWith {
              deleteVehicle _projectile;
              if (isPlayer _shooter) then {
                "Bases are protected!" remoteExec ["hintC",_shooter]
              }
            };
            [_shooter,_projectile] spawn {
              params ["_shooter","_projectile"];
              waitUntil {_projectile inArea trgProtectedZone1 or _projectile inarea trgProtectedZone2 or _projectile inArea trgProtectedZone3 or isnull _projectile};
              if (!isNull _projectile) then {
                deleteVehicle _projectile;
                if (isPlayer _shooter) then {
                  "Bases are protected!" remoteExec ["hintC",_shooter]
                }
              };
            };
          };  
       }]
      }
    } forEach allUnits;
  }
};