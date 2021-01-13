local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

CD_MAP = true
-- NEXT_MAP = "cd2_2"
NEXT_MAP = "cd3_2"
/*
RESPAWN_ALLOWED = true
*/
TRIGGER_CHECKPOINT = {
	{Vector(-192, 2768, 13), Vector(-409, 3119, 105)},
	{Vector(-962, 2895, -103), Vector(-1071, 2996, 15)}
}

BRUSH_PLAYERCLIP = {

	{Vector(-3199, 2357, -183), Vector(-3870, 2273, 124)}
	
}


VORTEX_POS = Vector(-5.594950, -155.115662, 216.320129)



function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
end

return MAPSCRIPT