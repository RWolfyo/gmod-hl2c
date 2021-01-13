local MAPSCRIPT = {}

NEXT_MAP = "ep1_c17_01"

TRIGGER_DELAYMAPLOAD = {Vector(4528, 3636, 1952), Vector(4645, 3528, 2031)}

TRIGGER_CHECKPOINT = {

--Players stuck here but now they shouldnt be.
	{Vector(712.550781, 4293.209473, 648.539734), Vector(952.403076, 4338.245605, 683.380798)},
	
	{Vector(4266.314941, 3762.497070, 476.510406), Vector(4394.375977, 3529.595215, 441.652954)}
	--{Vector(2710, 4099, 417), Vector(2800, 4002, 528)}
}

TRIGGER_DELAYMAPLOAD = {Vector(4528, 3636, 1952), Vector(4645, 3528, 2031)}

-- VORTEX_POS = Vector(4135, 3048, 465)


function MAPSCRIPT:InitPost()
	
	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	local timer1 = ents.Create( "logic_timer" )
	timer1:SetPos(Vector(1066, 353, -631))
	timer1:SetKeyValue( "RefireTime", "5" )
	timer1:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer1:SetKeyValue( "StartDisabled", "0" )
	timer1:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer1:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer1:Spawn()
	
	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn tonemap_controller,SetTonemapRate,.25,0,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn tonemap_controller,SetAutoExposureMin,.5,0,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn tonemap_controller,SetAutoExposureMax,4,0,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn weapons,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn physcannon,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1.5,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,Kill,,0.8,-1")
	
	ents.WaitForEntityByName("alyx",function(ent)
		ent:Fire("SetDamageFilter","filter_NoDamage",1.5)
	end)
	/*
	setpos 4636.233887 3564.073975 507.812500;setang 7.685909 6.097934 0.013572
] getpos 
setpos 4577.370605 3591.854248 507.828857;setang 13.877594 168.232422 0.000000
*/

	local pl_inelv = ents.FindByName("counter_elevator")
	for _, inelv in pairs(pl_inelv) do
	inelv:SetKeyValue("max","1")
	inelv:Fire("addoutput", "OnHitMax hl2c_alyx_tp,Teleport,,0.2,-1")
	inelv:Fire("addoutput", "OnHitMax hl2c_pl_tp,Teleport,,0.2,-1")
	end
	local alyx_tp = ents.Create("point_alyx_teleport")
	alyx_tp:SetKeyValue("targetname", "hl2c_alyx_tp")
	alyx_tp:SetPos(Vector(4577.370605, 3591.854248, 485))
	alyx_tp:Spawn()
	
	local pl_tp = ents.Create("point_hl2cteleport")
	pl_tp:SetKeyValue("targetname", "hl2c_pl_tp")
	pl_tp:SetPos(Vector(4577.370605, 3591.854248, 485))
	pl_tp:Spawn()
	
	timer.Simple(5, function()
	local alyxdie = ents.FindByClass("npc_alyx")
	for _, adie in pairs(alyxdie) do
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
	end
	end)
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)

	local aft = ents.FindByName("hl2c_timer_follow")
	aft[1]:Fire("Deactivate", "", "0.0")
	aft[1]:Fire("Activate", "", "1.0")
	
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
end


return MAPSCRIPT