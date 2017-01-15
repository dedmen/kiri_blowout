#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_clientBlowoutDetection

    Author(s):
        Dedmen

    Description:
        Starts the clientside Blowout Detection

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_clientBlowoutDetection;
*/

diag_log format["[kfNAC BLOWOUT CLIENT] :: Blowout confirmation received."];

if (APSI_CLASSNAME in (assignedItems player)) then {
    [] spawn kiri_blowout_fnc_blowoutDetection;
};

GVAR(originalOvercast) = overcast;
GVAR(resetOvercast) = false;

if (overcast <= 0.75) then {
    GVAR(resetOvercast) = true;
    35 setOvercast 1;
};
