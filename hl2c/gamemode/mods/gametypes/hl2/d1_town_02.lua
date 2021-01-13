if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
	INFO_PLAYER_SPAWN = {Vector(-3755, -28, -3366), 0}
	NEXT_MAP = "d1_town_02a"
	TRIGGER_CHECKPOINT = {
		{Vector(-5544, 1512, -3254), Vector(-5138, 1723, -2980)}
	}
else
	NEXT_MAP = "d1_town_03"
	TRIGGER_CHECKPOINT = {
		{Vector(-3494, -216, -3584), Vector(-3457, -64, -3477)}
	}
	INFO_PLAYER_SPAWN = {Vector(-752.150818, 701.292847, -3439.968750),0}
end

BRUSH_PLAYERCLIP = {

	{Vector(-587, 913, -3439), Vector(-679, 1037, -3294)},
	{Vector(-3720, -114, -3424), Vector(-3869, -96, -3183)},
	{Vector(-3886, 13, -3441), Vector(-3962, 11, -3346)}
	
}

-- VORTEX_POS = Vector(-2593.914063, 179.432007, -2959.968750)
VORTEX_POS = Vector(-6411.844238, -1117.498779, -2506.991943)
local burner_pos = {
Vector(-1512.234009, 648.581177, -3455.968750),

-- Vector(-1885.063477, 707.786621, -3440.817139),
-- Vector(-1931.948853, 701.710022, -3071.968750)

}
local assa_pos = {
Vector(-1707.223755, 1056.005859, -3391.968750),
-- Vector(-1809.086548, 986.582031, -3391.968750),
-- Vector(-1908.431396, 1008.353638, -3391.968750)


}
local medic_pos = {
Vector(-1521.265381, 603.906067, -3455.968750),


-- Vector(-1598.016479, 609.103333, -3455.968750),

-- Vector(-1551.623413, 517.470154, -3455.968750),

-- Vector(-1359.820923, 909.272705, -3567.968750),
Vector(-1482.260742, 919.411682, -3567.968750)


}

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName =
{
	--["startobjects_template"] = true,
	--["test_name"] = true,
}

function MAPSCRIPT:InitPost()	
	if game.SinglePlayer() then return end

	-- local aisc1 = ents.FindByName("church_monk_conditions")
	-- aisc1[1]:Remove()
	
	-- local aisc_r1 = ents.Create("logic_relay")
	-- aisc_r1:SetPos(Vector(-4604, 1248, -3016))
	-- aisc_r1:SetKeyValue("targetname", "relay_church_monk_conditions")
	-- aisc_r1:Fire("addoutput", "OnTrigger !self,Disable,,0.0,-1")
	-- aisc_r1:Fire("addoutput", "OnTrigger monk_rock_scene_b1,Start,,0.0,-1")
	-- aisc_r1:Fire("addoutput", "OnTrigger bldg4_climbnode_link_east,TurnOn,,5.0,-1")
	-- aisc_r1:Fire("addoutput", "OnTrigger bldg4_climbnode_link_west,TurnOn,,5.0,-1")
	-- aisc_r1:Spawn()
	-- aisc_r1:Activate()
	
	-- local door = ents.FindByName("buildingD_roofhatch")
	-- door[1]:Fire("addoutput", "OnOpen relay_church_monk_conditions,Trigger,,3.0,-1")
	
	
	if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
		-- local ent = ents.Create("logic_relay")
		-- ent:SetKeyValue("targetname","hl2c_fix_monk_lift")
		-- ent:Fire("addoutput","OnTrigger churchtram_up_relay,Trigger,,0.5,-1")
		-- ent:Fire("addoutput","OnTrigger hl2c_fix_monk_lift,Kill,,0.6,-1")
		-- ent:Spawn()
		-- ents.GetMapCreatedEntity(1468):Fire("addoutput","OnTrigger hl2c_fix_monk_lift,Trigger,,90,-1")

	else
		for k, v in pairs(medic_pos) do
		local ent = ents.Create("npc_combine_medic")
		ent:SetPos( v )
		ent:Spawn()
		ent:Activate()
		end
		
		for k, v in pairs(burner_pos) do
		local ent = ents.Create("npc_combine_burner")
		ent:SetPos( v )
		ent:Spawn()
		ent:Activate()
		end
		
		for k, v in pairs(assa_pos) do
		local ent = ents.Create("npc_combine_assassin")
		ent:SetPos( v )
		ent:Spawn()
		ent:Activate()
		end
	end
	
	GAMEMODE:WaitForInput("freight_lift_button_2", "Use", function()
		if IsValid(checkpointTrigger2) then
			checkpointTrigger2:Enable()
		end
		return true -- Suppress.
	end)
	
	-- Reposition path track so players can jump across.
	ents.WaitForEntityByName("churchtrm_path_bottom",function(ent)
		ent:SetPos(Vector(-4530.682129,940.989685,-2902.0))
	end)

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
		pl:Give("weapon_shotgun")
	end
end

return MAPSCRIPT