--AddCSLuaFile()
--[[---------------------------------------------------------
   Name: point_alyx_teleport
   Desc: A point entity which controls the player view.
-----------------------------------------------------------]]


ENT.Type = "point"

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	print("[hl2c] Succesfully Initialized point_alyx_teleport")
end


--[[---------------------------------------------------------
   Name: AcceptInput
   Desc: Called when received an input.
-----------------------------------------------------------]]
function ENT:AcceptInput(name, activator, caller, data)
	if (name == "teleport" || name == "Teleport") then
		local tele_alyx = ents.FindByClass("npc_alyx")
		for _, move_alyx in pairs(tele_alyx) do
			move_alyx:SetPos(self:GetPos())
		end
	end
	
	if (name == "kill" || name == "Kill") then
	if IsValid(self) then
		self:Remove()
	end
	end
end

--[[---------------------------------------------------------
   Name: OnRemove
   Desc: Called just before entity is deleted
-----------------------------------------------------------]]
function ENT:OnRemove()
	--if self.classname != nil then
	print("[hl2c] Succesfully Removed: point_alyx_teleport")
	--end
//
end