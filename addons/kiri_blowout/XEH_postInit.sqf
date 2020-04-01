#include "script_component.hpp"

diag_log "kiri_PostInit";
//Clientonly
if (isServer or isDedicated) exitWith {};



["kiri_blowout_start", {
    [] call kiri_blowout_fnc_initStatemachine;
}] call CBA_fnc_addEventHandler;