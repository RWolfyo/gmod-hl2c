ALLOWED_VEHICLE = "Airboat"

INFO_PLAYER_SPAWN = {Vector(7512, -11398, -438), 0}

NEXT_MAP = "d1_canals_09"

TRIGGER_CHECKPOINT = {

	{Vector(-729, -663, -561), Vector(-827, -483, -505)},
	{Vector(-1909.191162, -3696.630127, -610.391296), Vector(-2393.997314, -4564.858887, -332.436035)}

}

BRUSH_PLAYERCLIP = {

	{Vector(5250, -11687, -476), Vector(5487, -10973, -192)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(5250, -11687, -476), Vector(5487, -10973, -192)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(1764.856323, -446.963745, -353.093597)
VORTEX_POS = Vector(-2241.904785, -2441.726807, 302.714722)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["trigger_close_gates"] = true,
}


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
end

function MAPSCRIPT:InitPost()
	
	
end

return MAPSCRIPT