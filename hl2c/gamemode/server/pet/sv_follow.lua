function Hl2c.PetFollowOnwer( pet, owner, clear )
	if IsValid(owner) and 
	IsValid(pet) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true --and
	--pet.follow == true --and
	--owner.petalive != true and
	--!IsValid(owner.pet)
	then
			pet:StopMoving()
			pet:ClearSchedule()
			pet:ClearEnemyMemory()
			--pet:SetLastPosition( owner:GetPos() )
			--pet:SetSchedule( SCHED_FORCED_GO_RUN )
			--Hl2c.PetFollowOwner_LastPosition(pet, owner)
			--pet:SetSaveValue( "m_vecLastPosition", owner:GetPos() )
			--
			--pet:SetSchedule( SCHED_FORCED_GO_RUN )
			pet.follow_on = true
			
		
	end
end

function Hl2c.PetStopFollowOnwer( pet, owner, clear )
	if IsValid(owner) and 
	IsValid(pet) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true --and
	--pet.follow == true --and
	--owner.petalive != true and
	--!IsValid(owner.pet)
	then
			--print("Called")
			pet:ClearSchedule()
			pet:ClearEnemyMemory()
			pet.follow_on = false
			
	end
end



function Hl2c.PetFollowOwner_LastPosition(pet, owner)
	if IsValid(owner) and 
	IsValid(pet) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true
	then
		--print("CALLED")
		pet:SetSaveValue("m_vecLastPosition", owner:GetPos())
	end
end

--hook.Add("Think", "Pet_Think_LastPosition", Hl2c.PetFollowOwner_LastPosition)
