// Player just picked up or was given a weapon
////////////////////////////////////////////////
// WEAPON SHARE SYSTEM                        //
////////////////////////////////////////////////
// Desc: If someone pick up a weapon then do  //
//       weapon share with all players and    //
//       save the given weapons to a table    //
//       for next player spawn get the shared //
//       weapons. (starting weapons table     //
//       and given weapons table).            //
////////////////////////////////////////////////
function GM:WeaponEquip(weapon)
	--print(weapon:GetClass())
	
	local wep = weapon

	util.RunNextFrame(function()
		if not IsValid(wep) then
			return
		end

		local ply = wep:GetOwner()
		if IsValid(ply) then

			if ply:GetActiveWeapon() != wep:GetClass() then
			-- ply:SelectWeapon(wep:GetClass())
			-- ply:EmitSound("Player.PickupWeapon")
			-- print("Equiped")
			end
			
			if !(table.HasValue(startingWeapons, wep:GetClass())) then
				if table.HasValue(WHITELIST_WEAPONS, wep:GetClass()) then
					table.insert(startingWeapons, wep:GetClass())
				end
			end
			
			for _, pl in pairs(player.GetAll()) do
				if IsValid(pl) and
				!pl:IsBot() and
				(pl:Alive() and pl:Team() == TEAM_ALIVE ) && pl.givenWeapons and
				!table.HasValue(pl.givenWeapons, wep:GetClass()) and
				table.HasValue(WHITELIST_WEAPONS, wep:GetClass() ) and
				!pl:HasWeapon(wep:GetClass()) then
					pl:Give(wep:GetClass(),true)
					--print("[hl2c Shared Weapon]:",wep:GetClass())
					table.insert(pl.givenWeapons, wep:GetClass())
				end
			end
			
			// Save Custom Weapons that are not HL2 Default Weapons
			if !table.HasValue(WHITELIST_WEAPONS, wep:GetClass()) then
				
				if (IsValid(ply) && ply.CustomWeapon) && !table.HasValue(ply.CustomWeapon, wep:GetClass())  then
					
					--print("[hl2c Custom Weapon]:",ply:Nick(),wep:GetClass())
					-- for _, pl in pairs(player.GetAll()) do
						-- if ply == pl then
							--print("[hl2c Custom Weapon]:",ply:Nick(),weapon:GetClass())
							-- table.insert(pl.CustomWeapon, wep:GetClass() )
						-- end
					-- end
					table.insert(ply.CustomWeapon, wep:GetClass())
				end
			end
			
		end
	end)
--[[ 	if weapon && IsValid(weapon) && weapon:GetClass() then
		timer.Simple(1.5, function()
			if weapon and 
			IsValid(weapon) and
			isstring(weapon:GetClass()) and
			IsValid(weapon:GetOwner()) and 
			weapon:GetOwner() != NULL and
			weapon:GetOwner():IsPlayer()
			then
				ply = weapon:GetOwner()
				
				--print("[hl2c] Equiped Weapon:",ply:Nick())
			end
		end)
		--print(weapon:GetClass())
		if !(table.HasValue(startingWeapons, weapon:GetClass())) then
			if table.HasValue(WHITELIST_WEAPONS, weapon:GetClass()) then
				table.insert(startingWeapons, weapon:GetClass())
				for k, v in pairs(startingWeapons) do
					--print("[hl2c Starting Weapons:]",startingWeapons[k])
				end
			end
		end
		
		for _, pl in pairs(player.GetAll()) do
			if IsValid(pl) then
				if !pl:IsBot() then
					if (pl:Alive() and pl:Team() == TEAM_ALIVE ) && pl.givenWeapons then
						if !table.HasValue(pl.givenWeapons, weapon:GetClass()) then
							if table.HasValue(WHITELIST_WEAPONS, weapon:GetClass() ) then
								timer.Simple(1, function()
									if (IsValid(pl) && pl:Alive() && pl:Team() == TEAM_ALIVE ) && IsValid(weapon) && !pl:HasWeapon(weapon:GetClass()) then
										pl:Give(weapon:GetClass(),true)
										--print("[hl2c Shared Weapon]:",weapon:GetClass())
										table.insert(pl.givenWeapons, weapon:GetClass())
									end
								end)
							end
						end
					end
				end
			end
			if  pl.givenWeapons then
				--for k, v in pairs(pl.givenWeapons) do
					--print("GivenWeapons:",v)
				--end
			end
		end
		
		--Save Custom Weapons if we pick it up.
		timer.Simple(1.6,function()
			
			if ( 
			( ply != NULL and IsValid(ply) ) 
			and ( ply.CustomWeapon != NULL and 
			ply.CustomWeapon != nil and 
			IsValid(weapon) and
			weapon:GetClass() != NULL and
			ply:Team() == TEAM_ALIVE) 
			) then
				
				if (ply != NULL && IsValid(ply) && weapon:GetClass() != NULL) && !table.HasValue(WHITELIST_WEAPONS, weapon:GetClass()) then
					
					if (ply != NULL && IsValid(ply)) && !table.HasValue(ply.CustomWeapon, weapon:GetClass())  then
						
						--print("[hl2c Custom Weapon]:",ply:Nick(),weapon:GetClass())
						for _, pl in pairs(player.GetAll()) do
							if ply == pl then
								--print("[hl2c Custom Weapon]:",ply:Nick(),weapon:GetClass())
								table.insert(pl.CustomWeapon, weapon:GetClass() )
							end
						end
						table.insert(ply.CustomWeapon, weapon:GetClass())
					end
				end
				
				
			end
			
		end)
		
	end ]]
	
	
end