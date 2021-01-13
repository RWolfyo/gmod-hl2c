INFO_PLAYER_SPAWN = {Vector(11904, -12312, -476), 90}

ALLOWED_VEHICLE = "Airboat"

NEXT_MAP = "d1_canals_11"

BRUSH_PLAYERCLIP = {

	{Vector(12079, -12636, -572), Vector(11574, -12811, -313)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(12079, -12636, -572), Vector(11574, -12811, -313)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(5024.000000, -12607.956055, -191.968750)
VORTEX_POS = Vector(5227.712402, -10387.673828, 327.031250)
local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_357")
	pl:Give("weapon_frag")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT