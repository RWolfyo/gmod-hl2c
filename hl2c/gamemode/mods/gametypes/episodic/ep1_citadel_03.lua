local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-559.076233, 12174.209961, 5376.07275), 0}

NEXT_MAP = "ep1_citadel_04"

SUPER_GRAVITY_GUN = true
HL2C_PET_LIKE_STALKER = true
TRIGGER_CHECKPOINT = {
	{Vector(-175.968750, 12315.968750, 5312.031250), Vector(-55.123409, 12023.698242, 5372.137695),false,function()
		ents.GetMapCreatedEntity(3334):Fire("Trigger")
		for k, v in pairs(ents.FindByClass("npc_alyx")) do
			v:SetPos( Vector(-33.550152, 12237.717773, 5342.333984) )
		end
	end},
	{Vector(1316, 11889, 5321), Vector(1073, 11734, 5431)}, // inside
	{Vector(1448, 11621, 5327), Vector(1598, 11831, 5379)}, // lift
	
	{Vector(1629, 11661, 4233), Vector(1735, 11831, 4403)}, // going down lift
	{Vector(1894, 11895, 4295), Vector(1979, 11538, 4347)}, // getting out

	{Vector(3535.968750, 11408.031250, 4771.759766), Vector(3447.486816, 11498.852539, 4839.405762)}, // First Cannonn down

	
	
	{Vector(1916.157227, 10431.841797, 5692.031250), Vector(1933.082397, 10833.458008, 5734.521973)}, // ??
	{Vector(2116, 13304, 5329), Vector(2046, 13004, 5428),false,function()
	
	local ent = ents.Create("logic_relay")
	ent:SetKeyValue("targetname","hl2c_relay_controlroom3_finished")
	ent:Fire("addoutput","OnTrigger Matcontrol_core,StartAnimSequence,18 21 8 1,10,-1")
	//ent:Fire("addoutput","OnTrigger autosave,Save,,0,1")
	ent:Fire("addoutput","OnTrigger relay_core_completed,Enable,,0,1")
	ent:Fire("addoutput","OnTrigger relay_core_completed,Trigger,,10,-1")
	ent:Fire("addoutput","OnTrigger door_core_breaker_room_04,SetAnimation,idle_open,17,-1")
	ent:Fire("addoutput","OnTrigger door_core_breaker_room_04,SetAnimation,open,12,-1")
	ent:Fire("addoutput","OnTrigger sound_laserpower_beam1,StopSound,,3.8,-1")
	ent:Fire("addoutput","OnTrigger Beam_laserpower_01a2,TurnOff,,3.8,-1")
	ent:Fire("addoutput","OnTrigger spark_laserpower_3,SparkOnce,,3.8,-1")
	ent:Fire("addoutput","OnTrigger relay_laser_2,Trigger,,3.5,-1")
	ent:Fire("addoutput","OnTrigger sound_laserpower_beam1,PlaySound,,3,-1")
	ent:Fire("addoutput","OnTrigger Beam_laserpower_01a2,TurnOn,,3,-1")
	ent:Fire("addoutput","OnTrigger coupler_laser_3,SetAnimation,deploy,2,-1")
	ent:Fire("addoutput","OnTrigger door_laserpower_01a2,Toggle,,1.5,-1")
	ent:Fire("addoutput","OnTrigger sound_core_partial_stable,StopSound,,10,-1")
	ent:Fire("addoutput","OnTrigger sound_core_stable,PlaySound,,10,-1")
	ent:Fire("addoutput","OnTrigger logic_door_comb_1_open,Trigger,,0,-1")
	ent:Spawn()
	ent:Fire("Trigger","",30)
	end}, // When Core Off
	{Vector(1453, 12887, 5324), Vector(1260, 12759, 5409),false,function()
	ents.GetMapCreatedEntity(2541):Fire("SetAnimation","idle_closed",1.0)
	end}, // Going back to alyx door is going to close
	
	-- //1059 13710 5317
	-- //1236 13577 5360
	{Vector(1059, 13710, 5317), Vector(1236, 13577, 5360)},
	
	-- //1245 13699 3771
	-- //1049 13198 3855
	{Vector(1245, 13699, 3771), Vector(1049, 13198, 3855)},
	
}

--TRIGGER_DELAYMAPLOAD = {Vector(2001, 13362, 5325), Vector(1940, 13270, 5431)}
--TRIGGER_DELAYMAPLOAD = {Vector(1043.770142, 13566.106445, 4459.508301), Vector(1245.884277, 13711.164063, 4189.414063)}
--TRIGGER_DELAYMAPLOAD = {Vector(2001, 13362, 5325), Vector(1940, 13270, 5431)}

--new ending
-- 1286 13087 3745
-- 942 13034 3843
TRIGGER_DELAYMAPLOAD = {Vector(1286, 13087, 3745), Vector(942, 13034, 3843)}

BRUSH_PLAYERCLIP = {
	{Vector(3085, 12465, 4729), Vector(2940, 12635, 4734)}
}


-- VORTEX_POS = Vector(4081.966309, 11931.519531, 5029.485352)



function MAPSCRIPT:InitPost()

/*
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetPos(Vector(-539.076233, 12174.209961, 5376.07275))
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
	
	ents.GetMapCreatedEntity(2456):Fire("addoutput", "OnDeath relay_disable_pacifist,Trigger,,0,-1")
	ents.GetMapCreatedEntity(2457):Fire("addoutput", "OnDeath relay_disable_pacifist,Trigger,,0,-1")
	ents.GetMapCreatedEntity(2457):Fire("addoutput", "OnDeath achievement_pacifist,Kill,,0,-1")
	ents.GetMapCreatedEntity(2456):Fire("addoutput", "OnDeath achievement_pacifist,Kill,,0,-1")
	
	--timer.Simple(1, function()
	local ball_auto = ents.Create("logic_auto")
	ball_auto:SetPos(Vector(1065, 353, -631))
	ball_auto:SetKeyValue("spawnflags", "1")
	ball_auto:Fire("addoutput", "OnMapSpawn timer_ball_tube1,Enable,,1,-1")
	ball_auto:Spawn()
	
	local mapspawn_auto = ents.Create("logic_auto")
	mapspawn_auto:SetPos(Vector(-735.61, 12191.6, 5381))
	mapspawn_auto:SetKeyValue("spawnflags", "1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,EnableAlwaysTransition,,0.8,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.1,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn renamedballspawntimer,Enable,,1,-1")
	mapspawn_auto:Spawn()
	/*
	"OnMapSpawn" "global_newgame_template_base_items,ForceSpawn,,0.5,1"
            "OnMapSpawn" "alyx,EnableAlwaysTransition,,0.8,-1"
            "OnMapSpawn" "alyx,Kill,,0,-1"
            "OnMapSpawn" "global_newgame_spawner_suit,Kill,,0.8,-1"
            "OnMapSpawn" "global_newgame_spawner_physcannon,Kill,,0.8,-1"
            "OnMapSpawn" "alyx,SetDamageFilter,filter_NoDamage,1,-1"
            "OnMapSpawn" "renamedballspawntimer,Enable,,1,-1"
	*/
	
	
	
	
	local aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "player")
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
	
	--local stalker = ents.FindByName("core_stalker")
	--stalker[1]:Remove()
	--stalker[2]:Remove()
	
	--local clip = ents.FindByName("Core_lift_doors")
	--clip[1]:Remove()
	--clip[2]:Remove()
	
	local doors = ents.FindByName("trigger_closedoors")
	doors[1]:Fire("addoutput", "OnTrigger pclip_core_elevator_1,Enable,,0.0,-1", "0.0")
	
	--local closed = ents.FindByName("core_airlock_close")
	--closed[1]:Remove()
	
	local door = ents.FindByName("door_comb_2_1")
	door[1]:Fire("addoutput", "OnFullyOpen pclip_core_elevator_1,Enable,,0.0,-1", "0.0")
	door[1]:Fire("addoutput", "OnFullyOpen counter_balltrap_bridge_1,Add,2,0.0,-1", "0.0")
	door[1]:Fire("addoutput", "OnFullyOpen counter_balltrap_bridge_2,Add,2,0.0,-1", "0.0")
	door[1]:Fire("addoutput", "OnFullyOpen counter_balltrap_bridge_3,Add,2,0.0,-1", "0.0")
	
	local scene = ents.FindByName("lcs_core_control_scene")
	scene[1]:Fire("addoutput", "OnTrigger7 pclip_core_elevator_1,Disable,,0.0,-1", "0.0")
	/*
	local _relay_door = ents.FindByName("physbox_door_ballpipe4")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop relay_controlroom3_finished,Enable,,0.0,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop relay_controlroom3_finished,Trigger,,0.01,-1")
	--_relay_door[1]:Fire("addoutput", "OnPhysGunDrop relay_controlroom3_finished,Disable,,1.40,-1")
	
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop Matcontrol_core,StartAnimSequence,18 21 8 1,10,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop autosave,Save,,0,1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop relay_core_completed,Trigger,,0.0,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop door_core_breaker_room_04,SetAnimation,idle_open,17,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop door_core_breaker_room_04,SetAnimation,open,12,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop sound_laserpower_beam1,StopSound,,3.8,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop Beam_laserpower_01a2,TurnOff,,3.8,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop spark_laserpower_3,SparkOnce,,3.8,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop relay_laser_2,Trigger,,3.5,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop sound_laserpower_beam1,PlaySound,,3,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop Beam_laserpower_01a2,TurnOn,,3,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop coupler_laser_3,SetAnimation,deploy,2,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop door_laserpower_01a2,Toggle,,1.5,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop sound_core_partial_stable,StopSound,,10,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop sound_core_stable,PlaySound,,10,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop logic_door_comb_1_open,Trigger,,0,-1")
	_relay_door[1]:Fire("addoutput", "OnPhysGunDrop lcs_alyx_atwindow,Resume,,0,-1")
	*/
	
	
	
	/* old code :( */
	-- local finish_core = ents.Create("point_trigger")
	-- finish_core:SetPos(Vector(2082, 13224, 5317))
	-- finish_core:SetKeyValue("targetname", "debug_point_trigger")
	-- finish_core:SetKeyValue("spawnflags", "1")
	-- finish_core:SetKeyValue("StartDisabled", "0")
	-- finish_core:SetKeyValue("TriggerRadius", "40")
	-- finish_core:SetKeyValue("TriggerOnce", "1")
	//finish_core:SetKeyValue("filtername", "blahblah")
	-- finish_core:Fire("addoutput", "OnStartTouch !self,Kill,,3.0,1")
	-- finish_core:Fire("addoutput", "OnStartTouch relay_controlroom3_finished,Enable,,0.0,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch relay_controlroom3_finished,Trigger,,0.01,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch Matcontrol_core,StartAnimSequence,18 21 8 1,10,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch autosave,Save,,0,1")
	-- finish_core:Fire("addoutput", "OnStartTouch relay_core_completed,Trigger,,0.0,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch door_core_breaker_room_04,SetAnimation,idle_open,17,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch door_core_breaker_room_04,SetAnimation,open,12,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch sound_laserpower_beam1,StopSound,,3.8,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch Beam_laserpower_01a2,TurnOff,,3.8,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch spark_laserpower_3,SparkOnce,,3.8,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch relay_laser_2,Trigger,,3.5,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch sound_laserpower_beam1,PlaySound,,3,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch Beam_laserpower_01a2,TurnOn,,3,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch coupler_laser_3,SetAnimation,deploy,2,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch door_laserpower_01a2,Toggle,,1.5,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch sound_core_partial_stable,StopSound,,10,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch sound_core_stable,PlaySound,,10,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch logic_door_comb_1_open,Trigger,,0,-1")
	-- finish_core:Fire("addoutput", "OnStartTouch lcs_alyx_atwindow,Resume,,0,-1")
	-- finish_core:Spawn()
	-- finish_core:Activate()
	
	/*
		"OnTrigger" "Matcontrol_core,StartAnimSequence,18 21 8 1,10,-1"
		"OnTrigger" "autosave,Save,,0,1"
		"OnTrigger" "relay_core_completed,Trigger,,10,-1"
		"OnTrigger" "door_core_breaker_room_04,SetAnimation,idle_open,17,-1"
		"OnTrigger" "door_core_breaker_room_04,SetAnimation,open,12,-1"
		"OnTrigger" "sound_laserpower_beam1,StopSound,,3.8,-1"
		"OnTrigger" "Beam_laserpower_01a2,TurnOff,,3.8,-1"
		"OnTrigger" "spark_laserpower_3,SparkOnce,,3.8,-1"
		"OnTrigger" "relay_laser_2,Trigger,,3.5,-1"
		"OnTrigger" "sound_laserpower_beam1,PlaySound,,3,-1"
		"OnTrigger" "Beam_laserpower_01a2,TurnOn,,3,-1"
		"OnTrigger" "coupler_laser_3,SetAnimation,deploy,2,-1"
		"OnTrigger" "door_laserpower_01a2,Toggle,,1.5,-1"
		"OnTrigger" "sound_core_partial_stable,StopSound,,10,-1"
		"OnTrigger" "sound_core_stable,PlaySound,,10,-1"
		"OnTrigger" "logic_door_comb_1_open,Trigger,,0,-1"
	*/
	--_relay_door[1]:SetKeyValue("addoutput", "OnTrigger pclip_core_elevator_1,Enable,,0.0,-1")
	/*
	local _ball_spawner_2 = ents.FindByName("ball_spawner_2")
	_ball_spawner_2[1]:SetKeyValue("spawnflags", "12290")
	_ball_spawner_2[1]:SetKeyValue("ballradius", "12")
	_ball_spawner_2[1]:SetKeyValue("minspeed", "256")
	_ball_spawner_2[1]:SetKeyValue("maxspeed", "384")
	
	local _ball_spawner_3 = ents.FindByName("ball_spawner_3")
	_ball_spawner_3[1]:SetKeyValue("spawnflags", "12290")
	_ball_spawner_3[1]:SetKeyValue("ballradius", "12")
	_ball_spawner_3[1]:SetKeyValue("minspeed", "256")
	_ball_spawner_3[1]:SetKeyValue("maxspeed", "384")
	
	local _ball_spawner_5 = ents.FindByName("ball_spawner_5")
	_ball_spawner_5[1]:SetKeyValue("spawnflags", "12290")
	_ball_spawner_5[1]:SetKeyValue("ballradius", "12")
	_ball_spawner_5[1]:SetKeyValue("minspeed", "256")
	_ball_spawner_5[1]:SetKeyValue("maxspeed", "384")
	*/
	local _doorblocker_corelift = ents.FindByName("brush_doorblocker_corelift")
	_doorblocker_corelift[1]:Remove()
	
	local _trigger_fall = ents.FindByName("trigger_fall")
	_trigger_fall[1]:Remove()
	
	local _trigger_fall_2 = ents.FindByName("trigger_fall_2")
	_trigger_fall_2[1]:Remove()
	
	local _brush_elevator_clip = ents.FindByName("brush_elevator_clip")
	_brush_elevator_clip[1]:Remove()
	
	-- local _brush_airlock_comb_clip = ents.FindByName("brush_airlock_comb_clip")
	-- _brush_airlock_comb_clip[1]:Remove()
	
	-- local _logic_door_airlock = ents.FindByName("logic_door_airlock_comb_1_close")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_1,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_2,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_3,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_4,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_5,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_6,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_7,Open,,2,-1")
	-- _logic_door_airlock[1]:Fire("addoutput", "OnTrigger door_airlock_comb_1_9,Open,,2,-1")
	
	local _Trigger_lift = ents.FindByName("Trigger_lift")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_1,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_2,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_3,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_4,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_5,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_6,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_7,Close,,2,-1")
	_Trigger_lift[1]:Fire("addoutput", "OnStartTouch door_airlock_comb_1_9,Close,,2,-1")
	
	
	local lift_doors = ents.FindByName("Teleport_lift_doors")
	lift_doors[1]:Fire("addoutput", "OnFullyClosed super_phys_gun,TurnOff,,5,-1")
	
	local lift_control_4 = ents.FindByName("path_lift_control_4")
	lift_control_4[1]:Fire("addoutput", "OnPass super_phys_gun,TurnOff,,0,-1")
	/*
	"Teleport_lift_doors"
			{
				"OnFullyClosed" "super_phys_gun,TurnOff,,5,-1"
			}
			"relay_laserpower_fail"
			{
				"OnTrigger" "counter_laserpower_batteries,SetValue,3,0.42,-1"
			}
			"path_lift_control_4"
			{
				"OnPass" "super_phys_gun,TurnOff,,0,-1"
				"OnPass" "servercommand,command,changelevel ep1_citadel_04,2,-1"
			}
	*/
	--end)
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
end


return MAPSCRIPT