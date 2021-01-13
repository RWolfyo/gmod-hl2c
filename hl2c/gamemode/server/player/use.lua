
// Called when a player uses something
function GM:PlayerUse(pl, ent)
	
	-- util.RunNextFrame(function()
	-- if IsValid(ent) and ent:IsOCMerchantProp() and ent.blockeduse == true
	-- then
		-- print("called")
		-- ent:Input( "Use", pl, pl, "" )
		-- return true
	-- end
	-- end)
	--Hl2c.PlayerUse(pl,ent)
	if ( ent:GetName() == "telescope_button" && !game.SinglePlayer() ) then
		return false
	end
	
	if (ent:IsVehicle() && pl.abilityScaler) then
		return false
	end
	
	if !game.SinglePlayer() then
		if GetConVarNumber("hl2c_passenger_seats") >= 1 then
			if ent:GetName() == "hl2c_passenger_seat" then
				pl:SetAllowWeaponsInVehicle(true)
			elseif ent:GetName() != "hl2c_passenger_seat" then
				pl:SetAllowWeaponsInVehicle(false)
			end
		end
	end
	
	return true
end