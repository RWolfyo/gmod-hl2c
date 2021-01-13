RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
OC_MAP = true
-- NEW_DIF = true
NEXT_MAP_TIME = 5

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
	
	-- timer.Simple(1, function()
		if IsValid(pl) then
	
			pl:Give("weapon_crowbar")
			pl:Give("weapon_pistol")
			pl:Give("weapon_smg1")
			if pl:GetAmmoCount(3) < 90 then
				pl:SetAmmo(90,3)
	
			end
			if pl:GetAmmoCount(4) < 90 then
				pl:SetAmmo(90,4)
			end
		end
	-- end)
	-- difficulty = 0.75
end

return MAPSCRIPT