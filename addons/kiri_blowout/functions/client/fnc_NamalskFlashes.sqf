#include "script_component.hpp"
/*
    Name: kiri_blowout_fnc_NamalskFlashes

    Author(s):
        Dedmen

    Description:
        Flashes at Object A2

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_NamalskFlashes;
*/


if (worldName != "namalsk") exitWith {}; //Only on Namalsk

private _lightnings = [];
{
    _lightning = "bl_bleez" createVehicleLocal [0,0,0];
    _lightning setPos [3962.11, 8453.32, _x];
    _lightning setVectorUp [0,0,1];
    _lightnings pushBack _lightning;
    true
} count [0, 151, 320, 471, 620, 770, 820, 970, 1120];

sleep 0.25;

{
    deleteVehicle _x;
    true
} count _lightnings;
