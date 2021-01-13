NEXT_MAP = "d1_town_02"

TRIGGER_DELAYMAPLOAD = {Vector(-3801, -65, -3457), Vector(-3719, -7, -3335)}

if !file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
	file.Write("hl2c_data/hl2c_d1_town_03.txt", "We have been to d1_town_03.")
end

BRUSH_PLAYERCLIP = {

	{Vector(-3710, -325, -3571), Vector(-3577, -198, -3025)}
	
}

-- VORTEX_POS = Vector(-2080.315430, -1621.400635, -3311.968750)
VORTEX_POS = Vector(-3887.969971, -1151.454834, -2855.953125)
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
end

return MAPSCRIPT