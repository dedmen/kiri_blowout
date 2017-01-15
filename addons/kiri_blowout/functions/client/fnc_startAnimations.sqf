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
    params ["_unit"];
    if ((alive _unit) && {((vehicle _unit) == _unit)} && {!(APSI_CLASSNAME in (assignedItems _unit))}   ) then {
         _unit switchMove "AcinPercMrunSnonWnonDf_agony";
    };
    true
} count allUnits;
