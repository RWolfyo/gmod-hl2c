ALLOWED_VEHICLE = "Airboat Gun"
NEXT_MAP = "d1_canals_13"

BRUSH_PLAYERCLIP = {

	{Vector(12198, 9983, 481), Vector(11628, 9737, 671)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(12198, 9983, 481), Vector(11628, 9737, 671)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(871.227844, 10985.151367, 776.031250)
VORTEX_POS = Vector(8552.316406, 6363.079102, 1187.031250)
local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	--pl:GodEnable()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_357")
	pl:Give("weapon_frag")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT