// --- openItem ----------------------------------------------------------
// Open item and put content on player 
_type = _this select 0;

_check = [];
_content = [];
_kit = "";
_txt = "";
_ammo = false;
_allItems = items player;
_allMags = magazines player;
_primaryMag = (primaryWeaponMagazine player) select 0;
_primaryMags = 0;
_handgunMag = (handgunMagazine player) select 0;
_handgunMags = 0;
_blood = [];

_bandage = {_x isEqualTo "ACE_fieldDressing" } count _allItems;
_epi ={_x isEqualTo "ACE_epinephrine" } count _allItems;
_morphine = {_x isEqualTo "ACE_morphine" } count _allItems;
_painkill = {_x isEqualTo "FF_Painkiller" } count _allItems;
_splint = {_x isEqualTo "ACE_splint" } count _allItems;
_tourniquet = {_x isEqualTo "ACE_tourniquet" } count _allItems;
_blood = ["ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250"] apply {toLower _x};
_liquids = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV", "ACE_bloodIV", "ACE_plasmaIV"] apply {toLower _x};
_1000ml = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV_500", "ACE_bloodIV_500", "ACE_plasmaIV_500"] apply {toLower _x};
_500ml = {(toLower _x) in _blood} count _allItems;
_blood = ["ACE_salineIV_250", "ACE_bloodIV_250", "ACE_plasmaIV_250"] apply {toLower _x};
_250ml = {(toLower _x) in _blood} count _allItems;
_medbag = {_x isEqualTo "FSGm_ItemMedicBag" } count _allItems;
_pak = {_x isEqualTo "ACE_personalAidKit" } count _allItems;

// Count Mag
if !(isNil "_primaryMag") then {
	_primaryMags = {_x isEqualTo _primaryMag } count _allMags;
};
if !(isNil "_handgunMag") then {
	_handgunMags = {_x isEqualTo _handgunMag } count _allMags;
};
_grenades = ["rhs_mag_m67", "HandGrenade"] apply {toLower _x};
_nade = {(toLower _x) in _grenades} count _allMags;
_flash = ["ACE_M84", "ACE_CTS9"]  apply {toLower _x};
_nadeFlash = {(toLower _x) in _flash} count _allMags;
_smoke = {_x isEqualTo "SmokeShell" } count _allMags;
_smoke_blue = {_x isEqualTo "SmokeShellBlue" } count _allMags;
_smoke_red = {_x isEqualTo "SmokeShellRed" } count _allMags;
_smoke_purple = {_x isEqualTo "SmokeShellPurple" } count _allMags;
_ir = {_x isEqualTo "B_IR_Grenade" } count _allMags;
//_secondaryMags = {_x isEqualTo _secondaryMag } count _allMags;
sleep 0.5;

switch (_type) do {
	case "ifak": { 
		player removeItem "cgqc_items_ifak";
		for "_i" from _bandage to 9 do {player addItem "ACE_fieldDressing"};
		for "_i" from _epi to 1 do {player addItem "ACE_epinephrine"};
		for "_i" from _morphine to 1 do {player addItem "ACE_morphine"};
		for "_i" from _painkill to 4 do {player addItem "FF_Painkiller"};
		for "_i" from _splint to 0 do {player addItem "ACE_splint"};
		for "_i" from _tourniquet to 1 do {player addItem "ACE_tourniquet"};
		for "_i" from _liquids to 1 do {player addItemToBackpack "ACE_salineIV_500"};
		hint "IFAK unpacked";
	};
	case "medkit": { 
		player removeItem "cgqc_items_medkit";
		for "_i" from _bandage to 49 do {player addItemToBackpack "ACE_fieldDressing"};
		for "_i" from _epi to 9 do {player addItemToBackpack "ACE_epinephrine"};
		for "_i" from _morphine to 9 do {player addItemToBackpack "ACE_morphine"};
		for "_i" from _painkill to 14 do {player addItemToBackpack "FF_Painkiller"};
		for "_i" from _splint to 1 do {player addItemToBackpack "ACE_splint"};
		for "_i" from _tourniquet to 3 do {player addItemToBackpack "ACE_tourniquet"};
		for "_i" from _1000ml to 4 do {player addItemToBackpack "ACE_salineIV"};
		for "_i" from _500ml to 7 do {player addItemToBackpack "ACE_salineIV_500"};
		for "_i" from _pak to 0 do {player addItemToBackpack "ACE_personalAidKit"};
		for "_i" from _smoke_purple to 1 do {player addItemToBackpack "SmokeShellPurple"};
		for "_i" from _medbag to 0 do {player addItemToBackpack "FSGm_ItemMedicBag"};
		hint "Medkit unpacked";
	};
	case "primary": { 
		player removeItem "cgqc_bandolier_ammo";
		// Throwables
		for "_i" from _nade to 1 do {player addItemToVest "HandGrenade"};
		for "_i" from _nadeFlash to 1 do {player addItemToVest "ACE_CTS9"};
		for "_i" from _smoke to 1 do {player addItemToVest "SmokeShell"};
		for "_i" from _smoke_blue to 0 do {player adaddItemToVestdItem "SmokeShellBlue"};
		for "_i" from _smoke_red to 0 do {player addIaddItemToVesttem "SmokeShellRed"};
		for "_i" from _ir to 0 do {player addItemToVest "B_IR_Grenade"};
		if !(isNil "_handgunMag") then {
			hint format ["HandgunMag: %1", _handgunMag];
			for "_i" from _handgunMags to (cgqc_config_sidearm_mag_nbr - 1) do {player addItemToVest _handgunMag};
		}else{hint "No Secondary weapon!";sleep 1;};
		if !(isNil "_primaryMag") then {
			hint format ["Mag: %1", _primaryMag];
			for "_i" from _primaryMags to (cgqc_setting_limitMags_max - 1) do {player addItemToVest _primaryMag};
		}else{hint "No primary weapon!";sleep 1;};
		hint "Ammo Bandolier unpacked";
	};
	default {hint "Erreur openItem" };
};

// Turn off msg
sleep 5;
hintSilent "";