
// Called when a player uses their flashlight
function GM:PlayerSwitchFlashlight(pl, on)
	--return true
	--Hl2c.PlayerSwitchFlashlight(pl, on)
	if PLAYER_IS_CITIZEN or (pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP) then
		return false
	end
	
	if (pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_COMBINE) then
		
		return true
	end

	
	// Replaced the old Think way of making the flashlight not work when HEV is off.
	if GetConVarNumber("hl2c_classic") >= 1 then
		return true
	elseif GetConVarNumber("hl2c_classic") == 0 then
		if pl:IsSuitEquipped() == false then
			return false
		end
	end
	
	return true
	
end