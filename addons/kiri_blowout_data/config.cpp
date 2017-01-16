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


class RscTextNS
{
	idc = -1;
	type = 0;
	style = 2;
	LineSpacing = 1.0;
	h = 0.04;
	ColorBackground[] = {1,1,1,0.2};
	ColorText[] = {0.1,0.1,0.1,1};
	font = "BitStream";
	SizeEx = 0.025;
};

class RscTitles
{
	class RscAPSI_h1
	{
		idd = -1;
		duration = 4;
		fadein = 0;
		movingEnable = 0;
		enableSimulation = 0;
		enableDisplay = 0;
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.5;
				h = 0.03;
				text = "APSI: Stronger activity of floax field has been detected..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {1.0,0.2,0.1,1};
			};
		};
	};
	class RscAPSI_h2: RscAPSI_h1
	{
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.4;
				h = 0.03;
				text = "APSI: EVR sequence detected..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {1.0,0.0,0.2,1};
			};
		};
	};
	class RscAPSI_h3: RscAPSI_h1
	{
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.4;
				h = 0.03;
				text = "APSI: EM and PSI protection enabled..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {0.0,1.0,0.2,1};
			};
		};
	};
	class RscAPSI_h4: RscAPSI_h1
	{
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.4;
				h = 0.03;
				text = "APSI: Ready..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {0.0,1.0,0.2,1};
			};
		};
	};
	class RscAPSI_h5: RscAPSI_h1
	{
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.4;
				h = 0.03;
				text = "APSI: EVR sequence start..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {1.0,0.0,0.2,1};
			};
		};
	};
	class RscAPSI_h6: RscAPSI_h1
	{
		class controls
		{
			class APSILog: RscTextNS
			{
				x = 0.5;
				y = 0.99;
				w = 0.4;
				h = 0.03;
				text = "APSI: End of EVR..";
				colorBackground[] = {0.5,0.5,0.5,0.4};
				ColorText[] = {0.0,1.0,0.2,1};
			};
		};
	};
};
