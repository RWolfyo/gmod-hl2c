local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

NEXT_MAP = "cd1"
GAME_START = false
CD_MAP = true

RESPAWN_ALLOWED = true


TRIGGER_CHECKPOINT = {

	{Vector(-5850.518555, -1353.646973, -661.429688), Vector(-6232.142578, -1638.238037, -526.206238),false,function() end,Vector(-6031.598633, -1429.877808, -595.014282)}
	
}

TRIGGER_DELAYMAPLOAD = {Vector(-6481.533691, -3177.283203, -700.442200), Vector(-5811.472656, -3471.068848, -336.174866)}
/*
BRUSH_PLAYERCLIP = {

{Vector(-5082, -4164, 17), Vector(-4961, -4271, 126)}

*/


VORTEX_POS = Vector(225.276169, -1019.766663, -391.364166)



function MAPSCRIPT:InitPost()
	for k, v in pairs(ents.FindByClass("point_clientcommand")) do
		-- print(v:GetClass(),"Removed")
		v:Remove()
	end
	for k, v in pairs(ents.FindByClass("npc_combinedropship")) do
		-- print(v:GetClass(),"Found it")
		v:Fire("StopPatrol")
		
	end
	local temp = ents.FindByClass("point_template")
	for k, v in pairs(temp) do
		-- print("--------------------------------------")
		-- print("-------------"..v:GetClass().."-------------")
		-- print("--------------------------------------")
		-- PrintTable(v:GetKeyValues())
		-- print("--------------------------------------")
		v:Remove()
	end
	local remove = ents.FindInSphere(Vector(175, 15, 9),3)
	for k, v in pairs(remove) do
		-- print(v:GetClass(),"Removed")
		v:Remove()
	end
	--local start = ents.Create("logic_auto")
	--start:Fire("addoutput", "OnMapSpawn viewcontrol,Enable,,1,-1")
	--start:Fire("addoutput", "OnMapSpawn startmusic,PlaySound,,1,-1")
	--start:Spawn()
	--start:Activate()
	
	// Add Ending
	local change = ents.Create("game_end")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_game_end")
	change:Spawn()
	change:Activate()
	
	ents.GetMapCreatedEntity(1597):Fire("addoutput","OnClose hl2c_game_end,EndGame,,40,-1")

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--if GAME_START then
	--else
	
	NEXT_MAP_TIME = 10
	timer.Simple(10, function() 
	/*
		for k, v in pairs(ents.FindByName("viewcontrol")) do
			v:Fire("Enable")
			GAME_START = true
		end
		for k, v in pairs(ents.FindByClass("npc_combinedropship")) do
		print(v:GetClass(),"Found it")
		v:Fire("StartPatrol")
		end
		*/
	end)
	pl:Give("weapon_stunstick")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	if pl:GetAmmoCount(3) < 90 then
		pl:SetAmmo(90,3)
	end
	if pl:GetAmmoCount(4) < 90 then
		pl:SetAmmo(90,4)
	end
end

return MAPSCRIPT