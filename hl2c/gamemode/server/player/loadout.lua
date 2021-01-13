function Hl2c_DangerAmmo(pl)
	timer.Simple(0.5, function()
		if !IsValid(pl) then return end
		pl:SetAmmo(0,"RPG_Round")
		pl:SetAmmo(0,"AR2AltFire")
		pl:SetAmmo(0,"SMG1_Grenade")
		if pl:GetAmmoCount("bp_small") > 100 then
			pl:SetAmmo(100,"bp_small")
		end
		if pl:GetAmmoCount("bfg_shotgun") > 12 then
			pl:SetAmmo(12,"bfg_shotgun")
		end
		if pl:GetAmmoCount("bp_medium") > 180 then
			pl:SetAmmo(180,"bp_medium")
		end
		if pl:GetAmmoCount("bp_sniper") > 30 then
			pl:SetAmmo(30,"bp_sniper")
		end
		if pl:GetAmmoCount("bp_pulseshotgun") > 60 then
			pl:SetAmmo(60,"bp_pulseshotgun")
		end
		--if game.GetMap() != "gm_flatgrass" then
		--	pl:StripWeapon("weapon_airboatgun_hl2c")
		--end
	end)
	--pl:SetAmmo(0,"AR2")
	if game.GetMap() == "gm_flatgrass" then
	--pl:Give("weapon_airboatgun_hl2c")
	--pl:Give("weapon_csniper_hl2c")
	--pl:Give("weapon_gr9_hl2c")
	--pl:Give("weapon_ioncannon_hl2c")
	end
end

// Called by GM:PlayerSpawn
function GM:PlayerLoadout(pl)
	if pl:Team() == TEAM_COMBINE then return end
	if pl:Team() == TEAM_COMBINE_DEAD then return end
	if pl:Team() == TEAM_COMPLETED_MAP then return end
	if pl:Team() == TEAM_DEAD then return end
	Hl2c.PlayerLoadout(pl)
end


function Hl2c.PlayerLoadout(pl)
	if pl:Team() == TEAM_COMBINE then return end
	if pl:Team() == TEAM_COMBINE_DEAD then return end
	if pl:Team() == TEAM_COMPLETED_MAP then return end
	if pl:Team() == TEAM_DEAD then return end
	if pl:Alive() then else return end
	--timer.Simple(1.5, function()
	--pl:StripWeapon("weapon_gr9_hl2c")
	--pl:StripWeapon("weapon_csniper_hl2c")
	--pl:StripWeapon("weapon_airboatgun_hl2c")
	--pl:StripWeapon("weapon_ioncannon_hl2c")
	--end)
	--if HL2MP_IS_COOP_MAP then
	--timer.Simple(5, function()
	--if !pl:HasWeapon("weapon_medkit_hl2c") then
		--if !PLAYER_IS_CITIZEN then
		--pl:Give("weapon_medkit_hl2c")
		--end
	--end
	--end)
	--end
	-- pl:RemoveAllAmmo()
	-- print(pl.info)
	
	if pl.info && pl.info.loadout then
		pl:RemoveAllAmmo()
		for wep, ammo in pairs(pl.info.loadout) do
			if table.HasValue(WHITELIST_WEAPONS,wep) and !pl:HasWeapon(wep) then
			-- pl:StripAmmo()
			pl:Give(wep,false)
			--Hl2c_DangerAmmo(pl)
			end
		end
		
		
		
		for _, wep in pairs(pl:GetWeapons()) do
			local wepClass = wep:GetClass()
			
			if pl.info.loadout[wepClass] then
				pl:GiveAmmo(tonumber(pl.info.loadout[wepClass][1]), wep:GetPrimaryAmmoType(), false)
				pl:GiveAmmo(tonumber(pl.info.loadout[wepClass][2]), wep:GetSecondaryAmmoType(), false)
				--Hl2c_DangerAmmo(pl)
			end
		end
	elseif startingWeapons && #startingWeapons > 0 then
		for _, wep in pairs(startingWeapons) do
			if table.HasValue(WHITELIST_WEAPONS,wep) and !pl:HasWeapon(wep) then
			-- pl:StripAmmo()
			pl:Give(wep,false)
			-- print(wep)
			end
			--Hl2c_DangerAmmo(pl)
		end

	end
	
	
	// HL2MP Coop Map in use we should give the Rebel kit.
	--if HL2MP_IS_COOP_MAP then
	--	timer.Simple(5, function()
	--	pl:Give("weapon_medkit_hl2c")
	--	end)
	--end
	
	// Lastly give physgun to admins
	-- if GetConVarNumber("hl2c_admin_physgun") >= 1 && pl:IsSuperAdmin() then
		-- if !PLAYER_IS_CITIZEN then
		-- pl:Give("weapon_physgun")
		-- end
	-- end
	if HL2MP_IS_COOP_MAP then
		pl:Give("weapon_medkit_hl2c")
	end
	
	if HL2c_MEDKIT_ALLOW then
		pl:Give("weapon_medkit_hl2c")
	end
	if GAME_IS_EP1 then
		pl:Give("weapon_medkit_hl2c")
	end
	if GAME_IS_EP2 then
		pl:Give("weapon_medkit_hl2c")
	end
	if GAME_IS_EP3 then
		pl:Give("weapon_medkit_hl2c")
	end
	if CD_MAP then
		pl:Give("weapon_medkit_hl2c")
	end
	if METASTASIS_MAP then
		pl:Give("weapon_medkit_hl2c")
	end
	Hl2c_DangerAmmo(pl)
	

	if pl.CustomWeapon && #pl.CustomWeapon > 0 and pl:Team() == TEAM_ALIVE then
		for _, wep in pairs(pl.CustomWeapon) do
			pl:Give(wep,true)
			-- print(wep)
			--Hl2c_DangerAmmo(pl)
		end
	end
	
	if pl.allammo and pl.allammo.primary and #pl.allammo.primary > 0 and pl:Team() == TEAM_ALIVE  then
		for ammoType, ammoCount in pairs(pl.allammo.primary) do
			pl:SetAmmo( ammoCount, ammoType )
		end
	end
	if pl.allammo and pl.allammo.secondary and #pl.allammo.secondary > 0 and pl:Team() == TEAM_ALIVE  then
		for ammoType, ammoCount in pairs(pl.allammo.secondary) do
			pl:SetAmmo( ammoCount, ammoType )
		end
	end
end