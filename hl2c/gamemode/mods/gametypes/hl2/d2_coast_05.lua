ALLOWED_VEHICLE = "Jeep"

INFO_PLAYER_SPAWN = {Vector(7824, -12136, 1856), 180}

NEXT_MAP = "d2_coast_07"

if file.Exists("hl2c_data/hl2c_hl2lc.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_hl2lc.txt")
	RESET_PL_INFO = true
end

if file.Exists("hl2c_data/hl2c_d2_coast_08.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_d2_coast_08.txt")
end

BRUSH_PLAYERCLIP = {

{Vector(8989, -11760, 1814), Vector(9310, -12354, 1958)}

}
BRUSH_VEHICLECLIP = {

{Vector(8989, -11760, 1814), Vector(9310, -12354, 1958)}

}
-- Need Vehicle Brush

-- VORTEX_POS = Vector(-6328.047363, -12704.329102, 716.649536)
VORTEX_POS = Vector(8370.737305, -11689.697266, 1582.498169)
local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
end

return MAPSCRIPT