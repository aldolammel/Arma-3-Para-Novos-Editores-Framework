if (!isMultiplayer) exitWith {};
any=[
		[
            ["Uma frase grande","<t align = 'right' size = '1.5'>%1</t><br/>"],
            ["Uma frase menor","<t align = 'right' size = '0.7'>%1</t><br/>"]
        ]

] spawn BIS_fnc_typeText;
[] spawn {
        cutText ["", "BLACK FADED", 999];
            //0.9 fadeSound 0;
            sleep 1;

                "dynamicBlur" ppEffectEnable true;
                "dynamicBlur" ppEffectAdjust [6];
                "dynamicBlur" ppEffectCommit 0;
                "dynamicBlur" ppEffectAdjust [0.0];
                "dynamicBlur" ppEffectCommit 1;

        // How long (high numbers) will be the dark screen to fade in.
		cutText ["", "BLACK IN", 10];
            //14 fadeSound 1;
            //playMusic "AmbientTrack01a_F_EXP";
        //sleep 1;

            //[str ("MISSIONNAME") ,  str (date select 2) + "." + str (date select 1) + "." + str (date select 0)] spawn BIS_fnc_infoText;
        sleep 11;
            [str ("Horário"), str (date select 3) + "." + str (date select 4)] spawn BIS_fnc_infoText;
        //sleep 10;
            //0=[[["MISSIONAREA, ","align = 'center' size = '0.7' font='PuristaBold'"],["","<br/>"],["MISSIONISLAND","align = 'center' size = '0.7'","#aaaaaa"]]] spawn BIS_fnc_typeText2;
    };