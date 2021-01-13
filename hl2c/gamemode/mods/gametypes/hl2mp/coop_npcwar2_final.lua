

RESET_PL_INFO = true

NEXT_MAP = "winter_lobby_2012"

HL2MP_IS_COOP_MAP = true

DISABLE_CUSTOM_WEAPON = false

local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["usedstripper"] = true,
}

function MAPSCRIPT:InitPost()

	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(3840, 13366, 4266))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
	--local end1 = ents.FindByName("door05")
	--end1[1]:Fire("addoutput", "OnFullyOpen hl2c_changelevel,Changelevel,,18,1")
	-- remove weapon remover on spawn fuck this stripper
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--timer.Simple(5, function()
	--pl:Give("weapon_medkit_hl2c")
	--end)
end

return MAPSCRIPT