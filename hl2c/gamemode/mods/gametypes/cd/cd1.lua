local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}


INFO_PLAYER_SPAWN = {Vector(326.78,-586.51,-127,97),90}

NEXT_MAP = "cd2"
CD_MAP = true
RESET_PL_INFO = true
/*
RESPAWN_ALLOWED = true

TRIGGER_CHECKPOINT = {
	{Vector(394, -6942, 531), Vector(434, -7104, 576)},
	{Vector(386, -4257, 523), Vector(447, -4206, 563)},
	{Vector(824, 2605, -37), Vector(887, 2668, 49)},
	{Vector(704, 2707, -94), Vector(747, 2759, 3)}
}

BRUSH_PLAYERCLIP = {

	{Vector(1461, -8257, 221), Vector(1481, -8317, 340)}
	
}
*/

VORTEX_POS = Vector(101.754814, -249.738419, -315)



function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
end

return MAPSCRIPT