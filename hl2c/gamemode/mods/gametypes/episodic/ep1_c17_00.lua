local MAPSCRIPT = {}

--INFO_PLAYER_SPAWN = {Vector( 4686, -5773, -104 ), 0}
INFO_PLAYER_SPAWN = {Vector( 5024, -5952, -53 ), 0}

NEXT_MAP = "ep1_c17_00a"

TRIGGER_CHECKPOINT = {

	{Vector( 4431, -319, -85 ), Vector( 4170, -255, -50 )}
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
TRIGGER_DELAYMAPLOAD = {Vector( 1901, 94, 238 ), Vector( 1774, 141, 330 )}


-- VORTEX_POS = Vector(4652, -3196, -2258)

function MAPSCRIPT:InitPost()
	--timer.Simple( 2, function()
	--local remove_suit = ents.FindByName("suit")
	--remove_suit[1]:Remove()
	--local remove_gravgun = ents.FindByName("physcannon")
	--remove_gravgun[1]:Remove()

	local map_spawn = ents.Create("logic_auto")
	map_spawn:SetPos(Vector(4685.63, -5671, -60.447) )
	map_spawn:SetKeyValue( "spawnflags", "1" )
	map_spawn:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1.2,-1")
	map_spawn:Spawn()
	map_spawn:Activate()
	
	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	local timers = ents.Create( "logic_timer" )
	timers:SetPos(Vector(1066, 353, -631))
	timers:SetKeyValue( "RefireTime", "5" )
	timers:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timers:SetKeyValue( "StartDisabled", "0" )
	timers:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timers:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timers:Spawn()
	--local clip = ents.FindByName("brush_combine_train_door")
	--clip[1]:Remove()
	--end)
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

	pl:Give("weapon_physcannon")

end

return MAPSCRIPT