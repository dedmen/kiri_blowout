#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#ifdef DFUNC
    #undef DFUNC
#endif
#define DFUNC(var1) TRIPLES(PREFIX,fnc,var1)

#define DISABLE_COMPILE_CACHE 1

#ifdef PREP
    #undef PREP
#endif

#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QUOTE(DFUNC(fncName))] call CBA_fnc_compileFunction
#define PREP_SUB(subfolder,fncName) [QPATHTOF(functions\subfolder\DOUBLES(fnc,fncName).sqf), QUOTE(DFUNC(fncName))] call CBA_fnc_compileFunction

#define VARIABLE_DEFAULT(varName,defaultValue) if (isNil QUOTE(varName)) then {varName = defaultValue;}

