
#include "script_component.hpp"

/*
    Name: kiri_blowout_fnc_initStatemachine

    Author(s):
        Dedmen

    Description:
        Initializes the statemachine

    Parameters:
        Nothing

    Returns:
        Nothing

    Example:
        call kiri_blowout_fnc_initStatemachine;
*/

private _stateMachine = [{1}, true] call CBA_statemachine_fnc_create;
GVAR(statemachine) = _stateMachine;

//Detection phase


[_stateMachine, {}, {}, {}, "Initial"] call CBA_statemachine_fnc_addState;

//APSI Detection
[_stateMachine, {}, {
    GVAR(blowoutDetectionInst) = [] spawn kiri_blowout_fnc_clientBlowoutDetection;
}, {
    terminate GVAR(blowoutDetectionInst);
}, "Detection"] call CBA_statemachine_fnc_addState;

//Flashing, PP Effects
[_stateMachine, {}, {
    diag_log format["[KiriBlowout] ActionPrelude Start"]; 
     GVAR(blowoutActionPrelude) = [] spawn kiri_blowout_fnc_blowoutActionPrelude;
}, {
    terminate GVAR(blowoutActionPrelude);
}, "ActionPrelude"] call CBA_statemachine_fnc_addState;

//Fall over, unconscious
[_stateMachine, {}, {
    diag_log format["[KiriBlowout] ActionHit Start"]; 
     GVAR(blowoutActionHit) = [] spawn kiri_blowout_fnc_blowoutActionHit;
}, {
    terminate GVAR(blowoutActionHit);
}, "ActionHit"] call CBA_statemachine_fnc_addState;


//Wake up, recover
[_stateMachine, {}, {
    diag_log format["[KiriBlowout] ActionRecover Start"]; 
     GVAR(blowoutActionRecover) = [] spawn kiri_blowout_fnc_blowoutActionRecover;
}, {
    terminate GVAR(blowoutActionRecover);
}, "ActionRecover"] call CBA_statemachine_fnc_addState;

//End, cleanup
[_stateMachine, {}, {
    [GVAR(statemachine)] call CBA_statemachine_fnc_delete;
}, {}, "End"] call CBA_statemachine_fnc_addState;


[_stateMachine, "Initial", "Detection", ["kiri_blowout_startDetection"], {true}, {}, "Start Detection"] call CBA_statemachine_fnc_addEventTransition;
[_stateMachine, "Detection", "ActionPrelude", ["kiri_blowout_startActionPrelude"], {true}, {}, "Start Lightning strikes"] call CBA_statemachine_fnc_addEventTransition;
[_stateMachine, "ActionPrelude", "ActionHit", ["kiri_blowout_startActionHit"], {true}, {}, "Get hit"] call CBA_statemachine_fnc_addEventTransition;
[_stateMachine, "ActionHit", "ActionRecover", ["kiri_blowout_startActionRecover"], {true}, {}, "Recover"] call CBA_statemachine_fnc_addEventTransition;
[_stateMachine, "ActionRecover", "End", ["kiri_blowout_endAction"], {true}, {}, "End"] call CBA_statemachine_fnc_addEventTransition;

// This makes sure you can execute this through the debug console
//_stateMachine spawn {
//    sleep 0.1;
//    private _output = [_this, true, true] call CBA_statemachine_fnc_toString;
//    copyToClipboard _output;
//    hintC _output;
//};

