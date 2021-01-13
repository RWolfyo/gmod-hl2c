INFO_PLAYER_SPAWN = {Vector(3327.89, 1424.47, 1600.03), -90}

NEXT_MAP = "d2_coast_07"

TRIGGER_CHECKPOINT = {
	{Vector(3006, -6962, 1920), Vector(3039, -6928, 1996)}
}

local MAPSCRIPT = {}

hook.Add("PlayerUse", "hl2cPlayerUse", function(pl, ent)
	if ent:GetClass() == "func_door" then
		file.Write("hl2c_data/hl2c_d2_coast_08.txt", "We have been to d2_coast_08 & pushed the button!")
	local bridge_door = ents.FindByName("hl2c_bridge_door")
	--bridge_door[1]:Fire("Open")
	bridge_door[1]:Fire("Unlock")
	bridge_door[1]:Fire("Open")
	bridge_door[1]:Fire("Open")
	bridge_door[1]:Fire("Open")
	end
end)

-- VORTEX_POS = Vector(2991.968750, -5657.429688, 1600.031250)
VORTEX_POS = Vector(5947.459961, 2628.636230, 2121.106934)
function MAPSCRIPT:InitPost()

	local bridge_door = ents.Create("prop_door_rotating")
	bridge_door:SetPos(Vector(3305, 1542, 1590))
	bridge_door:SetKeyValue("opendir", "0")
	bridge_door:SetKeyValue("ajarangles", "0 0 0")
	bridge_door:SetKeyValue("forceclosed", "0")
	bridge_door:SetKeyValue("angles", "0 270 0")
	bridge_door:SetKeyValue("axis", "3305 1541.18 1644.28, 3305 1541.18 1536.28")
	bridge_door:SetKeyValue("health", "0")
	bridge_door:SetKeyValue("disableshadows", "1")
	bridge_door:SetKeyValue("distance", "90")
	bridge_door:SetKeyValue("dmg", "0")
	bridge_door:SetKeyValue("spawnpos", "0")
	bridge_door:SetKeyValue("hardware", "1")
	bridge_door:SetKeyValue("model", "models/props_c17/door01_left.mdl")
	bridge_door:SetKeyValue("modelscale", "1.0")
	bridge_door:SetKeyValue("targetname", "hl2c_bridge_door")
	bridge_door:SetKeyValue("returndelay", "3")
	bridge_door:SetKeyValue("speed", "100")
	bridge_door:SetKeyValue("skin", "5")
	bridge_door:SetKeyValue("spawnflags", "2048")
	bridge_door:Spawn()
	bridge_door:Activate()
	
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
end

return MAPSCRIPT