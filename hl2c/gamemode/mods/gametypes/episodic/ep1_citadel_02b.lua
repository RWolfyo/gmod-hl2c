local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(1896, 4320, 2533), 351}

NEXT_MAP = "ep1_citadel_03"

SUPER_GRAVITY_GUN = true


TRIGGER_CHECKPOINT = {
	--{Vector(3131, 4695, 2517), Vector(3387, 4592, 2644)},
	/*
	setpos 3180.298828, 4529.580078, 257.474030;setang -9.056145 19.208744 0.000000
] getpos 
setpos 3330.727539, 4763.451660, 316.986389;setang 24.177055 -102.585480 0.000000
*/
	--{Vector(3180.298828, 4529.580078, 257.474030), Vector(3330.727539, 4763.451660, 316.986389)},
	/*
	setpos 3220.205078, 4741.466797, -6579.802734;setang 52.206070 -42.327839 0.000000
] getpos 
setpos 3896.406494, 4560.799316, -6586.834961;setang 24.176970 140.546127 0.000000

	*/
	{Vector(3825, 4499, -6711), Vector(3959, 4807, -6538)}
}


TRIGGER_DELAYMAPLOAD = {Vector(4938.159668, 4818.257813, -6772.732910), 
Vector(5184.332031, 4407.650391, -6529.196777)}

-- VORTEX_POS = Vector(4156.964844, 4685.000000, 256.031250)
HL2C_PET_LIKE_STALKER = true


function MAPSCRIPT:InitPost()

	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	local timer = ents.Create( "logic_timer" )
	timer:SetPos(Vector(1066, 353, -631))
	timer:SetKeyValue( "RefireTime", "5" )
	timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer:SetKeyValue( "StartDisabled", "0" )
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer:Spawn()
	
	local timer2 = ents.Create( "logic_timer" )
	timer2:SetPos(Vector(1067, 354, -630))
	timer2:SetKeyValue( "RefireTime", "0.1" )
	timer2:SetKeyValue( "targetname", "hl2c_timer_enable" )
	timer2:SetKeyValue( "StartDisabled", "0" )
	timer2:Fire("addoutput", "OnTimer enable_impact_trigger,Enable,,0.0,-1", "1")
	timer2:Fire("addoutput", "OnTimer enable_impact_trigger,ClearParent,,0.0,-1", "1")
	timer2:Spawn()
	
	local impact = ents.FindByName("enable_impact_trigger")
	impact[1]:Fire("addoutput", "OnTrigger !activator,Kill,,0.0,-1", "1")
	
	local console = ents.FindByName("ballconsole6_monitor")
	console[1]:Remove()
	
	local console2 = ents.FindByName("ballconsole8_console")
	console2[1]:Remove()
	
	local lift_path = ents.FindByName("citadel_path_lift01_13")
	lift_path[1]:Fire("addoutput", "OnPass citadel_train_lift01_1,SetSpeed,50,5.0,-1", "1")
	lift_path[1]:Fire("addoutput", "OnPass citadel_train_lift01_1,SetSpeed,50,7.0,-1", "1")
	
	for k, v in pairs(ents.FindByName("train_initial_start_trigger")) do
	
		v:Fire("addoutput", "OnStartTouch upper_catwalk_glass_1_exp,Kill,,0.0,-1")
	
	end
	
	for k, v in pairs(ents.FindByName("path_elevator_guard_end1")) do
	
		v:Fire("addoutput", "OnPass last_gib_spawn_explosion_3,Kill,,0.0,-1")
	
	end
	
	local tp = ents.Create("point_alyx_teleport")
	tp:SetPos(Vector(3151, 4621, 2545))
	tp:SetKeyValue("targetname", "tp_alyx_01")
	tp:Spawn()
	tp:Activate()
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)

	pl:Give("weapon_physcannon")

	
	if EP1_ELEVATOR then
	
		for k, v in pairs(ents.FindByName("target_lighting_elevator")) do
			pl:SetPos(v:GetPos())
		end
	
	end
	
	if EP1_ELEVATOR_OFF then
	
		for k, v in pairs(ents.FindByName("elevator_stop_lookat_target")) do
			pl:SetPos(v:GetPos())
		end
	
	end
	
end


function MAPSCRIPT:EntityRemoved(ent)
	
	if ent:GetName() == "upper_catwalk_glass_1_exp" then
		EP1_ELEVATOR = true
	end
	
	if ent:GetName() == "last_gib_spawn_explosion_3" then
		EP1_ELEVATOR = false
		EP1_ELEVATOR_OFF = true
	end
	
	
end

function MAPSCRIPT:KeyValue(ent, key, value)
	
	
	if key == "targetname" and value == "train_initial_start_counter" then
		if IsValid(ent) then
			print("********************************************")
			print("* Modified train_initial_start_counter")
			print("********************************************")
			
			ent:Fire("addoutput", "OnHitMax tp_alyx_01,Teleport,,0,-1")
		end
	end
	
end


return MAPSCRIPT