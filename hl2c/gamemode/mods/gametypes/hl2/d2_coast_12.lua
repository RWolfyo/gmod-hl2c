INFO_PLAYER_SPAWN = {Vector(4830, -12136, 300), 90}

NEXT_MAP = "d2_prison_01"

TRIGGER_CHECKPOINT = {

	{Vector(4761.11, 3771.34, 859.57), Vector(4785.01, 3902.49, 912.95)}
	
}

BRUSH_PLAYERCLIP = {

{Vector(8713, -10991, 208), Vector(9378, -10857, 763)}

}

//Vortex
//setpos 7233.644531 7725.307617 2400.031250
VORTEX_POS = Vector(3896.493652, -8918.920898, 1294.572998)
-- VORTEX_POS = Vector(7233.644531, 7725.307617, 2400.031250)
HL2C_PET_LIKE_ANTLION = true

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("antlion_fight_music")) do
		v:SetKeyValue("message", "music/hl2_song29_02.mp3")
	end
	HL2C_PET_LIKE_ANTLION = true
end

ANTLION_FARM = false

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