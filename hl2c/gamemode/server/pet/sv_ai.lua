include("sv_pet_cfg.lua")


function AI_SetOC(attacker,victim)
	if Hl2c.PetAI.OC[victim:GetClass()] == D_HT then
	
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_HT, 99 )
		end
		
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_HT, 15 )
		end
	else
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_LI, 99 )
		end
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_LI, 99 )
		end
		
	end
end
function AI_SetSYN(attacker,victim)
	if Hl2c.PetAI.SYN[victim:GetClass()] == D_HT then
	
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_HT, 99 )
		end
		
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_HT, 15 )
		end
	else
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_LI, 99 )
		end
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_LI, 99 )
		end
		
	end
end

function AI_SetHL2DM(attacker,victim)
	if Hl2c.PetAI.HL2DM[victim:GetClass()] == D_HT then
	
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_HT, 99 )
		end
		
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_HT, 15 )
		end
	else
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_LI, 99 )
		end
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_LI, 99 )
		end
		
	end
end
function AI_SetHL2(attacker,victim)
	if Hl2c.PetAI.HL2[victim:GetClass()] == D_HT then
	
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_HT, 99 )
		end
		
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_HT, 15 )
		end
	else
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_LI, 99 )
		end
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_LI, 99 )
		end
		
	end
end
function AI_SetCD(attacker,victim)
	if Hl2c.PetAI.CD[victim:GetClass()] == D_HT then
	
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_HT, 99 )
		end
		
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_HT, 15 )
		end
	else
		if IsValid(attacker) and IsValid(victim) and attacker:IsPet() then
			attacker:AddEntityRelationship( victim, D_LI, 99 )
		end
		if IsValid(attacker) and IsValid(victim) and not victim:IsPet()	then
			victim:AddEntityRelationship( attacker, D_LI, 99 )
		end
		
	end
end

function Valid_Pet_AI(attacker,victim)
	if not IsValid(victim) then return true end
	if not victim:IsNPC() then return true  end
	if not IsValid(attacker) then return true  end
	if not attacker:IsNPC() then return true end
	if Hl2c.PetAI.List[attacker:GetClass()] != true then return true end
	if Hl2c.PetAI.List[victim:GetClass()] != true then return true end
	return false
end

function AI_SetAI(attacker, victim)
	if Valid_Pet_AI(attacker,victim) then return end
	-- sif Valid_Pet_AI(attacker,victim) then return end
	--print(attacker)
	if GAME_IS_HL2 then
		AI_SetHL2(attacker,victim)
		return
	elseif OC_MAP then
		AI_SetOC(attacker,victim)
		return
	elseif SYN_MAP then
		AI_SetSYN(attacker,victim)
		return
	elseif CD_MAP then
		AI_SetCD(attacker,victim)
		return
	elseif HL2DM_IS_COOP_MAP then
		AI_SetHL2DM(attacker,victim)
		return
	else
		AI_SetHL2(attacker,victim)
		return
	end
end



function AI_SetHate(victim, attacker)
	if not IsValid(victim) then return end
	if not IsValid(attacker) then return end
	
	if attacker:IsPet() and attacker:GetRelationship( victim ) != D_HT then
		attacker:AddEntityRelationship( victim, D_HT, 99 )
		--print("Set Hate")
	end
	if not victim:IsPet() and victim:GetRelationship( attacker ) != D_HT then
		victim:AddEntityRelationship( attacker, D_HT, 15 )
		--print("Set Hate")
	end
end

function AI_SetLike(victim, attacker)
	if not IsValid(victim) then return end
	if not IsValid(attacker) then return end
	
	if attacker:IsPet() and attacker:GetRelationship( victim ) != D_LI then
		attacker:AddEntityRelationship( victim, D_HT, 99 )
		--print("Set Like")
	end
	if not victim:IsPet() and victim:GetRelationship( attacker ) != D_LI then
		victim:AddEntityRelationship( attacker, D_HT, 99 )
		--print("Set Like")
	end
end

function Hl2c.Pet_Relation(pet)
	if IsValid(pet) and 
	IsValid(pet.owner) and 
	pet.owner:IsPlayer()
	then
	else
		return
	end
	
	for k, v in pairs(ents.FindByClass("npc_*")) do
		if IsValid(v) and v:IsPet() then
			v:AddEntityRelationship( pet, D_LI, 99 )
			pet:AddEntityRelationship( v, D_LI, 99 )
		elseif IsValid(v) and not v:IsPet() then
			AI_SetAI(pet,v)
			-- print("Working?")
			
		end
	end
	for k, v in pairs(ents.FindByClass("monster_*")) do
		if IsValid(v) and v:IsPet() then
			v:AddEntityRelationship( pet, D_LI, 99 )
			pet:AddEntityRelationship( v, D_LI, 99 )
		elseif IsValid(v) and not v:IsPet() then
			AI_SetAI(pet,v)
			-- print("Working?")
			
		end
	end
		
end


-- function Hl2c.PetThink()
	-- for k, v in pairs( Hl2c.PETS ) do
		
		
		
	-- end
-- end




-- hook.Add("Think", "Hl2c_PetThink", Hl2c.PetThink)


function Hl2c.PetFindEnmey_Think()
	for k, v in pairs( Hl2c.PETS ) do
		
		if IsValid(v) and
		v:IsPet() and 
		v.hasowner and
		v.ownerid and 
		v.owner and
		IsValid(v.owner) and 
		v.owner:IsPlayer() and
		v:IsPet()
		then
			-- print("Hi")
			-- Hl2c.Pet_Relation(v)
			-- for h, g in pairs(player.GetAll()) do
				if (true) --g:Team() == TEAM_ALIVE
				then
					

					-- print("Hi")
					if Hl2c.PetAI.Frame + Hl2c.PetAI.CurTime < CurTime() then
						-- if v:GetEnemy():IsNPC() then
							Hl2c.Pet_Relation(v)
							
						-- end
					else
						Hl2c.PetAI.CurTime = CurTime()
					end
					
					
					if IsValid(v) and v:IsPet() then
						
						if IsValid( v:GetEnemy() ) then
							v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_PERFECT) 
							-- print(v)
							if !v:GetEnemy():IsPet() and 
							v:GetEnemy():GetClass() == "npc_antlion" and 
							HL2C_PET_LIKE_ANTLION then
								Hl2c.PetAI.HL2["npc_antlion"] = D_LI
								-- print("called?")
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								v:GetEnemy():AddEntityRelationship( v,D_LI,99)
							end
							if v:GetEnemy():GetClass() == "bullseye_strider_focus" then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							end
							if v:GetEnemy():GetClass() == "npc_enemyfinder" then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							end
							if v:GetEnemy():GetClass() == "npc_bullseye" then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							end
							if v:GetEnemy():GetClass() == "npc_launcher" then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							end
							if v:GetEnemy():IsPet() then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
							end
							if v:GetEnemy():IsPlayer() then
								v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							end
							
							-- if v:GetEnemy():GetClass() == "npc_launcher" then
								-- v:AddEntityRelationship( v:GetEnemy(),D_LI,99)
								
							-- end
							--print( v:GetEnemy():GetClass() )
						end
					end
					if IsValid(v) and IsValid(v.owner) and v.follow_on == true and
					v:GetPos():Distance(v.owner:GetPos()) > 100
					then
						-- for s = 0, LAST_SHARED_SCHEDULE-1 do
							-- if ( v:IsCurrentSchedule( s ) ) then 
							-- return print(s) 
							-- end
						-- end

						-- if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) and 
						-- ( v:IsCurrentSchedule(SCHED_NONE) or 
						-- v:IsCurrentSchedule(SCHED_PATROL_WALK) or 
						-- v:IsCurrentSchedule(SCHED_PATROL_RUN) or 
						-- v:IsCurrentSchedule(SCHED_NPC_FREEZE) or 
						-- v:IsCurrentSchedule(SCHED_RUN_RANDOM) or 
						-- v:IsCurrentSchedule(SCHED_IDLE_STAND) or 
						-- v:IsCurrentSchedule(SCHED_IDLE_WALK) or 
						-- v:IsCurrentSchedule(SCHED_IDLE_WANDER) 
						-- ) 
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						
						if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN)			
						then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						
						-- if v:IsCurrentSchedule(SCHED_IDLE_STAND)			
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						-- if v:IsCurrentSchedule(0)			
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						-- if v:IsCurrentSchedule(SCHED_ALERT_SCAN)			
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						-- if v:IsCurrentSchedule(SCHED_ALERT_STAND)			
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						-- if v:IsCurrentSchedule(SCHED_ALERT_WALK)			
						-- then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						v:SetLastPosition( v.owner:GetPos() )
					end
					
					if IsValid(v) and IsValid(v.owner) and v.follow_on == true and
					v:GetPos():Distance(v.owner:GetPos()) < 101
					then
						if v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
						v:ClearSchedule()
						v:StopMoving()
						end
						--v.stopfollow = true
						--v.follow_on = false
						--v.follow = false
						--Hl2c.PetFollowOnwer( v, v.owner )
						
					end
					/*
					v.findowner = ents.FindInSphere(v:GetPos(), 15)
					
					for m, n in pairs(v.findowner) do
						if n == v.owner and v.follow_on then
							v.stopfollow = true
							v.follow_on = false
							v.follow = false
							Hl2c.PetFollowOnwer( v, v.owner )
						else
							--Hl2c.PetFollowOnwer( v, v.owner )
						end
					end
					*/
					
					--print("relation applied")
				-- end
			end
			--v:AddEntityRelationship( player.GetByID( 1 ), D_FR, 99 )
		end
		
		
	end
end
-- hook.Remove("Think","Pet_Enemy_Think_Fix")
-- hook.Add( "Think", "Pet_Enemy_Think_Fix", Hl2c.PetFindEnmey_Think )