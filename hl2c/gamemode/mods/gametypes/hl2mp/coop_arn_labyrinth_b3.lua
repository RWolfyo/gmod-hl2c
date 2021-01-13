--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true

NEXT_MAP_TIME = 5

hook.Add("InitPostEntity", "hl2cInitPostEntity",  function() 

	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(3840, 13366, 4266))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
	-- Add ending to the map
	--local trigger_strider_end = ents.FindByName("trigger_strider_end")
	--trigger_strider_end[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,15,-1")
	
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
end)

hook.Add("PlayerSpawn", "hl2cPlayerSpawn", function(pl)
	pl:Give("weapon_crowbar")

end)