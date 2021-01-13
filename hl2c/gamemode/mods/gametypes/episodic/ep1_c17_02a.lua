local MAPSCRIPT = {}

NEXT_MAP = "ep1_c17_05" --Causing bugs -.-
--NEXT_MAP = "ep1_c17_06"

TRIGGER_CHECKPOINT = {
/*
setpos 2211.287109, 7715.274414, -2338.936279

setpos 2338.125488, 7944.064941, -2239.168945

*/
	{Vector(2211.287109, 7715.274414, -2338.936279), Vector(2338.125488, 7944.064941, -2239.168945)},
	{Vector(335, 8853, -2824), Vector(398, 8961, -2808)},
	{Vector(-689, 9913, -2792), Vector(-240, 9439, -2783)}
}
/*
setpos 1168.561157, 8722.027344, -2549.375000;setang 29.426859 8.165373 0.000000

setpos 979.985962, 8733.601563, -2427.739014;setang -10.014718 179.630859 0.000000


*/
--TRIGGER_DELAYMAPLOAD = {Vector(1168.561157, 8722.027344, -2549.375000), Vector(979.985962, 8733.601563, -2427.739014)}


-- VORTEX_POS = Vector(2915, 6812, -2441)


function MAPSCRIPT:InitPost()

--5431.184082 6550.290527 -2483.968750
	
	ents.WaitForEntityByName("alyx",function(ent)
		ent:Fire("SetDamageFilter","filter_NoDamage",1.5)
	end)
	
	aft = ents.Create("ai_goal_follow")
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
	
	local _logic_auto = ents.Create( "logic_auto" )
	_logic_auto:SetPos(Vector(776, 2592, 333.524))
	_logic_auto:SetKeyValue( "spawnflags", "1" )
	_logic_auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.1,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn door_startmap,Kill,,0,-1")
	_logic_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,ForceSpawn,,0.5,-1")
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
	
	//Remove Combine Shield annoying
	local shieldoff = ents.FindByName("trigger_teleport")
	for _, shoff in pairs(shieldoff) do
	shoff:Fire("addoutput", "OnTrigger relay_combineshieldwall2_off1,Trigger,,1,-1")
	end
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	
	for k, v in pairs(ents.FindByName("hl2c_timer_follow")) do
	
	v:Fire("Deactivate", "", "0.0")
	v:Fire("Activate", "", "1.0")
	end
	
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_frag")
	pl:Give("weapon_rpg")
end

return MAPSCRIPT