local MAPSCRIPT = {}

NEXT_MAP = "ep1_c17_02"

--RESPAWN_ALLOWED = true

/*
setpos 4867.188965, -413.396301, -259.973907;setang -19.081675 -154.710037 0.000000
] getpos 
setpos 5001.394043, -307.775482, -313.061890;setang 26.568285 53.001659 0.000000
*/
BRUSH_PLAYERCLIP = {
	{Vector(4867.188965, -413.396301, -259.973907), Vector(5001.394043, -307.775482, -313.061890)}
}


TRIGGER_CHECKPOINT = {
	{Vector(2773, -1314, 9), Vector(2725, -1258, 112)},
	{Vector(1629, 1812, 9), Vector(1486, 1860, 103)},

	{Vector(17.371914, 703.064331, 17.551277), Vector(-247.741913, 302.295898, 167.834900)},

	{Vector(-3122.753174, 498.775299, 23.077515), Vector(-3297.984375, 332.811646, 158.517487)}
}

VORTEX_POS = Vector(1143, 2346, 166)


function MAPSCRIPT:PostPlayerSpawn(pl)
	local aft = ents.FindByName("goalfollow_alyx")
	aft[1]:Fire("deactivate", "", "0.0")
	aft[1]:Fire("addoutput", "goal player")
	aft[1]:Fire("activate", "", "1.0")

	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_357")

end


function MAPSCRIPT:InitPost()
	aft = ents.FindByName("goalfollow_alyx")
	aft[1]:Fire("addoutput", "goal player")
	
	local sa = ents.Create("ai_relationship")
	sa:SetPos(Vector(530, 312, 270))
	sa:SetKeyValue("targetname", "relationship_alyxSniper_hl2c")
	sa:SetKeyValue("rank", "999")
	sa:SetKeyValue("Reciprocal", "1")
	sa:SetKeyValue("StartActive", "1")
	sa:SetKeyValue("subject", "sniper_alyx")
	sa:SetKeyValue("target", "player")
	sa:Spawn()
	
	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn suit,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn physgun,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn shotgun,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn pistol,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,AddContext,al_hint_c17_CrankPuzzle:1,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn items_transition,Kill,,0.8,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn physbox_crank_beans,Kill,,0.4,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn ptemplate_newgame,ForceSpawn,,0.5,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.1,-1")
	_logic_auto:Spawn()
	_logic_auto:Activate()
	
	local map_spawn = ents.Create("logic_auto")
	map_spawn:SetPos(Vector(4685.63, -5671, -60.447) )
	map_spawn:SetKeyValue( "spawnflags", "1" )
	map_spawn:Fire("addoutput", "OnMapSpawn alyx,SetDamageFilter,filter_NoDamage,1.2,-1")
	map_spawn:Spawn()
	map_spawn:Activate()
	
	local timer2 = ents.Create( "logic_timer" )
	timer2:SetPos(Vector(536, 313, 275))
	timer2:SetKeyValue( "RefireTime", "0.1" )
	timer2:SetKeyValue( "targetname", "hl2c_timer_relationship" )
	timer2:SetKeyValue( "StartDisabled", "1" )
	timer2:Fire("addoutput", "OnTimer relationship_alyxSniper_hl2c,ApplyRelationship,,0.0,-1", "1")
	timer2:Spawn()
	
	local alyxisnowsniper = ents.FindByName("relay_alyx_shoot_ladder")
	alyxisnowsniper[1]:Fire("addoutput", "OnTrigger hl2c_timer_relationship,Enable,,0.0,-1", "1")
	
	local template = ents.FindByName("ptemplate_AlyxSniper")
	template[1]:Fire("addoutput", "OnEntitySpawned sniper_alyx,ProtectTarget,player,0.0,-1", "1")
	
	local asc1 = ents.FindByName("aisc_AlyxWaitsForPlayerToLook")
	asc1[1]:Remove()
	
	local asc2 = ents.FindByName("aisc_AlyxWaitsForPlayerToLook")
	asc2[1]:Remove()
	
	local ap = ents.FindByName("assaultpoint_alyxWaits")
	ap[1]:Fire("addoutput", "OnAssaultClear lcs_sniper_headoff,Start,,1.0,-1", "1")
	
	local fakeaisc = ents.FindByName("lcs_sniper_headoff")
	fakeaisc[1]:Fire("addoutput", "OnTrigger1 lcs_sniper_headoff,Resume,,1.0,-1", "1")
	
	timer.Simple(5, function()
	local alyxdie = ents.FindByClass("npc_alyx")
	for _, adie in pairs(alyxdie) do
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
		adie:Fire("addoutput", "OnDeath hl2c_fail,fail,,2,-1")
	end
	end)
	--relay_combineshieldwall2_off
	local wall2_off = ents.FindByName("rallypoint_alyxRunsToGate_02")
	for _, wall2 in pairs(wall2_off) do
		wall2:Fire("addoutput", "OnArrival relay_combineshieldwall2_off,Trigger,,10,-1")
		--wall2:Fire("addoutput", "OnArrival rallypoint_alyxOnGate,Trigger,,10,-1")
		--wall2:Fire("addoutput", "OnAssaultClear assaultpoint_alyxOnGate,Trigger,,10,-1")
	end
	local wall20_off = ents.FindByName("rallypoint_alyxOnGate")
	for _, wall20 in pairs(wall20_off) do
		wall20:Fire("addoutput", "OnArrival relay_combineshieldwall2_off,Trigger,,10,-1")

	end
	local wall200_off = ents.FindByName("assaultpoint_alyxOnGate")
	for _, wall200 in pairs(wall200_off) do
		wall200:Fire("addoutput", "OnAssaultClear relay_combineshieldwall2_off,Trigger,,10,-1")

	end
	
	local ladder_off = ents.FindByName("aisc_AlyxWaitsForPlayerToGetClose")
	for _, ladoff in pairs(ladder_off) do
		ladoff:Fire("addoutput", "OnConditionsSatisfied relay_alyx_shoot_ladder2,Trigger,,10,-1")
		--ladoff:Fire("addoutput", "OnConditionsSatisfied relay_alyx_shoot_ladder2,Trigger,,10,-1")
		--ladoff:Fire("addoutput", "OnConditionsSatisfied relay_alyx_shoot_ladder2,Trigger,,10,-1")
	end
	
	ents.WaitForEntityByName("alyx",function(ent)
		ent:Fire("SetDamageFilter","filter_NoDamage",1.5)
	end)
	
end


return MAPSCRIPT