AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")

local DbgPrint = GetLogging("TDHl2c")

-- ENT["KeyValue"] = ENT["KeyValue"] or {}
ENT["Input"] = {
	["Enable"] = true,
	["Disable"] = true,
	["Kill"] = true,
	-- ["Enable"] = true,
	-- ["Enable"] = true,
	-- ["Enable"] = true,
}
-- ENT["InputCallback"] = {
	-- ["Enable"] = function(self) self["KeyValue"]["StartDisabled"] = "1" end,
	-- ["Disable"] = function(self) end,
	-- ["Kill"] = function(self) end,
-- }

function ENT:KeyValue( key, value )
	if isstring(key) and isstring(value) then
		self[key] = value
	end
end

--This accepts inputs. Prints them to the console and gives our current position (doesn't work with brush entities)
function ENT:AcceptInput(inputName, activator, called, data)
	-- print(inputName)
	-- print(tostring(self.Entity:GetPos()))
	if self["Input"][inputName] then
		if inputName == "Enable" then
			self["StartDisabled"] = "0"
		elseif inputName == "Disable" then
			self["StartDisabled"] = "1"
		elseif inputName == "Kill" then
			SafeRemoveEntity(self)
		end
	end

end
/*
-- Updates the bounds of this collision box
function ENT:SetBounds(min, max)
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionBounds(min, max)
	self:SetTrigger(true)
	self:UseTriggerBounds( true, 24 )
end
*/

function ENT:SpawnFlags(ent)
	if self:HasSpawnFlags(1) and ent:IsPlayer() then return true end
	if self:HasSpawnFlags(2) and ent:IsNPC() then return true end
	
	return false
end

function ENT:Filter(ent)
	if isstring(self:GetTeleportName()) and string.len(self:GetTeleportName()) < 3 then return true end
	if isstring(self:GetTeleportName()) and string.len(self:GetTeleportName()) > 2 then
		if ent:GetName() == self:GetTeleportName() then return true end
	end
	
	if isstring(self:GetTeleportClass()) and string.len(self:GetTeleportClass()) < 3 then return true end
	if isstring(self:GetTeleportClass()) and string.len(self:GetTeleportClass()) > 2 then
		if ent:GetClass() == self:GetTeleportClass() then return true end
	end
	
	return false
end

-- Run when any entity starts touching our trigger
function ENT:Touch(ent)
	if !IsValid(ent) then return end
	-- DbgPrint("Teleported: "..tostring(ent) )
	if self:SpawnFlags(ent) != true then return end
	if self:Filter(ent) != true then return end
	-- if ent and ent:IsPlayer() then print("\nTouched me a Player\n") end
	if ent:IsPlayer() and ent:Team() == TEAM_ALIVE then ent:Kill() end
	if ent:IsNPC() then ent:SetHealth(0) end
	DbgPrint("Killed: "..tostring(ent) )
	
end