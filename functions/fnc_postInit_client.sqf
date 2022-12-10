// --- postInit_client ----------------------------------------------------------
// Start everything player related

// Player identification --------------------------------------------------------------------------------------------
//Get some player info
cgqc_player_name = name player;
cgqc_player_steamid = getPlayerUID player;
cgqc_player_steamName = profileNameSteam;
cgqc_player_rank = 1;
cgqc_player_known = true;
cgqc_player_patch_found = false;
cgqc_player_rank_found = false;
cgqc_perks_basic = false;
cgqc_perks_recon = false;
cgqc_perks_eng = false;
cgqc_perks_medic = false;

//ID player and find patch
_rank = [] spawn CGQC_fnc_findRank;
_patch = [] spawn CGQC_fnc_findPatch;
// Set and keep patch 
_set = [] spawn CGQC_fnc_setPatch;


// Dynamic group -------------------------------------------------------------------------------------------------
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Briefing entry -------------------------------------------------------------------------------------------------
_brief = [] call CGQC_fnc_briefing; 

// Ace self interaction perks
_perks = [] spawn CGQC_fnc_addPerks; 

// Zeus shenanigans... MAX - to review
_zeus = [] spawn CGQC_fnc_setZeus; 

// Lower gun 
player action ['SwitchWeapon', player, player, 100];

// Set default left/right radios
_radios = ["radio_sides"] spawn CGQC_fnc_setRadios; 

// Build a random welcome and shows it
_welcome = [] spawn CGQC_fnc_welcome; 

// Player init is complete!
cgqc_player_init = 1;

