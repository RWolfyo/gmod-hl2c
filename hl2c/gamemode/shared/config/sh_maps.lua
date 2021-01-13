if SERVER then AddCSLuaFile() end

Hl2c.GameTypes = {
	// HL2
	["d1_trainstation_01"] = "hl2",
	["d1_trainstation_02"] = "hl2",
	["d1_trainstation_03"] = "hl2",
	["d1_trainstation_04"] = "hl2",
	["d1_trainstation_05"] = "hl2",
	["d1_trainstation_06"] = "hl2",
	["d1_canals_01"] = "hl2",
	["d1_canals_01a"] = "hl2",
	["d1_canals_02"] = "hl2",
	["d1_canals_03"] = "hl2",
	["d1_canals_05"] = "hl2",
	["d1_canals_06"] = "hl2",
	["d1_canals_07"] = "hl2",
	["d1_canals_08"] = "hl2",
	["d1_canals_09"] = "hl2",
	["d1_canals_10"] = "hl2",
	["d1_canals_11"] = "hl2",
	["d1_canals_12"] = "hl2",
	["d1_canals_13"] = "hl2",
	["d1_eli_01"] = "hl2",
	["d1_eli_02"] = "hl2",
	["d1_town_01"] = "hl2",
	["d1_town_01a"] = "hl2",
	["d1_town_02"] = "hl2",
	["d1_town_02a"] = "hl2",
	["d1_town_03"] = "hl2",
	["d1_town_04"] = "hl2",
	["d1_town_05"] = "hl2",
	["d2_coast_01"] = "hl2",
	["d2_coast_03"] = "hl2",
	["d2_coast_04"] = "hl2",
	["d2_coast_05"] = "hl2",
	["d2_coast_07"] = "hl2",
	["d2_coast_08"] = "hl2",
	["d2_coast_09"] = "hl2",
	["d2_coast_10"] = "hl2",
	["d2_coast_11"] = "hl2",
	["d2_coast_12"] = "hl2",
	["d2_prison_01"] = "hl2",
	["d2_prison_02"] = "hl2",
	["d2_prison_03"] = "hl2",
	["d2_prison_04"] = "hl2",
	["d2_prison_05"] = "hl2",
	["d2_prison_06"] = "hl2",
	["d2_prison_07"] = "hl2",
	["d2_prison_08"] = "hl2",
	["d3_c17_01"] = "hl2",
	["d3_c17_02"] = "hl2",
	["d3_c17_03"] = "hl2",
	["d3_c17_04"] = "hl2",
	["d3_c17_05"] = "hl2",
	["d3_c17_06a"] = "hl2",
	["d3_c17_06b"] = "hl2",
	["d3_c17_07"] = "hl2",
	["d3_c17_08"] = "hl2",
	["d3_c17_09"] = "hl2",
	["d3_c17_10a"] = "hl2",
	["d3_c17_10b"] = "hl2",
	["d3_c17_11"] = "hl2",
	["d3_c17_12"] = "hl2",
	["d3_c17_12b"] = "hl2",
	["d3_c17_13"] = "hl2",
	["d3_citadel_01"] = "hl2",
	["d3_citadel_02"] = "hl2",
	["d3_citadel_03"] = "hl2",
	["d3_citadel_04"] = "hl2",
	["d3_citadel_05"] = "hl2",
	["d3_citadel_06"] = "hl2",
	["d3_breen_01"] = "hl2",
	
	// EPISODIC
	["ep1_citadel_00"] = "episodic",
	["ep1_citadel_01"] = "episodic",
	["ep1_citadel_02"] = "episodic",
	["ep1_citadel_02b"] = "episodic",
	["ep1_citadel_03"] = "episodic",
	["ep1_citadel_04"] = "episodic",
	["ep1_c17_00"] = "episodic",
	["ep1_c17_00a"] = "episodic",
	["ep1_c17_01"] = "episodic",
	["ep1_c17_02"] = "episodic",
	["ep1_c17_02a"] = "episodic",
	["ep1_c17_02b"] = "episodic",
	["ep1_c17_05"] = "episodic",
	["ep1_c17_06"] = "episodic",
	
	// EP2
	["ep2_outland_01"] = "ep2",
	["ep2_outland_01a"] = "ep2",
	["ep2_outland_02"] = "ep2",
	["ep2_outland_03"] = "ep2",
	["ep2_outland_04"] = "ep2",
	["ep2_outland_05"] = "ep2",
	["ep2_outland_06"] = "ep2",
	["ep2_outland_06a"] = "ep2",
	["ep2_outland_07"] = "ep2",
	["ep2_outland_08"] = "ep2",
	["ep2_outland_09"] = "ep2",
	["ep2_outland_10"] = "ep2",
	["ep2_outland_10a"] = "ep2",
	["ep2_outland_11"] = "ep2",
	["ep2_outland_11a"] = "ep2",
	["ep2_outland_11b"] = "ep2",
	["ep2_outland_12"] = "ep2",
	["ep2_outland_12a"] = "ep2",
	
	// CD
	["cd0"] = "cd",
	["cd1"] = "cd",
	["cd10"] = "cd",
	["cd12"] = "cd",
	["cd13"] = "cd",
	["cd14"] = "cd",
	["cd15"] = "cd",
	["cd2"] = "cd",
	["cd2_1"] = "cd",
	["cd2_2"] = "cd",
	["cd3_1"] = "cd",
	["cd3_2"] = "cd",
	["cd3_3"] = "cd",
	["cd3_4"] = "cd",
	["cd4"] = "cd",
	["cd5"] = "cd",
	["cd6"] = "cd",
	["cd7"] = "cd",
	["cd8"] = "cd",
	["cd9"] = "cd",
	
	// COASTLINE
	["leonhl2-2"] = "coastline",
	["leonhl2-2b"] = "coastline",
	["leonhl2-2c"] = "coastline",
	["leonhl2-2d"] = "coastline",
	["leonhl2-2da"] = "coastline",
	["leonhl2-2e"] = "coastline",
	["leonhl2-2f"] = "coastline",
	["leonhl2-2g"] = "coastline",
	["leonhl2-2h"] = "coastline",
	["leonhl2-2i"] = "coastline",
	["leonhl2-2j"] = "coastline",
	["leonhl2-2k"] = "coastline",
	["leonhl2-2l"] = "coastline",
	["leonhl2-2m"] = "coastline",
	
	// EP3
	["ep3_antarctic_01"] = "ep3",
	["ep3_antarctic_02"] = "ep3",
	["ep3_antarctic_03"] = "ep3",
	["ep3_borealis_01"] = "ep3",
	
	// GMOD
	["gm_construct"] = "gmod",
	["gm_flatgrass"] = "gmod",
	
	// HL1
	["c0a0"] = "hl1",
	["c1a0"] = "hl1",
	["c1a0a"] = "hl1",
	["c1a0b"] = "hl1",
	["c1a0c"] = "hl1",
	["c1a0d"] = "hl1",
	["c1a0e"] = "hl1",
	["c1a1"] = "hl1",
	["c1a1a"] = "hl1",
	["c1a1b"] = "hl1",
	["c1a1c"] = "hl1",
	["c1a1d"] = "hl1",
	["c1a1f"] = "hl1",
	["c1a1f"] = "hl1",
	["t0a0"] = "hl1",
	["t0a0a"] = "hl1",
	["t0a0b"] = "hl1",
	
	// HL2MP
	["cl_coop_corridor_b3"] = "hl2mp",
	["cl_coop_doors_v2"] = "hl2mp",
	["cl_coop_laserquest_b2"] = "hl2mp",
	["cl_coop_level2_survive_r1"] = "hl2mp",
	["cl_coop_venture_up"] = "hl2mp",
	["coop_123module_v2"] = "hl2mp",
	["coop_antlion_castlewars_bb"] = "hl2mp",
	["coop_ant_tower_b1_3"] = "hl2mp",
	["coop_arn_labyrinth_b3"] = "hl2mp",
	["coop_atlantis_beta4_z2"] = "hl2mp",
	["coop_bb_deserted_v2b7"] = "hl2mp",
	["coop_canalsv10"] = "hl2mp",
	["coop_cc_nochance_v1b60"] = "hl2mp",
	["coop_citadel_escape_v2fix"] = "hl2mp",
	["coop_city17_bouncy9"] = "hl2mp",
	["coop_epcycle_v4"] = "hl2mp",
	["coop_fleeravenholm_z1"] = "hl2mp",
	["coop_great_evil"] = "hl2mp",
	["coop_hl2portal_mix_fix"] = "hl2mp",
	["coop_lemongames_beta5"] = "hl2mp",
	["coop_level01_dooms_entry_v1b"] = "hl2mp",
	["coop_level02_traps_v1c"] = "hl2mp",
	["coop_level07_scary_house_v4"] = "hl2mp",
	["coop_level_1b_cube"] = "hl2mp",
	["coop_level_7b"] = "hl2mp",
	["coop_manticore"] = "hl2mp",
	["coop_meows_corridors_z1"] = "hl2mp",
	["coop_meows_fundayout_z1"] = "hl2mp",
	["coop_meows_house_to_house_z1"] = "hl2mp",
	["coop_meows_icey_topsy_turvey"] = "hl2mp",
	["coop_meows_kill_em_all_z1"] = "hl2mp",
	["coop_meows_pitifull_v_1"] = "hl2mp",
	["coop_meows_pyramid_z1"] = "hl2mp",
	["coop_meows_revenge_v_3"] = "hl2mp",
	["coop_meows_runoff_ver_1"] = "hl2mp",
	["coop_meows_runoff_ver_4"] = "hl2mp",
	["coop_meows_runoff_v_4"] = "hl2mp",
	["coop_meows_sewer_mania_r2"] = "hl2mp",
	["coop_meows_stairway_hell_v_2"] = "hl2mp",
	["coop_meows_winterwonderland_z1"] = "hl2mp",
	["coop_missile_silo"] = "hl2mp",
	["coop_npcwar2_final"] = "hl2mp",
	["coop_npcwar3_aldo"] = "hl2mp",
	["coop_npcwar3_final"] = "hl2mp",
	["coop_npcwar_final"] = "hl2mp",
	["coop_swampthing_v6"] = "hl2mp",
	["coop_town_level4d"] = "hl2mp",
	["coop_train_escape_z1"] = "hl2mp",
	["coop_traps_v1c"] = "hl2mp",
	["coop_underground_x_pgir_v2"] = "hl2mp",
	["coop_venture_v1c"] = "hl2mp",
	["coop_wardogs_v5"] = "hl2mp",
	["co_infested_beta2-5"] = "hl2mp",
	["infiltration1"] = "hl2mp",
	["js_co-op_tbr_steamlab_v7"] = "hl2mp",
	["js_co-op_train_lvls_v5b"] = "hl2mp",
	["js_coop_123module_v2"] = "hl2mp",
	["js_coop_acc_v6"] = "hl2mp",
	["js_coop_basemission_beta"] = "hl2mp",
	["js_coop_cavettc_ob"] = "hl2mp",
	["js_coop_citadel_blast_v5"] = "hl2mp",
	["js_coop_citadel_blast_x_v2"] = "hl2mp",
	["js_coop_coast_x_v5"] = "hl2mp",
	["js_coop_combine2_sg_b4"] = "hl2mp",
	["js_coop_cranecase_p1"] = "hl2mp",
	["js_coop_deep_v12"] = "hl2mp",
	["js_coop_docks_crane_final"] = "hl2mp",
	["js_coop_gethev_pr2"] = "hl2mp",
	["js_coop_helicave_x_v2"] = "hl2mp",
	["js_coop_horror_v13"] = "hl2mp",
	["js_coop_jackass_v9"] = "hl2mp",
	["js_coop_lc3_nuke_m"] = "hl2mp",
	["js_coop_ld2"] = "hl2mp",
	["js_coop_level4_x_v2"] = "hl2mp",
	["js_coop_level5_x_v1"] = "hl2mp",
	["js_coop_level6_x_v3"] = "hl2mp",
	["js_coop_level8_x_v1"] = "hl2mp",
	["js_coop_levelcube_ttc_a"] = "hl2mp",
	["js_coop_levels_tbr_rock_v27"] = "hl2mp",
	["js_coop_lh5_windows"] = "hl2mp",
	["js_coop_lk8"] = "hl2mp",
	["js_coop_lockdown_tbr_v3"] = "hl2mp",
	["js_coop_manticore"] = "hl2mp",
	["js_coop_nation_z1"] = "hl2mp",
	["js_coop_quest_v9"] = "hl2mp",
	["js_coop_ravenholm_x2"] = "hl2mp",
	["js_coop_save_dog_tbr_v3"] = "hl2mp",
	["js_coop_sewers_v5"] = "hl2mp",
	["js_coop_shore"] = "hl2mp",
	["js_coop_sky_chase_tbr_v3"] = "hl2mp",
	["js_coop_stargate_p9"] = "hl2mp",
	["js_coop_stoneland_reborn"] = "hl2mp",
	["js_coop_subway_x_v6"] = "hl2mp",
	["js_coop_tbr_cave_v5_!"] = "hl2mp",
	["js_coop_thunder"] = "hl2mp",
	["js_coop_train_station_v1"] = "hl2mp",
	["js_coop_ultraviolet_x_v2"] = "hl2mp",
	["js_coop_vtol_x_v5"] = "hl2mp",
	["js_coop_warpath_v3"] = "hl2mp",
	["level03_underground_1f5"] = "hl2mp",
	["level04_across_the_darkness3a"] = "hl2mp",
	["level05_diehard_fix2"] = "hl2mp",
	["level06_the_base"] = "hl2mp",
	["level08_a_place_to_die_a4"] = "hl2mp",
	["level09_choose_your_destiny_a1"] = "hl2mp",
	["level10_end_of_evil_a2"] = "hl2mp",
	["sg_coop_lockdown_b3"] = "hl2mp",
	["sg_coop_steamlab_b5"] = "hl2mp",
	["tbr_coop_thousand_antlions_v3b"] = "hl2mp",
	["zwonder_2_v2"] = "hl2mp",
	
	["hl2c_custom01_gc"] = "hl2mp",
	["hl2c_orangemaze_b1"] = "hl2mp",
	
	// LOBBY
	["winter_lobby_2012"] = "lobby",
	["keyfox_lobby_summer"] = "lobby",
	
	// LOSTCOAST
	["d2_lostcoast"] = "lostcoast",
	
	// METASTASIS
	["metastasis_1"] = "metastasis",
	["metastasis_2"] = "metastasis",
	["metastasis_3"] = "metastasis",
	["metastasis_4a"] = "metastasis",
	["metastasis_4b"] = "metastasis",
	
	// OC
	["ep1_oc_broken_escape_01"] = "oc",
	["ep2_oc_broken_escape_02a"] = "oc",
	["ep2_oc_broken_escape_02b"] = "oc",
	["ep2_oc_broken_escape_02c"] = "oc",
	["ep2_oc_outhouse_1r2"] = "oc",
	["ocf_deadland"] = "oc",
	["oc_antlion_attack_01"] = "oc",
	["oc_atfor_cityfight_v3"] = "oc",
	["oc_breakout"] = "oc",
	["oc_bunker"] = "oc",
	["oc_fireteam_1"] = "oc",
	["oc_fireteam_2"] = "oc",
	["oc_harvest"] = "oc",
	["oc_starship_troopers"] = "oc",
	["oc_trashstand_v2"] = "oc",
	["oc_wildfire"] = "oc",
	["rebel_ways_01"] = "oc",
	["rebel_ways_02"] = "oc",
	
	// SYN
	["synb2_fast_df_extinction_hl2mp"] = "syn",
	["synb2_grand_bleu_b1"] = "syn",
	["syn_antlions_way"] = "syn",
	["syn_breenoffice_v1c"] = "syn",
	["syn_bunker"] = "syn",
	["syn_desolate"] = "syn",
	["syn_forgotten_evils"] = "syn",
	["syn_kab_escape_part1_v4"] = "syn",
	["syn_littletowndefense_hl2mp"] = "syn",
	["syn_lvcoop_part1"] = "syn",
	["syn_lvcoop_part2"] = "syn",
	["syn_oldcanals"] = "syn",
	["syn_sevenhourwar_part1"] = "syn",
	["syn_silent_house"] = "syn",
	["syn_takeover"] = "syn",
	["syn_urbanchaos"] = "syn",
	
	
	
}

Hl2c.Maps = Hl2c.Maps or {}

Hl2c.Maps.Hl2 = {

	["d1_trainstation_01"] = true,
	["d1_trainstation_02"] = true,
	["d1_trainstation_03"] = true,
	["d1_trainstation_04"] = true,
	["d1_trainstation_05"] = true,
	["d1_trainstation_06"] = true,
	["d1_canals_01"] = true,
	["d1_canals_01a"] = true,
	["d1_canals_02"] = true,
	["d1_canals_03"] = true,
	["d1_canals_05"] = true,
	["d1_canals_06"] = true,
	["d1_canals_07"] = true,
	["d1_canals_08"] = true,
	["d1_canals_09"] = true,
	["d1_canals_10"] = true,
	["d1_canals_11"] = true,
	["d1_canals_12"] = true,
	["d1_canals_13"] = true,
	["d1_eli_01"] = true,
	["d1_eli_02"] = true,
	["d1_town_01"] = true,
	["d1_town_01a"] = true,
	["d1_town_02"] = true,
	["d1_town_02a"] = true,
	["d1_town_03"] = true,
	["d1_town_04"] = true,
	["d1_town_05"] = true,
	["d2_coast_01"] = true,
	["d2_coast_03"] = true,
	["d2_coast_04"] = true,
	["d2_coast_05"] = true,
	["d2_coast_07"] = true,
	["d2_coast_08"] = true,
	["d2_coast_09"] = true,
	["d2_coast_10"] = true,
	["d2_coast_11"] = true,
	["d2_coast_12"] = true,
	["d2_prison_01"] = true,
	["d2_prison_02"] = true,
	["d2_prison_03"] = true,
	["d2_prison_04"] = true,
	["d2_prison_05"] = true,
	["d2_prison_06"] = true,
	["d2_prison_07"] = true,
	["d2_prison_08"] = true,
	["d3_c17_01"] = true,
	["d3_c17_02"] = true,
	["d3_c17_03"] = true,
	["d3_c17_04"] = true,
	["d3_c17_05"] = true,
	["d3_c17_06a"] = true,
	["d3_c17_06b"] = true,
	["d3_c17_07"] = true,
	["d3_c17_08"] = true,
	["d3_c17_09"] = true,
	["d3_c17_10a"] = true,
	["d3_c17_10b"] = true,
	["d3_c17_11"] = true,
	["d3_c17_12"] = true,
	["d3_c17_12b"] = true,
	["d3_c17_13"] = true,
	["d3_citadel_01"] = true,
	["d3_citadel_02"] = true,
	["d3_citadel_03"] = true,
	["d3_citadel_04"] = true,
	["d3_citadel_05"] = true,
	["d3_citadel_06"] = true,
	["d3_breen_01"] = true
}

Hl2c.Maps.Ep1 = {
	["ep1_citadel_00"] = true,
	["ep1_citadel_01"] = true,
	["ep1_citadel_02"] = true,
	["ep1_citadel_02b"] = true,
	["ep1_citadel_03"] = true,
	["ep1_citadel_04"] = true,
	["ep1_c17_00"] = true,
	["ep1_c17_00a"] = true,
	["ep1_c17_01"] = true,
	["ep1_c17_02"] = true,
	["ep1_c17_02a"] = true,
	["ep1_c17_02b"] = true,
	["ep1_c17_05"] = true,
	["ep1_c17_06"] = true

}

Hl2c.Maps.Ep2 = {
	["ep2_outland_01"] = true,
	["ep2_outland_01a"] = true,
	["ep2_outland_02"] = true,
	["ep2_outland_03"] = true,
	["ep2_outland_04"] = true,
	["ep2_outland_05"] = true,
	["ep2_outland_06"] = true,
	["ep2_outland_06a"] = true,
	["ep2_outland_07"] = true,
	["ep2_outland_08"] = true,
	["ep2_outland_09"] = true,
	["ep2_outland_10"] = true,
	["ep2_outland_10a"] = true,
	["ep2_outland_11"] = true,
	["ep2_outland_11a"] = true,
	["ep2_outland_11b"] = true,
	["ep2_outland_12"] = true,
	["ep2_outland_12a"] = true
}
