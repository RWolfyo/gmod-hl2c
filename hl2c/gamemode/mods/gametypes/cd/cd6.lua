local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-60,1525,110), 0}

CD_MAP = true
NEXT_MAP = "cd7"
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
	{Vector(69, 1533, 83), Vector(147, 1200, 156)},
	{Vector(1600, 773, 17), Vector(1589, 393, 162)},
	{Vector(2721, 1614, 19), Vector(3353, 1756, 165)},
	{Vector(4853, 5274, -103), Vector(4742, 5153, -81)},
	{Vector(5133, 5148, -690), Vector(5271, 5287, -637)},
	{Vector(6984, 4863, -874), Vector(7149, 4972, -797)},
	{Vector(6978, 2474, -890), Vector(7126, 2358, -855)}
}

TRIGGER_DELAYMAPLOAD = {Vector( 8417, 1833, -869 ), Vector( 7703, 1690, -676 )}

VORTEX_POS = Vector(393.694519, 75.067909, 288.031250)


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT