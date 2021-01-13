NEXT_MAP = "d2_prison_05"

ANTLION_FARM = false

-- VORTEX_POS = Vector(-96.386208, 2366.844238, 578.413879)
VORTEX_POS = Vector(-911.991638, 3361.475098, 803.031250)

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