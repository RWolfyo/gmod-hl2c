function Hl2c.Pet_StartDuel(pet1, pet2)
	if IsVaLid(pet1) and
	IsValid(pet2) and
	IsValid(pet1.owner) and
	IsValid(pet2.owner) and
	pet1.owner:IsPlayer() and
	pet2.owner:IsPlayer()
	then
		
	end
end

function Hl2c.Pet_StopDuel(index)
	
end

function Hl2c.Pet_RequestDuel(owner1, owner2)
	
end

function Hl2c.Pet_AskDuel(owner1, owner2)
	
end