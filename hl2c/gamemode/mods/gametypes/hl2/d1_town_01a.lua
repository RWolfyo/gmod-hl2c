NEXT_MAP = "d1_town_02"

if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_d1_town_03.txt")
end

-- VORTEX_POS = Vector(-307.512421, 1143.102051, -3242.607666)
VORTEX_POS = Vector(-182.291412, -1485.163086, -2237.607666)
local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
end

return MAPSCRIPT