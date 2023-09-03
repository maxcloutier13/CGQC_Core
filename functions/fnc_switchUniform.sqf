// --- switchUniform ----------------------------------------------------------
// Switch player uniform
params ["_camo", "_fromLoadout"];
diag_log "[CGQC_FNC] switchUniform started";

// Transition/text
if !(_fromLoadout) then {
	// Fade to black transition with text
	[_camo, true] call CGQC_fnc_showTransition;
};

[_camo, _fromLoadout] spawn {
	params ["_camo", "_fromLoadout"];
	cgqc_camoSwitch_done = false;
	_text = "";
	_skip = false;
	_skip_msg = "";

	disableUserInput true;
	// Check if player in chill mode
	if (cgqc_player_chill) then {["ready", true] call CGQC_fnc_perksBasic;};
	// Init new variables
	_helmet_new = "";
	_uniform_new = "";
	_vest_new = "";
	_backpack_new = "";
	_goggles_new = "";

	// Find what to switch to
	switch (_camo) do {
		case "diver": //Diver time
		{
			if ((uniform player find["diver", 0]) > 0 || (uniform player find["wetsuit", 0]) > 0) then {
				_skip = true;
				_skip_msg = "T'as déja un suit de diver, dummy! Skipping.";
			};
			if (_skip) then {
				// Reset everything as it was...
				_helmet_new = player_helmet_old;
				_uniform_new = player_uniform_old;
				_vest_new = player_vest_old;
				_backpack_new = player_backpack_old;
				_goggles_new = player_goggles_old;
				[_skip_msg, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
			}else{//Keep proceeding
				["prep"] call CGQC_fnc_switchStuff;
				// Diving suit
				_uniform_new = "cgqc_uniform_mk1_diver";
				if (cgqc_player_has2023) then{
					// Rebreather
					_vest_new = "cgqc_vest_mk1_diver";
					//hint "Rebreather";
					// Black backpack
					player_backpack_old = toLower player_backpack_old;
					if ((player_backpack_old find["radiobag", 0]) > 0) then {_backpack_new = "cgqc_pack_mk1_radiobag_black";};
					if ((player_backpack_old find["assault", 0]) > 0) then {_backpack_new = "cgqc_pack_mk1_assault_black";};
					if ((player_backpack_old find["carryall", 0]) > 0) then {_backpack_new = "cgqc_pack_mk1_carryall_black";};
					if ((player_backpack_old find["kitbag", 0]) > 0) then {_backpack_new = "cgqc_pack_mk1_kitbag_black";};
					if ((player_backpack_old find["magic", 0]) > 0) then {_backpack_new = "cgqc_pack_mk1_magic";};
					//hint "Black backpacks";
				} else{ // Default stuff
					_vest_new = player_vest_old;
					_backpack_new = "cgqc_backpack_mk1_diver";
					//hint "Diving bottle";
				};
				// goggles
				_goggles_new = "cgqc_goggles_mk1_diver";
				//hint "Diving Goggles";
				// Keep old mask in backpack
				player addItemToBackpack player_goggles_old;
				// Add diver perks
				cgqc_perks_diver = true;
				cgqc_perks_diver_suit_on = true;
			};
		};
		case "para": //Paradrop time
		{
			// Check if backpack is parachute. Skip if it is.
			if ([player] call bocr_main_fnc_chestpack != "") then {
				_skip = true;
				_skip_msg = parseText ("<br/>" + "<br/>" + "<br/>" + "<br/>" + "T'as déja un backpack sur ton chest!"+ "<br/>" + "Skipping.");
			};
			if ((backpack player find["chute", 0]) > 0) then {
				_skip = true;
				_skip_msg = parseText ("<br/>" + "<br/>" + "<br/>" + "<br/>" + "T'as déja un parachute, dummy!" + "<br/>" + "Arrange toi tout seul.");
			};
			if(_skip) then {
				[_skip_msg, 0, 0, 2, 2] spawn BIS_fnc_dynamicText;
			}else{//Keep proceeding
				["prep"] call CGQC_fnc_switchStuff;
				// Keep uniform
				_uniform_new = player_uniform_old;
				// Keep Vest
				_vest_new = player_vest_old;
				// Switch to mask
				_goggles_new = "cgqc_goggles_mk1_para";
				//hint "Jump Mask";
				// Add Paradrop perks
				cgqc_perks_para = true;
				// Add old backpack on chest
				player addBackpack player_backpack_old;
				{player addItemToBackpack _x} forEach player_items_pack;
				// Keep old mask in backpack
				player addItemToBackpack player_goggles_old;
				// Watch / Altimeter
				_items = assignedItems player;
				_current_watch = _items select 2;
				if (_current_watch == "ItemWatch") then {player linkItem "ACE_Altimeter";};
				[player] call bocr_main_fnc_actionOnChest;
				//hint "Backpack on Chest";
				// Parachute
				_backpack_new  = "B_Parachute";
				// Icon Indicator
				[] spawn {
					// Paradrop
					while {cgqc_perks_para} do {
						[format["<img size= '1' style='vertical-align:bottom' shadow='false' image='\cgqc\textures\cgqc_ace_para.paa'/>"]
						, 1.05, 0.2, 3, 2] spawn BIS_fnc_dynamicText;
						sleep 3;
					};
				};
				//hint "Parachute";
				hint parseText ("Prêt à sauter" + "<br/>" + "Ace Self-Action->Drop Parachute" + "<br/>" + "une fois au sol...");
			};
		};
		default // Normal camo switch
		{
			["prep"] call CGQC_fnc_switchStuff;
			// Backpack type first
			_backpack_new = "cgqc_pack_mk1";
			// goggles
			_goggles_new = player_goggles_old;
			// Check backpack variant
			player_backpack_old = toLower player_backpack_old;
			if ((player_backpack_old find["radiobag", 0]) > 0) then {_backpack_new = _backpack_new + "_radiobag";};
			if ((player_backpack_old find["assault", 0]) > 0) then {_backpack_new = _backpack_new + "_assault";};
			if ((player_backpack_old find["carryall", 0]) > 0) then {	_backpack_new = _backpack_new + "_carryall";};
			if ((player_backpack_old find["kitbag", 0]) > 0) then {	_backpack_new = _backpack_new + "_kitbag";};
			if ((player_backpack_old find["magic", 0]) > 0) then {	_backpack_new = _backpack_new + "_magic";};

			// Sets base names
			if (_camo == "tan") then {
				_helmet_new = "cgqc_helmet_mk1";
				_uniform_new = "cgqc_uniform_mk1";
				_vest_new = "cgqc_vest_mk1_" + _camo;
			} else {
				_helmet_new = "cgqc_helmet_mk1_" + _camo;
				_uniform_new = "cgqc_uniform_mk1_" + _camo;
				_vest_new = "cgqc_vest_mk1_" + _camo;
				_backpack_new = _backpack_new + "_" + _camo;
			};

			// ------- Helmet -------------------------------------------------------------------------------
			if ((player_helmet_old find["_medic", 0]) > 0) then {
				_helmet_new = _helmet_new + "_medic";
			};
			// ------- vest -------------------------------------------------------------------------------
			if ((player_vest_old find["_ar", 0]) > 0) then {
				_vest_new = _vest_new + "_ar";
			};
			if ((player_vest_old find["_lr", 0]) > 0) then {
				_vest_new = _vest_new + "_lr";
			};
			if ((player_vest_old find["_rf", 0]) > 0) then {
				_vest_new = _vest_new + "_rf";
			};
		};
	};

	if !(_skip) then {
		// ------- Add stuff ----------------------------------------------------------------------------
		// Add selected uniform
		player addHeadgear _helmet_new;
		player forceAddUniform _uniform_new;
		player addVest _vest_new;
		player addBackpack _backpack_new;
		player addGoggles _goggles_new;

		// Check that equiment switch worked
		check_helmet = headgear player;
		check_uniform = uniform player;
		check_vest = vest player;
		check_backpack = backpack player;
		check_goggles = goggles player;
		if (check_helmet == "") then {player addHeadgear player_helmet_old;};
		if (check_uniform == "") then {player forceAddUniform player_uniform_old;};
		if (check_vest == "") then {player addVest player_vest_old;};
		if (check_backpack == "") then {player addBackpack player_backpack_old;};
		if (check_goggles == "") then {player addGoggles player_goggles_old;};

		// Flush potential leftovers
		clearAllItemsFromBackpack player;

		// load items in new uniform
		{player addItemToUniform _x} forEach player_items_uniform;
		{player addItemToVest _x} forEach player_items_vest;
		{player addItemToBackpack _x} forEach player_items_pack;
	};

	// Set back patch
	player setVariable ["BIS_fnc_setUnitInsignia_class", nil]; //Remove patch
	[ player, cgqc_player_patch ] call BIS_fnc_setUnitInsignia;

	// Lower gun
	_holster = [] spawn CGQC_fnc_holsterWeapons;
	// Return control
	disableUserInput false;
	if (userInputDisabled) then {disableUserInput false;};
	// Done
	cgqc_camoSwitch_done = true;
	diag_log "[CGQC_FNC] switchUniform done";
};