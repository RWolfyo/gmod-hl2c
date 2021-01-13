function Helicopter_RemoveXP(ent)
	if IsValid(ent) and
	ent:GetClass() != nil and
	ent:GetClass() == "npc_helicopter" and
	ent.LastAttacker != nil and
	ent.LastAttacker:IsPlayer() and
	ent.LastAttacker.setup_achi == true and
	ent.input_kill != 1 --&& !ent:IsPet()
	then
		ent.input_kill = 1
		if ent.last_damage then
			
			
			if ent.sharedamage then
				-- print(ent.last_damage:GetAttacker())
				XP_OnNPCKilled( ent,ent.last_attacker,ent.last_weapon )
			end
			
		end
		-- ent.LastAttacker:AddFrags(1)
		-- ent.LastAttacker:AddXP(100)
		--print("NPC Class:",ent:GetClass())
		--print("Last Attacker:",ent.LastAttacker:Nick())
		
		
		
		
		
	end
end

function OnHit_XP(npc,hitGroup,dmg)
	local attacker = dmg:GetAttacker()
	//Give XP to the players if they damage these special npcs.
	if !IsValid(attacker) then return end
	if !IsValid(npc) then return end
	if npc:IsPet() then return end
	if attacker:IsPlayer() then else return end
	if npc:Health() > 0 then else return end
	-- print(npc)
	-- if npc:GetClass() == "npc_combinegunship" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
	-- attacker:AddXP(NPC_SHOULD_GIVE_POINT_VALUES[npc:GetClass()])
	-- attacker:AddFrags(NPC_SHOULD_GIVE_POINT_VALUES[npc:GetClass()])
	-- end
	-- if HL2MP_IS_COOP_MAP then
		-- if npc:GetClass() == "npc_vortigaunt" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
			-- attacker:AddXP(3)
		-- end
		-- if npc:GetClass() == "npc_helicopter" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
			-- attacker:AddXP(8)
		-- end
	-- end
	-- if ANTLION_FARM then
		-- if npc:GetClass() == "npc_antlion" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
			-- attacker:AddXP(1)
		-- end
	-- end
	-- if CD_MAP then
		-- if npc:GetClass() == "npc_citizen" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
			-- attacker:AddXP(1)
		-- end
	-- end
	-- if !HL2MP_IS_COOP_MAP then
		-- if npc:GetClass() == "npc_helicopter" && !npc:IsPet() && attacker:IsPlayer() && npc:Health() > 0 then
			-- attacker:AddXP(NPC_SHOULD_GIVE_POINT_VALUES[npc:GetClass()])
			-- attacker:AddFrags(NPC_SHOULD_GIVE_POINT_VALUES[npc:GetClass()])
		-- end
	-- end
	
	
	npc.last_damage = dmg
	npc.last_attacker = dmg:GetAttacker()
	npc.last_weapon = dmg:GetInflictor()
	-- print(npc,npc.last_damage:GetAttacker(),npc.last_damage:GetInflictor() )
	if GAMEMODE.MapScript.EntityNotGiveXP and GAMEMODE.MapScript.EntityNotGiveXP[npc:GetClass()] == true then
		
		return
	else
		if NPC_SHOULD_GIVE_POINTS[npc:GetClass()] and NPC_SHOULD_GIVE_POINTS[npc:GetClass()][1] then
		if npc.sharedamage then
			if npc.sharedamage[attacker] then
				npc.sharedamage[attacker] = npc.sharedamage[attacker] + dmg:GetDamage()
				-- print(npc)
			else
				npc.sharedamage[attacker] = 0 + dmg:GetDamage()
			end
			-- print(npc.sharedamage[attacker:EntIndex()])
			
		else
			npc.sharedamage = { [attacker] = 0 + dmg:GetDamage()}
			
		end
			-- attacker:AddFrags(NPC_SHOULD_GIVE_POINTS[npc:GetClass()][2])
			
			-- if Hl2c.Diff_Selected and Hl2c.Diff_Selected == 0 then return end
			-- local points = 0
			-- if Hl2c.Diff_Selected and Hl2c.Diff_Selected == 2 then points = NPC_SHOULD_GIVE_POINTS[npc:GetClass()][2] + 2 end
			-- if Hl2c.Diff_Selected and Hl2c.Diff_Selected == 3 then points = NPC_SHOULD_GIVE_POINTS[npc:GetClass()][2] + 3 end
			-- if Hl2c.Diff_Selected and Hl2c.Diff_Selected == 4 then points = NPC_SHOULD_GIVE_POINTS[npc:GetClass()][2] + 6 end
			-- attacker:AddXP(NPC_SHOULD_GIVE_POINTS[npc:GetClass()][2] + points)
			
		end
		-- if table.HasValue(NPC_SHOULD_GIVE_POINT, npc:GetClass()) && !npc:IsPet() && attacker:IsPlayer() then
		
		
		-- end
	end
end



function XP_OnNPCKilled(npc,killer,weapon)
	-- util.RunNextFrame(function()
	local npc = npc
	local killer = killer
	local weapon = weapon
	if npc:IsPet() then return end
	
	-- print(npc,killer,weapon)
	--print("Hi")
	if killer && killer:IsValid() && killer:IsVehicle() && killer:GetDriver():IsPlayer() then
		killer = killer:GetDriver()
	end
	
	// If the killer is a player then decide what to do with their points
	--if !HL2MP_IS_COOP_MAP then
	-- if killer && killer:IsValid() && killer:IsPlayer() && IsValid( npc ) then
		-- if table.HasValue(GODLIKE_NPCS, npc:GetClass()) || npc:GetName() == "rocketman" then
			-- if !game.SinglePlayer() then -- This should only end up being used in multiplayer.
				-- if !HL2MP_IS_COOP_MAP then
				--game.ConsoleCommand("kickid "..killer:UserID().." \"Killed an important NPC actor!\"\n")
				--GAMEMODE:RestartMap()
				-- end
			-- end
		-- elseif NPC_POINT_VALUES[npc:GetClass()] then
			-- killer:AddFrags(NPC_POINT_VALUES[npc:GetClass()])
			-- killer:AddXP(NPC_POINT_VALUES[npc:GetClass()])
			--killer:PrintMessage( HUD_PRINTCONSOLE, "You received: "..NPC_POINT_VALUES[npc:GetClass()].. " Xp by killing "..npc:GetClass() )
		-- else
			
		-- end
	-- end
	--end
	
	if killer && killer:IsValid() && killer:IsPlayer() && IsValid( npc ) then
		-- if weapon and weapon:GetClass() and ( weapon:GetClass() == "weapon_stunstick" or weapon:GetClass() == "weapon_crowbar" ) then
			-- print("Happened?")
			-- if killer:GetNWInt("PROG_NONFREEMAN_COUNT") <1 then
				-- killer:SetNWInt("PROG_FREEMAN_COUNT", 1+ killer:GetNWInt("PROG_FREEMAN_COUNT") )
			-- end
		-- else
			-- killer:SetNWInt("PROG_NONFREEMAN_COUNT", 1+ killer:GetNWInt("PROG_NONFREEMAN_COUNT") )
		-- end
		-- print(npc,killer,weapon)
		if npc.sharedamage and NPC_POINTS_VALUES[npc:GetClass()] and NPC_POINTS_VALUES[npc:GetClass()][1] then
			-- PrintTable(npc.sharedamage)
			local all = 0
			local num = 0
			for k, v in pairs(npc.sharedamage) do
				all = all + npc.sharedamage[k]
				num = num + 1
			end
			for k, v in pairs(npc.sharedamage) do
				-- k:AddFrags(math.Round(all/v))
				-- print(all,v,(v/all)*100 )
				local number = math.Round( ( (v/all) ) * ( NPC_POINTS_VALUES[npc:GetClass()][2] *num * difficulty ) )
				local text = "[points]: Dealt ".. tostring(math.Round((v/all)*100),2) .."% of the damage to NPC + Points( ".. tostring(number) .." )" 
				if number >= 1 then
					if IsValid(k) then
						
						k:AddFrags(number)
						k:AddXP(number)
						Hl2c.PersonDefaultChatPrint(tostring(text),k )
						if npc:GetClass() == "npc_helicopter" then
							k:SetNWBool("PROG_HELICOPTER",true)
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k)) ) do
								squad:SetNWBool("PROG_HELICOPTER",true)
							end
						end
						if npc:GetClass() == "npc_combinegunship" then
							k:SetNWBool("PROG_GUNSHIP",true)
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k)) ) do
								squad:SetNWBool("PROG_GUNSHIP",true)
							end
						end
						if npc:GetClass() == "npc_strider" then
							k:SetNWBool("PROG_STRIDER",true)
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k) )) do
								squad:SetNWBool("PROG_STRIDER",true)
							end
						end
						if npc:GetClass() == "npc_antlionguard" then
							k:SetNWBool("PROG_GUARD",true)
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k)) ) do
								squad:SetNWBool("PROG_GUARD",true)
							end
						end
						if npc:GetClass() == "npc_hunter" then
							k:SetNWBool("PROG_HUNTER",true)
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k)) ) do
								squad:SetNWBool("PROG_HUNTER",true)
							end
						end
						k:SetNWInt("PROG_NPCKILL", k:GetNWInt("PROG_NPCKILL") + 1 )
							for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( k,SQUAD:GetSquad(k)) ) do
								squad:SetNWInt("PROG_NPCKILL", squad:GetNWInt("PROG_NPCKILL") + 1 )
							end
					end
				end
			end
		end
		if npc:GetClass() == "npc_antlion" or npc:GetClass() == "npc_antlionguard" then
			AddCountKill("COUNT_KILLS_ANTLIONS",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				if npc:GetClass() == "npc_antlion" then
					if ANTLION_FARM == true then 
						killer:Pet_AddXP(1) 
					end
				else
					killer:Pet_AddXP(1)
				end
			end
		elseif npc:GetClass() == "npc_zombine" or npc:GetClass() == "npc_zombie" or npc:GetClass() == "npc_fastzombie" or npc:GetClass() == "npc_poisonzombie" or npc:GetClass() == "npc_zombie_torso" then
			AddCountKill("COUNT_KILLS_ZOMBIES",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				killer:Pet_AddXP(1)
			end
		elseif npc:GetClass() == "npc_combine_s" or npc:GetClass() == "npc_rollermine" or npc:GetClass() == "npc_manhack" or npc:GetClass() == "npc_hunter" or npc:GetClass() == "npc_cscanner" or npc:GetClass() == "npc_strider" or npc:GetClass() == "npc_metropolice" or npc:GetClass() == "npc_turret_ceiling" or npc:GetClass() == "npc_turret_floor" or npc:GetClass() == "npc_turret_ground" then
			AddCountKill("COUNT_KILLS_COMBINES",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				if npc:GetClass() == "npc_strider" then
				killer:Pet_AddXP(5)
				else
				killer:Pet_AddXP(1)
				end
			end
		elseif npc:GetClass() == "npc_citizen" then
			AddCountKill("COUNT_KILLS_REBELS",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				killer:Pet_AddXP(1)
			end
		elseif npc:GetClass() == "npc_vortigaunt" then
			AddCountKill("COUNT_KILLS_VORTIGAUNTS",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				killer:Pet_AddXP(1)
			end
		elseif npc:GetClass() == "npc_headcrab" or npc:GetClass() == "npc_headcrab_fast" or npc:GetClass() == "npc_headcrab_black" or npc:GetClass() == "npc_headcrab_poison" then
			AddCountKill("COUNT_KILLS_HEADCRABS",1,killer)
			if killer.petalive == true and
			IsValid(killer.pet)
			then
				killer:Pet_AddXP(1)
			end
		else
			
		end
		
	end
	
	if GAMEMODE.MapScript.EntityNotGiveXP and GAMEMODE.MapScript.EntityNotGiveXP[npc:GetClass()] == true then
		
		return
	else
		
		if NPC_COUNT_KILLS[npc:GetClass()] and NPC_COUNT_KILLS[npc:GetClass()][1] then
			AddCountKill(killer,NPC_COUNT_KILLS[npc:GetClass()][2])
		end
		
		if npc.sharedamage then return end
		
		if NPC_POINTS_VALUES[npc:GetClass()] then else return end
		
		
		if NPC_POINTS_VALUES[npc:GetClass()] and NPC_POINTS_VALUES[npc:GetClass()][1] && killer:IsPlayer() then
			killer:SetNWInt("PROG_NPCKILL", killer:GetNWInt("PROG_NPCKILL") + 1 )
			for id,squad in pairs(SQUAD:GetSquadMembersNOTARGET( killer,SQUAD:GetSquad(killer) )) do
				squad:SetNWInt("PROG_NPCKILL", squad:GetNWInt("PROG_NPCKILL") + 1 )
			end
			if HL2DM_IS_COOP_MAP then
				killer:AddFrags(math.Round(NPC_POINTS_VALUES[npc:GetClass()][2] ))
				-- killer:AddXP(math.Round(NPC_POINTS_VALUES[npc:GetClass()][2] ))
				
				return
			end
			if (NPC_POINTS_VALUES[npc:GetClass()][2] * difficulty) < 1 then 
				killer:AddFrags(math.Round(NPC_POINTS_VALUES[npc:GetClass()][2] ))
				-- killer:SetNWInt("PROG_NPCKILL", killer:GetNWInt("PROG_NPCKILL") + 1 )
				return 
			end
			if npc:GetClass() == "npc_antlion" and ANTLION_FARM == false then 
			else 
				-- killer:AddXP(math.Round(NPC_POINTS_VALUES[npc:GetClass()][2] * difficulty))
				killer:AddFrags(math.Round(NPC_POINTS_VALUES[npc:GetClass()][2] * difficulty ))
				-- killer:SetNWInt("PROG_NPCKILL", killer:GetNWInt("PROG_NPCKILL") + 1 )
			end
			
		end
	end
	
	-- end)
end