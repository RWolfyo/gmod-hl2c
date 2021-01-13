

if game.GetMap() == "keyfox_lobby_summer" or game.GetMap() == "winter_lobby_2012" then else return end

local DbgPrint = GetLogging("Lobby")

local MAPSCRIPT = {}

if SERVER then

	resource.AddWorkshop("647189081")	-- 	Lobby Content
	resource.AddWorkshop("784153802")	-- 	Lobby Content
/*
	game.AddParticles( "particles/snow.pcf" )
	
	PrecacheParticleSystem( "Snow" )
	
	game.AddParticles( "particles/christmastree_glow.pcf" )
	
	PrecacheParticleSystem( "christmastree_glow" )
	
	PrecacheParticleSystem( "xmastree_shootingstar" )
	
	PrecacheParticleSystem( "christmasstar1" )
	
	game.AddParticles( "particles/voimala.pcf" )
	
	
	game.AddParticles( "particles/voimala_fog.pcf" )
	
	PrecacheParticleSystem( "Voimala_fog" )
	
	PrecacheParticleSystem( "fog" )
*/
end

RESET_PL_INFO = true
HL2MP_IS_COOP_MAP = true
LOBBY_MAP = true

NEXT_MAP = game.GetMap()

OC_MAP = true
--POINT_TRIGGER_DEBUG = false
--ENT_VORTEX_DEBUG = true
NEW_DIF = true

--VORTEX_MAP = "v_winter_lobby_2012"
--VORTEX_POS = Vector(861, 221, 112)

--TRIGGER_DELAYMAPLOAD = {Vector(-1000, -1000, -1000), Vector(-1000, -1000, -1000)}

MAPSCRIPT.EntityFilterByName = {
	
}
MAPSCRIPT.EntityFilterByClass = {
	["info_particle_system"] = true,
}

MAPSCRIPT.InputFilters = {
	
}

function MAPSCRIPT:EntityRemoved(ent)

end

function MAPSCRIPT:KeyValue(ent, key, value)

end

function MAPSCRIPT:InitPost()
	
	
	local logic = ents.FindByClass("logic_auto")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_door,Open,,1,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_ep1_door,Open,,1,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn Hl2_ep2_door,Open,,1,-1")
	//Hl2 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn chapter1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn chapter4_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter5_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter6_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter7_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter8_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter9_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter9a_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter10_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter11_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter12_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn chapter13_brush,Disable,,0,-1")
	
	//Ep1 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter1_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter2_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter3_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter4_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep1_chapter5_brush,Disable,,0,-1")
	
	//Ep2 Doors
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter2_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter3_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter4_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter5_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter6_brush,Disable,,0,-1")
	--logic[1]:Fire("addoutput", "OnMapSpawn ep2_chapter7_brush,Disable,,0,-1")
	
	//Custom Maps
	logic[1]:Fire("addoutput", "OnMapSpawn level1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level5_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level6_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level7_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level8_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level9_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level10_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level11_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level12_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level13_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level14_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level15_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level16_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level17_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level18_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level19_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level20_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level21_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn level22_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic1_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic2_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic3_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic4_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic5_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic6_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic7_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic8_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic9_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic10_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic11_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic12_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic13_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic14_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic15_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic16_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic17_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic18_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic19_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic20_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic21_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic22_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic23_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic24_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic25_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic26_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic27_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic28_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic29_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic30_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic31_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic32_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic33_brush,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn dynamic34_brush,Disable,,0,-1")
	
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
	for k, v in pairs(ents.FindByName("level1_text_all")) do
	v:SetKeyValue("message", "coop_npcwar_final")
	end
	for k, v in pairs(ents.FindByName("level1_text")) do
	v:SetKeyValue("message", "coop_npcwar_final")
	end
	for k, v in pairs(ents.FindByName("level1_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_npcwar_final,5,1")
	end
	///////////////////////////////////////////////
	--	coop_npcwar2_final
	for k, v in pairs(ents.FindByName("level2_text_all")) do
	v:SetKeyValue("message", "coop_npcwar2_final")
	end
	
	for k, v in pairs(ents.FindByName("level2_text")) do
	v:SetKeyValue("message", "coop_npcwar2_final")
	end
	for k, v in pairs(ents.FindByName("level2_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_npcwar2_final,5,1")
	end
	///////////////////////////////////////////////
	--	coop_npcwar3_final
	for k, v in pairs(ents.FindByName("level3_text_all")) do
	v:SetKeyValue("message", "coop_npcwar3_final")
	end
	for k, v in pairs(ents.FindByName("level3_text")) do
	v:SetKeyValue("message", "coop_npcwar3_final")
	end
	for k, v in pairs(ents.FindByName("level3_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_npcwar3_final,5,1")
	end
	
	///////////////////////////////////////////////
	--	coop_atlantis_beta4_z2
	for k, v in pairs(ents.FindByName("level4_text_all")) do
	v:SetKeyValue("message", "coop_atlantis_beta4_z2")
	end
	for k, v in pairs(ents.FindByName("level4_text")) do
	v:SetKeyValue("message", "coop_atlantis_beta4_z2")
	end
	for k, v in pairs(ents.FindByName("level4_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_atlantis_beta4_z2,5,1")
	end
	///////////////////////////////////////////////
	--	coop_swampthing_v6
	for k, v in pairs(ents.FindByName("level5_text_all")) do
	v:SetKeyValue("message", "coop_swampthing_v6")
	end
	for k, v in pairs(ents.FindByName("level5_text")) do
	v:SetKeyValue("message", "coop_swampthing_v6")
	end
	for k, v in pairs(ents.FindByName("level5_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_swampthing_v6,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_sky_chase_tbr_v3
	for k, v in pairs(ents.FindByName("level6_text_all")) do
	v:SetKeyValue("message", "js_coop_sky_chase_tbr_v3")
	end
	for k, v in pairs(ents.FindByName("level6_text")) do
	v:SetKeyValue("message", "js_coop_sky_chase_tbr_v3")
	end
	for k, v in pairs(ents.FindByName("level6_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_sky_chase_tbr_v3,5,1")
	end
	///////////////////////////////////////////////
	--	coop_level01_dooms_entry_v1b
	for k, v in pairs(ents.FindByName("level21_text_all")) do
	v:SetKeyValue("message", "coop_level01_dooms_entry_v1b")
	end
	for k, v in pairs(ents.FindByName("level21_text")) do
	v:SetKeyValue("message", "coop_level01_dooms_entry_v1b")
	end
	for k, v in pairs(ents.FindByName("level21_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_level01_dooms_entry_v1b,5,1")
	end
	///////////////////////////////////////////////
	--	coop_level02_traps_v1c
	for k, v in pairs(ents.FindByName("level20_text_all")) do
	v:SetKeyValue("message", "coop_level02_traps_v1c")
	end
	for k, v in pairs(ents.FindByName("level20_text")) do
	v:SetKeyValue("message", "coop_level02_traps_v1c")
	end
	for k, v in pairs(ents.FindByName("level20_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_level02_traps_v1c,5,1")
	end
	///////////////////////////////////////////////
	--	level03_underground_1f5
	for k, v in pairs(ents.FindByName("level19_text_all")) do
	v:SetKeyValue("message", "level03_underground_1f5")
	end
	for k, v in pairs(ents.FindByName("level19_text")) do
	v:SetKeyValue("message", "level03_underground_1f5")
	end
	for k, v in pairs(ents.FindByName("level19_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level03_underground_1f5,5,1")
	end
	///////////////////////////////////////////////
	--	level04_across_the_darkness3a
	for k, v in pairs(ents.FindByName("level18_text_all")) do
	v:SetKeyValue("message", "level04_across_the_darkness3a")
	end
	for k, v in pairs(ents.FindByName("level18_text")) do
	v:SetKeyValue("message", "level04_across_the_darkness3a")
	end
	for k, v in pairs(ents.FindByName("level18_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level04_across_the_darkness3a,5,1")
	end
	///////////////////////////////////////////////
	--	level05_diehard_fix2
	for k, v in pairs(ents.FindByName("level17_text_all")) do
	v:SetKeyValue("message", "level05_diehard_fix2")
	end
	for k, v in pairs(ents.FindByName("level17_text")) do
	v:SetKeyValue("message", "level05_diehard_fix2")
	end
	for k, v in pairs(ents.FindByName("level17_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level05_diehard_fix2,5,1")
	end
	///////////////////////////////////////////////
	--	level06_the_base
	for k, v in pairs(ents.FindByName("level16_text_all")) do
	v:SetKeyValue("message", "level06_the_base")
	end
	for k, v in pairs(ents.FindByName("level16_text")) do
	v:SetKeyValue("message", "level06_the_base")
	end
	for k, v in pairs(ents.FindByName("level16_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level06_the_base,5,1")
	end
	///////////////////////////////////////////////
	--	coop_level07_scary_house_v4
	for k, v in pairs(ents.FindByName("level15_text_all")) do
	v:SetKeyValue("message", "coop_level07_scary_house_v4")
	end
	for k, v in pairs(ents.FindByName("level15_text")) do
	v:SetKeyValue("message", "coop_level07_scary_house_v4")
	end
	for k, v in pairs(ents.FindByName("level15_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_level07_scary_house_v4,5,1")
	end
	///////////////////////////////////////////////
	--	level08_a_place_to_die_a4
	for k, v in pairs(ents.FindByName("level14_text_all")) do
	v:SetKeyValue("message", "level08_a_place_to_die_a4")
	end
	for k, v in pairs(ents.FindByName("level14_text")) do
	v:SetKeyValue("message", "level08_a_place_to_die_a4")
	end
	for k, v in pairs(ents.FindByName("level14_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level08_a_place_to_die_a4,5,1")
	end
	///////////////////////////////////////////////
	--	level09_choose_your_destiny_a1
	for k, v in pairs(ents.FindByName("level13_text_all")) do
	v:SetKeyValue("message", "level09_choose_your_destiny_a1")
	end
	for k, v in pairs(ents.FindByName("level13_text")) do
	v:SetKeyValue("message", "level09_choose_your_destiny_a1")
	end
	for k, v in pairs(ents.FindByName("level13_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level09_choose_your_destiny_a1,5,1")
	end
	///////////////////////////////////////////////
	--	level10_end_of_evil_a2
	for k, v in pairs(ents.FindByName("level12_text_all")) do
	v:SetKeyValue("message", "level10_end_of_evil_a2")
	end
	for k, v in pairs(ents.FindByName("level12_text")) do
	v:SetKeyValue("message", "level10_end_of_evil_a2")
	end
	for k, v in pairs(ents.FindByName("level12_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel level10_end_of_evil_a2,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_helicave_x_v2
	for k, v in pairs(ents.FindByName("level11_text_all")) do
	v:SetKeyValue("message", "js_coop_helicave_x_v2")
	end
	for k, v in pairs(ents.FindByName("level11_text")) do
	v:SetKeyValue("message", "js_coop_helicave_x_v2")
	end
	for k, v in pairs(ents.FindByName("level11_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_helicave_x_v2,5,1")
	end
	///////////////////////////////////////////////
	
	--	coop_meows_pyramid_z1
	for k, v in pairs(ents.FindByName("level10_text_all")) do
	v:SetKeyValue("message", "coop_meows_pyramid_z1")
	end
	for k, v in pairs(ents.FindByName("level10_text")) do
	v:SetKeyValue("message", "coop_meows_pyramid_z1")
	end
	for k, v in pairs(ents.FindByName("level10_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_meows_pyramid_z1,5,1")
	end
	///////////////////////////////////////////////
	--	coop_fleeravenholm_z1
	for k, v in pairs(ents.FindByName("level9_text_all")) do
	v:SetKeyValue("message", "coop_fleeravenholm_z1")
	end
	for k, v in pairs(ents.FindByName("level9_text")) do
	v:SetKeyValue("message", "coop_fleeravenholm_z1")
	end
	for k, v in pairs(ents.FindByName("level9_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_fleeravenholm_z1,5,1")
	end
	///////////////////////////////////////////////
	--	coop_underground_x_pgir_v2
	for k, v in pairs(ents.FindByName("level8_text_all")) do
	v:SetKeyValue("message", "coop_underground_x_pgir_v2")
	end
	for k, v in pairs(ents.FindByName("level8_text")) do
	v:SetKeyValue("message", "coop_underground_x_pgir_v2")
	end
	for k, v in pairs(ents.FindByName("level8_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_underground_x_pgir_v2,5,1")
	end
	///////////////////////////////////////////////
	--	coop_meows_sewer_mania_r2
	for k, v in pairs(ents.FindByName("level7_text_all")) do
	v:SetKeyValue("message", "coop_meows_sewer_mania_r2")
	end
	for k, v in pairs(ents.FindByName("level7_text")) do
	v:SetKeyValue("message", "coop_meows_sewer_mania_r2")
	end
	for k, v in pairs(ents.FindByName("level7_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_meows_sewer_mania_r2,5,1")
	end
	///////////////////////////////////////////////
	--	tbr_coop_thousand_antlions_v3b
	for k, v in pairs(ents.FindByName("level22_text_all")) do
	v:SetKeyValue("message", "tbr_coop_thousand_antlions_v3b")
	end
	for k, v in pairs(ents.FindByName("level22_text")) do
	v:SetKeyValue("message", "tbr_coop_thousand_antlions_v3b")
	end
	for k, v in pairs(ents.FindByName("level22_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel tbr_coop_thousand_antlions_v3b,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_shore
	for k, v in pairs(ents.FindByName("dynamic1_text_all")) do
	v:SetKeyValue("message", "js_coop_shore")
	end
	for k, v in pairs(ents.FindByName("dynamic1_text")) do
	v:SetKeyValue("message", "js_coop_shore")
	end
	for k, v in pairs(ents.FindByName("dynamic1_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_shore,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_subway_x_v6
	for k, v in pairs(ents.FindByName("dynamic2_text_all")) do
	v:SetKeyValue("message", "js_coop_subway_x_v6")
	end
	for k, v in pairs(ents.FindByName("dynamic2_text")) do
	v:SetKeyValue("message", "js_coop_subway_x_v6")
	end
	for k, v in pairs(ents.FindByName("dynamic2_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_subway_x_v6,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_thunder
	for k, v in pairs(ents.FindByName("dynamic3_text_all")) do
	v:SetKeyValue("message", "js_coop_thunder")
	end
	for k, v in pairs(ents.FindByName("dynamic3_text")) do
	v:SetKeyValue("message", "js_coop_thunder")
	end
	for k, v in pairs(ents.FindByName("dynamic3_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_thunder,5,1")
	end
	///////////////////////////////////////////////
	--	sg_coop_lockdown_b3
	for k, v in pairs(ents.FindByName("dynamic4_text_all")) do
	v:SetKeyValue("message", "sg_coop_lockdown_b3")
	end
	for k, v in pairs(ents.FindByName("dynamic4_text")) do
	v:SetKeyValue("message", "sg_coop_lockdown_b3")
	end
	for k, v in pairs(ents.FindByName("dynamic4_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel sg_coop_lockdown_b3,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_sewers_v5
	for k, v in pairs(ents.FindByName("dynamic5_text_all")) do
	v:SetKeyValue("message", "js_coop_sewers_v5")
	end
	for k, v in pairs(ents.FindByName("dynamic5_text")) do
	v:SetKeyValue("message", "js_coop_sewers_v5")
	end
	for k, v in pairs(ents.FindByName("dynamic5_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_sewers_v5,5,1")
	end
	///////////////////////////////////////////////
	--	js_coop_stargate_p9
	for k, v in pairs(ents.FindByName("dynamic6_text_all")) do
	v:SetKeyValue("message", "js_coop_stargate_p9")
	end
	for k, v in pairs(ents.FindByName("dynamic6_text")) do
	v:SetKeyValue("message", "js_coop_stargate_p9")
	end
	for k, v in pairs(ents.FindByName("dynamic6_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_stargate_p9,5,1")
	end
	
	///////////////////////////////////////////////
	--	js_coop_coast_x_v5
	for k, v in pairs(ents.FindByName("dynamic7_text_all")) do
	v:SetKeyValue("message", "js_coop_coast_x_v5")
	end
	for k, v in pairs(ents.FindByName("dynamic7_text")) do
	v:SetKeyValue("message", "js_coop_coast_x_v5")
	end
	for k, v in pairs(ents.FindByName("dynamic7_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_coast_x_v5,5,1")
	end
	///////////////////////////////////////////////
	-- coop_city17_bouncy9
	for k, v in pairs(ents.FindByName("dynamic8_text_all")) do
	v:SetKeyValue("message", "coop_city17_bouncy9")
	end
	for k, v in pairs(ents.FindByName("dynamic8_text")) do
	v:SetKeyValue("message", "coop_city17_bouncy9")
	end
	for k, v in pairs(ents.FindByName("dynamic8_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_city17_bouncy9,5,1")
	end
	///////////////////////////////////////////////
	-- cl_coop_corridor_b3
	for k, v in pairs(ents.FindByName("dynamic9_text_all")) do
	v:SetKeyValue("message", "cl_coop_corridor_b3")
	end
	for k, v in pairs(ents.FindByName("dynamic9_text")) do
	v:SetKeyValue("message", "cl_coop_corridor_b3")
	end
	for k, v in pairs(ents.FindByName("dynamic9_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel cl_coop_corridor_b3,5,1")
	end
	///////////////////////////////////////////////
	-- cl_coop_doors_v2
	for k, v in pairs(ents.FindByName("dynamic10_text_all")) do
	v:SetKeyValue("message", "cl_coop_doors_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic10_text")) do
	v:SetKeyValue("message", "cl_coop_doors_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic10_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel cl_coop_doors_v2,5,1")
	end
	///////////////////////////////////////////////
	-- cl_coop_laserquest_b2
	for k, v in pairs(ents.FindByName("dynamic11_text_all")) do
	v:SetKeyValue("message", "cl_coop_laserquest_b2")
	end
	for k, v in pairs(ents.FindByName("dynamic11_text")) do
	v:SetKeyValue("message", "cl_coop_laserquest_b2")
	end
	for k, v in pairs(ents.FindByName("dynamic11_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel cl_coop_laserquest_b2,5,1")
	end
	///////////////////////////////////////////////
	-- coop_npcwar3_aldo
	for k, v in pairs(ents.FindByName("dynamic12_text_all")) do
	v:SetKeyValue("message", "coop_npcwar3_aldo")
	end
	for k, v in pairs(ents.FindByName("dynamic12_text")) do
	v:SetKeyValue("message", "coop_npcwar3_aldo")
	end
	for k, v in pairs(ents.FindByName("dynamic12_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_npcwar3_aldo,5,1")
	end
	///////////////////////////////////////////////
	-- coop_123module_v2
	for k, v in pairs(ents.FindByName("dynamic13_text_all")) do
	v:SetKeyValue("message", "coop_123module_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic13_text")) do
	v:SetKeyValue("message", "coop_123module_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic13_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_123module_v2,5,1")
	end
	///////////////////////////////////////////////
	-- coop_great_evil
	for k, v in pairs(ents.FindByName("dynamic14_text_all")) do
	v:SetKeyValue("message", "coop_great_evil")
	end
	for k, v in pairs(ents.FindByName("dynamic14_text")) do
	v:SetKeyValue("message", "coop_great_evil")
	end
	for k, v in pairs(ents.FindByName("dynamic14_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_great_evil,5,1")
	end
	///////////////////////////////////////////////
	-- coop_manticore
	for k, v in pairs(ents.FindByName("dynamic15_text_all")) do
	v:SetKeyValue("message", "coop_manticore")
	end
	for k, v in pairs(ents.FindByName("dynamic15_text")) do
	v:SetKeyValue("message", "coop_manticore")
	end
	for k, v in pairs(ents.FindByName("dynamic15_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel coop_manticore,5,1")
	end
	///////////////////////////////////////////////
	-- js_coop_lh5_windows
	for k, v in pairs(ents.FindByName("dynamic16_text_all")) do
	v:SetKeyValue("message", "js_coop_lh5_windows")
	end
	for k, v in pairs(ents.FindByName("dynamic16_text")) do
	v:SetKeyValue("message", "js_coop_lh5_windows")
	end
	for k, v in pairs(ents.FindByName("dynamic16_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_lh5_windows,5,1")
	end
	///////////////////////////////////////////////
	-- js_coop_ultraviolet_x_v2
	for k, v in pairs(ents.FindByName("dynamic17_text_all")) do
	v:SetKeyValue("message", "js_coop_ultraviolet_x_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic17_text")) do
	v:SetKeyValue("message", "js_coop_ultraviolet_x_v2")
	end
	for k, v in pairs(ents.FindByName("dynamic17_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel js_coop_ultraviolet_x_v2,5,1")
	end
	///////////////////////////////////////////////
	-- sg_coop_steamlab_b5
	for k, v in pairs(ents.FindByName("dynamic18_text_all")) do
	v:SetKeyValue("message", "sg_coop_steamlab_b5")
	end
	for k, v in pairs(ents.FindByName("dynamic18_text")) do
	v:SetKeyValue("message", "sg_coop_steamlab_b5")
	end
	for k, v in pairs(ents.FindByName("dynamic18_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel sg_coop_steamlab_b5,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic19_text_all")) do
	v:SetKeyValue("message", "syn_oldcanals")
	end
	for k, v in pairs(ents.FindByName("dynamic19_text")) do
	v:SetKeyValue("message", "syn_oldcanals")
	end
	for k, v in pairs(ents.FindByName("dynamic19_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_oldcanals,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic20_text_all")) do
	v:SetKeyValue("message", "syn_urbanchaos")
	end
	for k, v in pairs(ents.FindByName("dynamic20_text")) do
	v:SetKeyValue("message", "syn_urbanchaos")
	end
	for k, v in pairs(ents.FindByName("dynamic20_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_urbanchaos,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic21_text_all")) do
	v:SetKeyValue("message", "syn_silent_house")
	end
	for k, v in pairs(ents.FindByName("dynamic21_text")) do
	v:SetKeyValue("message", "syn_silent_house")
	end
	for k, v in pairs(ents.FindByName("dynamic21_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_silent_house,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic22_text_all")) do
	v:SetKeyValue("message", "syn_sevenhourwar_part1")
	end
	for k, v in pairs(ents.FindByName("dynamic22_text")) do
	v:SetKeyValue("message", "syn_sevenhourwar_part1")
	end
	for k, v in pairs(ents.FindByName("dynamic22_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_sevenhourwar_part1,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic23_text_all")) do
	v:SetKeyValue("message", "syn_desolate")
	end
	for k, v in pairs(ents.FindByName("dynamic23_text")) do
	v:SetKeyValue("message", "syn_desolate")
	end
	for k, v in pairs(ents.FindByName("dynamic23_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_desolate,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic24_text_all")) do
	v:SetKeyValue("message", "oc_antlion_attack_01")
	end
	for k, v in pairs(ents.FindByName("dynamic24_text")) do
	v:SetKeyValue("message", "oc_antlion_attack_01")
	end
	for k, v in pairs(ents.FindByName("dynamic24_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel oc_antlion_attack_01,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic25_text_all")) do
	v:SetKeyValue("message", "oc_breakout")
	end
	for k, v in pairs(ents.FindByName("dynamic25_text")) do
	v:SetKeyValue("message", "oc_breakout")
	end
	for k, v in pairs(ents.FindByName("dynamic25_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel oc_breakout,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic26_text_all")) do
	v:SetKeyValue("message", "oc_wildfire")
	end
	for k, v in pairs(ents.FindByName("dynamic26_text")) do
	v:SetKeyValue("message", "oc_wildfire")
	end
	for k, v in pairs(ents.FindByName("dynamic26_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel oc_wildfire,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic27_text_all")) do
	v:SetKeyValue("message", "ocf_deadland")
	end
	for k, v in pairs(ents.FindByName("dynamic27_text")) do
	v:SetKeyValue("message", "ocf_deadland")
	end
	
	for k, v in pairs(ents.FindByName("dynamic27_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ocf_deadland,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic28_text_all")) do
	v:SetKeyValue("message", "syn_antlions_way")
	end
	for k, v in pairs(ents.FindByName("dynamic28_text")) do
	v:SetKeyValue("message", "syn_antlions_way")
	end
	for k, v in pairs(ents.FindByName("dynamic28_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_antlions_way,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic29_text_all")) do
	v:SetKeyValue("message", "syn_takeover")
	end
	for k, v in pairs(ents.FindByName("dynamic29_text")) do
	v:SetKeyValue("message", "syn_takeover")
	end
	for k, v in pairs(ents.FindByName("dynamic29_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_takeover,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic30_text_all")) do
	v:SetKeyValue("message", "syn_lvcoop_part1")
	end
	for k, v in pairs(ents.FindByName("dynamic30_text")) do
	v:SetKeyValue("message", "syn_lvcoop_part1")
	end
	for k, v in pairs(ents.FindByName("dynamic30_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_lvcoop_part1,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic31_text_all")) do
	v:SetKeyValue("message", "ep1_oc_broken_escape_01")
	end
	for k, v in pairs(ents.FindByName("dynamic31_text")) do
	v:SetKeyValue("message", "ep1_oc_broken_escape_01")
	end
	for k, v in pairs(ents.FindByName("dynamic31_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_oc_broken_escape_01,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic32_text_all")) do
	v:SetKeyValue("message", "ep2_oc_broken_escape_02a")
	end
	for k, v in pairs(ents.FindByName("dynamic32_text")) do
	v:SetKeyValue("message", "ep2_oc_broken_escape_02a")
	end
	for k, v in pairs(ents.FindByName("dynamic32_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_oc_broken_escape_02a,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic33_text_all")) do
	v:SetKeyValue("message", "syn_bunker")
	end
	for k, v in pairs(ents.FindByName("dynamic33_text")) do
	v:SetKeyValue("message", "syn_bunker")
	end
	for k, v in pairs(ents.FindByName("dynamic33_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel syn_bunker,5,1")
	end
	///////////////////////////////////////////////
	for k, v in pairs(ents.FindByName("dynamic34_text_all")) do
	v:SetKeyValue("message", "oc_fireteam_1")
	end
	for k, v in pairs(ents.FindByName("dynamic34_text")) do
	v:SetKeyValue("message", "oc_fireteam_1")
	end
	for k, v in pairs(ents.FindByName("dynamic34_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel oc_fireteam_1,5,1")
	end
	///////////////////////////////////////////////
	
	
	
	// Custom Maps Door Setup Ends Here
	
	
	//Open doors remove stuffs
	
	
	--Hl2 triggers
	for k, v in pairs(ents.FindByName("chapter1_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d1_trainstation_01,5,1")
	end
	for k, v in pairs(ents.FindByName("chapter1_text")) do
	v:SetKeyValue("message", "Half - Life 2")
	end
	for k, v in pairs(ents.FindByName("chapter1_text_all")) do
	v:SetKeyValue("message", "Half - Life 2")
	end
	for k, v in pairs(ents.FindByName("chapter2_trigger")) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel cd0,5,1")
	end
	for k, v in pairs(ents.FindByName("chapter2_text")	) do
	v:SetKeyValue("message", "Combine Destiny")
	end
	for k, v in pairs(ents.FindByName("chapter2_text_all")	) do
	v:SetKeyValue("message", "Combine Destiny")
	end
	
	for k, v in pairs(ents.FindByName("chapter3_trigger")	) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel metastasis_1,5,1")
	end
	for k, v in pairs(ents.FindByName("chapter3_text")	) do
	v:SetKeyValue("message", "Metastasis: Minerva")
	end
	for k, v in pairs(ents.FindByName("chapter3_text_all")	) do
	v:SetKeyValue("message", "Metastasis: Minerva")
	end

	for k, v in pairs(ents.FindByName("chapter4_trigger")	) do
	v:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel leonhl2-2,5,1")
	end
	for k, v in pairs(ents.FindByName("chapter4_text")	) do
	v:SetKeyValue("message", "Coastline to Atmosphere")
	end
	for k, v in pairs(ents.FindByName("chapter4_text_all")	) do
	v:SetKeyValue("message", "Coastline to Atmosphere")
	end
	-- Episode Two Room
	--Episode 2 door
	for k, v in pairs(ents.FindByName("ep2_chapter1_text")	) do
	v:SetKeyValue("message", "Half - Life 2: Episode 2")
	end
	for k, v in pairs(ents.FindByName("ep2_chapter1_text_all")	) do
	v:SetKeyValue("message", "Half - Life 2: Episode 2")
	end
	--Episode 3 door
	for k, v in pairs(ents.FindByName("ep2_chapter2_text")	) do
	v:SetKeyValue("message", "Half - Life 2: Episode 3")
	end
	for k, v in pairs(ents.FindByName("ep2_chapter2_text_all")	) do
	v:SetKeyValue("message", "Half - Life 2: Episode 3")
	end
	
	-- local hl2ch4_trigger = ents.FindByName("chapter4_trigger")
	-- hl2ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d1_canals_06,5,1")
	
	-- local hl2ch5_trigger = ents.FindByName("chapter5_trigger")
	-- hl2ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d1_eli_01,5,1")
	
	-- local hl2ch6_trigger = ents.FindByName("chapter6_trigger")
	-- hl2ch6_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d1_town_01,5,1")
	
	-- local hl2ch7_trigger = ents.FindByName("chapter7_trigger")
	-- hl2ch7_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d2_coast_01,5,1")
	
	-- local hl2ch8_trigger = ents.FindByName("chapter8_trigger")
	-- hl2ch8_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d2_coast_09,5,1")
	
	-- local hl2ch9_trigger = ents.FindByName("chapter9_trigger")
	-- hl2ch9_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d2_prison_02,5,1")
	
	-- local hl2ch10_trigger = ents.FindByName("chapter9a_trigger")
	-- hl2ch10_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d2_prison_06,5,1")
	
	-- local hl2ch11_trigger = ents.FindByName("chapter10_trigger")
	-- hl2ch11_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d3_c17_02,5,1")
	
	-- local hl2ch12_trigger = ents.FindByName("chapter11_trigger")
	-- hl2ch12_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d3_c17_09,5,1")
	
	-- local hl2ch13_trigger = ents.FindByName("chapter12_trigger")
	-- hl2ch13_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d3_citadel_01,5,1")
	
	-- local hl2ch14_trigger = ents.FindByName("chapter13_trigger")
	-- hl2ch14_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel d3_breen_01,5,1")
	
	
	--Ep1 Triggers
	local ep1ch1_trigger = ents.FindByName("ep1_chapter1_trigger")
	ep1ch1_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_citadel_00,5,1")
	
	-- local ep1ch2_trigger = ents.FindByName("ep1_chapter2_trigger")
	-- ep1ch2_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_citadel_03,5,1")
	
	-- local ep1ch3_trigger = ents.FindByName("ep1_chapter3_trigger")
	-- ep1ch3_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_c17_00,5,1")
	
	-- local ep1ch4_trigger = ents.FindByName("ep1_chapter4_trigger")
	-- ep1ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_c17_01,5,1")
	
	-- local ep1ch5_trigger = ents.FindByName("ep1_chapter5_trigger")
	-- ep1ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep1_c17_05,5,1")
	
	--Ep2 Triggers
	local ep2ch1_trigger = ents.FindByName("ep2_chapter1_trigger")
	ep2ch1_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_01,5,1")
	
	local ep2ch2_trigger = ents.FindByName("ep2_chapter2_trigger")
	ep2ch2_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep3_antarctic_01,5,1")
	
	-- local ep2ch3_trigger = ents.FindByName("ep2_chapter3_trigger")
	-- ep2ch3_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_05,5,1")
	
	-- local ep2ch4_trigger = ents.FindByName("ep2__chapter4_trigger")
	-- ep2ch4_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_06a,5,1")
	
	-- local ep2ch5_trigger = ents.FindByName("ep2_chapter5_trigger")
	-- ep2ch5_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_09,5,1")
	
	-- local ep2ch6_trigger = ents.FindByName("ep2_chapter6_trigger")
	-- ep2ch6_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_11,5,1")
	
	-- local ep2ch7_trigger = ents.FindByName("ep2_chapter7_trigger")
	-- ep2ch7_trigger[1]:Fire("addoutput", "OnTrigger servercommand,Command,hl2c_changelevel ep2_outland_12a,5,1")
	
	if game.GetMap() == "winter_lobby_2012" then
	local point_t = ents.Create("point_trigger")
	--	xmasstar_physics
	point_t:SetPos(Vector(861, 221, 112))
	point_t:SetKeyValue("targetname", "debug_point_trigger")
	point_t:SetKeyValue("spawnflags", "1")
	point_t:SetKeyValue("StartDisabled", "0")
	point_t:SetKeyValue("TriggerRadius", "50")
	point_t:SetKeyValue("TriggerOnce", "0")
	--point_t:SetKeyValue("filtername", "blahblah")
	point_t:Fire("addoutput", "OnStartTouch !self,Kill,,3.0,1")
	point_t:Spawn()
	point_t:Activate()
	
	--local vortex_test = ents.Create("ent_vortex_hl2c")
	--vortex_test:SetPos(Vector(861, 221, 112))
	--vortex_test:Spawn()
	--vortex_test:Activate()
	
	
	local countdown = ents.FindByName("song_counter")
	for k, v in pairs(countdown) do 
	v:Fire("addoutput", "OnHitMax countdown_debugger,SetTimerLabel,Debug_Test,0,1")
	v:Fire("addoutput", "OnHitMax countdown_debugger,StartTimer,336.0,0,1")
	--v:Fire("addoutput", "OnHitMax debug_point_trigger,Enable,,10,1")
	--v:Fire("addoutput", "OnHitMax debug_point_trigger,Enable,,10,1")
	--v:Fire("addoutput", "OnHitMax debug_point_trigger,Enable,22,0,-1")
	--countdown:Fire("addoutput", "OnMapSpawn countdown_debugger,SetTimerLabel,Hi,0,1")
	--countdown:Fire("addoutput", "OnMapSpawn countdown_debugger,StartTimer,90.0,0,1")
	--countdown:Spawn()
	--countdown:Activate()
	end
	
	--"OnTrue" "gamestart_countdown,SetTimerLabel,Game starts in:,0,-1"
			--"OnTrue" "gamestart_countdown,StartTimer,15.0,0,1"
			
			
			
			
	//CUSTOM STUFF
	RANDOM_MUZSIKA = {
	"1",
	"2",
	"3",
	"4"
	}
	local szamoljunk = math.random(1,#RANDOM_MUZSIKA)
	--print(szamoljunk)
	
	if szamoljunk == "1" then
	--print("SZAMOLJUNLK = 1")
	local hate_music = ents.FindByName("gnome_song")
	hate_music[1]:Fire("addoutput", "message music/hl2_song29.mp3")		
	elseif szamoljunk == "2" then
	--print("SZAMOLJUNLK = 2") 
	local hate_music = ents.FindByName("gnome_song")
	hate_music[1]:Fire("addoutput", "message music/hl2_song4.mp3")		
	elseif szamoljunk == "3" then
	--print("SZAMOLJUNLK = 3")
	local hate_music = ents.FindByName("gnome_song")
	hate_music[1]:Fire("addoutput", "message music/hl2_song20_submix4.mp3")		
	else
	--print("SZAMOLJUNLK = 4")
	local hate_music = ents.FindByName("gnome_song")
	hate_music[1]:Fire("addoutput", "message music/hl2_song12_long.mp3")		
	end
	end
	
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	difficulty = 1
	pl:GodDisable()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	game.ConsoleCommand("mp_falldamage 0\n")
	
end

hook.Add("OnNPCKilled", "CUSTOM_OnNPCKilled", function(npc, attacker, weapon)
	if game.GetMap() == "keyfox_lobby_summer" and
	IsValid(npc) and
	IsValid(attacker) and
	attacker:IsPlayer() and
	npc:IsNPC() and
	HL2C_EVENT_ON == 001
	then
		attacker:AddXP(50)
		attacker:PrintMessage(HUD_PRINTTALK,"[hl2c event] + 50 Points")
	end
end)

return MAPSCRIPT