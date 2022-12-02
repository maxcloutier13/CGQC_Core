cgqc_player_rank = 0;

// Prevent player input
disableUserInput true;

// Check if dynamic group is initialized
dynamic_group_check = ["IsInitialized"] call BIS_fnc_dynamicGroups;
if (!dynamic_group_check) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
};

// Add player to dynamic group 
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//Respawn handler 
player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];
	if (local _unit) then {
		_unit setUnitLoadout(_unit getVariable["Saved_Loadout",[]]); //Load loadout saved on death
		_unit enableStamina false; //Re-disable stamina, in-case 
		["InitializePlayer", [_unit]] call BIS_fnc_dynamicGroups;
		[ _unit, player_patch ] call BIS_fnc_setUnitInsignia; //Set insignia back
		hint "Check tes radios! Ça inverse parfois au respawn.";
	};
}];

//Death handler 
player addMPEventHandler ["MPKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (local _unit) then {
		_unit setVariable["Saved_Loadout",getUnitLoadout _unit];
		hint format ["Woops! tu t'es fait pèté par: %1", _killer];
		sleep 5;
	};
	
}];

//Maximum mags event handler 
_id = ["ace_arsenal_displayClosed", {
	spawn {execVm "\cgqc\factions\max_mags.sqf"};
}] call CBA_fnc_addEventHandler;

//Lock channels by default 
["init"] spawn {execVm "\cgqc\factions\channels_lock.sqf"};

//Sets radio channel names 
[0] spawn {execVm "\cgqc\factions\set_radios.sqf"};

// Boost dragging maximum 
ACE_maxWeightDrag = 3000;

//CGQC Info
// Add briefing to mission begin and map menu ("<br/>") == retour à la ligne (+) == Continuation du texte dans la même variable
_cgqc_info = (
	"<font size='26' color='#00CA1B'Rejoignez-nous!</font>" +"<br/>" +
	"<font size='20' color='#BDBDBD'>discord.gg/RCyRKWVG</font>" +"<br/>" +
	"<font size='20' color='#BDBDBD'>Teamspeak: ts.cgqc.ca</font>"
);
player createDiaryRecord ["Diary", ["CGQC", _cgqc_info]];
//player createDiaryRecord ["Diary", ["MK1", "Tentative de codifier un loadout standard pour simplifier la création de nos missions tout en offrant un haut niveau de détails pour les joueurs.</br>"]];

//Find rank
_name = name player;
_prefix = _name select[0, 4];
_unknown = 0;
switch (_prefix)
do
{
	case "Sdt.":
	{
		player setRank "PRIVATE";
		cgqc_player_rank = 1;
		//hint "Soldat";
	};
	case "Cpl.":
	{
		player setRank "CORPORAL";
		cgqc_player_rank = 2;
		//hint "Caporal";
	};
	case "CplC":
	{
		player setRank "CORPORAL";
		cgqc_player_rank = 3;
		//hint "Caporal-Chef";
	};
	case "Sgt.":
	{
		player setRank "SERGEANT";
		cgqc_player_rank = 4;
		//hint "Sergeant";
	};
	case "Adju":
	{
		player setRank "SERGEANT";
		cgqc_player_rank = 5;
		//hint "Adjudent";
	};
	case "SLt.":
	{
		player setRank "LIEUTENANT";
		cgqc_player_rank = 6;
		//hint "Sous-Lieutenant";
	};
	case "Lt. ":
	{
		player setRank "LIEUTENANT";
		cgqc_player_rank = 7;
		//hint "Lieutenant";
	};
	case "Capt":
	{
		player setRank "CAPTAIN";
		cgqc_player_rank = 8;
		//hint "Capitaine";
	};
	case "Maj.":
	{
		player setRank "MAJOR";
		cgqc_player_rank = 9;
		//hint "Major";
	};
	case "LCol":
	{
		player setRank "COLONEL";
		cgqc_player_rank = 10;
		//hint "Lieutenant-Colonel";
	};
	case "Col.":
	{
		player setRank "COLONEL";
		cgqc_player_rank = 11;
		//hint "Colonel";
	};
	default
	{
		_unknown = 1;
		player setRank "PRIVATE";
		_text = ("<br/>" + "<t size='2' >Bonsoir, Visiteur!</t>" +
		"<br/>" + "<t size='1' >Joint nous sur teamspeak: ts.cgqc.ca</t>" +
		"<br/>" + "<t size='1' >discord.gg/RCyRKWVG</t>");
		[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
		sleep 6;
	};
};
// random welcome
_welcome_list = ["Yo", "R’gard", "Allo", "Hello", "Ooooh", "Coucou", "Bonsoir", "Konnichiwa"];
_message_list = ["what's up?", "what's up buddy?", "Time to fuck shit up", "Asti que t'es beau", 
"Ça roule ma poule?", "As-tu couché ta blonde?", "BAN dans 3,2,1...", "Prêt à répandre la démocratie dans l'monde?"];
_welcome = selectRandom _welcome_list;
_message = selectRandom _message_list;
// default text and patch ------------------------------------------------------------------------------------------
_text = (format["<t size='2' >Bonjour %1</t><br/><t>what's up?</t>", _name]);
if (_unknown == 0) then {
	// default patch pour les joueurs qui en ont pas de custom
	player_patch = "cgqc_patch_logo";
} else {
	// Patch pour les outsiders
	player_patch ="cgqc_patch_outsider";
};

// Assign patch based on name  ------------------------------------------------------------------------------------
if ((_name find["Audi", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_audi.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Audi!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_audi";
};

if ((_name find["Braddock", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_braddock.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Mafia!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_braddock";
};

if ((_name find["Cloutier", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:bottom' shadow='false' image='\cgqc\patches\cgqc_patch_cloutier.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Cloutier!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_cloutier";
	#include "init_cloutier.sqf"
};

if ((_name find["Comeau", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_comeau.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Comeau!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_comeau";
};

if ((_name find["Fortin", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_fortin.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Dogo!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_fortin";
};

if ((_name find["Frechette", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_frechette.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Frechette!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_frechette";
};

if ((_name find["Genest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_genest.paa'/>" +
	"<br/>" + format["<t size='2' >%1 ptit Beurre!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_genest";
};

if ((_name find["Laforest", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_laforest.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Frog!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_laforest";
	
};

if ((_name find["Pinard", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_pinard.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Pinard!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_pinard";
};

if ((_name find["Tremblay", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_tremblay.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Tremblay!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_tremblay";
};

if ((_name find["Villeneuve", 0]) > 0) then {
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_villeneuve.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Logic!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_villeneuve";
};

if ((_name find["Woods", 0]) > 0) then {
	hint "woods?";
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_woods.paa'/>" +
	"<br/>" + format["<t size='2' >%1 XiPoWnZX!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_woods";
};

if ((_name find["Melo", 0]) > 0) then {
	hint "woods?";
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_monolith_2.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Melo!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_monolith_2";
};

if ((_name find["Turcotte", 0]) > 0) then {
	hint "woods?";
	_text = ("<img size= '6' style='vertical-align:middle' shadow='false' image='\cgqc\patches\cgqc_patch_turcotte.paa'/>" +
	"<br/>" + format["<t size='2' >%1 Dewark!</t><br/><t>%2</t>", _welcome, _message]);
	player_patch = "cgqc_patch_turcotte";
};

//Set the patch 
[ player, player_patch ] call BIS_fnc_setUnitInsignia;

// Fix pour le friendly fire
player addEventHandler [
    "HandleRating",
    {
        params["_player", "_rating"];
        _return = _rating;
        if(rating _player < 0) then {
			hint "Méchant garçon!";
            _return = abs rating _player;
        } else {
            if(_rating + rating _player < 0) then {
				hintSilent "Woops!!!!";
                _return = 0;
            };
        };
        _return
    }
];

// Ace self interaction for players
// --- Ace actions ---------------------------------------------------------------------------------------------------------
_action = [ "menu_self_cgqc", "CGQC Perks", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set patch 
_action = [ "menu_self_patch", "Remettre ta patch personelle", "", {["patch"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions","menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;

// Radios ---------------------------------------------------------------------------------------------------------------
_action = [ "menu_self_radios", "Presets", "CGQC\textures\cgqc_ace_icon", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc"], _action ] call  ace_interact_menu_fnc_addActionToObject;
// Set radios sides
_action = [ "self_radio1", "SetRadio: Gauche/Droite", "", {["radio_sides"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Set radio roles ---------------------------------------------------------------------------------------------------------------
// Spartan 1
_action = [ "menu_self_spartan1", "Spartan 1", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan1", "343", "", {["spartan", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_2", "343+152", "", {["spartan_2", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan1_1", "Team Leader", "", {["spartan_1", 1] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan1"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Spartan 2
_action = [ "menu_self_spartan2", "Spartan 2", "", {""}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call  ace_interact_menu_fnc_addActionToObject;

_action = [ "self_radio_spartan2", "343", "", {["spartan", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_2", "343+152", "", {["spartan2", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;
_action = [ "self_radio_spartan2_1", "Team Leader", "", {["spartan1", 2] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios", "menu_self_spartan2"], _action ] call ace_interact_menu_fnc_addActionToObject;

// Centaure
_action = [ "self_radio_centaure", "Centaure/Blindés", "", {["centaure"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// Griffon
_action = [ "self_radio_griffon", "Griffon/Heli", "", {["griffon"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// JTAC
_action = [ "self_radio_jtac", "JTAC", "", {["jtac"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;
// HQ
_action = [ "self_radio_hq", "HQ Mobile", "", {["hq"] execVM "\cgqc\factions\stuff_player.sqf"}, {true} ] call ace_interact_menu_fnc_createAction;
_adding = [ player, 1, ["ACE_SelfActions", "menu_self_cgqc", "menu_self_radios"], _action ] call ace_interact_menu_fnc_addActionToObject;

//Set some variables from description.ext? 
author = cgqc_config_author;                                             
onLoadName = cgqc_config_mission_name; 
//briefingName = cgqc_config_mission_name;
// ----------------------------------------------------------------------
// Tu peux changer ceci si tu as des screenshots customs
// Custom images
loadScreen = "textures\loading_screen_1.paa";
overviewPicture = "textures\BG1.paa";

// Zeus shenanigans... MAX - to review
// Only run on clients, excluding HCs
[] spawn {
	// Delay until the server time has sync'd
	waitUntil {
		time > 5
	};
	// for JIP, wait until the main screen loads
	waitUntil {
		!isNull (findDisplay 46)
	};
	// Check if player name contains the word "Zeus"
	if (["zeus", format["%1", player]] call BIS_fnc_inString) then {
		_checkIfValidCuratorSlot = {
			private _curatorList = _this;

			// Check that Zeus has been assigned to player
			if (isNull (getAssignedCuratorLogic player)) then {
				private _exitLoop = false;
				{
					// find an unassigned Zeus slot and assign it to the player
					if (isNull (getAssignedCuratorUnit _x)) then {
						[player, _x] remoteExecCall ["assignCurator", 2];
						sleep 2.0;
						// Check if a valid Zeus slot
						if (isNull (getAssignedCuratorLogic player)) then {
							// Broken Zeus slot, so clear and repeat
							_x remoteExecCall ["unassignCurator", 2];
							sleep 2.0;
						} else {
							hint format["Zeus assigned to curator %1", _x];
							_exitLoop = true;
						};
					};
					if (_exitLoop) exitWith {};
				} forEach _curatorList;
			};
		};

		// find all curators and reverse list so to lessen chance of admin Zeus conflicts
		private _curatorList = allCurators;
		reverse _curatorList;

		// Check that Zeus has been initially assigned to player
		_curatorList call _checkIfValidCuratorSlot;

		// Ensure Zeus keeps slot, despite admin logging
		while { true } do {
			// Check that Zeus has been assigned to player
			_curatorList call _checkIfValidCuratorSlot;

			sleep 10.0;
		};
	};
};

// Lower gun 
player action ['SwitchWeapon', player, player, 100];

// Return controls
disableUserInput false;
sleep 3;
// Set default left/right radios
["radio_sides"] execVM "\cgqc\factions\stuff_player.sqf";
// Show text and patch ------------------------------------------------------------------------------------
sleep 20;
[ _text, 0, 0, 3, 2 ] spawn BIS_fnc_dynamicText;
cgqc_player_init = 1;
sleep 5;

