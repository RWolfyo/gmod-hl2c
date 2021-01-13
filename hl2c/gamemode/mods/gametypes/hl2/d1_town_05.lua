
NEXT_MAP = "d2_coast_01"

TRIGGER_CHECKPOINT = {
	{Vector(-1167, 10321, 905), Vector(-1057, 10610, 1008)}
}

TRIGGER_DELAYMAPLOAD = {Vector(-1248, 10160, 924), Vector(-1056 , 10334, 986)}

BRUSH_PLAYERCLIP = {

{Vector(-10495, 4491, 906), Vector(-10459, 4054, 1067)}

}

local shield_pos = {
-- Vector(-12052.208984, 3645.036865, 896.031250),
Vector(-12067.265625, 5072.704102, 896.031250),
-- Vector(-2267.561523, 7503.403809, 896.031250),
-- Vector(-2221.447266, 7209.207031, 896.031250),
Vector(-2328.699707, 7114.051270, 896.031250),
-- Vector(-2578.268311, 7150.775879, 896.031250),
-- Vector(-2423.671631, 8098.004883, 944.950073),
Vector(-1470.576782, 7726.491211, 950.897644)

}
local arrest_pos = {
-- Vector(-12020.909180, 5158.728027, 896.031250),
-- Vector(-12025.731445, 3800.612061, 896.031250)


}

local medic_pos = {
-- Vector(-5024.133301, 8291.039063, 896.027527),
Vector(-5225.054688, 8306.808594, 896.039368),
-- Vector(-4307.437988, 7826.139160, 970.617920),
Vector(-2267.561523, 7503.403809, 896.031250),
-- Vector(-2221.447266, 7209.207031, 896.031250),
-- Vector(-2129.464355, 8280.669922, 906.075134),
-- Vector(-1971.430298, 8491.376953, 958.017151),
-- Vector(-1509.445923, 8598.177734, 935.769043)


}
local veteran_pos = {
Vector(-5386.802246, 8302.580078, 896.039368),
-- Vector(-3864.183350, 7718.258301, 906.031250),
-- Vector(-2374.841309, 7581.054199, 896.031250),
-- Vector(-2655.930908, 7259.545410, 896.031250),
-- Vector(-1304.016235, 8137.917969, 904.239197),
-- Vector(-1277.143311, 7556.560059, 896.031250)

}

/*






*/


-- VORTEX_POS = Vector(-1576.393555, 9652.452148, 1256.031250)
VORTEX_POS = Vector(-11111.968750, 7040.163086, 1315.031250)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["aisc_leaonwait1"] = true,
	["aisc_leon_waits"] = true,
	["trigger_close_door"] = true,
	["aisc_attentiontoradio"] = true,
}
MAPSCRIPT.EntityFilterByClass = {
	["trigger_changelevel"] = true,
}

function MAPSCRIPT:InitPost()	
	if !game.SinglePlayer() then

		local close_door = ents.FindByName("trigger_close_door")
		close_door[1]:Remove()

		local tr_change = ents.FindByName("trigger_changelevel")
		tr_change[1]:Remove()
		
		-- Fix script conditions being a problem.
		local aisc1 = ents.FindByName("aisc_leon_waits")
		aisc1[1]:Remove()
		
		local aisc2 = ents.FindByName("aisc_leaonwait1")
		aisc2[1]:Remove()
		
		local aisc3 = ents.FindByName("aisc_attentiontoradio")
		aisc3[1]:Remove()
		
		local aisc_r1 = ents.Create("logic_relay")
		aisc_r1:SetPos(Vector(-1430, 9885, 905))
		aisc_r1:SetKeyValue("targetname", "relay_aisc_leon_waits")
		aisc_r1:Fire("addoutput", "OnTrigger warehouse_leonleads_lcs,Start,,0.0,-1")
		aisc_r1:Spawn()
		aisc_r1:Activate()
		
		local aisc_r2 = ents.Create("logic_relay")
		aisc_r2:SetPos(Vector(-1430, 9885, 905))
		aisc_r2:SetKeyValue("targetname", "relay_aisc_leaonwait1")
		aisc_r2:Fire("addoutput", "OnTrigger warehouse_leonleads_lcs,Resume,,0.0,-1")
		aisc_r2:Fire("addoutput", "OnTrigger radio_nag,Disable,,0.0,-1")
		aisc_r2:Spawn()
		aisc_r2:Activate()
		
		local aisc_r3 = ents.Create("logic_relay")
		aisc_r3:SetPos(Vector(-1430, 9885, 905))
		aisc_r3:SetKeyValue("targetname", "relay_aisc_attentiontoradio")
		aisc_r3:Fire("addoutput", "OnTrigger alyx_camera,SetOn,,0.0,-1")
		aisc_r3:Fire("addoutput", "OnTrigger lcs_leon_nag,Kill,,0.0,-1")
		aisc_r3:Fire("addoutput", "OnTrigger radio_nag,Kill,,0.0,-1")
		aisc_r3:Fire("addoutput", "OnTrigger lcs_leon_radios3,Start,,0.0,-1")
		aisc_r3:Spawn()
		aisc_r3:Activate()
		
		local lsc1 = ents.FindByName("warehouse_aftermath_lcs")
		lsc1[1]:Fire("addoutput", "OnCompletion relay_aisc_leon_waits,Trigger,,3.0,-1")
		
		local lsc2 = ents.FindByName("warehouse_leonleads_lcs")
		lsc2[1]:Fire("addoutput", "OnTrigger2 relay_aisc_leaonwait1,Trigger,,3.0,-1")
		lsc2[1]:Fire("addoutput", "OnCompletion relay_aisc_attentiontoradio,Trigger,,3.0,-1")
		
	end

	if GetConVarNumber("hl2c_additions") >= 1 then
		local map_model = ents.FindByModel("maps/"..game.GetMap()..".bsp")
		local prec = ents.Create("func_precipitation")
		prec:SetKeyValue("model", map_model[1]:GetModel())
		prec:SetKeyValue("preciptype", "0")
		prec:SetKeyValue("renderamt", "50")
		prec:SetKeyValue("rendercolor", "200 200 200")
		prec:Spawn()
		prec:Activate()
	end
	
	for k, v in pairs(ents.FindByName("start_music")) do
		v:SetKeyValue("message", "music/hl2_song1.mp3")
	end
	for k, v in pairs(medic_pos) do
	local ent = ents.Create("npc_combine_medic")
	ent:SetPos( v )
	ent:Spawn()
	ent:Activate()
	end
	/*
	for k, v in pairs(commander_pos) do
	local ent = ents.Create("npc_combine_command")
	ent:SetPos( v )
	ent:Spawn()
	ent:Activate()
	end
	*/
	for k, v in pairs(veteran_pos) do
	local ent = ents.Create("npc_combine_veteran")
	ent:SetPos( v )
	ent:Spawn()
	ent:Activate()
	end	
	
	for k, v in pairs(shield_pos) do
	local ent = ents.Create("npc_combine_shield")
	ent:SetPos( v )
	ent:Spawn()
	ent:Activate()
	end	
	
	for k, v in pairs(arrest_pos) do
	local ent = ents.Create("npc_metro_arrest")
	ent:SetPos( v )
	ent:Spawn()
	ent:Activate()
	end
	
	
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--timer.Simple(9, function()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT