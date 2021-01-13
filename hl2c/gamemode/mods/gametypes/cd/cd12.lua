local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-844,338,-358), 180}

CD_MAP = true
NEXT_MAP = "cd13"
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

TRIGGER_CHECKPOINT = {
	{Vector(-1067, 484, -379), Vector(-1240, 450, -265)}
}


VORTEX_POS = Vector(96.512497, 2086.277832, 20.031250)


function MAPSCRIPT:PostPlayerSpawn(pl)

end

return MAPSCRIPT
