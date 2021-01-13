-- ID PET_005

function Hl2c.Pet_Fassassin(owner)
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
		else
		local pet = ents.Create("npc_combine_assassin")
		pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		pet:SetKeyValue("targetname", "pet")
		pet:SetModelScale( pet:GetModelScale() * 0.8, 0 )
		pet:Spawn() 
		
		local pet = pet.npc 
		pet.owner = owner
		pet.ownerid = owner:SteamID()
		pet.hasowner = true
		owner.pet = pet
		owner.petalive = true
		pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		pet:SetKeyValue("targetname", "pet")
		pet:SetModelScale( pet:GetModelScale() * 0.8, 0 )
		pet:SetKeyValue("spawnflags", "0")
		pet:SetOwner(owner)
		pet:AddEntityRelationship( owner, D_LI, 99 )
		pet:SetMaxHealth(200 + (owner:Pet_GetLevel() * 10) )
		pet:SetHealth(200 + (owner:Pet_GetLevel() * 10) )
		pet:SetOwner(owner)
		pet:SetNWString("pet_name", owner:GetNWString("pet_name"))
		pet:SetNWString("Ownerid", owner:SteamID() )
		pet:SetNWBool("pet_checker", true)
		pet:SetKeyValue("squadname","player")

		-- pet.owner = owner
		-- pet.ownerid = owner:SteamID()
		-- pet.hasowner = true
		-- owner.pet = pet
		-- owner.petalive = true
		-- pet:SetPos( owner:GetPos() + Vector(0, 0, 50) )
		-- pet:SetKeyValue("targetname", "pet")
		-- pet:SetModelScale( pet:GetModelScale() * 0.8, 0 )
		-- pet:SetKeyValue("spawnflags", "0")
		-- pet:SetOwner(owner)
		-- pet:Spawn()
		-- pet:AddEntityRelationship( owner, D_LI, 99 )
		-- pet:SetMaxHealth(200 + (owner:Pet_GetLevel() * 10) )
		-- pet:SetHealth(200 + (owner:Pet_GetLevel() * 10) )
		-- pet:SetOwner(owner)
		-- pet:SetNWString("pet_name", owner:GetNWString("pet_name"))
		-- pet:SetNWString("Ownerid", owner:SteamID() )
		-- pet:SetNWBool("pet_checker", true)
		
		-- pet.owner = owner
		-- pet.ownerid = owner:SteamID()
		-- pet.hasowner = true
		-- owner.pet = pet
		-- owner.petalive = true
		return pet
		end
	end
end