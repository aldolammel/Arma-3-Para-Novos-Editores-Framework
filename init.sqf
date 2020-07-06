// TO DEDICATED AND HEADLESS CLIENT AND REGULAR CLIENT
if (!isDedicated) then { 
	waitUntil { 
		!isNull player
		};
	[] call compile preProcessFileLineNumbers "briefing.sqf";
};

// ONLY FOR CLIENT
if(hasInterface) then {
    [] spawn {
        waitUntil {
			sleep 0.1; !isNull player
			};
    };
};

// CUSTOM SOUNDS
//null = [radinho, 0, [["sounds\musiquinha.ogg", 61],["sounds\musiquinha.ogg", 61]]] execVM "radio.sqf";

// T8 SPAWN ZONES
"zona01" setmarkeralpha 0;
"zona02" setmarkeralpha 0;
"zona03" setmarkeralpha 0;
"zona04" setmarkeralpha 0;

execVM "T8_missionEXEC.sqf";

// MARKERS ON MAP > GAMEPLAY
"marker-exemplo" setmarkeralpha 0;


// MARKERS ON MAP > DASHBOARD FOR EDITOR ONLY
"dashboard-sucesso" setmarkeralpha 0;
"dashboard-neutro" setmarkeralpha 0;
"dashboard-fracasso" setmarkeralpha 0;

// CHECK DEATH OF CIVILS
null=[] execVM "civCount.sqf";