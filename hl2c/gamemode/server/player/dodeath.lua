
// Called when the player dies
function GM:DoPlayerDeath(pl, attacker, dmgInfo)
	--pl.deathPos = pl:EyePos()
	--pl.deathPosBeta = pl:GetPos()
	--print(pl:GetModel())
	-- Stop abilities
	
	Freeman_Die(pl, inflictor, attacker)
	
	
	
	if GAME_IS_HL2 and
	game.GetMap() != "d1_town_05" and
	Hl2c.Ravenholm.Maps[game.GetMap()] and
	pl:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END") != 1
	then
		print("Achievement Failed Ravenholm Beat Only Gravity Gun")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_02 = ".. 1 .." WHERE UniqueID = '".. pl:UniqueID() .."'")
	end
	
	pl:Flashlight(false)
	pl.allammo = pl.allammo or {}
	pl.allammo.primary =pl.allammo.primary or {}
	pl.allammo.secondary = pl.allammo.secondary or {}
	pl:CreateRagdoll()
	if pl:Team() == TEAM_ALIVE then
		for k, v in pairs( pl:GetWeapons() ) do
			if GePrimaryAmmoForWeapon( pl, v ) != -1 then
				pl.allammo.primary[GePrimaryAmmoForWeapon( pl, v )] = pl:GetAmmoCount(GePrimaryAmmoForWeapon( pl, v ))
				-- print("Primary",GePrimaryAmmoForWeapon( pl, v ))
			end
			if GeSecondaryAmmoForWeapon( pl, v ) != -1 then
				pl.allammo.secondary[GeSecondaryAmmoForWeapon( pl, v )] = pl:GetAmmoCount(GeSecondaryAmmoForWeapon( pl, v )) 
				-- print("Secondary",GeSecondaryAmmoForWeapon( pl, v ))
			end
		end
		
		-- table.remove( pl.allammo, -1 )
		-- PrintTable(pl.allammo.primary)
		-- PrintTable(pl.allammo.secondary)
		pl:SetTeam(TEAM_DEAD)
	end
	if pl:Team() == TEAM_COMBINE then
		pl:SetTeam(TEAM_COMBINE_DEAD)
	end
	
	if pl.abilityInvis then
		StopInvisibility(pl)
	end

	if pl.abilityInvinc then
		StopInvincibility(pl)
	end

	if pl.abilityScaler then
		StopScaler(pl)
	end
	
	if pl.abilitySuitCharge then
		StopSuitRecharge(pl)
	end
	
	if pl.abilityHPCharge then
		StopHPRecharge(pl)
	end
	
	-- A timer to when every player responds to someone dying.
	if GetConVarNumber("hl2c_additions") >= 1 && !game.SinglePlayer() then
		timer.Simple(math.random(1, 3), function() HeIsDead() end)
	end
	
	if HL1_CAMPAIGN == false then
		-- if GetConVarNumber("hl2c_allow_respawn") == 0 || game.SinglePlayer() then
			-- if !HL2MP_IS_COOP_MAP then
				-- // Add to deadPlayers table to prevent respawning on re-connect
				-- if !table.HasValue(deadPlayers, pl:UniqueID()) then
					-- table.insert(deadPlayers, pl:UniqueID())
				-- end
			-- end
		-- end
	end
	
	if !HL2MP_IS_COOP_MAP then
		pl:RemoveVehicle()
	end

	
	
	
	if HL1_CAMPAIGN == false then
		-- if GetConVarNumber("hl2c_allow_respawn") == 0 || game.SinglePlayer() then
			-- if !HL2MP_IS_COOP_MAP then
				-- if pl:Team() == TEAM_ALIVE then
				-- pl:SetTeam(TEAM_DEAD)
				-- end
			-- end
		-- end
	end
	pl:AddDeaths(1)
	pl:SetNoTarget(true)
	pl:Flashlight(false)
	local modelNameGender = pl:GetHeadModel()
	-- COMBINE --
	if pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_DEAD and modelNameGender then
	if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
		pl:EmitSound(COMBINE_DEATH_SOUNDS[math.random(1, #COMBINE_DEATH_SOUNDS)], 75, pl.voicePitch, 1, CHAN_USER_BASE)
		-- return
	end
	end
	if CD_MAP or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMBINE then
	-- if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
		pl:EmitSound(COMBINE_DEATH_SOUNDS[math.random(1, #COMBINE_DEATH_SOUNDS)], 75, pl.voicePitch, 1, CHAN_USER_BASE)
		-- pl:EmitSound(COMBINE_DEATH_SOUNDS[math.random(1, #COMBINE_DEATH_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		-- pl:EmitSound(COMBINE_DEATH_SOUNDS[math.random(1, #COMBINE_DEATH_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		-- print("Working Death Sound of Combine in Team Combine")
		-- return
	-- end
	end
	-- COMBINE --
	
end