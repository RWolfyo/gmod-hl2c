local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

CD_MAP = true
NEXT_MAP = "cd3_2"

RESPAWN_ALLOWED = true

-- TRIGGER_CHECKPOINT = {
	-- {Vector(394, -6942, 531), Vector(434, -7104, 576)},
	-- {Vector(386, -4257, 523), Vector(447, -4206, 563)},
	-- {Vector(824, 2605, -37), Vector(887, 2668, 49)},
	-- {Vector(704, 2707, -94), Vector(747, 2759, 3)}
-- }

BRUSH_PLAYERCLIP = {

	{Vector(207.968750, 413.332245, -319.957764), Vector(39.682766, 367.755249, -54.672523)}

	
}
--TRIGGER_DELAYMAPLOAD = {Vector( -1927, -2006, -435 ), Vector( -2030, -1884, -275 )}

VORTEX_POS = Vector(3362.610840, -454.462341, -160.968735)



function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
end

return MAPSCRIPT