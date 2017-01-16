#include "script_component.hpp"

diag_log "kiri_PostInit";
//Clientonly
if (isServer or isDedicated) exitWith {};

["kiri_blowout_startDetection", {
    [] call kiri_blowout_fnc_clientBlowoutDetection;
}] call CBA_fnc_addEventHandler;


["kiri_blowout_startAction", {
    [] spawn kiri_blowout_fnc_clientBlowoutAction;
}] call CBA_fnc_addEventHandler;
