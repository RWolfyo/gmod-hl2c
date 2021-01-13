INFO_PLAYER_SPAWN = {Vector(-2705.32, 3181.15, 170.03), 180}

NEXT_MAP = "d2_prison_04"	//Add Next Map

--Checkpoints
TRIGGER_CHECKPOINT = {

	{Vector(-2818.647705, 1781.074951, 17.709641), Vector(-3084.096191, 1410.822754, 146.042175)},
	{Vector(-3407.438477, 3384.203857, 18.568230), Vector(-3241.188965, 3596.434082, 148.367859)}
}

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["playerclip_shower_dropdown"] = true,
}

function MAPSCRIPT:InitPost()
	local remove_clip1 = ents.FindByName("playerclip_shower_dropdown")
	remove_clip1[1]:Remove()
	
	--local guard_god ents.FindByClass("npc_antlionguard")
end

ANTLION_FARM = false

-- VORTEX_POS = Vector(-2559.823242, 3263.631592, 349.101318)

HL2C_PET_LIKE_ANTLION = true

function MAPSCRIPT:PostPlayerSpawn(pl)
	
	--Give items
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
	pl:Give("weapon_crossbow")
	pl:Give("weapon_bugbait")
	
end

return MAPSCRIPT