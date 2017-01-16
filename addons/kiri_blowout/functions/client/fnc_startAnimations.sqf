#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_startAnimations

    Author(s):
        Dedmen

    Description:
        Starts unconcious animations

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_startAnimations;
*/

{
    if ((alive _x) && {((vehicle _x) == _x)} && {!(APSI_CLASSNAME in (assignedItems _x))}   ) then {
         _x switchMove "AcinPercMrunSnonWnonDf_agony";
    };
    true
} count allUnits;
