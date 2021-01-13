--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
SYN_MAP = true
NEW_DIF = true
NEXT_MAP_TIME = 5

local MAPSCRIPT = {}

local DbgPrint = GetLogging("MapScript")

function MAPSCRIPT:InitPost() 
	
	for k, v in pairs(ents.FindByClass("info_player_start")) do
		v:Remove()
	end
	
	for k, v in pairs(ents.FindByClass("info_player_coop")) do
		v:Remove()
	end
	
	local hl2mp_spawn = ents.Create("info_player_start")
	hl2mp_spawn:SetPos(Vector(1572, 2090, 233))
	hl2mp_spawn:Spawn()
	hl2mp_spawn:Activate()
	--timer.Simple(10, fun)
	--difficulty = 1
	
	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(3840, 13366, 4266))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
	-- Add ending to the map
	--local trigger_strider_end = ents.FindByName("trigger_strider_end")
	--trigger_strider_end[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,15,-1")
	
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
	
	local wmanager = ents.Create("game_weapon_manager")
	wmanager:SetKeyValue("ammomod", "1")
	wmanager:SetKeyValue("maxpieces", "3")
	wmanager:SetKeyValue("weaponname", "weapon_ar2")
	wmanager:Spawn()
	wmanager:Activate()
	
	local ent = ents.FindFirstByName("antspawner")
	ent:SetKeyValue("spawntarget", "!player")
	ent:SetKeyValue("SpawnFrequency", "3.0")
	ent:SetKeyValue("MaxLiveChildren", "4")
	
	for k, v in pairs(ents.FindByName("combine_s_makers")) do
		v:SetKeyValue("MaxLiveChildren", "2")
		v:SetKeyValue("SpawnFrequency", "10.0")
	end
	
	-- print("Working")
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	difficulty = 0.7
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_frag")
	--pl:Give("weapon_rpg")
	pl:Give("weapon_slam")
	-- print("Working?")
	if SYN_MAP_STARTED then
	else
		SYN_MAP_STARTED = true
		timer.Simple(20,function()
		local ent = ents.FindFirstByName("antspawner")
			ent:Fire("Enable")
		end)
	end
end

return MAPSCRIPT