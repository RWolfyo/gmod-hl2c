INFO_PLAYER_SPAWN = {Vector(4158, -4447, 1082), 0}

NEXT_MAP = "d2_prison_02"

TRIGGER_CHECKPOINT = {
	{Vector(1057, -1599, 1600), Vector(1104, -1397, 1707)}
}

BRUSH_PLAYERCLIP = {

	{Vector(4068, -5101, 1061), Vector(4293, -5254, 1193)}
	
}
ANTLION_FARM = false

-- VORTEX_POS = Vector(1456.131348, -4092.268066, 1472.031250)
VORTEX_POS = Vector(4480.841797, -4157.325684, 2021.281250)
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