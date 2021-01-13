
ENT.Type = "brush"
ENT.Base = "base_brush"
 
ENT.PrintName		= "trigger_mapend_hl2c"
ENT.Author			= ""
ENT.Contact			= "N/A"
ENT.Purpose			= "Extra MapEnd Function"
ENT.Instructions	= "Just on touch map ends"
ENT.Spawnable = false

function ENT:Initialize()
	-- print("[trigger_mapend_hl2c] Initialize")
	if SERVER then
		self:SetTrigger(true);
	end
	-- self:SetModel(Model("models/cod4/weapons/claymore/cod4_claymore_planted.mdl"));
	-- self:PhysicsInit(SOLID_OBB);
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	print(self.min,self.max)
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(self.min, self.max)
	self:UseTriggerBounds(true)
	--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
	
	-- local phys = self:GetPhysicsObject();
	-- if (phys:IsValid()) then
		-- phys:Wake();
	-- end
end