#include "script_component.hpp"

diag_log "kiri_PreInit";
#include "XEH_PREP.sqf"
kiri_blowout_debug = false;

//Serveronly
if (!isServer and !isDedicated) exitWith {};

GVAR(blowoutInProgress) = false;
