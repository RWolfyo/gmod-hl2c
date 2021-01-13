// Called when the player attempts to suicide
function GM:CanPlayerSuicide(pl)

	if ( AirboatBattle_Bug ) then
		if game.GetMap() == "d1_canals_11" then
			-- pl:ChatPrint("Suicide Disabled")
			return false
		end
		
		if game.GetMap() == "d1_canals_12" then
			-- pl:ChatPrint("Suicide Disabled")
			return false
		end
		
		if game.GetMap() == "d1_canals_13" then
			-- pl:ChatPrint("Suicide Disabled")
			return false
		end
	end
	
	if pl:Team() == TEAM_COMPLETED_MAP then
		-- pl:ChatPrint("You cannot suicide once you've completed the map.")
		return false
	elseif pl:Team() == TEAM_DEAD then
		-- pl:ChatPrint("This may come as a suprise, but you are already dead.")
		return false	
	elseif pl:Team() == TEAM_COMBINE_DEAD then
		-- pl:ChatPrint("This may come as a suprise, but you are already dead.")
		return false
	end
	
	--if GetConVarNumber("hl2c_classic") == 0 then
		if PLAYER_IS_CITIZEN == true then
			-- pl:ChatPrint("You can only suicide when the HEV Suit is on.")
			return false
		end
	--end
	
	if HL2C_PLAYER_CAN_SUICIDE == false then
		
		return false
	end

	return true
end 