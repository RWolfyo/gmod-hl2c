

RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"
HL2MP_IS_COOP_MAP = true
NEW_DIF = true

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
	difficulty = 1.2
	pl:Give("weapon_crowbar",false)
	pl:Give("weapon_pistol",false)
	pl:Give("weapon_357",false)
	pl:Give("weapon_smg1",false)
	pl:Give("weapon_ar2",false)
	pl:Give("weapon_shotgun",false)
	pl:Give("weapon_crossbow",false)
	pl:Give("weapon_frag",false)
end


function MAPSCRIPT:OnEntityCreated(ent)
	local ent = ent
	
	-- util.RunNextFrame(function()
	if IsValid(ent) and ent:IsNPC() then
		ent:AddSpawnFlags(SF_NPC_NO_WEAPON_DROP)
	
	end
	-- end)
end

return MAPSCRIPT