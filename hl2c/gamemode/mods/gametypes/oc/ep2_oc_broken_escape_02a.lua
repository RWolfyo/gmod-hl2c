resource.AddWorkshop("784474618")
resource.AddWorkshop("813859375")

RESET_PL_INFO = true
NEXT_MAP = "ep2_oc_broken_escape_02b"

HL2MP_IS_COOP_MAP = true
OC_MAP = true
NEW_DIF = true
NEXT_MAP_TIME = 5

local MAPSCRIPT = {}

local DbgPrint = GetLogging("MapScript")

function MAPSCRIPT:InitPost() 
	-- dropship_strider
	-- start_dropship1
	-- start_dropship2
	-- dropship_apc
	
	
	
	ents.GetMapCreatedEntity(1397):Remove()
	
	util.RunNextFrame(function()
		ents.RemoveByName("dropship_strider")
		ents.RemoveByName("start_dropship1")
		ents.RemoveByName("start_dropship2")
		ents.RemoveByName("dropship_apc")
	end)
	
	/*logic_ballgenerator3_disabled*/
	local ent = ents.FindByPos( Vector( -7395.5, 7938, -120 ) )
	ent[1]:Fire("addoutput", "OnTrigger logic_ballgenerator3_disabled,Trigger,,1.0,-1")
	
	local ent = ents.FindFirstByName( "topside_defense_counter" )
	-- ent:Fire("addoutput", "OnHitMax lift_down_relay,Enable,,25.0,-1")
	-- ent:Fire("addoutput", "OnHitMax lift_down_relay,Trigger,,26.0,-1")
	ent:Fire("addoutput", "OnHitMax hl2c_changelevel,Changelevel,,90.0,-1")
	
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	
	-- Add ending to the map
	--local trigger_strider_end = ents.FindByName("trigger_strider_end")
	--trigger_strider_end[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,15,-1")
	
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_smg1")
	pl:Give("weapon_pistol")
	pl:Give("weapon_shotgun")
	difficulty = 1.2

end

return MAPSCRIPT