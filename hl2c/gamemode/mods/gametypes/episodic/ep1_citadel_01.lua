local MAPSCRIPT = {}


NEXT_MAP = "ep1_citadel_02"

RESET_PL_INFO = true

TRIGGER_CHECKPOINT = {
	{Vector(-4924, 3137, 2592), Vector(-4803, 3177, 2713)}
}

TRIGGER_DELAYMAPLOAD = {Vector(-2973, 1382, 2473), Vector(-3036, 1285, 2612)}

POINT_TRIGGER_DEBUG = false
HL2C_PET_LIKE_STALKER = true
-- VORTEX_POS = Vector(-4399.968750, 4782.817383, 2658.031250)


MAPSCRIPT.EntityFilterByName = {
	["clip_rollerminetrack"] = true,
}

function MAPSCRIPT:InitPost()
	

	
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
	
	local timer = ents.Create( "logic_timer" )
	timer:SetPos(Vector(1066, 353, -631))
	timer:SetKeyValue( "RefireTime", "5" )
	timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer:SetKeyValue( "StartDisabled", "0" )
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer:Spawn()
	
	
	for k, v in pairs(ents.FindByName("clip_rollerdoor")) do
		v:Remove()
	end
	--local clip_roller = ents.FindByName("clip_rollerdoor")
	--clip_roller[1]:Remove()
	
	
	for k, v in pairs(ents.FindByName("door_rollertraining")) do
		v:Remove()
	end
	--local rollerdoor = ents.FindByName("door_rollertraining")
	--rollerdoor[1]:Remove()
	
	
	for k, v in pairs(ents.FindByName("math_bringroller")) do
		--v:Fire("addoutput", "OnHitMax clip_combineshieldwall6,Kill,,0.0,1", "1")
		v:Remove()
	end
	--local math_roller = ents.FindByName("math_bringroller")
	--math_roller[1]:Fire("addoutput", "OnHitMax clip_combineshieldwall6,Kill,,0.0,1", "1")
	
	local mod_bringroller = ents.Create("math_counter")
	mod_bringroller:SetKeyValue("min", "0")
	mod_bringroller:SetKeyValue("max", "2")
	mod_bringroller:SetKeyValue("startvalue", "0")
	mod_bringroller:SetKeyValue("targetname", "math_bringroller")
	/*mod_bringroller:Fire("addoutput","OnHitMax lcs_al_citadel_01_rollertraining_02,Start,,0,-1")
	mod_bringroller:Fire("addoutput","OnHitMax trigger_roller_holdmine,Disable,,0,-1")
	mod_bringroller:Fire("addoutput","OnHitMax trigger_player_holdmine,Disable,,0,-1")*/
	mod_bringroller:Fire("addoutput","OnHitMax !self,SetValueNoFire,,0,-1")
	/*mod_bringroller:Fire("addoutput","OnHitMax nag_bringrollermine,Kill,,0.1,-1")
	mod_bringroller:Fire("addoutput","OnHitMax trigger_nagbringroller,Kill,,0,-1")
	mod_bringroller:Fire("addoutput","OnHitMax trigger_alyxrunback,Enable,,0,-1")
	mod_bringroller:Fire("addoutput","OnHitMax alyx,AddContext,al_hint_citRollerMineTraining:0,0,-1")*/
	/*mod_bringroller:Fire("addoutput","OnHitMax alyx,AddContext,al_hint_citRollerMineTraining:1,0.2,-1")
	mod_bringroller:Fire("addoutput","OnHitMax relay_al_scripting_start,Enable,,0.3,-1")
	mod_bringroller:Fire("addoutput","OnHitMax relay_al_scripting_stop,Enable,,0.3,-1")
	mod_bringroller:Fire("addoutput","OnHitMax relay_al_scripting_stop2,Trigger,,0.4,-1")*/
	--mod_bringroller:Fire("addoutput","OnHitMax relay_releaseGate,Trigger,,0.1,-1")
	mod_bringroller:Fire("addoutput", "OnHitMax clip_combineshieldwall6,Kill,,0.0,1", "1")
	mod_bringroller:Fire("addoutput", "OnHitMax trigger_player_likemines,Enable,,0.0,1")
	mod_bringroller:Spawn()
	
	--for k, v in pairs(ents.FindByName("lcs_al_citadel_01_rollertraining_02")) do
	--	v:Remove()
	--end
	/*
	local add_scene = ents.Create("logic_choreographed_scene")
	add_scene:SetKeyValue("busyactor", "1")
	add_scene:SetKeyValue("SceneFile", "scenes/episode_1/al_citadel_01_rollertraining_02.vcd")
	add_scene:SetKeyValue("targetname", "lcs_al_citadel_01_rollertraining_02")
	add_scene:SetKeyValue("target1", "mark_roller_console_01")
	add_scene:SetKeyValue("target2", "target_hackingconsole_01")
	add_scene:Fire("addoutput","OnCompletion relay_al_scripting_start,Enable,,0.1,-1")
	add_scene:Fire("addoutput", "OnCompletion relay_al_scripting_stop,Enable,,0.1,-1")
	add_scene:Fire("addoutput", "OnCompletion relay_al_scripting_stop2,Trigger,,0.2,-1")
	add_scene:Fire("addoutput", "OnStart alyx,StartScripting,,0,-1")
	add_scene:Fire("addoutput", "OnStart alyx,al_hint_citRollerMineTraining:1,,0,-1")
	add_scene:Spawn()
	*/
	for k, v in pairs(ents.FindByName("trigger_player_holdmine")) do
		v:Remove()
	end
	
	local add_phold = ents.Create("point_trigger")
	add_phold:SetKeyValue("spawnflags", "1")
	add_phold:SetKeyValue("TriggerOnce", "1")
	add_phold:SetKeyValue("targetname", "trigger_player_holdmines")
	add_phold:SetKeyValue("TriggerRadius", "200")
	add_phold:SetPos(Vector(-4712, 7735.77, 2529))
	add_phold:Fire("addoutput", "OnStartTouch math_bringroller,Add,1,0,-1")
	--add_phold:Fire("addoutput", "OnStartTouch relay_releaseGate,Trigger,,0.1,-1")
	add_phold:Spawn()
	add_phold:Activate()
	
	local add_p2hold = ents.Create("point_trigger")
	add_p2hold:SetKeyValue("spawnflags", "1")
	add_p2hold:SetKeyValue("TriggerOnce", "1")
	add_p2hold:SetKeyValue("targetname", "trigger_player_likemines")
	add_p2hold:SetKeyValue("TriggerRadius", "300")
	add_p2hold:SetKeyValue("StartDisabled", "1")
	add_p2hold:SetPos(Vector(-4712, 7735.77, 2529))
	add_p2hold:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,!player D_LI 999,0.2,-1")
	add_p2hold:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,!player D_LI 50,0.3,1")
	add_p2hold:Fire("addoutput", "OnStartTouch relay_roller_AFinInteract,Trigger,,0.1,-1")
	add_p2hold:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,cs_training D_HT 999,0.2,1")
	--add_phold:Fire("addoutput", "OnStartTouch relay_releaseGate,Trigger,,0.1,-1")
	--"OnAlyxFinishedInteraction" "!self,SetRelationship,!player D_LI 50,0.1,1"
	--	"OnAlyxFinishedInteraction" "relay_roller_AFinInteract,Trigger,,0,-1"
	--	"OnAlyxFinishedInteraction" "!self,SetRelationship,cs_training D_HT 999,0.1,1"
	--add_p2hold:Fire("addoutput", "OnStartTouch relay_releaseGate,Trigger,,0.1,-1")
	add_p2hold:Spawn()
	add_p2hold:Activate()
	
	local add_ptrig = ents.Create("point_trigger")
	add_ptrig:SetKeyValue("spawnflags", "2")
	add_ptrig:SetKeyValue("TriggerOnce", "1")
	add_ptrig:SetKeyValue("StartDisabled", "0")
	add_ptrig:SetKeyValue("targetname", "trigger_rollermine_found")
	add_ptrig:SetKeyValue("filtername", "filter_rollermine")
	add_ptrig["filtername"] = "filter_rollermine"
	add_ptrig.filter = "filter_rollermine"
	add_ptrig:SetKeyValue("TriggerRadius", "80")
	add_ptrig:SetPos(Vector(-4745.345703, 7730.245117, 2623.706543))
	add_ptrig:Fire("addoutput", "OnStartTouch math_bringroller,Add,1,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch lcs_al_citadel_01_rollertraining_02,Start,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch lcs_al_citadel_01_rollertraining_02,Kill,,0.2,-1")
	add_ptrig:Fire("addoutput","OnStartTouch trigger_roller_holdmine,Disable,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch trigger_player_holdmine,Disable,,0,-1")
	--add_ptrig:Fire("addoutput","OnStartTouch !self,SetValueNoFire,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch nag_bringrollermine,Kill,,0.1,-1")
	add_ptrig:Fire("addoutput","OnStartTouch trigger_nagbringroller,Kill,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch trigger_alyxrunback,Enable,,0,-1")
	--add_ptrig:Fire("addoutput","OnStartTouch alyx,AddContext,al_hint_citRollerMineTraining:0,0,-1")
	--add_ptrig:Fire("addoutput","OnStartTouch alyx,AddContext,al_hint_citRollerMineTraining:0,0,-1")
	--add_ptrig:Fire("addoutput", "OnStartTouch relay_releaseGate,Trigger,,0.1,-1")
	add_ptrig:Fire("addoutput","OnStartTouch clip_rollerminehack,Kill,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch aisc_watch_ballstalker,Enable,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch trigger_alyxrunback,Kill,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch aiss_alyxrunback,Kill,,0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch lcs_alyx_opengate,Start,,1.0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch rollermine,InteractivePowerDown,,1.0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch rollermine,Kill,,2.0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch cs_training,Kill,,2.0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch cs_training_2,Kill,,2.0,-1")
	add_ptrig:Fire("addoutput","OnStartTouch relay_combineshieldwall2_off,Trigger,,5.0,-1")
	--clip_rollerminehack
	add_ptrig:Spawn()
	add_ptrig:Activate()
	--"OnEndTouch" "!activator,SetRelationship,!player D_HT 999,0,-1"
	
	local add_pt = ents.Create("point_trigger")
	add_pt:SetKeyValue("spawnflags", "1")
	add_pt:SetKeyValue("TriggerOnce", "1")
	add_pt:SetKeyValue("targetname", "trigger_off_shield_hl2c")
	add_pt:SetKeyValue("TriggerRadius", "200")
	add_pt:SetPos(Vector(-4001, 1619, 2529))
	add_pt:Fire("addoutput", "OnStartTouch relay_gravshield_off_1,Trigger,,0,-1")
	--add_pt:Fire("addoutput", "OnStartTouch relay_releaseGate,Trigger,,0.1,-1")
	add_pt:Spawn()
	add_pt:Activate()
	
	/*
	local droprollers = ents.FindByName("trigger_droprollers")
	droprollers[1]:Fire("addoutput", "OnPressed trigger_player_holdmine,Enable,,0.0,-1", "1")
	droprollers[1]:Fire("addoutput", "OnPressed trigger_roller_holdmine,Enable,,0.0,-1", "1")
	droprollers[1]:Fire("addoutput", "OnPressed clip_combineshieldwall4,Kill,,0.0,-1", "1")
	droprollers[1]:Fire("addoutput", "OnPressed brush_combineshieldwall4,Kill,,0.0,-1", "1")
	droprollers[1]:Fire("addoutput", "OnPressed math_bringroller,Enable,,0.0,-1", "1")
	*/
	
	
	local c_v = ents.FindByName("trigger_cancel_vista_1")
	c_v[1]:Fire("addoutput", "OnTrigger trigger_player_holdmine,Disable,,1.0,-1", "1")
	c_v[1]:Fire("addoutput", "OnTrigger trigger_roller_holdmine,Disable,,1.0,-1", "1")
	c_v[1]:Fire("addoutput", "OnTrigger math_bringroller,Disable,,1.0,-1", "1")
	
	for k, v in pairs(ents.FindByName("asc_looklightbridge")) do
		v:Remove()
	end
	
	--local script = ents.FindByName("asc_looklightbridge")
	--script[1]:Remove()
	
	for k, v in pairs(ents.FindByName("ss_stalker_railing_jump")) do
		v:Fire("addoutput", "OnEndSequence soldier_assault1_relay,Trigger,,5.0,-1", "1")
	end
	
	/*
	for k, v in pairs(ents.FindByName("trigger_roller_holdmine")) do
		
		
		v:Fire("addoutput", "OnStartTouch alyx,AddContext,al_hint_citRollerMineTraining:0,0,-1")
		
	end*/
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	
	pl:Give("weapon_physcannon")

end


return MAPSCRIPT