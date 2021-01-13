
DEAD_RESPAWN_TIME = 15
function player_initdeath( pl, wep, killer )
	net.Start("Theatre_Open")
	net.Send(pl)
	pl:SetNoTarget(true)
	pl:Flashlight(false)
	if pl:Team() == TEAM_ALIVE then

		pl:SetTeam(TEAM_DEAD)

	end
	table.insert(deadPlayers, pl:UniqueID())
	if pl:Team() == TEAM_COMBINE then
		pl:SetTeam(TEAM_COMBINE_DEAD)
	end
	if pl:Team() == TEAM_COMBINE_DEAD then
		net.Start( "Player_Died")
			
			net.WriteDouble( CurTime() )
			net.WriteFloat( DEAD_RESPAWN_TIME )
		net.Send(pl)
		
		net.Start( "Player_Spectate")
			net.WriteEntity(pl)
		net.Send(pl)
		-- pl:StripWeapons()
	end
	if pl:Team() == TEAM_DEAD then
		net.Start( "Player_Died")
			
			net.WriteDouble( CurTime() )
			net.WriteFloat( DEAD_RESPAWN_TIME )
		net.Send(pl)
		
		net.Start( "Player_Spectate")
			net.WriteEntity(pl)
		net.Send(pl)
		-- pl:StripWeapons()
	end
	timer.Simple(3, function()
		if IsValid(pl) and (pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP ) then
			pl:Spawn()
			pl.AllowSpectating = true
			pl.SpecID = 1
			pl.SpecType = 5
			pl:Spectate( pl.SpecType )
			pl:SpectateEntity( ents.FindByClass("info_player_*")[1] )
			pl:SetNoTarget(true)
			pl:Flashlight(false)
		end
	end)
	
	if IsValid(pl) and (pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP) then
		pl.SpecID = 1
		pl.SpecType = 5
		pl:Spectate( pl.SpecType )
		pl:SpectateEntity( ents.FindByClass("info_player_*")[1] )
	end
	
	timer.Create( pl:UniqueID().."_Respawn_Dead", DEAD_RESPAWN_TIME, 1, function()
	--GAMEMODE:HL2CForceRespawn()
		if IsValid(pl) && pl:Team() == TEAM_DEAD and table.HasValue(deadPlayers, pl:UniqueID()) then
			pl:SetTeam(TEAM_ALIVE)
			if table.HasValue(deadPlayers, pl:UniqueID()) then
				table.RemoveByValue(deadPlayers,pl:UniqueID() )
			end
			pl:UnSpectate()
			pl.AllowSpectating = false
			pl:Spawn()
			pl:SetNoTarget(false)
			pl:UnSpectate()
			
			--print( pl:Nick().." Spawning Back." ) 
		end
		if IsValid(pl) && pl:Team() == TEAM_COMBINE_DEAD and table.HasValue(deadPlayers, pl:UniqueID()) then
			pl:SetTeam(TEAM_COMBINE)
			if table.HasValue(deadPlayers, pl:UniqueID()) then
				table.RemoveByValue(deadPlayers,pl:UniqueID() )
			end
			pl:UnSpectate()
			pl.AllowSpectating = false
			pl:Spawn()
			pl:SetNoTarget(false)
			pl:UnSpectate()
			--print( pl:Nick().." Spawning Back." ) 
		end
		
	end )
	if IsValid(pl) and IsValid(pl.pet) and
	pl.petalive == true
	then
		Hl2c.PetRemove(pl.pet)
	end
	
	
end
hook.Add( "PlayerDeath", "player_initdeath", player_initdeath )



function GM:PlayerSilentDeath(pl)
	if IsValid(pl) and IsValid(pl.pet) and
	pl.petalive == true
	then
		Hl2c.PetRemove(pl.pet)
	end
	pl:Flashlight(false)
	player_initdeath(pl)
end

function GM:PlayerDeathThink(pl)
	-- PlayerInSpectate(pl)
	pl:Flashlight(false)
end