#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_clientBlowoutAction

    Author(s):
        Dedmen

    Description:
        Starts the clientside Blowout action

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        spawn kiri_blowout_fnc_clientBlowoutAction;
*/


diag_log format["[kfNAC BLOWOUT CLIENT] :: ns_blow_action = %1 Blowout action received."];



private _hasAPSI = APSI_CLASSNAME in (assignedItems player);

playSound "bl_begin";
"dynamicBlur" ppEffectAdjust [8];
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.1];
"dynamicBlur" ppEffectCommit 0.75;
"chromAberration" ppEffectAdjust [0.25,0,true];
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectCommit 0.5;
sleep 0.5;
"chromAberration" ppEffectAdjust [-0.15,0,true];
"chromAberration" ppEffectCommit 0.35;
sleep 0.5;
"chromAberration" ppEffectAdjust [-0.05,0,true];
"chromAberration" ppEffectCommit 0.20;
sleep 0.20;
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 0.20;
sleep 1;
"chromAberration" ppEffectEnable false;
"dynamicBlur" ppEffectAdjust [3];
"dynamicBlur" ppEffectCommit 2.75;
sleep 5;

[] call kiri_blowout_fnc_flash;

playSound selectRandom ["bl_hit1","bl_hit2","bl_hit3"];

"dynamicBlur" ppEffectAdjust [3];
"dynamicBlur" ppEffectCommit 5;
sleep 1;
[] call kiri_blowout_fnc_flash;
playSound selectRandom ["bl_hit1","bl_hit2","bl_hit3"];
"dynamicBlur" ppEffectAdjust [2.4];
"dynamicBlur" ppEffectCommit 6;
sleep 4;
playSound selectRandom ["bl_wave1","bl_wave2","bl_wave3"];
sleep 0.3;
[] call kiri_blowout_fnc_flash;
playSound selectRandom ["bl_hit1","bl_hit2","bl_hit3"];
sleep 1;
playSound selectRandom ["bl_wave1","bl_wave2","bl_wave3"];
sleep 2;
[] call kiri_blowout_fnc_flash;

playSound selectRandom ["bl_hit1","bl_hit2","bl_hit3"];
private _nonapsi_ef = ppEffectCreate ["colorCorrections", 1555];
_nonapsi_ef ppEffectEnable true;
_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.2, 0.2, 0.0], [1.0, 0.4, 0.0, 0.1],[1.0,0.3,0.3, 0.5]];
_nonapsi_ef ppEffectCommit 2;
sleep 1;
[] call kiri_blowout_fnc_flash;
playSound selectRandom ["bl_wave1","bl_wave2","bl_wave3"];
[] call kiri_blowout_fnc_flash;

if (!_hasAPSI) then {
    playSound "bl_psi";
};

sleep 4;
[] call kiri_blowout_fnc_flash;
playSound selectRandom ["bl_wave1","bl_wave2","bl_wave3"];
_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [1.0, 0.1, 0.1, 0.0], [1.0, 0.1, 0.0, 0.1],[1.0,0.1,0.0, 0.5]];
_nonapsi_ef ppEffectCommit 6;
sleep 1;
playSound selectRandom ["bl_hit1","bl_hit2","bl_hit3"];
sleep 3;
[] call kiri_blowout_fnc_flash;
playSound selectRandom ["bl_wave1","bl_wave2","bl_wave3"];

_nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.1, [0.0, 0.0, 0.0, 0.0], [0.0, 0.0, 0.0, 5.0],[0.4,0.0,0.0, 0.7]];
_nonapsi_ef ppEffectCommit 1;


//server does applyDamage here

//Umkipp
player setVariable ["tf_voiceVolume", 0, true];
player setVariable ["tf_globalVolume", 0.2];
player setVariable ["tf_unable_to_use_radio", true];

[] call kiri_blowout_fnc_startAnimations;
sleep 0.1;
playSound "bl_full";
sleep 0.1;
titleText["","BLACK OUT",1];
disableUserInput true;

private _isInBuilding = [player] call kiri_blowout_fnc_isInsideBuilding;

if (!_hasAPSI) then {
   if (!_isInBuilding) then {
       [player,0.5] call ace_medical_fnc_adjustPainLevel;
   };
};

sleep 1;
4 fadeSound 0;
sleep 5;



["kiri_blowout_endAction", {
    _thisArgs params ["_hasAPSI", "_nonapsi_ef"];

    if (_hasAPSI) then {disableUserInput false;};
    sleep 6;
    6 fadeSound 1;

    "dynamicBlur" ppEffectAdjust [0];
    "dynamicBlur" ppEffectCommit 12;

    titleText["","BLACK IN",10];
    ppEffectDestroy _nonapsi_ef;



    player switchMove "UnconsciousOutProne";

    if (_hasAPSI) then { //TFAR jetzt schon aktivieren, weil wir nicht benommen sind
        player setVariable ["tf_voiceVolume", 1, true];
        player setVariable ["tf_globalVolume", 1];
        player setVariable ["tf_unable_to_use_radio", true];
    };

    if(GVAR(resetOvercast)) then { 120 setOverCast GVAR(originalOvercast); };

    if (_thisArgs) then {
        cutRsc ["RscAPSI_h6","PLAIN"];
        playSound "apsi_off";
        "filmGrain" ppEffectEnable false;
    };

    [{//2 seconds unable to move
        player setVariable ["tf_voiceVolume", 1, true];
        player setVariable ["tf_globalVolume", 1];
        player setVariable ["tf_unable_to_use_radio", true];

        disableUserInput false;
        diag_log format["[kfNAC BLOWOUT CLIENT] :: ns_blow_status = %1 Blowout end received."];
        [] call kiri_blowout_fnc_endAnimations;

    }, [], 1] call CBA_fnc_waitAndExecute;

    ["kiri_blowout_endAction", _thisId] call CBA_fnc_removeEventHandler;
},[_hasAPSI, _nonapsi_ef]] call CBA_fnc_addEventHandlerArgs;


[{//If server fails in some way we end it ourselves
    ["kiri_blowout_endAction", []] call CBA_fnc_localEvent;
}, [], 20] call CBA_fnc_waitAndExecute;
