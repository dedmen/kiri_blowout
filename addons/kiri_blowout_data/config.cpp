#include "script_component.hpp"

class CfgPatches {
	class kiri_blowout_data {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		author = "dedmen";
		requiredAddons[] = {"kiri_blowout"};
	};
};

class CfgWeapons {
	class Default;
	class ItemCore;
	class ItemWatch;
	class APSI: ItemWatch
	{
		author = "Kirito-Kun";
		scope = 2;
		displayName = "APSI";
		picture = "z\kiri_blowout\addons\kiri_blowout_data\data\apsi_icon_ca.paa";
		descriptionShort = "Provides Protection from Blowouts";
	};
	class BrokenItemGPS: ItemCore
	{
		scope = 2;
		displayName = "Broken GPS";
		model="\A3\Weapons_F\Items\gps";
		picture = "z\kiri_blowout\addons\kiri_blowout_data\data\gear_picture_gps_ca.paa";
		descriptionShort = "This GPS broke, due to a heavy blowout.";
	};
	class BrokenNVGoggles: ItemCore
	{
		scope = 2;
		displayName = "Broken Night Vision Goggles";
		model="\A3\Weapons_f\binocular\nvg_proxy";
		picture = "z\kiri_blowout\addons\kiri_blowout_data\data\w_nvg_ca.paa";
		descriptionShort = "These Night Vision Goggles broke, due to a heavy blowout.";
	};
};