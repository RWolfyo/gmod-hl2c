function Hl2c.PetRemove(pet)
	if IsValid(pet.owner) and 
	pet.owner:IsPlayer() and
	isstring(pet.owner:Nick())
	then
		-- print("[pet] ".. pet.owner:Nick() .." pet's has been removed")
		-- PrintMessage(HUD_PRINTTALK, "".. pet.owner:Nick() .." pet's has been removed")
	--end
	elseif IsValid(pet.owner) and
	pet.owner:IsPlayer() and
	!isstring(pet.owner:Nick())
	then
		-- print("[pet] Player pet's has been removed")
		-- PrintMessage(HUD_PRINTTALK,	"Player pet's has been removed")
	end
	pet:Remove()
end


function Hl2c.OwnerLeave(owner)
	if IsValid(owner.pet) and
	owner.petalive == true
	then
		Hl2c.PetRemove(owner.pet)
	end
end
hook.Add("PlayerDisconnected", "hl2c_OwnerLeave", Hl2c.OwnerLeave )