#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_blowoutDetection

    Author(s):
        Dedmen

    Description:
        Starts APSI detection UI

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_blowoutDetection;
*/

playSound "bl_detect";
sleep 0.2;
playSound "bl_detect";
sleep 0.5;
cutRsc ["RscAPSI_h1","PLAIN"];
playSound "bl_detect";
sleep 0.1;
playSound "bl_detect";
sleep 1;
cutRsc ["RscAPSI_h2","PLAIN"];
sleep 1;
playSound "bl_detect";
cutRsc ["RscAPSI_h3","PLAIN"];
playSound "apsi_on";
"filmGrain" ppEffectEnable true;
"filmGrain" ppEffectAdjust [0.15, 1, 1, 0.1, 1, false];
"filmGrain" ppEffectCommit 0;
sleep 1;
playSound "bl_detect";
sleep 0.2;
playSound "bl_detect";
cutRsc ["RscAPSI_h4","PLAIN"];
sleep 23.8;
playSound "bl_detect";
sleep 0.2;
playSound "bl_detect";
cutRsc ["RscAPSI_h5","PLAIN"];
