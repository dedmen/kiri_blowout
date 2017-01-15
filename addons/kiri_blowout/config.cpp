#include "script_component.hpp"

class CfgPatches {
	class kiri_blowout {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		author = "dedmen";
		requiredAddons[] = {"cba_main","A3_Modules_F_Curator"};
	};
};

class Extended_PreStart_EventHandlers {
	class kiri_blowout {
		init = "call compile preProcessFileLineNumbers '\z\kiri_blowout\addons\kiri_blowout\XEH_preStart.sqf'";
	};
};

class Extended_PreInit_EventHandlers {
	class kiri_blowout {
		init = "call compile preProcessFileLineNumbers '\z\kiri_blowout\addons\kiri_blowout\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class kiri_blowout {
		init = "call compile preProcessFileLineNumbers '\z\kiri_blowout\addons\kiri_blowout\XEH_postInit.sqf'";
	};
};
