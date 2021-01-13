local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

-- INFO_PLAYER_SPAWN = {Vector(4940.878906, -3802.706055, 312.855713), 0}
-- RESET_PL_INFO = true

NEXT_MAP = "leonhl2-2f"

--HL2MP_IS_COOP_MAP = true

COASTLINE = true

-- TRIGGER_CHECKPOINT = {

-- {Vector(-1582.861206, 2693.403320, 208.516113), Vector(-1482.390747, 4198.177734, 292.175018),false,function() end,Vector(-1589.290527, 2871.353027, 334.407623)},

-- }

-- TRIGGER_DELAYMAPLOAD = {Vector(-3245.457764, -5790.093750, 279.485077), Vector(-3339.859863, -5623.436035, 420.100586)}



MAPSCRIPT.EntityFilterByName = {
	
}
MAPSCRIPT.EntityFilterByClass = {
	-- ["point_viewcontrol"] = true,
}

MAPSCRIPT.InputFilters = {
	
}

function MAPSCRIPT:EntityRemoved(ent)

end

function MAPSCRIPT:KeyValue(ent, key, value)

end

function MAPSCRIPT:InitPost()


	
	DbgPrint("-- MapScript Loaded --")
	
end



function MAPSCRIPT:PostPlayerSpawn(pl)
	if IsValid(pl) then else return end
	pl:Give("weapon_crowbar",true)
	pl:Give("weapon_smg1",true)
	pl:Give("weapon_pistol",true)
	pl:Give("weapon_frag",true)
	pl:Give("weapon_ar2",true)
end

return MAPSCRIPT