local MAPSCRIPT = {}


NEXT_MAP = "ep1_citadel_02b"

SUPER_GRAVITY_GUN = true

TRIGGER_CHECKPOINT = {
	{Vector(-1837, 911, 810), Vector(-1723, 999, 938)}
}

VORTEX_POS = Vector(-6772.438965, 1183.088989, 554.633240)
HL2C_PET_LIKE_STALKER = true

MAPSCRIPT.EntityFilterByName = {
	["trigger_alyx_jumpover_forward"] = true,
	["trigger_alyx_jumpover_reverse"] = true,
	["trigger_fall"] = true,
}


function MAPSCRIPT:InitPost()
	
	
	local trigger = ents.Create("trigger_teleport_hl2c")
	trigger.max = Vector(-407.247742, -904.307251, 869.741150)
	trigger.min = Vector(-602.272522, -831.158508, 830.937012)
	trigger:SetTargetPos(Vector(-244, -880, 913))
	trigger:SetTeleportClass("npc_alyx")
	trigger:SetKeyValue("spawnflags","2")
	trigger:Spawn()
	
	local trigger = ents.Create("trigger_die_hl2c")
	trigger.max = Vector(-1795, 201, 452)
	trigger.min = Vector(-7927, 1727, 367)
	trigger:SetKeyValue("spawnflags","1")
	trigger:Spawn()

	local trigger = ents.Create("trigger_die_hl2c")
	trigger.max = Vector(721.273560, -1361.928589, 681.369629)
	trigger.min = Vector(-1455.822754, -501.534729, 696.565247)
	trigger:SetKeyValue("spawnflags","1")
	trigger:Spawn()
	
	local trigger = ents.Create("trigger_die_hl2c")
	trigger.max = Vector(2220.733887, 1340.357300, -1332.968750)
	trigger.min = Vector(-7.942663, -864.330750, 650.354431)
	trigger:SetKeyValue("spawnflags","1")
	trigger:Spawn()
	
	
	-- -8610.671875, 1028.395386, 863.990173 alyx spawn
	/*
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetPos(Vector(-8610.671875, 1028.395386, 863.990173))
	make_alyx:SetKeyValue("targetname", "alyx")
	make_alyx:SetKeyValue("spawnflags", "4")
	make_alyx:SetKeyValue("GameEndAlly", "1")
	make_alyx:SetKeyValue("DontPickupWeapons", "No")
	make_alyx:SetKeyValue("AlwaysTransition", "0")
	make_alyx:SetKeyValue("additionalequipment", "weapon_alyxgun")
	make_alyx:SetKeyValue("model", "models/alyx.mdl")
	make_alyx:SetKeyValue("physdamagescale", "1.0")
	make_alyx:SetKeyValue("rendercolor", "255 255 255")
	make_alyx:SetKeyValue("renderamt", "255")
	make_alyx:Spawn()
	make_alyx:Activate()
	*/
	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	for k, v in pairs(ents.FindByClass("trigger_falldeath")) do
		if v:GetClass() != "trigger_hurt" then
		v:Remove()
		end
	end
	for k, v in pairs(ents.FindByName("trigger_fall")) do
		if v:GetClass() != "trigger_hurt" then
		v:Remove()
		end
	end
	
	for k, v in pairs(ents.FindByName("trigger_beam_bridge_1_blocker_B")) do
		v:SetKeyValue("Solidity", "1")
		v:SetSolid(0)
	end
	
	local tp = ents.Create("point_alyx_teleport")
	tp:SetPos(Vector(1312, 704, 921))
	tp:SetKeyValue("targetname", "Alyx_tp01")
	tp:Spawn() 
	tp:Activate()
	
	for k, v in pairs(ents.FindInSphere(Vector(1111, 912, 896),10)) do
		print("")
		print("------------------")
		print("[hl2c] Modified",v:GetClass())
		print("------------------")
		print("")
		
		v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,1.0,-1")
		v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,2.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,3.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,4.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,5.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,6.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,7.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,8.0,-1")
		--v:Fire("addoutput","OnTrigger Alyx_tp01,Teleport,,9.0,-1")
	end
	local timer = ents.Create( "logic_timer" )
	timer:SetPos(Vector(1066, 353, -631))
	timer:SetKeyValue( "RefireTime", "5" )
	timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer:SetKeyValue( "StartDisabled", "0" )
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer:Spawn()
end
-- trigger_fall
-- game_over
-- -4864 896 444
-- -4864 896 192

function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	isstring(ent:GetClass()) and
	ent:GetClass() == "trigger_hurt" and
	key == "damage" and
	value == "1000"
	then
		
		--ent:Remove()
		timer.Simple(3, function()
			if IsValid(ent) 
			then
				--ent:SetKeyValue("damage", "10")
				--ent:SetKeyValue("damagecap", "10")
				--print("\n Hurt Trigger Modified\n")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "origin" and
	value == "-4864 896 192"
	then
		print("\nAlyx Fall Trigger Removed\n")
		ent:Remove()
		timer.Simple(3, function()
			if IsValid(ent) 
			then
				ent:Remove()
				--print("\nAlyx Fall Trigger Removed\n")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "classname" and
	value == "player_loadsaved"
	then
		print("\nPlayer Fade Black Removed\n")
		ent:Remove()
		timer.Simple(3, function()
			if IsValid(ent) 
			then
				ent:Remove()
				print("\nPlayer Fade Black Removed\n")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "origin" and
	value == "-4864 896 192"
	then
		ent:Remove()
		print("\nAlyx Talk Trigger Removed\n")
		timer.Simple(5, function()
			if IsValid(ent) 
			then
				ent:Remove()
				print("\nAlyx Talk Trigger Removed\n")
			end
		end)
	end
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
end


return MAPSCRIPT