#include "script_component.hpp"
/*
    Name: kiri_blowout_fnc_applyDamage

    Author(s):
        Dedmen

    Description:
        Applies damage to Players not wearing APSI and damages Electric gadgets

    Parameters:
        1: BOOL - Damage Items
        2: BOOL - Damage Vehicles

    Returns:
        Nothing

    Example:
        [true, true] call kiri_blowout_fnc_applyDamage;
*/

params ["_damageItems","_damageVehicles"];

{
    private _unit = _x;

    if (!isNull _unit) then {
        private _isInBuilding = [_unit] call kiri_blowout_fnc_isInsideBuilding;
        private _hasAPSI = APSI_CLASSNAME in (assignedItems _unit);//items _unit
/*//Only works clientside
        if (!_hasAPSI) then {
            if (!_isInBuilding) then {
                [_unit,0.5] call ace_medical_fnc_adjustPainLevel;
            };
        };
*/
        if (_damageItems) then {
            DAMAGE_WEAPON(_unit,"NVGoggles","BrokenNVGoggles");
            DAMAGE_WEAPON(_unit,"ItemGPS","BrokenItemGPS");
            DAMAGE_WEAPON(_unit,"ItemRadio","BrokenItemRadio");
        };
    };

    if (kiri_blowout_debug) then {
        diag_log format["[kfNAC BLOWOUT SERVER] :: [S] %1 %2 Building %2 %3",_unit,
            if (_isInBuilding) then {"IN"} else {"OUT"},
            if (_hasAPSI) then {"has APSI"} else {"has no APSI"},
            if (!_isInBuilding && !_hasAPSI) then {"was damaged by blowout"} else {"was not damaged"}
        ];
    };
    true
} count allUnits;



if (!_damageVehicles) exitWith {};

{
    if (_x isKindOf "AllVehicles") then {
      if ((damage _x) <= 0.99) then {
        _x setHit ["motor", 1];
        if (kiri_blowout_debug) then {diag_log format["[NAC BLOWOUT SERVER] :: [V] %1 has been damaged by blowout",_x];};
      };
    };

    true
} count vehicles;
