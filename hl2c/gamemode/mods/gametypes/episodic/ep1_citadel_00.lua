local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-9003, 5784, -140), 45}

NEXT_MAP = "ep1_citadel_01"

--NEXT_MAP_TIME = 5

RESET_PL_INFO = true

TRIGGER_CHECKPOINT = {
	{Vector(-7999, 5480, 32), Vector(-7837, 5520, 153),false,function() end,Vector(-7959.842285, 5467.341309, -95.895920)},
	{Vector(-6729, 5492, -100), Vector(-6645, 5844, 66)}
	--{Vector(4558, 4183, -6343), Vector(4713, 3992, -6239)}
}

TRIGGER_DELAYMAPLOAD = {Vector(5385, 2499, -6225), Vector(5568, 2368, -6336)}

GAME_STARTED = false

TARGET_TELEPORT_HL2C = "Dog"


-- VORTEX_POS = Vector(-6878, 6196, 331)
EP1_LAST_CP = Vector( 4578, 4080, -6290 )

EP1_LUA_RUN_ONE = [[
print("WORKING LUA SCRIPT ON GETOUTCAR")
GAMEMODE:HL2CForceRespawn()
Hl2c.EP1_Getout_Fromthecar()
]]

EP1_LUA_RUN_ELI = [[
EP1_CITADEL_00_ELI_TALK = true
]]

MAPSCRIPT.InputFilters = {
	["pclip_gunship_2"] = {"Enable"}
}

function EP1_Start_Enabled()
	for k, v in pairs(ents.FindByName("ep1_pc_start")) do
		if IsValid(v) then v:Remove() end
		
		
	end
end
/*

VORTEX_POS = Vector(-8579.158203, 6023.355469, -166.457214)
VORTEX_POS = Vector(-9085.574219, 5670.561035, -269.683350)



VORTEX_POS = Vector(-7968.908203, 5849.047852, 32.031250)

*/

hook.Add("Think","ep1.Think",function()
	if EP1_CITADEL_00_ELI_TALK == true then
		for _, ent in pairs(ents.FindInBox(Vector(-8579.158203, 6023.355469, -166.457214),Vector(-9085.574219, 5670.561035, -269.683350))) do
			if IsValid(ent) and ent:GetClass() == "npc_alyx" then
				ent:SetPos(Vector(-7968.908203, 5849.047852, 32.031250))
			end
		end
	end

end)

function Hl2c.EP1_Getout_Fromthecar()
	EP1_OUTCAR_START = true
	timer.Simple(3,function()
		for k, v in pairs(ents.FindByName("hl2c_timer_parent")) do
			if IsValid(v) then
				v:Fire("Deactivate")
				v:Fire("Disable")
				v:Remove()
				-- print("Parent Timer Disabled")
			end
		end
		
		for k, v in pairs(player.GetAll()) do
			
			if IsValid(v) then
				-- print("Parents cleared!")
				v:ExitVehicle()
				v:ExitVehicle()
				v:ExitVehicle()
				v:ExitVehicle()
				v:SetPos(EP1_LAST_CP)
				v:SetPos(EP1_LAST_CP)
				v:Teleport(EP1_LAST_CP)
				-- v:SetPos(EP1_LAST_CP)
				v:ClearParent()
			end
			
		end
	end)
end


function MAPSCRIPT:InitPost()
	if game.SinglePlayer() then
		return
	end
	-- local model = "*1"
	ents.WaitForEntityByName("pclip_gravgun", function(ent)
		-- print(ent:GetModel())
		-- model = ent:GetModel()
	end)
	-- local pos, min, max = Vector(-8614.724609, 5826.176758, -127.687737), Vector(-8707.353516, 5899.716797, -188.261887), Vector(-8720.151367, 5672.031250, -132.949188)

	-- local cage_playerclip = ents.Create("func_brush")
	-- cage_playerclip:SetPos( Vector(-8613.044922, 5924.223633, -75.968750) )
	-- cage_playerclip:SetModel(model)
	-- cage_playerclip:SetKeyValue("spawnflags", "2")
	-- cage_playerclip:Spawn()
	-- cage_playerclip:Activate()
	-- cage_playerclip:Fire("Enable")
	-- cage_playerclip:SetNoDraw(false)
	
	-- for k,v in pairs(ents.FindByClass("point_viewcontrol")) do
		-- v:SetKeyValue("spawnflags", "128")
	-- end
	/*
	local pc = ents.Create("brush_playerclip")
	pc:SetKeyValue("targetname", "ep1_pc_start")
	pc.min = Vector(-8881.225586, 5613.084473, -217.184814)
	pc.max = Vector(-8720.706055, 6043.892090, 33.534847)
	pc.pos = pc.max - ((pc.max - pc.min) / 2)
	pc:SetPos(pc.pos)
	pc:Spawn()
	*/
	/*
	local viewcontrol = ents.FindByClass("point_viewcontrol")
	viewcontrol[1]:Remove()
	viewcontrol[2]:Remove()
	viewcontrol[3]:Remove()
	viewcontrol[4]:Remove()
	viewcontrol[5]:Remove()
	*/
	--local speaker = ents.FindByName("speaker_TakeGravGun1Nag")
	--speaker[1]:Remove()
	
	--local gravgun = ents.Create("weapon_physcannon")
	--gravgun:SetPos(Vector(-8977, 5784, -127))
	--gravgun:Spawn()
	--gravgun:Activate()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_getoutcar")
	lua:SetKeyValue("Code", EP1_LUA_RUN_ONE)
	lua:Spawn()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_talkeli")
	lua:SetKeyValue("Code", EP1_LUA_RUN_ELI)
	lua:Spawn()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_start_enable")
	lua:SetKeyValue("Code", EP1_LUA_RUN_ONE)
	lua:Spawn()
	
	local ent = ents.Create("info_target")
	ent:SetKeyValue("targetname", "player_noparent")
	ent:SetPos(Vector(0, 0, 0))
	ent:Spawn()
	ent:Activate()
	
	local hl2c_auto_del = ents.FindInSphere( Vector(3832, -6136, -1000), 1 )
	hl2c_auto_del[1]:Remove()
	
	for k, v in pairs(ents.FindInSphere( Vector(3832, -6136, -1000), 10 )) do
	--hl2c_auto_del[1]:Remove()
		if v:GetClass() == "logic_auto" then
			v:Remove()
			-- print(" ")
			-- print("+++++++++++++++++++++++++++++")
			-- print("[hl2c] Modified:",v:GetClass())
			-- print("+++++++++++++++++++++++++++++")
			-- print(" ")
		end
	end
	
	for k, v in pairs(ents.FindByName("ss_DogIntro")) do
		v:Fire("addoutput", "OnBeginSequence vehicle_blackout,Kill,,21,-1")
	end
	
	local ss_dt = ents.FindByName("SS_dogthrow")
	ss_dt[1]:Fire("addoutput", "OnBeginSequence Dog,StopScripting,,0.0,1", "0.0")
	
	local ss_dc = ents.FindByName("ss_dog_climb")
	ss_dc[1]:Fire("addoutput", "OnEndSequence Dog,StartScripting,,0.0,1", "0.0")
	
	for k, v in pairs(ents.FindByName("relay_vanride_endcrash_1")) do
		--v:Fire("addoutput", "OnTrigger hl2c_timer_parent,Disable,,1.0,1", "0.0")
		v:Fire("addoutput", "OnTrigger lr_getoutcar,RunCode,,0.1,1", "0.0")
		v:Fire("addoutput", "OnTrigger player,Kill,,1.1,1", "0.0")
		--v:Fire("addoutput", "OnTrigger attachment_alyx,ClearParent,,1.1,1", "0.0")
		v:Fire("addoutput", "OnTrigger player_noparent,Kill,,1.1,1", "0.0")
		--v:Fire("addoutput", "OnTrigger hl2c_global,TurnOff,,1.2,-1", "0.0")
		v:Fire("addoutput", "OnTrigger Van,ExitVehicle,,1.6,1", "0.0")
		-- print("FOUND VAN RIDE")
	end
	--local vanend = ents.FindByName("relay_vanride_endcrash_1")
	--vanend[1]:Fire("addoutput", "OnTrigger hl2c_timer_parent,Disable,,1.0,1", "0.0")
	---vanend[1]:Fire("addoutput", "OnTrigger player,ClearParent,,1.1,1", "0.0")
	--vanend[1]:Fire("addoutput", "OnTrigger hl2c_global,TurnOff,,1.2,-1", "0.0")
	--vanend[1]:Fire("addoutput", "OnTrigger Van,ExitVehicle,,1.6,1", "0.0")
	/*
	local timer1 = ents.Create( "logic_timer" )
	timer1:SetPos(Vector(1066, 353, -631))
	timer1:SetKeyValue( "RefireTime", "0.1" )
	timer1:SetKeyValue( "targetname", "hl2c_timer_parent" )
	timer1:SetKeyValue( "StartDisabled", "1" )
	timer1:Fire("addoutput", "OnTimer player,SetParentAttachment,attachment_alyx,0.0,-1", "5")
	timer1:Spawn()
	*/
	local van = ents.FindByName("Van")
	--van[1]:Fire("addoutput", "PlayerOn player,SetParent,Van,0.0,-1", "5")
	--van[1]:Fire("addoutput", "PlayerOn hl2c_global,TurnOn,,0.0,-1", "5")
	--van[1]:Fire("addoutput", "PlayerOn hl2c_timer_parent,Enable,,1.0,1", "0.0")
	
	local fall = ents.FindByName("trigger_falldeath")
	fall[1]:Remove()
	/*
	local inv = ents.Create("env_global")
	inv:SetPos(Vector(1067, 354, -632))
	inv:SetKeyValue( "targetname", "hl2c_global" )
	inv:SetKeyValue( "globalstate", "gordon_invulnerable" )
	inv:Spawn()
	*/
	
	local hl2c_startintro_relay = ents.Create("logic_relay")
	--hl2c_startintro_relay:SetKeyValue("targetname", "startintro_relay")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger light_tracktrain,TurnOff,,6.1,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger light_end,TurnOff,,6.1,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger scene1_start,Trigger,,6.1,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger starfield_logic_start_sparse,Trigger,,6.1,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_music,PlaySound,,6,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger viewcontrol_black,Enable,,6.1,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_version3,FadeTo,255 0.01,6,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger credits_go,ShowLogo,,0,-1")
	--hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_version3,Activate,,0,-1")
	hl2c_startintro_relay:SetPos(Vector(-14016, -14232, -1291))
	hl2c_startintro_relay:Spawn()
	hl2c_startintro_relay:Activate()
	
	local tp = ents.Create("target_tp")
	tp:SetPos(Vector(-8267, 6020, 115))
	tp:SetKeyValue("targetname", "Target_tp01")
	tp:Spawn()
	tp:Activate()
	local tp = ents.Create("target_tp")
	tp:SetPos(Vector(-6456, 6230, -64))
	tp:SetKeyValue("targetname", "Target_tp02")
	tp:Spawn()
	tp:Activate()
	local tp = ents.Create("point_alyx_teleport")
	tp:SetPos(Vector(-8384.857422, 5955.880371, 136.409744))
	tp:SetKeyValue("targetname", "Alyx_tp01")
	tp:Spawn() 
	tp:Activate()
	
	for k, v in pairs(ents.FindInSphere( Vector(-8328, 6016, 112), 1 )) do
	--hl2c_auto_del[1]:Remove()
		if v:GetClass() == "trigger_once" then
			v:Fire("addoutput", "OnTrigger Alyx_tp01,Teleport,,0,-1")
			v:Fire("addoutput", "OnTrigger lr_talkeli,RunCode,,2.0,-1")
			v:Fire("addoutput", "OnTrigger Target_tp01,Teleport,,0,-1")
			v:Fire("addoutput", "OnTrigger Target_tp01,Teleport,,2.0,-1")
			v:Fire("addoutput", "OnTrigger Target_tp01,Teleport,,3.0,-1")
			v:Fire("addoutput", "OnTrigger Target_tp01,Teleport,,4.0,-1")
			v:Fire("addoutput", "OnTrigger Target_tp01,Teleport,,6.0,-1")
			-- print(" ")
			-- print("+++++++++++++++++++++++++++++")
			-- print("[hl2c] Modified:",v:GetClass())
			-- print("+++++++++++++++++++++++++++++")
			-- print(" ")
		end
	end
	
	
	
	for k, v in pairs(ents.FindByName("SS_Van_ThrowGate")) do
		v:Fire("addoutput", "OnBeginSequence Target_tp02,Teleport,,5.0,-1")
	end
	
	local killfortp = ents.Create("info_target")
	killfortp:SetKeyValue("targetname", "Tp_Players")
	killfortp:Spawn()
	killfortp:Activate()
	
	for k, v in pairs(ents.FindByName("path_VanRide_30")) do
		
		v:Fire("addoutput", "OnPass Tp_Players,Kill,,1.0,-1")
	end
	
	
	--end
end

/*"origin" "-8742 5984 -182.898"*/

function MAPSCRIPT:EntityRemoved(ent)
	if game.SinglePlayer() then 
		return  
	end
	/*
	if ent:GetName() == "global_newgame_spawner_physcannon" then
		if IsValid(ent) then
			print("********************************************")
			print("* Modified global_newgame_spawner_physcannon")
			print("********************************************")
			
			ent:Fire("addoutput", "OnPlayerPickup ep1_pc_start,Kill,,0,-1")
		end
	end
	*/
	
	
	
	if ent:GetName() == "game_start" then
		if !GAME_STARTED then
			print("EP1 GAME STARTED")
			GAME_STARTED = true
			local hl2c_auto = ents.Create("logic_auto")
			hl2c_auto:SetKeyValue("spawnflags", "1")
			hl2c_auto:Fire("addoutput", "OnMapSpawn hl2c_wait_text,Kill,,0,-1")
			hl2c_auto:Fire("addoutput", "OnMapSpawn hl2c_text_timer,Kill,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn startintro_relay,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn cam_relay_*,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput," "OnMapSpawn cam_relay_*,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn light_end,TurnOff,,6.1,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn light_tracktrain,TurnOff,,6.1,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn viewcontrol_black,Enable,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_music,PlaySound,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn starfield_logic_start_sparse,Trigger,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn scene1_start,Trigger,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_version3,Activate,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn credits_go,ShowLogo,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_version3,FadeTo,255 0.01,0,-1")
			hl2c_auto:Spawn()
			hl2c_auto:Activate()
	
		end
	end
	
	if ent:GetName() == "vehicle_blackout" then
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and v != NULL and v:IsPlayer() and v:IsSuitEquipped() then
				v:ExitVehicle()
				v:SetPos(Vector(-9003, 5784, -140))
			end
			
		end
	end
	if ent:GetName() == "physgun_dog" then
		for k, v in pairs(player.GetAll()) do
			timer.Simple(2,function()
			if IsValid(v) and v:IsPlayer() and v:IsSuitEquipped() and v:Team() == TEAM_ALIVE then
				v:Give("weapon_physcannon")
				EP1_GRAVITYGUN = true
			end
			end)
		end
	end
	/*
	if ent:GetName() == "Tp_Players" then
		for k, v in pairs(player.GetAll()) do
			timer.Simple(1.5,function()
				if IsValid(v) and v != NULL and v:IsPlayer() and v:IsSuitEquipped() and v:Team() == TEAM_ALIVE then
					v:ExitVehicle()
					v:SetPos(Vector(4578, 4080, -6290))
					v:ExitVehicle()
					v:SetPos(Vector(4578, 4080, -6290))
					print("[hl2c] Teleport Player:",v:Nick())
					v:ClearParent()
				end
			end)
		end
	end
	*/
	
	/*
	"spawnflags" "1"
	"classname" "logic_auto"
	connections
	{
		"OnNewGame" "light_end,TurnOff,,6.1,-1"
		"OnNewGame" "light_tracktrain,TurnOff,,6.1,-1"
		"OnNewGame" "viewcontrol_black,Enable,,6,-1"
		"OnNewGame" "intro_music,PlaySound,,6,-1"
		"OnNewGame" "starfield_logic_start_sparse,Trigger,,6,-1"
		"OnNewGame" "scene1_start,Trigger,,6,-1"
		"OnNewGame" "intro_version3,Activate,,0,-1"
		"OnNewGame" "credits_go,ShowLogo,,0,-1"
		"OnNewGame" "intro_version3,FadeTo,255 0.01,0,-1"
		
	}*/
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	/*if !GAME_STARTED then
		local black = ents.FindByName("viewcontrol_black")
		for m, n in pairs(black) do
			n:Fire("Enable")
		end
		timer.Simple(45, function()
			if !GAME_STARTED then
			--local black = ents.FindByName("viewcontrol_black")
			--for m, n in pairs(black) do
			--	n:Fire("Enable")
			--end
			end
			local killgame_starter = ents.FindByName("killmeplz")
			for k, v in pairs(killgame_starter) do
			v:Remove()
			end

		end)
	end*/
	if EP1_OUTCAR_START then
		if IsValid(pl) and pl:Team() == TEAM_ALIVE then
			pl:Teleport(EP1_LAST_CP)
		end
	end
	
	if EP1_GRAVITYGUN then
		pl:Give("weapon_physcannon")
	end
end

function MAPSCRIPT:KeyValue(ent, key, value)
	-- pclip_gunship_2
	
	if key == "targetname" and value == "mark_dog_intro_climb_1" then
		if IsValid(ent) then
			-- print("********************************************")
			-- print("* Removed mark_dog_intro_climb_1")
			-- print("********************************************")
			
			ent:Remove()
		end
	end
	if key == "targetname" and value == "mark_al_intro_climb_1" then
		if IsValid(ent) then
			-- print("********************************************")
			-- print("* Removed mark_al_intro_climb_1")
			-- print("********************************************")
			
			ent:Remove()
		end
	end
	if key == "targetname" and value == "ss_dog_climb" then
		if IsValid(ent) then
			-- print("********************************************")
			-- print("* Removed ss_dog_climb")
			-- print("********************************************")
			
			ent:Remove()
		end
	end
	if key == "targetname" and value == "ss_alyx_climb" then
		if IsValid(ent) then
			-- print("********************************************")
			-- print("* Removed ss_alyx_climb")
			-- print("********************************************")
			
			ent:Remove()
		end
	end
	
end


return MAPSCRIPT