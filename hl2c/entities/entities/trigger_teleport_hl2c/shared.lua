
ENT.Type = "brush"
ENT.Base = "base_brush"
 
ENT.PrintName		= "trigger_teleport_hl2c"
ENT.Author			= ""
ENT.Contact			= "N/A"
ENT.Purpose			= "Extra Teleport Function"
ENT.Instructions	= "Just on touch teleport caller to the selected position."
ENT.Spawnable = false

local DbgPrint = GetLogging("TTHl2c")

function ENT:Initialize()
	-- print("[trigger_teleport_hl2c] Initialize")
	if SERVER then
		self:SetTrigger(true);
	end
	-- self:SetModel(Model("models/cod4/weapons/claymore/cod4_claymore_planted.mdl"));
	-- self:PhysicsInit(SOLID_OBB);
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(self.min, self.max)
	self:UseTriggerBounds(true)
	self.init = true
	--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
	
	-- local phys = self:GetPhysicsObject();
	-- if (phys:IsValid()) then
		-- phys:Wake();
	-- end
	DbgPrint("Initialized: "..tostring(ent))
end

function ENT:SetupDataTables()

	self:NetworkVar( "Vector", 	0, "TargetPos", 	{ KeyName = "target", 	Edit = { type = "VectorColor", 	order = 4 } } )
	self:NetworkVar( "String", 	0, "TeleportName", 	{ KeyName = "teleportname", 	Edit = { type = "String", 	order = 4 } } ) -- teleportname
	self:NetworkVar( "String", 	0, "TeleportClass", 	{ KeyName = "teleportclass", 	Edit = { type = "String", 	order = 4 } } ) -- teleportclass

end

function ENT:Think()
	if self.init == true then else return end
end