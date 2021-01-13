NEXT_MAP = "d1_town_05"

TRIGGER_DELAYMAPLOAD = {Vector(-2537, 1025, -4851), Vector(-2496, 1307, -4730)}

BRUSH_PLAYERCLIP = {

{Vector(906, -1187, -3625), Vector(906, -1320, -3457)}

}

//Vortex
// 2006 439 -4888
-- VORTEX_POS = Vector(2006, 439, -4888)
VORTEX_POS = Vector(-255.836456, -669.089417, -4636.968750)
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