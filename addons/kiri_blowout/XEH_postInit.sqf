#include "script_component.hpp"
["kiri_blowout_startDetection", {
    [] call kiri_blowout_fnc_clientBlowoutDetection;
}] call CBA_fnc_addEventHandler;


["kiri_blowout_startAction", {
    [] spawn kiri_blowout_fnc_clientBlowoutAction;
}] call CBA_fnc_addEventHandler;

//Serveronly
if (!isServer and !isDedicated) exitWith {};
