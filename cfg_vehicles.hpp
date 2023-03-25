class B_T_Truck_01_box_F;


class cgqc_vic_construction : B_T_Truck_01_box_F
{
    scope = 2;
    side = 1;
    author = "silent1";
    faction = "cgqc";
    editorSubcategory = "EdSubcat_cgqc_vic_unarmed";
    displayName = "HEMTT de Construction - Outpost (2)";
    crew = "CGQC_Soldat_Base";
	textureList[] = {"Olive",1};
		hiddenSelectionsTextures[] = {
			"\a3\soft_f_Exp\truck_01\data\truck_01_ext_01_olive_co.paa",
			"\a3\soft_f_Exp\truck_01\data\truck_01_ext_02_olive_co.paa",
			"\A3\Soft_F_Exp\Truck_01\Data\truck_01_ammo_olive_CO.paa",
			"\CGQC\vehicles\cgqc_vic_construction_container.paa"
		};
    class AcreRacks {
        class Rack_1 {
            displayName = "Dash Upper"; // Name is displayed in the interaction menu.
            shortName = "Rack1";
            componentName = "ACRE_VRC103";
            allowedPositions[] = {"driver", {"cargo", 0}, "external"};
            mountedRadio = "ACRE_PRC117F";
            intercom[] = {};
        };
        class Rack_2: Rack_1 {
            displayName = "Dash Lower"; // If you have multiple racks a text label helps identify the particular rack.
            shortName = "Rack2";
        };
    };
	class EventHandlers
    {
    	init = "[_this] execVM '\cgqc\vehicles\loadout_construction.sqf'"; 
    };
    //#include "vehicles\cgqc_vic_loadout_construction.sqf"
};
