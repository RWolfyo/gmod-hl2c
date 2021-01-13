local MAPSCRIPT = {}

NEXT_MAP = "ep1_c17_02b" --Fixed :D
--NEXT_MAP = "ep1_c17_06"


TRIGGER_CHECKPOINT = {
/*
setpos 694.503967, 190.992325, 109.653183;setang -21.181578 -76.276321 0.000000
] getpos 
setpos 509.613892, 316.600891, 43.902344;setang 25.016205 163.025040 0.000000

*/
	{Vector(694.503967, 190.992325, 109.653183), Vector(509.613892, 316.600891, 43.902344)}

}
/*
setpos -2502.806641, 2308.049805, -108.038681;setang 53.776192 35.847977 0.000000
] getpos 
setpos -2624.416016, 2477.177246, 5.559784;setang -56.879410 131.986877 0.000000

*/
TRIGGER_DELAYMAPLOAD = {Vector(-2502.806641, 2308.049805, -108.038681), Vector(-2624.416016, 2477.177246, 5.559784)}

DISABLE_CUSTOM_WEAPON = false

-- VORTEX_POS = Vector(-287.659393, -553.176331, 448.031250)

function MAPSCRIPT:InitPost()
/*	--Old Code
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetPos(Vector(1787.566528, -191.650116, 58.562782))
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
*/	--
	local map_spawn = ents.Create("logic_auto")
	map_spawn:SetPos(Vector(4685.63, -5671, -60.447) )
	map_spawn:SetKeyValue( "spawnflags", "1" )
	map_spawn:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1.2,-1")
	--map_spawn:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,ForceSpawn,,0.8,-1")
	--map_spawn:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,ForceSpawn,,0.8,-1")
	--map_spawn:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,ForceSpawn,,0.8,-1")
	--map_spawn:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,ForceSpawn,,0.8,-1")
	map_spawn:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.8,-1")
	map_spawn:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.7,-1")
	map_spawn:Fire("addoutput", "OnMapSpawn previous_level_items,Kill,,0.1,-1")
	map_spawn:Spawn()
	map_spawn:Activate()

	
	local aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	local timer2 = ents.Create( "logic_timer" )
	timer2:SetPos(Vector(1066, 353, -631))
	timer2:SetKeyValue( "RefireTime", "5" )
	timer2:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer2:SetKeyValue( "StartDisabled", "0" )
	timer2:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer2:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer2:Spawn()
	
	local killer_time = ents.FindByName("timer_give_guard_health")
	killer_time[1]:Remove()
	--local timer_killer = ents.FindByName("alyx_teleport_trigger")
	--timer_killer[1]:SetKeyValue("addoutput", "OnStartTouch timer_give_guard_health,Disable,,0,-1")
	--timer_killer[1]:SetKeyValue("addoutput", "OnStartTouch timer_give_guard_health,Deactivate,,0,-1")
	--timer_killer[1]:SetKeyValue("addoutput", "OnStartTouch timer_give_guard_health,Kill,,0,-1")
	--timer_killer[1]:SetKeyValue("addoutput", "OnEndTouch timer_give_guard_health,Disable,,0,-1")
	--timer_killer[1]:SetKeyValue("addoutput", "OnEndTouch timer_give_guard_health,Deactivate,,0,-1")
	--timer_killer[1]:SetKeyValue("addoutput", "OnEndTouch timer_give_guard_health,Kill,,0,-1")

	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn previous_level_items,Kill,,0.1,-1")
	_logic_auto:Spawn()
	_logic_auto:Activate()
	
	
	timer.Simple(5, function()
	local alyxdie = ents.FindByClass("npc_alyx")
	for _, adie in pairs(alyxdie) do
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
	end
	end)
	
	
	ents.WaitForEntityByName("alyx",function(ent)
		ent:Fire("SetDamageFilter","filter_NoDamage",1.5)
	end)
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	
	local aft = ents.FindByName("hl2c_timer_follow")
	aft[1]:Fire("Deactivate", "", "0.0")
	aft[1]:Fire("Activate", "", "1.0")
	
	--pl:Give("weapon_ioncannon_hl2c")
	--pl:Give("weapon_gr9_hl2c")
	--pl:Give("weapon_airboatgun_hl2c")
	
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_smg1")
end


return MAPSCRIPT