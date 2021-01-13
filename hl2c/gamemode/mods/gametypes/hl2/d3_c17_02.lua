NEXT_MAP = "d3_c17_03"

TRIGGER_CHECKPOINT = {
	{Vector(-5552, -5706, -4), Vector(-5505, -5537, 103)}
}

TRIGGER_DELAYMAPLOAD = {Vector(-5203, -4523, 0), Vector(-5143, -4483, 121)}

local MAPSCRIPT = {}

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

-- VORTEX_POS = Vector(-10223.968750, -6176.031250, 128.031250)
VORTEX_POS = Vector(-5290.079590, -5206.952148, 312.031250)
function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("song_street")) do
		v:SetKeyValue("message", "music/hl2_song4.mp3")
	end
	
	for k, v in pairs(ents.FindByName("radiosong")) do
		v:SetKeyValue("message", "music/radio1.mp3")
	end
	
end

return MAPSCRIPT