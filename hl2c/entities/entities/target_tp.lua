--AddCSLuaFile()
--[[---------------------------------------------------------
   Name: target_tp
   Desc: A point entity which controls the player view.
-----------------------------------------------------------]]


ENT.Type = "point"

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	print("[hl2c] Succesfully Initialized",self:GetClass())
end


--[[---------------------------------------------------------
   Name: AcceptInput
   Desc: Called when received an input.
-----------------------------------------------------------]]
function ENT:AcceptInput(name, activator, caller, data)
	if (name == "teleport" || name == "Teleport") then
		local tele_custom = ents.FindByName(TARGET_TELEPORT_HL2C)
		for _, move_custom in pairs(tele_custom) do
			move_custom:SetPos(self:GetPos())
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
	print("[hl2c] Succesfully Removed",self:GetClass())
	--end
//
end