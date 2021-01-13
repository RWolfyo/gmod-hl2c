
// Called just before the player's first spawn 
function GM:PlayerInitialSpawn(pl)

	timer.Destroy("RestartNoPl")

	net.Start("Theatre_Init")
	net.Send(pl)
	if HL2MP_IS_COOP_MAP then
	DISABLE_ABG_WEAPON = true
	DISABLE_CSNIPER_WEAPON = false
	DISABLE_CUSTOM_WEAPON = false
	DISABLE_GR9_WEAPON = false
	DISABLE_IONCANNON_WEAPON = false
	end
	
	pl.startTime = CurTime()
	pl:SetTeam(TEAM_ALIVE)
	pl:SetName("!player")
	// Half-Life 2: DM mode is enabled
	if HL2MP_IS_COOP_MAP then
		Hl2c.PersonDefaultChatPrint("You're playing Half-Life 2 Campaign in a Half-Life 2: Deathmatch map.",pl)
	end
	
	// MaxPlayers is over 10, warn the player.
	if game.MaxPlayers() > 10 then
		Hl2c.PersonDefaultChatPrint("This server allows more than 10 players! Be warned that the server may lag harshly under these conditions.",pl)
	end
	
	// Send this to clients that Sandbox mode is on
	if GetConVarNumber("hl2c_spawnmenu") >= 1 then
	net.Receive( "open_spawnmenu", function( len, pl )
		--if ( IsValid( pl ) and pl:IsPlayer() ) then
			--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )
			net.Start("SpawnMenuEnabled")
			net.Send(pl)
		--end
	end )
		--net.Start("SpawnMenuEnabled")
		--net.Send(pl)
	end
	
	// In Singleplayer, don't let the players wait for the level to change or restart
	if game.SinglePlayer() then
		NEXT_MAP_TIME = 0
		NEXT_MAP_TIME_CLASSIC = 0
		RESTART_MAP_TIME = 4
	end
	
	// If vehicles are allowed, print a message.
	if ALLOWED_VEHICLE then
		pl:ChatPrint("Press ShowSpare1(F3) to spawn a vehicle.")
	end
	
	// CUSTOM COLLISION CHECK FOR PLAYERS SO YOU CANNOT COLLIDE WITH EACH OTHER OR FRIENDLY NPCS
	// Make sure this only applies in multiplayer!
	if !game.SinglePlayer() then
		pl:SetCustomCollisionCheck(true)
	end
	
	// Grab previous map info
	local plUniqueId = pl:UniqueID()
	if file.Exists("hl2c_userid_info/hl2c_userid_info_"..plUniqueId..".txt", "DATA") then
		pl.info = util.KeyValuesToTable(file.Read("hl2c_userid_info/hl2c_userid_info_"..plUniqueId..".txt", "DATA"))
		
		if pl.info.predicted_map != game.GetMap() || RESET_PL_INFO then
			file.Delete("hl2c_userid_info/hl2c_userid_info_"..plUniqueId..".txt")
			pl.info = nil
		elseif RESET_WEAPONS then
			pl.info.loadout = nil
		end
	end
	
	if GetConVarNumber("hl2c_betatester_trails") >= 1 then
		if !game.SinglePlayer() && table.HasValue(BETA_TESTERS, pl:SteamID()) then
			util.SpriteTrail(pl, 0, Color(255, 255, 255, 255), true, 10, 0, 1, 1 / (5 + 3) * 0.5, "trails/physbeam.vmt")
		end
	end
	
	Hl2c.Send_CheckpointData(pl)
	
	
	netstream.Start(ply, "oc.Waypoints", oc.waypoints)
	netstream.Start(ply, "oc.Pointmsgs", oc.pointmsgs)
	pl.CustomWeapon = {}
	--ply:SetGamemodeTeam( TEAM_ALIVE )
	--ply.lives = DEFAULT_LIVES
end