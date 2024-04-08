// --- addItemWithOverflow ----------------------------------------------------------
// Add item to player, handling overflow all the way to the ground if needed
// example: [player, "uniform", "medkit", true] call CGQC_fnc_addItemWithOverflow;
params ["_unit", "_target", "_item", ["_overflow", true]];
diag_log format ["[CGQC_FNC] addItemWithOverflow %1/%2/%3/%4 started", _unit, _target, _item, _overflow];

// Lower string in case.
_item = toLower _item;

switch (_target) do {
	case "uniform": {
		diag_log "[CGQC_FNC] addItemWithOverflow - adding to uniform";
		if (_unit canAddItemToUniform _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToUniform _item;
		} else {
			diag_log "[CGQC_FNC] addItemWithOverflow - Doesn't fit. Trying vest";
			if (_unit canAddItemToVest _item) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
				_unit addItemToVest _item;
			} else {
				diag_log "[CGQC_FNC] addItemWithOverflow - Doesn't fit. Trying backpack";
				if (_unit canAddItemToBackpack _item) then {
					diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
					_unit addItemToBackpack _item;
				}else {
					diag_log "[CGQC_FNC] addItemWithOverflow - Not enough space!";
					if (_overflow) then {
						hint "Not enough space... Dropping on ground";
						diag_log "[CGQC_FNC] addItemWithOverflow - Dropping on ground!";
						_itemPos = getPos player; // Get player's position
						_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

						_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
						_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

						// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
						_name = format ["%1's gear", cgqc_custom_playername];
						_groundItem setVariable ["cgqc_object_name", _name, true];
					};
				};
			};
		};
	};
	case "vest": {
		diag_log "[CGQC_FNC] addItemWithOverflow - adding to vest";
		if (_unit canAddItemToVest _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToVest _item;
		} else {
			diag_log "[CGQC_FNC] addItemWithOverflow - Doesn't fit. Trying backpack";
			if (_unit canAddItemToBackpack _item) then {
				diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
				_unit addItemToBackpack _item;
			} else {
				hint "Not enough space... ";
				diag_log "[CGQC_FNC] addItemWithOverflow - Not Enough space..";
				if (_overflow) then {
					diag_log "[CGQC_FNC] addItemWithOverflow - Dropping on ground!";
					_itemPos = getPos player; // Get player's position
					_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

					_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
					_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

					// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
					_name = format ["%1's gear", cgqc_custom_playername];
					_groundItem setVariable ["cgqc_object_name", _name, true];
				};
			};
		};
	};
	case "backpack": {
		diag_log "[CGQC_FNC] addItemWithOverflow - adding to backpack";
		if (_unit canAddItemToBackpack _item) then {
			diag_log "[CGQC_FNC] addItemWithOverflow - Fits! adding.";
			_unit addItemToBackpack _item;
		}else{
			diag_log "[CGQC_FNC] addItemWithOverflow - Not Enough space..";
			if (_overflow) then {
				hint "Not enough space... Dropping on ground";
				diag_log "[CGQC_FNC] addItemWithOverflow - Dropping on ground!";
				_itemPos = getPos player; // Get player's position
				_itemPos set [2, 0];      // Set the height to 0 to place the item on the ground

				_groundItem = "GroundWeaponHolder" createVehicle _itemPos; // Create a ground weapon holder
				_groundItem addItemCargoGlobal [_item, 1]; // Add the magazine to the holder

				// Optional: Name the weapon holder (you can replace "MyMagazineHolder" with your desired name)
				_name = format ["%1's gear", cgqc_custom_playername];
				_groundItem setVariable ["cgqc_object_name", _name, true];
			};
		};
	};
};
diag_log "[CGQC_FNC] addItemWithOverflow done";