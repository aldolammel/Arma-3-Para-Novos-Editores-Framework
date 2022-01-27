SHK_DeadCivilianCount = 0;
SHK_DeadCivilianLimit = 6; // limite de baixas civis.
SHK_fnc_deadCivilians = {
  hintsilent format ["Mortes de civis: %1",_this];
  if (_this >= SHK_DeadCivilianLimit) then {
        genevaConventionIgnored = true;
  };
};
if isServer then {
  {
    if (side _x == Civilian && _x isKindOf "CaManBase") then {
      _x addEventHandler ["killed", {
        SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
        publicvariable "SHK_DeadCivilianCount";
        if !isDedicated then {
          SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
        };
      }];
    };
  } foreach allunits;
};
if !isDedicated then {
  "SHK_DeadCivilianCount" addpublicvariableeventhandler { (_this select 1) call SHK_fnc_deadCivilians };
};