resource.AddWorkshop("784474618")
resource.AddWorkshop("813859375")
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
OC_MAP = true

NEXT_MAP_TIME = 5
MAP_START = MAP_START or false

local MAPSCRIPT = {}

local DbgPrint = GetLogging("MapScript")

function MAPSCRIPT:InitPost() 
	local ent = ents.FindFirstByName("intro_relay")
	ent:Remove()
	-- -7894 10113.5 -788
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
	local ent = ents.FindFirstByName("end_relay")
	ent:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,19,-1")
	
	
	
	local ent = ents.FindByPos( Vector( -3105, -1398, -545.5 ) )
	ent[1]:Fire("addoutput", "OnTrigger canal_antguard_spawner,Enable,,1.0,-1")
	ent[1]:Fire("addoutput", "OnTrigger bull_ctr,Kill,,1.0,-1")
	ent[1]:Fire("addoutput", "OnTrigger bull_template,Kill,,1.0,-1")
	ent[1]:Fire("addoutput", "OnTrigger bull_template,Kill,,1.0,-1")
	ent[1]:Fire("addoutput", "OnTrigger bigmomma,Kill,,2.0,-1")
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
	if MAP_START then
	
	else
		print("Map Started")
		MAP_START = true
		timer.Simple(55, function()
			print("Triggered")
		
		
		
		
			local ent = ents.FindByName_Fire("start-trainride","Enable","",3)
			--ent:Fire("Enable","",3)
			
			local ent = ents.FindByName_Fire("intro_trainbrush","Disable","",3.05)
			--ent:Fire("Disable","",3.05)
			
			local ent = ents.FindByName_Fire("intro_fade","Fade")
			--ent:Fire("Fade")
			
			local ent = ents.FindByName_Fire("intro_trainmodel","Enable","",3.05)
			--ent:Fire("Enable","",3.05)
			
			local ent = ents.FindByName_Fire("intro_cam","Enable","",3.8)
			--ent:Fire("Enable","",3.8)
			
			local ent = ents.FindByName_Fire("intro_spawn1","Disable","",3)
			--ent:Fire("Disable","",3)
			
			local ent = ents.FindByName_Fire("trainride_spawn","Enable","",3)
			--ent:Fire("Enable","",3)
			
			local ent = ents.FindByName_Fire("start-trainride","Disable","",4)
			--ent:Fire("Disable","",4)
			
			local ent = ents.FindByName_Fire("start_train","StartForward","",5)
			--ent:Fire("StartForward","",5)
			
			local ent = ents.FindByName_Fire("scan_temp","Kill","",3)
			--ent:Fire("Kill","",3)
			
			local ent = ents.FindByName_Fire("scan","Kill","",3.1)
			--ent:Fire("Kill","",3.1)
			
			for k, v in pairs( ents.FindByClass("npc_citizen") ) do
				v:Remove()
			end
			
			local ent = ents.FindByName_Fire("intro_sound","PlaySound")
			--ent:Fire("PlaySound")
			
			local ent = ents.FindByName_Fire("intro_music", "PlaySound", "", 4 )
			--ent:Fire("PlaySound", "", 4 )
			
			local ent = ents.FindByName_Fire("intro_cam_timer", "Enable", "", 4 )
			--ent:Fire("Enable", "", 4 )
		end)
	end

end

return MAPSCRIPT

