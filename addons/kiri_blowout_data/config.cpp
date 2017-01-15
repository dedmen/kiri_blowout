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

class CfgSounds {
	
	class bl_begin
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_begin.ogg",3.162278,1.0};
		titles[] = {};
	};
	class bl_hit1
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_hit_1.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_hit2
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_hit_2.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_hit3
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_hit_3.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave1
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_wave_1.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave2
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_wave_2.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_wave3
	{
		name = "NS blowout_begin";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_wave_3.ogg",1.584893,1.0};
		titles[] = {};
	};
	class bl_psi
	{
		name = "NS blowout_psi";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_psy_voices.ogg",1.778279,1.0};
		titles[] = {};
	};
	class bl_full
	{
		name = "NS blowout_full";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_full_wave.ogg",1.778279,1.0};
		titles[] = {};
	};
	class bl_detect
	{
		name = "NS blowout_detect";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\blowout_detect.ogg",1.778279,1.0};
		titles[] = {};
	};
	class apsi_on
	{
		name = "NS apsi_on";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\apsi_start.ogg",1.778279,1.0};
		titles[] = {};
	};
	class apsi_off
	{
		name = "NS apsi_off";
		sound[] = {"z\kiri_blowout\addons\kiri_blowout_data\sounds\apsi_off.ogg",1.778279,1.0};
		titles[] = {};
	};
};