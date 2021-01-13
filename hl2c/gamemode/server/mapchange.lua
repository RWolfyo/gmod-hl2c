// Called by GoToNextLevel
function GM:MapSwitch(nextmap)
	DISCORD_MapSwitch(nextmap)
end

function GM:GrabAndSwitch()
	if Hl2c.MAPCHANGE then return end
	if NEXT_MAP == LOBBY_TEXT_MAP then
		NEXT_MAP = LOBBY_TEXT_MAP
	end
	if GAME_IS_HL2 then Hl2c:SavePlayerChallange() end
	if !Hl2c.MAPCHANGE then
		if DISCORD_MapSwitch then DISCORD_MapSwitch(NEXT_MAP) end
	end
	for _, pl in pairs(player.GetAll()) do
	
	
		-- Save Kill Stat --
		if !Hl2c.MAPCHANGE then
			if pl and pl.database and pl.setup_achi then 
				pl:AddFreeman()
				SECRET.HL2.REWARD(pl)
				if pl.hadloot != true and HL2MP_IS_COOP_MAP != true then
					pl:lootBoxDrop()
					pl.hadloot = true
				end
				
				pl:databaseAllSave()
				
				SaveKillsStat(pl)
				Player_PermaPoint_Save(pl)
				
			end
		end
		if IsValid(pl) and pl:Team() == TEAM_ALIVE then
		local plInfo = {}
		local plWeapons = pl:GetWeapons()
		
		--SaveKillsStat(pl)
		
		plInfo.predicted_map = NEXT_MAP
		plInfo.health = pl:Health()
		plInfo.armor = pl:Armor()
		plInfo.score = pl:Frags()
		--plInfo.deaths = pl:Deaths()
		plInfo.model = pl.modelName
		
		if plWeapons && #plWeapons > 0 then
			plInfo.loadout = {}
			
			for _, wep in pairs(plWeapons) do
				plInfo.loadout[wep:GetClass()] = {pl:GetAmmoCount(wep:GetPrimaryAmmoType()), pl:GetAmmoCount(wep:GetSecondaryAmmoType())}
			end
		end
		
		file.Write("hl2c_userid_info/hl2c_userid_info_"..pl:UniqueID()..".txt", util.TableToKeyValues(plInfo))
		end
	end
	Hl2c.MAPCHANGE = true
	-- Crash Recovery --
	if game.IsDedicated(true) then
		local savedMap = {}
		
		savedMap.predicted_crash = NEXT_MAP
		
		file.Write("hl2c_data/hl2c_crash_recovery.txt", util.TableToKeyValues(savedMap))
	end
	-- End --
	
	-- if game.GetMap() == "ep2_outland_01a" and
	-- Hl2c.ANTLIONGRUB_KILLS >= Hl2c.ANTLIONGRUB_COUNT
	-- then
		-- file.Write("hl2c_data/"..game.GetMap().."grub.txt", " ")		
	-- end
	
	-- if game.GetMap() == "ep2_outland_02" and
	-- file.Exists("hl2c_data/".."ep2_outland_01a".."grub.txt","DATA") and
	-- Hl2c.ANTLIONGRUB_KILLS >= Hl2c.ANTLIONGRUB_COUNT
	-- then
		-- file.Delete("hl2c_data/".."ep2_outland_01a".."grub.txt")
		-- file.Write("hl2c_data/"..game.GetMap().."grub.txt", " ")		
	-- end
	
	-- if game.GetMap() == "ep2_outland_03" and
	-- file.Exists("hl2c_data/".."ep2_outland_02".."grub.txt","DATA") and
	-- Hl2c.ANTLIONGRUB_KILLS >= Hl2c.ANTLIONGRUB_COUNT
	-- then
		-- file.Delete("hl2c_data/".."ep2_outland_02".."grub.txt")
		-- file.Write("hl2c_data/"..game.GetMap().."grub.txt", " ")		
	-- end
	
	-- if game.GetMap() == "ep2_outland_04" or
		-- game.GetMap() == "LOBBY_TEXT_MAP" or
		-- game.GetMap() == "LOBBY_TEXT_MAP"
	-- then
		-- file.Delete("hl2c_data/".."ep2_outland_01a".."grub.txt")		
		-- file.Delete("hl2c_data/".."ep2_outland_02".."grub.txt")		
		-- file.Delete("hl2c_data/".."ep2_outland_03".."grub.txt")		
	-- end
	
	timer.Simple(12.0,function()
		game.ConsoleCommand("changelevel "..NEXT_MAP.."\n")
	end)
end


// Called by point_changelevel_extra
function GM:GrabAndSwitchExtra()
	if Hl2c.MAPCHANGE then return end
	if NEXT_MAP == LOBBY_TEXT_MAP then
		NEXT_MAP = LOBBY_TEXT_MAP
	end
	if !Hl2c.MAPCHANGE then
		if DISCORD_MapSwitch then DISCORD_MapSwitch(NEXT_MAP) end
	end
	for _, pl in pairs(player.GetAll()) do
		-- Save Kill Stat --
		if !Hl2c.MAPCHANGE then
			if pl and pl.database and pl.setup_achi then 
				SECRET.HL2.REWARD(pl)
				if pl.hadloot != true then
					pl:lootBoxDrop()
					pl.hadloot = true
				end
				pl:databaseAllSave()
				
				SaveKillsStat(pl)
				Player_PermaPoint_Save(pl)
			end
		end
		
		local plInfo = {}
		local plWeapons = pl:GetWeapons()
		--SaveKillsStat(pl)
		
		plInfo.predicted_map = NEXT_MAP
		plInfo.health = pl:Health()
		plInfo.armor = pl:Armor()
		plInfo.score = pl:Frags()
		--plInfo.deaths = pl:Deaths()
		plInfo.model = pl.modelName
		
		if plWeapons && #plWeapons > 0 then
			plInfo.loadout = {}
			
			for _, wep in pairs(plWeapons) do
				plInfo.loadout[wep:GetClass()] = {pl:GetAmmoCount(wep:GetPrimaryAmmoType()), pl:GetAmmoCount(wep:GetSecondaryAmmoType())}
			end
		end
		
		file.Write("hl2c_userid_info/hl2c_userid_info_"..pl:UniqueID()..".txt", util.TableToKeyValues(plInfo))
	end
	Hl2c.MAPCHANGE = true
	-- Crash Recovery --
	if game.IsDedicated(true) then
		local savedMap = {}
		
		savedMap.predicted_crash = EXTRA_MAP
		
		file.Write("hl2c_data/hl2c_crash_recovery.txt", util.TableToKeyValues(savedMap))
	end
	-- End --
	
	// Switch maps
	timer.Simple(12.0,function()
		game.ConsoleCommand("changelevel "..EXTRA_MAP.."\n")
	end)
end



// Called automatically or by the console command
function GM:NextMap()
	if changingLevel then
		return
	end
	/*
	for k, v in pairs(player.GetAll()) do
		
		SaveKillsStat(pl)
		
	end
	*/
	changingLevel = true
	
	-- umsg.Start("NextMap", RecipientFilter():AddAllPlayers())
	-- umsg.Long(CurTime())
	-- umsg.End()
	net.Start( "Push_MapTimer" )
		net.WriteDouble( CurTime() )
		net.WriteFloat(NEXT_MAP_TIME)
		net.WriteString("Nextmap in ")
	net.Broadcast()
	
	
	if HL2MP_IS_COOP_MAP then 
	
		if GetConVarNumber("hl2c_old_nextmap_timer") == 0 then
			if GetConVarNumber("hl2c_classic") >= 1 then
				timer.Simple(5, function() GAMEMODE:GrabAndSwitch() end) -- New code. After finding out this causes an error sometimes, I had to do this.
			elseif GetConVarNumber("hl2c_classic") == 0 then
				timer.Simple(5, function() GAMEMODE:GrabAndSwitch() end) -- New code. After finding out this causes an error sometimes, I had to do this.
			end
		else
			if GetConVarNumber("hl2c_classic") >= 1 then
				timer.Simple(5, GAMEMODE.GrabAndSwitch) -- Old code. Seems to still work in current GMod. This way appears more stable for some reason.
			elseif GetConVarNumber("hl2c_classic") == 0 then
				timer.Simple(5, GAMEMODE.GrabAndSwitch) -- Old code. Seems to still work in current GMod. This way appears more stable for some reason.
			end
		end
		
	else
	
		if GetConVarNumber("hl2c_old_nextmap_timer") == 0 then
			if GetConVarNumber("hl2c_classic") >= 1 then
				timer.Simple(NEXT_MAP_TIME_CLASSIC, function() GAMEMODE:GrabAndSwitch() end) -- New code. After finding out this causes an error sometimes, I had to do this.
			elseif GetConVarNumber("hl2c_classic") == 0 then
				timer.Simple(NEXT_MAP_TIME, function() GAMEMODE:GrabAndSwitch() end) -- New code. After finding out this causes an error sometimes, I had to do this.
			end
		else
			if GetConVarNumber("hl2c_classic") >= 1 then
				timer.Simple(NEXT_MAP_TIME_CLASSIC, GAMEMODE.GrabAndSwitch) -- Old code. Seems to still work in current GMod. This way appears more stable for some reason.
			elseif GetConVarNumber("hl2c_classic") == 0 then
				timer.Simple(NEXT_MAP_TIME, GAMEMODE.GrabAndSwitch) -- Old code. Seems to still work in current GMod. This way appears more stable for some reason.
			end
		end
		
	end
	
end


// Called automatically and by the console command
function GM:RestartMap()
	
	if changingLevel then
		return
	end
	/*
	for k, v in pairs(player.GetAll()) do
		
		SaveKillsStat(pl)
		
	end
	*/
	changingLevel = true
	
	net.Start( "Push_MapTimer" )
		net.WriteDouble( CurTime() )
		net.WriteFloat(RESTART_MAP_TIME)
		net.WriteString("Restart Map in ")
	net.Broadcast()
	
	for _, pl in pairs(player.GetAll()) do
		if !game.SinglePlayer() and pl.database then
			pl:databaseAllSave()
			
			--pl:SendLua("GAMEMODE.ShowScoreboard = true")
		end
	end
	
	timer.Simple(RESTART_MAP_TIME, function() game.ConsoleCommand( "hl2c_changelevel "..game.GetMap().."\n") end)
end