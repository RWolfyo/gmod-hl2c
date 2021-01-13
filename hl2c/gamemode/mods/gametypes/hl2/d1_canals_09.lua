ALLOWED_VEHICLE = "Airboat"

NEXT_MAP = "d1_canals_10"

BRUSH_PLAYERCLIP = {

	{Vector(7867, 9097, -456), Vector(7404, 9240, -138)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(7867, 9097, -456), Vector(7404, 9240, -138)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(1486.287964, 8631.797852, -312.970337)
VORTEX_POS = Vector(7527.759277, -8209.893555, 99.030365)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	for k, v in pairs(ents.FindByName("music_canals_bombingrun")) do
		v:SetKeyValue("message", "music/hl1_song10.mp3")
	end

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT