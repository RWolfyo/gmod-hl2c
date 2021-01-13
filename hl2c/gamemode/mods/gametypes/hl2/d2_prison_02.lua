INFO_PLAYER_SPAWN = {Vector(-1137, 3475, 389), -90}

NEXT_MAP = "d2_prison_03"

//Vortex
//setpos -2315.937012 2904.731934 629.726990
-- VORTEX_POS = Vector(-2315.937012, 2904.731934, 629.726990)
VORTEX_POS = Vector(-1162.232910, 2750.166260, 810.007935)
ANTLION_FARM = false
HL2C_PET_LIKE_ANTLION = true

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

return MAPSCRIPT