// --- loadout_10 ----------------------------------------------------------
// Loadout for 1-0 Team leader
sleep 0.5;
// Vest 
["vest", "UNS_M1956_S3"] call CGQC_fnc_switchStuff;
// Backpack 
["backpack", "UNS_Alice_1"] call CGQC_fnc_switchStuff;
waitUntil {cgqc_mk3_switching_vest};
waitUntil {cgqc_mk3_switching_backpack};
// primaryWeapon 
player addWeapon "uns_xm177e2_m203";
player addPrimaryWeaponItem "uns_30Rnd_556x45_Stanag_xm177";
// Primary ammo 
[] call CGQC_fnc_addMags;
for "_i" from 1 to 2 do {player addItemToVest "uns_m406vest";};
// Items 
player addItemToBackpack "UNS_TrapKit";
for "_i" from 1 to 5 do {player addItemToBackpack "uns_30Rnd_556x45_Stanag_xm177";};
for "_i" from 1 to 5 do {player addItemToBackpack "uns_1Rnd_SmokeRed_40mm";};
for "_i" from 1 to 5 do {player addItemToBackpack "uns_1Rnd_SmokeGreen_40mm";};

