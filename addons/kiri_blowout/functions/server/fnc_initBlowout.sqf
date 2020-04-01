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

["kiri_blowout_start", []] call CBA_fnc_remoteEvent; //tell clients to prep statemachine

_this spawn {
    params ["_damageItems","_damageVehicles"];

    //APSI beeping
    ["kiri_blowout_startDetection", []] call CBA_fnc_remoteEvent; //tell clients to start Detection
    sleep 30;  // needed time for APSI procedures OR nothing

    //Thunder effects
    ["kiri_blowout_startActionPrelude", []] call CBA_fnc_remoteEvent;
    sleep 24.5;

    //Damage and fall over uncon
    [_damageItems,_damageVehicles] call kiri_blowout_fnc_applyDamage;
    ["kiri_blowout_startActionHit", []] call CBA_fnc_remoteEvent;
    sleep 6.2;

    //wake up, recover
    ["kiri_blowout_startActionRecover", []] call CBA_fnc_remoteEvent;
    sleep 10; //Doesn't matter, just for cleanup

    //end and delete statemachine
    ["kiri_blowout_endAction", []] call CBA_fnc_remoteEvent;

    GVAR(blowoutInProgress) = false;
    publicVariable QGVAR(blowoutInProgress);

    diag_log format["[kfNAC BLOWOUT SERVER] :: Blowout finished"];
};
