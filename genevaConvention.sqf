//sleep 60; // dá tempo do Controlled Spawn and Waypoints Randomizr carregar todo mundo.

SHK_DeadCivilianCount = 0;
SHK_DeadCivilianLimit = 3; // Limite baixas civis.
SHK_fnc_deadCivilians =
{  
	hintSilent format ["\n\nEN: Civilian deaths:\n\n%1\n\nPT: Baixas civis:\n\n", _this];
	  
	if (_this >= SHK_DeadCivilianLimit) then
	{
		genevaConventionIgnored = true;
	};
};

if (isServer) then
{
	{
		if (side _x == Civilian && _x isKindOf "CaManBase") then
		{
			_x addEventHandler ["killed",
			{
				SHK_DeadCivilianCount = SHK_DeadCivilianCount + 1;
				publicvariable "SHK_DeadCivilianCount";
				
				if (!isDedicated) then
				{
					SHK_DeadCivilianCount call SHK_fnc_deadCivilians;
				};
			}];
		};
	
	} foreach allUnits;
};

if (!isDedicated) then
{
	"SHK_DeadCivilianCount" addpublicvariableeventhandler
	{
		(_this select 1) call SHK_fnc_deadCivilians
	};
};