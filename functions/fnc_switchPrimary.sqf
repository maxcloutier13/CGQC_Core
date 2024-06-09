#include "\CGQC\script_component.hpp"
// --- switchPrimary ----------------------------------------------------------
// Switch primary weapons
params ["_type", ["_target", player]];
LOG_1("[switchPrimary] %1 started", _type);

_needGL = false;
// Remove gun and ammo
[_target] call CGQC_fnc_removePrimary;

// Add gun
switch (_type) do {
	#include "\cgqc\loadouts\2023\primary.hpp"
	#include "\cgqc\loadouts\swat\primary.hpp"
	#include "\cgqc\loadouts\unsung\primary.hpp"
};

if (_needGL) then { // Load with grenade launcher stuff
	if (cgqc_player_isVietnam) then {
		LOG(" primarySwitch - Nam Style - adding GL stuff");
		_target addItemToVest "uns_m406vest";
		for "_i" from 1 to 10 do {_target addItemToBackpack "Uns_1Rnd_HE_M406"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeGreen_40mm"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "uns_1Rnd_SmokeRed_40mm"};
	} else {
		LOG(" primarySwitch - adding GL stuff");
		for "_i" from 1 to 5 do {_target addItemToVest "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 10 do {_target addItemToBackpack "1Rnd_HE_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeRed_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell"};
		for "_i" from 1 to 3 do {_target addItemToBackpack "1Rnd_Smoke_Grenade_shell"};
		[] call CGQC_fnc_isDaytime;
		if !(cgqc_mission_daytime) then {
			LOG("[primarySwitch] Night-time. Get flares");
			hint "Night! get some flares";
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_white"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "UGL_FlareRed_F"};
			for "_i" from 1 to 2 do {_target addItemToBackpack "ACE_40mm_Flare_ir"};
		} else {
			LOG("[primarySwitch] Daytime. Skip flares");
			hint "Daytime. Skip flares";
		};
	};
};

// Add mags to vest
[_target] call CGQC_fnc_addMags;
[_target] call ace_weaponselect_fnc_putWeaponAway;

LOG("[switchPrimary] done");