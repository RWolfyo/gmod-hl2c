gameevent.Listen( "entity_killed" )
hook.Add( "entity_killed", "entity_killed_hl2connpckilled", function( data )
	local inflictor_index = data.entindex_inflictor		// Same as Weapon:EntIndex() / weapon used to kill victim
	local attacker_index = data.entindex_attacker		// Same as Player/Entity:EntIndex() / person or entity who did the damage
	local damagebits = data.damagebits			// DAMAGE_TYPE - use BIT operations to decipher damage types...
	local victim_index = data.entindex_killed		// Same as Victim:EntIndex() / the entity / player victim
		
	
	// Check NPC's Death
	for k, v in pairs(ents.FindByClass("npc_*")) do
		
		
		if v and v:EntIndex() == victim_index and v:IsNPC() then
			
			
			if GAME_IS_EP2 and v:GetClass() == "npc_antlion_grub" 
			-- and EP2_GRUB_ACH 
			then
				-- Hl2c.ANTLIONGRUB_KILLS = Hl2c.ANTLIONGRUB_KILLS + 1
				for _, pl in pairs(player.GetAll()) do
					if pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS") != 1 then
						pl:AddCounter(6,1)
						-- Hl2c.PersonDefaultChatPrint("Grub Kills: ".. tostring(tostring(Hl2c.ANTLIONGRUB_COUNT)) .."/"..tostring(Hl2c.ANTLIONGRUB_KILLS),pl)
						Hl2c.PersonDefaultChatPrint("Grub Kills: ".. tostring(tostring(333)) .."/"..tostring(pl:GetNWInt("customcounter_6")),pl)
					end
				end
			end
			
			
			if GAME_IS_EP2 and v:GetClass() == "npc_hunter"  then
				-- print(inflictor_index,attacker_index,damagebits,victim_index)
				for _, ent in pairs(ents.FindByClass("hunter_flechette")) do
					if ( inflictor_index == ent:EntIndex() or attacker_index == ent:EntIndex() ) and GAME_IS_EP2 then
						-- print("FOUND THE Hunter_Flechette")
						Hl2c.EP2_KILL_HUNTER_WITHFLECHETTES()
					end
				end
			end
			
			
			
			if GAME_IS_EP2 and v:GetClass() == "npc_combine_s"  then
				-- print(inflictor_index,attacker_index,damagebits,victim_index)
				for _, ent in pairs(ents.FindByClass("npc_grenade_frag")) do
					if ( inflictor_index == ent:EntIndex() ) and GAME_IS_EP2 then
						
						if ent:GetNWEntity("m_hOriginalThrower") == v then
							for o, pl in pairs(player.GetAll()) do
								if attacker_index == pl:EntIndex() then
									-- print("FOUND THE Grenade")
									Hl2c.HLX_KILL_SOLDIER_WITHHISGRENADE(pl)
								end
							end
							
						end
					end
					-- elseif (attacker_index == ent:EntIndex() ) and !GAME_IS_EP2 then
						-- if ent:GetNWEntity("m_hOriginalThrower") == v then
							-- print("FOUND THE Grenade")
							-- Hl2c.HLX_KILL_SOLDIER_WITHHISGRENADE()
						-- end
					-- end
				end
			end
			
			
			if GAME_IS_EP1 and v:GetClass() == "npc_antlion" then
				for _, ent in pairs(ents.FindByClass("prop_physics")) do
					if ( inflictor_index == ent:EntIndex() ) and GAME_IS_EP1 and
					ent:GetModel() and string.find(ent:GetModel(),"props_vehicles")
					then
						Hl2c.EP1_KILL_ANTLIONS_WITHCARS()
					end
					
				end
			end
			
			if GAME_IS_HL2 and v:GetClass() == "npc_barnacle" then
			
				for _, prop in pairs(ents.FindByClass("prop_physics")) do
					if prop:EntIndex() == inflictor_index and prop:GetModel() and prop:GetModel() == "models/props_c17/oildrum001_explosive.mdl" then
						prop.ach_bowling = prop.ach_bowling or 0
						prop.ach_bowling = prop.ach_bowling + 1
						if prop.ach_bowling == 5 then
							Hl2c.HL2_KILL_BARNACLESWITHBARREL()
						end
						if prop.ach_bowling <= 5 then
							Hl2c.DefaultChatPrint("[Barnacle Bowling]: 5/"..tostring(prop.ach_bowling))
						end
						
						
						
					end
				end
			end
			-- for _,inflictor in pairs(ents.FindByClass("weapon_*") ) do
				-- if inflictor:EntIndex() == inflictor_index then
					for p,pl in pairs(player.GetAll() ) do
						if pl:EntIndex() == attacker_index then
							if IsValid( pl:GetActiveWeapon() ) and 
							pl:GetActiveWeapon():GetClass() and 
							(pl:GetActiveWeapon():GetClass() == "weapon_crowbar" or 
							pl:GetActiveWeapon():GetClass() == "weapon_stunstick" ) 
							then
								pl:SetNWInt("PROG_FREEMAN_COUNT", 1+ pl:GetNWInt("PROG_FREEMAN_COUNT") )
								for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( pl,SQUAD:GetSquad(pl) )) do
									squad:SetNWInt("PROG_FREEMAN_COUNT", squad:GetNWInt("PROG_FREEMAN_COUNT") + 1 )
								end
							else
								pl:SetNWInt("PROG_NONFREEMAN_COUNT", 1+ pl:GetNWInt("PROG_NONFREEMAN_COUNT") )
								for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( pl,SQUAD:GetSquad(pl) )) do
								squad:SetNWInt("PROG_NONFREEMAN_COUNT", squad:GetNWInt("PROG_NONFREEMAN_COUNT") + 1 )
								end
							end
							-- pl:SetNWInt("PROG_BOOM_COUNT", pl:GetNWInt("PROG_BOOM_COUNT") + 1 )
						end
					end
				-- end
			-- end
			
			// Count Boom Kills
			for _, prop in pairs(ents.FindByClass("prop_physics")) do
				if prop:EntIndex() == inflictor_index and prop:GetModel() and prop:GetModel() == "models/props_c17/oildrum001_explosive.mdl" then
					for p,pl in pairs(player.GetAll() ) do
						if pl:EntIndex() == attacker_index then
							pl:SetNWInt("PROG_BOOM_COUNT", pl:GetNWInt("PROG_BOOM_COUNT") + 1 )
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( pl,SQUAD:GetSquad(pl) )) do
								squad:SetNWInt("PROG_BOOM_COUNT", squad:GetNWInt("PROG_BOOM_COUNT") + 1 )
							end
						end
					end
				end
				if prop then
					for p,pl in pairs(player.GetAll() ) do
						if pl:EntIndex() == attacker_index then
							pl:SetNWInt("PROG_PROPKILL_COUNT", pl:GetNWInt("PROG_PROPKILL_COUNT") + 1 )
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( pl,SQUAD:GetSquad(pl) )) do
								squad:SetNWInt("PROG_PROPKILL_COUNT", squad:GetNWInt("PROG_PROPKILL_COUNT") + 1 )
							end
						end
					end
				end
			end
	
			// Combine Mine Kill
			for _, ent in pairs(ents.FindByClass("combine_mine")) do
				if ( attacker_index == ent:EntIndex() ) and GAME_IS_EP2 then
			
			
					-- print("Killed NPC with combine_mine")
					Hl2c.HLX_KILL_ENEMY_WITHHOPPERMINE()
							
				end
				
			end
			
			// Check NPC's prop_physics dead.
			for _, ent in pairs(ents.FindByClass("prop_physics")) do
				if ( inflictor_index == ent:EntIndex() ) and GAME_IS_EP2 then
					
					
					for o, pl in pairs(player.GetAll()) do
						if attacker_index == pl:EntIndex() then
							-- print("Killed NPC with Prop_Physics")
							Hl2c.HLX_KILL_ENEMIES_WITHPHYSICS(pl)
						end
					end
				end
				
			end
		
			// Check NPC's sniper_alyx dead.
			for _, ent in pairs(ents.FindByName("sniper_alyx")) do
				if ( inflictor_index == ent:EntIndex() ) and GAME_IS_EP1
				then
					Hl2c.EP1_KILL_ENEMIES_WITHSNIPERALYX()
				end
				
			end
		
			// Check NPC's prop_vehicle_jeep dead.
			for _, ent in pairs(ents.FindByClass("prop_vehicle_jeep")) do
				if ( inflictor_index == ent:EntIndex() ) and GAME_IS_EP2 then
					
					
					-- for o, pl in pairs(player.GetAll()) do
						-- if attacker_index == pl:EntIndex() then
							-- print("Killed NPC with prop_vehicle_jeep")
							Hl2c.EP2_KILL_ENEMIES_WITHCAR()
						-- end
					-- end
				end
				
			end
			
			
			
			if v:GetClass() == "npc_metropolice" then
				for _, ent in pairs(player.GetAll()) do
					if ( attacker_index == ent:EntIndex() ) and (DEV_MODE or (GAME_IS_HL2 or GAME_IS_EP1) ) then
						Hl2c.MaskLoot(v,ent)
					end
				end
			end
			
		end
	end
	
	
	// Check NPC's combine elit for elit mask dead.
	-- for k, v in pairs(ents.FindByClass("npc_combine_s")) do
		-- if v and v:EntIndex() == victim_index and v:IsNPC() and v:GetModel() == "models/player/combine_super_soldier.mdl" then
			-- for _, ent in pairs(player.GetAll()) do
				-- if ( attacker_index == ent:EntIndex() ) then
					-- Hl2c.MaskLoot(v,ent)
				-- end
			-- end
		-- end
	-- end
end )



// Called when an NPC dies
function GM:OnNPCKilled(npc, killer, weapon)
	--print("npc: ",npc:GetClass())
	local npc = npc
	local killer = killer
	local weapon = weapon
	

	
	if npc:GetClass() == "npc_launcher" then return end
	if npc:GetClass() == "npc_bullseye" then return end
	
	
	
	if IsValid(killer) && 
	IsValid(killer.owner) &&
	IsValid( npc ) && 
	killer:IsPet() &&
	npc:IsNPC() && 
	!npc:IsPet()
	then
		
		if npc:GetClass() == "npc_antlion" and ANTLION == false then
		else
			killer.owner:Pet_AddXP(2)
			-- killer.owner:AddXP(1)
			killer.owner:SetNWInt("PROG_PETKILL", 1 + killer.owner:GetNWInt("PROG_PETKILL") )
			
			for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( killer.owner,SQUAD:GetSquad(killer.owner) )) do
				squad:SetNWInt("PROG_PETKILL", 1 + squad:GetNWInt("PROG_PETKILL") )
			end
		end
	end
	
	XP_OnNPCKilled(npc, killer, weapon)
	ACH_OnNPCKilled(npc,killer,weapon)
	-- SECRET.NPCKILLED(npc)
	
	if killer && killer:IsValid() && killer:IsPlayer() && IsValid( npc ) then
		if table.HasValue(GODLIKE_NPCS, npc:GetClass()) || npc:GetName() == "rocketman" then
			if !game.SinglePlayer() then -- This should only end up being used in multiplayer.
				if !HL2MP_IS_COOP_MAP then
				game.ConsoleCommand("kickid "..killer:UserID().." \"Killed an important NPC actor!\"\n")
				GAMEMODE:RestartMap()
				end
			end
		-- elseif NPC_POINT_VALUES[npc:GetClass()] then
		else
		end
	end
	
	
	
	
	// Convert the inflictor to the weapon that they're holding if we can. 
 	if weapon && weapon != NULL && killer == weapon && (weapon:IsPlayer() || weapon:IsNPC()) then 
 		weapon = weapon:GetActiveWeapon() 
 		if killer == NULL then weapon = killer end 
 	end 
 	
	// Defaults
 	local weaponClass = "World" 
 	local killerClass = "World" 
 	
	// Change to actual values if not default
 	if weapon && weapon != NULL then weaponClass = weapon:GetClass() end 
 	if killer && killer != NULL then killerClass = killer:GetClass() end 
	
	// Play a random taunt sound
	if GetConVarNumber("hl2c_additions") >= 1 then
		if killer && killer != NULL && killer:IsPlayer() then
			--if CD_MAP or HL2MP_IS_COOP_MAP then
			--else
			if (table.HasValue(FRIENDLY_NPCS, npc:GetClass()) || table.HasValue(GODLIKE_NPCS, npc:GetClass())) then
				return
			end
		
			if (math.random(1, 6) <= 3) then
				PlayerTaunt(killer)
			end
			--end
		end
	end
	
	// Send a message
 	if killer && killer != NULL && killer:IsPlayer() then 
		net.Start("PlayerKilledNPC")
			net.WriteString(npc:GetClass())
			net.WriteString(weaponClass)
			net.WriteEntity(killer)
		net.Broadcast()
 	end
end

