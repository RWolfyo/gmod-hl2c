NEXT_MAP = "d3_c17_02"

TRIGGER_CHECKPOINT = {
	{Vector(-7050, -1475, 1), Vector(-7003, -1307, 107)},
	{Vector(-6586, -1030, 1), Vector(-6363, -990, 122)}
}

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("song_lab")) do
		v:SetKeyValue("message", "music/hl2_song2.mp3")
	end
	
end


-- VORTEX_POS = Vector(-7114.344238, -1535.818848, 260.031250)

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
	pl:Give("weapon_bugbait")
end

return MAPSCRIPT