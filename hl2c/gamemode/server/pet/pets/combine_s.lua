function Hl2c.Pet_Combine_s(owner)
	if IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true --and
	--owner.petalive != true and
	--!IsValid(owner.pet)
	then
		if IsValid(owner.pet) and owner.petalive then
			Hl2c.PetTeleport(owner)
			--print("teleport?")
		else
		local pet = ents.Create("npc_combine_s")
		--pet:SetPos(owner:GetPos() + Vector(100, 100, 100))
		--pet:SetPos(owner:GetPos() + Vector(0, 0, 100))
		pet.owner = owner
		pet.ownerid = owner:SteamID()
		pet.hasowner = true
		owner.pet = pet
		owner.petalive = true
		pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		pet:SetKeyValue("targetname", "pet")
		if owner:Pet_GetLevel() > 9 then
			pet:SetKeyValue("model", "models/combine_super_soldier.mdl")
			--pet:SetKeyValue("additionalequipment", "weapon_ar2")
		end
		--pet:SetKeyValue("model", "models/hunter.mdl")
		--pet:SetModel("models/hunter.mdl")
		pet:SetModelScale( pet:GetModelScale() * 0.8, 0 )
		pet:SetKeyValue("spawnflags", "8192")
		pet:SetOwner(owner)
		pet:SetKeyValue("NumGrenades","999999")
		pet:Spawn()
		pet:AddEntityRelationship( owner, D_LI, 99 )
		--pet:Activate()
		pet:SetMaxHealth(140 + (owner:Pet_GetLevel() * 10) )
		pet:SetHealth(140 + (owner:Pet_GetLevel() * 10) )
		pet:SetOwner(owner)
		pet:SetNWString("pet_name", owner:GetNWString("pet_name"))
		pet:SetNWString("Ownerid", owner:SteamID() )
		pet:SetNWBool("pet_checker", true)
		
		if pet:GetClass() == "npc_combine_s" and owner:Pet_GetLevel() < 8 then
			pet:Give("ai_weapon_smg1")
		elseif pet:GetClass() == "npc_combine_s" and owner:Pet_GetLevel() > 7 then
			pet:Give("ai_weapon_ar2")
			pet:SetMaxHealth(140 + (owner:Pet_GetLevel() * 25) )
			pet:SetHealth(140 + (owner:Pet_GetLevel() * 25) )
			pet:SetKeyValue("NumGrenades","5")
		end
		--[[ pet:SetCustomCollisionCheck(true) ]]
		
		pet.owner = owner
		pet.ownerid = owner:SteamID()
		pet.hasowner = true
		owner.pet = pet
		owner.petalive = true
		--pet.follow_on = true
		/*
		owner:SetKeyValue("name", )
		pet.follow = ents.Create("ai_goal_follow")
		pet.follow:SetKeyValue("maximumstate", "2")
		pet.follow:SetKeyValue("formation", "0")
		pet.follow:SetKeyValue("targetentity", "fuck") -- Should follow me
		pet.follow:SetKeyValue("actorstoaffect", "cunt") -- Using the npc I just created 
		pet.follow:SetKeyValue("startactive", "1")
		pet.follow:SetKeyValue("searchtype", "0")
		
		pet.follow:Spawn()
		pet.follow:Activate()
		*/
		
		
		-- print("****")
		-- print("[pet] Created Combine Soldier pet for ".. owner:Nick())
		-- print("****")
		return pet
		end
	end
end

