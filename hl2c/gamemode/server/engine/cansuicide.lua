hook.Add("CanPlayerSuicide", "Hl2c_CanPlayerSuicide_", function( pl )
	
	if IsValid(pl) and pl:InVehicle() then
		return false
	end
	
end)