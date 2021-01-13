INFO_PLAYER_SPAWN = {Vector(2684, -1865, 260), 90}

NEXT_MAP = "d3_c17_11"

RESPAWN_ALLOWED = true

TRIGGER_CHECKPOINT = {
	{Vector(2562, -995, 257), Vector(2805, -954, 378),false,function() 
	
		for k, v in pairs(ents.FindByClass("info_waypoint")) do
			v:Fire("Enable")
		end
	end},
	-- {Vector(3529, 869, 512), Vector(3576, 1038, 619)},
	{Vector(2569, 1022, 256), Vector(2609, 1062, 377)}
}

BRUSH_PLAYERCLIP ={	
{Vector(2911.968750, -330.741974, 385.081329), Vector(2080.031250, -166.597702, 758.791382)},
{Vector(2911.968750, -690.820679, 367.164581), Vector(2080.031250, -854.018433, 759.446228)}	
}



-- VORTEX_POS = Vector(3012.373535, -1588.543945, 522.294556)

local MAPSCRIPT = {}

D3_C17_10B_TRAP = D3_C17_10B_TRAP or false

-- Vector(2964,909,613) Barney TP

D3_C17_10B_LR_01 = [[D3_C17_10B_TRAP = true]]

function MAPSCRIPT:PostPlayerSpawn(pl)
	if D3_C17_10B_TRAP then
		pl:Teleport( Vector( 2987,802,613 ) )
	end
	
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_bugbait")
	
	
	ents.WaitForEntityByName("hl2c_timer_follow", function(ent)
		ent:Fire("Activate")
	end)
end

MAPSCRIPT.EntityFilterByName = {
	["citizen_pod_conditions"] = true,
}

AddTriggerEvent("ctrlrm_east_field_off_relay", "OnTrigger", "obj_c,Disable,,3,-1")
AddTriggerEvent("ctrlrm_south_field_off_relay", "OnTrigger", "obj_b,Disable,,3,-1")
AddTriggerEvent("ctrlrm_north_field_off_relay", "OnTrigger", "obj_a,Disable,,3,-1")

function MAPSCRIPT:InitPost()

		
	local time = ents.Create("logic_timer")
	time:SetPos(Vector(1066, 353, -631))
	time:SetKeyValue("RefireTime", "5")
	time:SetKeyValue("targetname", "hl2c_timer_follow")
	time:SetKeyValue("StartDisabled", "0")
	time:Fire("addoutput", "OnTimer barney_follow,Deactivate,,0,-1", "1")
	time:Fire("addoutput", "OnTimer barney_follow,Activate,,0.1,-1", "1")
	time:Spawn()
	time:Activate()
	
	
	local obj = ents.Create("info_waypoint")
	obj:SetKeyValue("origin",  "2688 90 608")
	obj:SetKeyValue("image", "3")
	obj:SetKeyValue("text", "Shutdown Generator!")
	obj:SetName("obj_a")
	-- obj:Fire("Enable")
	
	local obj = ents.Create("info_waypoint")
	obj:SetKeyValue("origin",  "2688 -1104 604")
	obj:SetKeyValue("image", "3")
	obj:SetKeyValue("text", "Shutdown Generator!")
	obj:SetName("obj_b")
	-- obj:Fire("Enable")
	
	local obj = ents.Create("info_waypoint")
	obj:SetKeyValue("origin",  "3104 -512 604")
	obj:SetKeyValue("image", "3")
	obj:SetKeyValue("text", "Shutdown Generator!")
	obj:SetName("obj_c")
	-- obj:Fire("Enable")
	
	local a = ents.Create("point_hl2cteleport")
	a:SetKeyValue("targetname","player_tp")
	a:SetPos( Vector(2964,909,613) )
	a:Spawn()
	
	local a = ents.Create("point_barney_teleport")
	a:SetKeyValue("targetname","barney_tp")
	a:SetPos( Vector( 2987,802,613 ) )
	a:Spawn()

	local a = ents.Create("lua_run")
	a:SetKeyValue("targetname","lr_trap")
	a:SetKeyValue("Code",D3_C17_10B_LR_01)
	a:Spawn()
	--local map_fail_event = ents.Create("point_map_failed")
	--map_fail_event:SetKeyValue("targetname", "player_failed")
	--map_fail_event:SetPos(Vector(0, 0, 90))
	--map_fail_event:Spawn()
	
	
	
	for k, v in pairs(ents.FindByName("song1")) do
		v:SetKeyValue("message", "music/hl2_song27_trainstation2.mp3")
	end
	
	ents.WaitForEntityByName("relay_combineshieldwall1_on", function(ent)
		ent:Fire("addoutput","OnTrigger exit_combinedoor_nodelink,TurnOn,,6.0,-1")
		ent:Fire("addoutput","OnTrigger exit_combinedoor,SetAnimation,open,6.0,-1")
		ent:Fire("addoutput", "OnTrigger hl2c_timer_follow,Enable,,0,-1")
		ent:Fire("addoutput", "OnTrigger hl2c_timer_follow,Activate,,0,-1")
		ent:Fire("addoutput", "OnTrigger barney_follow,Enable,,0.1,-1")
		ent:Fire("addoutput", "OnTrigger barney_follow,Activate,,0.1,-1")
	end)
	
	ents.WaitForEntityByName("s_room_detected_relay", function(ent)
		ent:Fire("addoutput", "OnTrigger s_room_turret_*,Disable,,7,1")
		ent:Fire("addoutput", "OnTrigger s_room_doors,Open,,7,1")
		ent:Fire("addoutput", "OnTrigger barney_follow,Enable,,7,1")
		ent:Fire("addoutput", "OnTrigger barney_follow,Activate,,7,1")
		ent:Fire("addoutput", "OnTrigger hl2c_timer_follow,Enable,,7,1")
		ent:Fire("addoutput", "OnTrigger hl2c_timer_follow,Activate,,7,1")
		-- ent:Fire("addoutput", "OnTrigger player_failed,RestartMap,,1,1")
	end)
	
	ents.WaitForEntityByName("citizen_pod_conditions", function(ent)
		ent:Remove()
	end)
	
	ents.WaitForEntityByName("barney_lead_exit_lcs2", function(ent)
		ent:Fire("addoutput", "OnCompletion hl2c_timer_follow,Disable,,0,-1")
		ent:Fire("addoutput", "OnCompletion barney_follow,Deactivate,,0.1,-1")
	end)
	
	ents.WaitForEntityByName("lcs_barney_h4x", function(ent)
		ent:Fire("addoutput", "OnCompletion hl2c_timer_follow,Enable,,0.5,-1")
		ent:Fire("addoutput", "OnCompletion hl2c_timer_follow,Activate,,0.5,-1")
	end)
	
	ents.WaitForEntityByName("lcs_barney_h4x_pows", function(ent)
		ent:Fire("addoutput", "OnCompletion hl2c_timer_follow,Enable,,0.2,-1")
		ent:Fire("addoutput", "OnCompletion hl2c_timer_follow,Activate,,0.2,-1")
	end)
	
	ents.WaitForEntityByName("citizen_end_manager", function(ent)
		ent:SetKeyValue("maxallies","1")
	end)
	
	ents.WaitForEntityByName("n_room_doors2_close_relay", function(ent)
		ent:Fire("addoutput", "OnTrigger barney_tp,Teleport,,0.0,-1")
		ent:Fire("addoutput", "OnTrigger player_tp,Teleport,,0.0,-1")
		ent:Fire("addoutput", "OnTrigger lr_trap,RunCode,,0.0,-1")
	end)
	
end

return MAPSCRIPT