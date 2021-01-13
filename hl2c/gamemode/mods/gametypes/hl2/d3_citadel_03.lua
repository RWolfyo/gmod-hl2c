INFO_PLAYER_SPAWN = {Vector(7734, -1439, 2148), 90}

NEXT_MAP = "d3_citadel_04"

RESET_WEAPONS = true

SUPER_GRAVITY_GUN = true

TRIGGER_CHECKPOINT = {
	{Vector(3175, 522, 2368), Vector(3580, 562, 2529)}
}

-- VORTEX_POS = Vector(6959.968750, 800.026672, 2332.012939)

local MAPSCRIPT = {}


MAPSCRIPT.EntityFilterByName = {
	["weapon_strip_motion_disable"] = true,
	["weapon_strip_motion_disable_player"] = true,
	["weapon_strip_motion_disable_player"] = true,
}

function MAPSCRIPT:InitPost()
	local strip_stop = ents.FindByName("strip_stop")
	strip_stop[1]:Fire("Trigger", "", "20.0")

	
	local strip_ent = ents.FindByClass("trigger_weapon_strip")
	for _, strip in pairs(strip_ent) do
		strip:Remove()
	end

	local dissolve_ent = ents.FindByClass("trigger_weapon_dissolve")
	for _, dissolve in pairs(dissolve_ent) do
		dissolve:Remove()
	end

	local func_brushes = ents.FindByClass("func_brush")
	func_brushes[6]:Remove()
	func_brushes[7]:Remove()
	func_brushes[12]:Remove()
	func_brushes[13]:Remove()
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
end

return MAPSCRIPT