local MAPSCRIPT = {}

NEXT_MAP = "ep1_c17_06"

TRIGGER_CHECKPOINT = {
	/*
	setpos 9081.257813, 10727.621094, -745.056458

setpos 8827.277344, 10814.164063, -653.676147

	*/
	{Vector(9633, 9844, -733), Vector(9852, 9580, -605)}
/*
 9633, 9844, -733
 9852, 9580, -605

*/
}

TRIGGER_DELAYMAPLOAD = {Vector(10261.516602, 9344.154297, -675.802673), Vector(10231.550781, 9549.116211, -514.886536)}


-- VORTEX_POS = Vector(10345, 12303, -467)



function MAPSCRIPT:InitPost()
	
	
	ents.WaitForEntityByName("citizen_refugees_1",function(ent)
		ent:Fire("addoutput", "OnDeath achiev_cit_start,Kill,,0,-1")
		ent:Fire("addoutput", "OnDeath achiev_cit_end,Kill,,0,-1")
	end)
	ents.WaitForEntityByName("citizen_refugees_2",function(ent)
		ent:Fire("addoutput", "OnDeath achiev_cit_start,Kill,,0,-1")
		ent:Fire("addoutput", "OnDeath achiev_cit_end,Kill,,0,-1")
	end)
	ents.WaitForEntityByName("citizen_refugees_3",function(ent)
		ent:Fire("addoutput", "OnDeath achiev_cit_start,Kill,,0,-1")
		ent:Fire("addoutput", "OnDeath achiev_cit_end,Kill,,0,-1")
	end)
	
	ents.WaitForEntityByName("citizen_refugees_4",function(ent)
		ent:Fire("addoutput", "OnDeath achiev_cit_start,Kill,,0,-1")
		ent:Fire("addoutput", "OnDeath achiev_cit_end,Kill,,0,-1")
	end)
	
	ents.WaitForEntityByName("relay_pickup_citizens",function(ent)
		ent:Remove()
	end)

	ents.WaitForEntityByName("relay_alyx_EMP_4",function(ent)
		ent:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,5,-1")
	end)
	
	
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	
	local add_upfriends = ents.Create("logic_relay")
	add_upfriends:SetPos(Vector(10327.4, 10544, -683.512))
	add_upfriends:SetKeyValue("targetname", "relay_pickup_citizens")
	add_upfriends:SetKeyValue("spawnflags", "0")
	add_upfriends:Fire("addoutput", "OnTrigger trigger_pickup_citizens,Disable,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger citizen_refugees*,AddToPlayerSquad,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger relay_barney_speak_escort,Trigger,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger relay_assault_citizen_unhide,Trigger,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger aisc_nag_evacNextGroup,Disable,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger relay_nag_evacNextGroup,CancelPending,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger trigger_pickup_citizens,Disable,,0,-1")
	add_upfriends:Fire("addoutput", "OnTrigger timer_addcitizenstosquad,Enable,,0,1")
	add_upfriends:Spawn()
	
	local add_tosquad = ents.Create("logic_timer")
	add_tosquad:SetPos(Vector(10396.1, 10543, -690.115))
	add_tosquad:SetKeyValue("targetname", "timer_addcitizenstosquad")
	add_tosquad:SetKeyValue("RefireTime", "10")
	add_tosquad:SetKeyValue("StartDisabled", "0")
	add_tosquad:Fire("addoutput", "OnTimer citizen_refugees*,AddToPlayerSquad,,0,-1")
	add_tosquad:Spawn()
	
	
	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn _ptemp_map_start,ForceSpawn,,0.3,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn exit_doors,Kill,,0.1,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_entmaker,ForceSpawn,,0.3,-1")
	_logic_auto:Spawn()
	_logic_auto:Activate()
	
	
	
	/*aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "citizen_refugees*")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()*/
	
	local ent = ents.Create( "hl2c_follow_system" )
	ent:SetPos(Vector(0,0,0))
	ent:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	ent:SetKeyValue("FollowerName", "citizen_refugees*")
	ent:SetKeyValue("Distance", "400")
	ent:SetKeyValue("Steal", "1")
	ent:Spawn()
	ent:Activate()
	
	util.RunNextFrame(function()
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetPos(Vector(9868.555664, 12228.608398, -588.101013))
	make_alyx:SetKeyValue("targetname", "alyx")
	make_alyx:SetKeyValue("spawnflags", "4")
	make_alyx:SetKeyValue("GameEndAlly", "1")
	make_alyx:SetKeyValue("DontPickupWeapons", "No")
	make_alyx:SetKeyValue("AlwaysTransition", "1")
	make_alyx:SetKeyValue("additionalequipment", "weapon_shotgun")
	make_alyx:SetKeyValue("model", "models/alyx.mdl")
	make_alyx:SetKeyValue("physdamagescale", "1.0")
	make_alyx:SetKeyValue("rendercolor", "255 255 255")
	make_alyx:SetKeyValue("renderamt", "255")
	make_alyx:Spawn()
	make_alyx:Activate()
	end)

	
end


function MAPSCRIPT:PostPlayerSpawn(pl)

	Hl2c.PersonDefaultChatPrint("[hl2c] Press E on citizen to follow you!",pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_rpg")
	
	
end


return MAPSCRIPT