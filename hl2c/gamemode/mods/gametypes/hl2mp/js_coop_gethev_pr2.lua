

RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"
HL2MP_IS_COOP_MAP = true

hook.Add("InitPostEntity", "hl2cInitPostEntity", function()

	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(3840, 13366, 4266))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
	--local server_com = ents.Create("point_servercommand")
	--server_com:SetKeyValue("targetname", "forcelevel")
	--server_com:SetPos(Vector(0, 0, 0))
	--server_com:Spawn()
	--server_com:Activate()
	
	--local end1 = ents.FindByClass("npc_helicopter")
	--end1[1]:Fire("addoutput", "OnDeath hl2c_changelevel,Changelevel,,0,1")
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
	
end)

hook.Add("PlayerSpawn", "hl2cPlayerSpawn", function(pl)

	--pl:Give("weapon_medkit_hl2c")

end)