
function GM:PlayerCanPickupItem( pl, item)
	if PLAYER_IS_CITIZEN and item:GetClass() == "item_suit" then return true end
	if !PLAYER_IS_CITIZEN and item:GetClass() == "item_suit" then return false end
	
	if pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP then
	
		item:Remove()
		return false
	end
	if GetConVarNumber("hl2c_ammo_limits") >= 1 then
		if Hl2c.AmmoTypes_ItemClass[item:GetClass()] then
			local class = item:GetClass()
			local id = Hl2c.AmmoTypes_ItemClass_Id[item:GetClass()]
			local count = Hl2c.AmmoTypes_ItemClass_Max[item:GetClass()]
			if pl:GetAmmoCount(id) >= count + (math.Round( (((pl:GetCLevel()+ Hl2c.AmmoTypes_ItemClass_Bonus[class]) * count/ (count/2)) ) - (1 * count / (count/2)) )) then
			-- if pl:GetAmmoCount(id) >= count + (pl:GetCLevel()) then
				return false
			end
		end
	end
	return true
end
