--INFO_PLAYER_SPAWN = {Vector(-5322, -4213, 64), -13.5}

-- Vector(-1161, -3557, 124),Vector(-1161, -3557, 160.031250)
--TRIGGER_DELAYMAPLOAD = {
--	{Vector(-1161, -3557, 124),Vector(-1161, -3557, 124)}
--}
local MAPSCRIPT = {}

NEXT_MAP = "d3_c17_04"


--NEXT_MAP = "d3_c17_04"

TRIGGER_CHECKPOINT = {

	{Vector(-2617, -2995, 16), Vector(-2651, -2284, 148)}
}

--TRIGGER_DELAYMAPLOAD = {Vector(-1161, -3557, 124), Vector(-1161, -3557, 160)}
--TRIGGER_DELAYMAPLOAD = {Vector(-1161, -3557, 124), Vector(-1220, -3590, 200)}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("music_playground")) do
		v:SetKeyValue("message", "music/hl2_song13.mp3")
	end
	
end

-- VORTEX_POS = Vector(-1791.546509, -1241.237915, 60.624123)
VORTEX_POS = Vector(-1152.049438, -2370.979248, 1165.246704)

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
	--pl:Give("weapon_bugbait")
end
return MAPSCRIPT