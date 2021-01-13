--INFO_PLAYER_SPAWN = {Vector(665, 5368, -7), 0}

NEXT_MAP = "d1_canals_02"

TRIGGER_CHECKPOINT = {

	{Vector(-2974, 5373, -68), Vector(-3050, 5207, 16)}
	
}

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByClass = {
	["item_suit"] = true,
}

function MAPSCRIPT:InitPost()

	
end

-- VORTEX_POS = Vector(683.721008, 3666.271729, 182.925949)
VORTEX_POS = Vector(-2661.845459, 9826.768555, 785.048523)
function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT