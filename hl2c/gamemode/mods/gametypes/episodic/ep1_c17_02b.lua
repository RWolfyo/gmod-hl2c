local MAPSCRIPT = {}


INFO_PLAYER_SPAWN = {Vector(-1935.36, 2166.22, -90.97), 180}

NEXT_MAP = "ep1_c17_02a"
--NEXT_MAP = "ep1_c17_05" --Causing bugs -.-

/*
setpos -2286.539551, 2875.289795, 31.672596;setang 52.588821 -113.240601 0.000000
] getpos 
setpos -2118.349854, 3201.048096, 193.590271;setang 4.565028 70.546242 0.000000
--Checkpoint
*/
TRIGGER_CHECKPOINT = {
	{Vector(-2286.539551, 2875.289795, 31.672596), Vector(-2118.349854, 3201.048096, 193.590271)},
	{Vector(1332, 2012, 125), Vector(984, 1854, 196)},
}

/*
setpos 1076.493652, 2123.800293, 140.286255;setang 61.992695 3.174817 0.000000
] getpos 
setpos 957.950073, 2234.475586, 257.891022;setang -24.742313 136.290176 0.000000
TRIGGER_DELAYMAPLOAD
*/
--Old End Map TRIGGER_DELAYMAPLOAD
--TRIGGER_DELAYMAPLOAD = {Vector(1076.493652, 2123.800293, 140.286255), Vector(957.950073, 2234.475586, 257.891022)}

--New End Map
TRIGGER_DELAYMAPLOAD = {Vector(-720.782043, 4025.581543, 335.582001), Vector(-779.988647, 4226.933105, 492.783203)}

/*
 -720.782043, 4025.581543, 335.582001
 -779.988647, 4226.933105, 492.783203

*/

VORTEX_POS = Vector(1791, 2330, -19)

TARGET_TELEPORT_HL2C = "courtyard_citizens_lead"



function MAPSCRIPT:InitPost()
	
	ents.WaitForEntityByName("alyx",function(ent)
		ent:Fire("SetDamageFilter","filter_NoDamage",1.5)
	end)
	
	ents.WaitForEntityByName("barneyscene_closedoor_rl",function(ent)
	ent:Fire("addoutput", "OnTrigger barney_door_2,Kill,,0.9,-1")
	ent:Fire("addoutput", "OnTrigger barney_doorbutton_1,Kill,,0.9,-1")
	end)
	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	-- -1976.857422, 2231.331055, -81.065643
	local timer2 = ents.Create( "logic_timer" )
	timer2:SetPos(Vector(1066, 353, -631))
	timer2:SetKeyValue( "RefireTime", "5" )
	timer2:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer2:SetKeyValue( "StartDisabled", "0" )
	timer2:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer2:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer2:Spawn()
	
	local fix_bridge = ents.FindByName("physbox_bridge_01")
	fix_bridge[1]:Fire("DisableMotion", "", "0")
	
	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_ar2,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_pistol,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_ammo,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.4,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn airvent_door_1,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn looktargets_inside,EnableHint,,0,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
	_logic_auto:Spawn()
	_logic_auto:Activate()
	
	for k, v in pairs(ents.FindByName("crank2_board_1")) do 
		v:Fire("addoutput", "OnBreak physbox_bridge_02,DisableMotion,,5.1,-1")
	end
	
	local alyx_tp = ents.Create("point_alyx_teleport")
	alyx_tp:SetPos(Vector(1016, 2791, 101))
	alyx_tp:SetKeyValue("targetname", "hl2c_alyx_tp")
	alyx_tp:Spawn()
	alyx_tp:Activate()
	
	local alyx_tp = ents.Create("point_alyx_teleport")
	alyx_tp:SetPos(Vector(354, 2851, -17))
	alyx_tp:SetKeyValue("targetname", "hl2c_alyx_tp02")
	alyx_tp:Spawn()
	alyx_tp:Activate()
	local tp = ents.Create("point_barney_teleport")
	tp:SetPos(Vector(1012, 2159, 170))
	tp:SetKeyValue("targetname", "hl2c_barney_tp")
	tp:Spawn()
	tp:Activate()
	
	for k, v in pairs(ents.FindInSphere(Vector(812.5, 2784.5, 129), 20)) do
		v:Fire("addoutput", "OnTrigger hl2c_alyx_tp,Teleport,,1.0,-1")
	end
	
	for k, v in pairs(ents.FindInSphere(Vector(1149, 2130.5, -219.88), 20)) do
		v:Fire("addoutput", "OnTrigger bld_a_frontdoor_1_ss_1,BeginSequence,,1.0,-1")
		v:Fire("addoutput", "OnTrigger bld_a_frontdoor_open_rl,Trigger,,6.0,-1")
		v:Fire("addoutput", "OnTrigger citizen_2_ct_1_aiss_2,StartSchedule,,6.0,-1")
		v:Fire("addoutput", "OnTrigger bld_a_frontdoor_1,Open,,8.0,-1")
	end
	
	for k, v in pairs(ents.FindInSphere(Vector(1435, 1884, 176.5), 5)) do
		v:Fire("addoutput", "OnTrigger counter_barneyScene,Add,1,12.6,-1")
		v:Fire("addoutput", "OnTrigger barney_door_2_slot,SetAnimation,Open,1.0,-1")
		v:Fire("addoutput", "OnTrigger barney_door_2_slot,SetAnimation,Close,3.0,-1")
		v:Fire("addoutput", "OnTrigger barney_door_2,Unlock,,3.0,-1")
		v:Fire("addoutput", "OnTrigger teleport_barney_barney_scene,Teleport,,4.0,-1")
		v:Fire("addoutput", "OnTrigger barney_door_2,Open,,4.5,-1")
		v:Fire("addoutput", "OnTrigger ss_ForceAlyxGetsInside,BeginSequence,,6.5,-1")
		v:Fire("addoutput", "OnTrigger barneyscene_cscanner_template,ForceSpawn,,12.5,-1")
		v:Fire("addoutput", "OnTrigger maker_crowbar,SetParentAttachment,anim_attachment_LH,14,-1")
		v:Fire("addoutput", "OnTrigger crowbar_barneyHeld,SetParent,barney,14,-1")
		v:Fire("addoutput", "OnTrigger crowbar_barneyHeld,SetParentAttachment,anim_attachment_LH,14.5,-1")
		v:Fire("addoutput", "OnTrigger barney,StartScripting,,14.6,-1")
		v:Fire("addoutput", "OnTrigger ss_barney_grabCrowBar,BeginSequence,,14.7,-1")
		v:Fire("addoutput", "OnTrigger ss_barney_TossCrowBar,BeginSequence,,19.7,-1")
		v:Fire("addoutput", "OnTrigger barney_scene_player_blocker,Kill,,20.7,-1")
		v:Fire("addoutput", "OnTrigger lcs_barneyLeaves,Start,,20.7,-1")
		v:Fire("addoutput", "OnTrigger ss_ForceAlyxGetsInside,StopSequence,,20.7,-1")
		v:Fire("addoutput", "OnTrigger ss_ForceAlyxGetsInside,Kill,,20.8,-1")
		v:Fire("addoutput", "OnTrigger nag_barney,TurnOff,,20.8,-1")
		v:Fire("addoutput", "OnTrigger nag_barney,Kill,,20.9,-1")
		v:Fire("addoutput", "OnTrigger lcs_pre_raid,Kill,,20.9,-1")
		v:Fire("addoutput", "OnTrigger lcs_barneyLeaves,Kill,,22,-1")
		v:Fire("addoutput", "OnTrigger lcs_barneysaysluckydog,Kill,,22,-1")
		v:Fire("addoutput", "OnTrigger lcs_post_raid,Kill,,22,-1")
		v:Fire("addoutput", "OnTrigger follow_alyx,Follow,,22,-1")
		v:Fire("addoutput", "OnTrigger alyx,StartScripting,,22,-1")
		v:Fire("addoutput", "OnTrigger hl2c_barney_tp,Teleport,,4.4,-1")
		--v:Fire("addoutput", "OnTrigger bld_a_frontdoor_1,Open,,8.0,-1")
	end
	
	for k, v in pairs(ents.FindByName("rappel1_csoldier_rappel02")) do
		v:Fire("addoutput", "OnDeath combine_bridge,Kill,,0,-1")
		v:Fire("addoutput", "OnDeath catwalk_ambush_soldier_1,Kill,,0,-1")
		v:Fire("addoutput", "OnDeath catwalk_ambush_cit_1,Kill,,0,-1")
		--v:Fire("addoutput", "OnDeath backstreet_exit_door_1_blocker,Kill,,0,-1")
	end
	
	for k, v in pairs(ents.FindByName("backstreet_exit_door_1")) do
		v:Fire("addoutput", "OnOpen courtyard_citizens_lead,StartScripting,,0,-1")
		--v:Fire("addoutput", "OnDeath catwalk_ambush_soldier_1,Kill,,0,-1")
		--v:Fire("addoutput", "OnDeath catwalk_ambush_cit_1,Kill,,0,-1")
		--v:Fire("addoutput", "OnDeath backstreet_exit_door_1_blocker,Kill,,0,-1")
	end
	for k, v in pairs(ents.FindByName("courtyard_citizens_lead")) do
		v:Fire("addoutput", "OnFoundPlayer courtyard_citizens_lead,StartScripting,,0,-1")
		v:Fire("addoutput", "OnFoundPlayer courtyard_citizens_lead,StopScripting,,5.0,-1")
		v:Fire("addoutput", "OnFoundPlayer goal_lead_citizen,Activate,,5.0,-1")
		v:Fire("addoutput", "OnFoundPlayer backstreet_exit_door_1_blocker,Kill,,5.0,-1")
		--v:Fire("addoutput", "OnDeath backstreet_exit_door_1_blocker,Kill,,0,-1")
	end
	
	for k, v in pairs(ents.FindByName("courtyard_citizens_talk_trigger")) do
		v:Fire("addoutput", "OnTrigger hl2c_alyx_tp02,Teleport,,1.0,-1")
		v:Fire("addoutput", "OnTrigger courtyard_citizens_lead,StopScripting,,7.0,-1")
		v:Fire("addoutput", "OnTrigger goal_lead_citizen,Activate,,7.0,-1")
		v:Fire("addoutput", "OnTrigger backstreet_exit_door_1_blocker,Kill,,7.0,-1")
		--v:Fire("addoutput", "OnDeath backstreet_exit_door_1_blocker,Kill,,0,-1")
	end
	
	
	
	timer.Simple(5, function()
	local alyxdie = ents.FindByClass("npc_alyx")
	for _, adie in pairs(alyxdie) do
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
	end
	end)
	
	for k, v in pairs(ents.FindInSphere(Vector(1513,2351,-223),1)) do
		if v:GetClass() == "trigger_once" then
			v:Fire("addoutput","OnTrigger tp_alyx01,Teleport,,1.0,-1")
			v:Fire("addoutput","OnTrigger tp_tar01,Teleport,,1.0,-1")
			v:Fire("addoutput","OnTrigger tp_tar02,Teleport,,4.0,-1")
			--v:Fire("addoutput","OnTrigger tp_tar01,Enable,,1.0,-1")
		end
	end
	for k, v in pairs(ents.FindInSphere(Vector(1668, 1792, 188),1)) do
		if v:GetClass() == "trigger_once" then
			v:Fire("addoutput","OnTrigger tp_alyx02,Teleport,,1.0,-1")
			--v:Fire("addoutput","OnTrigger tp_tar01,Teleport,,1.0,-1")
			--v:Fire("addoutput","OnTrigger tp_tar02,Teleport,,4.0,-1")
			--v:Fire("addoutput","OnTrigger tp_tar01,Enable,,1.0,-1")
		end
	end
	
	local tp = ents.Create("point_alyx_teleport")
	tp:SetPos(Vector(1760, 2418, -283))
	tp:SetKeyValue("targetname", "tp_alyx01")
	tp:Spawn() 
	tp:Activate()
	local tp = ents.Create("point_alyx_teleport")
	tp:SetPos(Vector(1675, 1793, 165))
	tp:SetKeyValue("targetname", "tp_alyx02")
	tp:Spawn() 
	tp:Activate()
	local tp = ents.Create("point_target_teleport")
	tp:SetPos(Vector(1677, 2404, -283))
	tp:SetKeyValue("targetname", "tp_tar01")
	tp:Spawn() 
	tp:Activate()
	local tp = ents.Create("point_target_teleport")
	tp:SetPos(Vector(1121, 2118, -191))
	tp:SetKeyValue("targetname", "tp_tar02")
	tp:Spawn() 
	tp:Activate()
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	-- local aft = ents.FindByName("hl2c_timer_follow")
	-- aft[1]:Fire("Deactivate", "", "0.0")
	-- aft[1]:Fire("Activate", "", "1.0")
	for k, v in pairs(ents.FindByName("hl2c_timer_follow")) do
	
		v:Fire("Deactivate", "", "0.0")
		v:Fire("Activate", "", "1.0")
	
	end
	
	
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_frag")
end

hook.Add("Think", "hl2cKeepFix", function()
	for k, v in pairs(ents.FindByName("physbox_bridge_01")) do
		v:Fire("DisableMotion", "", "0")
	end
	for k, v in pairs(ents.FindByName("physbox_bridge_02")) do
		v:Fire("DisableMotion", "", "0")
	end
end)


return MAPSCRIPT