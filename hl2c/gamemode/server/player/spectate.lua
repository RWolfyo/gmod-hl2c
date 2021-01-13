
function PlayerInSpectate( pl )
	Aliveplayers = team.GetPlayers( TEAM_ALIVE )
	Combineplayers = team.GetPlayers( TEAM_COMBINE )
	-- PrintMessage(HUD_PRINTCONSOLE,tostring(ents.FindByClass("info_player_*")[1]))
	pl:SetNoTarget(true)
	pl:Flashlight(false)
	if IsValid(pl) and pl:Team() == TEAM_COMBINE_DEAD then
	
		if #Combineplayers <= 0 then
			pl:SpectateEntity( ents.FindByClass("info_player_*")[1] )
			pl:GetViewEntity():GetPos()
			return
		end
		if pl:KeyPressed( IN_JUMP ) then
			--pl.SpecType = pl.SpecType + 1
			if pl.SpecType == 4 then pl:Spectate( pl.SpecType ) pl.SpecType = 5 --end
			elseif pl.SpecType == 5 then pl:Spectate( pl.SpecType ) pl.SpecType = 4 end
		elseif pl:KeyPressed( IN_ATTACK ) then
			if !pl.SpecID then pl.SpecID = 1 end
			pl.SpecID = pl.SpecID + 1
			if pl.SpecID > #Combineplayers then pl.SpecID = 1 end
			pl:SpectateEntity( Combineplayers[ pl.SpecID ] )
			pl:SetPos( Combineplayers[ pl.SpecID ]:GetPos() )
			net.Start( "Player_Spectate")
				net.WriteEntity(Combineplayers[ pl.SpecID ])
			net.Send(pl)
		elseif pl:KeyPressed( IN_ATTACK2 ) then
			if !pl.SpecID then pl.SpecID = 1 end
			pl.SpecID = pl.SpecID - 1
			if pl.SpecID <= 0 then pl.SpecID = #Combineplayers end
			pl:SpectateEntity( Combineplayers[ pl.SpecID ] )
			pl:SetPos( Combineplayers[ pl.SpecID ]:GetPos() )
			net.Start( "Player_Spectate")
				net.WriteEntity(Combineplayers[ pl.SpecID ])
			net.Send(pl)
		end
		pl:GetViewEntity():GetPos()
	
	end
	if IsValid(pl) and ( pl:Team() == TEAM_DEAD || pl:Team() == TEAM_COMPLETED_MAP ) then
		
		if #Aliveplayers <= 0 then
			pl:SpectateEntity( ents.FindByClass("info_player_*")[1] )
			pl:GetViewEntity():GetPos()
			return
		end
		if pl:KeyPressed( IN_JUMP ) then
			--pl.SpecType = pl.SpecType + 1
			if pl.SpecType == 4 then pl:Spectate( pl.SpecType ) pl.SpecType = 5 --end
			elseif pl.SpecType == 5 then pl:Spectate( pl.SpecType ) pl.SpecType = 4 end
		elseif pl:KeyPressed( IN_ATTACK ) then
			if !pl.SpecID then pl.SpecID = 1 end
			pl.SpecID = pl.SpecID + 1
			if pl.SpecID > #Aliveplayers then pl.SpecID = 1 end
			pl:SpectateEntity( Aliveplayers[ pl.SpecID ] )
			pl:SetPos( Aliveplayers[ pl.SpecID ]:GetPos()  )
			net.Start( "Player_Spectate")
				net.WriteEntity(Aliveplayers[ pl.SpecID ])
			net.Send(pl)
		elseif pl:KeyPressed( IN_ATTACK2 ) then
			if !pl.SpecID then pl.SpecID = 1 end
			pl.SpecID = pl.SpecID - 1
			if pl.SpecID <= 0 then pl.SpecID = #Aliveplayers end
			
			pl:SpectateEntity( Aliveplayers[ pl.SpecID ] )
			pl:SetPos( Aliveplayers[ pl.SpecID ]:GetPos()  )
			net.Start( "Player_Spectate")
				net.WriteEntity(Aliveplayers[ pl.SpecID ])
			net.Send(pl)
		end
		pl:GetViewEntity():GetPos()
	
	end


end
