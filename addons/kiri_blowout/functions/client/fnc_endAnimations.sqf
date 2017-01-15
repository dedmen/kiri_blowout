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
    params ["_unit"];
    if ((alive _unit) && {((vehicle _unit) == _unit)} && {!(APSI_CLASSNAME in (assignedItems _unit))}   ) then {
         _unit switchMove "";
    };
    true
} count allUnits;
