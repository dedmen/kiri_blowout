#include "script_component.hpp"
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
GVAR(NonAPSIEffect) = _nonapsi_ef;
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
