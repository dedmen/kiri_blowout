
private _hasAPSI = APSI_CLASSNAME in (assignedItems player);

//server does applyDamage here

//Umkipp
player setVariable ["tf_voiceVolume", 0, true];
player setVariable ["tf_globalVolume", 0.2];
player setVariable ["tf_unable_to_use_radio", true];


if (!_hasAPSI && vehicle player != player) then {
    moveOut player;
}


[] call kiri_blowout_fnc_startAnimations;
sleep 0.1;
playSound "bl_full";
sleep 0.1;
titleText["","BLACK OUT",1];
disableUserInput true;

if (!_hasAPSI && {!([player] call kiri_blowout_fnc_isInsideBuilding)}) then {
    [player,0.5] call ace_medical_fnc_adjustPainLevel;
};

sleep 1;
4 fadeSound 0;
//sleep 5;