#include "\CGQC\script_component.hpp"
// --- addPerks ----------------------------------------------------------
// Add all perks to player and set defaults
LOG("[CGQC_INIT] addPerks started");

// --- Perks Menu  ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Anti quick-jump
_action = [ "menu_self_para_quickMap", "QuickJump to map point", "\CGQC\textures\cgqc_ace_para", {[0, 0] call CGQC_fnc_trainingPara}, {cgqc_player_hasAnti || cgqc_flag_isTraining} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Repos ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_chill", " au Repos", "CGQC\textures\cgqc_ace_beret", {["chill", true] spawn CGQC_fnc_perksBasic}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Ready ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_ready", " Prêt au Combat", "CGQC\textures\cgqc_ace_combat", {["ready", true] spawn CGQC_fnc_perksBasic}, {cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Mark clear =========================================================================================================
_action = [ "cgqc_perk_mark", "Mark building cleared", "a3\ui_f\data\map\GroupIcons\badge_gs.paa", {[] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mark_clear", "Del last marker", "", {["last"] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_mark"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mark_clear", "Clear all markers", "a3\ui_f\data\map\markers\Military\objective_CA.paa", {["clear"] spawn CGQC_fnc_markClear}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_mark"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Quick State =========================================================================================================
_action = [ "cgqc_perk_state", "Quick State", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Stealth
_action = [ "cgqc_perk_state_stealth", "Stealth", "", {["stealth", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Overt
_action = [ "cgqc_perk_state_normal", "Normal", "", {["normal", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state != 1} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Battle
_action = [ "cgqc_perk_state_battle", "Battle", "", {["battle", false] spawn CGQC_fnc_perksBasic}, {cgqc_player_state < 2} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "cgqc_perk_state"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Reset colors
_action = [ "menu_self_resetColors", "Restore all TeamColors", "", {[] call CGQC_setTeamColorReloadAll;}, {leader player == player || _player getVariable 'cgqc_player_isTL' || [player] call CGQC_fnc_checkZeus || cgqc_player_max} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Radios =========================================================================================================
_action = [ "menu_self_radios", " Radio Presets", "CGQC\textures\radio.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "Flip radios Gauche/Droite", "", {["flipSides"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Set radio roles
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {["spartan", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {["spartan_2", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {["spartan_1", 1] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {["spartan", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {["spartan2", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {["spartan1", 2] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan3", "Spartan 3", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan3", "343", "", {["spartan", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_2", "343+152", "", {["spartan2", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan3_1", "Team Leader", "", {["spartan1", 3] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {["centaure"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {["griffon"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {["jtac"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ", "", {["hq"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Toggle Speaker 1
_action = [ "self_radio_speaker1", "Toggle Speaker 1", "", {["toggle_speaker"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Toggle Speaker 2
_action = [ "self_radio_speaker2", "Toggle Speaker 2", "", {["toggle_speaker_2"] spawn CGQC_fnc_setRadios}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Cone of silence   =========================================================================================================
_action = [ "menu_self_cone", "Cone de silence", "CGQC\textures\cgqc_ace_cone", {["cone", false] spawn CGQC_fnc_perksBasic}, {!cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_cone_off", "Cone de silence: Off", "CGQC\textures\cgqc_ace_cone", {["cone_off", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_silence} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Camouflage =========================================================================================================
_action = [ "menu_self_camo", "Hide yourself", "", {["camo", false] spawn CGQC_fnc_perksBasic}, {!cgqc_perks_camo && vehicle player isEqualTo player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Inspect   =========================================================================================================
_action = [ "menu_self_inspect", "Inspect/Visual", "CGQC\textures\search.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Show player
_action = [ "menu_self_cam", "Player Mirror", "CGQC\textures\cgqc_ace_mirror", {["cam", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Confirm self-loadout
_action = [ "menu_self_check", "Confirm Self Loadout", "CGQC\textures\search.paa", {["check", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;

//  Change Goggles =========================================================================================================
_action = [ "cgqc_perk_goggles", "Change Goggles", "CGQC\textures\cgqc_ace_goggles", {""}, {cgqc_player_has2023} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// ---- Types
_action = [ "cgqc_perk_goggles_clr", "Clear Glasses", "cgqc\textures\cgqc_ace_glasses", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_clr_msk", "Goggles/Masks", "CGQC\textures\cgqc_ace_mask", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_sun", "Sunglasses", "cgqc\textures\cgqc_ace_sunglasses", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_gas", "Gasmask", "cgqc\textures\cgqc_ace_gasmask", {["G_mas_can_gasmask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect","cgqc_perk_goggles"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear glasses
_action = [ "cgqc_perk_goggles_base", "Ballistic Glasses", "", {["G_mas_can_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_t", "Facewrap (Tan)", "", {["G_mas_can_wrap_gog_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_base_b", "Facewrap (Blk)", "", {["G_mas_can_wrap_gog_B"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_down", "Shemagh Up", "", {["G_mas_can_shemag_gog_l"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_goggles_shem_up", "Shemagh Down", "", {["G_mas_can_shemag_gog"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Clear mask
_action = [ "cgqc_perk_mask_blk", "Mask (Black)", "", {["G_mas_can_mask_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_tan", "Mask (Tan)", "", {["G_mas_can_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_blk", "Balaclava (Blk)", "", {["G_mas_can_balaM_b"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_b_tan", "Balaclava (Tan)", "", {["G_mas_can_balaM_T"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_mask_shemagh", "Shemagh Up", "", {["G_mas_can_shemag_mask"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_clr_msk"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// - Sunglasses
_action = [ "cgqc_perk_sun_blk", "Dark Glasses", "", {["rhs_googles_black"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_mask", "Dark Mask", "", {["rhsusf_oakley_goggles_blk"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh", "Mask+Shemagh Up", "", {["rhsusf_shemagh_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_shemagh_d", "Mask+Shemagh Down", "", {["rhsusf_shemagh2_gogg_tan"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "cgqc_perk_sun_low", "Low Profile Goggles", "", {["G_Lowprofile"] spawn CGQC_fnc_perkGoggles}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_inspect", "cgqc_perk_goggles", "cgqc_perk_goggles_sun"], _action ] call  ace_interact_menu_fnc_addActionToObject;



// Signals =========================================================================================================
_action = [ "menu_self_signals", "Signals", "CGQC\textures\cgqc_ace_chems", {""}, {cgqc_perks_chems > 0 && cgqc_config_signals} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Criquet
_action = ["menu_self_criquet", "Criquet", "CGQC\textures\cgqc_ace_cricket", {["click", false] spawn CGQC_fnc_perksBasic;}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action] call ace_interact_menu_fnc_addActionToObject;
// Smokes
_action = [ "menu_self_smoke_blue", "Smoke: Blue", "", {["throw", "SmokeShellBlue"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_red", "Smoke: Red", "", {["throw", "SmokeShellRed"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_purple", "Smoke: Purple", "", {["throw", "SmokeShellPurple"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_smoke_yellow", "Smoke: Yellow", "", {["throw", "SmokeShellYellow"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Chemlights
_action = [ "menu_self_chem_green", "Chem Green", "", {["throw", "Chemlight_green"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_chem_ir", "Chem IR", "", {["throw", "ACE_Chemlight_IR"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Strobes
_action = [ "menu_self_strobe1", "Strobe 1", "", {["throw", "MS_Strobe_Mag_1"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_strobe2", "Strobe 2", "", {["throw", "MS_Strobe_Mag_2"] call CGQC_fnc_dropChem}, {cgqc_player_isModern} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Flares
_action = [ "menu_self_flare_green", "Flare: Green", "", {["throw", "ACE_HandFlare_Green"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_flare_red", "Flare: Red", "", {["throw", "ACE_HandFlare_Red"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_flare_white", "Flare: White", "", {["throw", "ACE_HandFlare_White"] call CGQC_fnc_dropChem}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Panels
_action = [ "menu_self_panel_r", "Panel: Red", "", {["panel", "RED"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_y", "Panel: Yellow", "", {["panel", "YELLOW"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_g", "Panel: Green", "", {["panel", "GREEN"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "menu_self_panel_b", "Panel: Black", "", {["panel", "BLACK"] call CGQC_fnc_dropChem}, {!cgqc_perks_panel} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc","menu_self_signals"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Personal stash =========================================================================================================
_action = [ "cgqc_perk_stash", " Personal Stash", "CGQC\textures\cgqc_ace_stash", {["stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && !cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Add Delete stash option
_action = [ "cgqc_perk_stash_delete", " Delete Stash", "", {["del_stash", false] spawn CGQC_fnc_perksBasic}, {cgqc_perks_basic && cgqc_perk_player_stash_on} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Fixes =========================================================================================================
_action = [ "menu_self_fixes", "Fixes/Debug", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Blackout
_action = [ "menu_self_blackout", "Fix Blackout", "", {["fix_blackout", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Fix Sound
_action = [ "menu_self_fix_sound", "Fix Sound", "", {["fix", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
/// Set patch
_action = [ "menu_self_patch", "Remettre ta patch personelle", "\cgqc\textures\cgqc_ace_defend.paa", {[player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Reset teamColor
_action = [ "menu_self_color", "Reset Team Color", "", {[] call CGQC_fnc_setTeamColorReload}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Restore backpack
_action = [ "menu_self_restore_pack", "Restore Lost Backpack", "", {["None", "restore"] spawn CGQC_fnc_dropStuff}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Fix stuck walk
_action = [ "menu_self_fixWalk", "Fix stuck walk", "", {[player, "forceWalk", "BackpackOnChest", false] call ace_common_fnc_statusEffect_set}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;





// Dynamic group
//_action = [ "menu_self_group", "Activate Dynamic Groups", "", {["group", false] spawn CGQC_fnc_perksBasic}, {true} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc", "menu_self_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Drop backpack
_action = [ "menu_self_drop", "Drop Backpack", "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa", {[backpack player, 'backpack'] spawn CGQC_fnc_dropStuff}, {backpack player != '' && isNull objectParent player} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Pick backpack
_action = [ "menu_self_grab", "Pickup Backpack", "a3\ui_f\data\igui\cfg\simpleTasks\types\backpack_ca.paa", {[player, 'backpack_pickup'] spawn CGQC_fnc_dropStuff}, {cgqc_backpack_dropped && (count nearestObjects [player, ["GroundWeaponHolder_Scripted"], 5]) > 0} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Fix ARMA
_action = [ "zeus_fix_arma", "ARMA?", "", {""}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Other fixes
_action = [ "zeus_fix_arma_heal", "Magic Heal", "", {["heal"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

//_action = [ "zeus_fix_arma_rejoin", "Rejoin after Disconnect", "", {["rejoin"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "zeus_fix_arma_corpse", "Teleport to corpse", "", {["tp_corpse"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = [ "zeus_fix_arma_tp", "Teleport to Leader", "", {["tp_leader"] call CGQC_fnc_arma}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Save individual snapshot
//_action = [ "zeus_fix_arma_save", "Save Snapshot", "", {[player, "save"] spawn CGQC_fnc_snapshot;}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Load individual snapshot
//_action = [ "zeus_fix_arma_load", "Load Snapshot", "", {[player, "load"] spawn CGQC_fnc_snapshot;}, {true}] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_cgqc", "menu_self_fixes", "zeus_fix_arma"], _action ] call ace_interact_menu_fnc_addActionToObject;



// Open items =========================================================================================================
// Open IFAK
_action = [ "menu_self_ifak", "Unpack: IFAK", "\CGQC\textures\icon_med", {["ifak", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_ifak'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Open Medic supply kit
_action = [ "menu_self_medkit", "Unpack: Medic supply kit", "\CGQC\textures\icon_med", {["medkit", player, true] call CGQC_fnc_openMedical}, {[player, 'cgqc_items_medkit'] call BIS_fnc_hasItem} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Zeus perks ===================================================================================================
_action = [ "menu_self_zeus", "Zeus", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {[player] call CGQC_fnc_checkZeus || cgqc_player_max} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Gamestate handling
_action = [ "zeus_gamestate", "Game Phase", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Training
_action = [ "zeus_gamestate_training", "Now-> Training", "", {true}, {missionNamespace getVariable "CGQC_gamestate_X_training"} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Staging
_action = [ "zeus_gamestate_staging", "Now-> Staging", "", {true}, {missionNamespace getVariable "CGQC_gamestate_1_staging"} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Briefing mode
_action = [ "zeus_briefing", "Briefing", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders briefing
_action = [ "zeus_briefingCmd_start", "Start Leaders Briefing", "", {["briefingCmd", 0] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Commanders done
_action = [ "zeus_briefingCmd_stop", "Stop Leader's Briefing", "", {["briefingCmd_stop", 0] spawn CGQC_fnc_perksZeus}, {([player] call CGQC_fnc_checkZeus || cgqc_player_max) && missionNamespace getVariable "CGQC_gamestate_1_briefing_leaders" } ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// General briefing
_action = [ "zeus_briefing_start", "Start Full Briefing", "", {["briefing", 0] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_2", "Start Full Briefing dans 2mins", "", {["briefing", 120] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_briefing_start_5", "Start Full Briefing dans 5mins", "", {["briefing", 300] spawn CGQC_fnc_perksZeus}, {!(missionNamespace getVariable "CGQC_gamestate_1_briefing")} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging", "zeus_briefing"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Briefing done
_action = [ "zeus_briefing_stop", "Stop Briefing", "", {["briefing_stop", 0] spawn CGQC_fnc_perksZeus}, {([player] call CGQC_fnc_checkZeus || cgqc_player_max) && missionNamespace getVariable "CGQC_gamestate_1_briefing_full"} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Start the game
_action = [ "zeus_gamestate_start", "Start Mission (save snapshots)", "", {["start"] spawn CGQC_fnc_gamestate;}, {missionNamespace getVariable "CGQC_gamestate_1_staging"} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate", "zeus_gamestate_staging"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Mission
_action = [ "zeus_gamestate_mission", "Now-> Mission", "", {""}, {missionNamespace getVariable "CGQC_gamestate_2_mission_start";} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;

// End mission
_action = [ "zeus_gamestate_start", "End Mission", "", {["end"] spawn CGQC_fnc_gamestate;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate", "zeus_gamestate_mission"], _action ] call ace_interact_menu_fnc_addActionToObject;

// End Mission
_action = [ "zeus_gamestate_end", "Now-> Post Mission", "", {""}, {missionNamespace getVariable "CGQC_gamestate_3_mission_stop";} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Pause AI
_action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {!(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused")} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {missionNamespace getVariable "CGQC_gamestate_mission_AIpaused"} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_pause"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Manual snapshot
_action = [ "zeus_snapshot_save", "Save All Player snapshots", "", {[player, "save", "all", "zeus"] spawn CGQC_fnc_snapshot}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_snapshot_load", "Load All player Snapshots", "", {[player, "load", "all", "zeus"] spawn CGQC_fnc_snapshot}, {MissionProfileNamespace getVariable ["cgqc_player_snapshot_zeus_done", false];} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_gamestate", "zeus_snapshot_save"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Other stuff

// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;



// Players stuff
//_action = [ "zeus_players", "Players", "", {""}, {count [] call CGQC_int_allHumanPlayers > 1} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Yeet
//#include "\cgqc\functions\cfg_yeetPlayer.hpp"

// Teleport to player
//#include "\cgqc\functions\cfg_teleportPlayer.hpp"

// AttachTo player
//#include "\cgqc\functions\cfg_attachPlayer.hpp"

// Blackout player
//#include "\cgqc\functions\cfg_blackoutPlayer.hpp"

// Wakeup player
//_action = [ "zeus_wakeup", "Wakeup player", "", {["wakeup", 0] spawn CGQC_fnc_perksZeus}, {cgqc_blackout_player_on} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Detach from player
//_action = [ "zeus_detach", "Detach from player", "", {["detach", 0] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_attached} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Fixes
_action = [ "zeus_fixes", "Fixes", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Dynamic group
_action = [ "zeus_fixes_group", "Activate Dynamic Groups for all", "", {[-1, {["group", false] spawn CGQC_fnc_perksBasic;}] call CBA_fnc_globalExecute;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_fixes_self", "Activate Dynamic Groups for Zeus", "", {["group", false] spawn CGQC_fnc_perksBasic;}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_fixes"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Options
_action = [ "zeus_options", "Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Langages
_action = ["zeus_babel_zeus", "Zeus: learn all languages", "", {["side"] call CGQC_fnc_setACRE}, {cgqc_config_sideLanguage }] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = ["zeus_babel_on", "Separate Languages: Turn On", "", {cgqc_config_sideLanguage = true; [-1, {["side"] call CGQC_fnc_setACRE}] call CBA_fnc_globalExecute;}, {!cgqc_config_sideLanguage} ] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = ["zeus_babel_off", "Separate Languages: Turn Off", "", {cgqc_config_sideLanguage = false; [-1, {["unlock"] call CGQC_fnc_setACRE}] call CBA_fnc_globalExecute;}, {cgqc_config_sideLanguage }] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;



// Faction relations
_action = ["zeus_relations", "Faction Relations", "",{""}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;

_action = ["zeus_relations_all", "All enemies", "", {["all"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = ["zeus_relations_west", "Ind friendly to West", "", {["indWest"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = ["zeus_relations_east", "Ind friendly to East", "", {["indEast"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = ["zeus_relations_friend", "Ind friendly to All", "", {["indAll"] call CGQC_fnc_setRelations}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options", "zeus_relations"], _action ] call ace_interact_menu_fnc_addActionToObject;



// ------ Zeus radios on/off
_action = [ "zeus_radios_on", "Zeus Radios: Turn On", "", {cgqc_config_zeusRadios = true;["zeus_radios", 0, player] spawn CGQC_fnc_perksZeus;}, {!cgqc_config_zeusRadios} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_radios_off", "Zeus Radios: Turn Off", "", {cgqc_config_zeusRadios = false}, {cgqc_config_zeusRadios }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Map Sharing Restriction
_action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Animation on/off
_action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Punching on/off
_action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;


// ------ GRAD Persistence
_action = [ "zeus_grad_persistence", "Persistence", "", {""}, {false} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "zeus_options"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_save", "Save Mission", "", { [true, 10] remoteExec ["grad_persistence_fnc_saveMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load", "Load Mission", "", {[] remoteExec ["grad_persistence_fnc_loadMission",2,false];}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_load_players", "LoadPlayers", "", {[] remoteExec ["grad_persistence_fnc_loadAllPlayers",2,false];}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_grad_clear", "Clear Data", "", {_x remoteExec ["grad_persistence_fnc_clearMissionData", 2]}, {true}] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions" ,"menu_self_zeus", "zeus_options", "zeus_grad_persistence"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------- Utils ----------------
_action = [ "menu_self_utils", "Utilities", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Check player mod versions
_action = [ "zeus_checkMods", "Check Player mods", "", {["check_mods", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 343
_action = [ "max_343", "get 343", "", {["343", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 152
_action = [ "max_152", "get 152", "", {["152", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get 117
_action = [ "max_117", "get 117f", "", {["117", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get Crate
_action = [ "zeus_getcrate", "Spawn: Arsenal mk3", "", {["crate", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus"], _action ] call ace_interact_menu_fnc_addActionToObject;
//  ------ Delete Crate
_action = [ "zeus_delcrate", "Delete Arsenal", "", {["del_crate", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_crate} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Get Cargo
_action = [ "zeus_getcargo", "get Cargo", "", {["cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
//  ------ Delete Cargo
_action = [ "zeus_delcargo", "delete Cargo", "", {["del_cargo", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_cargo} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
// ------ Export Loadout
_action = [ "zeus_export", "Tartget loadout to Clipboard", "", {[cursorTarget] call CGQC_fnc_loadoutToClipboard}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_export", "Self loadout to Clipboard", "", {[player] call CGQC_fnc_loadoutToClipboard}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Invincible
_action = [ "zeus_invincible", "God Mode", "", {["god", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_mortal", "God Mode->Off", "", {["mortal", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_god} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;

// ------ Invisible
_action = [ "zeus_invisible", "Turn Invisible", "", {["ghost", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "zeus_visible", "Invisible->Off", "", {["visible", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_zeus_ghost} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_zeus", "menu_self_utils"], _action ] call ace_interact_menu_fnc_addActionToObject;


// Other actions ================================================================================
// Actual Zeus mode perks ================================================================================
_action = [ "menu_zeus_trg", "CGQC Triggers", "CGQC\textures\cgqc_ace_zeus.paa", {""}, {false} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

_action = [ "menu_zeus_trg_1", "Activate 1", "", {hint "Trigger 1"}, {!isNil "cgqc_trg_1"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_2", "Activate 2", "", {hint "Trigger 2"}, {!isNil "cgqc_trg_2"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_3", "Activate 3", "", {hint "Trigger 3"}, {!isNil "cgqc_trg_3"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_4", "Activate 4", "", {hint "Trigger 4"}, {!isNil "cgqc_trg_4"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_5", "Activate 5", "", {hint "Trigger 5"}, {!isNil "cgqc_trg_5"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_6", "Activate 6", "", {hint "Trigger 6"}, {!isNil "cgqc_trg_6"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_7", "Activate 7", "", {hint "Trigger 7"}, {!isNil "cgqc_trg_7"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "menu_zeus_trg_8", "Activate 8", "", {hint "Trigger 8"}, {!isNil "cgqc_trg_8"} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "menu_zeus_trg"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// ------ Pause AI
_action = [ "zeus_pause", "Pause AI", "", {[0,{["pause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute}, {!(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused")} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_unpause", "Unpause AI", "", {[0,{["unpause", 0, ""] spawn CGQC_fnc_perksZeus}] call CBA_fnc_globalExecute;}, {(missionNamespace getVariable "CGQC_gamestate_mission_AIpaused")} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// ------ Delete all dead
_action = [ "zeus_delete", "Delete Dead", "", {["delete", 0, ""] spawn CGQC_fnc_perksZeus}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

// Options
_action = [ "zeus_options", "Zeus Options", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// Map Sharing Restriction
_action = [ "zeus_mapSharing_on", "MapSharing: Turn off", "", {["maprestrict", 0] spawn CGQC_fnc_perksZeus}, {!jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_mapSharing_off", "MapSharing: Turn on", "", {["mapshare", 0] spawn CGQC_fnc_perksZeus}, {jib_restrictmarkers_enabled} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// ------ Animation on/off
_action = [ "zeus_anim_on", "Animations: Turn off", "", {["animation_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!cgqc_mk2_animation_locked} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_anim_off", "Animations: Turn on", "", {["animation_off", 0, ""] spawn CGQC_fnc_perksZeus}, {cgqc_mk2_animation_locked }] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
// ------ Punching on/off
_action = [ "zeus_punch_on", "Punching: Turn On", "", {["punch_on", 0, ""] spawn CGQC_fnc_perksZeus}, {!BRIDGE_KPU_MasterSetting} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;
_action = [ "zeus_punch_off", "Punching: Turn Off", "", {["punch_off", 0, ""] spawn CGQC_fnc_perksZeus}, {BRIDGE_KPU_MasterSetting }] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_ZeusActions", "zeus_options"], _action ] call  ace_interact_menu_fnc_addActionToZeus;

/*
// Team management
_action = [ "CGQC_joinColor_red", "1-1 Rouge", "\z\ace\addons\interaction\UI\team\team_red_ca.paa", {['RED'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_Actions", "ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_green", "1-2 Vert", "\z\ace\addons\interaction\UI\team\team_green_ca.paa", {['GREEN'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_blue", "2-1 Bleu", "\z\ace\addons\interaction\UI\team\team_blue_ca.paa", {['BLUE'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_yellow", "2-2 Jaune", "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa", {['YELLOW'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinColor_leave", "HQ Blanc", "\z\ace\addons\interaction\UI\team\team_white_ca.paa", {['RED'] call CGQC_fnc_setTeamColors}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup", "Join/Create Group", "\z\ace\addons\interaction\UI\team\team_management_ca.paa", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_spartan", "Spartan", "", {['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_spartan_11", "1-1 Rouge", "\z\ace\addons\interaction\UI\team\team_red_ca.paa", {['Spartan', 'RED'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_12", "1-2 Vert", "\z\ace\addons\interaction\UI\team\team_green_ca.paa", {['Spartan', 'GREEN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_21", "2-1 Bleu", "\z\ace\addons\interaction\UI\team\team_blue_ca.paa", {['Spartan', 'BLUE'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_22", "2-2 Jaune", "\z\ace\addons\interaction\UI\team\team_yellow_ca.paa", {['Spartan', 'YELLOW'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_spartan_0", "0 - Blanc", "\z\ace\addons\interaction\UI\team\team_white_ca.paa", {['Spartan', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup', "CGQC_joinGroup_spartan"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "CGQC_joinGroup_hermes", "Hermes", "", {['Hermes', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_orion", "Orion", "", {['Orion', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_centaure", "Centaure", "", {['Centaure', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_griffon", "Griffon", "", {['Griffon', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_pegase", "Pegase", "", {['Pegase', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
_action = [ "CGQC_joinGroup_hq", "HQ", "", {['HQ', 'MAIN'] spawn CGQC_fnc_joinGroup}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ ["ACE_SelfActions", "ACE_TeamManagement", 'CGQC_joinGroup'], _action ] call  ace_interact_menu_fnc_addActionToObject;
*/

// Whistle ---------------------------------------------------------------------------------------------------------------
//_action = [ "menu_self_whistle", "Whistle", "\fox_whistle\ui\whistle.paa", {[player] call CGQC_fnc_whistle}, {!cgqc_player_chill} ] call ace_interact_menu_fnc_createAction;
//_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

LOG("[CGQC_INIT] --- addPerks done");