#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_initBlowout

    Author(s):
        Dedmen

    Description:
        Initiates a Blowout

    Parameters:
        1: BOOL - Damage Items
        2: BOOL - Damage Vehicles

    Returns:
        Nothing

    Example:
        [true, true] call kiri_blowout_fnc_initBlowout;
*/

params ["_damageItems","_damageVehicles"];

if (!isServer and !isDedicated) exitWith {};

if (GVAR(blowoutInProgress)) exitWith { diag_log "[kfNAC BLOWOUT SERVER] :: tried to start Blowout but Blowout is already in progress"; };

GVAR(blowoutInProgress) = true;
publicVariable QGVAR(blowoutInProgress);

diag_log format["[kfNAC BLOWOUT SERVER] :: Initiating Blowout ItemDamage: %1 VehicleDamage: %2", _damageItems, _damageVehicles];

_this spawn {
    params ["_damageItems","_damageVehicles"];

    ["kiri_blowout_startDetection", []] call CBA_fnc_remoteEvent; //tell clients to start Detection

    sleep 30;  // needed time for APSI procedures OR nothing

    ["kiri_blowout_startAction", []] call CBA_fnc_remoteEvent; //tell clients to start Action

    diag_log format["[kfNAC BLOWOUT SERVER] :: Blowout actions in progress"];

    {
        [] call kiri_blowout_fnc_NamalskFlashes;
        sleep _x;
        true
    } count [7.20, 1, 4.3, 3, 1, 4, 4];

    [] call kiri_blowout_fnc_NamalskFlashes;

    [_damageItems,_damageVehicles] call kiri_blowout_fnc_applyDamage;
    sleep 12.2;

    ["kiri_blowout_endAction", []] call CBA_fnc_remoteEvent; //tell clients to end Action

    GVAR(blowoutInProgress) = false;
    publicVariable QGVAR(blowoutInProgress);

    diag_log format["[kfNAC BLOWOUT SERVER] :: Blowout finished"];
};
