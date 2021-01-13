//include("sh_config.lua")
//include("skills.lua")
local DbgPrint = GetLogging("InitPostEntity")
// Called as soon as all map entities have been spawned 
--function GM:InitPostEntity()
HL2C_ENTITY_DISSOLVER = false
-- hook.Add("InitPostEntity", "Hook_InitPost", function()
function GM:InitPostEntity()
	
	SECRET.HL2.INITPOST()
	if CD_MAP then
		local ent = ents.Create("hl2c_follow_system")
		ent:SetPos(Vector(0,0,0) )
		ent:SetKeyValue("FollowerClass","npc_combine_s")
		ent:SetKeyValue("Steal","1")
		ent:Spawn()
		ent:Activate()
	end
	
	if !HL2C_ENTITY_DISSOLVER then
	HL2C_ENTITY_DISSOLVER = ents.Create("env_entity_dissolver")
	HL2C_ENTITY_DISSOLVER:SetPos(Vector(0,0,0))
	HL2C_ENTITY_DISSOLVER:SetKeyValue("target","info_target")
	HL2C_ENTITY_DISSOLVER:SetKeyValue("dissolvetype","1")
	HL2C_ENTITY_DISSOLVER:Spawn()
	HL2C_ENTITY_DISSOLVER:Activate()
	end
	--ReplaceItem( "weapon_mp5k", "weapon_smg1" )
	timer.Simple(5, function()
		if !HL2MP_IS_COOP_MAP then
			local noplydie = ents.FindByClass("logic_choreographed_scene")
			for k, v in pairs( noplydie ) do
	
				v:SetKeyValue("onplayerdeath", "0")
			end
	--		local kill_texts = ents.FindByClass("game_text")
	--		for k, v in pairs( kill_texts ) do
	--		
	--			v:Remove()
	--		end
		end
	end)
	
	--
	-- // OrangeBox Script \\
	-- Desc:
	-- In Orangebox Models got skins. 
	-- So any npc has a weapon that 
	-- inside Orangebox script match with the criteria then
	-- it will change the model skin.
	--
	
	if HL2MP_IS_COOP_MAP then
		for _, item in pairs( ents.GetAll() ) do
	
			if ( item:IsValid() && ( table.HasValue( ITEM_RESPAWN_ENTITY_CLASS_LIST, item:GetClass() ) || item:IsWeapon() ) ) then
				if item:GetOwner() != NULL then
				--print(item:GetOwner():GetClass())
				else
					-- Because, weapons should respawn too and I'm too lazy to fix the current Respawn() stuff
					local respawner = ents.Create( "point_item_respawn" ) -- We create a bunch of these point entities at Origin 0 0 0
					respawner:SetPos( item:GetPos() )
					respawner.RespawnClass = item:GetClass()
					respawner.RespawnVector = item:GetPos()
					respawner.RespawnAngles = item:GetAngles()
					respawner:Spawn()
					respawner:Activate()
					local item_phys = item:GetPhysicsObject()
					if item_phys:IsMotionEnabled() != true then
						local phys = respawner:GetPhysicsObject()
						phys:EnableMotion(false)
					end
					if ( !ALLOW_WEAPON_RESPAWNS ) then
					
						if ( string.find( respawner.RespawnClass, "weapon_" ) ) then
							--timer.Simple(5, function()
							respawner:Remove()
							--end)
						end
					
					end
					--timer.Simple(5,function()
					--if item:GetOwner() != NULL then
					--print(item:GetOwner():GetClass())
					--else
					item:Remove()
				end
				--end)
			end
	
		end
	end
	if !NEXT_MAP then
		MsgN('Next map unknown, going back to Map Select!')
		NEXT_MAP = LOBBY_TEXT_MAP
		-- NEXT_MAP = LOBBY_TEXT_MAP
		return
	end
	if SYN_MAP then
	
	elseif OC_MAP then
	
	else
		-- Half-Life 2: DM coop maps don't spawn on these.
		if HL2MP_IS_COOP_MAP then
		
		else  --||HL2MP_IS_COOP_MAP then
			// Remove old spawn points
			--if SYN_MAP then
			--elseif OC_MAP then
			--else
			--print("KILL",HL2_SPAWN_ENT)
			for _, ips in pairs(ents.FindByClass(HL2_SPAWN_ENT)) do
				if !ips:HasSpawnFlags(1) || INFO_PLAYER_SPAWN then
					ips:Remove()
				end
			end
	
			// Setup INFO_PLAYER_SPAWN
			if INFO_PLAYER_SPAWN then
				GAMEMODE:CreateSpawnPoint(INFO_PLAYER_SPAWN[1], INFO_PLAYER_SPAWN[2])
			end
			--end
		end
		
	end

	// Setup TRIGGER_CHECKPOINT
	if !game.SinglePlayer() then
		if TRIGGER_CHECKPOINT then
			for _, tcpInfo in pairs(TRIGGER_CHECKPOINT) do
				local tcp = ents.Create("trigger_checkpoint")
				
				tcp.min = tcpInfo[1]
				tcp.max = tcpInfo[2]
				tcp.pos = tcp.max - ((tcp.max - tcp.min) / 2)
				tcp.skipSpawnpoint = tcpInfo[3]
				tcp.OnTouchRun = tcpInfo[4]
				if tcpInfo[5] ~= nil then
					tcp.CustomSpawn = tcpInfo[5]
				end
				tcp:SetPos(tcp.pos)
				tcp:Spawn()
				
				table.insert(checkpointPositions, tcp.pos)
			end
		end
	end
	
	// Setup BRUSH_PLAYERFREEZE
	if BRUSH_PLAYERFREEZE then
		for _, pfInfo in pairs(BRUSH_PLAYERFREEZE) do
			local pf = ents.Create("brush_playerfreeze")
			
			pf.min = pfInfo[1]
			pf.max = pfInfo[2]
			pf.pos = pf.max - ((pf.max - pf.min) / 2)
			
			pf:SetPos(pf.pos)
			pf:Spawn()
		end
	end
	
	// Setup TRIGGER_AIRBOATGUN_HL2C
	if TRIGGER_AIRBOATGUN_HL2C then
		for _, abgInfo in pairs(TRIGGER_AIRBOATGUN_HL2C) do
			local abg = ents.Create("trigger_airboatgun_hl2c")
			
			abg.min = abgInfo[1]
			abg.max = abgInfo[2]
			abg.pos = abg.max - ((abg.max - abg.min) / 2)
			
			abg:SetPos(abg.pos)
			abg:Spawn()
		end
	end
	
	// Setup BRUSH_PLAYERCLIP
	// RECREATED DUE TO BUGS WITH BRUSH_PLAYERFREEZE NOT WORKING AT TIMES
	if BRUSH_PLAYERCLIP then
		for _, pcInfo in pairs(BRUSH_PLAYERCLIP) do
			local pc = ents.Create("brush_playerclip")
			
			pc.min = pcInfo[1]
			pc.max = pcInfo[2]
			pc.pos = pc.max - ((pc.max - pc.min) / 2)
			
			pc:SetPos(pc.pos)
			pc:Spawn()
		end
	end
	
	// Setup BRUSH_VEHICLECLIP
	// RECREATED DUE TO BUGS WITH BRUSH_VEHICLECLIP NOT WORKING AT TIMES
	if BRUSH_VEHICLECLIP then
		for _, vcInfo in pairs(BRUSH_VEHICLECLIP) do
			local vc = ents.Create("brush_vehicleclip")
			
			vc.min = vcInfo[1]
			vc.max = vcInfo[2]
			vc.pos = vc.max - ((vc.max - vc.min) / 2)
			
			vc:SetPos(vc.pos)
			vc:Spawn()
		end
	end
	
	// Setup TRIGGER_VEHICLESPAWN
	if TRIGGER_VEHICLESPAWN then
		for _, tvsInfo in pairs(TRIGGER_VEHICLESPAWN) do
			local tvs = ents.Create("trigger_vehiclespawn")
			
			tvs.min = tvsInfo[1]
			tvs.max = tvsInfo[2]
			tvs.pos = tvs.max - ((tvs.max - tvs.min) / 2)
			
			tvs:SetPos(tvs.pos)
			tvs:Spawn()
		end
	end
	
	// Setup TRIGGER_DELAYMAPLOAD
	if TRIGGER_DELAYMAPLOAD then
		GAMEMODE:CreateTDML(TRIGGER_DELAYMAPLOAD[1], TRIGGER_DELAYMAPLOAD[2])
	
		for _, tcl in pairs(ents.FindByClass("trigger_changelevel")) do
			tcl:Remove()
		end
	else
		for _, tcl in pairs(ents.FindByClass("trigger_changelevel")) do
			if tcl.map == NEXT_MAP then			
				local tclMin, tclMax = tcl:WorldSpaceAABB()
				GAMEMODE:CreateTDML(tclMin, tclMax)
			end
			tcl:Remove()
		end
	end
	table.insert(checkpointPositions, tdmlPos)
	
	-- Half-Life 2: DM coop maps don't need to show the checkpoint positions, we're keeping it clean.
	if !HL2MP_IS_COOP_MAP then
		// Old usermessages
		if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
			umsg.Start("SetCheckpointPosition", RecipientFilter():AddAllPlayers())
			umsg.Vector(checkpointPositions[#checkpointPositions])
			umsg.End()
		elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
			// Use the new net library
			for _, pl in pairs(player.GetAll()) do
				net.Start("SetCheckpointPosition")
					net.WriteVector(checkpointPositions[#checkpointPositions])
				net.Send(pl)
			end
		end
	end
	
	-- Crash Recovery --
	// Let me execute this so we go back to the map that we crashed on.
	if game.IsDedicated(true) then
		if file.Exists("hl2c_data/hl2c_crash_recovery.txt", "DATA") then
		
			mapRecover = util.KeyValuesToTable(file.Read("hl2c_data/hl2c_crash_recovery.txt", "DATA"))
			if mapRecover.predicted_crash == LOBBY_TEXT_MAP then
				mapRecover.predicted_crash = LOBBY_TEXT_MAP
			end
			-- print(mapRecover.predicted_crash)
			if (mapRecover.predicted_crash == LOBBY_TEXT_MAP or 
			mapRecover.predicted_crash == "gm_flatgrass" or 
			mapRecover.predicted_crash == "gm_construct" or 
			mapRecover.predicted_crash == LOBBY_TEXT_MAP) 
			then
				print("File Deleted")
				file.Delete("hl2c_data/hl2c_crash_recovery.txt")
			elseif mapRecover.predicted_crash != game.GetMap() then
				file.Delete("hl2c_data/hl2c_crash_recovery.txt")
				game.ConsoleCommand("changelevel "..mapRecover.predicted_crash.."\n")
				return
			end
		end
		
	end
		
	if game.IsDedicated(true) then
		local savedMap = {}
		
		savedMap.predicted_crash = game.GetMap()
		if (game.GetMap() == LOBBY_TEXT_MAP or
		game.GetMap() == "gm_flatgrass" or 
		game.GetMap() == "gm_construct" ) then
		
		else
		file.Write("hl2c_data/hl2c_crash_recovery.txt", util.TableToKeyValues(savedMap))
		
		end
	end
	-- End --
	
	-- Is *** Mounted? --
	// Classic Mode way.
	if GetConVarNumber("hl2c_classic") >= 1 then // This was the original way I was going to do to the players.
		if !game.IsDedicated(true) then
			-- Half-Life 2
			if string.find(game.GetMap(), "d1_") || string.find(game.GetMap(), "d2_") || string.find(game.GetMap(), "d3_") then
				if !IsMounted("hl2") then
					// This shuts the listen server down. This won't give an Engine Error.
					game.ConsoleCommand("killserver\n")
				end
			end
			
			-- Episode 1
			if string.find(game.GetMap(), "ep1_") then
				if !IsMounted("episodic") then
					// This shuts the listen server down. This won't give an Engine Error.
					game.ConsoleCommand("killserver\n")
				end
			end
			
			-- Episode 2
			if string.find(game.GetMap(), "ep2_") then
				if !IsMounted("ep2") then
					// This shuts the listen server down. This won't give an Engine Error.
					game.ConsoleCommand("killserver\n")
				end
			end
			
			-- Half-Life: Source
			if HL1_CAMPAIGN == true && !IsMounted("hl1") then
				// This shuts the listen server down. This won't give an Engine Error.
				game.ConsoleCommand("killserver\n")
			end
		end
	end
	-- End --
	
	--------------------------------------------------
	--				Commented it 					--
	--					because						--
	--			it caused problems					--
	--			in d1_trainstation_01 :(			--
	--------------------------------------------------
	// Fix NPCs not killing or targeting you <--------------------  YOU CAUSE PROBLEMS AND THATS WHY I REMOVE YOU NOW MUHAHAHAHA
	
	if string.find(game.GetMap(), "d1_trainstation_04") && !game.SinglePlayer() then
		
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("kill", "", "5.0")
		
	elseif string.find(game.GetMap(), "d1_trainstation_01") && !game.SinglePlayer() then
		
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnon", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnon", "", "1.0")
		envG2:Fire("kill", "", "5.0")
		
	elseif string.find(game.GetMap(), "d1_trainstation_06") && !game.SinglePlayer() then
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "2")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("remove", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "2")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("remove", "", "1.0")
		envG2:Fire("kill", "", "5.0")
	--end
	/*
	elseif (!string.find(game.GetMap(), "d1_trainstation_") || string.find(game.GetMap(), "d1_canals_") || string.find(game.GetMap(), "d1_town_")) && !game.SinglePlayer() then
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("kill", "", "5.0")
	--end
	
	elseif (!string.find(game.GetMap(), "d1_trainstation_") || string.find(game.GetMap(), "d2_canals_") || string.find(game.GetMap(), "d3_")) && !game.SinglePlayer() then
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("kill", "", "5.0")
	--end
	
	elseif (!string.find(game.GetMap(), "d1_trainstation_") || string.find(game.GetMap(), "ep1_citadel_") || string.find(game.GetMap(), "ep1_c17_")) && !game.SinglePlayer() then
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("kill", "", "5.0")
	--end
	
	elseif (!string.find(game.GetMap(), "d1_trainstation_") || string.find(game.GetMap(), "ep2_outland_")) && !game.SinglePlayer() then
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("kill", "", "5.0")
	*/
	elseif string.find(game.GetMap(), "d2_prison_02") && !game.SinglePlayer() then
	
		local envG3 = ents.Create("env_global")
		envG3:SetPos(Vector(-150, 100, -150))
		envG3:SetKeyValue("targetname", "hl2c_antlion_allied")
		envG3:SetKeyValue("globalstate", "antlion_allied")
		envG3:SetKeyValue("spawnflags", "1")
		envG3:SetKeyValue("initialstate", "0")
		envG3:Spawn()
		envG3:Activate()
		--envG3:Fire("turnoff", "", "1.0")
		envG3:Fire("turnon", "", "5.0")
		envG3:Fire("kill", "", "6.0")
		
	elseif string.find(game.GetMap(), "d2_prison_06") && !game.SinglePlayer() then
	
		local envG3 = ents.Create("env_global")
		envG3:SetPos(Vector(-150, 100, -150))
		envG3:SetKeyValue("targetname", "hl2c_antlion_allied")
		envG3:SetKeyValue("globalstate", "antlion_allied")
		envG3:SetKeyValue("spawnflags", "1")
		envG3:SetKeyValue("initialstate", "0")
		envG3:Spawn()
		envG3:Activate()
		envG3:Fire("turnoff", "", "1.0")
		--envG3:Fire("turnon", "", "5.0")
		envG3:Fire("kill", "", "6.0")
		
	elseif string.find(game.GetMap(), "d2_coast_12") && !game.SinglePlayer() then
	
		local envG3 = ents.Create("env_global")
		envG3:SetPos(Vector(-150, 100, -150))
		envG3:SetKeyValue("targetname", "hl2c_antlion_allied")
		envG3:SetKeyValue("globalstate", "antlion_allied")
		envG3:SetKeyValue("spawnflags", "1")
		envG3:SetKeyValue("initialstate", "1")
		envG3:Spawn()
		envG3:Activate()
		--envG3:Fire("turnoff", "", "1.0")
		envG3:Fire("turnon", "", "5.0")
		envG3:Fire("kill", "", "6.0")
	
	elseif (!string.find(game.GetMap(), "d1_trainstation_04") || !string.find(game.GetMap(), "d1_trainstation_06") || string.find(game.GetMap(), "d1_trainstation_")) && !game.SinglePlayer() then
		/*local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		--envG1:SetKeyValue("spawnflags", "1")
		envG1:SetKeyValue("initialstate", "0")
		envG1:Spawn()
		envG1:Activate()
		envG1:Fire("turnon", "", "1.0")
		envG1:Fire("kill", "", "5.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		--envG2:SetKeyValue("spawnflags", "1")
		envG2:SetKeyValue("initialstate", "0")
		envG2:Spawn()
		envG2:Activate()
		envG2:Fire("turnon", "", "1.0")
		envG2:Fire("kill", "", "5.0")
		*/
	end
	--elseif string.find(game.GetMap(), "keyfox_lobby_winter") then
	if string.find(game.GetMap(), LOBBY_TEXT_MAP) then
		--local _worldspawn = ents.FindByName(worldspawn)
		--local _spawn = ents.FindByClass("worldspawn")
		--for _, del_globs in pairs(_spawn) do
		--del_globs:SetKeyValue("newunit", "1")
		--end
		
		local envG1 = ents.Create("env_global")
		envG1:SetPos(Vector(150, -100, 150))
		envG1:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG1:SetKeyValue("globalstate", "gordon_precriminal")
		envG1:SetKeyValue("initialstate", "2")
		envG1:Spawn()
		envG1:Activate()
		--envG1:Fire("turnoff", "", "1.0")
		envG1:Fire("remove", "", "5.0")
		envG1:Fire("kill", "", "6.0")
		
		local envG2 = ents.Create("env_global")
		envG2:SetPos(Vector(-150, 100, -150))
		envG2:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG2:SetKeyValue("globalstate", "gordon_invulnerable")
		envG2:SetKeyValue("initialstate", "2")
		envG2:Spawn()
		envG2:Activate()
		--envG2:Fire("turnoff", "", "1.0")
		envG2:Fire("remove", "", "5.0")
		envG2:Fire("kill", "", "6.0")
		
		local envG3 = ents.Create("env_global")
		envG3:SetPos(Vector(-150, 100, -150))
		envG3:SetKeyValue("targetname", "hl2c_antlion_allied")
		envG3:SetKeyValue("globalstate", "antlion_allied")
		envG3:SetKeyValue("initialstate", "2")
		envG3:Spawn()
		envG3:Activate()
		--envG3:Fire("turnoff", "", "1.0")
		envG3:Fire("remove", "", "5.0")
		envG3:Fire("kill", "", "6.0")
		
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
		
		local envG5 = ents.Create("env_global")
		envG5:SetPos(Vector(-150, 100, -150))
		envG5:SetKeyValue("targetname", "hl2c_super_phys_gun")
		envG5:SetKeyValue("globalstate", "super_phys_gun")
		envG5:SetKeyValue("initialstate", "2")
		envG5:Spawn()
		envG5:Activate()
		--envG5:Fire("turnoff", "", "1.0")
		envG5:Fire("remove", "", "5.0")
		envG5:Fire("kill", "", "6.0")
		
		local envg = ents.Create("env_global")
		envg:SetPos(Vector(-150, 100, -150))
		envg:SetKeyValue("targetname", "hl2c_hunters_to_run_over")
		envg:SetKeyValue("globalstate", "hunters_to_run_over")
		envg:SetKeyValue("initialstate", "2")
		envg:Spawn()
		envg:Activate()
		--envg:Fire("turnoff", "", "1.0")
		envg:Fire("remove", "", "5.0")
		envg:Fire("kill", "", "6.0")
		
		local envg = ents.Create("env_global")
		envg:SetPos(Vector(-150, 100, -150))
		envg:SetKeyValue("targetname", "hl2c_ep2_alyx_injured")
		envg:SetKeyValue("globalstate", "ep2_alyx_injured")
		envg:SetKeyValue("initialstate", "2")
		envg:Spawn()
		envg:Activate()
		--envg:Fire("turnoff", "", "1.0")
		envg:Fire("remove", "", "5.0")
		envg:Fire("kill", "", "6.0")
		
		local envg = ents.Create("env_global")
		envg:SetPos(Vector(-150, 100, -150))
		envg:SetKeyValue("targetname", "hl2c_ep_alyx_darknessmode")
		envg:SetKeyValue("globalstate", "ep_alyx_darknessmode")
		envg:SetKeyValue("initialstate", "2")
		envg:Spawn()
		envg:Activate()
		--envg:Fire("turnoff", "", "1.0")
		envg:Fire("remove", "", "5.0")
		envg:Fire("kill", "", "6.0")
	end
	--------------------------------------------------
	--		Commenting end of this shit :(			--
	--------------------------------------------------
	
	if !game.SinglePlayer() then
		// Remove fall_trigger triggers which cause the game to "end"
		local triggerMultiples = ents.FindByName("fall_trigger")
		for _, falltrigger in pairs(triggerMultiples) do
			falltrigger:Remove()
		end
		//Remove autosave
		/*local r_autosave = ents.FindByName("autosave")
		r_autosave[1]:Remove()*/
	end
	
	if GetConVarNumber("hl2c_additions") >= 1 && !game.SinglePlayer() then
		local hl2_suitcharger = ents.FindByClass("item_suitcharger")
		for _, scharger in pairs(hl2_suitcharger) do
			scharger:Fire("addoutput", "OnEmpty !self,Recharge,,0.5,-1")
		end
	end
	
	if HL1_START_TRAM == true then
		local ips2 = ents.FindByClass("info_player_start")
		local tram = ents.FindByName("train")
		for _, parips in pairs(ips2) do
			parips:SetMoveType( MOVETYPE_NONE )
			parips:SetParent( tram[1], -1 )
		end
	end
	
	// Remove global_newgame entities since they are useless.
	local globalNewgame = ents.FindByName("global_newgame_template")
	for _, gng in pairs(globalNewgame) do
		gng:Remove()
	end
	
	// Remove global_newgame entities since they are useless.
	local globalNewgameLocalItems = ents.FindByName("global_newgame_template_local_items")
	for _, gngli in pairs(globalNewgameLocalItems) do
		gngli:Remove()
	end
	
	// Remove global_newgame entities since they are useless.
	local globalNewgameAmmo = ents.FindByName("global_newgame_template_ammo")
	for _, gnga in pairs(globalNewgameAmmo) do
		gnga:Remove()
	end
	/*
	// Remove global_newgame entities since they are useless.
	local globalNewgameBaseItems = ents.FindByName("global_newgame_template_base_items")
	for _, gngbi in pairs(globalNewgameBaseItems) do
		gngbi:Remove()
	end
	*/
	// Remove start_item entities since they are useless.
	local startItemsTemplate = ents.FindByName("start_item_template")
	for _, sIT in pairs(startItemsTemplate) do
		sIT:Remove()
	end
	
	// Remove player_spawn_item_template entities since they are useless.
	local playerSpawnItemsTemplate = ents.FindByName("player_spawn_items_template")
	for _, pSIT in pairs(playerSpawnItemsTemplate) do
		pSIT:Remove()
	end
	
	// Remove player_spawn_item_maker entities since they are useless.
	-- local playerSpawnItemsMaker = ents.FindByName("player_spawn_items_maker")
	-- for _, pSIM in pairs(playerSpawnItemsMaker) do
		-- pSIM:Remove()
	-- end
	
	local map_fail = ents.Create("point_map_failed")
	map_fail:SetKeyValue("targetname", "hl2c_fail")
	map_fail:SetPos(Vector(0, 0, 0))
	map_fail:Spawn()
	
	if !string.find(game.GetMap(), "d1_trainstation_05") then
		local map_spawn = ents.Create("logic_auto")
		map_spawn:SetPos(Vector(4685.63, -5671, -60.447) )
		map_spawn:SetKeyValue( "spawnflags", "1" )
		map_spawn:Fire("addoutput", "OnMapSpawn suit,Kill,,1,-1")
		--map_spawn:Fire("addoutput", "OnMapSpawn physcannon,Kill,,1,-1")
		map_spawn:Spawn()
		map_spawn:Activate()
		
		--local del_suit = ents.FindByClass("item_suit")
		
		--del_suit[1]:Fire("Kill", "", "2")
		timer.Simple( 5, function()
		local del_suit = ents.FindByClass("item_suit")
		for _, pSUIT in pairs(del_suit) do
		pSUIT:Fire("Kill", "", "2")
		end
		
		local delsuit = ents.FindByName("suit")
		for _, pSSUIT in pairs(delsuit) do
		pSSUIT:Fire("Kill", "", "2")
		end
		end)
	end
	/*
	if string.find(game.GetMap(), "ep2_outland_") then
	timer.Simple(3, function()
		hl2c_auto = ents.Create("logic_auto")
		hl2c_auto:SetPos(Vector(776, 2592, 333.524))
		hl2c_auto:SetKeyValue( "spawnflags", "1" )
		hl2c_auto:Fire("addoutput", "OnMapSpawn spawnitems,Kill,,0.3,-1")
		--hl2c_auto:Fire("addoutput", "OnMapSpawn exit_doors,Kill,,0.1,-1")
		--hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_entmaker,ForceSpawn,,0.3,-1")
		hl2c_auto:Spawn()
		hl2c_auto:Activate()
	end)
	end
	*/
	if HL2MP_IS_COOP_MAP then
		timer.Simple( 2, function()
			NEXT_MAP_TIME = 5
		end)
		local rmanager = ents.Create("game_ragdoll_manager")
		rmanager:SetKeyValue("MaxRagdollCount", "3")
		rmanager:SetKeyValue("MaxRagdollCountDX8", "3")
		rmanager:SetKeyValue("SaveImportant", "0")
		rmanager:Spawn()
		rmanager:Activate()
	end
	if !string.find(game.GetMap(), "gm_flatgrass") and game.GetMap() != "ep1_c17_06" then
		local hl2c_nopedmg = ents.Create("filter_multi")
		hl2c_nopedmg:SetKeyValue("Negated", "1")
		hl2c_nopedmg:SetKeyValue("targetname", "filter_NoDamage")
		hl2c_nopedmg:SetPos(Vector(-5214, 1970, -3241))
		hl2c_nopedmg:Spawn()
		hl2c_nopedmg:Activate()
	timer.Simple(3, function()
	/*
		local hl2c_nopedmg = ents.Create("filter_multi")
		hl2c_nopedmg:SetKeyValue("Negated", "1")
		hl2c_nopedmg:SetKeyValue("targetname", "filter_NoDamage")
		hl2c_nopedmg:SetPos(Vector(-5214, 1970, -3241))
		hl2c_nopedmg:Spawn()
		hl2c_nopedmg:Activate()
	*/
		hl2c_auto = ents.Create("logic_auto")
		hl2c_auto:SetPos(Vector(776, 2592, 333.524))
		hl2c_auto:SetKeyValue( "spawnflags", "1" )
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_357,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_crossbow,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_bugbait,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_rpg,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_ar2,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg1,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_local_items,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_ammo,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physcannon,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_pistol,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_crowbar,Kill,,0.3,-1")
		//hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_base_items,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_superphys,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn player_spawn_items,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn player_spawn_items,Kill,,1,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn spawnitems,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn player_spawn_template,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn spawnitems_template,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_template_ammo,Kill,,0.3,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn startitems,Kill,,0.3,-1")
		--hl2c_auto:Fire("addoutput", "OnMapSpawn startobjects_template,Kill,,0.4,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn startobjects,Kill,,0.4,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn physcannon,Kill,,1,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn suit,Kill,,1,-1")
		hl2c_auto:Fire("addoutput", "OnMapSpawn player_items,Kill,,1,-1")
		hl2c_auto:Spawn()
		hl2c_auto:Activate()
	end)
	end
	//global_newgame_spawner_physcannon
	//global_newgame_spawner_shotgun
	//global_newgame_spawner_smg
	//global_newgame_spawner_shotgun
	//physcannon
	//suit
	//player_items
	//global_newgame_spawner_suit
	//global_newgame_spawner_physcannon
	//global_newgame_spawner_suit
	//global_newgame_template_base_items
	//startobjects
	//startobjects_template
	//startitems
	//player_spawn_items
	//player_items
	//Global New Game
	//player_spawn_template
	//player_spawn_items
	//spawnitems_template
	//spawnitems
	//global_newgame_template_ammo
	//global_newgame_spawner_ammo
	/*
		"Template04" "global_newgame_spawner_smg"
	"Template03" "global_newgame_spawner_pistol"
	"Template02" "global_newgame_spawner_crowbar"
	"Template01" "global_newgame_spawner_suit"
		"Template08" "global_newgame_spawner_357"
	"Template07" "global_newgame_spawner_crossbow"
	"Template06" "global_newgame_spawner_bugbait"
	"Template04" "global_newgame_spawner_rpg"
	"Template03" "global_newgame_spawner_ar2"
	"Template02" "global_newgame_spawner_smg1"
	"Template01" "global_newgame_spawner_shotgun"
	"targetname" "global_newgame_template_local_items"
	global_newgame_template_ammo
	global_newgame_template_base_items
	global_newgame_template_superphys
	"targetname" "global_newgame_spawner_suit"
	"targetname" "global_newgame_spawner_ar2"
	"targetname" "global_newgame_spawner_shotgun"
	"targetname" "global_newgame_spawner_smg1"
	"Template01" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_template_ammo"
	"Template04" "global_newgame_spawner_physcannon"
	"Template03" "global_newgame_spawner_pistol"
	"Template02" "global_newgame_spawner_crowbar"
	"Template01" "global_newgame_spawner_suit"
	"targetname" "global_newgame_template_base_items"
	"targetname" "global_newgame_spawner_357"
	"targetname" "global_newgame_spawner_crossbow"
	"targetname" "global_newgame_spawner_bugbait"
	"targetname" "global_newgame_spawner_rpg"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_pistol"
	"targetname" "global_newgame_spawner_crowbar"
	"targetname" "global_newgame_spawner_physcannon"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	"targetname" "global_newgame_spawner_ammo"
	*/
	
	
		// Difficulty Setup NPCs
	if !HL2MP_IS_COOP_MAP then
		--timer.Simple(7, function()
			if player.GetCount() >= 3 then
				game.ConsoleCommand("sk_antlionguard_health 1000\n")
			else
			
			end
		--end)
	end
--end

-- print("-----------------------------")
-- print("[hl2c] Entities Initialized")
-- print("-----------------------------")
-- end) 
	
	if game.GetMap() == LOBBY_TEXT_MAP then
		SECRET.HL2.CLEAR()
	end
	
	if self.MapScript.InitPost ~= nil then
		-- print("Hi?")
		self.MapScript:InitPost()
		DbgPrint("[hl2c]: MapScript.InitPost")
	end
	
	if game.GetMap() == LOBBY_TEXT_MAP_OLD then
		-- game.ConsoleCommand("hl2c_changelevel " LOBBY_TEXT_MAP "\n")
		game.ConsoleCommand("hl2c_changelevel ".. LOBBY_TEXT_MAP .."\n")
	end
	
	DbgPrint("[hl2c]: InitPostEntity")
end