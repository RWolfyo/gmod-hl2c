-- local hpregen_rank1_delay = 3
-- local hpregen_rank5_delay = 2
-- local hpregen_rank6_delay = 1.5
-- local hpregen_rank7_delay = 1
-- local hpregen_rank8_delay = 0.5

-- local hpregen_rank1_curtime = 3
-- local hpregen_rank2_curtime = 3
-- local hpregen_rank3_curtime = 3
-- local hpregen_rank4_curtime = 3
-- local hpregen_rank5_curtime = 2
-- local hpregen_rank6_curtime = 1.5
-- local hpregen_rank7_curtime = 1
-- local hpregen_rank8_curtime = 0.5

// Called every frame 
function GM:Think()
	self:CheckStuckScenes()
	if SUPER_GRAVITY_GUN then
		for _, ent in pairs(ents.FindByClass("weapon_physcannon")) do
			if IsValid(ent) then
				ent:SetSkin(1)
			end
		end
	end
	
	Freeman_Think()
	
	
	if string.find(game.GetMap(),"d2_coast") then
	
		ANTLION_FARM = false
	end
	if string.find(game.GetMap(),"d2_prison") then
	
		ANTLION_FARM = false
	end
	if HL2MP_IS_COOP_MAP then else
		-- Hl2c.Diff_Selected = 14
		-- print(difficulty)
		if Hl2c.Diff_Selected != -1 then
			
			if Hl2c.Diff_Selected == 0 then
				difficulty = 1
			elseif Hl2c.Diff_Selected == 1 then
				difficulty = 3 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			elseif Hl2c.Diff_Selected == 2 then
				difficulty = 10 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			
			-- if Hl2c.Diff_Selected == 3 then
				-- difficulty = 7  + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			-- end
			
			-- if Hl2c.Diff_Selected == 4 then
				-- difficulty = 10 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			-- end
			-- -- 5 will be INFERNO not released yet ( Ultra Hard )
			-- if Hl2c.Diff_Selected == 5 then 
				-- difficulty = 20 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			-- end
			-- if Hl2c.Diff_Selected > 5 then -- Monster Level
				-- difficulty = ((Hl2c.Diff_Selected - 3) * 10) + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			else
				difficulty = 3 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) )
			end
		else
			difficulty = 0.7
		end 
	end
	
	for _, npc in pairs(ents.FindByClass("npc_*")) do
		if IsValid(npc) and npc:IsNPC() and npc["PlayerAttackMe"] then
			for key,value in pairs(npc["PlayerAttackMe"]) do
				if IsValid(key) and key:IsPlayer() and value and value == true and key["TargetBar"] and key["TargetBar"][npc:EntIndex()] then
					-- xpcall(Hl2c.TargetBarUpdate(key,npc),catch)
					Hl2c.TargetBarUpdate(key,npc)
				end
			end
		end
		if IsValid(npc) and npc:GetClass() and npc:GetClass() == "weapon_physcannon" and SUPER_GRAVITY_GUN and npc:GetSkin() != 1 then
			npc:SetSkin(1)
			-- npc:SetSkin(1)
		end
	end
	
	// Holiday is Christmas!
	if (os.date("%m", os.time()) == "12" && os.date("%d", os.time()) >= "20") then
		if GetConVarNumber("hl2c_holiday") != "1" then
			-- game.ConsoleCommand("hl2c_holiday 1\n")
		end
	else
		if GetConVarNumber("hl2c_holiday") != "0" then
			-- game.ConsoleCommand("hl2c_holiday 0\n")
		end
	end
	
	// Classic mode never had these commands.
	if GetConVarNumber("hl2c_classic") >= 1 then
		game.ConsoleCommand("hl2c_additions 0\n")
		game.ConsoleCommand("hl2c_allow_respawn 0\n")
		game.ConsoleCommand("hl2c_allow_stunstick 0\n")
		game.ConsoleCommand("hl2c_drop_weapon_on_death 0\n")
		game.ConsoleCommand("hl2c_passenger_seats 0\n")
		game.ConsoleCommand("hl2c_hev_hands 0\n")
		game.ConsoleCommand("hl2c_playermodel_restrictions 1\n")
		game.ConsoleCommand("hl2c_old_nextmap_timer 1\n")
		game.ConsoleCommand("hl2c_use_old_umsg 1\n")
		game.ConsoleCommand("hl2c_ammo_limits 0\n")
		
		NEW_VEHICLE_SPAWN = false
		
		for _, pl in pairs(player.GetAll()) do
			if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
				umsg.Start("ClassicMode", pl)
				umsg.End()
			elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
				net.Start("ClassicMode")
				net.Send(pl)
			end
		end
	end
	
	-- if GetConVarNumber("hl2c_classic") == 0 then
		
		// Is player a citizen?
		for _, pl in pairs( player.GetAll() ) do
			if pl.setup_achi then else break end
			Hl2c.BanListCast(pl)
			Freeman_Think_Ply(pl)
			if pl and pl:Team() == TEAM_COMPLETED_MAP then
				pl:GodEnable()
			end
			-- if pl and pl.setup_achi and pl:SteamID() == "STEAM_0:0:64523810" then
				-- pl:AddFreeman("EP2")
			-- end
			SECRET.HL2.SHOULDGETREWARD(pl)
			if GAME_IS_EP2 and
			pl:GetNWInt("customcounter_6") >= 333
			then
				Hl2c.EP2_GRUB_ACH(pl)
			end
			Hl2c.EP2_BREAK_ALLWEBS(pl)
			Hl2c.EP2_FIND_ALLRADARCACHES(pl)
			Hl2c.EP2_KILL_GRAVEROBBER(pl,true)
			Hl2c.GEN_BEAT_ALLEP2(pl)
			Hl2c.GEN_BEAT_ALLEP1(pl)
			Hl2c.GEN_BEAT_ALLHL2(pl)
			Hl2c.HL2_FIND_ALLLAMBDAS(pl)
			Hl2c.LT_SECRET_ACH(pl)
			
			if pl:Team() == TEAM_ALIVE then
				pl.hpreg = pl.hpreg or 0
				-- if pl:Health() + ( pl:GetNWInt("SHOP_UPGRADE_003") / CurrentFPS() ) >= pl:GetMaxHealth() then
				
				if pl:GetNWInt("COMBAT.REG") <= 0 then
					
					
					
					if pl:Health() + pl.hpreg >= pl:GetMaxHealth() then
						pl:SetHealth(pl:GetMaxHealth())
					else
						if pl.hpreg >= 1 then
							-- print(pl.hpreg)
							pl:SetHealth( pl:Health() + math.Round(pl.hpreg,0) )
							pl.hpreg = 0
						else
						
							pl.hpreg = pl.hpreg + ( ( pl:GetNWInt("LifeRegen") ) / CurrentFPS() )
						end
						
					end
					pl:SetNWInt("COMBAT.REG",0)
					
				else
					pl:SetNWInt("COMBAT.REG", pl:GetNWInt("COMBAT.REG") -1)
				end
			end
			
			if pl:IsBot() then return end
			
			if pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMPLETED_MAP and pl.AllowSpectating == true then
				PlayerInSpectate(pl)
			end	
			
			if pl:Team() == TEAM_ALIVE && !PLAYER_IS_CITIZEN || pl:Team() == TEAM_ALIVE && PLAYER_IS_CITIZEN != true then
			
				if pl.abilityInvinc && !game.SinglePlayer() then
					--pl:SetPlayerColor(Vector(0, 0, 0))
				-- elseif table.HasValue(BETA_TESTERS, pl:SteamID()) && !game.SinglePlayer() then
					--pl:SetPlayerColor(Vector(0.3, 0, 1))
				-- elseif pl:IsAdmin() && !table.HasValue(BETA_TESTERS, pl:SteamID()) && !game.SinglePlayer() then
					--pl:SetPlayerColor(Vector(0, 0.3, 0))
				else
					if (os.date("%m", os.time()) == "12" && os.date("%d", os.time()) >= "20") then
						--pl:SetPlayerColor(Vector(1, 0, 0))
					else
						--pl:SetPlayerColor(Vector(1, 0.5, 0))
					end
				end
				
				if !pl:IsSuitEquipped() then
					pl:EquipSuit()
				end
				
				if HL1_CAMPAIGN == true then
					GAMEMODE:SetPlayerSpeed(pl, 320, 320)
				end
				
			elseif pl:Team() == TEAM_ALIVE && PLAYER_IS_CITIZEN || pl:Team() == TEAM_ALIVE && PLAYER_IS_CITIZEN != false then
			
				--pl:SetPlayerColor(Vector(0, 0.5, 1))
				
				if pl:IsSuitEquipped() then
					pl:RemoveSuit()
				end
				
				if GetConVarNumber("hl2c_classic") == 0 then
					if HL1_CAMPAIGN == false then
						GAMEMODE:SetPlayerSpeed(pl, 140, 140)
					elseif HL1_CAMPAIGN == true then
						GAMEMODE:SetPlayerSpeed(pl, 320, 320)
					end
				end
				
			end
		-- end
	-- elseif GetConVarNumber("hl2c_classic") >= 1 then
		// Is player a citizen?
		--for _, pl in pairs(player.GetAll()) do
			--pl:SetPlayerColor( Vector( 1,0.5,0 ) )
		--end
	-- end
	
		
	-- end
	
	// For each player
		if IsValid(pl) and ( pl:Team() == TEAM_COMBINE or pl:Team() == TEAM_COMBINE_DEAD or pl:Team() == TEAM_COMBINE or pl:Team() == TEAM_COMPLETED_MAP ) then
			pl:SetNoTarget(true)
		end
		
		if !pl:Alive() || pl:Team() == TEAM_DEAD then
			return
		end
		

		
		if pl:Alive() and pl:Team() == TEAM_ALIVE and IsValid(pl.pet) and pl.petalive then
			pl:Pet_HUD_UPDATE()
			-- DbgPrint("Print")
		end
		if HL2C_COMBINE_EVENT and ( #team.GetPlayers( TEAM_ALIVE ) + #team.GetPlayers( TEAM_DEAD ) ) > 0 then
			if HL2C_COMBINE_EVENT and ( #team.GetPlayers( TEAM_ALIVE ) + #team.GetPlayers( TEAM_DEAD ) ) <= ( #team.GetPlayers( TEAM_COMBINE ) + #team.GetPlayers( TEAM_COMBINE_DEAD ) ) then
				HL2C_COMBINE_JOIN = false
				-- DbgPrint("Combine Loyal Off")
			end
			if HL2C_COMBINE_EVENT and ( #team.GetPlayers( TEAM_ALIVE ) + #team.GetPlayers( TEAM_DEAD ) ) > ( #team.GetPlayers( TEAM_COMBINE ) + #team.GetPlayers( TEAM_COMBINE_DEAD ) ) then
				HL2C_COMBINE_JOIN = true
				-- DbgPrint("Combine Loyal On")
			end
		end
		if HL2C_COMBINE_EVENT and ( #team.GetPlayers( TEAM_ALIVE ) + #team.GetPlayers( TEAM_DEAD ) ) == 0 and game.GetMap() != "gm_construct" then
			
			if pl:Team() == TEAM_COMBINE then
				pl:SetTeam(TEAM_DEAD)
				pl:KillSilent()
				-- pl:Spawn()
				-- pl:PrintMessage(HUD_PRINTCONSOLE,"[hl2c] Auto-Balance fast Switched back to Rebel")
				Hl2c.PersonDefaultChatPrint("[hl2c] Auto-Balance fast Switched back to Rebel",pl)
			end
			if pl:Team() == TEAM_COMBINE_DEAD then
				pl:SetTeam(TEAM_DEAD)
				-- pl:PrintMessage(HUD_PRINTCONSOLE,"[hl2c] Auto-Balance fast Switched back to Rebel")
				Hl2c.PersonDefaultChatPrint("[hl2c] Auto-Balance fast Switched back to Rebel",pl)
			end
			
			
		
		end

		
		// Give them weapons they don't have
		--[[
		for _, pl2 in pairs(player.GetAll()) do
		
			if !pl2:IsBot() then 
				if !pl:IsBot() then
		/*
			if pl != pl2 && pl2:Alive() && !pl:InVehicle() && !pl2:InVehicle() && pl2:GetActiveWeapon():IsValid() && !pl:HasWeapon(pl2:GetActiveWeapon():GetClass()) && !table.HasValue(pl.givenWeapons, pl2:GetActiveWeapon():GetClass()) then
				if table.HasValue(BLACKLIST_WEAPONS, pl2:GetActiveWeapon():GetClass() ) == false then
				pl:Give(pl2:GetActiveWeapon():GetClass())
				table.insert(pl.givenWeapons, pl2:GetActiveWeapon():GetClass())
				end
			end
		*/	
					if pl != pl2 && ( pl:Alive() && pl2:Alive() ) && ( !pl:InVehicle() && !pl2:InVehicle() ) && pl2:GetActiveWeapon():IsValid() then
					
						if !table.HasValue(pl.givenWeapons, pl2:GetActiveWeapon():GetClass()) then
							if table.HasValue(WHITELIST_WEAPONS, pl2:GetActiveWeapon():GetClass() ) then
								DbgPrint(pl2:GetActiveWeapon():GetClass())
								pl:Give(pl2:GetActiveWeapon():GetClass())
								table.insert(pl.givenWeapons, pl2:GetActiveWeapon():GetClass())
							end
						end
			
					end
				end
			end
		
		end
		]]--
		

		// Sprinting and water level
		if (false) then
		
			if isnumber(pl.nextEnergyCycle) and pl.nextEnergyCycle < CurTime() then
				if !pl:InVehicle() && ((pl:GetVelocity():Length() > 315 && pl:KeyDown(IN_SPEED))) then
					pl.energy = pl.energy - 1

				elseif pl:WaterLevel() == 3 && pl.energy > 0 then
					pl.energy = pl.energy - .5
				elseif pl.energy < 100 then
					pl.energy = pl.energy + .5
				end
				umsg.Start("UpdateEnergy", pl)
				umsg.Short(pl.energy)
				umsg.End()
				-- DbgPrint("Working?")
				pl.nextEnergyCycle = CurTime() + 0.1
			end
		
		elseif (true) then
			if isnumber(pl.nextEnergyCycle) and pl.nextEnergyCycle < CurTime() then
				if !pl:InVehicle() && ((pl:GetVelocity():Length() > 315 && pl:KeyDown(IN_SPEED))) then
					if PLAYER_IS_CITIZEN == true then
					-- elseif HL2MP_IS_COOP_MAP == true then
					elseif HL1_CAMPAIGN == true then
					else
						pl.energy = pl.energy - 1
						-- print(true)
					end

				elseif pl:WaterLevel() == 3 && pl.energy > 0 then
					pl.energy = pl.energy - .5
				-- elseif !HL2MP_IS_COOP_MAP && pl:FlashlightIsOn() && pl.energy > 0 then
					-- pl.energy = pl.energy - .2
				elseif pl.energy < 100 then
					pl.energy = pl.energy + .5
				end
				
				umsg.Start("UpdateEnergy", pl)
				umsg.Short(pl.energy)
				umsg.End()
				
				if pl:Alive() and pl.flashenergy and pl:FlashlightIsOn() and pl.flashenergy > 0 and HL2MP_IS_COOP_MAP != true then 
					pl.flashenergy = pl.flashenergy - .5
				elseif pl.flashenergy and pl.flashenergy < 100 then
					pl.flashenergy = pl.flashenergy + .5
				end
				umsg.Start("Updateflashenergy", pl)
				umsg.Short(pl.flashenergy)
				umsg.End()
				
				pl.nextEnergyCycle = CurTime() + 0.1
			end
			
			if isnumber(pl.abilityCycle) and pl.abilityCycle < CurTime() then
				if pl.abilityInvis && pl.abilityEnergy > 0 then
					pl.abilityEnergy = pl.abilityEnergy - .35
				elseif pl.abilityInvinc && pl.abilityEnergy > 0 then
					pl.abilityEnergy = pl.abilityEnergy - .65
				elseif pl.abilityScaler && pl.abilityEnergy > 0 then
					pl.abilityEnergy = pl.abilityEnergy - .25
				elseif pl.abilitySuitCharge && pl.abilityEnergy > 0 then
					pl.abilityEnergy = pl.abilityEnergy - .40
					if pl:Armor() < 100 then
						pl:SetArmor(pl:Armor() + 1)
					end
				elseif pl.abilityHPCharge && pl.abilityEnergy > 0 then
					pl.abilityEnergy = pl.abilityEnergy - .40
					if pl:Health() < 100 then
						pl:SetHealth(pl:Health() + 1)
					end
				elseif pl.abilityEnergy < 100 then
					pl.abilityEnergy = pl.abilityEnergy + .2
				end
				
				pl.abilityCycle = CurTime() + 0.1
			end
			
		end
		
		// Now check if they have enough energy 
		if isnumber(pl.energy) and pl.energy < 2 then
			if !pl.sprintDisabled then
				pl.sprintDisabled = true
				GAMEMODE:SetPlayerSpeed(pl, 190, 190)
			end
			
			// Now remove health if underwater
			if pl:WaterLevel() == 3 && !pl:HasGodMode() && pl.nextSetHealth < CurTime() then
				pl.nextSetHealth = CurTime() + 1
				pl:SetHealth(pl:Health() - 10)
				
				if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
					umsg.Start("DrowningEffect", pl)
					umsg.End()
				elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
					net.Start("DrowningEffect")
					net.Send(pl)
				end
				
				if pl:Alive() && pl:Health() < 1 then
					pl:Kill()
				else
					pl.healthRemoved = pl.healthRemoved + 10
				end
			end				
		elseif isnumber(pl.energy) and pl.energy >= 15 && pl.sprintDisabled then
			pl.sprintDisabled = false
			GAMEMODE:SetPlayerSpeed(pl, 190, 320)
		end
		
		-- if GetConVarNumber("hl2c_classic") == 0 then
		if (true) then
			-- if !HL2MP_IS_COOP_MAP then
				// Flashlight should run out eventually
				if isnumber(pl.flashenergy) and pl.flashenergy < 2 && !pl.flashlightDisabled then
					pl.flashlightDisabled = true
				elseif isnumber(pl.flashenergy) and pl.flashenergy >= 15 && pl.flashlightDisabled then
					pl.flashlightDisabled = false
				end
				
				// Turn the flashlight off
				if pl.flashlightDisabled && pl:FlashlightIsOn() then
					pl:Flashlight(false)
				end
			-- end
			-- DbgPrint("working?")
		end
		
		// Give back health if we can
		if isnumber(pl.nextSetHealth) && pl:WaterLevel() <= 2 && pl.nextSetHealth < CurTime() && pl.healthRemoved > 0 then
			pl.nextSetHealth = CurTime() + 1
			pl:SetHealth(pl:Health() + 10)
			pl.healthRemoved = pl.healthRemoved - 10
		end
		
		// Check ability energy
		if isnumber(pl.abilityEnergy) and pl.abilityEnergy < 2 then
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
		end
		
		// NEW! Ammo check. Players will have default amounts of ammo like in HL2.
		if GetConVarNumber("hl2c_ammo_limits") >= 1 then
			if IsValid(pl) && pl:Alive() && pl:Team() == TEAM_ALIVE then
				for id, count in pairs(Hl2c.AmmoTypes_Max_Id) do
					if pl:GetAmmoCount(id) > count + (math.Round( (((pl:GetCLevel()+ Hl2c.AmmoTypes_ItemClass_Bonus[id]) * count/ (count/2)) ) - (1 * count / (count/2)) )) then
						pl:SetAmmo(count + (math.Round( (((pl:GetCLevel()+ Hl2c.AmmoTypes_ItemClass_Bonus[id]) * count/ (count/2)) ) - (1 * count / (count/2)) )),id)
					end 
				end
			end
		end
		if HL2MP_IS_COOP_MAP then
		else
			if pl.sprinting == true and pl:KeyReleased(IN_SPEED) then
				pl.sprinting = false
			end
			if pl.sprinting != true and !pl:InVehicle() and pl:KeyDown(IN_SPEED) then
				pl.sprinting = true
				if pl.energy and pl.energy < 9 then
				pl:ConCommand("play player/suit_denydevice.wav")
				elseif pl.energy < 100 then
				pl:ConCommand("play player/suit_sprint.wav")
				end
			end
		end
	end
	
	// Change the difficulty according to number of players
	--if !HL2MP_IS_COOP_MAP then 
	--	--difficulty = math.Clamp((player.GetCount() + 1.5) / 3, DIFFICULTY_RANGE[1], DIFFICULTY_RANGE[2])
	--	difficulty = ( 2 + ( player.GetCount() / 9 ) )
	--elseif HL2MP_IS_COOP_MAP then
	--	difficulty = 0.25
	--end
	
	// Open area portals -- THIS IS OLD CODE!
	if nextAreaOpenTime <= CurTime() then
		local portalArea = ents.FindByClass("func_areaportal")
		for _, fap in pairs(portalArea) do
			fap:Fire("Open")
		end
		
		nextAreaOpenTime = CurTime() + 4
	end
	
	
	// Open area portals without regrets and only on multiplayer
	--local Ice_portalArea = ents.FindByClass("worldspawn")
	--for _, ifap in pairs(Ice_portalArea) do
	--	ifap:SetKeyValue( "disableareaportals", "1" )
	--end
	Hl2c.PetFindEnmey_Think()

end