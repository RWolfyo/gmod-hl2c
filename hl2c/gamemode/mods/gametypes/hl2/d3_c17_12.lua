INFO_PLAYER_SPAWN = {Vector(1188, 3381, 777), -90}

NEXT_MAP = "d3_c17_12b"

-- VORTEX_POS = Vector(-2628.160156, 5618.714355, 576.031250)
VORTEX_POS = Vector(393.510193, 6252.924805, 1754.458740)
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