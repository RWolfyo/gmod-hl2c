ALLOWED_VEHICLE = "Jeep"

if file.Exists("hl2c_data/hl2c_d2_coast_08.txt", "DATA") then
	INFO_PLAYER_SPAWN = {Vector(2896, 5250, 1580), 180}
	NEXT_MAP = "d2_coast_09"
else
	INFO_PLAYER_SPAWN = {Vector(-6392, 6111, 1673), 0}
	NEXT_MAP = "d2_coast_08"
end

BRUSH_PLAYERCLIP = {

{Vector(-7148, 5806, 1604), Vector(-6977, 9537, 1937)}

}
BRUSH_VEHICLECLIP = {

{Vector(-7148, 5806, 1604), Vector(-6977, 9537, 1937)}

}
-- Need Vehicle Brush

-- VORTEX_POS = Vector(-2815.040039, 4435.303711, 175.744995)
VORTEX_POS = Vector(-2169.953369, -2419.393066, 2326.586182)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	if file.Exists("hl2c_data/hl2c_d2_coast_08.txt", "DATA") then
		local func_brushes = ents.FindByClass("func_brush")
		func_brushes[1]:Remove()
		func_brushes[2]:Remove()

		local field_poles = ents.FindByName("field_wall_poles")
		field_poles[1]:Fire("skin", "1", "0.0")
		field_poles[2]:Fire("skin", "1", "0.0")
		field_poles[3]:Fire("skin", "1", "0.0")
		field_poles[4]:Fire("skin", "1", "0.0")

		local field_touch = ents.FindByName("forcefield3_sound_close")
		field_touch[1]:Remove()

		local field_loop = ents.FindByName("forcefield3_sound_far")
		field_loop[1]:Remove()

		local dropship = ents.FindByName("dropship")
		dropship[1]:Remove()
	end
end

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