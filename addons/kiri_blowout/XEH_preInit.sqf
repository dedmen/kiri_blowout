#include "script_component.hpp"
kiri_blowout_debug = false;

//Serveronly
if (!isServer and !isDedicated) exitWith {};

GVAR(blowoutInProgress) = false;
