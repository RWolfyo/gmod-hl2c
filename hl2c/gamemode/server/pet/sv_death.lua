
function Hl2c.PetDeath(npc,attacker, inflictor )
	if IsValid(npc) and 
	npc.hasowner and 
	IsValid(npc.owner) and
	npc.owner:IsPlayer() and
	npc:GetNWBool("pet_checker") == true
	then
		local text = ""
		npc.owner.pet = nil
		npc.owner.petalive = false
		if IsValid(attacker) and 
		isstring(attacker:GetClass()) and 
		isstring(npc.owner:Nick()) and
		isnumber(attacker:EntIndex()) and
		!attacker:IsWorld()
		then
			-- PrintMessage(HUD_PRINTTALK,"".. npc.owner:Nick() .." pet's die by [".. attacker:GetClass() .."][".. attacker:EntIndex() .."]")
			-- print("".. npc.owner:Nick() .." pet's die by [".. attacker:GetClass() .."][".. attacker:EntIndex() .."]")
			text = "".. tostring(npc.owner:Nick()) .."'s pet was murdered by [".. tostring(attacker:GetClass()) .."][".. tostring(attacker:EntIndex()) .."]"
			Hl2c.DefaultChatPrint(text)
		--end
		elseif IsValid(attacker) and 
		!isstring(attacker:GetClass()) and 
		isstring(npc.owner:Nick()) and
		isnumber(attacker:EntIndex()) and
		!attacker:IsWorld()
		then
			-- PrintMessage(HUD_PRINTTALK,"".. npc.owner:Nick() .." pet's die by [NULL][".. attacker:EntIndex() .."]")
			-- print("".. npc.owner:Nick() .." pet's die by [NULL][".. attacker:EntIndex() .."]")
			text = "".. tostring(npc.owner:Nick()) .."'s pet was murdered by [NULL][".. tostring(attacker:EntIndex()) .."]"
			Hl2c.DefaultChatPrint(text)
		elseif IsValid(attacker) and 
		isstring(attacker:GetClass()) and 
		isstring(npc.owner:Nick()) and
		!isnumber(attacker:EntIndex()) and
		!attacker:IsWorld()
		then
			-- PrintMessage(HUD_PRINTTALK, "".. npc.owner:Nick() .." pet's die by [".. attacker:GetClass() .."][nil]")
			-- print("".. npc.owner:Nick() .." pet's die by [".. attacker:GetClass() .."][nil]")
			text = "".. tostring(npc.owner:Nick()) .."'s pet was murdered by [NULL][nil]"
			Hl2c.DefaultChatPrint(text)
		elseif IsValid(attacker) and 
		!isstring(attacker:GetClass()) and 
		isstring(npc.owner:Nick()) and
		!isnumber(attacker:EntIndex()) and
		attacker:IsWorld()
		then
			-- PrintMessage(HUD_PRINTTALK, 
			-- "".. npc.owner:Nick() .." pet's die by [worldspawn][0]")
			-- print("".. npc.owner:Nick() .." pet's die by [worldspawn][0]")
			text = "".. tostring(npc.owner:Nick()) .."'s pet was murdered by [worldspawn][0]"
			Hl2c.DefaultChatPrint(text)
		end
	end
	
	if IsValid(npc) and 
	IsValid(attacker) and 
	attacker.hasowner and 
	IsValid(attacker.owner) and
	attacker.owner:IsPlayer() and
	attacker:GetNWBool("pet_checker") == true
	then
		-- attacker.owner:Pet_AddXP(2)
	end
end
hook.Add("OnNPCKilled", "hl2c_petdeath", Hl2c.PetDeath)


-- function Hl2c.OwnerDie(owner, inflictor, attacker)
	-- if IsValid(owner) and IsValid(owner.pet) and
	-- owner.petalive == true
	-- then
		-- Hl2c.PetRemove(owner.pet)
	-- end
-- end
-- hook.Add("PlayerDeath", "hl2c_OwnerDie", Hl2c.OwnerDie)		//( victim, inflictor, attacker )
