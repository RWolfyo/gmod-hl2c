function Hl2c.PetType(data, owner)
	if isnumber(data) and 
	IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true
	then
		
		if data >= 20 then
			return "rank2"
		elseif data >= 10 then
			return "rank1"
		else
			return "rank0"
		
		end
	
	else
		-- print("****")
		-- print("[pet] Someone tried to summon an unknown pet type")
		-- print("****")
		return false
	end
end

function Hl2c.HasPet(owner)
	if IsValid(owner) and IsValid(owner.pet) and owner.petalive == true
	then
		return true
	end
	
	return false
end

function Hl2c.Pet_GetOwnerYaw(owner)
	local ang = owner:GetAngles()
	local tbl = string.Explode(" ",tostring(ang))
	return tonumber(tbl[2])
end

function Hl2c.PetTeleport(owner)
	if IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true and
	Hl2c.HasPet(owner)
	then
		local ang = owner:GetAngles()
		local tbl = string.Explode(" ",tostring(ang))
		-- print(tbl[2])
		owner.pet:ClearSchedule()
		owner.pet:SetPos(owner:GetPos())
		owner.pet:SetAngles( Angle(0,Hl2c.Pet_GetOwnerYaw(owner),0) )
		owner.pet:ClearSchedule()
		owner.pet:ClearEnemyMemory()
		-- print("****")
		-- print("[pet] Teleported a pet for ".. owner:Nick())
		-- print("****")
	else
		
		-- print("****")
		-- print("[pet] Unknown pet tried to teleport")
		-- print("****")
	end
end

// Pets
include("pets/hunter.lua")
include("pets/combine_s.lua")
include("pets/antlion.lua")
include("pets/headcrab.lua")
include("pets/headcrab_fast.lua")
include("pets/headcrab_black.lua")
include("pets/rollermine.lua")
include("pets/fassassin.lua")

function Hl2c.PetCreate(owner)
	if IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true and
	HL2C_PET_ALLOW == true 
	-- and DEV_MODE == true
	then
		local spawn_pet = NULL
		if owner:GetNWString("pet_id") == "PET_000"
		then
			spawn_pet = Hl2c.Pet_Hunter(owner)
		elseif owner:GetNWString("pet_id") == "PET_001" then
			spawn_pet = Hl2c.Pet_Combine_s(owner)
		elseif owner:GetNWString("pet_id") == "PET_002" then
			spawn_pet = Hl2c.Pet_Antlion(owner)
		elseif owner:GetNWString("pet_id") == "PET_003" then
			spawn_pet = Hl2c.Pet_Headcrab(owner)
		elseif owner:GetNWString("pet_id") == "PET_004" then
			spawn_pet = Hl2c.Pet_Rollermine(owner)
		elseif owner:GetNWString("pet_id") == "PET_005" then
			spawn_pet = Hl2c.Pet_Fassassin(owner)
		elseif owner:GetNWString("pet_id") == "PET_006" then
			spawn_pet = Hl2c.Pet_Headcrab_Fast(owner)
		elseif owner:GetNWString("pet_id") == "PET_007" then
			spawn_pet = Hl2c.Pet_Headcrab_Black(owner)
		end
		
		if Hl2c.HasPet(owner) then
			owner.pet:SetPos(owner:GetPos())
			owner.pet:SetAngles( Angle(0,Hl2c.Pet_GetOwnerYaw(owner),0) )
		else
			
		end
		if IsValid(spawn_pet) and !Hl2c.SpawnedPets(spawn_pet) then
			Hl2c.PETS[#Hl2c.PETS + 1] = spawn_pet
			
			for k, v in pairs(Hl2c.PETS) do
				if !IsValid(v) then
					-- print("True")
					Hl2c.PETS[k] = nil
				end
			end
			-- PrintTable(Hl2c.PETS)
		end
	elseif IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true
	then
		-- owner:PrintMessage(HUD_PRINTTALK, "[pet] Disabled on current map")
		local text = "[pet] Disabled on current map"
		Hl2c.PersonDefaultChatPrint(text,owner)
		-- print("****")
		-- print("[pet] Player tried to spawn pet on a blocked map")
		-- print("****")
	else
		-- print("****")
		-- print("[pet] Unknown pet tried to spawn")
		-- print("****")
	end
end

function Hl2c.SpawnedPets(pet)
	local bool = false
	for k, v in pairs(Hl2c.PETS) do
		if v == pet then
			bool = true
		end
		
	end
	
	return bool
end