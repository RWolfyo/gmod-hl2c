local MAPSCRIPT = {}


INFO_PLAYER_SPAWN = {Vector(3460, 14056, 3642), 270}

NEXT_MAP = "ep1_c17_00"

TRIGGER_CHECKPOINT = {
	{Vector(3288, 13434, 3609), Vector(3599, 13300, 3746)},
	{Vector(3320, 11840, 3609), Vector(3444, 11673, 3725)},
	{Vector(3807, 10756, 3513), Vector(3833, 10788, 5577)},
--Last Teleport to the last part of the train which can be buggy somehow I cant figure out how to make it work better :(
	{Vector(4105, 8001, 3360), Vector(4240, 8090, 3333)}
}

TRIGGER_DELAYMAPLOAD = {Vector(4146.798340, 8165.972168, 3345.360840), Vector(3764.492432, 8323.595703, 3445.706787)}

CUSTOM_TELEPORT_HL2C = "npc_rollermine"

EP1_TRAIN_CRASH = false

VORTEX_POS = Vector(4143.534668, 11871.712891, 3885.600342)
HL2C_PET_LIKE_STALKER = true


function MAPSCRIPT:InitPost()


	--timer.Simple( 5, function()
	local del_block1 = ents.FindByName("physbox_hatchblocker_1")
	del_block1[1]:Remove()
	
	local del_block2 = ents.FindByName("brush_stalkerpanel_lip")
	del_block2[1]:Remove()
	--petal_lock_1_1
	--3389.652832, 13891.372070, 3664.031250
	
	
	--setpos 3529.885254 -175.065079 3507.576660;setang -3.925868 4.864611 0.011525 for teleport
	--setpos 3571.075439 -169.347961 3508.097412
	--setpos 3571.981201 -168.818985 3508.125000
/*
	local _npc_alyx = ents.Create("npc_alyx")
	_npc_alyx:SetPos(Vector(3389.652832, 13891.372070, 3664.031250))
	_npc_alyx:SetKeyValue("targetname", "alyx")
	_npc_alyx:SetKeyValue("spawnflags", "4")
	_npc_alyx:SetKeyValue("GameEndAlly", "1")
	_npc_alyx:SetKeyValue("DontPickupWeapons", "No")
	_npc_alyx:SetKeyValue("AlwaysTransition", "0")
	_npc_alyx:SetKeyValue("additionalequipment", "weapon_alyxgun")
	_npc_alyx:SetKeyValue("model", "models/alyx.mdl")
	_npc_alyx:SetKeyValue("physdamagescale", "1.0")
	_npc_alyx:SetKeyValue("rendercolor", "255 255 255")
	_npc_alyx:SetKeyValue("renderamt", "255")
	_npc_alyx:Spawn()
	_npc_alyx:Activate()	
*/
	/*
	 "logic_auto"
        {
            "spawnflags" "1"
            "OnMapSpawn" "alyx,EnableAlwaysTransition,,0.8,-1"
            "OnMapSpawn" "alyx,SetDamageFilter,filter_NoDamage,1,-1"
            "OnMapSpawn" "global_newgame_spawner_physcannon,Kill,,0.8,-1"
            "OnMapSpawn" "global_newgame_spawner_suit,Kill,,0.8,-1"
            "OnMapSpawn" "global_newgame_template_base_items,ForceSpawn,,0.5,-1"
            "OnMapSpawn" "alyx,Kill,,0.1,-1"
            //"OnMapSpawn" "traincam,SetParent,train_stalker_tilt,1,-1"
            "origin" "3500.4 14078.6 3635"
        }
	*/
	local mapspawn_auto = ents.Create("logic_auto")
	mapspawn_auto:SetPos(Vector(3500.4, 14078.6, 3635))
	mapspawn_auto:SetKeyValue("spawnflags", "1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,EnableAlwaysTransition,,0.8,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
	mapspawn_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.1,-1")
	mapspawn_auto:Spawn()
	
	local _loadsaved_alyx_died = ents.FindByName("loadsaved_alyx_died")
	_loadsaved_alyx_died[1]:Remove()
	
	local _text_alyx_died = ents.FindByName("text_alyx_died")
	_text_alyx_died[1]:Remove()
	
	local _follow_alyx = ents.FindByName("follow_alyx")
	_follow_alyx[1]:Remove()
	
	local _teleport_crash = ents.FindByName("teleport_crash")
	_teleport_crash[1]:SetKeyValue("target", "!player")
	
	local tp_alyx = ents.Create("point_alyx_teleport")
	tp_alyx:SetKeyValue("targetname", "hl2c_alyx_tp")
	tp_alyx:SetPos( Vector(3524.18, -161.19, 3526) )
	tp_alyx:Spawn()
	
	for k, v in pairs(ents.FindByName("relay_stalkertrain_start")) do
		v:Fire("addoutput", "OnTrigger hl2c_alyx_tp,Teleport,,2,-1")
		v:Fire("addoutput", "OnTrigger hl2c_alyx_tp,Teleport,,4,-1")
		v:Fire("addoutput", "OnTrigger hl2c_alyx_tp,Teleport,,6,-1")
	end
	
	--setpos 3529.885254 -175.065079 3507.576660;setang -3.925868 4.864611 0.011525 for teleport
	--setpos 3571.075439 -169.347961 3508.097412
	--setpos 3571.981201 -168.818985 3508.125000
	
	aft = ents.Create("ai_goal_follow")
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
	
	local tp_force_alyx = ents.Create("point_changelevel")		//Here we create tp
	tp_force_alyx:SetKeyValue("targetname", "hl2c_changelevel")
	tp_force_alyx:SetPos(Vector( 7715, 1743, 36 ))
	tp_force_alyx:Spawn()
	/*
	local relay = ents.Create("logic_relay")
	relay:SetKeyValue("targetname", "hl2c_relay")
	relay:SetKeyValue("StartDisabled", "0")
	relay:SetKeyValue("spawnflags", "1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers_2,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers_soldiers,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball1,Kill,,1.5,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball2,RevertToDefaultRelationship,,1.6,-1")
	relay:Fire("addoutput", "OnTrigger al_citadel_04_rollerattack_02,Start,,1.7,-1")
	relay:Fire("addoutput", "OnTrigger alyx,StartScripting,,1.71,-1")
	relay:Fire("addoutput", "OnTrigger rollermine,SetRelationship,!player D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine,SetRelationship,alyx D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine2,SetRelationship,alyx D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine2,SetRelationship,!player D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger alyx,SetRelationship,rollermine D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger alyx,SetRelationship,rollermine2 D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball2,Kill,,1.7,-1")
	relay:Spawn()
	relay:Activate()
	
	local relay = ents.Create("logic_relay")
	relay:SetKeyValue("targetname", "hl2c_relay2")
	relay:SetKeyValue("StartDisabled", "0")
	relay:SetKeyValue("spawnflags", "1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers_2,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger counter_hackrollers_soldiers,Add,1,1.5,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball1,Kill,,1.5,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball2,RevertToDefaultRelationship,,1.6,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball2,Kill,,1.7,-1")
	relay:Fire("addoutput", "OnTrigger al_citadel_04_rollerattack_02,Start,,1.7,-1")
	relay:Fire("addoutput", "OnTrigger alyx,StartScripting,,1.71,-1")
	relay:Fire("addoutput", "OnTrigger rollermine,SetRelationship,!player D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine,SetRelationship,alyx D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine2,SetRelationship,alyx D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger rollermine2,SetRelationship,!player D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger alyx,SetRelationship,rollermine D_LI 999,1.72,-1")
	relay:Fire("addoutput", "OnTrigger alyx,SetRelationship,rollermine2 D_LI 999,1.72,-1")
	--add_p2hold:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,!player D_LI 999,0.2,-1")
	relay:Fire("addoutput", "OnTrigger relationship_alyx_neutral_ball2,Kill,,1.7,-1")
	relay:Spawn()
	relay:Activate()
	*/
	local add_ptrig = ents.Create("point_trigger")
	add_ptrig:SetKeyValue("spawnflags", "2")
	add_ptrig:SetKeyValue("TriggerOnce", "1")
	add_ptrig:SetKeyValue("StartDisabled", "0")
	add_ptrig:SetKeyValue("targetname", "trigger_rollermine_found")
	add_ptrig:SetKeyValue("filtername", "filter_rollermine")
	add_ptrig:SetKeyValue("TriggerRadius", "80")
	add_ptrig:SetPos(Vector(3803, 11782, 3649))
	add_ptrig:Fire("addoutput", "OnStartTouch counter_hackrollers,Add,2,1.5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch counter_hackrollers_2,Add,2,1.5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch counter_hackrollers_soldiers,Add,2,1.5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch relationship_alyx_neutral_ball1,Kill,,1.5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch relationship_alyx_neutral_ball2,RevertToDefaultRelationship,,1.4,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch relationship_alyx_neutral_ball2,Kill,,1.7,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch al_citadel_04_rollerattack_02,Start,,1.7,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch alyx,StartScripting,,1.71,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,!player D_LI 999,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,alyx D_LI 999,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,SetRelationship,alyx D_LI 999,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,SetRelationship,!player D_LI 999,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,Kill,,8,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,Kill,,7,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,Kill,,5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch goroller,Teleport,,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,Kill,,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine,Kill,,4,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,Kill,,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,Kill,,4,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,Kill,,5,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,Kill,,6,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch rollermine2,Kill,,7,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch alyx,SetRelationship,rollermine D_LI 999,3,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch alyx,SetRelationship,rollermine2 D_LI 999,3,-1")
	--add_p2hold:Fire("addoutput", "OnStartTouch rollermine,SetRelationship,!player D_LI 999,0.2,-1")
	add_ptrig:Fire("addoutput", "OnStartTouch relationship_alyx_neutral_ball2,Kill,,1.7,-1")
	add_ptrig:Spawn()
	add_ptrig:Activate()
	
	for k, v in pairs(ents.FindByName("logic_door_comb_1_open")) do
		
		v:Fire("addoutput", "OnTrigger counter_reinforcementsdead,Add,6,3,-1")
		v:Fire("addoutput", "OnTrigger counter_reinforcementsdead_0,Add,3,3,-1")
		
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_0c,Kill,,4,-1")
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_0b,Kill,,4,-1")
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_0a,Kill,,4,-1")
		
		v:Fire("addoutput", "OnTrigger csoldiers_finalassault_a,Kill,,4,-1")
		v:Fire("addoutput", "OnTrigger csoldiers_finalassault_b,Kill,,4,-1")
		
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_a,Kill,,4,-1")
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_b,Kill,,4,-1")
		v:Fire("addoutput", "OnTrigger csoldiers_reinforcements_c,Kill,,4,-1")
		
	end
	--counter_reinforcementsdead
	--logic_door_comb_1_open
	
	/*
		"OnAlyxFinishedInteraction" "counter_hackrollers,Add,1,0,-1"
		"OnAlyxFinishedInteraction" "counter_hackrollers_2,Add,1,0,-1"
		"OnAlyxFinishedInteraction" "counter_hackrollers_soldiers,Add,1,0,-1"
		"OnPhysGunPickup" "relationship_alyx_neutral_ball2,ApplyRelationship,,0,-1"
		"OnPhysGunDrop" "relationship_alyx_neutral_ball2,RevertToDefaultRelationship,,0,-1"
		"OnAlyxFinishedInteraction" "relationship_alyx_neutral_ball1,Kill,,0,-1"
		"OnAlyxFinishedInteraction" "relationship_alyx_neutral_ball2,RevertToDefaultRelationship,,0,-1"
		"OnAlyxFinishedInteraction" "relationship_alyx_neutral_ball2,Kill,,0.1,-1"
	*/
	
	for k, v in pairs(ents.FindByName("trigger_spawn_roller1")) do
		v:Fire("addoutput", "OnTrigger hl2c_relay,Trigger,,5,-1")
		v:Fire("addoutput", "OnTrigger hl2c_relay2,Trigger,,5,-1")
	end
	/*for k, v in pairs(ents.FindByName("rollermine")) do
		v:Fire("addoutput", "OnPhysGunPickup hl2c_relay,Trigger,,0.5,-1")
	end
	for k, v in pairs(ents.FindByName("rollermine2")) do
		v:Fire("addoutput", "OnPhysGunPickup hl2c_relay2,Trigger,,0.5,-1")
	end*/
	
	
	/*
	local _logic_auto = ents.Create("logic_auto")		//Here we create logic_auto
	_logic_auto:SetPos(Vector( 3500.4, 14078.6, 3635 ))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,EnableAlwaysTransition,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
	--_logic_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.1,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,ForceSpawn,,0.9,-1")
	_logic_auto:Spawn()
	_logic_auto:Activate()
	*/
	
	--end)
	
	local tele_roller = ents.Create("point_c_tp")
	tele_roller:SetKeyValue("targetname", "goroller")
	tele_roller:SetPos(Vector( 3413, 12424, 3616 ))
	tele_roller:Spawn()
	tele_roller:Activate()
	
	local tp_crash = ents.Create("point_hl2cteleport")
	tp_crash:SetKeyValue("targetname", "go_crash")
	tp_crash:SetPos(Vector( 3835, 7984, 3582 ))
	tp_crash:Spawn()
	tp_crash:Activate()
	
	-- trigger_stalkercar_inside
	
	for k, v in pairs(ents.FindByName("relay_crash_1")) do
		v:Fire("addoutput", "OnTrigger go_crash,CTeleport,,3.7,-1")
		v:Fire("addoutput", "OnTrigger go_crash,Kill,,3.9,-1")
	end
end

function MAPSCRIPT:EntityRemoved(ent)
	if ent:GetName() == "go_crash" then
		EP1_TRAIN_CRASH = true
	end
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")	
	if EP1_TRAIN_CRASH then
		
		timer.Simple(2,function()
		pl:ConCommand("+duck")
		pl:ConCommand("+duck")
		pl:Teleport(Vector(3835, 7984, 3582))
		pl:ConCommand("-duck")
		pl:ConCommand("-duck")
		
		end)
		
	end
end


return MAPSCRIPT