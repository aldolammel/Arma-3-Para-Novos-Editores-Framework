SHK_DeadCivilianCount = 0;
SHK_DeadCivilianLimit = 4; // limite de baixas civis.
SHK_fnc_deadCivilians = {
  hintsilent format ["Civilians dead: %1",_this];
  if (_this >= SHK_DeadCivilianLimit) then {
        civDead = true;
  };
};
if isserver then {
  {
    if (side _x == Civilian && _x iskindof "CaManBase") then {
      _x addEventHandler ["killed", {
        SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
        publicvariable "SHK_DeadCivilianCount";
        if !isdedicated then {
          SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
        };
      }];
    };
  } foreach allunits;
};
if !isdedicated then {
  "SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians };
};