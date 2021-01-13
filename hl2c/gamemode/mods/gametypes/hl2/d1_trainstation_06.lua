INFO_PLAYER_SPAWN = {Vector(-9984, -3668, 420), 90}

NEXT_MAP = "d1_canals_01"

DISABLE_CUSTOM_WEAPON = false

BRUSH_PLAYERCLIP = {

	{Vector(-9950, -3974, 327), Vector(-9873, -3978, 438)}

}

-- VORTEX_POS = Vector(-7835.334473, -2991.997559, 128.031250)
VORTEX_POS = Vector(-4837.968750, -2049.522217, 389.031250)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {

	["scriptCond_seeBarney"] = true,
}

function MAPSCRIPT:InitPost()
	if !game.SinglePlayer() then

	-- Fix stuff
	ents.WaitForEntityByName("zoom_hint",function(ent)
	ent:Fire("addoutput", "spawnflags 1")
	end)
	local aisc_r1 = ents.Create("logic_relay")
	aisc_r1:SetPos(Vector(-9746, -3456, 546))
	aisc_r1:SetKeyValue("targetname", "relay_scriptCond_seeBarney")
	aisc_r1:Fire("addoutput", "OnTrigger timer_heyGordon,Disable,,0.0,-1")
	aisc_r1:Fire("addoutput", "OnTrigger logic_citadel_scanners_1,Trigger,,0.0,-1")
	aisc_r1:Fire("addoutput", "OnTrigger timer_heyGordon,Kill,,0.1,-1")
	aisc_r1:Fire("addoutput", "OnTrigger lcs_crowbar_intro,Resume,,0.5,-1")
	aisc_r1:Fire("addoutput", "OnTrigger citadel,SetAnimation,open,1.7,-1")
	aisc_r1:Fire("addoutput", "OnTrigger lcs_ba_heyGordon,Kill,,3.5,-1")
	aisc_r1:Spawn()
	aisc_r1:Activate()
	
	ents.WaitForEntityByName("lcs_crowbar_intro",function(ent)
	ent:Fire("addoutput", "OnTrigger1 relay_scriptCond_seeBarney,Trigger,,2.0,-1")
	end)
	-- Create a medkit
	local wep = ents.Create("weapon_medkit_hl2c")
	wep:SetPos(Vector(-9723, -3459, 411))
	wep:Spawn()
	wep:Activate()
	
	end
	
	if !game.SinglePlayer() then
		local envG11 = ents.Create("env_global")
		envG11:SetPos(Vector(150, -100, 150))
		envG11:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG11:SetKeyValue("globalstate", "gordon_precriminal")
		envG11:SetKeyValue("spawnflags", "1")
		envG11:SetKeyValue("initialstate", "0")
		envG11:Spawn()
		envG11:Activate()
		envG11:Fire("turnoff", "", "1.0")
		envG11:Fire("kill", "", "5.0")
			
		local envG21 = ents.Create("env_global")
		envG21:SetPos(Vector(-150, 100, -150))
		envG21:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG21:SetKeyValue("globalstate", "gordon_invulnerable")
		envG21:SetKeyValue("spawnflags", "1")
		envG21:SetKeyValue("initialstate", "0")
		envG21:Spawn()
		envG21:Activate()
		envG21:Fire("turnoff", "", "1.0")
		envG21:Fire("kill", "", "5.0")
	end
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	
end

return MAPSCRIPT