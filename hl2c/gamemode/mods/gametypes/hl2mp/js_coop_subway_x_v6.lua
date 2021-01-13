/*INFO_PLAYER_SPAWN = {Vector(12449, -1456, -369), 0}
INFO_PLAYER_SPAWN = {Vector(12449, -1456, -369), 0}*/
INFO_PLAYER_SPAWN = {Vector(12449, -1456, -369), 0}
NEXT_MAP = "winter_lobby_2012"



RESET_PL_INFO = true

HL2MP_IS_COOP_MAP = true

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}

function MAPSCRIPT:InitPost()
/*
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	local end1 = ents.FindByName("door05")
	end1[1]:Fire("addoutput", "OnFullyOpen hl2c_changelevel,Changelevel,,18,1")
	-- remove weapon remover on spawn fuck this stripper
	local remove1 = ents.FindByName("usedstripper")
	remove1[1]:Remove()	
*/
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	
end

return MAPSCRIPT