function Hl2c.Pet_Headcrab(owner)
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
		elseif Hl2c.PetType(owner:Pet_GetLevel(),owner) == "rank1"
		then
		local pet = ents.Create("npc_zombie")
		--pet:SetPos(owner:GetPos() + Vector(100, 100, 100))
		--pet:SetPos(owner:GetPos() + Vector(0, 0, 100))
		pet.owner = owner
		pet.ownerid = owner:SteamID()
		pet.hasowner = true
		owner.pet = pet
		owner.petalive = true
		pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		pet:SetKeyValue("targetname", "pet")
		--pet:SetKeyValue("model", "models/hunter.mdl")
		--pet:SetModel("models/hunter.mdl")
		--pet:SetModelScale( pet:GetModelScale() * 0.7, 0 )
		pet:SetKeyValue("spawnflags", "0")
		pet:SetOwner(owner)
		pet:Spawn()
		
		pet:AddEntityRelationship( owner, D_LI, 99 )
		
		--pet:Activate()
		pet:SetMaxHealth(180 + (owner:Pet_GetLevel() * 20))
		pet:SetHealth(180 + (owner:Pet_GetLevel() * 20))
		pet:SetOwner(owner)
		
		pet:SetNWString("pet_name", owner:GetNWString("pet_name") )
		pet:SetNWBool("pet_checker", true)
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
		-- print("[pet] Created Classic Zombie pet for ".. owner:Nick())
		-- print("****")
		return pet
		else
		local pet = ents.Create("npc_headcrab")
		--pet:SetPos(owner:GetPos() + Vector(100, 100, 100))
		--pet:SetPos(owner:GetPos() + Vector(0, 0, 100))
		pet.owner = owner
		pet.ownerid = owner:SteamID()
		pet.hasowner = true
		owner.pet = pet
		owner.petalive = true
		pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		pet:SetKeyValue("targetname", "pet")
		--pet:SetKeyValue("model", "models/hunter.mdl")
		--pet:SetModel("models/hunter.mdl")
		--pet:SetModelScale( pet:GetModelScale() * 0.7, 0 )
		pet:SetKeyValue("spawnflags", "0")
		pet:SetOwner(owner)
		pet:Spawn()
		
		pet:AddEntityRelationship( owner, D_LI, 99 )
		
		--pet:Activate()
		pet:SetMaxHealth(110 + (owner:Pet_GetLevel() * 10))
		pet:SetHealth(110 + (owner:Pet_GetLevel() * 10))
		pet:SetOwner(owner)
		
		pet:SetNWString("pet_name", owner:GetNWString("pet_name") )
		pet:SetNWBool("pet_checker", true)
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
		-- print("[pet] Created Headcrab pet for ".. owner:Nick())
		-- print("****")
		return pet
		end
	end
end

//http://bestmovielines.co/05678e108d77