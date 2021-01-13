if SERVER then AddCSLuaFile() end

local DbgPrint = GetLogging("sh_entity_extend.lua")
local ENTITY_META = FindMetaTable("Entity")

function ENTITY_META:AddSpawnFlags(flags)

	local newFlags = bit.bor(self:GetSpawnFlags(), flags)
	self:SetKeyValue("spawnflags", newFlags)

end

function ENTITY_META:IsOCMerchantProp()
	-- PrintTable(self["OnPlayerUse"])
	if self["OnPlayerUse"] and self["OnPlayerUse"][1] then return true end
	-- print(false)
	return false

end

function ENTITY_META:RemoveSpawnFlags(flags)

	local newFlags = bit.band(self:GetSpawnFlags(), bit.bnot(flags))
	self:SetKeyValue("spawnflags", newFlags)

end

function ENTITY_META:IsDoor()
	local class = self:GetClass()
	return class == "prop_door_rotating" or class == "func_door" or class == "func_door_rotating"
end

local DOOR_STATE_CLOSED = 0
local DOOR_STATE_OPENING = 1
local DOOR_STATE_OPEN = 2
local DOOR_STATE_CLOSING = 3
local DOOR_STATE_AJAR = 4

function ENTITY_META:GetDoorState()
	return self:GetSaveTable().m_eDoorState
end

function ENTITY_META:IsDoorClosing()
	return self:GetDoorState() == DOOR_STATE_CLOSING
end

function ENTITY_META:IsDoorClosed()
	return self:GetDoorState() == DOOR_STATE_CLOSED
end

function ENTITY_META:IsDoorOpening()
	return self:GetDoorState() == DOOR_STATE_OPENING
end

function ENTITY_META:IsDoorOpen()
	return self:GetDoorState() == DOOR_STATE_OPEN
end

function ENTITY_META:GetDoorBlocker()
	return self:GetSaveTable().m_hBlocker
end

function ENTITY_META:IsDoorLocked()
	return self:GetSaveTable().m_bLocked
end

function ENTITY_META:GetDoorOpenDir()

end