#include "script_component.hpp"
private _hasAPSI = APSI_CLASSNAME in (assignedItems player);

if (_hasAPSI) then {disableUserInput false};
sleep 6;
6 fadeSound 1;

"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 12;

titleText["","BLACK IN",10];
ppEffectDestroy GVAR(NonAPSIEffect);

sleep 2;

if (_hasAPSI) then { //Reactivate TFAR now, APSI doesn't numb us for that long
    player setVariable ["tf_voiceVolume", 1, true];
    player setVariable ["tf_globalVolume", 1];
    player setVariable ["tf_unable_to_use_radio", false];
};

if (!_hasAPSI) then { //We are not on ground when we have APSI
    player switchMove "UnconsciousOutProne";
};

if(GVAR(resetOvercast)) then { 120 setOverCast GVAR(originalOvercast); };

if (_hasAPSI) then {
    cutRsc ["RscAPSI_h6","PLAIN"];
    playSound "apsi_off";
    "filmGrain" ppEffectEnable false;
};

[{//2 seconds unable to move
    player setVariable ["tf_voiceVolume", 1, true];
    player setVariable ["tf_globalVolume", 1];
    player setVariable ["tf_unable_to_use_radio", false];

    disableUserInput false;
    diag_log format["[kfNAC BLOWOUT CLIENT] :: ns_blow_status = %1 Blowout end received."];
    [] call kiri_blowout_fnc_endAnimations;

}, [], 1] call CBA_fnc_waitAndExecute;
