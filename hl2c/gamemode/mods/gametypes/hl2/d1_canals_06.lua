ALLOWED_VEHICLE = "Airboat"

NEXT_MAP = "d1_canals_07"

local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
end
-- VORTEX_POS = Vector(167.270447, 3594.290283, 103.969376)
VORTEX_POS = Vector(3735.085449, 6406.223633, 106.447929)
function MAPSCRIPT:InitPost()
	
	
	local mod_crate = ents.FindByName("item_crate_dropped")
	for k, v in pairs(mod_crate) do
		
		v:Fire("addoutput", "OnCacheInteraction relay_achievement_cache_6,Trigger,,0.0,-1")
		
	end
	
	local add_ammo = ents.Create("item_ammo_pistol")
	add_ammo:SetPos(Vector(-668, 4256, -394))
	add_ammo:SetKeyValue("disableshadows", "1")
	add_ammo:Fire("addoutput", "OnCacheInteraction relay_achievement_cache_6,Trigger,,0.0,-1")
	add_ammo:Spawn()
	
	local relay = ents.Create("logic_relay")
	relay:SetPos(Vector(1065, 353, -631))
	relay:SetKeyValue("targetname", "relay_achievement_cache_6")
	relay:SetKeyValue("spawnflags", "1")
	relay:SetKeyValue("StartDisabled", "0")
	relay:Fire("addoutput", "OnTrigger achievement_cache_6,FireEvent,,0.0,-1")
	relay:Spawn()
	relay:Activate()
	
	local achi = ents.Create("logic_achievement")
	achi:SetPos(Vector(1065, 353, -631))
	achi:SetKeyValue("targetname", "achievement_cache_6")
	achi:SetKeyValue("StartDisabled", "0")
	achi:SetKeyValue("AchievementEvent", "ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FLOATINGRAMP")
	achi["AchievementEvent"] = "ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FLOATINGRAMP"
	achi:Spawn()
	
end

function MAPSCRIPT:EntityRemoved(ent)
	--if ent:GetName() == "achievement_cache_6" && ent:GetClass() == "logic_achievement"
end

return MAPSCRIPT