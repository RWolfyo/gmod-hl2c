local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

CD_MAP = true
NEXT_MAP = "cd3_3"

RESPAWN_ALLOWED = true

TRIGGER_CHECKPOINT = {
	
{Vector(-3353, -3892, -575), Vector(-3729, -3633, -451),false,function() end,Vector(-3525, -3721, -576)}



}

TRIGGER_DELAYMAPLOAD = {Vector(-3662.561035, 1711.968750, -431.968750), Vector(-3586.268555, 1620.494263, -368.843018)}

-- BRUSH_PLAYERCLIP = {

	-- {Vector(1461, -8257, 221), Vector(1481, -8317, 340)}
	
-- }

VORTEX_POS = Vector(-3352.841553, -1206.634521, -409.288513)


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT
