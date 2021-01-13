local meta = FindMetaTable("Entity")
if !meta then return end


function GetByIndex(text)
	for k, v in pairs( ents.GetAll() ) do
		if v:EntIndex() == tonumber(text) then
			return v
		end
	end
	return NULL
end


/*-------------
--
-- Title: Is it a pet?
--
-- Desc: Check if the entity is a pet 
-- then it will return
-- as true else return false.
--
---------------*/
function meta:IsPet()
	if IsValid(self) and 
	self:IsNPC() and 
	self:GetNWBool("pet_checker") == true
	then
		return true
	else
		return false
	end
end
/*-------------
--
-- Title: Is it in Follow?
--
-- Desc: Check if the entity is following 
-- then it will return
-- as true else return false.
--
---------------*/
function meta:Hl2c_IsFollow()
	
	if IsValid(self) and 
	self:IsNPC() and 
	!self:IsPet() and
	self:GetNWBool("npc_following") == true
	then
		return true
	else
		return false
	end
end

function meta:Hl2c_SetFollow(target)
	if !SERVER then return end
	if IsValid(self) and 
	IsValid(target) and 
	target:IsPlayer() and 
	self:IsNPC() and 
	!self:IsPet() --and
	--!self:Hl2c_IsFollow() -- Blocking Stealing
	then
		self:SetNWEntity("npc_follow", NULL)
		self:SetNWBool("npc_following",true)
		self:SetNWEntity("npc_follow", target)
	else
		
	end
end

function meta:Hl2c_StopFollow()
	if !SERVER then return end
	if IsValid(self) and
	self:IsNPC() and 
	!self:IsPet() and
	self:Hl2c_IsFollow()
	then
		self:SetNWBool("npc_following",false)
		self:SetNWEntity("npc_follow", NULL)
	else
		
	end
end

function meta:Hl2c_GetFollowTarget()
	
	if IsValid(self) and
	self:IsNPC() and 
	!self:IsPet() and
	self:Hl2c_IsFollow() and
	IsValid(self:GetNWEntity("npc_follow"))
	then
		return self:GetNWEntity("npc_follow")
	else
		return NULL
	end
end


/*-------------
--
-- Title: Set pet name
--
-- Desc: Change the name of the pet.
-- Also first check if the pet is a pet
-- and check if the argument is a string.
--
---------------*/
function meta:SetPetName(name)
	if self:IsPet() and
	isstring(name)
	then
		
		self:SetNWString("pet_name", name)
	end
end

