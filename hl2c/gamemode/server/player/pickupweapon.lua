
// Called when a player tries to pickup a weapon
function GM:PlayerCanPickupWeapon(pl, weapon) 
	-- if pl:Team() != TEAM_ALIVE || (game.SinglePlayer() && weapon:GetClass() == "weapon_stunstick") || (weapon:GetClass() == "weapon_physgun" && !pl:IsAdmin()) then
		-- weapon:Remove()
		-- return false
	-- end
	-- if (true) then return false end
	if PLAYER_IS_CITIZEN then
		weapon:Remove()
		return false
	end
	
	if !pl:IsSuperAdmin() and weapon and weapon:GetClass() == "weapon_physgun" then
		weapon:Remove()
		return false
	end
	
	if pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP then
	
		weapon:Remove()
		return false
	end
	if game.SinglePlayer() && weapon:GetClass() == "weapon_stunstick" then
		weapon:Remove()
		return false
	end
	-- if pl:Team() == 
	
	if SUPER_GRAVITY_GUN && weapon:GetClass() != "weapon_physcannon" then
		weapon:Remove()
		return false
	end
	
	if CD_MAP then
		if weapon:GetClass() == "weapon_stunstick" && pl:HasWeapon(weapon:GetClass()) then
			-- weapon:Remove()
			return false
		end
	else
		if weapon:GetClass() == "weapon_stunstick" && pl:HasWeapon(weapon:GetClass()) then
			return false
		end
		if pl:Team() == TEAM_ALIVE && weapon:GetClass() == "weapon_stunstick" && GetConVarNumber("hl2c_allow_stunstick") == 0 then
			weapon:Remove()
			return false
		end
		if pl:Team() == TEAM_COMBINE && weapon:GetClass() == "weapon_stunstick" then
			
		end
	end
	
	if game.SinglePlayer() && weapon:GetClass() == "weapon_medkit_hl2c" then -- Medkits are stupid in Singleplayer.
		weapon:Remove()
		return false
	end
	
	if GetConVarNumber("hl2c_classic") >= 1 && weapon:GetClass() == "weapon_medkit_hl2c" then -- Medkits weren't in HL2C 1.2.6.
		weapon:Remove()
		return false
	end
	
	if weapon:GetClass() == "weapon_crowbar" && pl:HasWeapon("weapon_crowbar") then
		return false
	end
	
	if weapon:GetClass() == "weapon_physcannon" && pl:HasWeapon("weapon_physcannon") then
		return false
	end
	
	-- if pl:GetAmmoCount(id) > count + (math.Round( (pl:GetCLevel() * count/ (count/2)) - (1 * count / (count/2)) )) then
		-- pl:SetAmmo(count + (math.Round( (pl:GetCLevel() * count/ (count/2)) - (1 * count / (count/2)) )),id)
	-- end 
	if GetConVarNumber("hl2c_ammo_limits") >= 1 then
		if Hl2c.AmmoTypes_WeaponClass[weapon:GetClass()] then
			local class = weapon:GetClass()
			local id = Hl2c.AmmoTypes_WeaponClass_Id[class]
			local count = Hl2c.AmmoTypes_WeaponClass_Max[class]
			if pl:HasWeapon(class) and pl:GetAmmoCount(id) >= count + (math.Round( (((pl:GetCLevel()+ Hl2c.AmmoTypes_ItemClass_Bonus[class]) * count/ (count/2)) ) - (1 * count / (count/2)) )) then
			-- if pl:HasWeapon(class) and pl:GetAmmoCount(id) >= count + (pl:GetCLevel()) then
				return false
			end
		end
	end
	
	return true
end
