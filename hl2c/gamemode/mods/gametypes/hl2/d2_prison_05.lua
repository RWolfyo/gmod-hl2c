INFO_PLAYER_SPAWN = {Vector(1439, 612, 388), 90}

NEXT_MAP = "d2_prison_06"

TRIGGER_CHECKPOINT = {

	{Vector(-2341, 447, 712), Vector(-1967, 685, 648)},		//Antlion Guard fight forced all players
	{Vector(-4669, -896, 663), Vector(-4457, -848, 812)}		//Force players to the end

}

BRUSH_PLAYERCLIP = {

	{Vector(1532, 428, 400), Vector(1317, -21, 528)}
	
}

ANTLION_FARM = false
HL2C_PET_LIKE_ANTLION = true

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("Crusher_music")) do
		v:SetKeyValue("message", "music/hl2_song0.mp3")
	end
	
end

-- VORTEX_POS = Vector(-905.151184, 699.892822, 559.789795)
VORTEX_POS = Vector(-3513.729980, -654.185303, 878.000061)

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