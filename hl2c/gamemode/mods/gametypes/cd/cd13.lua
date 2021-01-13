local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

CD_MAP = true
NEXT_MAP = "cd14"
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
	{Vector(-5504.030273, -5370.810547, -350.120209), Vector(-5820.183594, -5257.805176, -300.571503),false,function() end,Vector(-5419.883789, -5318.432129, -359.968750)}
}



VORTEX_POS = Vector(-2988.461182, -5011.806641, -500.031616)



function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT
