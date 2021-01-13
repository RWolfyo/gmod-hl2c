local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(233.694321, 309.375977, -12133.935547), 0}

RESET_PL_INFO = true

NEXT_MAP = "gm_flatgrass"

--HL2MP_IS_COOP_MAP = true

ALLOW_TEST = true

// Disable Custom Weapons from Shop
DISABLE_CUSTOM_WEAPON = false

// Disable Custom Weapons from Shop
DISABLE_ABG_WEAPON = false

// Disable Custom Weapons from Shop
DISABLE_CSNIPER_WEAPON = false

// Disable Custom Weapons from Shop
DISABLE_GR9_WEAPON = false

// Disable Custom Weapons from Shop
DISABLE_IONCANNON_WEAPON = false

TRIGGER_DELAYMAPLOAD = {Vector(1730.996948, 941.492615, -16734.476563), Vector(425.652252, 1340.649536, -16517.322266)}

ALLOWED_VEHICLE = "Jalopy"
NEW_VEHICLE_SPAWN = true
TRIGGER_VEHICLESPAWN = {
	{Vector(372.283844, 1016.290771, -12799.968750), Vector(-383.968750, -988.039001, -12565.238281)}
}

MAPSCRIPT.EntityFilterByName = {
	
}
MAPSCRIPT.EntityFilterByClass = {
	
}

MAPSCRIPT.InputFilters = {
	
}

function MAPSCRIPT:EntityRemoved(ent)

end

function MAPSCRIPT:KeyValue(ent, key, value)

end

function MAPSCRIPT:InitPost()
	--timer.Simple(2, function()
	--local add_spawn = ents.Create("info_player_start")
	--add_spawn:SetPos(Vector(-85, 25, -12198))
	--add_spawn:Spawn()
	--add_spawn:Activate()
	--end)
	
	DbgPrint("-- MapScript Loaded --")
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	if IsValid(pl) then else return end
	if pl:Team() == TEAM_ALIVE then
		pl:Give("weapon_physgun")
		pl:Give("weapon_physcannon")
		pl:Give("weapon_crowbar")
		pl:Give("weapon_pistol")
		pl:Give("weapon_smg1")
		pl:Give("weapon_medkit_hl2c")
		pl:Give("weapon_frag")
		pl:Give("weapon_357")
		pl:Give("weapon_shotgun")
		pl:Give("weapon_ar2")
		pl:Give("weapon_rpg")
		pl:Give("weapon_crossbow")
	end
end

return MAPSCRIPT