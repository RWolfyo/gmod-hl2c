--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
OC_MAP = true
NEXT_MAP_TIME = 5
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
	
	util.RunNextFrame(function()
		if IsValid(pl) then
	
			pl:Give("weapon_crowbar")
			pl:Give("weapon_pistol")
			pl:Give("weapon_smg1")
			if pl:GetAmmoCount(3) < 150 then
				pl:SetAmmo(150,3)
	
			end
			if pl:GetAmmoCount(4) < 225 then
				pl:SetAmmo(225,4)
			end
		end
	end)
	difficulty = 1
end


hook.Add("Think", "custom_checkpoint", function()
	if SERVER then
		for k, v in ipairs(ents.GetAll()) do
			if v:GetClass() == "npc_maker" then
				v:Fire("MaxLiveChildren", 2)
			end
		end
	end
end)

return MAPSCRIPT