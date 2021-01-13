function Hl2c.PetTarget(owner, pet)
	if IsValid(owner) and 
	IsValid(pet) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true and
	IsValid(owner.pet) and 
	owner.petalive == true
	then
		--
		local target = owner:GetEyeTrace().Entity
		if IsValid(target) and
		target:IsNPC() and
		!IsValid(target.owner)
		then
			pet:SetEnemy(target)	
		end


	end

end
