local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-516,424,45),0}

CD_MAP = true
NEXT_MAP = "cd10"
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
VORTEX_POS = Vector(1342.666626, 298.787628, -95.968750)


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_rpg")
end

return MAPSCRIPT