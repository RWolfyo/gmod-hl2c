local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "hl2mp" then
// Include Mapscript.
GAMETYPE.MapScript = include("hl2mp/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"cl_coop_corridor_b3",	-- 1
	"cl_coop_doors_v2",	-- 2
	"cl_coop_laserquest_b2",--4
	"cl_coop_level2_survive_r1",--8
	"cl_coop_venture_up",--16
	"coop_123module_v2",--32
	"coop_antlion_castlewars_bb",--64
	"coop_ant_tower_b1_3",--128
	"coop_arn_labyrinth_b3",--256
	"coop_atlantis_beta4_z2",--512
	"coop_bb_deserted_v2b7",--1024
	"coop_canalsv10",--2048
	"coop_cc_nochance_v1b60",--4096
	"coop_citadel_escape_v2fix",--8192
	"coop_city17_bouncy9",--16384
	"coop_epcycle_v4",--32768
	"coop_fleeravenholm_z1",--65536
	"coop_great_evil",
	"coop_hl2portal_mix_fix",
	"coop_lemongames_beta5",
	"coop_level01_dooms_entry_v1b",
	"coop_level02_traps_v1c",
	"coop_level07_scary_house_v4",
	"coop_level_1b_cube",
	"coop_level_7b",
	"coop_manticore",
	"coop_meows_corridors_z1",
	"coop_meows_fundayout_z1",
	"coop_meows_house_to_house_z1",
	"coop_meows_icey_topsy_turvey",
	"coop_meows_kill_em_all_z1",
	"coop_meows_pitifull_v_1",
	"coop_meows_pyramid_z1",
	"coop_meows_revenge_v_3",
	"coop_meows_runoff_ver_1",
	"coop_meows_runoff_ver_4",
	"coop_meows_runoff_v_4",
	"coop_meows_sewer_mania_r2",
	"coop_meows_stairway_hell_v_2",
	"coop_meows_winterwonderland_z1",
	"coop_missile_silo",
	"coop_npcwar2_final",
	"coop_npcwar3_aldo",
	"coop_npcwar3_final",
	"coop_npcwar_final",
	"coop_swampthing_v6",
	"coop_town_level4d",
	"coop_train_escape_z1",
	"coop_traps_v1c",
	"coop_underground_x_pgir_v2",
	"coop_venture_v1c",
	"coop_wardogs_v5",
	"co_infested_beta2-5",
	"infiltration1",
	"js_co-op_tbr_steamlab_v7",
	"js_co-op_train_lvls_v5b",
	"js_coop_123module_v2",
	"js_coop_acc_v6",
	"js_coop_basemission_beta",
	"js_coop_cavettc_ob",
	"js_coop_citadel_blast_v5",
	"js_coop_citadel_blast_x_v2",
	"js_coop_coast_x_v5",
	"js_coop_combine2_sg_b4",
	"js_coop_cranecase_p1",
	"js_coop_deep_v12",
	"js_coop_docks_crane_final",
	"js_coop_gethev_pr2",
	"js_coop_helicave_x_v2",
	"js_coop_horror_v13",
	"js_coop_jackass_v9",
	"js_coop_lc3_nuke_m",
	"js_coop_ld2",
	"js_coop_level4_x_v2",
	"js_coop_level5_x_v1",
	"js_coop_level6_x_v3",
	"js_coop_level8_x_v1",
	"js_coop_levelcube_ttc_a",
	"js_coop_levels_tbr_rock_v27",
	"js_coop_lh5_windows",
	"js_coop_lk8",
	"js_coop_lockdown_tbr_v3",
	"js_coop_manticore",
	"js_coop_nation_z1",
	"js_coop_quest_v9",
	"js_coop_ravenholm_x2",
	"js_coop_save_dog_tbr_v3",
	"js_coop_sewers_v5",
	"js_coop_shore",
	"js_coop_sky_chase_tbr_v3",
	"js_coop_stargate_p9",
	"js_coop_stoneland_reborn",
	"js_coop_subway_x_v6",
	"js_coop_tbr_cave_v5_!",
	"js_coop_thunder",
	"js_coop_train_station_v1",
	"js_coop_ultraviolet_x_v2",
	"js_coop_vtol_x_v5",
	"js_coop_warpath_v3",
	"level03_underground_1f5",
	"level04_across_the_darkness3a",
	"level05_diehard_fix2",
	"level06_the_base",
	"level08_a_place_to_die_a4",
	"level09_choose_your_destiny_a1",
	"level10_end_of_evil_a2",
	"sg_coop_lockdown_b3",
	"sg_coop_steamlab_b5",
	"tbr_coop_thousand_antlions_v3b",
	"zwonder_2_v2",
	
	"hl2c_custom01_gc",
	"hl2c_orangemaze_b1",
}

GAMETYPE.ClassesEnemyNPC =
{

}

GAMETYPE.ImportantPlayerNPCNames =
{

}

GAMETYPE.ImportantPlayerNPCClasses =
{

}


hook.Add("Hl2c.LoadGameTypes", "HL2DMGameType", function(gametypes)
	gametypes:Add("hl2mp", GAMETYPE)
end)