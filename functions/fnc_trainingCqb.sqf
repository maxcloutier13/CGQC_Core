// --- trainingCqb ----------------------------------------------------------
// Cqb shenanigans
_type = _this select 0;

switch (_type) do {
	case 0: {cgqc_cqb_on = false};
	case 1: {cgqc_cqb_hostile_class = ["rhsgref_tla_warlord"];break;};
	case 2: {cgqc_cqb_hostile_class = ["O_G_Soldier_TL_F", "O_G_Soldier_SL_F", "O_G_officer_F"];break;};
	case 3: {cgqc_cqb_hostile_class = ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F"];break;};
	case 4: {cgqc_cqb_hostile_class = ["DSF_WAG_TeamLeader", "DSF_WAG_SquadLeader", "DSF_WAG_Rifleman_Lite", "DSF_WAG_Rifleman", "DSF_WAG_Repair", "DSF_WAG_Officer", "DSF_WAG_Marksman", "DSF_WAG_Explosives", "DSF_WAG_Engineer", "DSF_WAG_Medic", "DSF_WAG_AutomaticRifleman"];break;};
	case 5: {cgqc_cqb_hostile_class = ["O_Soldier_F", "O_Soldier_SL_F", "O_Soldier_TL_F"];break;};
	case 6: {cgqc_cqb_hostile_class = ["O_V_Soldier_TL_hex_F", "O_V_Soldier_hex_F"];break;};
	case 7: {cgqc_cqb_hostile_class = ["O_GEN_Soldier_F", "O_GEN_Commander_F"];break;};
	case 8: {cgqc_cqb_hostile_class = ["O_R_recon_TL_F", "O_R_recon_exp_F", "O_R_Patrol_Soldier_Medic"];break;};
	case 9: {cgqc_cqb_hostile_class = ["I_E_Soldier_F", "I_E_Soldier_lite_F", "I_E_Soldier_SL_F", "I_E_Officer_F", "I_E_Medic_F"];break;};
	case 10: {cgqc_cqb_hostile_class = ["I_L_Criminal_SG_F", "I_L_Criminal_SMG_F", "I_L_Looter_Rifle_F", "I_L_Looter_Pistol_F", "I_L_Looter_SG_F", "I_L_Looter_SMG_F"];break;};
	case 11: {cgqc_cqb_hostile_class = ["I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_4_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_1_F"];break;};
	case 12: {cgqc_cqb_hostile_class = ["I_Soldier_TL_F", "I_Soldier_SL_F", "I_Soldier_lite_F", "I_soldier_F", "I_officer_F", "I_Soldier_M_F", "I_support_Mort_F", "I_medic_F", "I_Soldier_A_F"];break;};
	case 13: {cgqc_cqb_hostile_class = ["rhs_vdv_sergeant", "rhs_vdv_rifleman", "rhs_vdv_officer_armored", "rhs_vdv_engineer", "rhs_vdv_arifleman_rpk", "rhs_vdv_rifleman_asval", "rhs_vdv_medic"];break;};
	case 14: {cgqc_cqb_hostile_class = ["DSF_LDPR_ATSoldier", "DSF_LDPR_TeamLeader", "DSF_LDPR_SquadLeader", "DSF_LDPR_Rifleman", "DSF_LDPR_Rifleman_Lite", "DSF_LDPR_Officer", "DSF_LDPR_Engineer", "DSF_LDPR_Medic", "DSF_LDPR_AutomaticRifleman"];break;};
	case 15: {cgqc_cqb_hostile_class = ["DSF_HAMAS_AutomaticRifleman","DSF_HAMAS_Medic", "DSF_HAMAS_Engineer", "DSF_HAMAS_Marksman", "DSF_HAMAS_Officer", "DSF_HAMAS_Repair", "DSF_HAMAS_Rifleman", "DSF_HAMAS_Rifleman_Lite", "DSF_HAMAS_SquadLeader", "DSF_HAMAS_TeamLeader"];break;};
	case 16: {cgqc_cqb_hostile_class = ["UK3CB_ION_O_Urban_SF_TL", "UK3CB_ION_O_Urban_SF_SPOT", "UK3CB_ION_O_Urban_SF_SL", "UK3CB_ION_O_Urban_SF_RIF_3", "UK3CB_ION_O_Urban_SF_RIF_4", "UK3CB_ION_O_Urban_SF_RIF_2", "UK3CB_ION_O_Urban_SF_ENG", "UK3CB_ION_O_Urban_SF_AR"];};
	case 17: {cgqc_cqb_hostile_class = ["DSF_ISIS_AutomaticRifleman", "DSF_ISIS_Medic", "DSF_ISIS_Engineer", "DSF_ISIS_HVT", "DSF_ISIS_MachineGunner", "DSF_ISIS_Marksman", "DSF_ISIS_Officer", "DSF_ISIS_Rifleman", "DSF_ISIS_Rifleman_Lite", "DSF_ISIS_SquadLeader", "DSF_ISIS_TeamLeader"];break;};
	case 18: {cgqc_cqb_hostile_class = ["DSF_CART_TeamLeader", "DSF_CART_SquadLeader", "DSF_CART_Sicario", "DSF_CART_Rifleman_SPAR", "DSF_CART_Rifleman_Lite", "DSF_CART_Rifleman", "DSF_CART_Marksman", "DSF_CART_Officer", "DSF_CART_FalconSMG", "DSF_CART_FalconRifle", "DSF_CART_Medic", "DSF_CART_BodyGuard"];break;};
	// Vietnam
	case 19: {cgqc_cqb_hostile_class = cgqc_pax_opfor_squad;break;};
	// Scandinavia
	case 20: {cgqc_cqb_hostile_class = cgqc_pax_opfor_squad;break;};
	// WW2
	case 21: {cgqc_cqb_hostile_class = cgqc_pax_opfor_squad;break;};
	case 40: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr + 5; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 41: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr - 5; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 42: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr + 10; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 43: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr - 10; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 44: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr + 20; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 45: {cgqc_cqb_target_nbr = cgqc_cqb_target_nbr - 20; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};

	case 46: {cgqc_cqb_target_nbr = selectRandom [10,12,15,17,19,20]; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 47: {cgqc_cqb_target_nbr = selectRandom [20,22,25,27,29,30]; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};
	case 48: {cgqc_cqb_target_nbr = selectRandom [30,32,35,37,40,42,45,47,50]; hint format["Targets:%1",cgqc_cqb_target_nbr];break;};

	case 50: {cgqc_cqb_move = 0; hint "No movement";break;};//Movement
	case 51: {cgqc_cqb_move = 1; hint "10% move";break;};
	case 52: {cgqc_cqb_move = 2; hint "25% move";break;};
	case 53: {cgqc_cqb_move = 3; hint "50% move";break;};
	case 54: {cgqc_cqb_move = 4; hint "75% move";break;};
	case 55: {cgqc_cqb_move = 5; hint "Random move";break;};
	case 60: {cgqc_cqb_civ = true; hint "Civilian present";break;};//Civ presence
	case 61: {cgqc_cqb_civ = false; hint "No Civs";break;};
	case 62: {cgqc_cqb_nade = true; hint "Grenades: On";break;};
	case 63: {cgqc_cqb_nade = false; hint "Grenades: Off";break;};
	case 70: {cgqc_cqb_timer = 0; hint "No Release";break;};
	case 71: {cgqc_cqb_timer = cgqc_cqb_timer + 30; hint format["Time until release:%1secs",cgqc_cqb_timer];break;};
	case 72: {cgqc_cqb_timer = cgqc_cqb_timer - 30; hint format["Time until release:%1secs",cgqc_cqb_timer];break;};
	case 73: {cgqc_cqb_timer = cgqc_cqb_timer + 60; hint format["Time until release:%1secs",cgqc_cqb_timer];break;};
	case 74: {cgqc_cqb_timer = cgqc_cqb_timer - 60; hint format["Time until release:%1secs",cgqc_cqb_timer];break;};
	case 75: {cgqc_cqb_timer = 10; cgqc_cqb_timer_random = true; hint "Time until release:Random";break;};
	
	default {
		hint "trainingCqb error";
	};
};

if (_type < 40) then {
	{deleteVehicle _x;} forEach cgqc_cqb_list;
	{deleteVehicle _x;} forEach cgqc_cqb_list_civ;
	{deleteVehicle _x;} forEach allDead;
	{deleteVehicle _x;} forEach nearestObjects [getpos player, ["WeaponHolder", "GroundWeaponHolder"], 100];
	cgqc_cqb_list = [];
	cgqc_cqb_list_static = [];
	cgqc_cqb_list_moving = [];
	cgqc_cqb_list_civ = [];
	cgqc_cqb_tgt_static = 0;
	cgqc_cqb_tgt_move = 0;
	cgqc_cqb_tgt_civ = 0;
	if (_type >0) then {
		_building = nearestBuilding player; // Replace player with the unit you want to search for buildings near
		//Close all doors
		for "_i" from 1 to 22 do { 
			[_building, _i, 0] call BIS_fnc_door;
		};
		_positions = [_building] call BIS_fnc_buildingPositions;
		// Create Group for unit & set behavior
		_unit_group = createGroup [east, true];
		_unit_group setBehaviour "SAFE";
		_civ_group = createGroup [civilian, true];
		cgqc_cqb_list = [];
		for "_i" from 1 to cgqc_cqb_target_nbr do { 
			// Pick random position
			_random_pos = selectRandom _positions;
			_positions = _positions - _random_pos;
			_spawn_class = selectRandom cgqc_cqb_hostile_class;
			_unit = _unit_group createUnit [_spawn_class, _random_pos, [], 0, "CAN_COLLIDE"];
			if (_type == 2) then {
				_unit removeWeapon (primaryWeapon _unit);
			};
			doStop _unit;
			_move = 0;
			if (cgqc_cqb_move == 5) then {
				cgqc_cqb_move = selectRandom [1,2,3,4];
			};
			switch (cgqc_cqb_move) do {
				case 0: {_move = 0};
				case 1: {_move = selectRandom [0,0,0,0,0,0,0,0,0,1];};
				case 2: {_move = selectRandom [0,0,0,1];};
				case 3: {_move = selectRandom [0,1];};
				case 4: {_move = selectRandom [0,1,1];};
				default {
					hint "cgqc_cqb_move error";
				};
			};
			// Sets unit as moving or not
			if (_move == 0) then {
				_unit disableAI "PATH";
				cgqc_cqb_tgt_static = cgqc_cqb_tgt_static + 1;
				cgqc_cqb_list_static pushBack _unit;
			}else{
				cgqc_cqb_tgt_move = cgqc_cqb_tgt_move + 1;
				cgqc_cqb_list_moving pushBack _unit;
			};
			if !(cgqc_cqb_nade) then {
				// Remove grenades
				_unit removeMagazines "HandGrenade";
				_unit removeMagazines "MiniGrenade";
				_unit removeMagazines "rhs_mag_m67";
			};
			// Killed EventHandler 
			_unit addEventHandler ["Killed", {
				params ["_unit", "_killer"];
				cgqc_cqb_list = cgqc_cqb_list - [_unit];
				cgqc_cqb_list_moving = cgqc_cqb_list_moving - [_unit];
				cgqc_cqb_list_static = cgqc_cqb_list_static - [_unit];
				_left = count cgqc_cqb_list;
				//systemChat format ["%1 killed by %2. %3 left", typeOf _unit, name _killer, _left];
				//cgqc_cqb_list = cgqc_cqb_list - _unit;
				if (_left < 1) then {
					cgqc_cqb_on = false;
				};
			}];
			cgqc_cqb_list pushBack _unit;
			sleep 0.1;
		};
		if (cgqc_cqb_civ) then {
			_civ_nbr = selectRandom [1,2,3];
			for "_i" from 1 to _civ_nbr do {
				// Pick random position
				_random_pos = selectRandom _positions;
				_positions = _positions - _random_pos;
				_spawn_class = selectRandom cgqc_cqb_civ_class;
				_unit = _civ_group createUnit [_spawn_class, _random_pos, [], 0, "CAN_COLLIDE"];
				_unit disableAI "PATH";
				_unit setUnitPos "UP";
				cgqc_cqb_tgt_civ = cgqc_cqb_tgt_civ + 1;
				// Killed EventHandler 
				_unit addEventHandler ["Killed", {
					params ["_unit", "_killer"];
					cgqc_cqb_list_civ = cgqc_cqb_list_civ - [_unit];
					_txt = format["Civilian DOWN! killed by %1!!!!!!!!", name _killer];
					systemChat _txt;
				}];
				cgqc_cqb_list_civ pushBack _unit;
			};
		};
		_txt = parseText format["-- Ready to go --"  + "<br/>" + "Total Units: %1" + "<br/>" + "Moving: %2" + "<br/>" + "Static: %3" + "<br/>" + "Civ: %4", count cgqc_cqb_list,cgqc_cqb_tgt_move,cgqc_cqb_tgt_static,cgqc_cqb_tgt_civ]; 
		hint _txt;
		[side player, "task_cqb", [format["Enter and clear building. Kill the %1 PAX", count cgqc_cqb_list], format["CQB: Kill the %1 PAX",count cgqc_cqb_list], ""], getPos _building, "ASSIGNED", 1, true, "CT_SECURE", true] call BIS_fnc_taskCreate;
		cgqc_cqb_on = true;
		while {cgqc_cqb_on} do {
			if (cgqc_cqb_timer > 0) then {
					if (cgqc_cqb_timer_random) then {
						//cgqc_cqb_timer = selectRandom [5,10,15,20,30];
						cgqc_cqb_timer = selectRandom [5,10,15,20,30,60,90,120,180,240,300,360];
					};
					sleep cgqc_cqb_timer;
					if (count cgqc_cqb_list_static > 0) then {
						_random_pax = selectRandom cgqc_cqb_list_static;
						cgqc_cqb_list_static = cgqc_cqb_list_static - [_random_pax];
						cgqc_cqb_list_moving pushBack _random_pax;
						_random_pax enableAI "PATH";
						systemChat format ["%1 started moving", typeOf _random_pax]; 
					}
			}else{
				sleep 10;
			};
		};
		//CQB is off 
		// Check if succeeded 
		if (count cgqc_cqb_list < 1) then 
		{
			//Win
			["task_cqb", "SUCCEEDED", true] call BIS_fnc_taskSetState;
			sleep 10;
		}else{
			//Lose
			["task_cqb", "CANCELED", true] call BIS_fnc_taskSetState;
		};
		["task_cqb", true, true] call BIS_fnc_deleteTask;
	};
};