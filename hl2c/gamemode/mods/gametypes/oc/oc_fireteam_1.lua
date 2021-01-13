RESET_PL_INFO = true
NEXT_MAP = "oc_fireteam_2"


HL2MP_IS_COOP_MAP = true
OC_MAP = true

NEXT_MAP_TIME = 5

TRIGGER_MAPEND = { 
{Vector(2345, 3931, 22), Vector(2423, 4223, 147)} 
}

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
	
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_smg1")
	pl:GiveAmmo(225,"SMG1",false)
end

return MAPSCRIPT