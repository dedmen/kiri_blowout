#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_endAnimations

    Author(s):
        Dedmen

    Description:
        Ends unconcious animations

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_endAnimations;
*/


{
    if ((alive _x) && {((vehicle _x) == _x)} && {!(APSI_CLASSNAME in (assignedItems _x))}   ) then {
         _x switchMove "";
    };
    true
} count allUnits;
