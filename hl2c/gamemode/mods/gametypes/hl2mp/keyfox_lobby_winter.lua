--INFO_PLAYER_SPAWN = {Vector( 163.27, -31.65, 141.03 ), 0}
RESET_PL_INFO = true
HL2MP_IS_COOP_MAP = true

NEXT_MAP = "keyfox_lobby_winter"

--TRIGGER_DELAYMAPLOAD = {Vector(-1000, -1000, -1000), Vector(-1000, -1000, -1000)}

hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
	
	local logic = ents.FindByClass("logic_auto")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_door,Open,,1,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_ep1_door,Open,,1,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_ep2_door,Open,,1,-1")
	//Hl2 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn chapter1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter5_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter6_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter7_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter8_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter9_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter9a_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter10_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter11_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter12_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter13_brush,Disable,,0,-1")
	
	//Ep1 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter5_brush,Disable,,0,-1")
	
	//Ep2 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter5_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter6_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter7_brush,Disable,,0,-1")
	
	//Custom Maps
	logic[1]:Fire("addoutput", "OnMapSpawn level1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level5_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level6_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level7_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level8_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level9_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level10_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level11_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level12_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level13_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level14_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level15_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level16_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level17_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level18_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level19_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level20_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level21_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level22_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level23_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level24_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level25_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level26_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level27_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level28_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level29_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level30_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level31_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level32_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level33_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level34_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level35_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level36_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level37_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level38_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level39_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn level40_brush,Disable,,0,-1")
	
	
	//Custom Maps Setup
	--	coop_npcwar_final
	local ltxt_all_01 = ents.FindByName("level1_text_all")
	ltxt_all_01[1]:SetKeyValue("message", "coop_npcwar_final")
	
	local ltxt_01 = ents.FindByName("level1_text")
	ltxt_01[1]:SetKeyValue("message", "coop_npcwar_final")
	
	local ltrigger_01 = ents.FindByName("level1_trigger")
	ltrigger_01[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_npcwar_final,5,1")
	
	--	coop_npcwar2_final
	local ltxt_all_02 = ents.FindByName("level2_text_all")
	ltxt_all_02[1]:SetKeyValue("message", "coop_npcwar2_final")
	
	local ltxt_02 = ents.FindByName("level2_text")
	ltxt_02[1]:SetKeyValue("message", "coop_npcwar2_final")
	
	local ltrigger_02 = ents.FindByName("level2_trigger")
	ltrigger_02[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_npcwar2_final,5,1")
	
	--	coop_npcwar3_final
	local ltxt_all_03 = ents.FindByName("level3_text_all")
	ltxt_all_03[1]:SetKeyValue("message", "coop_npcwar3_final")
	
	local ltxt_03 = ents.FindByName("level3_text")
	ltxt_03[1]:SetKeyValue("message", "coop_npcwar3_final")
	
	local ltrigger_03 = ents.FindByName("level3_trigger")
	ltrigger_03[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_npcwar3_final,5,1")
	
	--	coop_atlantis_beta4_z2
	local ltxt_all_04 = ents.FindByName("level4_text_all")
	ltxt_all_04[1]:SetKeyValue("message", "coop_atlantis_beta4_z2")
	
	local ltxt_04 = ents.FindByName("level4_text")
	ltxt_04[1]:SetKeyValue("message", "coop_atlantis_beta4_z2")
	
	local ltrigger_04 = ents.FindByName("level4_trigger")
	ltrigger_04[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_atlantis_beta4_z2,5,1")
	
	--	coop_swampthing_v6
	local ltxt_all_05 = ents.FindByName("level5_text_all")
	ltxt_all_05[1]:SetKeyValue("message", "coop_swampthing_v6")
	
	local ltxt_05 = ents.FindByName("level5_text")
	ltxt_05[1]:SetKeyValue("message", "coop_swampthing_v6")
	
	local ltrigger_05 = ents.FindByName("level5_trigger")
	ltrigger_05[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_swampthing_v6,5,1")
	
	--	js_coop_sky_chase_tbr_v3
	local ltxt_all_06 = ents.FindByName("level6_text_all")
	ltxt_all_06[1]:SetKeyValue("message", "js_coop_sky_chase_tbr_v3")
	
	local ltxt_06 = ents.FindByName("level6_text")
	ltxt_06[1]:SetKeyValue("message", "js_coop_sky_chase_tbr_v3")
	
	local ltrigger_06 = ents.FindByName("level6_trigger")
	ltrigger_06[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel js_coop_sky_chase_tbr_v3,5,1")
	
	--	coop_level01_dooms_entry_v1b
	local ltxt_all_21 = ents.FindByName("level21_text_all")
	ltxt_all_21[1]:SetKeyValue("message", "coop_level01_dooms_entry_v1b")
	
	local ltxt_21 = ents.FindByName("level21_text")
	ltxt_21[1]:SetKeyValue("message", "coop_level01_dooms_entry_v1b")
	
	local ltrigger_21 = ents.FindByName("level21_trigger")
	ltrigger_21[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel coop_level01_dooms_entry_v1b,5,1")
	
	
	// Custom Maps Door Setup Ends Here
	
	
	//Open doors remove stuffs
	local hate_music = ents.FindByName("gnome_song")
	hate_music[1]:Fire("Kill", "1", "1.0")
	
	
	--Hl2 triggers
	local hl2ch1_trigger = ents.FindByName("chapter1_trigger")
	hl2ch1_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_trainstation_01,5,1")
	
	local hl2ch2_trigger = ents.FindByName("chapter2_trigger")
	hl2ch2_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_trainstation_05,5,1")
	
	local hl2ch3_trigger = ents.FindByName("chapter3_trigger")
	hl2ch3_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_canals_01,5,1")
	
	local hl2ch4_trigger = ents.FindByName("chapter4_trigger")
	hl2ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_canals_06,5,1")
	
	local hl2ch5_trigger = ents.FindByName("chapter5_trigger")
	hl2ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_eli_01,5,1")
	
	local hl2ch6_trigger = ents.FindByName("chapter6_trigger")
	hl2ch6_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d1_town_01,5,1")
	
	local hl2ch7_trigger = ents.FindByName("chapter7_trigger")
	hl2ch7_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d2_coast_01,5,1")
	
	local hl2ch8_trigger = ents.FindByName("chapter8_trigger")
	hl2ch8_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d2_coast_09,5,1")
	
	local hl2ch9_trigger = ents.FindByName("chapter9_trigger")
	hl2ch9_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d2_prison_02,5,1")
	
	local hl2ch10_trigger = ents.FindByName("chapter9a_trigger")
	hl2ch10_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d2_prison_06,5,1")
	
	local hl2ch11_trigger = ents.FindByName("chapter10_trigger")
	hl2ch11_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d3_c17_02,5,1")
	
	local hl2ch12_trigger = ents.FindByName("chapter11_trigger")
	hl2ch12_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d3_c17_09,5,1")
	
	local hl2ch13_trigger = ents.FindByName("chapter12_trigger")
	hl2ch13_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d3_citadel_01,5,1")
	
	local hl2ch14_trigger = ents.FindByName("chapter13_trigger")
	hl2ch14_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel d3_breen_01,5,1")
	
	
	--Ep1 Triggers
	local ep1ch1_trigger = ents.FindByName("ep1_chapter1_trigger")
	ep1ch1_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep1_citadel_01,5,1")
	
	local ep1ch2_trigger = ents.FindByName("ep1_chapter2_trigger")
	ep1ch2_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep1_citadel_03,5,1")
	
	local ep1ch3_trigger = ents.FindByName("ep1_chapter3_trigger")
	ep1ch3_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep1_c17_00,5,1")
	
	local ep1ch4_trigger = ents.FindByName("ep1_chapter4_trigger")
	ep1ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep1_c17_01,5,1")
	
	local ep1ch5_trigger = ents.FindByName("ep1_chapter5_trigger")
	ep1ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep1_c17_05,5,1")
	
	--Ep2 Triggers
	local ep2ch1_trigger = ents.FindByName("ep2_chapter1_trigger")
	ep2ch1_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_01,5,1")
	
	local ep2ch2_trigger = ents.FindByName("ep2_chapter2_trigger")
	ep2ch2_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_02,5,1")
	
	local ep2ch3_trigger = ents.FindByName("ep2_chapter3_trigger")
	ep2ch3_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_05,5,1")
	
	local ep2ch4_trigger = ents.FindByName("ep2__chapter4_trigger")
	ep2ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_06a,5,1")
	
	local ep2ch5_trigger = ents.FindByName("ep2_chapter5_trigger")
	ep2ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_09,5,1")
	
	local ep2ch6_trigger = ents.FindByName("ep2_chapter6_trigger")
	ep2ch6_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_11,5,1")
	
	local ep2ch7_trigger = ents.FindByName("ep2_chapter7_trigger")
	ep2ch7_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,changelevel ep2_outland_12a,5,1")
	
end)

hook.Add("PlayerSpawn", "hl2cPlayerSpawn", function(pl)
	pl:Give("weapon_crowbar")
end)