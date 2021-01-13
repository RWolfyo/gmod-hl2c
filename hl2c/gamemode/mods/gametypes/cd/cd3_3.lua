local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

CD_MAP = true
-- NEXT_MAP = "cd3_4"
NEXT_MAP = "cd4"
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
	{Vector(184.561981, -1132.590332, -21.669426), Vector(386.729706, -1008.262817, 56.599815),false,function() end,Vector(284.631287, -1079.001709, 0.031250)},

	{Vector(166, -906, 22), Vector(390, -663, 152)},
	{Vector(-932, 4234, 16), Vector(-1002, 4356, 73)},
	{Vector(256, 2382, 8), Vector(425, 2531, 111)}
}

VORTEX_POS = Vector(1846.602905, 3713.322510, 299.454071)

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT