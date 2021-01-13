resource.AddWorkshop("784474618")
resource.AddWorkshop("813859375")
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
OC_MAP = true
NEW_DIF = true
NEXT_MAP_TIME = 5

local MAPSCRIPT = {}

local DbgPrint = GetLogging("MapScript")

function MAPSCRIPT:InitPost() 

	-- local change = ents.Create("point_changelevel")
	-- change:SetPos(Vector(3840, 13366, 4266))
	-- change:SetKeyValue("targetname", "hl2c_changelevel")
	-- change:Spawn()
	-- change:Activate()
	local change = ents.Create("game_end")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_game_end")
	change:Spawn()
	change:Activate()
	
	

	-- Add ending to the map
	--local trigger_strider_end = ents.FindByName("trigger_strider_end")
	--trigger_strider_end[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,15,-1")
	
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
	
	ents.GetMapCreatedEntity(2177):Fire("addoutput","OnTrigger hl2c_game_end,EndGame,,20,-1")

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_smg1")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_frag")
	difficulty = 1.5

end

return MAPSCRIPT