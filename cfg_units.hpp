class B_Soldier_f;
// Basic soldier --------------------------------
class CGQC_Soldat_Base : B_Soldier_f
{
	author = "silent1";
	faction = "CGQC";
	editorSubcategory = "EdSubcat_cgqc_Training";
	side = 1;
	displayName = "Soldat (Base)";
	uniformClass = "cgqc_uniform_mk1";
	hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
	weapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	respawnWeapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	items[] = {
		"ACRE_PRC343", "ACRE_PRC152", "acex_intelitems_notepad", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_epinephrine", "ACE_epinephrine", "ACE_EarPlugs", "ACE_morphine", "ACE_morphine",
		"ACE_splint", "ACE_tourniquet", "ACE_tourniquet", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		"ACE_IR_Strobe_Item", "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {
		"ACRE_PRC343", "ACRE_PRC152", "acex_intelitems_notepad", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_epinephrine", "ACE_epinephrine", "ACE_EarPlugs", "ACE_morphine", "ACE_morphine",
		"ACE_splint", "ACE_tourniquet", "ACE_tourniquet", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		"ACE_IR_Strobe_Item", "ACE_microDAGR", "WBK_HeadLampItem"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	respawnMagazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_rangefinder", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	backpack = "cgqc_pack_mk1_magic";
	editorPreview = "cgqc\pics\cgqc_soldat_base.jpg";
	class EventHandlers {
        //init = "[] spawn CGQC_fnc_initTraining";
    };
};
class CGQC_Officer_Base : B_Soldier_f
{
	author = "silent1";
	faction = "CGQC";
	editorSubcategory = "EdSubcat_cgqc_Training";
	side = 1;
	displayName = "Officier (Base)";
	attendant = 1;
	canDeactivateMines = 1;
	engineer = 1;
	detectSkill = 31;
	uniformClass = "cgqc_uniform_mk1_rolled";
	hiddenSelections[] = {"Camo","insignia"};
	hiddenSelectionsTextures[] = {"cgqc\uniforms\cgqc_uniform_green.paa"};
	weapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	respawnWeapons[] = {"Rangefinder", "cgqc_gun_p99_wood", "Put", "Throw"};
	items[] = {
		"ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152", "acex_intelitems_notepad", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_epinephrine", "ACE_epinephrine", "ACE_EarPlugs", "ACE_morphine", "ACE_morphine",
		"ACE_splint", "ACE_tourniquet", "ACE_tourniquet", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		"ACE_IR_Strobe_Item", "ACE_microDAGR", "WBK_HeadLampItem"};
	respawnItems[] = {
		"ACRE_PRC343", "ACRE_PRC152", "ACRE_PRC152", "acex_intelitems_notepad", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing", "ACE_fieldDressing",
		"ACE_fieldDressing", "ACE_epinephrine", "ACE_epinephrine", "ACE_EarPlugs", "ACE_morphine", "ACE_morphine",
		"ACE_splint", "ACE_tourniquet", "ACE_tourniquet", "ACE_CableTie", "ACE_CableTie", "ACE_MapTools",
		"ACE_IR_Strobe_Item", "ACE_microDAGR", "WBK_HeadLampItem"};
	magazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	respawnMagazines[] = {"16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "16Rnd_9x21_Mag"};
	linkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_laserdesignator", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	respawnLinkedItems[] = {"ItemMap", "ItemCompass", "ItemWatch", "ItemGPS", "cgqc_item_laserdesignator", "cgqc_cap_green", "V_Rangemaster_belt", "None"};
	backpack = "cgqc_pack_mk1_magic";
	editorPreview = "cgqc\pics\cgqc_officer_base.jpg";
	class EventHandlers {
        //init = "[] spawn CGQC_fnc_initTraining";
    };
};
