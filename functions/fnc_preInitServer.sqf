// --- preInitServer ----------------------------------------------------------
// Set everything that needs to be there before editor/menu/briefing server side
diag_log "[CGQC_PREINIT] === preInitServer started =====================================";

// Check if dynamic group is initialized
if !(["IsInitialized"] call BIS_fnc_dynamicGroups) then {
	["Initialize", [true, 20, false, "cgqc_patch_logo"]] call BIS_fnc_dynamicGroups;
};

// Set some internal variables default state
missionNamespace setVariable ["CGQC_gamestate_briefing", false];
missionNamespace setVariable ["CGQC_gamestate_briefing_leaders", false];
missionNamespace setVariable ["cgqc_state_briefing_full", false];


diag_log "[CGQC_PREINIT] === preInitServer done =====================================";