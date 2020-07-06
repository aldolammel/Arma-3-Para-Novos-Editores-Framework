_intelAccess = _this select 0;
[
    _intelAccess,                                                                           	 // Object the action is attached to
    "Access / Acessar",                                                                    // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",                      // Progress icon shown on screen
    "_this distance _target < 2",                                                        // Condition for the action to be shown
    "_caller distance _target < 2",                                                      // Condition for the action to progress
    {},                                                                                  // Code executed when action starts
    {},                                                                                  // Code executed on every progress tick
    {["taskIntelAccess", "SUCCEEDED", true] call BIS_fnc_taskSetState; [(_this select 0),(_this select 2)] remoteExec ["BIS_fnc_holdActionRemove", 0];},      // Code executed on completion
    {},                                                                                  // Code executed on interrupted
    [],                                                                                  // Arguments passed to the scripts as _this select 3
    15,                                                                                  // Action duration [s]
    0,                                                                                   // Priority
    true,                                                                                // Remove on completion
    false                                                                                // Show in unconscious state 
] remoteExec ["BIS_fnc_holdActionAdd", 0, _intelAccess];					 // example for MP compatible implementation



// WHICH KIND OF ICON DO YOU WANT TO?
//
// 		\holdAction_connect_ca.paa
// 		\holdAction_forceRespawn_ca.paa
// 		\holdAction_hack_ca.paa
// 		\holdAction_revive_ca.paa
// 		\holdAction_reviveMedic_ca.paa
// 		\holdAction_search_ca.paa
// 		\holdAction_takeOff1_ca.paa
// 		\holdAction_takeOff2_ca.paa
// 		\holdAction_unbind_ca.paa
// 		\holdAction_loaddevice_ca.paa
// 		\holdAction_unloaddevice_ca.paa
// 		\holdAction_thumbsup_ca.paa
// 		\holdAction_thumbsdown_ca.paa
// 		\holdAction_secure_ca.paa
// 		\holdAction_requestleadership_ca.paa
// 		\holdAction_passleadership_ca.paa