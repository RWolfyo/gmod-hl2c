NEXT_MAP = "d1_town_01a"

if file.Exists("hl2c_data/hl2c_hl1_easteregg1.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_hl1_easteregg1.txt")
	RESET_PL_INFO = true
end

if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_d1_town_03.txt")
end

TRIGGER_CHECKPOINT = {

	{Vector(517, -440, -3378), Vector(625, -194, -3341)}
	
}

BRUSH_PLAYERCLIP = {

	{Vector(4332, -2876, -3762), Vector(4178, -2945, -3617)}
	
}

-- VORTEX_POS = Vector(915.539612, -203.456268, -3085.968750)
VORTEX_POS = Vector(4971.107910, -2002.237061, -3769.558350)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	local envG4 = ents.Create("env_global")
	envG4:SetPos(Vector(-150, 100, -150))
	envG4:SetKeyValue("targetname", "hl2c_friendly_encounter")
	envG4:SetKeyValue("globalstate", "friendly_encounter")
	envG4:SetKeyValue("initialstate", "2")
	envG4:Spawn()
	envG4:Activate()
	--envG4:Fire("turnoff", "", "1.0")
	envG4:Fire("remove", "", "5.0")
	envG4:Fire("kill", "", "6.0")
	
	for k, v in pairs(ents.FindByName("start_music")) do
		v:SetKeyValue("message", "music/ravenholm_1.mp3")
	end

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
end

return MAPSCRIPT